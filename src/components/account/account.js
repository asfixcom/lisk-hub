import React from 'react';
import { FontIcon } from '../fontIcon';
import networks from '../../constants/networks';
import styles from './account.css';

/**
 * Contains some of the important and basic information about the account
 *
 * @param {object} props - include properties of component
 */

const Account = ({ peers, t }) => {
  const status = (peers.status && peers.status.online) ?
    <FontIcon className='online' value='checkmark' /> :
    <FontIcon className='offline' value='error' />;

  return ((peers.data &&
      peers.options.code !== networks.mainnet.code) ?
    <section className={styles.peer}>
      <div className={`${styles.title} inner primary peer-network`}>{t(peers.options.name)} <span id="accountStatus" className={`${styles.status} status`}>{status}</span>
      </div>

      <span className={`${styles.current} inner secondary peer`}>
        {peers.data.currentNode}
      </span>
    </section> :
    null
  );
};

export default Account;
