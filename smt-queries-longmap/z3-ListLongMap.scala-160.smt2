; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3032 () Bool)

(assert start!3032)

(declare-fun b!18025 () Bool)

(declare-fun b_free!639 () Bool)

(declare-fun b_next!639 () Bool)

(assert (=> b!18025 (= b_free!639 (not b_next!639))))

(declare-fun tp!3107 () Bool)

(declare-fun b_and!1287 () Bool)

(assert (=> b!18025 (= tp!3107 b_and!1287)))

(declare-fun b!18018 () Bool)

(declare-fun e!11501 () Bool)

(declare-fun e!11498 () Bool)

(assert (=> b!18018 (= e!11501 e!11498)))

(declare-fun b!18019 () Bool)

(declare-datatypes ((V!1029 0))(
  ( (V!1030 (val!478 Int)) )
))
(declare-datatypes ((ValueCell!252 0))(
  ( (ValueCellFull!252 (v!1460 V!1029)) (EmptyCell!252) )
))
(declare-datatypes ((array!1011 0))(
  ( (array!1012 (arr!487 (Array (_ BitVec 32) ValueCell!252)) (size!577 (_ BitVec 32))) )
))
(declare-datatypes ((array!1013 0))(
  ( (array!1014 (arr!488 (Array (_ BitVec 32) (_ BitVec 64))) (size!578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!90 0))(
  ( (LongMapFixedSize!91 (defaultEntry!1656 Int) (mask!4585 (_ BitVec 32)) (extraKeys!1569 (_ BitVec 32)) (zeroValue!1592 V!1029) (minValue!1592 V!1029) (_size!77 (_ BitVec 32)) (_keys!3081 array!1013) (_values!1653 array!1011) (_vacant!77 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!90 0))(
  ( (Cell!91 (v!1461 LongMapFixedSize!90)) )
))
(declare-datatypes ((LongMap!90 0))(
  ( (LongMap!91 (underlying!56 Cell!90)) )
))
(declare-datatypes ((tuple2!780 0))(
  ( (tuple2!781 (_1!391 Bool) (_2!391 LongMap!90)) )
))
(declare-fun e!11500 () tuple2!780)

(declare-fun thiss!848 () LongMap!90)

(assert (=> b!18019 (= e!11500 (tuple2!781 true thiss!848))))

(declare-fun b!18020 () Bool)

(declare-fun e!11502 () Bool)

(declare-fun tp_is_empty!903 () Bool)

(assert (=> b!18020 (= e!11502 tp_is_empty!903)))

(declare-fun b!18021 () Bool)

(declare-fun e!11503 () Bool)

(assert (=> b!18021 (= e!11503 tp_is_empty!903)))

(declare-fun b!18022 () Bool)

(declare-fun e!11506 () Bool)

(assert (=> b!18022 (= e!11506 false)))

(declare-fun lt!4660 () Bool)

(declare-fun lt!4659 () tuple2!780)

(declare-fun valid!43 (LongMap!90) Bool)

(assert (=> b!18022 (= lt!4660 (valid!43 (_2!391 lt!4659)))))

(declare-fun b!18023 () Bool)

(declare-fun e!11504 () Bool)

(assert (=> b!18023 (= e!11504 e!11501)))

(declare-fun res!12711 () Bool)

(declare-fun e!11497 () Bool)

(assert (=> start!3032 (=> (not res!12711) (not e!11497))))

(assert (=> start!3032 (= res!12711 (valid!43 thiss!848))))

(assert (=> start!3032 e!11497))

(assert (=> start!3032 e!11504))

(declare-fun b!18024 () Bool)

(assert (=> b!18024 (= e!11497 e!11506)))

(declare-fun res!12712 () Bool)

(assert (=> b!18024 (=> (not res!12712) (not e!11506))))

(assert (=> b!18024 (= res!12712 (not (_1!391 lt!4659)))))

(assert (=> b!18024 (= lt!4659 e!11500)))

(declare-fun c!1807 () Bool)

(declare-fun imbalanced!25 (LongMap!90) Bool)

(assert (=> b!18024 (= c!1807 (imbalanced!25 thiss!848))))

(declare-fun e!11499 () Bool)

(declare-fun array_inv!337 (array!1013) Bool)

(declare-fun array_inv!338 (array!1011) Bool)

(assert (=> b!18025 (= e!11498 (and tp!3107 tp_is_empty!903 (array_inv!337 (_keys!3081 (v!1461 (underlying!56 thiss!848)))) (array_inv!338 (_values!1653 (v!1461 (underlying!56 thiss!848)))) e!11499))))

(declare-fun mapNonEmpty!789 () Bool)

(declare-fun mapRes!789 () Bool)

(declare-fun tp!3108 () Bool)

(assert (=> mapNonEmpty!789 (= mapRes!789 (and tp!3108 e!11503))))

(declare-fun mapRest!789 () (Array (_ BitVec 32) ValueCell!252))

(declare-fun mapKey!789 () (_ BitVec 32))

(declare-fun mapValue!789 () ValueCell!252)

(assert (=> mapNonEmpty!789 (= (arr!487 (_values!1653 (v!1461 (underlying!56 thiss!848)))) (store mapRest!789 mapKey!789 mapValue!789))))

(declare-fun mapIsEmpty!789 () Bool)

(assert (=> mapIsEmpty!789 mapRes!789))

(declare-fun b!18026 () Bool)

(assert (=> b!18026 (= e!11499 (and e!11502 mapRes!789))))

(declare-fun condMapEmpty!789 () Bool)

(declare-fun mapDefault!789 () ValueCell!252)

(assert (=> b!18026 (= condMapEmpty!789 (= (arr!487 (_values!1653 (v!1461 (underlying!56 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!252)) mapDefault!789)))))

(declare-fun b!18027 () Bool)

(declare-fun repack!19 (LongMap!90) tuple2!780)

(assert (=> b!18027 (= e!11500 (repack!19 thiss!848))))

(assert (= (and start!3032 res!12711) b!18024))

(assert (= (and b!18024 c!1807) b!18027))

(assert (= (and b!18024 (not c!1807)) b!18019))

(assert (= (and b!18024 res!12712) b!18022))

(assert (= (and b!18026 condMapEmpty!789) mapIsEmpty!789))

(assert (= (and b!18026 (not condMapEmpty!789)) mapNonEmpty!789))

(get-info :version)

(assert (= (and mapNonEmpty!789 ((_ is ValueCellFull!252) mapValue!789)) b!18021))

(assert (= (and b!18026 ((_ is ValueCellFull!252) mapDefault!789)) b!18020))

(assert (= b!18025 b!18026))

(assert (= b!18018 b!18025))

(assert (= b!18023 b!18018))

(assert (= start!3032 b!18023))

(declare-fun m!12569 () Bool)

(assert (=> start!3032 m!12569))

(declare-fun m!12571 () Bool)

(assert (=> b!18027 m!12571))

(declare-fun m!12573 () Bool)

(assert (=> b!18024 m!12573))

(declare-fun m!12575 () Bool)

(assert (=> mapNonEmpty!789 m!12575))

(declare-fun m!12577 () Bool)

(assert (=> b!18022 m!12577))

(declare-fun m!12579 () Bool)

(assert (=> b!18025 m!12579))

(declare-fun m!12581 () Bool)

(assert (=> b!18025 m!12581))

(check-sat (not b!18027) (not b_next!639) (not b!18024) (not start!3032) (not mapNonEmpty!789) (not b!18025) (not b!18022) b_and!1287 tp_is_empty!903)
(check-sat b_and!1287 (not b_next!639))
