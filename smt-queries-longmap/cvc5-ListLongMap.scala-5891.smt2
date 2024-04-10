; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75912 () Bool)

(assert start!75912)

(declare-fun b!893173 () Bool)

(declare-fun b_free!15847 () Bool)

(declare-fun b_next!15847 () Bool)

(assert (=> b!893173 (= b_free!15847 (not b_next!15847))))

(declare-fun tp!55512 () Bool)

(declare-fun b_and!26109 () Bool)

(assert (=> b!893173 (= tp!55512 b_and!26109)))

(declare-fun b!893169 () Bool)

(declare-fun e!498774 () Bool)

(declare-datatypes ((array!52332 0))(
  ( (array!52333 (arr!25171 (Array (_ BitVec 32) (_ BitVec 64))) (size!25615 (_ BitVec 32))) )
))
(declare-datatypes ((V!29199 0))(
  ( (V!29200 (val!9138 Int)) )
))
(declare-datatypes ((ValueCell!8606 0))(
  ( (ValueCellFull!8606 (v!11617 V!29199)) (EmptyCell!8606) )
))
(declare-datatypes ((array!52334 0))(
  ( (array!52335 (arr!25172 (Array (_ BitVec 32) ValueCell!8606)) (size!25616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4228 0))(
  ( (LongMapFixedSize!4229 (defaultEntry!5314 Int) (mask!25840 (_ BitVec 32)) (extraKeys!5009 (_ BitVec 32)) (zeroValue!5113 V!29199) (minValue!5113 V!29199) (_size!2169 (_ BitVec 32)) (_keys!9999 array!52332) (_values!5300 array!52334) (_vacant!2169 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4228)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!452 0))(
  ( (Some!451 (v!11618 V!29199)) (None!450) )
))
(declare-fun isDefined!325 (Option!452) Bool)

(declare-datatypes ((tuple2!12012 0))(
  ( (tuple2!12013 (_1!6017 (_ BitVec 64)) (_2!6017 V!29199)) )
))
(declare-datatypes ((List!17794 0))(
  ( (Nil!17791) (Cons!17790 (h!18921 tuple2!12012) (t!25111 List!17794)) )
))
(declare-fun getValueByKey!446 (List!17794 (_ BitVec 64)) Option!452)

(declare-datatypes ((ListLongMap!10709 0))(
  ( (ListLongMap!10710 (toList!5370 List!17794)) )
))
(declare-fun map!12211 (LongMapFixedSize!4228) ListLongMap!10709)

(assert (=> b!893169 (= e!498774 (isDefined!325 (getValueByKey!446 (toList!5370 (map!12211 thiss!1181)) key!785)))))

(declare-fun b!893170 () Bool)

(declare-fun e!498771 () Bool)

(declare-fun tp_is_empty!18175 () Bool)

(assert (=> b!893170 (= e!498771 tp_is_empty!18175)))

(declare-fun res!604926 () Bool)

(declare-fun e!498773 () Bool)

(assert (=> start!75912 (=> (not res!604926) (not e!498773))))

(declare-fun valid!1634 (LongMapFixedSize!4228) Bool)

(assert (=> start!75912 (= res!604926 (valid!1634 thiss!1181))))

(assert (=> start!75912 e!498773))

(declare-fun e!498772 () Bool)

(assert (=> start!75912 e!498772))

(assert (=> start!75912 true))

(declare-fun b!893171 () Bool)

(declare-fun res!604928 () Bool)

(assert (=> b!893171 (=> res!604928 e!498774)))

(declare-fun contains!4378 (LongMapFixedSize!4228 (_ BitVec 64)) Bool)

(assert (=> b!893171 (= res!604928 (not (contains!4378 thiss!1181 key!785)))))

(declare-fun mapIsEmpty!28820 () Bool)

(declare-fun mapRes!28820 () Bool)

(assert (=> mapIsEmpty!28820 mapRes!28820))

(declare-fun b!893172 () Bool)

(assert (=> b!893172 (= e!498773 (not e!498774))))

(declare-fun res!604924 () Bool)

(assert (=> b!893172 (=> res!604924 e!498774)))

(declare-datatypes ((SeekEntryResult!8861 0))(
  ( (MissingZero!8861 (index!37815 (_ BitVec 32))) (Found!8861 (index!37816 (_ BitVec 32))) (Intermediate!8861 (undefined!9673 Bool) (index!37817 (_ BitVec 32)) (x!75929 (_ BitVec 32))) (Undefined!8861) (MissingVacant!8861 (index!37818 (_ BitVec 32))) )
))
(declare-fun lt!403552 () SeekEntryResult!8861)

(assert (=> b!893172 (= res!604924 (is-Found!8861 lt!403552))))

(declare-fun e!498769 () Bool)

(assert (=> b!893172 e!498769))

(declare-fun res!604925 () Bool)

(assert (=> b!893172 (=> res!604925 e!498769)))

(assert (=> b!893172 (= res!604925 (not (is-Found!8861 lt!403552)))))

(declare-datatypes ((Unit!30420 0))(
  ( (Unit!30421) )
))
(declare-fun lt!403551 () Unit!30420)

(declare-fun lemmaSeekEntryGivesInRangeIndex!60 (array!52332 array!52334 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64)) Unit!30420)

(assert (=> b!893172 (= lt!403551 (lemmaSeekEntryGivesInRangeIndex!60 (_keys!9999 thiss!1181) (_values!5300 thiss!1181) (mask!25840 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52332 (_ BitVec 32)) SeekEntryResult!8861)

(assert (=> b!893172 (= lt!403552 (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25840 thiss!1181)))))

(declare-fun mapNonEmpty!28820 () Bool)

(declare-fun tp!55513 () Bool)

(assert (=> mapNonEmpty!28820 (= mapRes!28820 (and tp!55513 e!498771))))

(declare-fun mapValue!28820 () ValueCell!8606)

(declare-fun mapKey!28820 () (_ BitVec 32))

(declare-fun mapRest!28820 () (Array (_ BitVec 32) ValueCell!8606))

(assert (=> mapNonEmpty!28820 (= (arr!25172 (_values!5300 thiss!1181)) (store mapRest!28820 mapKey!28820 mapValue!28820))))

(declare-fun e!498770 () Bool)

(declare-fun array_inv!19768 (array!52332) Bool)

(declare-fun array_inv!19769 (array!52334) Bool)

(assert (=> b!893173 (= e!498772 (and tp!55512 tp_is_empty!18175 (array_inv!19768 (_keys!9999 thiss!1181)) (array_inv!19769 (_values!5300 thiss!1181)) e!498770))))

(declare-fun b!893174 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893174 (= e!498769 (inRange!0 (index!37816 lt!403552) (mask!25840 thiss!1181)))))

(declare-fun b!893175 () Bool)

(declare-fun e!498768 () Bool)

(assert (=> b!893175 (= e!498770 (and e!498768 mapRes!28820))))

(declare-fun condMapEmpty!28820 () Bool)

(declare-fun mapDefault!28820 () ValueCell!8606)

