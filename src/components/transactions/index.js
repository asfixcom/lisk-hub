import { connect } from 'react-redux';
import { translate } from 'react-i18next';
import { transactionsRequested, transactionsReset } from '../../actions/transactions';
import Transactions from './transactions';

const mapStateToProps = state => ({
  balance: state.account.balance,
  address: state.account.address,
  activePeer: state.peers.data,
  transactions: [...state.transactions.pending, ...state.transactions.confirmed],
  count: state.transactions.count,
  confirmedCount: state.transactions.confirmed.length,
  pendingCount: state.transactions.pending.length,
  confirmed: state.transactions.confirmed,
  pending: state.transactions.pending,
});

const mapDispatchToProps = dispatch => ({
  transactionsRequested: data => dispatch(transactionsRequested(data)),
  transactionsReset: data => dispatch(transactionsReset(data)),
});

export default connect(mapStateToProps, mapDispatchToProps)(translate()(Transactions));
