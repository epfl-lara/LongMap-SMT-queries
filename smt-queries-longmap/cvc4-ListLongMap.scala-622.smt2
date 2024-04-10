; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16084 () Bool)

(assert start!16084)

(declare-fun b!159793 () Bool)

(declare-fun b_free!3545 () Bool)

(declare-fun b_next!3545 () Bool)

(assert (=> b!159793 (= b_free!3545 (not b_next!3545))))

(declare-fun tp!13205 () Bool)

(declare-fun b_and!9959 () Bool)

(assert (=> b!159793 (= tp!13205 b_and!9959)))

(declare-fun mapNonEmpty!5708 () Bool)

(declare-fun mapRes!5708 () Bool)

(declare-fun tp!13204 () Bool)

(declare-fun e!104554 () Bool)

(assert (=> mapNonEmpty!5708 (= mapRes!5708 (and tp!13204 e!104554))))

(declare-datatypes ((V!4109 0))(
  ( (V!4110 (val!1718 Int)) )
))
(declare-datatypes ((ValueCell!1330 0))(
  ( (ValueCellFull!1330 (v!3583 V!4109)) (EmptyCell!1330) )
))
(declare-fun mapRest!5708 () (Array (_ BitVec 32) ValueCell!1330))

(declare-fun mapValue!5708 () ValueCell!1330)

(declare-datatypes ((array!5773 0))(
  ( (array!5774 (arr!2731 (Array (_ BitVec 32) (_ BitVec 64))) (size!3015 (_ BitVec 32))) )
))
(declare-datatypes ((array!5775 0))(
  ( (array!5776 (arr!2732 (Array (_ BitVec 32) ValueCell!1330)) (size!3016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1568 0))(
  ( (LongMapFixedSize!1569 (defaultEntry!3226 Int) (mask!7782 (_ BitVec 32)) (extraKeys!2967 (_ BitVec 32)) (zeroValue!3069 V!4109) (minValue!3069 V!4109) (_size!833 (_ BitVec 32)) (_keys!5027 array!5773) (_values!3209 array!5775) (_vacant!833 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1568)

(declare-fun mapKey!5708 () (_ BitVec 32))

(assert (=> mapNonEmpty!5708 (= (arr!2732 (_values!3209 thiss!1248)) (store mapRest!5708 mapKey!5708 mapValue!5708))))

(declare-fun b!159792 () Bool)

(declare-fun tp_is_empty!3347 () Bool)

(assert (=> b!159792 (= e!104554 tp_is_empty!3347)))

(declare-fun e!104552 () Bool)

(declare-fun e!104556 () Bool)

(declare-fun array_inv!1737 (array!5773) Bool)

(declare-fun array_inv!1738 (array!5775) Bool)

(assert (=> b!159793 (= e!104552 (and tp!13205 tp_is_empty!3347 (array_inv!1737 (_keys!5027 thiss!1248)) (array_inv!1738 (_values!3209 thiss!1248)) e!104556))))

(declare-fun b!159794 () Bool)

(declare-fun res!75558 () Bool)

(declare-fun e!104553 () Bool)

(assert (=> b!159794 (=> (not res!75558) (not e!104553))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2898 0))(
  ( (tuple2!2899 (_1!1460 (_ BitVec 64)) (_2!1460 V!4109)) )
))
(declare-datatypes ((List!1920 0))(
  ( (Nil!1917) (Cons!1916 (h!2529 tuple2!2898) (t!6722 List!1920)) )
))
(declare-datatypes ((ListLongMap!1885 0))(
  ( (ListLongMap!1886 (toList!958 List!1920)) )
))
(declare-fun contains!994 (ListLongMap!1885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!622 (array!5773 array!5775 (_ BitVec 32) (_ BitVec 32) V!4109 V!4109 (_ BitVec 32) Int) ListLongMap!1885)

(assert (=> b!159794 (= res!75558 (contains!994 (getCurrentListMap!622 (_keys!5027 thiss!1248) (_values!3209 thiss!1248) (mask!7782 thiss!1248) (extraKeys!2967 thiss!1248) (zeroValue!3069 thiss!1248) (minValue!3069 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3226 thiss!1248)) key!828))))

(declare-fun res!75556 () Bool)

(assert (=> start!16084 (=> (not res!75556) (not e!104553))))

(declare-fun valid!731 (LongMapFixedSize!1568) Bool)

(assert (=> start!16084 (= res!75556 (valid!731 thiss!1248))))

(assert (=> start!16084 e!104553))

(assert (=> start!16084 e!104552))

(assert (=> start!16084 true))

(declare-fun b!159795 () Bool)

(declare-fun e!104555 () Bool)

(assert (=> b!159795 (= e!104556 (and e!104555 mapRes!5708))))

(declare-fun condMapEmpty!5708 () Bool)

(declare-fun mapDefault!5708 () ValueCell!1330)

