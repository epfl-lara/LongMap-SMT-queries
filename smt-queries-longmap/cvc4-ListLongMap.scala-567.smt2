; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15458 () Bool)

(assert start!15458)

(declare-fun b!153661 () Bool)

(declare-fun b_free!3201 () Bool)

(declare-fun b_next!3201 () Bool)

(assert (=> b!153661 (= b_free!3201 (not b_next!3201))))

(declare-fun tp!12121 () Bool)

(declare-fun b_and!9563 () Bool)

(assert (=> b!153661 (= tp!12121 b_and!9563)))

(declare-fun b!153663 () Bool)

(declare-fun b_free!3203 () Bool)

(declare-fun b_next!3203 () Bool)

(assert (=> b!153663 (= b_free!3203 (not b_next!3203))))

(declare-fun tp!12122 () Bool)

(declare-fun b_and!9565 () Bool)

(assert (=> b!153663 (= tp!12122 b_and!9565)))

(declare-fun b!153653 () Bool)

(declare-fun e!100352 () Bool)

(declare-fun e!100349 () Bool)

(assert (=> b!153653 (= e!100352 e!100349)))

(declare-fun b!153654 () Bool)

(declare-fun res!72605 () Bool)

(declare-fun e!100356 () Bool)

(assert (=> b!153654 (=> (not res!72605) (not e!100356))))

(declare-datatypes ((V!3669 0))(
  ( (V!3670 (val!1553 Int)) )
))
(declare-datatypes ((array!5083 0))(
  ( (array!5084 (arr!2401 (Array (_ BitVec 32) (_ BitVec 64))) (size!2678 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1165 0))(
  ( (ValueCellFull!1165 (v!3408 V!3669)) (EmptyCell!1165) )
))
(declare-datatypes ((array!5085 0))(
  ( (array!5086 (arr!2402 (Array (_ BitVec 32) ValueCell!1165)) (size!2679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1238 0))(
  ( (LongMapFixedSize!1239 (defaultEntry!3058 Int) (mask!7458 (_ BitVec 32)) (extraKeys!2799 (_ BitVec 32)) (zeroValue!2901 V!3669) (minValue!2901 V!3669) (_size!668 (_ BitVec 32)) (_keys!4831 array!5083) (_values!3041 array!5085) (_vacant!668 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1238)

(declare-datatypes ((Cell!1020 0))(
  ( (Cell!1021 (v!3409 LongMapFixedSize!1238)) )
))
(declare-datatypes ((LongMap!1020 0))(
  ( (LongMap!1021 (underlying!521 Cell!1020)) )
))
(declare-fun thiss!992 () LongMap!1020)

(assert (=> b!153654 (= res!72605 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7458 newMap!16)) (_size!668 (v!3409 (underlying!521 thiss!992)))))))

(declare-fun b!153655 () Bool)

(declare-fun e!100359 () Bool)

(assert (=> b!153655 (= e!100359 e!100352)))

(declare-fun b!153656 () Bool)

(declare-fun e!100353 () Bool)

(declare-fun tp_is_empty!3017 () Bool)

(assert (=> b!153656 (= e!100353 tp_is_empty!3017)))

(declare-fun b!153657 () Bool)

(declare-fun res!72606 () Bool)

(assert (=> b!153657 (=> (not res!72606) (not e!100356))))

(declare-fun valid!609 (LongMapFixedSize!1238) Bool)

(assert (=> b!153657 (= res!72606 (valid!609 newMap!16))))

(declare-fun b!153658 () Bool)

(declare-fun e!100360 () Bool)

(assert (=> b!153658 (= e!100360 tp_is_empty!3017)))

(declare-fun mapIsEmpty!5137 () Bool)

(declare-fun mapRes!5137 () Bool)

(assert (=> mapIsEmpty!5137 mapRes!5137))

(declare-fun b!153659 () Bool)

(declare-fun e!100354 () Bool)

(assert (=> b!153659 (= e!100354 tp_is_empty!3017)))

(declare-fun b!153660 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153660 (= e!100356 (and (or (= (select (arr!2401 (_keys!4831 (v!3409 (underlying!521 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2401 (_keys!4831 (v!3409 (underlying!521 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) from!355)))))

(declare-fun mapNonEmpty!5137 () Bool)

(declare-fun mapRes!5138 () Bool)

(declare-fun tp!12120 () Bool)

(assert (=> mapNonEmpty!5137 (= mapRes!5138 (and tp!12120 e!100353))))

(declare-fun mapValue!5138 () ValueCell!1165)

(declare-fun mapRest!5137 () (Array (_ BitVec 32) ValueCell!1165))

(declare-fun mapKey!5137 () (_ BitVec 32))

(assert (=> mapNonEmpty!5137 (= (arr!2402 (_values!3041 newMap!16)) (store mapRest!5137 mapKey!5137 mapValue!5138))))

(declare-fun e!100357 () Bool)

(declare-fun array_inv!1515 (array!5083) Bool)

(declare-fun array_inv!1516 (array!5085) Bool)

(assert (=> b!153661 (= e!100349 (and tp!12121 tp_is_empty!3017 (array_inv!1515 (_keys!4831 (v!3409 (underlying!521 thiss!992)))) (array_inv!1516 (_values!3041 (v!3409 (underlying!521 thiss!992)))) e!100357))))

(declare-fun mapIsEmpty!5138 () Bool)

(assert (=> mapIsEmpty!5138 mapRes!5138))

(declare-fun mapNonEmpty!5138 () Bool)

(declare-fun tp!12119 () Bool)

(assert (=> mapNonEmpty!5138 (= mapRes!5137 (and tp!12119 e!100360))))

(declare-fun mapValue!5137 () ValueCell!1165)

(declare-fun mapKey!5138 () (_ BitVec 32))

(declare-fun mapRest!5138 () (Array (_ BitVec 32) ValueCell!1165))

(assert (=> mapNonEmpty!5138 (= (arr!2402 (_values!3041 (v!3409 (underlying!521 thiss!992)))) (store mapRest!5138 mapKey!5138 mapValue!5137))))

(declare-fun b!153662 () Bool)

(declare-fun res!72602 () Bool)

(assert (=> b!153662 (=> (not res!72602) (not e!100356))))

(declare-datatypes ((tuple2!2820 0))(
  ( (tuple2!2821 (_1!1421 (_ BitVec 64)) (_2!1421 V!3669)) )
))
(declare-datatypes ((List!1803 0))(
  ( (Nil!1800) (Cons!1799 (h!2408 tuple2!2820) (t!6593 List!1803)) )
))
(declare-datatypes ((ListLongMap!1811 0))(
  ( (ListLongMap!1812 (toList!921 List!1803)) )
))
(declare-fun getCurrentListMap!586 (array!5083 array!5085 (_ BitVec 32) (_ BitVec 32) V!3669 V!3669 (_ BitVec 32) Int) ListLongMap!1811)

(declare-fun map!1496 (LongMapFixedSize!1238) ListLongMap!1811)

(assert (=> b!153662 (= res!72602 (= (getCurrentListMap!586 (_keys!4831 (v!3409 (underlying!521 thiss!992))) (_values!3041 (v!3409 (underlying!521 thiss!992))) (mask!7458 (v!3409 (underlying!521 thiss!992))) (extraKeys!2799 (v!3409 (underlying!521 thiss!992))) (zeroValue!2901 (v!3409 (underlying!521 thiss!992))) (minValue!2901 (v!3409 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3058 (v!3409 (underlying!521 thiss!992)))) (map!1496 newMap!16)))))

(declare-fun e!100351 () Bool)

(declare-fun e!100361 () Bool)

(assert (=> b!153663 (= e!100361 (and tp!12122 tp_is_empty!3017 (array_inv!1515 (_keys!4831 newMap!16)) (array_inv!1516 (_values!3041 newMap!16)) e!100351))))

(declare-fun b!153664 () Bool)

(declare-fun e!100355 () Bool)

(assert (=> b!153664 (= e!100355 tp_is_empty!3017)))

(declare-fun res!72603 () Bool)

(assert (=> start!15458 (=> (not res!72603) (not e!100356))))

(declare-fun valid!610 (LongMap!1020) Bool)

(assert (=> start!15458 (= res!72603 (valid!610 thiss!992))))

(assert (=> start!15458 e!100356))

(assert (=> start!15458 e!100359))

(assert (=> start!15458 true))

(assert (=> start!15458 e!100361))

(declare-fun b!153665 () Bool)

(assert (=> b!153665 (= e!100357 (and e!100355 mapRes!5137))))

(declare-fun condMapEmpty!5137 () Bool)

(declare-fun mapDefault!5138 () ValueCell!1165)

