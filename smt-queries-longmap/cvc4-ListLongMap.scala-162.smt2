; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3046 () Bool)

(assert start!3046)

(declare-fun b!18261 () Bool)

(declare-fun b_free!653 () Bool)

(declare-fun b_next!653 () Bool)

(assert (=> b!18261 (= b_free!653 (not b_next!653))))

(declare-fun tp!3149 () Bool)

(declare-fun b_and!1301 () Bool)

(assert (=> b!18261 (= tp!3149 b_and!1301)))

(declare-fun b!18260 () Bool)

(declare-fun e!11743 () Bool)

(declare-fun e!11737 () Bool)

(assert (=> b!18260 (= e!11743 e!11737)))

(declare-fun res!12771 () Bool)

(assert (=> b!18260 (=> (not res!12771) (not e!11737))))

(declare-datatypes ((V!1047 0))(
  ( (V!1048 (val!485 Int)) )
))
(declare-datatypes ((ValueCell!259 0))(
  ( (ValueCellFull!259 (v!1474 V!1047)) (EmptyCell!259) )
))
(declare-datatypes ((array!1039 0))(
  ( (array!1040 (arr!501 (Array (_ BitVec 32) ValueCell!259)) (size!591 (_ BitVec 32))) )
))
(declare-datatypes ((array!1041 0))(
  ( (array!1042 (arr!502 (Array (_ BitVec 32) (_ BitVec 64))) (size!592 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!104 0))(
  ( (LongMapFixedSize!105 (defaultEntry!1663 Int) (mask!4596 (_ BitVec 32)) (extraKeys!1576 (_ BitVec 32)) (zeroValue!1599 V!1047) (minValue!1599 V!1047) (_size!84 (_ BitVec 32)) (_keys!3088 array!1041) (_values!1660 array!1039) (_vacant!84 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!104 0))(
  ( (Cell!105 (v!1475 LongMapFixedSize!104)) )
))
(declare-datatypes ((LongMap!104 0))(
  ( (LongMap!105 (underlying!63 Cell!104)) )
))
(declare-datatypes ((tuple2!796 0))(
  ( (tuple2!797 (_1!399 Bool) (_2!399 LongMap!104)) )
))
(declare-fun lt!4720 () tuple2!796)

(assert (=> b!18260 (= res!12771 (_1!399 lt!4720))))

(declare-fun e!11739 () tuple2!796)

(assert (=> b!18260 (= lt!4720 e!11739)))

(declare-fun c!1837 () Bool)

(declare-fun thiss!848 () LongMap!104)

(declare-fun imbalanced!29 (LongMap!104) Bool)

(assert (=> b!18260 (= c!1837 (imbalanced!29 thiss!848))))

(declare-fun e!11742 () Bool)

(declare-fun e!11735 () Bool)

(declare-fun tp_is_empty!917 () Bool)

(declare-fun array_inv!345 (array!1041) Bool)

(declare-fun array_inv!346 (array!1039) Bool)

(assert (=> b!18261 (= e!11735 (and tp!3149 tp_is_empty!917 (array_inv!345 (_keys!3088 (v!1475 (underlying!63 thiss!848)))) (array_inv!346 (_values!1660 (v!1475 (underlying!63 thiss!848)))) e!11742))))

(declare-fun b!18262 () Bool)

(declare-fun e!11734 () Bool)

(declare-fun e!11733 () Bool)

(assert (=> b!18262 (= e!11734 e!11733)))

(declare-fun mapNonEmpty!810 () Bool)

(declare-fun mapRes!810 () Bool)

(declare-fun tp!3150 () Bool)

(declare-fun e!11738 () Bool)

(assert (=> mapNonEmpty!810 (= mapRes!810 (and tp!3150 e!11738))))

(declare-fun mapRest!810 () (Array (_ BitVec 32) ValueCell!259))

(declare-fun mapKey!810 () (_ BitVec 32))

(declare-fun mapValue!810 () ValueCell!259)

(assert (=> mapNonEmpty!810 (= (arr!501 (_values!1660 (v!1475 (underlying!63 thiss!848)))) (store mapRest!810 mapKey!810 mapValue!810))))

(declare-fun b!18263 () Bool)

(declare-fun e!11731 () Bool)

(declare-datatypes ((tuple2!798 0))(
  ( (tuple2!799 (_1!400 (_ BitVec 64)) (_2!400 V!1047)) )
))
(declare-datatypes ((List!540 0))(
  ( (Nil!537) (Cons!536 (h!1102 tuple2!798) (t!3179 List!540)) )
))
(declare-datatypes ((ListLongMap!539 0))(
  ( (ListLongMap!540 (toList!285 List!540)) )
))
(declare-fun call!632 () ListLongMap!539)

(declare-fun call!631 () ListLongMap!539)

(assert (=> b!18263 (= e!11731 (not (= call!632 call!631)))))

(declare-fun mapIsEmpty!810 () Bool)

(assert (=> mapIsEmpty!810 mapRes!810))

(declare-fun b!18264 () Bool)

(declare-fun repack!24 (LongMap!104) tuple2!796)

(assert (=> b!18264 (= e!11739 (repack!24 thiss!848))))

(declare-fun b!18265 () Bool)

(assert (=> b!18265 (= e!11739 (tuple2!797 true thiss!848))))

(declare-fun b!18266 () Bool)

(assert (=> b!18266 (= e!11733 e!11735)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun e!11736 () Bool)

(declare-fun lt!4717 () ListLongMap!539)

(declare-fun b!18267 () Bool)

(declare-fun v!259 () V!1047)

(declare-fun +!37 (ListLongMap!539 tuple2!798) ListLongMap!539)

(assert (=> b!18267 (= e!11736 (not (= lt!4717 (+!37 call!631 (tuple2!799 key!682 v!259)))))))

(declare-fun bm!628 () Bool)

(declare-fun lt!4719 () LongMap!104)

(declare-fun map!355 (LongMap!104) ListLongMap!539)

(assert (=> bm!628 (= call!632 (map!355 lt!4719))))

(declare-fun res!12770 () Bool)

(assert (=> start!3046 (=> (not res!12770) (not e!11743))))

(declare-fun valid!48 (LongMap!104) Bool)

(assert (=> start!3046 (= res!12770 (valid!48 thiss!848))))

(assert (=> start!3046 e!11743))

(assert (=> start!3046 e!11734))

(assert (=> start!3046 true))

(assert (=> start!3046 tp_is_empty!917))

(declare-fun b!18268 () Bool)

(declare-fun e!11740 () Bool)

(assert (=> b!18268 (= e!11742 (and e!11740 mapRes!810))))

(declare-fun condMapEmpty!810 () Bool)

(declare-fun mapDefault!810 () ValueCell!259)

