; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13134 () Bool)

(assert start!13134)

(declare-fun b!115224 () Bool)

(declare-fun b_free!2677 () Bool)

(declare-fun b_next!2677 () Bool)

(assert (=> b!115224 (= b_free!2677 (not b_next!2677))))

(declare-fun tp!10396 () Bool)

(declare-fun b_and!7147 () Bool)

(assert (=> b!115224 (= tp!10396 b_and!7147)))

(declare-fun b!115229 () Bool)

(declare-fun b_free!2679 () Bool)

(declare-fun b_next!2679 () Bool)

(assert (=> b!115229 (= b_free!2679 (not b_next!2679))))

(declare-fun tp!10393 () Bool)

(declare-fun b_and!7149 () Bool)

(assert (=> b!115229 (= tp!10393 b_and!7149)))

(declare-fun b!115221 () Bool)

(declare-fun e!75091 () Bool)

(declare-fun tp_is_empty!2755 () Bool)

(assert (=> b!115221 (= e!75091 tp_is_empty!2755)))

(declare-fun b!115222 () Bool)

(declare-fun e!75086 () Bool)

(declare-fun e!75093 () Bool)

(assert (=> b!115222 (= e!75086 e!75093)))

(declare-fun b!115223 () Bool)

(declare-fun e!75081 () Bool)

(assert (=> b!115223 (= e!75081 tp_is_empty!2755)))

(declare-fun e!75082 () Bool)

(declare-fun e!75088 () Bool)

(declare-datatypes ((V!3321 0))(
  ( (V!3322 (val!1422 Int)) )
))
(declare-datatypes ((array!4513 0))(
  ( (array!4514 (arr!2139 (Array (_ BitVec 32) (_ BitVec 64))) (size!2399 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1034 0))(
  ( (ValueCellFull!1034 (v!3013 V!3321)) (EmptyCell!1034) )
))
(declare-datatypes ((array!4515 0))(
  ( (array!4516 (arr!2140 (Array (_ BitVec 32) ValueCell!1034)) (size!2400 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!976 0))(
  ( (LongMapFixedSize!977 (defaultEntry!2697 Int) (mask!6901 (_ BitVec 32)) (extraKeys!2486 (_ BitVec 32)) (zeroValue!2564 V!3321) (minValue!2564 V!3321) (_size!537 (_ BitVec 32)) (_keys!4419 array!4513) (_values!2680 array!4515) (_vacant!537 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!776 0))(
  ( (Cell!777 (v!3014 LongMapFixedSize!976)) )
))
(declare-datatypes ((LongMap!776 0))(
  ( (LongMap!777 (underlying!399 Cell!776)) )
))
(declare-fun thiss!992 () LongMap!776)

(declare-fun array_inv!1345 (array!4513) Bool)

(declare-fun array_inv!1346 (array!4515) Bool)

(assert (=> b!115224 (= e!75088 (and tp!10396 tp_is_empty!2755 (array_inv!1345 (_keys!4419 (v!3014 (underlying!399 thiss!992)))) (array_inv!1346 (_values!2680 (v!3014 (underlying!399 thiss!992)))) e!75082))))

(declare-fun b!115225 () Bool)

(declare-fun res!56586 () Bool)

(declare-fun e!75085 () Bool)

(assert (=> b!115225 (=> (not res!56586) (not e!75085))))

(declare-fun newMap!16 () LongMapFixedSize!976)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2510 0))(
  ( (tuple2!2511 (_1!1266 (_ BitVec 64)) (_2!1266 V!3321)) )
))
(declare-datatypes ((List!1667 0))(
  ( (Nil!1664) (Cons!1663 (h!2263 tuple2!2510) (t!5921 List!1667)) )
))
(declare-datatypes ((ListLongMap!1633 0))(
  ( (ListLongMap!1634 (toList!832 List!1667)) )
))
(declare-fun getCurrentListMap!513 (array!4513 array!4515 (_ BitVec 32) (_ BitVec 32) V!3321 V!3321 (_ BitVec 32) Int) ListLongMap!1633)

(declare-fun map!1336 (LongMapFixedSize!976) ListLongMap!1633)

(assert (=> b!115225 (= res!56586 (= (getCurrentListMap!513 (_keys!4419 (v!3014 (underlying!399 thiss!992))) (_values!2680 (v!3014 (underlying!399 thiss!992))) (mask!6901 (v!3014 (underlying!399 thiss!992))) (extraKeys!2486 (v!3014 (underlying!399 thiss!992))) (zeroValue!2564 (v!3014 (underlying!399 thiss!992))) (minValue!2564 (v!3014 (underlying!399 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2697 (v!3014 (underlying!399 thiss!992)))) (map!1336 newMap!16)))))

(declare-fun b!115226 () Bool)

(declare-fun e!75083 () Bool)

(assert (=> b!115226 (= e!75083 tp_is_empty!2755)))

(declare-fun mapNonEmpty!4197 () Bool)

(declare-fun mapRes!4197 () Bool)

(declare-fun tp!10394 () Bool)

(assert (=> mapNonEmpty!4197 (= mapRes!4197 (and tp!10394 e!75081))))

(declare-fun mapRest!4198 () (Array (_ BitVec 32) ValueCell!1034))

(declare-fun mapValue!4197 () ValueCell!1034)

(declare-fun mapKey!4198 () (_ BitVec 32))

(assert (=> mapNonEmpty!4197 (= (arr!2140 (_values!2680 (v!3014 (underlying!399 thiss!992)))) (store mapRest!4198 mapKey!4198 mapValue!4197))))

(declare-fun b!115228 () Bool)

(declare-fun res!56583 () Bool)

(assert (=> b!115228 (=> (not res!56583) (not e!75085))))

(declare-fun valid!462 (LongMapFixedSize!976) Bool)

(assert (=> b!115228 (= res!56583 (valid!462 newMap!16))))

(declare-fun mapIsEmpty!4197 () Bool)

(declare-fun mapRes!4198 () Bool)

(assert (=> mapIsEmpty!4197 mapRes!4198))

(declare-fun e!75087 () Bool)

(declare-fun e!75092 () Bool)

(assert (=> b!115229 (= e!75092 (and tp!10393 tp_is_empty!2755 (array_inv!1345 (_keys!4419 newMap!16)) (array_inv!1346 (_values!2680 newMap!16)) e!75087))))

(declare-fun b!115230 () Bool)

(declare-fun res!56585 () Bool)

(assert (=> b!115230 (=> (not res!56585) (not e!75085))))

(assert (=> b!115230 (= res!56585 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2399 (_keys!4419 (v!3014 (underlying!399 thiss!992)))))))))

(declare-fun b!115231 () Bool)

(assert (=> b!115231 (= e!75085 (and (or (= (select (arr!2139 (_keys!4419 (v!3014 (underlying!399 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2139 (_keys!4419 (v!3014 (underlying!399 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2399 (_keys!4419 (v!3014 (underlying!399 thiss!992)))))))))

(declare-fun b!115232 () Bool)

(assert (=> b!115232 (= e!75087 (and e!75091 mapRes!4198))))

(declare-fun condMapEmpty!4197 () Bool)

(declare-fun mapDefault!4198 () ValueCell!1034)

