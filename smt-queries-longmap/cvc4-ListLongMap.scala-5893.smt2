; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76034 () Bool)

(assert start!76034)

(declare-fun b!893906 () Bool)

(declare-fun b_free!15863 () Bool)

(declare-fun b_next!15863 () Bool)

(assert (=> b!893906 (= b_free!15863 (not b_next!15863))))

(declare-fun tp!55568 () Bool)

(declare-fun b_and!26141 () Bool)

(assert (=> b!893906 (= tp!55568 b_and!26141)))

(declare-fun b!893900 () Bool)

(declare-fun e!499256 () Bool)

(declare-fun tp_is_empty!18191 () Bool)

(assert (=> b!893900 (= e!499256 tp_is_empty!18191)))

(declare-fun b!893901 () Bool)

(declare-fun e!499254 () Bool)

(declare-datatypes ((array!52368 0))(
  ( (array!52369 (arr!25187 (Array (_ BitVec 32) (_ BitVec 64))) (size!25632 (_ BitVec 32))) )
))
(declare-datatypes ((V!29219 0))(
  ( (V!29220 (val!9146 Int)) )
))
(declare-datatypes ((ValueCell!8614 0))(
  ( (ValueCellFull!8614 (v!11632 V!29219)) (EmptyCell!8614) )
))
(declare-datatypes ((array!52370 0))(
  ( (array!52371 (arr!25188 (Array (_ BitVec 32) ValueCell!8614)) (size!25633 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4244 0))(
  ( (LongMapFixedSize!4245 (defaultEntry!5328 Int) (mask!25872 (_ BitVec 32)) (extraKeys!5024 (_ BitVec 32)) (zeroValue!5128 V!29219) (minValue!5128 V!29219) (_size!2177 (_ BitVec 32)) (_keys!10020 array!52368) (_values!5315 array!52370) (_vacant!2177 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4244)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1300 (Int (_ BitVec 64)) V!29219)

(assert (=> b!893901 (= e!499254 (not (= (minValue!5128 thiss!1181) (dynLambda!1300 (defaultEntry!5328 thiss!1181) key!785))))))

(declare-fun b!893902 () Bool)

(declare-fun res!605162 () Bool)

(declare-fun e!499255 () Bool)

(assert (=> b!893902 (=> (not res!605162) (not e!499255))))

(assert (=> b!893902 (= res!605162 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5024 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5024 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893904 () Bool)

(declare-datatypes ((Option!458 0))(
  ( (Some!457 (v!11633 V!29219)) (None!456) )
))
(declare-fun get!13263 (Option!458) V!29219)

(declare-datatypes ((tuple2!12024 0))(
  ( (tuple2!12025 (_1!6023 (_ BitVec 64)) (_2!6023 V!29219)) )
))
(declare-datatypes ((List!17802 0))(
  ( (Nil!17799) (Cons!17798 (h!18930 tuple2!12024) (t!25133 List!17802)) )
))
(declare-fun getValueByKey!452 (List!17802 (_ BitVec 64)) Option!458)

(declare-datatypes ((ListLongMap!10721 0))(
  ( (ListLongMap!10722 (toList!5376 List!17802)) )
))
(declare-fun map!12221 (LongMapFixedSize!4244) ListLongMap!10721)

(assert (=> b!893904 (= e!499254 (not (= (minValue!5128 thiss!1181) (get!13263 (getValueByKey!452 (toList!5376 (map!12221 thiss!1181)) key!785)))))))

(declare-fun b!893905 () Bool)

(assert (=> b!893905 (= e!499255 e!499254)))

(declare-fun c!94243 () Bool)

(declare-fun contains!4387 (LongMapFixedSize!4244 (_ BitVec 64)) Bool)

(assert (=> b!893905 (= c!94243 (contains!4387 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28852 () Bool)

(declare-fun mapRes!28852 () Bool)

(assert (=> mapIsEmpty!28852 mapRes!28852))

(declare-fun e!499257 () Bool)

(declare-fun e!499252 () Bool)

(declare-fun array_inv!19778 (array!52368) Bool)

(declare-fun array_inv!19779 (array!52370) Bool)

(assert (=> b!893906 (= e!499257 (and tp!55568 tp_is_empty!18191 (array_inv!19778 (_keys!10020 thiss!1181)) (array_inv!19779 (_values!5315 thiss!1181)) e!499252))))

(declare-fun res!605163 () Bool)

(assert (=> start!76034 (=> (not res!605163) (not e!499255))))

(declare-fun valid!1639 (LongMapFixedSize!4244) Bool)

(assert (=> start!76034 (= res!605163 (valid!1639 thiss!1181))))

(assert (=> start!76034 e!499255))

(assert (=> start!76034 e!499257))

(assert (=> start!76034 true))

(declare-fun b!893903 () Bool)

(declare-fun e!499251 () Bool)

(assert (=> b!893903 (= e!499251 tp_is_empty!18191)))

(declare-fun mapNonEmpty!28852 () Bool)

(declare-fun tp!55569 () Bool)

(assert (=> mapNonEmpty!28852 (= mapRes!28852 (and tp!55569 e!499251))))

(declare-fun mapRest!28852 () (Array (_ BitVec 32) ValueCell!8614))

(declare-fun mapKey!28852 () (_ BitVec 32))

(declare-fun mapValue!28852 () ValueCell!8614)

(assert (=> mapNonEmpty!28852 (= (arr!25188 (_values!5315 thiss!1181)) (store mapRest!28852 mapKey!28852 mapValue!28852))))

(declare-fun b!893907 () Bool)

(assert (=> b!893907 (= e!499252 (and e!499256 mapRes!28852))))

(declare-fun condMapEmpty!28852 () Bool)

(declare-fun mapDefault!28852 () ValueCell!8614)

