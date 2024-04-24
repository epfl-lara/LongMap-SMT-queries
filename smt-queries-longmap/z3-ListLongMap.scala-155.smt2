; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2996 () Bool)

(assert start!2996)

(declare-fun b!17504 () Bool)

(declare-fun b_free!607 () Bool)

(declare-fun b_next!607 () Bool)

(assert (=> b!17504 (= b_free!607 (not b_next!607))))

(declare-fun tp!3012 () Bool)

(declare-fun b_and!1249 () Bool)

(assert (=> b!17504 (= tp!3012 b_and!1249)))

(declare-fun b!17496 () Bool)

(declare-datatypes ((V!987 0))(
  ( (V!988 (val!462 Int)) )
))
(declare-datatypes ((ValueCell!236 0))(
  ( (ValueCellFull!236 (v!1428 V!987)) (EmptyCell!236) )
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
  ( (Cell!59 (v!1429 LongMapFixedSize!58)) )
))
(declare-datatypes ((LongMap!58 0))(
  ( (LongMap!59 (underlying!40 Cell!58)) )
))
(declare-datatypes ((tuple2!742 0))(
  ( (tuple2!743 (_1!372 Bool) (_2!372 LongMap!58)) )
))
(declare-fun e!10986 () tuple2!742)

(declare-fun thiss!848 () LongMap!58)

(assert (=> b!17496 (= e!10986 (tuple2!743 true thiss!848))))

(declare-fun b!17497 () Bool)

(declare-fun repack!8 (LongMap!58) tuple2!742)

(assert (=> b!17497 (= e!10986 (repack!8 thiss!848))))

(declare-fun res!12593 () Bool)

(declare-fun e!10991 () Bool)

(assert (=> start!2996 (=> (not res!12593) (not e!10991))))

(declare-fun valid!36 (LongMap!58) Bool)

(assert (=> start!2996 (= res!12593 (valid!36 thiss!848))))

(assert (=> start!2996 e!10991))

(declare-fun e!10988 () Bool)

(assert (=> start!2996 e!10988))

(assert (=> start!2996 true))

(declare-fun tp_is_empty!871 () Bool)

(assert (=> start!2996 tp_is_empty!871))

(declare-fun mapIsEmpty!741 () Bool)

(declare-fun mapRes!741 () Bool)

(assert (=> mapIsEmpty!741 mapRes!741))

(declare-fun b!17498 () Bool)

(declare-fun e!10987 () Bool)

(assert (=> b!17498 (= e!10988 e!10987)))

(declare-fun b!17499 () Bool)

(declare-fun e!10985 () Bool)

(assert (=> b!17499 (= e!10987 e!10985)))

(declare-fun b!17500 () Bool)

(declare-fun e!10993 () Bool)

(assert (=> b!17500 (= e!10991 e!10993)))

(declare-fun res!12594 () Bool)

(assert (=> b!17500 (=> (not res!12594) (not e!10993))))

(declare-fun lt!4564 () tuple2!742)

(assert (=> b!17500 (= res!12594 (_1!372 lt!4564))))

(assert (=> b!17500 (= lt!4564 e!10986)))

(declare-fun c!1749 () Bool)

(declare-fun imbalanced!11 (LongMap!58) Bool)

(assert (=> b!17500 (= c!1749 (imbalanced!11 thiss!848))))

(declare-fun mapNonEmpty!741 () Bool)

(declare-fun tp!3011 () Bool)

(declare-fun e!10989 () Bool)

(assert (=> mapNonEmpty!741 (= mapRes!741 (and tp!3011 e!10989))))

(declare-fun mapKey!741 () (_ BitVec 32))

(declare-fun mapValue!741 () ValueCell!236)

(declare-fun mapRest!741 () (Array (_ BitVec 32) ValueCell!236))

(assert (=> mapNonEmpty!741 (= (arr!446 (_values!1637 (v!1429 (underlying!40 thiss!848)))) (store mapRest!741 mapKey!741 mapValue!741))))

(declare-fun b!17501 () Bool)

(declare-fun e!10994 () Bool)

(assert (=> b!17501 (= e!10994 tp_is_empty!871)))

(declare-fun b!17502 () Bool)

(declare-fun e!10992 () Bool)

(assert (=> b!17502 (= e!10992 (and e!10994 mapRes!741))))

(declare-fun condMapEmpty!741 () Bool)

(declare-fun mapDefault!741 () ValueCell!236)

(assert (=> b!17502 (= condMapEmpty!741 (= (arr!446 (_values!1637 (v!1429 (underlying!40 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!236)) mapDefault!741)))))

(declare-fun b!17503 () Bool)

(assert (=> b!17503 (= e!10993 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4563 () Bool)

(declare-fun v!259 () V!987)

(declare-datatypes ((tuple2!744 0))(
  ( (tuple2!745 (_1!373 Bool) (_2!373 LongMapFixedSize!58)) )
))
(declare-fun update!8 (LongMapFixedSize!58 (_ BitVec 64) V!987) tuple2!744)

(assert (=> b!17503 (= lt!4563 (valid!36 (LongMap!59 (Cell!59 (_2!373 (update!8 (v!1429 (underlying!40 (_2!372 lt!4564))) key!682 v!259))))))))

(declare-fun array_inv!321 (array!931) Bool)

(declare-fun array_inv!322 (array!929) Bool)

(assert (=> b!17504 (= e!10985 (and tp!3012 tp_is_empty!871 (array_inv!321 (_keys!3065 (v!1429 (underlying!40 thiss!848)))) (array_inv!322 (_values!1637 (v!1429 (underlying!40 thiss!848)))) e!10992))))

(declare-fun b!17505 () Bool)

(assert (=> b!17505 (= e!10989 tp_is_empty!871)))

(assert (= (and start!2996 res!12593) b!17500))

(assert (= (and b!17500 c!1749) b!17497))

(assert (= (and b!17500 (not c!1749)) b!17496))

(assert (= (and b!17500 res!12594) b!17503))

(assert (= (and b!17502 condMapEmpty!741) mapIsEmpty!741))

(assert (= (and b!17502 (not condMapEmpty!741)) mapNonEmpty!741))

(get-info :version)

(assert (= (and mapNonEmpty!741 ((_ is ValueCellFull!236) mapValue!741)) b!17505))

(assert (= (and b!17502 ((_ is ValueCellFull!236) mapDefault!741)) b!17501))

(assert (= b!17504 b!17502))

(assert (= b!17499 b!17504))

(assert (= b!17498 b!17499))

(assert (= start!2996 b!17498))

(declare-fun m!12285 () Bool)

(assert (=> b!17504 m!12285))

(declare-fun m!12287 () Bool)

(assert (=> b!17504 m!12287))

(declare-fun m!12289 () Bool)

(assert (=> mapNonEmpty!741 m!12289))

(declare-fun m!12291 () Bool)

(assert (=> b!17497 m!12291))

(declare-fun m!12293 () Bool)

(assert (=> b!17500 m!12293))

(declare-fun m!12295 () Bool)

(assert (=> start!2996 m!12295))

(declare-fun m!12297 () Bool)

(assert (=> b!17503 m!12297))

(declare-fun m!12299 () Bool)

(assert (=> b!17503 m!12299))

(check-sat (not b!17500) b_and!1249 (not b!17504) (not mapNonEmpty!741) (not b!17497) tp_is_empty!871 (not b!17503) (not b_next!607) (not start!2996))
(check-sat b_and!1249 (not b_next!607))
