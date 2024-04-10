; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76126 () Bool)

(assert start!76126)

(declare-fun b!894418 () Bool)

(declare-fun b_free!15869 () Bool)

(declare-fun b_next!15869 () Bool)

(assert (=> b!894418 (= b_free!15869 (not b_next!15869))))

(declare-fun tp!55591 () Bool)

(declare-fun b_and!26159 () Bool)

(assert (=> b!894418 (= tp!55591 b_and!26159)))

(declare-fun b!894412 () Bool)

(declare-fun e!499573 () Bool)

(declare-datatypes ((array!52382 0))(
  ( (array!52383 (arr!25193 (Array (_ BitVec 32) (_ BitVec 64))) (size!25639 (_ BitVec 32))) )
))
(declare-datatypes ((V!29227 0))(
  ( (V!29228 (val!9149 Int)) )
))
(declare-datatypes ((ValueCell!8617 0))(
  ( (ValueCellFull!8617 (v!11638 V!29227)) (EmptyCell!8617) )
))
(declare-datatypes ((array!52384 0))(
  ( (array!52385 (arr!25194 (Array (_ BitVec 32) ValueCell!8617)) (size!25640 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4250 0))(
  ( (LongMapFixedSize!4251 (defaultEntry!5337 Int) (mask!25894 (_ BitVec 32)) (extraKeys!5033 (_ BitVec 32)) (zeroValue!5137 V!29227) (minValue!5137 V!29227) (_size!2180 (_ BitVec 32)) (_keys!10034 array!52382) (_values!5324 array!52384) (_vacant!2180 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4250)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1302 (Int (_ BitVec 64)) V!29227)

(declare-datatypes ((Option!460 0))(
  ( (Some!459 (v!11639 V!29227)) (None!458) )
))
(declare-fun get!13270 (Option!460) V!29227)

(declare-datatypes ((tuple2!12028 0))(
  ( (tuple2!12029 (_1!6025 (_ BitVec 64)) (_2!6025 V!29227)) )
))
(declare-datatypes ((List!17805 0))(
  ( (Nil!17802) (Cons!17801 (h!18934 tuple2!12028) (t!25144 List!17805)) )
))
(declare-fun getValueByKey!454 (List!17805 (_ BitVec 64)) Option!460)

(declare-datatypes ((ListLongMap!10725 0))(
  ( (ListLongMap!10726 (toList!5378 List!17805)) )
))
(declare-fun map!12225 (LongMapFixedSize!4250) ListLongMap!10725)

(assert (=> b!894412 (= e!499573 (not (= (dynLambda!1302 (defaultEntry!5337 thiss!1181) key!785) (get!13270 (getValueByKey!454 (toList!5378 (map!12225 thiss!1181)) key!785)))))))

(declare-fun mapNonEmpty!28866 () Bool)

(declare-fun mapRes!28866 () Bool)

(declare-fun tp!55592 () Bool)

(declare-fun e!499576 () Bool)

(assert (=> mapNonEmpty!28866 (= mapRes!28866 (and tp!55592 e!499576))))

(declare-fun mapRest!28866 () (Array (_ BitVec 32) ValueCell!8617))

(declare-fun mapValue!28866 () ValueCell!8617)

(declare-fun mapKey!28866 () (_ BitVec 32))

(assert (=> mapNonEmpty!28866 (= (arr!25194 (_values!5324 thiss!1181)) (store mapRest!28866 mapKey!28866 mapValue!28866))))

(declare-fun b!894413 () Bool)

(declare-fun tp_is_empty!18197 () Bool)

(assert (=> b!894413 (= e!499576 tp_is_empty!18197)))

(declare-fun b!894414 () Bool)

(declare-fun res!605347 () Bool)

(assert (=> b!894414 (=> (not res!605347) (not e!499573))))

(declare-fun contains!4392 (LongMapFixedSize!4250 (_ BitVec 64)) Bool)

(assert (=> b!894414 (= res!605347 (contains!4392 thiss!1181 key!785))))

(declare-fun res!605346 () Bool)

(assert (=> start!76126 (=> (not res!605346) (not e!499573))))

(declare-fun valid!1641 (LongMapFixedSize!4250) Bool)

(assert (=> start!76126 (= res!605346 (valid!1641 thiss!1181))))

(assert (=> start!76126 e!499573))

(declare-fun e!499575 () Bool)

(assert (=> start!76126 e!499575))

(assert (=> start!76126 true))

(declare-fun b!894415 () Bool)

(declare-fun e!499578 () Bool)

(assert (=> b!894415 (= e!499578 tp_is_empty!18197)))

(declare-fun b!894416 () Bool)

(declare-fun res!605345 () Bool)

(assert (=> b!894416 (=> (not res!605345) (not e!499573))))

(assert (=> b!894416 (= res!605345 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5033 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5033 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!28866 () Bool)

(assert (=> mapIsEmpty!28866 mapRes!28866))

(declare-fun b!894417 () Bool)

(declare-fun e!499577 () Bool)

(assert (=> b!894417 (= e!499577 (and e!499578 mapRes!28866))))

(declare-fun condMapEmpty!28866 () Bool)

(declare-fun mapDefault!28866 () ValueCell!8617)

