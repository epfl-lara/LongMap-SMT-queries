; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3020 () Bool)

(assert start!3020)

(declare-fun b!17937 () Bool)

(declare-fun b_free!637 () Bool)

(declare-fun b_next!637 () Bool)

(assert (=> b!17937 (= b_free!637 (not b_next!637))))

(declare-fun tp!3102 () Bool)

(declare-fun b_and!1279 () Bool)

(assert (=> b!17937 (= tp!3102 b_and!1279)))

(declare-fun b!17928 () Bool)

(declare-datatypes ((V!1027 0))(
  ( (V!1028 (val!477 Int)) )
))
(declare-datatypes ((ValueCell!251 0))(
  ( (ValueCellFull!251 (v!1457 V!1027)) (EmptyCell!251) )
))
(declare-datatypes ((array!989 0))(
  ( (array!990 (arr!476 (Array (_ BitVec 32) ValueCell!251)) (size!566 (_ BitVec 32))) )
))
(declare-datatypes ((array!991 0))(
  ( (array!992 (arr!477 (Array (_ BitVec 32) (_ BitVec 64))) (size!567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!88 0))(
  ( (LongMapFixedSize!89 (defaultEntry!1655 Int) (mask!4584 (_ BitVec 32)) (extraKeys!1568 (_ BitVec 32)) (zeroValue!1591 V!1027) (minValue!1591 V!1027) (_size!76 (_ BitVec 32)) (_keys!3080 array!991) (_values!1652 array!989) (_vacant!76 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!88 0))(
  ( (Cell!89 (v!1458 LongMapFixedSize!88)) )
))
(declare-datatypes ((LongMap!88 0))(
  ( (LongMap!89 (underlying!55 Cell!88)) )
))
(declare-datatypes ((tuple2!778 0))(
  ( (tuple2!779 (_1!390 Bool) (_2!390 LongMap!88)) )
))
(declare-fun e!11430 () tuple2!778)

(declare-fun thiss!848 () LongMap!88)

(assert (=> b!17928 (= e!11430 (tuple2!779 true thiss!848))))

(declare-fun b!17929 () Bool)

(declare-fun repack!22 (LongMap!88) tuple2!778)

(assert (=> b!17929 (= e!11430 (repack!22 thiss!848))))

(declare-fun mapIsEmpty!786 () Bool)

(declare-fun mapRes!786 () Bool)

(assert (=> mapIsEmpty!786 mapRes!786))

(declare-fun b!17930 () Bool)

(declare-fun e!11427 () Bool)

(declare-fun tp_is_empty!901 () Bool)

(assert (=> b!17930 (= e!11427 tp_is_empty!901)))

(declare-fun b!17931 () Bool)

(declare-fun e!11423 () Bool)

(declare-fun e!11429 () Bool)

(assert (=> b!17931 (= e!11423 e!11429)))

(declare-fun res!12673 () Bool)

(assert (=> b!17931 (=> (not res!12673) (not e!11429))))

(declare-fun lt!4649 () tuple2!778)

(assert (=> b!17931 (= res!12673 (not (_1!390 lt!4649)))))

(assert (=> b!17931 (= lt!4649 e!11430)))

(declare-fun c!1790 () Bool)

(declare-fun imbalanced!22 (LongMap!88) Bool)

(assert (=> b!17931 (= c!1790 (imbalanced!22 thiss!848))))

(declare-fun mapNonEmpty!786 () Bool)

(declare-fun tp!3101 () Bool)

(declare-fun e!11426 () Bool)

(assert (=> mapNonEmpty!786 (= mapRes!786 (and tp!3101 e!11426))))

(declare-fun mapRest!786 () (Array (_ BitVec 32) ValueCell!251))

(declare-fun mapValue!786 () ValueCell!251)

(declare-fun mapKey!786 () (_ BitVec 32))

(assert (=> mapNonEmpty!786 (= (arr!476 (_values!1652 (v!1458 (underlying!55 thiss!848)))) (store mapRest!786 mapKey!786 mapValue!786))))

(declare-fun b!17932 () Bool)

(assert (=> b!17932 (= e!11429 false)))

(declare-fun lt!4650 () Bool)

(declare-fun valid!50 (LongMap!88) Bool)

(assert (=> b!17932 (= lt!4650 (valid!50 (_2!390 lt!4649)))))

(declare-fun res!12674 () Bool)

(assert (=> start!3020 (=> (not res!12674) (not e!11423))))

(assert (=> start!3020 (= res!12674 (valid!50 thiss!848))))

(assert (=> start!3020 e!11423))

(declare-fun e!11428 () Bool)

(assert (=> start!3020 e!11428))

(declare-fun b!17933 () Bool)

(declare-fun e!11422 () Bool)

(declare-fun e!11425 () Bool)

(assert (=> b!17933 (= e!11422 e!11425)))

(declare-fun b!17934 () Bool)

(assert (=> b!17934 (= e!11428 e!11422)))

(declare-fun b!17935 () Bool)

(assert (=> b!17935 (= e!11426 tp_is_empty!901)))

(declare-fun b!17936 () Bool)

(declare-fun e!11421 () Bool)

(assert (=> b!17936 (= e!11421 (and e!11427 mapRes!786))))

(declare-fun condMapEmpty!786 () Bool)

(declare-fun mapDefault!786 () ValueCell!251)

(assert (=> b!17936 (= condMapEmpty!786 (= (arr!476 (_values!1652 (v!1458 (underlying!55 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!251)) mapDefault!786)))))

(declare-fun array_inv!339 (array!991) Bool)

(declare-fun array_inv!340 (array!989) Bool)

(assert (=> b!17937 (= e!11425 (and tp!3102 tp_is_empty!901 (array_inv!339 (_keys!3080 (v!1458 (underlying!55 thiss!848)))) (array_inv!340 (_values!1652 (v!1458 (underlying!55 thiss!848)))) e!11421))))

(assert (= (and start!3020 res!12674) b!17931))

(assert (= (and b!17931 c!1790) b!17929))

(assert (= (and b!17931 (not c!1790)) b!17928))

(assert (= (and b!17931 res!12673) b!17932))

(assert (= (and b!17936 condMapEmpty!786) mapIsEmpty!786))

(assert (= (and b!17936 (not condMapEmpty!786)) mapNonEmpty!786))

(get-info :version)

(assert (= (and mapNonEmpty!786 ((_ is ValueCellFull!251) mapValue!786)) b!17935))

(assert (= (and b!17936 ((_ is ValueCellFull!251) mapDefault!786)) b!17930))

(assert (= b!17937 b!17936))

(assert (= b!17933 b!17937))

(assert (= b!17934 b!17933))

(assert (= start!3020 b!17934))

(declare-fun m!12493 () Bool)

(assert (=> start!3020 m!12493))

(declare-fun m!12495 () Bool)

(assert (=> b!17937 m!12495))

(declare-fun m!12497 () Bool)

(assert (=> b!17937 m!12497))

(declare-fun m!12499 () Bool)

(assert (=> mapNonEmpty!786 m!12499))

(declare-fun m!12501 () Bool)

(assert (=> b!17931 m!12501))

(declare-fun m!12503 () Bool)

(assert (=> b!17929 m!12503))

(declare-fun m!12505 () Bool)

(assert (=> b!17932 m!12505))

(check-sat tp_is_empty!901 (not b!17932) (not b!17937) b_and!1279 (not start!3020) (not mapNonEmpty!786) (not b_next!637) (not b!17929) (not b!17931))
(check-sat b_and!1279 (not b_next!637))
