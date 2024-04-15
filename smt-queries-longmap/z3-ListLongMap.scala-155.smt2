; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2990 () Bool)

(assert start!2990)

(declare-fun b!17481 () Bool)

(declare-fun b_free!607 () Bool)

(declare-fun b_next!607 () Bool)

(assert (=> b!17481 (= b_free!607 (not b_next!607))))

(declare-fun tp!3012 () Bool)

(declare-fun b_and!1249 () Bool)

(assert (=> b!17481 (= tp!3012 b_and!1249)))

(declare-fun b!17478 () Bool)

(declare-fun e!10979 () Bool)

(declare-fun e!10972 () Bool)

(assert (=> b!17478 (= e!10979 e!10972)))

(declare-fun res!12583 () Bool)

(assert (=> b!17478 (=> (not res!12583) (not e!10972))))

(declare-datatypes ((V!987 0))(
  ( (V!988 (val!462 Int)) )
))
(declare-datatypes ((ValueCell!236 0))(
  ( (ValueCellFull!236 (v!1427 V!987)) (EmptyCell!236) )
))
(declare-datatypes ((array!929 0))(
  ( (array!930 (arr!446 (Array (_ BitVec 32) ValueCell!236)) (size!536 (_ BitVec 32))) )
))
(declare-datatypes ((array!931 0))(
  ( (array!932 (arr!447 (Array (_ BitVec 32) (_ BitVec 64))) (size!537 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!58 0))(
  ( (LongMapFixedSize!59 (defaultEntry!1640 Int) (mask!4559 (_ BitVec 32)) (extraKeys!1553 (_ BitVec 32)) (zeroValue!1576 V!987) (minValue!1576 V!987) (_size!61 (_ BitVec 32)) (_keys!3065 array!931) (_values!1637 array!929) (_vacant!61 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!58 0))(
  ( (Cell!59 (v!1428 LongMapFixedSize!58)) )
))
(declare-datatypes ((LongMap!58 0))(
  ( (LongMap!59 (underlying!40 Cell!58)) )
))
(declare-datatypes ((tuple2!744 0))(
  ( (tuple2!745 (_1!373 Bool) (_2!373 LongMap!58)) )
))
(declare-fun lt!4559 () tuple2!744)

(assert (=> b!17478 (= res!12583 (_1!373 lt!4559))))

(declare-fun e!10978 () tuple2!744)

(assert (=> b!17478 (= lt!4559 e!10978)))

(declare-fun c!1745 () Bool)

(declare-fun thiss!848 () LongMap!58)

(declare-fun imbalanced!11 (LongMap!58) Bool)

(assert (=> b!17478 (= c!1745 (imbalanced!11 thiss!848))))

(declare-fun b!17479 () Bool)

(declare-fun e!10980 () Bool)

(declare-fun e!10975 () Bool)

(declare-fun mapRes!741 () Bool)

(assert (=> b!17479 (= e!10980 (and e!10975 mapRes!741))))

(declare-fun condMapEmpty!741 () Bool)

(declare-fun mapDefault!741 () ValueCell!236)

(assert (=> b!17479 (= condMapEmpty!741 (= (arr!446 (_values!1637 (v!1428 (underlying!40 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!236)) mapDefault!741)))))

(declare-fun b!17480 () Bool)

(declare-fun repack!10 (LongMap!58) tuple2!744)

(assert (=> b!17480 (= e!10978 (repack!10 thiss!848))))

(declare-fun tp_is_empty!871 () Bool)

(declare-fun e!10974 () Bool)

(declare-fun array_inv!323 (array!931) Bool)

(declare-fun array_inv!324 (array!929) Bool)

(assert (=> b!17481 (= e!10974 (and tp!3012 tp_is_empty!871 (array_inv!323 (_keys!3065 (v!1428 (underlying!40 thiss!848)))) (array_inv!324 (_values!1637 (v!1428 (underlying!40 thiss!848)))) e!10980))))

(declare-fun b!17482 () Bool)

(declare-fun e!10976 () Bool)

(declare-fun e!10971 () Bool)

(assert (=> b!17482 (= e!10976 e!10971)))

(declare-fun b!17483 () Bool)

(assert (=> b!17483 (= e!10975 tp_is_empty!871)))

(declare-fun b!17484 () Bool)

(declare-fun e!10977 () Bool)

(assert (=> b!17484 (= e!10977 tp_is_empty!871)))

(declare-fun mapIsEmpty!741 () Bool)

(assert (=> mapIsEmpty!741 mapRes!741))

(declare-fun b!17485 () Bool)

(assert (=> b!17485 (= e!10972 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!987)

(declare-fun lt!4560 () Bool)

(declare-fun valid!37 (LongMap!58) Bool)

(declare-datatypes ((tuple2!746 0))(
  ( (tuple2!747 (_1!374 Bool) (_2!374 LongMapFixedSize!58)) )
))
(declare-fun update!9 (LongMapFixedSize!58 (_ BitVec 64) V!987) tuple2!746)

(assert (=> b!17485 (= lt!4560 (valid!37 (LongMap!59 (Cell!59 (_2!374 (update!9 (v!1428 (underlying!40 (_2!373 lt!4559))) key!682 v!259))))))))

(declare-fun b!17486 () Bool)

(assert (=> b!17486 (= e!10978 (tuple2!745 true thiss!848))))

(declare-fun b!17487 () Bool)

(assert (=> b!17487 (= e!10971 e!10974)))

(declare-fun mapNonEmpty!741 () Bool)

(declare-fun tp!3011 () Bool)

(assert (=> mapNonEmpty!741 (= mapRes!741 (and tp!3011 e!10977))))

(declare-fun mapKey!741 () (_ BitVec 32))

(declare-fun mapValue!741 () ValueCell!236)

(declare-fun mapRest!741 () (Array (_ BitVec 32) ValueCell!236))

(assert (=> mapNonEmpty!741 (= (arr!446 (_values!1637 (v!1428 (underlying!40 thiss!848)))) (store mapRest!741 mapKey!741 mapValue!741))))

(declare-fun res!12584 () Bool)

(assert (=> start!2990 (=> (not res!12584) (not e!10979))))

(assert (=> start!2990 (= res!12584 (valid!37 thiss!848))))

(assert (=> start!2990 e!10979))

(assert (=> start!2990 e!10976))

(assert (=> start!2990 true))

(assert (=> start!2990 tp_is_empty!871))

(assert (= (and start!2990 res!12584) b!17478))

(assert (= (and b!17478 c!1745) b!17480))

(assert (= (and b!17478 (not c!1745)) b!17486))

(assert (= (and b!17478 res!12583) b!17485))

(assert (= (and b!17479 condMapEmpty!741) mapIsEmpty!741))

(assert (= (and b!17479 (not condMapEmpty!741)) mapNonEmpty!741))

(get-info :version)

(assert (= (and mapNonEmpty!741 ((_ is ValueCellFull!236) mapValue!741)) b!17484))

(assert (= (and b!17479 ((_ is ValueCellFull!236) mapDefault!741)) b!17483))

(assert (= b!17481 b!17479))

(assert (= b!17487 b!17481))

(assert (= b!17482 b!17487))

(assert (= start!2990 b!17482))

(declare-fun m!12271 () Bool)

(assert (=> b!17480 m!12271))

(declare-fun m!12273 () Bool)

(assert (=> mapNonEmpty!741 m!12273))

(declare-fun m!12275 () Bool)

(assert (=> start!2990 m!12275))

(declare-fun m!12277 () Bool)

(assert (=> b!17485 m!12277))

(declare-fun m!12279 () Bool)

(assert (=> b!17485 m!12279))

(declare-fun m!12281 () Bool)

(assert (=> b!17481 m!12281))

(declare-fun m!12283 () Bool)

(assert (=> b!17481 m!12283))

(declare-fun m!12285 () Bool)

(assert (=> b!17478 m!12285))

(check-sat (not mapNonEmpty!741) b_and!1249 (not start!2990) tp_is_empty!871 (not b!17478) (not b!17481) (not b!17485) (not b_next!607) (not b!17480))
(check-sat b_and!1249 (not b_next!607))
