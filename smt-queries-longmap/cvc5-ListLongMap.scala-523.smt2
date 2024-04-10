; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13128 () Bool)

(assert start!13128)

(declare-fun b!115104 () Bool)

(declare-fun b_free!2665 () Bool)

(declare-fun b_next!2665 () Bool)

(assert (=> b!115104 (= b_free!2665 (not b_next!2665))))

(declare-fun tp!10358 () Bool)

(declare-fun b_and!7135 () Bool)

(assert (=> b!115104 (= tp!10358 b_and!7135)))

(declare-fun b!115106 () Bool)

(declare-fun b_free!2667 () Bool)

(declare-fun b_next!2667 () Bool)

(assert (=> b!115106 (= b_free!2667 (not b_next!2667))))

(declare-fun tp!10359 () Bool)

(declare-fun b_and!7137 () Bool)

(assert (=> b!115106 (= tp!10359 b_and!7137)))

(declare-fun b!115093 () Bool)

(declare-fun e!74971 () Bool)

(assert (=> b!115093 (= e!74971 false)))

(declare-datatypes ((V!3313 0))(
  ( (V!3314 (val!1419 Int)) )
))
(declare-datatypes ((tuple2!2504 0))(
  ( (tuple2!2505 (_1!1263 (_ BitVec 64)) (_2!1263 V!3313)) )
))
(declare-datatypes ((List!1664 0))(
  ( (Nil!1661) (Cons!1660 (h!2260 tuple2!2504) (t!5918 List!1664)) )
))
(declare-datatypes ((ListLongMap!1627 0))(
  ( (ListLongMap!1628 (toList!829 List!1664)) )
))
(declare-fun lt!59964 () ListLongMap!1627)

(declare-datatypes ((array!4501 0))(
  ( (array!4502 (arr!2133 (Array (_ BitVec 32) (_ BitVec 64))) (size!2393 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1031 0))(
  ( (ValueCellFull!1031 (v!3007 V!3313)) (EmptyCell!1031) )
))
(declare-datatypes ((array!4503 0))(
  ( (array!4504 (arr!2134 (Array (_ BitVec 32) ValueCell!1031)) (size!2394 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!970 0))(
  ( (LongMapFixedSize!971 (defaultEntry!2694 Int) (mask!6896 (_ BitVec 32)) (extraKeys!2483 (_ BitVec 32)) (zeroValue!2561 V!3313) (minValue!2561 V!3313) (_size!534 (_ BitVec 32)) (_keys!4416 array!4501) (_values!2677 array!4503) (_vacant!534 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!970)

(declare-fun map!1331 (LongMapFixedSize!970) ListLongMap!1627)

(assert (=> b!115093 (= lt!59964 (map!1331 newMap!16))))

(declare-fun lt!59963 () ListLongMap!1627)

(declare-datatypes ((Cell!770 0))(
  ( (Cell!771 (v!3008 LongMapFixedSize!970)) )
))
(declare-datatypes ((LongMap!770 0))(
  ( (LongMap!771 (underlying!396 Cell!770)) )
))
(declare-fun thiss!992 () LongMap!770)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!510 (array!4501 array!4503 (_ BitVec 32) (_ BitVec 32) V!3313 V!3313 (_ BitVec 32) Int) ListLongMap!1627)

(assert (=> b!115093 (= lt!59963 (getCurrentListMap!510 (_keys!4416 (v!3008 (underlying!396 thiss!992))) (_values!2677 (v!3008 (underlying!396 thiss!992))) (mask!6896 (v!3008 (underlying!396 thiss!992))) (extraKeys!2483 (v!3008 (underlying!396 thiss!992))) (zeroValue!2561 (v!3008 (underlying!396 thiss!992))) (minValue!2561 (v!3008 (underlying!396 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2694 (v!3008 (underlying!396 thiss!992)))))))

(declare-fun mapIsEmpty!4179 () Bool)

(declare-fun mapRes!4179 () Bool)

(assert (=> mapIsEmpty!4179 mapRes!4179))

(declare-fun b!115094 () Bool)

(declare-fun res!56546 () Bool)

(assert (=> b!115094 (=> (not res!56546) (not e!74971))))

(assert (=> b!115094 (= res!56546 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2393 (_keys!4416 (v!3008 (underlying!396 thiss!992)))))))))

(declare-fun b!115095 () Bool)

(declare-fun e!74973 () Bool)

(declare-fun tp_is_empty!2749 () Bool)

(assert (=> b!115095 (= e!74973 tp_is_empty!2749)))

(declare-fun res!56548 () Bool)

(assert (=> start!13128 (=> (not res!56548) (not e!74971))))

(declare-fun valid!457 (LongMap!770) Bool)

(assert (=> start!13128 (= res!56548 (valid!457 thiss!992))))

(assert (=> start!13128 e!74971))

(declare-fun e!74969 () Bool)

(assert (=> start!13128 e!74969))

(assert (=> start!13128 true))

(declare-fun e!74968 () Bool)

(assert (=> start!13128 e!74968))

(declare-fun b!115096 () Bool)

(declare-fun e!74966 () Bool)

(assert (=> b!115096 (= e!74969 e!74966)))

(declare-fun b!115097 () Bool)

(declare-fun res!56547 () Bool)

(assert (=> b!115097 (=> (not res!56547) (not e!74971))))

(declare-fun valid!458 (LongMapFixedSize!970) Bool)

(assert (=> b!115097 (= res!56547 (valid!458 newMap!16))))

(declare-fun mapNonEmpty!4179 () Bool)

(declare-fun tp!10357 () Bool)

(declare-fun e!74972 () Bool)

(assert (=> mapNonEmpty!4179 (= mapRes!4179 (and tp!10357 e!74972))))

(declare-fun mapValue!4180 () ValueCell!1031)

(declare-fun mapKey!4179 () (_ BitVec 32))

(declare-fun mapRest!4180 () (Array (_ BitVec 32) ValueCell!1031))

(assert (=> mapNonEmpty!4179 (= (arr!2134 (_values!2677 (v!3008 (underlying!396 thiss!992)))) (store mapRest!4180 mapKey!4179 mapValue!4180))))

(declare-fun b!115098 () Bool)

(declare-fun e!74967 () Bool)

(declare-fun e!74976 () Bool)

(declare-fun mapRes!4180 () Bool)

(assert (=> b!115098 (= e!74967 (and e!74976 mapRes!4180))))

(declare-fun condMapEmpty!4180 () Bool)

(declare-fun mapDefault!4180 () ValueCell!1031)

