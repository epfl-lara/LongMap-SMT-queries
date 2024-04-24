; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3026 () Bool)

(assert start!3026)

(declare-fun b!17953 () Bool)

(declare-fun b_free!637 () Bool)

(declare-fun b_next!637 () Bool)

(assert (=> b!17953 (= b_free!637 (not b_next!637))))

(declare-fun tp!3101 () Bool)

(declare-fun b_and!1279 () Bool)

(assert (=> b!17953 (= tp!3101 b_and!1279)))

(declare-fun b!17946 () Bool)

(declare-fun e!11436 () Bool)

(assert (=> b!17946 (= e!11436 false)))

(declare-fun lt!4653 () Bool)

(declare-datatypes ((V!1027 0))(
  ( (V!1028 (val!477 Int)) )
))
(declare-datatypes ((ValueCell!251 0))(
  ( (ValueCellFull!251 (v!1458 V!1027)) (EmptyCell!251) )
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
  ( (Cell!89 (v!1459 LongMapFixedSize!88)) )
))
(declare-datatypes ((LongMap!88 0))(
  ( (LongMap!89 (underlying!55 Cell!88)) )
))
(declare-datatypes ((tuple2!778 0))(
  ( (tuple2!779 (_1!390 Bool) (_2!390 LongMap!88)) )
))
(declare-fun lt!4654 () tuple2!778)

(declare-fun valid!49 (LongMap!88) Bool)

(assert (=> b!17946 (= lt!4653 (valid!49 (_2!390 lt!4654)))))

(declare-fun res!12683 () Bool)

(declare-fun e!11444 () Bool)

(assert (=> start!3026 (=> (not res!12683) (not e!11444))))

(declare-fun thiss!848 () LongMap!88)

(assert (=> start!3026 (= res!12683 (valid!49 thiss!848))))

(assert (=> start!3026 e!11444))

(declare-fun e!11440 () Bool)

(assert (=> start!3026 e!11440))

(declare-fun b!17947 () Bool)

(declare-fun e!11441 () Bool)

(declare-fun tp_is_empty!901 () Bool)

(assert (=> b!17947 (= e!11441 tp_is_empty!901)))

(declare-fun mapIsEmpty!786 () Bool)

(declare-fun mapRes!786 () Bool)

(assert (=> mapIsEmpty!786 mapRes!786))

(declare-fun b!17948 () Bool)

(declare-fun e!11443 () Bool)

(declare-fun e!11439 () Bool)

(assert (=> b!17948 (= e!11443 (and e!11439 mapRes!786))))

(declare-fun condMapEmpty!786 () Bool)

(declare-fun mapDefault!786 () ValueCell!251)

(assert (=> b!17948 (= condMapEmpty!786 (= (arr!476 (_values!1652 (v!1459 (underlying!55 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!251)) mapDefault!786)))))

(declare-fun b!17949 () Bool)

(declare-fun e!11438 () Bool)

(declare-fun e!11437 () Bool)

(assert (=> b!17949 (= e!11438 e!11437)))

(declare-fun mapNonEmpty!786 () Bool)

(declare-fun tp!3102 () Bool)

(assert (=> mapNonEmpty!786 (= mapRes!786 (and tp!3102 e!11441))))

(declare-fun mapRest!786 () (Array (_ BitVec 32) ValueCell!251))

(declare-fun mapKey!786 () (_ BitVec 32))

(declare-fun mapValue!786 () ValueCell!251)

(assert (=> mapNonEmpty!786 (= (arr!476 (_values!1652 (v!1459 (underlying!55 thiss!848)))) (store mapRest!786 mapKey!786 mapValue!786))))

(declare-fun b!17950 () Bool)

(declare-fun e!11435 () tuple2!778)

(declare-fun repack!19 (LongMap!88) tuple2!778)

(assert (=> b!17950 (= e!11435 (repack!19 thiss!848))))

(declare-fun b!17951 () Bool)

(assert (=> b!17951 (= e!11435 (tuple2!779 true thiss!848))))

(declare-fun b!17952 () Bool)

(assert (=> b!17952 (= e!11444 e!11436)))

(declare-fun res!12684 () Bool)

(assert (=> b!17952 (=> (not res!12684) (not e!11436))))

(assert (=> b!17952 (= res!12684 (not (_1!390 lt!4654)))))

(assert (=> b!17952 (= lt!4654 e!11435)))

(declare-fun c!1794 () Bool)

(declare-fun imbalanced!23 (LongMap!88) Bool)

(assert (=> b!17952 (= c!1794 (imbalanced!23 thiss!848))))

(declare-fun array_inv!343 (array!991) Bool)

(declare-fun array_inv!344 (array!989) Bool)

(assert (=> b!17953 (= e!11437 (and tp!3101 tp_is_empty!901 (array_inv!343 (_keys!3080 (v!1459 (underlying!55 thiss!848)))) (array_inv!344 (_values!1652 (v!1459 (underlying!55 thiss!848)))) e!11443))))

(declare-fun b!17954 () Bool)

(assert (=> b!17954 (= e!11440 e!11438)))

(declare-fun b!17955 () Bool)

(assert (=> b!17955 (= e!11439 tp_is_empty!901)))

(assert (= (and start!3026 res!12683) b!17952))

(assert (= (and b!17952 c!1794) b!17950))

(assert (= (and b!17952 (not c!1794)) b!17951))

(assert (= (and b!17952 res!12684) b!17946))

(assert (= (and b!17948 condMapEmpty!786) mapIsEmpty!786))

(assert (= (and b!17948 (not condMapEmpty!786)) mapNonEmpty!786))

(get-info :version)

(assert (= (and mapNonEmpty!786 ((_ is ValueCellFull!251) mapValue!786)) b!17947))

(assert (= (and b!17948 ((_ is ValueCellFull!251) mapDefault!786)) b!17955))

(assert (= b!17953 b!17948))

(assert (= b!17949 b!17953))

(assert (= b!17954 b!17949))

(assert (= start!3026 b!17954))

(declare-fun m!12507 () Bool)

(assert (=> b!17950 m!12507))

(declare-fun m!12509 () Bool)

(assert (=> b!17953 m!12509))

(declare-fun m!12511 () Bool)

(assert (=> b!17953 m!12511))

(declare-fun m!12513 () Bool)

(assert (=> b!17952 m!12513))

(declare-fun m!12515 () Bool)

(assert (=> mapNonEmpty!786 m!12515))

(declare-fun m!12517 () Bool)

(assert (=> b!17946 m!12517))

(declare-fun m!12519 () Bool)

(assert (=> start!3026 m!12519))

(check-sat (not mapNonEmpty!786) (not b!17950) (not b!17952) (not b_next!637) b_and!1279 (not b!17953) (not start!3026) tp_is_empty!901 (not b!17946))
(check-sat b_and!1279 (not b_next!637))
