; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2990 () Bool)

(assert start!2990)

(declare-fun b!17399 () Bool)

(declare-fun b_free!601 () Bool)

(declare-fun b_next!601 () Bool)

(assert (=> b!17399 (= b_free!601 (not b_next!601))))

(declare-fun tp!2993 () Bool)

(declare-fun b_and!1243 () Bool)

(assert (=> b!17399 (= tp!2993 b_and!1243)))

(declare-fun b!17392 () Bool)

(declare-datatypes ((V!979 0))(
  ( (V!980 (val!459 Int)) )
))
(declare-datatypes ((ValueCell!233 0))(
  ( (ValueCellFull!233 (v!1422 V!979)) (EmptyCell!233) )
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
  ( (Cell!53 (v!1423 LongMapFixedSize!52)) )
))
(declare-datatypes ((LongMap!52 0))(
  ( (LongMap!53 (underlying!37 Cell!52)) )
))
(declare-datatypes ((tuple2!724 0))(
  ( (tuple2!725 (_1!363 Bool) (_2!363 LongMap!52)) )
))
(declare-fun e!10896 () tuple2!724)

(declare-fun thiss!848 () LongMap!52)

(assert (=> b!17392 (= e!10896 (tuple2!725 true thiss!848))))

(declare-fun b!17393 () Bool)

(declare-fun e!10892 () Bool)

(assert (=> b!17393 (= e!10892 false)))

(declare-fun lt!4534 () Bool)

(declare-fun lt!4531 () LongMap!52)

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!726 0))(
  ( (tuple2!727 (_1!364 (_ BitVec 64)) (_2!364 V!979)) )
))
(declare-datatypes ((List!532 0))(
  ( (Nil!529) (Cons!528 (h!1094 tuple2!726) (t!3165 List!532)) )
))
(declare-datatypes ((ListLongMap!527 0))(
  ( (ListLongMap!528 (toList!279 List!532)) )
))
(declare-fun contains!210 (ListLongMap!527 (_ BitVec 64)) Bool)

(declare-fun map!336 (LongMap!52) ListLongMap!527)

(assert (=> b!17393 (= lt!4534 (contains!210 (map!336 lt!4531) key!682))))

(declare-fun b!17394 () Bool)

(declare-fun e!10897 () Bool)

(declare-fun e!10894 () Bool)

(declare-fun mapRes!732 () Bool)

(assert (=> b!17394 (= e!10897 (and e!10894 mapRes!732))))

(declare-fun condMapEmpty!732 () Bool)

(declare-fun mapDefault!732 () ValueCell!233)

(assert (=> b!17394 (= condMapEmpty!732 (= (arr!440 (_values!1634 (v!1423 (underlying!37 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!233)) mapDefault!732)))))

(declare-fun b!17396 () Bool)

(declare-fun res!12561 () Bool)

(assert (=> b!17396 (=> (not res!12561) (not e!10892))))

(declare-datatypes ((tuple2!728 0))(
  ( (tuple2!729 (_1!365 Bool) (_2!365 LongMapFixedSize!52)) )
))
(declare-fun lt!4532 () tuple2!728)

(assert (=> b!17396 (= res!12561 (_1!365 lt!4532))))

(declare-fun b!17397 () Bool)

(declare-fun e!10898 () Bool)

(declare-fun e!10888 () Bool)

(assert (=> b!17397 (= e!10898 e!10888)))

(declare-fun b!17398 () Bool)

(declare-fun e!10890 () Bool)

(assert (=> b!17398 (= e!10888 e!10890)))

(declare-fun tp_is_empty!865 () Bool)

(declare-fun array_inv!317 (array!919) Bool)

(declare-fun array_inv!318 (array!917) Bool)

(assert (=> b!17399 (= e!10890 (and tp!2993 tp_is_empty!865 (array_inv!317 (_keys!3062 (v!1423 (underlying!37 thiss!848)))) (array_inv!318 (_values!1634 (v!1423 (underlying!37 thiss!848)))) e!10897))))

(declare-fun b!17400 () Bool)

(declare-fun e!10889 () Bool)

(assert (=> b!17400 (= e!10889 e!10892)))

(declare-fun res!12562 () Bool)

(assert (=> b!17400 (=> (not res!12562) (not e!10892))))

(declare-fun valid!33 (LongMap!52) Bool)

(assert (=> b!17400 (= res!12562 (valid!33 lt!4531))))

(assert (=> b!17400 (= lt!4531 (LongMap!53 (Cell!53 (_2!365 lt!4532))))))

(declare-fun lt!4533 () tuple2!724)

(declare-fun v!259 () V!979)

(declare-fun update!6 (LongMapFixedSize!52 (_ BitVec 64) V!979) tuple2!728)

(assert (=> b!17400 (= lt!4532 (update!6 (v!1423 (underlying!37 (_2!363 lt!4533))) key!682 v!259))))

(declare-fun b!17401 () Bool)

(declare-fun repack!5 (LongMap!52) tuple2!724)

(assert (=> b!17401 (= e!10896 (repack!5 thiss!848))))

(declare-fun b!17402 () Bool)

(declare-fun e!10895 () Bool)

(assert (=> b!17402 (= e!10895 e!10889)))

(declare-fun res!12564 () Bool)

(assert (=> b!17402 (=> (not res!12564) (not e!10889))))

(assert (=> b!17402 (= res!12564 (_1!363 lt!4533))))

(assert (=> b!17402 (= lt!4533 e!10896)))

(declare-fun c!1740 () Bool)

(declare-fun imbalanced!8 (LongMap!52) Bool)

(assert (=> b!17402 (= c!1740 (imbalanced!8 thiss!848))))

(declare-fun b!17403 () Bool)

(declare-fun e!10891 () Bool)

(assert (=> b!17403 (= e!10891 tp_is_empty!865)))

(declare-fun mapIsEmpty!732 () Bool)

(assert (=> mapIsEmpty!732 mapRes!732))

(declare-fun mapNonEmpty!732 () Bool)

(declare-fun tp!2994 () Bool)

(assert (=> mapNonEmpty!732 (= mapRes!732 (and tp!2994 e!10891))))

(declare-fun mapRest!732 () (Array (_ BitVec 32) ValueCell!233))

(declare-fun mapValue!732 () ValueCell!233)

(declare-fun mapKey!732 () (_ BitVec 32))

(assert (=> mapNonEmpty!732 (= (arr!440 (_values!1634 (v!1423 (underlying!37 thiss!848)))) (store mapRest!732 mapKey!732 mapValue!732))))

(declare-fun b!17395 () Bool)

(assert (=> b!17395 (= e!10894 tp_is_empty!865)))

(declare-fun res!12563 () Bool)

(assert (=> start!2990 (=> (not res!12563) (not e!10895))))

(assert (=> start!2990 (= res!12563 (valid!33 thiss!848))))

(assert (=> start!2990 e!10895))

(assert (=> start!2990 e!10898))

(assert (=> start!2990 true))

(assert (=> start!2990 tp_is_empty!865))

(assert (= (and start!2990 res!12563) b!17402))

(assert (= (and b!17402 c!1740) b!17401))

(assert (= (and b!17402 (not c!1740)) b!17392))

(assert (= (and b!17402 res!12564) b!17400))

(assert (= (and b!17400 res!12562) b!17396))

(assert (= (and b!17396 res!12561) b!17393))

(assert (= (and b!17394 condMapEmpty!732) mapIsEmpty!732))

(assert (= (and b!17394 (not condMapEmpty!732)) mapNonEmpty!732))

(get-info :version)

(assert (= (and mapNonEmpty!732 ((_ is ValueCellFull!233) mapValue!732)) b!17403))

(assert (= (and b!17394 ((_ is ValueCellFull!233) mapDefault!732)) b!17395))

(assert (= b!17399 b!17394))

(assert (= b!17398 b!17399))

(assert (= b!17397 b!17398))

(assert (= start!2990 b!17397))

(declare-fun m!12225 () Bool)

(assert (=> start!2990 m!12225))

(declare-fun m!12227 () Bool)

(assert (=> b!17401 m!12227))

(declare-fun m!12229 () Bool)

(assert (=> b!17402 m!12229))

(declare-fun m!12231 () Bool)

(assert (=> b!17399 m!12231))

(declare-fun m!12233 () Bool)

(assert (=> b!17399 m!12233))

(declare-fun m!12235 () Bool)

(assert (=> b!17393 m!12235))

(assert (=> b!17393 m!12235))

(declare-fun m!12237 () Bool)

(assert (=> b!17393 m!12237))

(declare-fun m!12239 () Bool)

(assert (=> b!17400 m!12239))

(declare-fun m!12241 () Bool)

(assert (=> b!17400 m!12241))

(declare-fun m!12243 () Bool)

(assert (=> mapNonEmpty!732 m!12243))

(check-sat tp_is_empty!865 (not mapNonEmpty!732) (not b_next!601) (not start!2990) (not b!17401) (not b!17402) b_and!1243 (not b!17399) (not b!17393) (not b!17400))
(check-sat b_and!1243 (not b_next!601))
