; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13074 () Bool)

(assert start!13074)

(declare-fun b!114258 () Bool)

(declare-fun b_free!2625 () Bool)

(declare-fun b_next!2625 () Bool)

(assert (=> b!114258 (= b_free!2625 (not b_next!2625))))

(declare-fun tp!10235 () Bool)

(declare-fun b_and!7043 () Bool)

(assert (=> b!114258 (= tp!10235 b_and!7043)))

(declare-fun b!114247 () Bool)

(declare-fun b_free!2627 () Bool)

(declare-fun b_next!2627 () Bool)

(assert (=> b!114247 (= b_free!2627 (not b_next!2627))))

(declare-fun tp!10236 () Bool)

(declare-fun b_and!7045 () Bool)

(assert (=> b!114247 (= tp!10236 b_and!7045)))

(declare-fun b!114242 () Bool)

(declare-fun e!74320 () Bool)

(declare-fun e!74327 () Bool)

(assert (=> b!114242 (= e!74320 e!74327)))

(declare-fun b!114243 () Bool)

(declare-fun res!56241 () Bool)

(declare-fun e!74330 () Bool)

(assert (=> b!114243 (=> (not res!56241) (not e!74330))))

(declare-datatypes ((V!3285 0))(
  ( (V!3286 (val!1409 Int)) )
))
(declare-datatypes ((array!4459 0))(
  ( (array!4460 (arr!2113 (Array (_ BitVec 32) (_ BitVec 64))) (size!2373 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1021 0))(
  ( (ValueCellFull!1021 (v!2985 V!3285)) (EmptyCell!1021) )
))
(declare-datatypes ((array!4461 0))(
  ( (array!4462 (arr!2114 (Array (_ BitVec 32) ValueCell!1021)) (size!2374 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!950 0))(
  ( (LongMapFixedSize!951 (defaultEntry!2681 Int) (mask!6875 (_ BitVec 32)) (extraKeys!2470 (_ BitVec 32)) (zeroValue!2548 V!3285) (minValue!2548 V!3285) (_size!524 (_ BitVec 32)) (_keys!4403 array!4459) (_values!2664 array!4461) (_vacant!524 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!950)

(declare-fun valid!447 (LongMapFixedSize!950) Bool)

(assert (=> b!114243 (= res!56241 (valid!447 newMap!16))))

(declare-fun b!114244 () Bool)

(declare-fun e!74322 () Bool)

(declare-fun e!74323 () Bool)

(assert (=> b!114244 (= e!74322 e!74323)))

(declare-fun res!56240 () Bool)

(assert (=> b!114244 (=> (not res!56240) (not e!74323))))

(declare-datatypes ((tuple2!2478 0))(
  ( (tuple2!2479 (_1!1250 Bool) (_2!1250 LongMapFixedSize!950)) )
))
(declare-fun lt!59425 () tuple2!2478)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!114244 (= res!56240 (and (_1!1250 lt!59425) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3569 0))(
  ( (Unit!3570) )
))
(declare-fun lt!59428 () Unit!3569)

(declare-fun e!74325 () Unit!3569)

(assert (=> b!114244 (= lt!59428 e!74325)))

(declare-fun c!20420 () Bool)

(declare-datatypes ((Cell!750 0))(
  ( (Cell!751 (v!2986 LongMapFixedSize!950)) )
))
(declare-datatypes ((LongMap!750 0))(
  ( (LongMap!751 (underlying!386 Cell!750)) )
))
(declare-fun thiss!992 () LongMap!750)

(declare-datatypes ((tuple2!2480 0))(
  ( (tuple2!2481 (_1!1251 (_ BitVec 64)) (_2!1251 V!3285)) )
))
(declare-datatypes ((List!1651 0))(
  ( (Nil!1648) (Cons!1647 (h!2247 tuple2!2480) (t!5869 List!1651)) )
))
(declare-datatypes ((ListLongMap!1613 0))(
  ( (ListLongMap!1614 (toList!822 List!1651)) )
))
(declare-fun lt!59441 () ListLongMap!1613)

(declare-fun contains!853 (ListLongMap!1613 (_ BitVec 64)) Bool)

(assert (=> b!114244 (= c!20420 (contains!853 lt!59441 (select (arr!2113 (_keys!4403 (v!2986 (underlying!386 thiss!992)))) from!355)))))

(declare-fun lt!59433 () V!3285)

(declare-fun update!171 (LongMapFixedSize!950 (_ BitVec 64) V!3285) tuple2!2478)

(assert (=> b!114244 (= lt!59425 (update!171 newMap!16 (select (arr!2113 (_keys!4403 (v!2986 (underlying!386 thiss!992)))) from!355) lt!59433))))

(declare-fun b!114245 () Bool)

(declare-fun Unit!3571 () Unit!3569)

(assert (=> b!114245 (= e!74325 Unit!3571)))

(declare-fun mapIsEmpty!4115 () Bool)

(declare-fun mapRes!4115 () Bool)

(assert (=> mapIsEmpty!4115 mapRes!4115))

(declare-fun b!114246 () Bool)

(declare-fun e!74332 () Bool)

(assert (=> b!114246 (= e!74330 e!74332)))

(declare-fun res!56238 () Bool)

(assert (=> b!114246 (=> (not res!56238) (not e!74332))))

(declare-fun lt!59424 () ListLongMap!1613)

(assert (=> b!114246 (= res!56238 (= lt!59424 lt!59441))))

(declare-fun map!1318 (LongMapFixedSize!950) ListLongMap!1613)

(assert (=> b!114246 (= lt!59441 (map!1318 newMap!16))))

(declare-fun getCurrentListMap!505 (array!4459 array!4461 (_ BitVec 32) (_ BitVec 32) V!3285 V!3285 (_ BitVec 32) Int) ListLongMap!1613)

(assert (=> b!114246 (= lt!59424 (getCurrentListMap!505 (_keys!4403 (v!2986 (underlying!386 thiss!992))) (_values!2664 (v!2986 (underlying!386 thiss!992))) (mask!6875 (v!2986 (underlying!386 thiss!992))) (extraKeys!2470 (v!2986 (underlying!386 thiss!992))) (zeroValue!2548 (v!2986 (underlying!386 thiss!992))) (minValue!2548 (v!2986 (underlying!386 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2681 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun e!74331 () Bool)

(declare-fun e!74328 () Bool)

(declare-fun tp_is_empty!2729 () Bool)

(declare-fun array_inv!1329 (array!4459) Bool)

(declare-fun array_inv!1330 (array!4461) Bool)

(assert (=> b!114247 (= e!74331 (and tp!10236 tp_is_empty!2729 (array_inv!1329 (_keys!4403 newMap!16)) (array_inv!1330 (_values!2664 newMap!16)) e!74328))))

(declare-fun b!114248 () Bool)

(declare-fun res!56237 () Bool)

(assert (=> b!114248 (=> (not res!56237) (not e!74330))))

(assert (=> b!114248 (= res!56237 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6875 newMap!16)) (_size!524 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun mapNonEmpty!4115 () Bool)

(declare-fun mapRes!4116 () Bool)

(declare-fun tp!10233 () Bool)

(declare-fun e!74319 () Bool)

(assert (=> mapNonEmpty!4115 (= mapRes!4116 (and tp!10233 e!74319))))

(declare-fun mapValue!4116 () ValueCell!1021)

(declare-fun mapRest!4116 () (Array (_ BitVec 32) ValueCell!1021))

(declare-fun mapKey!4116 () (_ BitVec 32))

(assert (=> mapNonEmpty!4115 (= (arr!2114 (_values!2664 (v!2986 (underlying!386 thiss!992)))) (store mapRest!4116 mapKey!4116 mapValue!4116))))

(declare-fun b!114249 () Bool)

(assert (=> b!114249 (= e!74319 tp_is_empty!2729)))

(declare-fun b!114250 () Bool)

(declare-fun res!56239 () Bool)

(assert (=> b!114250 (=> (not res!56239) (not e!74330))))

(assert (=> b!114250 (= res!56239 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2373 (_keys!4403 (v!2986 (underlying!386 thiss!992)))))))))

(declare-fun b!114251 () Bool)

(declare-fun e!74326 () Bool)

(assert (=> b!114251 (= e!74326 tp_is_empty!2729)))

(declare-fun b!114252 () Bool)

(declare-fun e!74333 () Bool)

(assert (=> b!114252 (= e!74333 tp_is_empty!2729)))

(declare-fun b!114253 () Bool)

(assert (=> b!114253 (= e!74323 (not true))))

(declare-fun lt!59430 () Bool)

(assert (=> b!114253 (= lt!59430 (valid!447 (_2!1250 lt!59425)))))

(declare-fun lt!59435 () ListLongMap!1613)

(declare-fun lt!59432 () tuple2!2480)

(declare-fun lt!59429 () tuple2!2480)

(declare-fun lt!59423 () ListLongMap!1613)

(declare-fun +!160 (ListLongMap!1613 tuple2!2480) ListLongMap!1613)

(assert (=> b!114253 (= (+!160 lt!59435 lt!59429) (+!160 (+!160 lt!59423 lt!59429) lt!59432))))

(assert (=> b!114253 (= lt!59429 (tuple2!2481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2548 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun lt!59431 () Unit!3569)

(declare-fun addCommutativeForDiffKeys!72 (ListLongMap!1613 (_ BitVec 64) V!3285 (_ BitVec 64) V!3285) Unit!3569)

(assert (=> b!114253 (= lt!59431 (addCommutativeForDiffKeys!72 lt!59423 (select (arr!2113 (_keys!4403 (v!2986 (underlying!386 thiss!992)))) from!355) lt!59433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2548 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun lt!59434 () ListLongMap!1613)

(assert (=> b!114253 (= lt!59434 lt!59435)))

(assert (=> b!114253 (= lt!59435 (+!160 lt!59423 lt!59432))))

(declare-fun lt!59438 () ListLongMap!1613)

(declare-fun lt!59439 () tuple2!2480)

(assert (=> b!114253 (= lt!59434 (+!160 lt!59438 lt!59439))))

(declare-fun lt!59436 () ListLongMap!1613)

(assert (=> b!114253 (= lt!59423 (+!160 lt!59436 lt!59439))))

(assert (=> b!114253 (= lt!59439 (tuple2!2481 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2548 (v!2986 (underlying!386 thiss!992)))))))

(assert (=> b!114253 (= lt!59438 (+!160 lt!59436 lt!59432))))

(assert (=> b!114253 (= lt!59432 (tuple2!2481 (select (arr!2113 (_keys!4403 (v!2986 (underlying!386 thiss!992)))) from!355) lt!59433))))

(declare-fun lt!59440 () Unit!3569)

(assert (=> b!114253 (= lt!59440 (addCommutativeForDiffKeys!72 lt!59436 (select (arr!2113 (_keys!4403 (v!2986 (underlying!386 thiss!992)))) from!355) lt!59433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2548 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!126 (array!4459 array!4461 (_ BitVec 32) (_ BitVec 32) V!3285 V!3285 (_ BitVec 32) Int) ListLongMap!1613)

(assert (=> b!114253 (= lt!59436 (getCurrentListMapNoExtraKeys!126 (_keys!4403 (v!2986 (underlying!386 thiss!992))) (_values!2664 (v!2986 (underlying!386 thiss!992))) (mask!6875 (v!2986 (underlying!386 thiss!992))) (extraKeys!2470 (v!2986 (underlying!386 thiss!992))) (zeroValue!2548 (v!2986 (underlying!386 thiss!992))) (minValue!2548 (v!2986 (underlying!386 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2681 (v!2986 (underlying!386 thiss!992)))))))

(declare-fun res!56242 () Bool)

(assert (=> start!13074 (=> (not res!56242) (not e!74330))))

(declare-fun valid!448 (LongMap!750) Bool)

(assert (=> start!13074 (= res!56242 (valid!448 thiss!992))))

(assert (=> start!13074 e!74330))

(declare-fun e!74321 () Bool)

(assert (=> start!13074 e!74321))

(assert (=> start!13074 true))

(assert (=> start!13074 e!74331))

(declare-fun b!114254 () Bool)

(assert (=> b!114254 (= e!74328 (and e!74326 mapRes!4115))))

(declare-fun condMapEmpty!4116 () Bool)

(declare-fun mapDefault!4115 () ValueCell!1021)

