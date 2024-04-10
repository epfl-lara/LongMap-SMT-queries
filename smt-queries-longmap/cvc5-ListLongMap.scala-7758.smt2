; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97292 () Bool)

(assert start!97292)

(declare-fun b_free!23263 () Bool)

(declare-fun b_next!23263 () Bool)

(assert (=> start!97292 (= b_free!23263 (not b_next!23263))))

(declare-fun tp!82087 () Bool)

(declare-fun b_and!37357 () Bool)

(assert (=> start!97292 (= tp!82087 b_and!37357)))

(declare-fun b!1107945 () Bool)

(declare-fun res!739407 () Bool)

(declare-fun e!632096 () Bool)

(assert (=> b!1107945 (=> (not res!739407) (not e!632096))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107945 (= res!739407 (validMask!0 mask!1564))))

(declare-fun b!1107946 () Bool)

(declare-fun res!739409 () Bool)

(assert (=> b!1107946 (=> (not res!739409) (not e!632096))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107946 (= res!739409 (validKeyInArray!0 k!934))))

(declare-fun b!1107947 () Bool)

(declare-fun res!739404 () Bool)

(assert (=> b!1107947 (=> (not res!739404) (not e!632096))))

(declare-datatypes ((array!71963 0))(
  ( (array!71964 (arr!34634 (Array (_ BitVec 32) (_ BitVec 64))) (size!35170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71963)

(declare-datatypes ((V!41825 0))(
  ( (V!41826 (val!13818 Int)) )
))
(declare-datatypes ((ValueCell!13052 0))(
  ( (ValueCellFull!13052 (v!16451 V!41825)) (EmptyCell!13052) )
))
(declare-datatypes ((array!71965 0))(
  ( (array!71966 (arr!34635 (Array (_ BitVec 32) ValueCell!13052)) (size!35171 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71965)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107947 (= res!739404 (and (= (size!35171 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35170 _keys!1208) (size!35171 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107948 () Bool)

(declare-fun res!739411 () Bool)

(assert (=> b!1107948 (=> (not res!739411) (not e!632096))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107948 (= res!739411 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35170 _keys!1208))))))

(declare-fun b!1107949 () Bool)

(declare-fun res!739413 () Bool)

(assert (=> b!1107949 (=> (not res!739413) (not e!632096))))

(assert (=> b!1107949 (= res!739413 (= (select (arr!34634 _keys!1208) i!673) k!934))))

(declare-fun e!632095 () Bool)

(declare-datatypes ((tuple2!17460 0))(
  ( (tuple2!17461 (_1!8741 (_ BitVec 64)) (_2!8741 V!41825)) )
))
(declare-datatypes ((List!24144 0))(
  ( (Nil!24141) (Cons!24140 (h!25349 tuple2!17460) (t!34453 List!24144)) )
))
(declare-datatypes ((ListLongMap!15429 0))(
  ( (ListLongMap!15430 (toList!7730 List!24144)) )
))
(declare-fun call!46485 () ListLongMap!15429)

(declare-fun b!1107950 () Bool)

(declare-fun call!46486 () ListLongMap!15429)

(declare-fun -!1010 (ListLongMap!15429 (_ BitVec 64)) ListLongMap!15429)

(assert (=> b!1107950 (= e!632095 (= call!46486 (-!1010 call!46485 k!934)))))

(declare-fun b!1107951 () Bool)

(declare-fun res!739406 () Bool)

(assert (=> b!1107951 (=> (not res!739406) (not e!632096))))

(declare-datatypes ((List!24145 0))(
  ( (Nil!24142) (Cons!24141 (h!25350 (_ BitVec 64)) (t!34454 List!24145)) )
))
(declare-fun arrayNoDuplicates!0 (array!71963 (_ BitVec 32) List!24145) Bool)

(assert (=> b!1107951 (= res!739406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24142))))

(declare-fun b!1107952 () Bool)

(declare-fun res!739412 () Bool)

(assert (=> b!1107952 (=> (not res!739412) (not e!632096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71963 (_ BitVec 32)) Bool)

(assert (=> b!1107952 (= res!739412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107953 () Bool)

(declare-fun e!632097 () Bool)

(assert (=> b!1107953 (= e!632097 true)))

(assert (=> b!1107953 e!632095))

(declare-fun c!109074 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107953 (= c!109074 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41825)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41825)

(declare-datatypes ((Unit!36364 0))(
  ( (Unit!36365) )
))
(declare-fun lt!495721 () Unit!36364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 (array!71963 array!71965 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36364)

(assert (=> b!1107953 (= lt!495721 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46482 () Bool)

(declare-fun lt!495722 () array!71963)

(declare-fun getCurrentListMapNoExtraKeys!4226 (array!71963 array!71965 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) Int) ListLongMap!15429)

(declare-fun dynLambda!2358 (Int (_ BitVec 64)) V!41825)

(assert (=> bm!46482 (= call!46486 (getCurrentListMapNoExtraKeys!4226 lt!495722 (array!71966 (store (arr!34635 _values!996) i!673 (ValueCellFull!13052 (dynLambda!2358 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107954 () Bool)

(declare-fun e!632094 () Bool)

(assert (=> b!1107954 (= e!632096 e!632094)))

(declare-fun res!739414 () Bool)

(assert (=> b!1107954 (=> (not res!739414) (not e!632094))))

(assert (=> b!1107954 (= res!739414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495722 mask!1564))))

(assert (=> b!1107954 (= lt!495722 (array!71964 (store (arr!34634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35170 _keys!1208)))))

(declare-fun res!739405 () Bool)

(assert (=> start!97292 (=> (not res!739405) (not e!632096))))

(assert (=> start!97292 (= res!739405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35170 _keys!1208))))))

(assert (=> start!97292 e!632096))

(declare-fun tp_is_empty!27523 () Bool)

(assert (=> start!97292 tp_is_empty!27523))

(declare-fun array_inv!26654 (array!71963) Bool)

(assert (=> start!97292 (array_inv!26654 _keys!1208)))

(assert (=> start!97292 true))

(assert (=> start!97292 tp!82087))

(declare-fun e!632091 () Bool)

(declare-fun array_inv!26655 (array!71965) Bool)

(assert (=> start!97292 (and (array_inv!26655 _values!996) e!632091)))

(declare-fun b!1107955 () Bool)

(declare-fun e!632092 () Bool)

(assert (=> b!1107955 (= e!632092 tp_is_empty!27523)))

(declare-fun b!1107956 () Bool)

(declare-fun e!632093 () Bool)

(assert (=> b!1107956 (= e!632093 tp_is_empty!27523)))

(declare-fun mapIsEmpty!43102 () Bool)

(declare-fun mapRes!43102 () Bool)

(assert (=> mapIsEmpty!43102 mapRes!43102))

(declare-fun b!1107957 () Bool)

(assert (=> b!1107957 (= e!632094 (not e!632097))))

(declare-fun res!739410 () Bool)

(assert (=> b!1107957 (=> res!739410 e!632097)))

(assert (=> b!1107957 (= res!739410 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35170 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107957 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495720 () Unit!36364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71963 (_ BitVec 64) (_ BitVec 32)) Unit!36364)

(assert (=> b!1107957 (= lt!495720 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1107958 () Bool)

(assert (=> b!1107958 (= e!632095 (= call!46486 call!46485))))

(declare-fun b!1107959 () Bool)

(declare-fun res!739408 () Bool)

(assert (=> b!1107959 (=> (not res!739408) (not e!632094))))

(assert (=> b!1107959 (= res!739408 (arrayNoDuplicates!0 lt!495722 #b00000000000000000000000000000000 Nil!24142))))

(declare-fun b!1107960 () Bool)

(assert (=> b!1107960 (= e!632091 (and e!632093 mapRes!43102))))

(declare-fun condMapEmpty!43102 () Bool)

(declare-fun mapDefault!43102 () ValueCell!13052)

