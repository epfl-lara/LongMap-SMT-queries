; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2984 () Bool)

(assert start!2984)

(declare-fun b!17380 () Bool)

(declare-fun b_free!601 () Bool)

(declare-fun b_next!601 () Bool)

(assert (=> b!17380 (= b_free!601 (not b_next!601))))

(declare-fun tp!2993 () Bool)

(declare-fun b_and!1243 () Bool)

(assert (=> b!17380 (= tp!2993 b_and!1243)))

(declare-fun mapNonEmpty!732 () Bool)

(declare-fun mapRes!732 () Bool)

(declare-fun tp!2994 () Bool)

(declare-fun e!10876 () Bool)

(assert (=> mapNonEmpty!732 (= mapRes!732 (and tp!2994 e!10876))))

(declare-datatypes ((V!979 0))(
  ( (V!980 (val!459 Int)) )
))
(declare-datatypes ((ValueCell!233 0))(
  ( (ValueCellFull!233 (v!1421 V!979)) (EmptyCell!233) )
))
(declare-datatypes ((array!917 0))(
  ( (array!918 (arr!440 (Array (_ BitVec 32) ValueCell!233)) (size!530 (_ BitVec 32))) )
))
(declare-datatypes ((array!919 0))(
  ( (array!920 (arr!441 (Array (_ BitVec 32) (_ BitVec 64))) (size!531 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!52 0))(
  ( (LongMapFixedSize!53 (defaultEntry!1637 Int) (mask!4554 (_ BitVec 32)) (extraKeys!1550 (_ BitVec 32)) (zeroValue!1573 V!979) (minValue!1573 V!979) (_size!58 (_ BitVec 32)) (_keys!3062 array!919) (_values!1634 array!917) (_vacant!58 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!52 0))(
  ( (Cell!53 (v!1422 LongMapFixedSize!52)) )
))
(declare-datatypes ((LongMap!52 0))(
  ( (LongMap!53 (underlying!37 Cell!52)) )
))
(declare-fun thiss!848 () LongMap!52)

(declare-fun mapValue!732 () ValueCell!233)

(declare-fun mapRest!732 () (Array (_ BitVec 32) ValueCell!233))

(declare-fun mapKey!732 () (_ BitVec 32))

(assert (=> mapNonEmpty!732 (= (arr!440 (_values!1634 (v!1422 (underlying!37 thiss!848)))) (store mapRest!732 mapKey!732 mapValue!732))))

(declare-fun res!12552 () Bool)

(declare-fun e!10875 () Bool)

(assert (=> start!2984 (=> (not res!12552) (not e!10875))))

(declare-fun valid!34 (LongMap!52) Bool)

(assert (=> start!2984 (= res!12552 (valid!34 thiss!848))))

(assert (=> start!2984 e!10875))

(declare-fun e!10883 () Bool)

(assert (=> start!2984 e!10883))

(assert (=> start!2984 true))

(declare-fun tp_is_empty!865 () Bool)

(assert (=> start!2984 tp_is_empty!865))

(declare-fun b!17374 () Bool)

(declare-datatypes ((tuple2!726 0))(
  ( (tuple2!727 (_1!364 Bool) (_2!364 LongMap!52)) )
))
(declare-fun e!10882 () tuple2!726)

(assert (=> b!17374 (= e!10882 (tuple2!727 true thiss!848))))

(declare-fun b!17375 () Bool)

(declare-fun e!10878 () Bool)

(assert (=> b!17375 (= e!10878 false)))

(declare-fun lt!4527 () Bool)

(declare-fun lt!4528 () LongMap!52)

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!728 0))(
  ( (tuple2!729 (_1!365 (_ BitVec 64)) (_2!365 V!979)) )
))
(declare-datatypes ((List!532 0))(
  ( (Nil!529) (Cons!528 (h!1094 tuple2!728) (t!3164 List!532)) )
))
(declare-datatypes ((ListLongMap!527 0))(
  ( (ListLongMap!528 (toList!279 List!532)) )
))
(declare-fun contains!211 (ListLongMap!527 (_ BitVec 64)) Bool)

(declare-fun map!336 (LongMap!52) ListLongMap!527)

(assert (=> b!17375 (= lt!4527 (contains!211 (map!336 lt!4528) key!682))))

(declare-fun b!17376 () Bool)

(declare-fun res!12553 () Bool)

(assert (=> b!17376 (=> (not res!12553) (not e!10878))))

(declare-datatypes ((tuple2!730 0))(
  ( (tuple2!731 (_1!366 Bool) (_2!366 LongMapFixedSize!52)) )
))
(declare-fun lt!4530 () tuple2!730)

(assert (=> b!17376 (= res!12553 (_1!366 lt!4530))))

(declare-fun b!17377 () Bool)

(declare-fun e!10880 () Bool)

(declare-fun e!10881 () Bool)

(assert (=> b!17377 (= e!10880 e!10881)))

(declare-fun mapIsEmpty!732 () Bool)

(assert (=> mapIsEmpty!732 mapRes!732))

(declare-fun b!17378 () Bool)

(declare-fun e!10884 () Bool)

(declare-fun e!10879 () Bool)

(assert (=> b!17378 (= e!10884 (and e!10879 mapRes!732))))

(declare-fun condMapEmpty!732 () Bool)

(declare-fun mapDefault!732 () ValueCell!233)

(assert (=> b!17378 (= condMapEmpty!732 (= (arr!440 (_values!1634 (v!1422 (underlying!37 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!233)) mapDefault!732)))))

(declare-fun b!17379 () Bool)

(declare-fun e!10877 () Bool)

(assert (=> b!17379 (= e!10877 e!10878)))

(declare-fun res!12554 () Bool)

(assert (=> b!17379 (=> (not res!12554) (not e!10878))))

(assert (=> b!17379 (= res!12554 (valid!34 lt!4528))))

(assert (=> b!17379 (= lt!4528 (LongMap!53 (Cell!53 (_2!366 lt!4530))))))

(declare-fun lt!4529 () tuple2!726)

(declare-fun v!259 () V!979)

(declare-fun update!6 (LongMapFixedSize!52 (_ BitVec 64) V!979) tuple2!730)

(assert (=> b!17379 (= lt!4530 (update!6 (v!1422 (underlying!37 (_2!364 lt!4529))) key!682 v!259))))

(declare-fun array_inv!319 (array!919) Bool)

(declare-fun array_inv!320 (array!917) Bool)

(assert (=> b!17380 (= e!10881 (and tp!2993 tp_is_empty!865 (array_inv!319 (_keys!3062 (v!1422 (underlying!37 thiss!848)))) (array_inv!320 (_values!1634 (v!1422 (underlying!37 thiss!848)))) e!10884))))

(declare-fun b!17381 () Bool)

(assert (=> b!17381 (= e!10875 e!10877)))

(declare-fun res!12551 () Bool)

(assert (=> b!17381 (=> (not res!12551) (not e!10877))))

(assert (=> b!17381 (= res!12551 (_1!364 lt!4529))))

(assert (=> b!17381 (= lt!4529 e!10882)))

(declare-fun c!1736 () Bool)

(declare-fun imbalanced!9 (LongMap!52) Bool)

(assert (=> b!17381 (= c!1736 (imbalanced!9 thiss!848))))

(declare-fun b!17382 () Bool)

(declare-fun repack!8 (LongMap!52) tuple2!726)

(assert (=> b!17382 (= e!10882 (repack!8 thiss!848))))

(declare-fun b!17383 () Bool)

(assert (=> b!17383 (= e!10876 tp_is_empty!865)))

(declare-fun b!17384 () Bool)

(assert (=> b!17384 (= e!10879 tp_is_empty!865)))

(declare-fun b!17385 () Bool)

(assert (=> b!17385 (= e!10883 e!10880)))

(assert (= (and start!2984 res!12552) b!17381))

(assert (= (and b!17381 c!1736) b!17382))

(assert (= (and b!17381 (not c!1736)) b!17374))

(assert (= (and b!17381 res!12551) b!17379))

(assert (= (and b!17379 res!12554) b!17376))

(assert (= (and b!17376 res!12553) b!17375))

(assert (= (and b!17378 condMapEmpty!732) mapIsEmpty!732))

(assert (= (and b!17378 (not condMapEmpty!732)) mapNonEmpty!732))

(get-info :version)

(assert (= (and mapNonEmpty!732 ((_ is ValueCellFull!233) mapValue!732)) b!17383))

(assert (= (and b!17378 ((_ is ValueCellFull!233) mapDefault!732)) b!17384))

(assert (= b!17380 b!17378))

(assert (= b!17377 b!17380))

(assert (= b!17385 b!17377))

(assert (= start!2984 b!17385))

(declare-fun m!12211 () Bool)

(assert (=> b!17382 m!12211))

(declare-fun m!12213 () Bool)

(assert (=> start!2984 m!12213))

(declare-fun m!12215 () Bool)

(assert (=> b!17381 m!12215))

(declare-fun m!12217 () Bool)

(assert (=> b!17375 m!12217))

(assert (=> b!17375 m!12217))

(declare-fun m!12219 () Bool)

(assert (=> b!17375 m!12219))

(declare-fun m!12221 () Bool)

(assert (=> b!17379 m!12221))

(declare-fun m!12223 () Bool)

(assert (=> b!17379 m!12223))

(declare-fun m!12225 () Bool)

(assert (=> b!17380 m!12225))

(declare-fun m!12227 () Bool)

(assert (=> b!17380 m!12227))

(declare-fun m!12229 () Bool)

(assert (=> mapNonEmpty!732 m!12229))

(check-sat (not b!17379) tp_is_empty!865 b_and!1243 (not b!17375) (not b!17382) (not start!2984) (not b!17381) (not mapNonEmpty!732) (not b!17380) (not b_next!601))
(check-sat b_and!1243 (not b_next!601))
