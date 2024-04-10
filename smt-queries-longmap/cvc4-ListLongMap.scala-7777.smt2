; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97410 () Bool)

(assert start!97410)

(declare-fun b_free!23381 () Bool)

(declare-fun b_next!23381 () Bool)

(assert (=> start!97410 (= b_free!23381 (not b_next!23381))))

(declare-fun tp!82441 () Bool)

(declare-fun b_and!37599 () Bool)

(assert (=> start!97410 (= tp!82441 b_and!37599)))

(declare-fun b!1110931 () Bool)

(declare-fun e!633525 () Bool)

(declare-fun tp_is_empty!27641 () Bool)

(assert (=> b!1110931 (= e!633525 tp_is_empty!27641)))

(declare-fun b!1110932 () Bool)

(declare-fun res!741358 () Bool)

(declare-fun e!633527 () Bool)

(assert (=> b!1110932 (=> (not res!741358) (not e!633527))))

(declare-datatypes ((array!72199 0))(
  ( (array!72200 (arr!34752 (Array (_ BitVec 32) (_ BitVec 64))) (size!35288 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72199)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1110932 (= res!741358 (= (select (arr!34752 _keys!1208) i!673) k!934))))

(declare-fun b!1110934 () Bool)

(declare-fun e!633529 () Bool)

(declare-fun e!633526 () Bool)

(assert (=> b!1110934 (= e!633529 (not e!633526))))

(declare-fun res!741359 () Bool)

(assert (=> b!1110934 (=> res!741359 e!633526)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110934 (= res!741359 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35288 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110934 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36458 0))(
  ( (Unit!36459) )
))
(declare-fun lt!496251 () Unit!36458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72199 (_ BitVec 64) (_ BitVec 32)) Unit!36458)

(assert (=> b!1110934 (= lt!496251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((V!41981 0))(
  ( (V!41982 (val!13877 Int)) )
))
(declare-fun zeroValue!944 () V!41981)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!496252 () array!72199)

(declare-fun bm!46836 () Bool)

(declare-datatypes ((ValueCell!13111 0))(
  ( (ValueCellFull!13111 (v!16510 V!41981)) (EmptyCell!13111) )
))
(declare-datatypes ((array!72201 0))(
  ( (array!72202 (arr!34753 (Array (_ BitVec 32) ValueCell!13111)) (size!35289 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72201)

(declare-fun minValue!944 () V!41981)

(declare-datatypes ((tuple2!17556 0))(
  ( (tuple2!17557 (_1!8789 (_ BitVec 64)) (_2!8789 V!41981)) )
))
(declare-datatypes ((List!24240 0))(
  ( (Nil!24237) (Cons!24236 (h!25445 tuple2!17556) (t!34667 List!24240)) )
))
(declare-datatypes ((ListLongMap!15525 0))(
  ( (ListLongMap!15526 (toList!7778 List!24240)) )
))
(declare-fun call!46839 () ListLongMap!15525)

(declare-fun getCurrentListMapNoExtraKeys!4270 (array!72199 array!72201 (_ BitVec 32) (_ BitVec 32) V!41981 V!41981 (_ BitVec 32) Int) ListLongMap!15525)

(declare-fun dynLambda!2399 (Int (_ BitVec 64)) V!41981)

(assert (=> bm!46836 (= call!46839 (getCurrentListMapNoExtraKeys!4270 lt!496252 (array!72202 (store (arr!34753 _values!996) i!673 (ValueCellFull!13111 (dynLambda!2399 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35289 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110935 () Bool)

(declare-fun res!741355 () Bool)

(assert (=> b!1110935 (=> (not res!741355) (not e!633527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72199 (_ BitVec 32)) Bool)

(assert (=> b!1110935 (= res!741355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43279 () Bool)

(declare-fun mapRes!43279 () Bool)

(declare-fun tp!82442 () Bool)

(assert (=> mapNonEmpty!43279 (= mapRes!43279 (and tp!82442 e!633525))))

(declare-fun mapValue!43279 () ValueCell!13111)

(declare-fun mapKey!43279 () (_ BitVec 32))

(declare-fun mapRest!43279 () (Array (_ BitVec 32) ValueCell!13111))

(assert (=> mapNonEmpty!43279 (= (arr!34753 _values!996) (store mapRest!43279 mapKey!43279 mapValue!43279))))

(declare-fun mapIsEmpty!43279 () Bool)

(assert (=> mapIsEmpty!43279 mapRes!43279))

(declare-fun b!1110936 () Bool)

(declare-fun res!741360 () Bool)

(assert (=> b!1110936 (=> (not res!741360) (not e!633527))))

(declare-datatypes ((List!24241 0))(
  ( (Nil!24238) (Cons!24237 (h!25446 (_ BitVec 64)) (t!34668 List!24241)) )
))
(declare-fun arrayNoDuplicates!0 (array!72199 (_ BitVec 32) List!24241) Bool)

(assert (=> b!1110936 (= res!741360 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24238))))

(declare-fun b!1110937 () Bool)

(declare-fun e!633530 () Bool)

(declare-fun e!633524 () Bool)

(assert (=> b!1110937 (= e!633530 (and e!633524 mapRes!43279))))

(declare-fun condMapEmpty!43279 () Bool)

(declare-fun mapDefault!43279 () ValueCell!13111)

