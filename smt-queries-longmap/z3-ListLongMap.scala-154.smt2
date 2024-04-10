; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2996 () Bool)

(assert start!2996)

(declare-fun b!17480 () Bool)

(declare-fun b_free!603 () Bool)

(declare-fun b_next!603 () Bool)

(assert (=> b!17480 (= b_free!603 (not b_next!603))))

(declare-fun tp!2999 () Bool)

(declare-fun b_and!1251 () Bool)

(assert (=> b!17480 (= tp!2999 b_and!1251)))

(declare-fun b!17470 () Bool)

(declare-fun e!10963 () Bool)

(assert (=> b!17470 (= e!10963 false)))

(declare-fun lt!4543 () Bool)

(declare-datatypes ((V!981 0))(
  ( (V!982 (val!460 Int)) )
))
(declare-datatypes ((ValueCell!234 0))(
  ( (ValueCellFull!234 (v!1424 V!981)) (EmptyCell!234) )
))
(declare-datatypes ((array!939 0))(
  ( (array!940 (arr!451 (Array (_ BitVec 32) ValueCell!234)) (size!541 (_ BitVec 32))) )
))
(declare-datatypes ((array!941 0))(
  ( (array!942 (arr!452 (Array (_ BitVec 32) (_ BitVec 64))) (size!542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!54 0))(
  ( (LongMapFixedSize!55 (defaultEntry!1638 Int) (mask!4555 (_ BitVec 32)) (extraKeys!1551 (_ BitVec 32)) (zeroValue!1574 V!981) (minValue!1574 V!981) (_size!59 (_ BitVec 32)) (_keys!3063 array!941) (_values!1635 array!939) (_vacant!59 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!54 0))(
  ( (Cell!55 (v!1425 LongMapFixedSize!54)) )
))
(declare-datatypes ((LongMap!54 0))(
  ( (LongMap!55 (underlying!38 Cell!54)) )
))
(declare-fun lt!4544 () LongMap!54)

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!736 0))(
  ( (tuple2!737 (_1!369 (_ BitVec 64)) (_2!369 V!981)) )
))
(declare-datatypes ((List!537 0))(
  ( (Nil!534) (Cons!533 (h!1099 tuple2!736) (t!3176 List!537)) )
))
(declare-datatypes ((ListLongMap!533 0))(
  ( (ListLongMap!534 (toList!282 List!537)) )
))
(declare-fun contains!214 (ListLongMap!533 (_ BitVec 64)) Bool)

(declare-fun map!337 (LongMap!54) ListLongMap!533)

(assert (=> b!17470 (= lt!4543 (contains!214 (map!337 lt!4544) key!682))))

(declare-fun b!17471 () Bool)

(declare-datatypes ((tuple2!738 0))(
  ( (tuple2!739 (_1!370 Bool) (_2!370 LongMap!54)) )
))
(declare-fun e!10959 () tuple2!738)

(declare-fun thiss!848 () LongMap!54)

(declare-fun repack!8 (LongMap!54) tuple2!738)

(assert (=> b!17471 (= e!10959 (repack!8 thiss!848))))

(declare-fun mapIsEmpty!735 () Bool)

(declare-fun mapRes!735 () Bool)

(assert (=> mapIsEmpty!735 mapRes!735))

(declare-fun b!17472 () Bool)

(declare-fun res!12598 () Bool)

(assert (=> b!17472 (=> (not res!12598) (not e!10963))))

(declare-datatypes ((tuple2!740 0))(
  ( (tuple2!741 (_1!371 Bool) (_2!371 LongMapFixedSize!54)) )
))
(declare-fun lt!4546 () tuple2!740)

(assert (=> b!17472 (= res!12598 (_1!371 lt!4546))))

(declare-fun res!12596 () Bool)

(declare-fun e!10962 () Bool)

(assert (=> start!2996 (=> (not res!12596) (not e!10962))))

(declare-fun valid!28 (LongMap!54) Bool)

(assert (=> start!2996 (= res!12596 (valid!28 thiss!848))))

(assert (=> start!2996 e!10962))

(declare-fun e!10961 () Bool)

(assert (=> start!2996 e!10961))

(assert (=> start!2996 true))

(declare-fun tp_is_empty!867 () Bool)

(assert (=> start!2996 tp_is_empty!867))

(declare-fun b!17473 () Bool)

(assert (=> b!17473 (= e!10959 (tuple2!739 true thiss!848))))

(declare-fun b!17474 () Bool)

(declare-fun e!10956 () Bool)

(assert (=> b!17474 (= e!10956 tp_is_empty!867)))

(declare-fun b!17475 () Bool)

(declare-fun e!10954 () Bool)

(assert (=> b!17475 (= e!10954 e!10963)))

(declare-fun res!12595 () Bool)

(assert (=> b!17475 (=> (not res!12595) (not e!10963))))

(assert (=> b!17475 (= res!12595 (valid!28 lt!4544))))

(assert (=> b!17475 (= lt!4544 (LongMap!55 (Cell!55 (_2!371 lt!4546))))))

(declare-fun lt!4545 () tuple2!738)

(declare-fun v!259 () V!981)

(declare-fun update!8 (LongMapFixedSize!54 (_ BitVec 64) V!981) tuple2!740)

(assert (=> b!17475 (= lt!4546 (update!8 (v!1425 (underlying!38 (_2!370 lt!4545))) key!682 v!259))))

(declare-fun b!17476 () Bool)

(declare-fun e!10960 () Bool)

(assert (=> b!17476 (= e!10961 e!10960)))

(declare-fun b!17477 () Bool)

(declare-fun e!10957 () Bool)

(declare-fun e!10958 () Bool)

(assert (=> b!17477 (= e!10957 (and e!10958 mapRes!735))))

(declare-fun condMapEmpty!735 () Bool)

(declare-fun mapDefault!735 () ValueCell!234)

(assert (=> b!17477 (= condMapEmpty!735 (= (arr!451 (_values!1635 (v!1425 (underlying!38 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!234)) mapDefault!735)))))

(declare-fun mapNonEmpty!735 () Bool)

(declare-fun tp!3000 () Bool)

(assert (=> mapNonEmpty!735 (= mapRes!735 (and tp!3000 e!10956))))

(declare-fun mapValue!735 () ValueCell!234)

(declare-fun mapRest!735 () (Array (_ BitVec 32) ValueCell!234))

(declare-fun mapKey!735 () (_ BitVec 32))

(assert (=> mapNonEmpty!735 (= (arr!451 (_values!1635 (v!1425 (underlying!38 thiss!848)))) (store mapRest!735 mapKey!735 mapValue!735))))

(declare-fun b!17478 () Bool)

(assert (=> b!17478 (= e!10962 e!10954)))

(declare-fun res!12597 () Bool)

(assert (=> b!17478 (=> (not res!12597) (not e!10954))))

(assert (=> b!17478 (= res!12597 (_1!370 lt!4545))))

(assert (=> b!17478 (= lt!4545 e!10959)))

(declare-fun c!1753 () Bool)

(declare-fun imbalanced!11 (LongMap!54) Bool)

(assert (=> b!17478 (= c!1753 (imbalanced!11 thiss!848))))

(declare-fun b!17479 () Bool)

(assert (=> b!17479 (= e!10958 tp_is_empty!867)))

(declare-fun e!10953 () Bool)

(declare-fun array_inv!313 (array!941) Bool)

(declare-fun array_inv!314 (array!939) Bool)

(assert (=> b!17480 (= e!10953 (and tp!2999 tp_is_empty!867 (array_inv!313 (_keys!3063 (v!1425 (underlying!38 thiss!848)))) (array_inv!314 (_values!1635 (v!1425 (underlying!38 thiss!848)))) e!10957))))

(declare-fun b!17481 () Bool)

(assert (=> b!17481 (= e!10960 e!10953)))

(assert (= (and start!2996 res!12596) b!17478))

(assert (= (and b!17478 c!1753) b!17471))

(assert (= (and b!17478 (not c!1753)) b!17473))

(assert (= (and b!17478 res!12597) b!17475))

(assert (= (and b!17475 res!12595) b!17472))

(assert (= (and b!17472 res!12598) b!17470))

(assert (= (and b!17477 condMapEmpty!735) mapIsEmpty!735))

(assert (= (and b!17477 (not condMapEmpty!735)) mapNonEmpty!735))

(get-info :version)

(assert (= (and mapNonEmpty!735 ((_ is ValueCellFull!234) mapValue!735)) b!17474))

(assert (= (and b!17477 ((_ is ValueCellFull!234) mapDefault!735)) b!17479))

(assert (= b!17480 b!17477))

(assert (= b!17481 b!17480))

(assert (= b!17476 b!17481))

(assert (= start!2996 b!17476))

(declare-fun m!12293 () Bool)

(assert (=> b!17470 m!12293))

(assert (=> b!17470 m!12293))

(declare-fun m!12295 () Bool)

(assert (=> b!17470 m!12295))

(declare-fun m!12297 () Bool)

(assert (=> b!17480 m!12297))

(declare-fun m!12299 () Bool)

(assert (=> b!17480 m!12299))

(declare-fun m!12301 () Bool)

(assert (=> mapNonEmpty!735 m!12301))

(declare-fun m!12303 () Bool)

(assert (=> b!17475 m!12303))

(declare-fun m!12305 () Bool)

(assert (=> b!17475 m!12305))

(declare-fun m!12307 () Bool)

(assert (=> b!17478 m!12307))

(declare-fun m!12309 () Bool)

(assert (=> start!2996 m!12309))

(declare-fun m!12311 () Bool)

(assert (=> b!17471 m!12311))

(check-sat (not b!17478) (not b!17471) b_and!1251 (not b!17475) tp_is_empty!867 (not b!17480) (not b!17470) (not b_next!603) (not mapNonEmpty!735) (not start!2996))
(check-sat b_and!1251 (not b_next!603))
