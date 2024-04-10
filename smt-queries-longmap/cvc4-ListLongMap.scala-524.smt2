; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13138 () Bool)

(assert start!13138)

(declare-fun b!115313 () Bool)

(declare-fun b_free!2685 () Bool)

(declare-fun b_next!2685 () Bool)

(assert (=> b!115313 (= b_free!2685 (not b_next!2685))))

(declare-fun tp!10418 () Bool)

(declare-fun b_and!7155 () Bool)

(assert (=> b!115313 (= tp!10418 b_and!7155)))

(declare-fun b!115312 () Bool)

(declare-fun b_free!2687 () Bool)

(declare-fun b_next!2687 () Bool)

(assert (=> b!115312 (= b_free!2687 (not b_next!2687))))

(declare-fun tp!10420 () Bool)

(declare-fun b_and!7157 () Bool)

(assert (=> b!115312 (= tp!10420 b_and!7157)))

(declare-fun mapNonEmpty!4209 () Bool)

(declare-fun mapRes!4209 () Bool)

(declare-fun tp!10419 () Bool)

(declare-fun e!75163 () Bool)

(assert (=> mapNonEmpty!4209 (= mapRes!4209 (and tp!10419 e!75163))))

(declare-datatypes ((V!3325 0))(
  ( (V!3326 (val!1424 Int)) )
))
(declare-datatypes ((ValueCell!1036 0))(
  ( (ValueCellFull!1036 (v!3017 V!3325)) (EmptyCell!1036) )
))
(declare-fun mapRest!4209 () (Array (_ BitVec 32) ValueCell!1036))

(declare-datatypes ((array!4521 0))(
  ( (array!4522 (arr!2143 (Array (_ BitVec 32) (_ BitVec 64))) (size!2403 (_ BitVec 32))) )
))
(declare-datatypes ((array!4523 0))(
  ( (array!4524 (arr!2144 (Array (_ BitVec 32) ValueCell!1036)) (size!2404 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!980 0))(
  ( (LongMapFixedSize!981 (defaultEntry!2699 Int) (mask!6903 (_ BitVec 32)) (extraKeys!2488 (_ BitVec 32)) (zeroValue!2566 V!3325) (minValue!2566 V!3325) (_size!539 (_ BitVec 32)) (_keys!4421 array!4521) (_values!2682 array!4523) (_vacant!539 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!980)

(declare-fun mapKey!4210 () (_ BitVec 32))

(declare-fun mapValue!4209 () ValueCell!1036)

(assert (=> mapNonEmpty!4209 (= (arr!2144 (_values!2682 newMap!16)) (store mapRest!4209 mapKey!4210 mapValue!4209))))

(declare-fun b!115311 () Bool)

(declare-fun res!56613 () Bool)

(declare-fun e!75165 () Bool)

(assert (=> b!115311 (=> (not res!56613) (not e!75165))))

(declare-datatypes ((Cell!780 0))(
  ( (Cell!781 (v!3018 LongMapFixedSize!980)) )
))
(declare-datatypes ((LongMap!780 0))(
  ( (LongMap!781 (underlying!401 Cell!780)) )
))
(declare-fun thiss!992 () LongMap!780)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2514 0))(
  ( (tuple2!2515 (_1!1268 (_ BitVec 64)) (_2!1268 V!3325)) )
))
(declare-datatypes ((List!1669 0))(
  ( (Nil!1666) (Cons!1665 (h!2265 tuple2!2514) (t!5923 List!1669)) )
))
(declare-datatypes ((ListLongMap!1637 0))(
  ( (ListLongMap!1638 (toList!834 List!1669)) )
))
(declare-fun getCurrentListMap!515 (array!4521 array!4523 (_ BitVec 32) (_ BitVec 32) V!3325 V!3325 (_ BitVec 32) Int) ListLongMap!1637)

(declare-fun map!1338 (LongMapFixedSize!980) ListLongMap!1637)

(assert (=> b!115311 (= res!56613 (= (getCurrentListMap!515 (_keys!4421 (v!3018 (underlying!401 thiss!992))) (_values!2682 (v!3018 (underlying!401 thiss!992))) (mask!6903 (v!3018 (underlying!401 thiss!992))) (extraKeys!2488 (v!3018 (underlying!401 thiss!992))) (zeroValue!2566 (v!3018 (underlying!401 thiss!992))) (minValue!2566 (v!3018 (underlying!401 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2699 (v!3018 (underlying!401 thiss!992)))) (map!1338 newMap!16)))))

(declare-fun e!75167 () Bool)

(declare-fun e!75169 () Bool)

(declare-fun tp_is_empty!2759 () Bool)

(declare-fun array_inv!1349 (array!4521) Bool)

(declare-fun array_inv!1350 (array!4523) Bool)

(assert (=> b!115312 (= e!75167 (and tp!10420 tp_is_empty!2759 (array_inv!1349 (_keys!4421 newMap!16)) (array_inv!1350 (_values!2682 newMap!16)) e!75169))))

(declare-fun e!75170 () Bool)

(declare-fun e!75164 () Bool)

(assert (=> b!115313 (= e!75170 (and tp!10418 tp_is_empty!2759 (array_inv!1349 (_keys!4421 (v!3018 (underlying!401 thiss!992)))) (array_inv!1350 (_values!2682 (v!3018 (underlying!401 thiss!992)))) e!75164))))

(declare-fun b!115314 () Bool)

(declare-fun e!75162 () Bool)

(assert (=> b!115314 (= e!75162 tp_is_empty!2759)))

(declare-fun mapIsEmpty!4209 () Bool)

(declare-fun mapRes!4210 () Bool)

(assert (=> mapIsEmpty!4209 mapRes!4210))

(declare-fun b!115315 () Bool)

(declare-fun e!75160 () Bool)

(assert (=> b!115315 (= e!75164 (and e!75160 mapRes!4210))))

(declare-fun condMapEmpty!4210 () Bool)

(declare-fun mapDefault!4209 () ValueCell!1036)

