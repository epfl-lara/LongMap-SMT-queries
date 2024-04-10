; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98040 () Bool)

(assert start!98040)

(declare-fun b_free!23741 () Bool)

(declare-fun b_next!23741 () Bool)

(assert (=> start!98040 (= b_free!23741 (not b_next!23741))))

(declare-fun tp!83926 () Bool)

(declare-fun b_and!38265 () Bool)

(assert (=> start!98040 (= tp!83926 b_and!38265)))

(declare-fun b!1125318 () Bool)

(declare-fun res!751944 () Bool)

(declare-fun e!640572 () Bool)

(assert (=> b!1125318 (=> (not res!751944) (not e!640572))))

(declare-datatypes ((array!73405 0))(
  ( (array!73406 (arr!35355 (Array (_ BitVec 32) (_ BitVec 64))) (size!35891 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73405)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1125318 (= res!751944 (= (select (arr!35355 _keys!1208) i!673) k!934))))

(declare-fun b!1125319 () Bool)

(declare-fun e!640570 () Bool)

(declare-fun e!640569 () Bool)

(assert (=> b!1125319 (= e!640570 (not e!640569))))

(declare-fun res!751945 () Bool)

(assert (=> b!1125319 (=> res!751945 e!640569)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125319 (= res!751945 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125319 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36882 0))(
  ( (Unit!36883) )
))
(declare-fun lt!499808 () Unit!36882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73405 (_ BitVec 64) (_ BitVec 32)) Unit!36882)

(assert (=> b!1125319 (= lt!499808 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1125320 () Bool)

(declare-fun res!751942 () Bool)

(assert (=> b!1125320 (=> (not res!751942) (not e!640570))))

(declare-fun lt!499806 () array!73405)

(declare-datatypes ((List!24611 0))(
  ( (Nil!24608) (Cons!24607 (h!25816 (_ BitVec 64)) (t!35344 List!24611)) )
))
(declare-fun arrayNoDuplicates!0 (array!73405 (_ BitVec 32) List!24611) Bool)

(assert (=> b!1125320 (= res!751942 (arrayNoDuplicates!0 lt!499806 #b00000000000000000000000000000000 Nil!24608))))

(declare-fun b!1125321 () Bool)

(declare-fun e!640576 () Bool)

(declare-datatypes ((V!42821 0))(
  ( (V!42822 (val!14192 Int)) )
))
(declare-datatypes ((tuple2!17832 0))(
  ( (tuple2!17833 (_1!8927 (_ BitVec 64)) (_2!8927 V!42821)) )
))
(declare-datatypes ((List!24612 0))(
  ( (Nil!24609) (Cons!24608 (h!25817 tuple2!17832) (t!35345 List!24612)) )
))
(declare-datatypes ((ListLongMap!15801 0))(
  ( (ListLongMap!15802 (toList!7916 List!24612)) )
))
(declare-fun call!47506 () ListLongMap!15801)

(declare-fun call!47505 () ListLongMap!15801)

(assert (=> b!1125321 (= e!640576 (= call!47506 call!47505))))

(declare-fun b!1125322 () Bool)

(declare-fun res!751933 () Bool)

(assert (=> b!1125322 (=> (not res!751933) (not e!640572))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13426 0))(
  ( (ValueCellFull!13426 (v!16825 V!42821)) (EmptyCell!13426) )
))
(declare-datatypes ((array!73407 0))(
  ( (array!73408 (arr!35356 (Array (_ BitVec 32) ValueCell!13426)) (size!35892 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73407)

(assert (=> b!1125322 (= res!751933 (and (= (size!35892 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35891 _keys!1208) (size!35892 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!751935 () Bool)

(assert (=> start!98040 (=> (not res!751935) (not e!640572))))

(assert (=> start!98040 (= res!751935 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35891 _keys!1208))))))

(assert (=> start!98040 e!640572))

(declare-fun tp_is_empty!28271 () Bool)

(assert (=> start!98040 tp_is_empty!28271))

(declare-fun array_inv!27140 (array!73405) Bool)

(assert (=> start!98040 (array_inv!27140 _keys!1208)))

(assert (=> start!98040 true))

(assert (=> start!98040 tp!83926))

(declare-fun e!640574 () Bool)

(declare-fun array_inv!27141 (array!73407) Bool)

(assert (=> start!98040 (and (array_inv!27141 _values!996) e!640574)))

(declare-fun b!1125323 () Bool)

(declare-fun -!1118 (ListLongMap!15801 (_ BitVec 64)) ListLongMap!15801)

(assert (=> b!1125323 (= e!640576 (= call!47506 (-!1118 call!47505 k!934)))))

(declare-fun b!1125324 () Bool)

(declare-fun e!640577 () Bool)

(declare-fun e!640568 () Bool)

(assert (=> b!1125324 (= e!640577 e!640568)))

(declare-fun res!751943 () Bool)

(assert (=> b!1125324 (=> res!751943 e!640568)))

(declare-fun lt!499807 () ListLongMap!15801)

(declare-fun contains!6453 (ListLongMap!15801 (_ BitVec 64)) Bool)

(assert (=> b!1125324 (= res!751943 (not (contains!6453 lt!499807 k!934)))))

(declare-fun zeroValue!944 () V!42821)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42821)

(declare-fun getCurrentListMapNoExtraKeys!4404 (array!73405 array!73407 (_ BitVec 32) (_ BitVec 32) V!42821 V!42821 (_ BitVec 32) Int) ListLongMap!15801)

(assert (=> b!1125324 (= lt!499807 (getCurrentListMapNoExtraKeys!4404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44224 () Bool)

(declare-fun mapRes!44224 () Bool)

(declare-fun tp!83927 () Bool)

(declare-fun e!640575 () Bool)

(assert (=> mapNonEmpty!44224 (= mapRes!44224 (and tp!83927 e!640575))))

(declare-fun mapRest!44224 () (Array (_ BitVec 32) ValueCell!13426))

(declare-fun mapValue!44224 () ValueCell!13426)

(declare-fun mapKey!44224 () (_ BitVec 32))

(assert (=> mapNonEmpty!44224 (= (arr!35356 _values!996) (store mapRest!44224 mapKey!44224 mapValue!44224))))

(declare-fun b!1125325 () Bool)

(assert (=> b!1125325 (= e!640568 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35891 _keys!1208))))))

(declare-fun +!3423 (ListLongMap!15801 tuple2!17832) ListLongMap!15801)

(assert (=> b!1125325 (contains!6453 (+!3423 lt!499807 (tuple2!17833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-fun lt!499802 () Unit!36882)

(declare-fun addStillContains!685 (ListLongMap!15801 (_ BitVec 64) V!42821 (_ BitVec 64)) Unit!36882)

(assert (=> b!1125325 (= lt!499802 (addStillContains!685 lt!499807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun bm!47502 () Bool)

(assert (=> bm!47502 (= call!47505 (getCurrentListMapNoExtraKeys!4404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125326 () Bool)

(declare-fun e!640578 () Bool)

(assert (=> b!1125326 (= e!640574 (and e!640578 mapRes!44224))))

(declare-fun condMapEmpty!44224 () Bool)

(declare-fun mapDefault!44224 () ValueCell!13426)

