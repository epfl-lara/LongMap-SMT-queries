; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12192 () Bool)

(assert start!12192)

(declare-fun b!103235 () Bool)

(declare-fun b_free!2517 () Bool)

(declare-fun b_next!2517 () Bool)

(assert (=> b!103235 (= b_free!2517 (not b_next!2517))))

(declare-fun tp!9868 () Bool)

(declare-fun b_and!6395 () Bool)

(assert (=> b!103235 (= tp!9868 b_and!6395)))

(declare-fun b!103240 () Bool)

(declare-fun b_free!2519 () Bool)

(declare-fun b_next!2519 () Bool)

(assert (=> b!103240 (= b_free!2519 (not b_next!2519))))

(declare-fun tp!9867 () Bool)

(declare-fun b_and!6397 () Bool)

(assert (=> b!103240 (= tp!9867 b_and!6397)))

(declare-fun b!103230 () Bool)

(declare-fun e!67281 () Bool)

(declare-fun e!67284 () Bool)

(assert (=> b!103230 (= e!67281 (not e!67284))))

(declare-fun res!51567 () Bool)

(assert (=> b!103230 (=> res!51567 e!67284)))

(declare-datatypes ((V!3213 0))(
  ( (V!3214 (val!1382 Int)) )
))
(declare-datatypes ((array!4339 0))(
  ( (array!4340 (arr!2059 (Array (_ BitVec 32) (_ BitVec 64))) (size!2313 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!994 0))(
  ( (ValueCellFull!994 (v!2877 V!3213)) (EmptyCell!994) )
))
(declare-datatypes ((array!4341 0))(
  ( (array!4342 (arr!2060 (Array (_ BitVec 32) ValueCell!994)) (size!2314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!896 0))(
  ( (LongMapFixedSize!897 (defaultEntry!2562 Int) (mask!6698 (_ BitVec 32)) (extraKeys!2371 (_ BitVec 32)) (zeroValue!2439 V!3213) (minValue!2439 V!3213) (_size!497 (_ BitVec 32)) (_keys!4264 array!4339) (_values!2545 array!4341) (_vacant!497 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!696 0))(
  ( (Cell!697 (v!2878 LongMapFixedSize!896)) )
))
(declare-datatypes ((LongMap!696 0))(
  ( (LongMap!697 (underlying!359 Cell!696)) )
))
(declare-fun thiss!992 () LongMap!696)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!103230 (= res!51567 (not (validMask!0 (mask!6698 (v!2878 (underlying!359 thiss!992))))))))

(declare-datatypes ((tuple2!2404 0))(
  ( (tuple2!2405 (_1!1213 (_ BitVec 64)) (_2!1213 V!3213)) )
))
(declare-datatypes ((List!1612 0))(
  ( (Nil!1609) (Cons!1608 (h!2204 tuple2!2404) (t!5678 List!1612)) )
))
(declare-datatypes ((ListLongMap!1571 0))(
  ( (ListLongMap!1572 (toList!801 List!1612)) )
))
(declare-fun lt!52574 () ListLongMap!1571)

(declare-fun lt!52576 () tuple2!2404)

(declare-fun lt!52571 () tuple2!2404)

(declare-fun +!142 (ListLongMap!1571 tuple2!2404) ListLongMap!1571)

(assert (=> b!103230 (= (+!142 (+!142 lt!52574 lt!52576) lt!52571) (+!142 (+!142 lt!52574 lt!52571) lt!52576))))

(assert (=> b!103230 (= lt!52571 (tuple2!2405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2439 (v!2878 (underlying!359 thiss!992)))))))

(declare-fun lt!52578 () V!3213)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!103230 (= lt!52576 (tuple2!2405 (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) lt!52578))))

(declare-datatypes ((Unit!3154 0))(
  ( (Unit!3155) )
))
(declare-fun lt!52572 () Unit!3154)

(declare-fun addCommutativeForDiffKeys!54 (ListLongMap!1571 (_ BitVec 64) V!3213 (_ BitVec 64) V!3213) Unit!3154)

(assert (=> b!103230 (= lt!52572 (addCommutativeForDiffKeys!54 lt!52574 (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) lt!52578 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2439 (v!2878 (underlying!359 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!108 (array!4339 array!4341 (_ BitVec 32) (_ BitVec 32) V!3213 V!3213 (_ BitVec 32) Int) ListLongMap!1571)

(assert (=> b!103230 (= lt!52574 (getCurrentListMapNoExtraKeys!108 (_keys!4264 (v!2878 (underlying!359 thiss!992))) (_values!2545 (v!2878 (underlying!359 thiss!992))) (mask!6698 (v!2878 (underlying!359 thiss!992))) (extraKeys!2371 (v!2878 (underlying!359 thiss!992))) (zeroValue!2439 (v!2878 (underlying!359 thiss!992))) (minValue!2439 (v!2878 (underlying!359 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2562 (v!2878 (underlying!359 thiss!992)))))))

(declare-fun b!103231 () Bool)

(declare-fun e!67294 () Bool)

(declare-fun tp_is_empty!2675 () Bool)

(assert (=> b!103231 (= e!67294 tp_is_empty!2675)))

(declare-fun b!103232 () Bool)

(declare-fun e!67283 () Unit!3154)

(declare-fun Unit!3156 () Unit!3154)

(assert (=> b!103232 (= e!67283 Unit!3156)))

(declare-fun lt!52568 () Unit!3154)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!103 (array!4339 array!4341 (_ BitVec 32) (_ BitVec 32) V!3213 V!3213 (_ BitVec 64) (_ BitVec 32) Int) Unit!3154)

(assert (=> b!103232 (= lt!52568 (lemmaListMapContainsThenArrayContainsFrom!103 (_keys!4264 (v!2878 (underlying!359 thiss!992))) (_values!2545 (v!2878 (underlying!359 thiss!992))) (mask!6698 (v!2878 (underlying!359 thiss!992))) (extraKeys!2371 (v!2878 (underlying!359 thiss!992))) (zeroValue!2439 (v!2878 (underlying!359 thiss!992))) (minValue!2439 (v!2878 (underlying!359 thiss!992))) (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2562 (v!2878 (underlying!359 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!103232 (arrayContainsKey!0 (_keys!4264 (v!2878 (underlying!359 thiss!992))) (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52573 () Unit!3154)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4339 (_ BitVec 32) (_ BitVec 32)) Unit!3154)

(assert (=> b!103232 (= lt!52573 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4264 (v!2878 (underlying!359 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1613 0))(
  ( (Nil!1610) (Cons!1609 (h!2205 (_ BitVec 64)) (t!5679 List!1613)) )
))
(declare-fun arrayNoDuplicates!0 (array!4339 (_ BitVec 32) List!1613) Bool)

(assert (=> b!103232 (arrayNoDuplicates!0 (_keys!4264 (v!2878 (underlying!359 thiss!992))) from!355 Nil!1610)))

(declare-fun lt!52577 () Unit!3154)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4339 (_ BitVec 32) (_ BitVec 64) List!1613) Unit!3154)

(assert (=> b!103232 (= lt!52577 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4264 (v!2878 (underlying!359 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) (Cons!1609 (select (arr!2059 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) from!355) Nil!1610)))))

(assert (=> b!103232 false))

(declare-fun b!103233 () Bool)

(declare-fun e!67279 () Bool)

(declare-fun e!67282 () Bool)

(assert (=> b!103233 (= e!67279 e!67282)))

(declare-fun mapNonEmpty!3909 () Bool)

(declare-fun mapRes!3909 () Bool)

(declare-fun tp!9865 () Bool)

(assert (=> mapNonEmpty!3909 (= mapRes!3909 (and tp!9865 e!67294))))

(declare-fun mapKey!3910 () (_ BitVec 32))

(declare-fun mapValue!3909 () ValueCell!994)

(declare-fun mapRest!3910 () (Array (_ BitVec 32) ValueCell!994))

(assert (=> mapNonEmpty!3909 (= (arr!2060 (_values!2545 (v!2878 (underlying!359 thiss!992)))) (store mapRest!3910 mapKey!3910 mapValue!3909))))

(declare-fun b!103234 () Bool)

(assert (=> b!103234 (= e!67284 (= (size!2314 (_values!2545 (v!2878 (underlying!359 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6698 (v!2878 (underlying!359 thiss!992))))))))

(declare-fun e!67288 () Bool)

(declare-fun array_inv!1295 (array!4339) Bool)

(declare-fun array_inv!1296 (array!4341) Bool)

(assert (=> b!103235 (= e!67282 (and tp!9868 tp_is_empty!2675 (array_inv!1295 (_keys!4264 (v!2878 (underlying!359 thiss!992)))) (array_inv!1296 (_values!2545 (v!2878 (underlying!359 thiss!992)))) e!67288))))

(declare-fun b!103236 () Bool)

(declare-fun e!67291 () Bool)

(assert (=> b!103236 (= e!67291 tp_is_empty!2675)))

(declare-fun b!103237 () Bool)

(declare-fun res!51565 () Bool)

(declare-fun e!67292 () Bool)

(assert (=> b!103237 (=> (not res!51565) (not e!67292))))

(declare-fun newMap!16 () LongMapFixedSize!896)

(declare-fun valid!419 (LongMapFixedSize!896) Bool)

(assert (=> b!103237 (= res!51565 (valid!419 newMap!16))))

(declare-fun b!103238 () Bool)

(declare-fun e!67277 () Bool)

(declare-fun mapRes!3910 () Bool)

(assert (=> b!103238 (= e!67277 (and e!67291 mapRes!3910))))

(declare-fun condMapEmpty!3910 () Bool)

(declare-fun mapDefault!3909 () ValueCell!994)

