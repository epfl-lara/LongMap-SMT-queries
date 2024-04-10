; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11312 () Bool)

(assert start!11312)

(declare-fun b!93545 () Bool)

(declare-fun b_free!2377 () Bool)

(declare-fun b_next!2377 () Bool)

(assert (=> b!93545 (= b_free!2377 (not b_next!2377))))

(declare-fun tp!9393 () Bool)

(declare-fun b_and!5703 () Bool)

(assert (=> b!93545 (= tp!9393 b_and!5703)))

(declare-fun b!93546 () Bool)

(declare-fun b_free!2379 () Bool)

(declare-fun b_next!2379 () Bool)

(assert (=> b!93546 (= b_free!2379 (not b_next!2379))))

(declare-fun tp!9396 () Bool)

(declare-fun b_and!5705 () Bool)

(assert (=> b!93546 (= tp!9396 b_and!5705)))

(declare-fun b!93543 () Bool)

(declare-fun res!47470 () Bool)

(declare-fun e!61059 () Bool)

(assert (=> b!93543 (=> (not res!47470) (not e!61059))))

(declare-datatypes ((V!3121 0))(
  ( (V!3122 (val!1347 Int)) )
))
(declare-datatypes ((array!4183 0))(
  ( (array!4184 (arr!1989 (Array (_ BitVec 32) (_ BitVec 64))) (size!2237 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!959 0))(
  ( (ValueCellFull!959 (v!2751 V!3121)) (EmptyCell!959) )
))
(declare-datatypes ((array!4185 0))(
  ( (array!4186 (arr!1990 (Array (_ BitVec 32) ValueCell!959)) (size!2238 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!826 0))(
  ( (LongMapFixedSize!827 (defaultEntry!2430 Int) (mask!6502 (_ BitVec 32)) (extraKeys!2259 (_ BitVec 32)) (zeroValue!2317 V!3121) (minValue!2317 V!3121) (_size!462 (_ BitVec 32)) (_keys!4112 array!4183) (_values!2413 array!4185) (_vacant!462 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!826)

(declare-datatypes ((Cell!626 0))(
  ( (Cell!627 (v!2752 LongMapFixedSize!826)) )
))
(declare-datatypes ((LongMap!626 0))(
  ( (LongMap!627 (underlying!324 Cell!626)) )
))
(declare-fun thiss!992 () LongMap!626)

(assert (=> b!93543 (= res!47470 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6502 newMap!16)) (_size!462 (v!2752 (underlying!324 thiss!992)))))))

(declare-fun res!47472 () Bool)

(assert (=> start!11312 (=> (not res!47472) (not e!61059))))

(declare-fun valid!368 (LongMap!626) Bool)

(assert (=> start!11312 (= res!47472 (valid!368 thiss!992))))

(assert (=> start!11312 e!61059))

(declare-fun e!61069 () Bool)

(assert (=> start!11312 e!61069))

(assert (=> start!11312 true))

(declare-fun e!61056 () Bool)

(assert (=> start!11312 e!61056))

(declare-fun b!93544 () Bool)

(declare-fun e!61063 () Bool)

(declare-fun tp_is_empty!2605 () Bool)

(assert (=> b!93544 (= e!61063 tp_is_empty!2605)))

(declare-fun e!61060 () Bool)

(declare-fun e!61055 () Bool)

(declare-fun array_inv!1235 (array!4183) Bool)

(declare-fun array_inv!1236 (array!4185) Bool)

(assert (=> b!93545 (= e!61060 (and tp!9393 tp_is_empty!2605 (array_inv!1235 (_keys!4112 (v!2752 (underlying!324 thiss!992)))) (array_inv!1236 (_values!2413 (v!2752 (underlying!324 thiss!992)))) e!61055))))

(declare-fun e!61064 () Bool)

(assert (=> b!93546 (= e!61056 (and tp!9396 tp_is_empty!2605 (array_inv!1235 (_keys!4112 newMap!16)) (array_inv!1236 (_values!2413 newMap!16)) e!61064))))

(declare-fun b!93547 () Bool)

(declare-fun e!61058 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!93547 (= e!61058 (not (validMask!0 (mask!6502 (v!2752 (underlying!324 thiss!992))))))))

(declare-fun b!93548 () Bool)

(declare-fun e!61068 () Bool)

(assert (=> b!93548 (= e!61068 tp_is_empty!2605)))

(declare-fun b!93549 () Bool)

(declare-fun e!61057 () Bool)

(assert (=> b!93549 (= e!61059 e!61057)))

(declare-fun res!47468 () Bool)

(assert (=> b!93549 (=> (not res!47468) (not e!61057))))

(declare-datatypes ((tuple2!2300 0))(
  ( (tuple2!2301 (_1!1161 (_ BitVec 64)) (_2!1161 V!3121)) )
))
(declare-datatypes ((List!1563 0))(
  ( (Nil!1560) (Cons!1559 (h!2151 tuple2!2300) (t!5449 List!1563)) )
))
(declare-datatypes ((ListLongMap!1513 0))(
  ( (ListLongMap!1514 (toList!772 List!1563)) )
))
(declare-fun lt!46329 () ListLongMap!1513)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!46326 () ListLongMap!1513)

(assert (=> b!93549 (= res!47468 (and (= lt!46326 lt!46329) (not (= (select (arr!1989 (_keys!4112 (v!2752 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1989 (_keys!4112 (v!2752 (underlying!324 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1237 (LongMapFixedSize!826) ListLongMap!1513)

(assert (=> b!93549 (= lt!46329 (map!1237 newMap!16))))

(declare-fun getCurrentListMap!464 (array!4183 array!4185 (_ BitVec 32) (_ BitVec 32) V!3121 V!3121 (_ BitVec 32) Int) ListLongMap!1513)

(assert (=> b!93549 (= lt!46326 (getCurrentListMap!464 (_keys!4112 (v!2752 (underlying!324 thiss!992))) (_values!2413 (v!2752 (underlying!324 thiss!992))) (mask!6502 (v!2752 (underlying!324 thiss!992))) (extraKeys!2259 (v!2752 (underlying!324 thiss!992))) (zeroValue!2317 (v!2752 (underlying!324 thiss!992))) (minValue!2317 (v!2752 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2430 (v!2752 (underlying!324 thiss!992)))))))

(declare-fun mapIsEmpty!3647 () Bool)

(declare-fun mapRes!3648 () Bool)

(assert (=> mapIsEmpty!3647 mapRes!3648))

(declare-fun mapIsEmpty!3648 () Bool)

(declare-fun mapRes!3647 () Bool)

(assert (=> mapIsEmpty!3648 mapRes!3647))

(declare-fun b!93550 () Bool)

(assert (=> b!93550 (= e!61064 (and e!61063 mapRes!3647))))

(declare-fun condMapEmpty!3647 () Bool)

(declare-fun mapDefault!3648 () ValueCell!959)

