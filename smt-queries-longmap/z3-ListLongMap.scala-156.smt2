; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2996 () Bool)

(assert start!2996)

(declare-fun b!17577 () Bool)

(declare-fun b_free!613 () Bool)

(declare-fun b_next!613 () Bool)

(assert (=> b!17577 (= b_free!613 (not b_next!613))))

(declare-fun tp!3029 () Bool)

(declare-fun b_and!1255 () Bool)

(assert (=> b!17577 (= tp!3029 b_and!1255)))

(declare-fun b!17568 () Bool)

(declare-fun e!11063 () Bool)

(declare-fun e!11066 () Bool)

(assert (=> b!17568 (= e!11063 e!11066)))

(declare-fun res!12601 () Bool)

(assert (=> b!17568 (=> (not res!12601) (not e!11066))))

(declare-datatypes ((V!995 0))(
  ( (V!996 (val!465 Int)) )
))
(declare-datatypes ((ValueCell!239 0))(
  ( (ValueCellFull!239 (v!1433 V!995)) (EmptyCell!239) )
))
(declare-datatypes ((array!941 0))(
  ( (array!942 (arr!452 (Array (_ BitVec 32) ValueCell!239)) (size!542 (_ BitVec 32))) )
))
(declare-datatypes ((array!943 0))(
  ( (array!944 (arr!453 (Array (_ BitVec 32) (_ BitVec 64))) (size!543 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!64 0))(
  ( (LongMapFixedSize!65 (defaultEntry!1643 Int) (mask!4564 (_ BitVec 32)) (extraKeys!1556 (_ BitVec 32)) (zeroValue!1579 V!995) (minValue!1579 V!995) (_size!64 (_ BitVec 32)) (_keys!3068 array!943) (_values!1640 array!941) (_vacant!64 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!64 0))(
  ( (Cell!65 (v!1434 LongMapFixedSize!64)) )
))
(declare-datatypes ((LongMap!64 0))(
  ( (LongMap!65 (underlying!43 Cell!64)) )
))
(declare-datatypes ((tuple2!752 0))(
  ( (tuple2!753 (_1!377 Bool) (_2!377 LongMap!64)) )
))
(declare-fun lt!4577 () tuple2!752)

(assert (=> b!17568 (= res!12601 (_1!377 lt!4577))))

(declare-fun e!11068 () tuple2!752)

(assert (=> b!17568 (= lt!4577 e!11068)))

(declare-fun c!1754 () Bool)

(declare-fun thiss!848 () LongMap!64)

(declare-fun imbalanced!13 (LongMap!64) Bool)

(assert (=> b!17568 (= c!1754 (imbalanced!13 thiss!848))))

(declare-fun b!17569 () Bool)

(declare-fun e!11065 () Bool)

(declare-fun e!11070 () Bool)

(assert (=> b!17569 (= e!11065 e!11070)))

(declare-fun b!17570 () Bool)

(assert (=> b!17570 (= e!11066 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4578 () Bool)

(declare-fun v!259 () V!995)

(declare-fun valid!39 (LongMap!64) Bool)

(declare-datatypes ((tuple2!754 0))(
  ( (tuple2!755 (_1!378 Bool) (_2!378 LongMapFixedSize!64)) )
))
(declare-fun update!11 (LongMapFixedSize!64 (_ BitVec 64) V!995) tuple2!754)

(assert (=> b!17570 (= lt!4578 (valid!39 (LongMap!65 (Cell!65 (_2!378 (update!11 (v!1434 (underlying!43 (_2!377 lt!4577))) key!682 v!259))))))))

(declare-fun b!17571 () Bool)

(declare-fun e!11062 () Bool)

(assert (=> b!17571 (= e!11070 e!11062)))

(declare-fun b!17573 () Bool)

(assert (=> b!17573 (= e!11068 (tuple2!753 true thiss!848))))

(declare-fun mapIsEmpty!750 () Bool)

(declare-fun mapRes!750 () Bool)

(assert (=> mapIsEmpty!750 mapRes!750))

(declare-fun b!17574 () Bool)

(declare-fun e!11067 () Bool)

(declare-fun tp_is_empty!877 () Bool)

(assert (=> b!17574 (= e!11067 tp_is_empty!877)))

(declare-fun b!17575 () Bool)

(declare-fun e!11069 () Bool)

(assert (=> b!17575 (= e!11069 tp_is_empty!877)))

(declare-fun b!17576 () Bool)

(declare-fun repack!12 (LongMap!64) tuple2!752)

(assert (=> b!17576 (= e!11068 (repack!12 thiss!848))))

(declare-fun res!12602 () Bool)

(assert (=> start!2996 (=> (not res!12602) (not e!11063))))

(assert (=> start!2996 (= res!12602 (valid!39 thiss!848))))

(assert (=> start!2996 e!11063))

(assert (=> start!2996 e!11065))

(assert (=> start!2996 true))

(assert (=> start!2996 tp_is_empty!877))

(declare-fun b!17572 () Bool)

(declare-fun e!11064 () Bool)

(assert (=> b!17572 (= e!11064 (and e!11069 mapRes!750))))

(declare-fun condMapEmpty!750 () Bool)

(declare-fun mapDefault!750 () ValueCell!239)

(assert (=> b!17572 (= condMapEmpty!750 (= (arr!452 (_values!1640 (v!1434 (underlying!43 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!239)) mapDefault!750)))))

(declare-fun mapNonEmpty!750 () Bool)

(declare-fun tp!3030 () Bool)

(assert (=> mapNonEmpty!750 (= mapRes!750 (and tp!3030 e!11067))))

(declare-fun mapValue!750 () ValueCell!239)

(declare-fun mapKey!750 () (_ BitVec 32))

(declare-fun mapRest!750 () (Array (_ BitVec 32) ValueCell!239))

(assert (=> mapNonEmpty!750 (= (arr!452 (_values!1640 (v!1434 (underlying!43 thiss!848)))) (store mapRest!750 mapKey!750 mapValue!750))))

(declare-fun array_inv!327 (array!943) Bool)

(declare-fun array_inv!328 (array!941) Bool)

(assert (=> b!17577 (= e!11062 (and tp!3029 tp_is_empty!877 (array_inv!327 (_keys!3068 (v!1434 (underlying!43 thiss!848)))) (array_inv!328 (_values!1640 (v!1434 (underlying!43 thiss!848)))) e!11064))))

(assert (= (and start!2996 res!12602) b!17568))

(assert (= (and b!17568 c!1754) b!17576))

(assert (= (and b!17568 (not c!1754)) b!17573))

(assert (= (and b!17568 res!12601) b!17570))

(assert (= (and b!17572 condMapEmpty!750) mapIsEmpty!750))

(assert (= (and b!17572 (not condMapEmpty!750)) mapNonEmpty!750))

(get-info :version)

(assert (= (and mapNonEmpty!750 ((_ is ValueCellFull!239) mapValue!750)) b!17574))

(assert (= (and b!17572 ((_ is ValueCellFull!239) mapDefault!750)) b!17575))

(assert (= b!17577 b!17572))

(assert (= b!17571 b!17577))

(assert (= b!17569 b!17571))

(assert (= start!2996 b!17569))

(declare-fun m!12319 () Bool)

(assert (=> start!2996 m!12319))

(declare-fun m!12321 () Bool)

(assert (=> b!17568 m!12321))

(declare-fun m!12323 () Bool)

(assert (=> b!17577 m!12323))

(declare-fun m!12325 () Bool)

(assert (=> b!17577 m!12325))

(declare-fun m!12327 () Bool)

(assert (=> b!17570 m!12327))

(declare-fun m!12329 () Bool)

(assert (=> b!17570 m!12329))

(declare-fun m!12331 () Bool)

(assert (=> b!17576 m!12331))

(declare-fun m!12333 () Bool)

(assert (=> mapNonEmpty!750 m!12333))

(check-sat (not b!17577) (not b_next!613) (not b!17570) tp_is_empty!877 (not b!17576) (not b!17568) (not mapNonEmpty!750) b_and!1255 (not start!2996))
(check-sat b_and!1255 (not b_next!613))
