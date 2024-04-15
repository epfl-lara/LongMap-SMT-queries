; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97772 () Bool)

(assert start!97772)

(declare-fun b_free!23479 () Bool)

(declare-fun b_next!23479 () Bool)

(assert (=> start!97772 (= b_free!23479 (not b_next!23479))))

(declare-fun tp!83141 () Bool)

(declare-fun b_and!37731 () Bool)

(assert (=> start!97772 (= tp!83141 b_and!37731)))

(declare-fun b!1118345 () Bool)

(declare-fun e!636988 () Bool)

(declare-fun e!636986 () Bool)

(declare-fun mapRes!43831 () Bool)

(assert (=> b!1118345 (= e!636988 (and e!636986 mapRes!43831))))

(declare-fun condMapEmpty!43831 () Bool)

(declare-datatypes ((V!42473 0))(
  ( (V!42474 (val!14061 Int)) )
))
(declare-datatypes ((ValueCell!13295 0))(
  ( (ValueCellFull!13295 (v!16693 V!42473)) (EmptyCell!13295) )
))
(declare-datatypes ((array!72812 0))(
  ( (array!72813 (arr!35059 (Array (_ BitVec 32) ValueCell!13295)) (size!35597 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72812)

(declare-fun mapDefault!43831 () ValueCell!13295)

(assert (=> b!1118345 (= condMapEmpty!43831 (= (arr!35059 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13295)) mapDefault!43831)))))

(declare-fun res!746950 () Bool)

(declare-fun e!636990 () Bool)

(assert (=> start!97772 (=> (not res!746950) (not e!636990))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72814 0))(
  ( (array!72815 (arr!35060 (Array (_ BitVec 32) (_ BitVec 64))) (size!35598 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72814)

(assert (=> start!97772 (= res!746950 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35598 _keys!1208))))))

(assert (=> start!97772 e!636990))

(declare-fun tp_is_empty!28009 () Bool)

(assert (=> start!97772 tp_is_empty!28009))

(declare-fun array_inv!27006 (array!72814) Bool)

(assert (=> start!97772 (array_inv!27006 _keys!1208)))

(assert (=> start!97772 true))

(assert (=> start!97772 tp!83141))

(declare-fun array_inv!27007 (array!72812) Bool)

(assert (=> start!97772 (and (array_inv!27007 _values!996) e!636988)))

(declare-fun b!1118346 () Bool)

(declare-fun res!746959 () Bool)

(assert (=> b!1118346 (=> (not res!746959) (not e!636990))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118346 (= res!746959 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43831 () Bool)

(declare-fun tp!83140 () Bool)

(declare-fun e!636985 () Bool)

(assert (=> mapNonEmpty!43831 (= mapRes!43831 (and tp!83140 e!636985))))

(declare-fun mapKey!43831 () (_ BitVec 32))

(declare-fun mapValue!43831 () ValueCell!13295)

(declare-fun mapRest!43831 () (Array (_ BitVec 32) ValueCell!13295))

(assert (=> mapNonEmpty!43831 (= (arr!35059 _values!996) (store mapRest!43831 mapKey!43831 mapValue!43831))))

(declare-fun b!1118347 () Bool)

(declare-fun res!746953 () Bool)

(assert (=> b!1118347 (=> (not res!746953) (not e!636990))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118347 (= res!746953 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35598 _keys!1208))))))

(declare-fun b!1118348 () Bool)

(declare-fun e!636987 () Bool)

(assert (=> b!1118348 (= e!636987 true)))

(declare-fun zeroValue!944 () V!42473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17698 0))(
  ( (tuple2!17699 (_1!8860 (_ BitVec 64)) (_2!8860 V!42473)) )
))
(declare-datatypes ((List!24462 0))(
  ( (Nil!24459) (Cons!24458 (h!25667 tuple2!17698) (t!34934 List!24462)) )
))
(declare-datatypes ((ListLongMap!15667 0))(
  ( (ListLongMap!15668 (toList!7849 List!24462)) )
))
(declare-fun lt!497304 () ListLongMap!15667)

(declare-fun minValue!944 () V!42473)

(declare-fun getCurrentListMapNoExtraKeys!4358 (array!72814 array!72812 (_ BitVec 32) (_ BitVec 32) V!42473 V!42473 (_ BitVec 32) Int) ListLongMap!15667)

(assert (=> b!1118348 (= lt!497304 (getCurrentListMapNoExtraKeys!4358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43831 () Bool)

(assert (=> mapIsEmpty!43831 mapRes!43831))

(declare-fun b!1118349 () Bool)

(declare-fun res!746951 () Bool)

(assert (=> b!1118349 (=> (not res!746951) (not e!636990))))

(assert (=> b!1118349 (= res!746951 (and (= (size!35597 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35598 _keys!1208) (size!35597 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118350 () Bool)

(declare-fun res!746952 () Bool)

(declare-fun e!636989 () Bool)

(assert (=> b!1118350 (=> (not res!746952) (not e!636989))))

(declare-fun lt!497303 () array!72814)

(declare-datatypes ((List!24463 0))(
  ( (Nil!24460) (Cons!24459 (h!25668 (_ BitVec 64)) (t!34935 List!24463)) )
))
(declare-fun arrayNoDuplicates!0 (array!72814 (_ BitVec 32) List!24463) Bool)

(assert (=> b!1118350 (= res!746952 (arrayNoDuplicates!0 lt!497303 #b00000000000000000000000000000000 Nil!24460))))

(declare-fun b!1118351 () Bool)

(declare-fun res!746949 () Bool)

(assert (=> b!1118351 (=> (not res!746949) (not e!636990))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118351 (= res!746949 (validKeyInArray!0 k0!934))))

(declare-fun b!1118352 () Bool)

(declare-fun res!746956 () Bool)

(assert (=> b!1118352 (=> (not res!746956) (not e!636990))))

(assert (=> b!1118352 (= res!746956 (= (select (arr!35060 _keys!1208) i!673) k0!934))))

(declare-fun b!1118353 () Bool)

(assert (=> b!1118353 (= e!636986 tp_is_empty!28009)))

(declare-fun b!1118354 () Bool)

(assert (=> b!1118354 (= e!636989 (not e!636987))))

(declare-fun res!746954 () Bool)

(assert (=> b!1118354 (=> res!746954 e!636987)))

(assert (=> b!1118354 (= res!746954 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118354 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36527 0))(
  ( (Unit!36528) )
))
(declare-fun lt!497302 () Unit!36527)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72814 (_ BitVec 64) (_ BitVec 32)) Unit!36527)

(assert (=> b!1118354 (= lt!497302 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118355 () Bool)

(declare-fun res!746958 () Bool)

(assert (=> b!1118355 (=> (not res!746958) (not e!636990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72814 (_ BitVec 32)) Bool)

(assert (=> b!1118355 (= res!746958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118356 () Bool)

(declare-fun res!746955 () Bool)

(assert (=> b!1118356 (=> (not res!746955) (not e!636990))))

(assert (=> b!1118356 (= res!746955 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24460))))

(declare-fun b!1118357 () Bool)

(assert (=> b!1118357 (= e!636990 e!636989)))

(declare-fun res!746957 () Bool)

(assert (=> b!1118357 (=> (not res!746957) (not e!636989))))

(assert (=> b!1118357 (= res!746957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497303 mask!1564))))

(assert (=> b!1118357 (= lt!497303 (array!72815 (store (arr!35060 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35598 _keys!1208)))))

(declare-fun b!1118358 () Bool)

(assert (=> b!1118358 (= e!636985 tp_is_empty!28009)))

(assert (= (and start!97772 res!746950) b!1118346))

(assert (= (and b!1118346 res!746959) b!1118349))

(assert (= (and b!1118349 res!746951) b!1118355))

(assert (= (and b!1118355 res!746958) b!1118356))

(assert (= (and b!1118356 res!746955) b!1118347))

(assert (= (and b!1118347 res!746953) b!1118351))

(assert (= (and b!1118351 res!746949) b!1118352))

(assert (= (and b!1118352 res!746956) b!1118357))

(assert (= (and b!1118357 res!746957) b!1118350))

(assert (= (and b!1118350 res!746952) b!1118354))

(assert (= (and b!1118354 (not res!746954)) b!1118348))

(assert (= (and b!1118345 condMapEmpty!43831) mapIsEmpty!43831))

(assert (= (and b!1118345 (not condMapEmpty!43831)) mapNonEmpty!43831))

(get-info :version)

(assert (= (and mapNonEmpty!43831 ((_ is ValueCellFull!13295) mapValue!43831)) b!1118358))

(assert (= (and b!1118345 ((_ is ValueCellFull!13295) mapDefault!43831)) b!1118353))

(assert (= start!97772 b!1118345))

(declare-fun m!1033377 () Bool)

(assert (=> start!97772 m!1033377))

(declare-fun m!1033379 () Bool)

(assert (=> start!97772 m!1033379))

(declare-fun m!1033381 () Bool)

(assert (=> b!1118352 m!1033381))

(declare-fun m!1033383 () Bool)

(assert (=> b!1118346 m!1033383))

(declare-fun m!1033385 () Bool)

(assert (=> b!1118348 m!1033385))

(declare-fun m!1033387 () Bool)

(assert (=> b!1118350 m!1033387))

(declare-fun m!1033389 () Bool)

(assert (=> b!1118357 m!1033389))

(declare-fun m!1033391 () Bool)

(assert (=> b!1118357 m!1033391))

(declare-fun m!1033393 () Bool)

(assert (=> b!1118355 m!1033393))

(declare-fun m!1033395 () Bool)

(assert (=> b!1118356 m!1033395))

(declare-fun m!1033397 () Bool)

(assert (=> b!1118351 m!1033397))

(declare-fun m!1033399 () Bool)

(assert (=> mapNonEmpty!43831 m!1033399))

(declare-fun m!1033401 () Bool)

(assert (=> b!1118354 m!1033401))

(declare-fun m!1033403 () Bool)

(assert (=> b!1118354 m!1033403))

(check-sat (not mapNonEmpty!43831) (not b!1118350) (not b!1118351) tp_is_empty!28009 (not b_next!23479) (not start!97772) (not b!1118357) (not b!1118356) (not b!1118354) (not b!1118355) b_and!37731 (not b!1118348) (not b!1118346))
(check-sat b_and!37731 (not b_next!23479))
