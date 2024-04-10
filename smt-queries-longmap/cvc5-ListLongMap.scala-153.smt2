; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2988 () Bool)

(assert start!2988)

(declare-fun b!17332 () Bool)

(declare-fun b_free!595 () Bool)

(declare-fun b_next!595 () Bool)

(assert (=> b!17332 (= b_free!595 (not b_next!595))))

(declare-fun tp!2975 () Bool)

(declare-fun b_and!1243 () Bool)

(assert (=> b!17332 (= tp!2975 b_and!1243)))

(declare-fun mapIsEmpty!723 () Bool)

(declare-fun mapRes!723 () Bool)

(assert (=> mapIsEmpty!723 mapRes!723))

(declare-fun b!17326 () Bool)

(declare-fun e!10830 () Bool)

(declare-fun e!10825 () Bool)

(assert (=> b!17326 (= e!10830 e!10825)))

(declare-fun res!12548 () Bool)

(assert (=> b!17326 (=> (not res!12548) (not e!10825))))

(declare-datatypes ((V!971 0))(
  ( (V!972 (val!456 Int)) )
))
(declare-datatypes ((ValueCell!230 0))(
  ( (ValueCellFull!230 (v!1416 V!971)) (EmptyCell!230) )
))
(declare-datatypes ((array!923 0))(
  ( (array!924 (arr!443 (Array (_ BitVec 32) ValueCell!230)) (size!533 (_ BitVec 32))) )
))
(declare-datatypes ((array!925 0))(
  ( (array!926 (arr!444 (Array (_ BitVec 32) (_ BitVec 64))) (size!534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!46 0))(
  ( (LongMapFixedSize!47 (defaultEntry!1634 Int) (mask!4549 (_ BitVec 32)) (extraKeys!1547 (_ BitVec 32)) (zeroValue!1570 V!971) (minValue!1570 V!971) (_size!55 (_ BitVec 32)) (_keys!3059 array!925) (_values!1631 array!923) (_vacant!55 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!46 0))(
  ( (Cell!47 (v!1417 LongMapFixedSize!46)) )
))
(declare-datatypes ((LongMap!46 0))(
  ( (LongMap!47 (underlying!34 Cell!46)) )
))
(declare-datatypes ((tuple2!714 0))(
  ( (tuple2!715 (_1!358 Bool) (_2!358 LongMap!46)) )
))
(declare-fun lt!4498 () tuple2!714)

(assert (=> b!17326 (= res!12548 (_1!358 lt!4498))))

(declare-fun e!10826 () tuple2!714)

(assert (=> b!17326 (= lt!4498 e!10826)))

(declare-fun c!1741 () Bool)

(declare-fun thiss!848 () LongMap!46)

(declare-fun imbalanced!7 (LongMap!46) Bool)

(assert (=> b!17326 (= c!1741 (imbalanced!7 thiss!848))))

(declare-fun b!17327 () Bool)

(declare-fun res!12549 () Bool)

(declare-fun e!10829 () Bool)

(assert (=> b!17327 (=> (not res!12549) (not e!10829))))

(declare-datatypes ((tuple2!716 0))(
  ( (tuple2!717 (_1!359 Bool) (_2!359 LongMapFixedSize!46)) )
))
(declare-fun lt!4495 () tuple2!716)

(assert (=> b!17327 (= res!12549 (_1!359 lt!4495))))

(declare-fun b!17328 () Bool)

(assert (=> b!17328 (= e!10826 (tuple2!715 true thiss!848))))

(declare-fun b!17329 () Bool)

(assert (=> b!17329 (= e!10825 e!10829)))

(declare-fun res!12550 () Bool)

(assert (=> b!17329 (=> (not res!12550) (not e!10829))))

(declare-fun lt!4497 () LongMap!46)

(declare-fun valid!24 (LongMap!46) Bool)

(assert (=> b!17329 (= res!12550 (valid!24 lt!4497))))

(assert (=> b!17329 (= lt!4497 (LongMap!47 (Cell!47 (_2!359 lt!4495))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!971)

(declare-fun update!4 (LongMapFixedSize!46 (_ BitVec 64) V!971) tuple2!716)

(assert (=> b!17329 (= lt!4495 (update!4 (v!1417 (underlying!34 (_2!358 lt!4498))) key!682 v!259))))

(declare-fun b!17330 () Bool)

(assert (=> b!17330 (= e!10829 false)))

(declare-fun lt!4496 () Bool)

(declare-datatypes ((tuple2!718 0))(
  ( (tuple2!719 (_1!360 (_ BitVec 64)) (_2!360 V!971)) )
))
(declare-datatypes ((List!534 0))(
  ( (Nil!531) (Cons!530 (h!1096 tuple2!718) (t!3173 List!534)) )
))
(declare-datatypes ((ListLongMap!527 0))(
  ( (ListLongMap!528 (toList!279 List!534)) )
))
(declare-fun contains!211 (ListLongMap!527 (_ BitVec 64)) Bool)

(declare-fun map!332 (LongMap!46) ListLongMap!527)

(assert (=> b!17330 (= lt!4496 (contains!211 (map!332 lt!4497) key!682))))

(declare-fun mapNonEmpty!723 () Bool)

(declare-fun tp!2976 () Bool)

(declare-fun e!10822 () Bool)

(assert (=> mapNonEmpty!723 (= mapRes!723 (and tp!2976 e!10822))))

(declare-fun mapKey!723 () (_ BitVec 32))

(declare-fun mapValue!723 () ValueCell!230)

(declare-fun mapRest!723 () (Array (_ BitVec 32) ValueCell!230))

(assert (=> mapNonEmpty!723 (= (arr!443 (_values!1631 (v!1417 (underlying!34 thiss!848)))) (store mapRest!723 mapKey!723 mapValue!723))))

(declare-fun b!17331 () Bool)

(declare-fun tp_is_empty!859 () Bool)

(assert (=> b!17331 (= e!10822 tp_is_empty!859)))

(declare-fun e!10823 () Bool)

(declare-fun e!10824 () Bool)

(declare-fun array_inv!309 (array!925) Bool)

(declare-fun array_inv!310 (array!923) Bool)

(assert (=> b!17332 (= e!10823 (and tp!2975 tp_is_empty!859 (array_inv!309 (_keys!3059 (v!1417 (underlying!34 thiss!848)))) (array_inv!310 (_values!1631 (v!1417 (underlying!34 thiss!848)))) e!10824))))

(declare-fun b!17333 () Bool)

(declare-fun e!10821 () Bool)

(assert (=> b!17333 (= e!10821 e!10823)))

(declare-fun b!17334 () Bool)

(declare-fun repack!4 (LongMap!46) tuple2!714)

(assert (=> b!17334 (= e!10826 (repack!4 thiss!848))))

(declare-fun res!12547 () Bool)

(assert (=> start!2988 (=> (not res!12547) (not e!10830))))

(assert (=> start!2988 (= res!12547 (valid!24 thiss!848))))

(assert (=> start!2988 e!10830))

(declare-fun e!10827 () Bool)

(assert (=> start!2988 e!10827))

(assert (=> start!2988 true))

(assert (=> start!2988 tp_is_empty!859))

(declare-fun b!17335 () Bool)

(declare-fun e!10831 () Bool)

(assert (=> b!17335 (= e!10824 (and e!10831 mapRes!723))))

(declare-fun condMapEmpty!723 () Bool)

(declare-fun mapDefault!723 () ValueCell!230)

