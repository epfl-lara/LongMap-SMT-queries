; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99310 () Bool)

(assert start!99310)

(declare-fun b_free!24679 () Bool)

(declare-fun b_next!24679 () Bool)

(assert (=> start!99310 (= b_free!24679 (not b_next!24679))))

(declare-fun tp!86748 () Bool)

(declare-fun b_and!40209 () Bool)

(assert (=> start!99310 (= tp!86748 b_and!40209)))

(declare-fun b!1166351 () Bool)

(declare-fun res!773160 () Bool)

(declare-fun e!663190 () Bool)

(assert (=> b!1166351 (=> (not res!773160) (not e!663190))))

(declare-datatypes ((array!75303 0))(
  ( (array!75304 (arr!36296 (Array (_ BitVec 32) (_ BitVec 64))) (size!36833 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75303)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166351 (= res!773160 (= (select (arr!36296 _keys!1208) i!673) k0!934))))

(declare-fun b!1166352 () Bool)

(declare-fun res!773159 () Bool)

(assert (=> b!1166352 (=> (not res!773159) (not e!663190))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75303 (_ BitVec 32)) Bool)

(assert (=> b!1166352 (= res!773159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166353 () Bool)

(declare-fun res!773165 () Bool)

(assert (=> b!1166353 (=> (not res!773165) (not e!663190))))

(declare-datatypes ((List!25468 0))(
  ( (Nil!25465) (Cons!25464 (h!26682 (_ BitVec 64)) (t!37131 List!25468)) )
))
(declare-fun arrayNoDuplicates!0 (array!75303 (_ BitVec 32) List!25468) Bool)

(assert (=> b!1166353 (= res!773165 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25465))))

(declare-fun res!773164 () Bool)

(assert (=> start!99310 (=> (not res!773164) (not e!663190))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99310 (= res!773164 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36833 _keys!1208))))))

(assert (=> start!99310 e!663190))

(declare-fun tp_is_empty!29209 () Bool)

(assert (=> start!99310 tp_is_empty!29209))

(declare-fun array_inv!27832 (array!75303) Bool)

(assert (=> start!99310 (array_inv!27832 _keys!1208)))

(assert (=> start!99310 true))

(assert (=> start!99310 tp!86748))

(declare-datatypes ((V!44073 0))(
  ( (V!44074 (val!14661 Int)) )
))
(declare-datatypes ((ValueCell!13895 0))(
  ( (ValueCellFull!13895 (v!17294 V!44073)) (EmptyCell!13895) )
))
(declare-datatypes ((array!75305 0))(
  ( (array!75306 (arr!36297 (Array (_ BitVec 32) ValueCell!13895)) (size!36834 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75305)

(declare-fun e!663191 () Bool)

(declare-fun array_inv!27833 (array!75305) Bool)

(assert (=> start!99310 (and (array_inv!27833 _values!996) e!663191)))

(declare-fun b!1166354 () Bool)

(declare-fun e!663196 () Bool)

(assert (=> b!1166354 (= e!663196 tp_is_empty!29209)))

(declare-fun b!1166355 () Bool)

(declare-fun res!773156 () Bool)

(declare-fun e!663192 () Bool)

(assert (=> b!1166355 (=> (not res!773156) (not e!663192))))

(declare-fun lt!525294 () array!75303)

(assert (=> b!1166355 (= res!773156 (arrayNoDuplicates!0 lt!525294 #b00000000000000000000000000000000 Nil!25465))))

(declare-fun b!1166356 () Bool)

(declare-fun res!773161 () Bool)

(assert (=> b!1166356 (=> (not res!773161) (not e!663190))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166356 (= res!773161 (and (= (size!36834 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36833 _keys!1208) (size!36834 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166357 () Bool)

(assert (=> b!1166357 (= e!663190 e!663192)))

(declare-fun res!773163 () Bool)

(assert (=> b!1166357 (=> (not res!773163) (not e!663192))))

(assert (=> b!1166357 (= res!773163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525294 mask!1564))))

(assert (=> b!1166357 (= lt!525294 (array!75304 (store (arr!36296 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36833 _keys!1208)))))

(declare-fun b!1166358 () Bool)

(declare-fun res!773158 () Bool)

(assert (=> b!1166358 (=> (not res!773158) (not e!663190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166358 (= res!773158 (validKeyInArray!0 k0!934))))

(declare-fun b!1166359 () Bool)

(declare-fun e!663193 () Bool)

(assert (=> b!1166359 (= e!663193 tp_is_empty!29209)))

(declare-fun b!1166360 () Bool)

(declare-fun res!773162 () Bool)

(assert (=> b!1166360 (=> (not res!773162) (not e!663190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166360 (= res!773162 (validMask!0 mask!1564))))

(declare-fun b!1166361 () Bool)

(declare-fun e!663195 () Bool)

(assert (=> b!1166361 (= e!663192 (not e!663195))))

(declare-fun res!773166 () Bool)

(assert (=> b!1166361 (=> res!773166 e!663195)))

(assert (=> b!1166361 (= res!773166 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166361 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38439 0))(
  ( (Unit!38440) )
))
(declare-fun lt!525292 () Unit!38439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75303 (_ BitVec 64) (_ BitVec 32)) Unit!38439)

(assert (=> b!1166361 (= lt!525292 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166362 () Bool)

(declare-fun mapRes!45638 () Bool)

(assert (=> b!1166362 (= e!663191 (and e!663196 mapRes!45638))))

(declare-fun condMapEmpty!45638 () Bool)

(declare-fun mapDefault!45638 () ValueCell!13895)

(assert (=> b!1166362 (= condMapEmpty!45638 (= (arr!36297 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13895)) mapDefault!45638)))))

(declare-fun b!1166363 () Bool)

(assert (=> b!1166363 (= e!663195 true)))

(declare-fun minValue!944 () V!44073)

(declare-fun zeroValue!944 () V!44073)

(declare-datatypes ((tuple2!18730 0))(
  ( (tuple2!18731 (_1!9376 (_ BitVec 64)) (_2!9376 V!44073)) )
))
(declare-datatypes ((List!25469 0))(
  ( (Nil!25466) (Cons!25465 (h!26683 tuple2!18730) (t!37132 List!25469)) )
))
(declare-datatypes ((ListLongMap!16707 0))(
  ( (ListLongMap!16708 (toList!8369 List!25469)) )
))
(declare-fun lt!525295 () ListLongMap!16707)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4860 (array!75303 array!75305 (_ BitVec 32) (_ BitVec 32) V!44073 V!44073 (_ BitVec 32) Int) ListLongMap!16707)

(declare-fun dynLambda!2849 (Int (_ BitVec 64)) V!44073)

(assert (=> b!1166363 (= lt!525295 (getCurrentListMapNoExtraKeys!4860 lt!525294 (array!75306 (store (arr!36297 _values!996) i!673 (ValueCellFull!13895 (dynLambda!2849 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36834 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525293 () ListLongMap!16707)

(assert (=> b!1166363 (= lt!525293 (getCurrentListMapNoExtraKeys!4860 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166364 () Bool)

(declare-fun res!773157 () Bool)

(assert (=> b!1166364 (=> (not res!773157) (not e!663190))))

(assert (=> b!1166364 (= res!773157 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36833 _keys!1208))))))

(declare-fun mapNonEmpty!45638 () Bool)

(declare-fun tp!86747 () Bool)

(assert (=> mapNonEmpty!45638 (= mapRes!45638 (and tp!86747 e!663193))))

(declare-fun mapRest!45638 () (Array (_ BitVec 32) ValueCell!13895))

(declare-fun mapValue!45638 () ValueCell!13895)

(declare-fun mapKey!45638 () (_ BitVec 32))

(assert (=> mapNonEmpty!45638 (= (arr!36297 _values!996) (store mapRest!45638 mapKey!45638 mapValue!45638))))

(declare-fun mapIsEmpty!45638 () Bool)

(assert (=> mapIsEmpty!45638 mapRes!45638))

(assert (= (and start!99310 res!773164) b!1166360))

(assert (= (and b!1166360 res!773162) b!1166356))

(assert (= (and b!1166356 res!773161) b!1166352))

(assert (= (and b!1166352 res!773159) b!1166353))

(assert (= (and b!1166353 res!773165) b!1166364))

(assert (= (and b!1166364 res!773157) b!1166358))

(assert (= (and b!1166358 res!773158) b!1166351))

(assert (= (and b!1166351 res!773160) b!1166357))

(assert (= (and b!1166357 res!773163) b!1166355))

(assert (= (and b!1166355 res!773156) b!1166361))

(assert (= (and b!1166361 (not res!773166)) b!1166363))

(assert (= (and b!1166362 condMapEmpty!45638) mapIsEmpty!45638))

(assert (= (and b!1166362 (not condMapEmpty!45638)) mapNonEmpty!45638))

(get-info :version)

(assert (= (and mapNonEmpty!45638 ((_ is ValueCellFull!13895) mapValue!45638)) b!1166359))

(assert (= (and b!1166362 ((_ is ValueCellFull!13895) mapDefault!45638)) b!1166354))

(assert (= start!99310 b!1166362))

(declare-fun b_lambda!19779 () Bool)

(assert (=> (not b_lambda!19779) (not b!1166363)))

(declare-fun t!37130 () Bool)

(declare-fun tb!9483 () Bool)

(assert (=> (and start!99310 (= defaultEntry!1004 defaultEntry!1004) t!37130) tb!9483))

(declare-fun result!19539 () Bool)

(assert (=> tb!9483 (= result!19539 tp_is_empty!29209)))

(assert (=> b!1166363 t!37130))

(declare-fun b_and!40211 () Bool)

(assert (= b_and!40209 (and (=> t!37130 result!19539) b_and!40211)))

(declare-fun m!1074917 () Bool)

(assert (=> b!1166353 m!1074917))

(declare-fun m!1074919 () Bool)

(assert (=> b!1166351 m!1074919))

(declare-fun m!1074921 () Bool)

(assert (=> b!1166361 m!1074921))

(declare-fun m!1074923 () Bool)

(assert (=> b!1166361 m!1074923))

(declare-fun m!1074925 () Bool)

(assert (=> b!1166363 m!1074925))

(declare-fun m!1074927 () Bool)

(assert (=> b!1166363 m!1074927))

(declare-fun m!1074929 () Bool)

(assert (=> b!1166363 m!1074929))

(declare-fun m!1074931 () Bool)

(assert (=> b!1166363 m!1074931))

(declare-fun m!1074933 () Bool)

(assert (=> mapNonEmpty!45638 m!1074933))

(declare-fun m!1074935 () Bool)

(assert (=> b!1166357 m!1074935))

(declare-fun m!1074937 () Bool)

(assert (=> b!1166357 m!1074937))

(declare-fun m!1074939 () Bool)

(assert (=> b!1166360 m!1074939))

(declare-fun m!1074941 () Bool)

(assert (=> b!1166358 m!1074941))

(declare-fun m!1074943 () Bool)

(assert (=> b!1166355 m!1074943))

(declare-fun m!1074945 () Bool)

(assert (=> b!1166352 m!1074945))

(declare-fun m!1074947 () Bool)

(assert (=> start!99310 m!1074947))

(declare-fun m!1074949 () Bool)

(assert (=> start!99310 m!1074949))

(check-sat (not b!1166357) (not mapNonEmpty!45638) (not b!1166361) (not b_next!24679) (not b!1166353) (not b!1166358) b_and!40211 (not b!1166352) (not b!1166360) (not b_lambda!19779) (not b!1166363) (not start!99310) tp_is_empty!29209 (not b!1166355))
(check-sat b_and!40211 (not b_next!24679))
