; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3042 () Bool)

(assert start!3042)

(declare-fun b!18185 () Bool)

(declare-fun b_free!649 () Bool)

(declare-fun b_next!649 () Bool)

(assert (=> b!18185 (= b_free!649 (not b_next!649))))

(declare-fun tp!3138 () Bool)

(declare-fun b_and!1297 () Bool)

(assert (=> b!18185 (= tp!3138 b_and!1297)))

(declare-fun b!18176 () Bool)

(declare-datatypes ((V!1043 0))(
  ( (V!1044 (val!483 Int)) )
))
(declare-datatypes ((ValueCell!257 0))(
  ( (ValueCellFull!257 (v!1470 V!1043)) (EmptyCell!257) )
))
(declare-datatypes ((array!1031 0))(
  ( (array!1032 (arr!497 (Array (_ BitVec 32) ValueCell!257)) (size!587 (_ BitVec 32))) )
))
(declare-datatypes ((array!1033 0))(
  ( (array!1034 (arr!498 (Array (_ BitVec 32) (_ BitVec 64))) (size!588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!100 0))(
  ( (LongMapFixedSize!101 (defaultEntry!1661 Int) (mask!4594 (_ BitVec 32)) (extraKeys!1574 (_ BitVec 32)) (zeroValue!1597 V!1043) (minValue!1597 V!1043) (_size!82 (_ BitVec 32)) (_keys!3086 array!1033) (_values!1658 array!1031) (_vacant!82 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!100 0))(
  ( (Cell!101 (v!1471 LongMapFixedSize!100)) )
))
(declare-datatypes ((LongMap!100 0))(
  ( (LongMap!101 (underlying!61 Cell!100)) )
))
(declare-datatypes ((tuple2!786 0))(
  ( (tuple2!787 (_1!394 Bool) (_2!394 LongMap!100)) )
))
(declare-fun e!11657 () tuple2!786)

(declare-fun thiss!848 () LongMap!100)

(declare-fun repack!22 (LongMap!100) tuple2!786)

(assert (=> b!18176 (= e!11657 (repack!22 thiss!848))))

(declare-fun b!18177 () Bool)

(assert (=> b!18177 (= e!11657 (tuple2!787 true thiss!848))))

(declare-fun mapIsEmpty!804 () Bool)

(declare-fun mapRes!804 () Bool)

(assert (=> mapIsEmpty!804 mapRes!804))

(declare-fun b!18178 () Bool)

(declare-fun e!11665 () Bool)

(declare-fun e!11655 () Bool)

(assert (=> b!18178 (= e!11665 e!11655)))

(declare-fun b!18179 () Bool)

(declare-fun e!11653 () Bool)

(declare-fun e!11658 () Bool)

(assert (=> b!18179 (= e!11653 e!11658)))

(declare-datatypes ((tuple2!788 0))(
  ( (tuple2!789 (_1!395 (_ BitVec 64)) (_2!395 V!1043)) )
))
(declare-datatypes ((List!538 0))(
  ( (Nil!535) (Cons!534 (h!1100 tuple2!788) (t!3177 List!538)) )
))
(declare-datatypes ((ListLongMap!535 0))(
  ( (ListLongMap!536 (toList!283 List!538)) )
))
(declare-fun lt!4694 () ListLongMap!535)

(declare-fun call!620 () ListLongMap!535)

(assert (=> b!18179 (= lt!4694 call!620)))

(declare-fun res!12745 () Bool)

(declare-fun key!682 () (_ BitVec 64))

(declare-fun contains!215 (ListLongMap!535 (_ BitVec 64)) Bool)

(assert (=> b!18179 (= res!12745 (not (contains!215 lt!4694 key!682)))))

(assert (=> b!18179 (=> res!12745 e!11658)))

(declare-fun b!18180 () Bool)

(declare-fun e!11661 () Bool)

(declare-fun tp_is_empty!913 () Bool)

(assert (=> b!18180 (= e!11661 tp_is_empty!913)))

(declare-fun res!12747 () Bool)

(declare-fun e!11659 () Bool)

(assert (=> start!3042 (=> (not res!12747) (not e!11659))))

(declare-fun valid!46 (LongMap!100) Bool)

(assert (=> start!3042 (= res!12747 (valid!46 thiss!848))))

(assert (=> start!3042 e!11659))

(declare-fun e!11654 () Bool)

(assert (=> start!3042 e!11654))

(assert (=> start!3042 true))

(assert (=> start!3042 tp_is_empty!913))

(declare-fun b!18181 () Bool)

(assert (=> b!18181 (= e!11654 e!11665)))

(declare-fun b!18182 () Bool)

(declare-fun e!11660 () Bool)

(assert (=> b!18182 (= e!11660 (and e!11661 mapRes!804))))

(declare-fun condMapEmpty!804 () Bool)

(declare-fun mapDefault!804 () ValueCell!257)

