; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3002 () Bool)

(assert start!3002)

(declare-fun b!17589 () Bool)

(declare-fun b_free!613 () Bool)

(declare-fun b_next!613 () Bool)

(assert (=> b!17589 (= b_free!613 (not b_next!613))))

(declare-fun tp!3029 () Bool)

(declare-fun b_and!1255 () Bool)

(assert (=> b!17589 (= tp!3029 b_and!1255)))

(declare-fun b!17586 () Bool)

(declare-fun e!11083 () Bool)

(declare-fun e!11081 () Bool)

(assert (=> b!17586 (= e!11083 e!11081)))

(declare-fun b!17587 () Bool)

(declare-fun e!11082 () Bool)

(assert (=> b!17587 (= e!11082 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4582 () Bool)

(declare-datatypes ((V!995 0))(
  ( (V!996 (val!465 Int)) )
))
(declare-datatypes ((ValueCell!239 0))(
  ( (ValueCellFull!239 (v!1434 V!995)) (EmptyCell!239) )
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
  ( (Cell!65 (v!1435 LongMapFixedSize!64)) )
))
(declare-datatypes ((LongMap!64 0))(
  ( (LongMap!65 (underlying!43 Cell!64)) )
))
(declare-datatypes ((tuple2!752 0))(
  ( (tuple2!753 (_1!377 Bool) (_2!377 LongMap!64)) )
))
(declare-fun lt!4581 () tuple2!752)

(declare-fun v!259 () V!995)

(declare-fun valid!39 (LongMap!64) Bool)

(declare-datatypes ((tuple2!754 0))(
  ( (tuple2!755 (_1!378 Bool) (_2!378 LongMapFixedSize!64)) )
))
(declare-fun update!10 (LongMapFixedSize!64 (_ BitVec 64) V!995) tuple2!754)

(assert (=> b!17587 (= lt!4582 (valid!39 (LongMap!65 (Cell!65 (_2!378 (update!10 (v!1435 (underlying!43 (_2!377 lt!4581))) key!682 v!259))))))))

(declare-fun res!12612 () Bool)

(declare-fun e!11079 () Bool)

(assert (=> start!3002 (=> (not res!12612) (not e!11079))))

(declare-fun thiss!848 () LongMap!64)

(assert (=> start!3002 (= res!12612 (valid!39 thiss!848))))

(assert (=> start!3002 e!11079))

(declare-fun e!11084 () Bool)

(assert (=> start!3002 e!11084))

(assert (=> start!3002 true))

(declare-fun tp_is_empty!877 () Bool)

(assert (=> start!3002 tp_is_empty!877))

(declare-fun b!17588 () Bool)

(declare-fun e!11080 () Bool)

(assert (=> b!17588 (= e!11080 tp_is_empty!877)))

(declare-fun e!11075 () Bool)

(declare-fun array_inv!323 (array!943) Bool)

(declare-fun array_inv!324 (array!941) Bool)

(assert (=> b!17589 (= e!11081 (and tp!3029 tp_is_empty!877 (array_inv!323 (_keys!3068 (v!1435 (underlying!43 thiss!848)))) (array_inv!324 (_values!1640 (v!1435 (underlying!43 thiss!848)))) e!11075))))

(declare-fun mapNonEmpty!750 () Bool)

(declare-fun mapRes!750 () Bool)

(declare-fun tp!3030 () Bool)

(declare-fun e!11078 () Bool)

(assert (=> mapNonEmpty!750 (= mapRes!750 (and tp!3030 e!11078))))

(declare-fun mapKey!750 () (_ BitVec 32))

(declare-fun mapRest!750 () (Array (_ BitVec 32) ValueCell!239))

(declare-fun mapValue!750 () ValueCell!239)

(assert (=> mapNonEmpty!750 (= (arr!452 (_values!1640 (v!1435 (underlying!43 thiss!848)))) (store mapRest!750 mapKey!750 mapValue!750))))

(declare-fun b!17590 () Bool)

(assert (=> b!17590 (= e!11084 e!11083)))

(declare-fun b!17591 () Bool)

(assert (=> b!17591 (= e!11075 (and e!11080 mapRes!750))))

(declare-fun condMapEmpty!750 () Bool)

(declare-fun mapDefault!750 () ValueCell!239)

(assert (=> b!17591 (= condMapEmpty!750 (= (arr!452 (_values!1640 (v!1435 (underlying!43 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!239)) mapDefault!750)))))

(declare-fun b!17592 () Bool)

(declare-fun e!11077 () tuple2!752)

(declare-fun repack!11 (LongMap!64) tuple2!752)

(assert (=> b!17592 (= e!11077 (repack!11 thiss!848))))

(declare-fun mapIsEmpty!750 () Bool)

(assert (=> mapIsEmpty!750 mapRes!750))

(declare-fun b!17593 () Bool)

(assert (=> b!17593 (= e!11077 (tuple2!753 true thiss!848))))

(declare-fun b!17594 () Bool)

(assert (=> b!17594 (= e!11079 e!11082)))

(declare-fun res!12611 () Bool)

(assert (=> b!17594 (=> (not res!12611) (not e!11082))))

(assert (=> b!17594 (= res!12611 (_1!377 lt!4581))))

(assert (=> b!17594 (= lt!4581 e!11077)))

(declare-fun c!1758 () Bool)

(declare-fun imbalanced!14 (LongMap!64) Bool)

(assert (=> b!17594 (= c!1758 (imbalanced!14 thiss!848))))

(declare-fun b!17595 () Bool)

(assert (=> b!17595 (= e!11078 tp_is_empty!877)))

(assert (= (and start!3002 res!12612) b!17594))

(assert (= (and b!17594 c!1758) b!17592))

(assert (= (and b!17594 (not c!1758)) b!17593))

(assert (= (and b!17594 res!12611) b!17587))

(assert (= (and b!17591 condMapEmpty!750) mapIsEmpty!750))

(assert (= (and b!17591 (not condMapEmpty!750)) mapNonEmpty!750))

(get-info :version)

(assert (= (and mapNonEmpty!750 ((_ is ValueCellFull!239) mapValue!750)) b!17595))

(assert (= (and b!17591 ((_ is ValueCellFull!239) mapDefault!750)) b!17588))

(assert (= b!17589 b!17591))

(assert (= b!17586 b!17589))

(assert (= b!17590 b!17586))

(assert (= start!3002 b!17590))

(declare-fun m!12333 () Bool)

(assert (=> start!3002 m!12333))

(declare-fun m!12335 () Bool)

(assert (=> mapNonEmpty!750 m!12335))

(declare-fun m!12337 () Bool)

(assert (=> b!17592 m!12337))

(declare-fun m!12339 () Bool)

(assert (=> b!17594 m!12339))

(declare-fun m!12341 () Bool)

(assert (=> b!17587 m!12341))

(declare-fun m!12343 () Bool)

(assert (=> b!17587 m!12343))

(declare-fun m!12345 () Bool)

(assert (=> b!17589 m!12345))

(declare-fun m!12347 () Bool)

(assert (=> b!17589 m!12347))

(check-sat (not b!17592) (not b!17589) tp_is_empty!877 (not start!3002) (not b!17594) (not b!17587) b_and!1255 (not b_next!613) (not mapNonEmpty!750))
(check-sat b_and!1255 (not b_next!613))
