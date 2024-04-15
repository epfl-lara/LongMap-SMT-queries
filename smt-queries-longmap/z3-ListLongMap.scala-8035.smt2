; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99044 () Bool)

(assert start!99044)

(declare-fun b_free!24655 () Bool)

(declare-fun b_next!24655 () Bool)

(assert (=> start!99044 (= b_free!24655 (not b_next!24655))))

(declare-fun tp!86676 () Bool)

(declare-fun b_and!40137 () Bool)

(assert (=> start!99044 (= tp!86676 b_and!40137)))

(declare-fun b!1164410 () Bool)

(declare-fun e!662034 () Bool)

(declare-fun e!662033 () Bool)

(assert (=> b!1164410 (= e!662034 e!662033)))

(declare-fun res!772189 () Bool)

(assert (=> b!1164410 (=> (not res!772189) (not e!662033))))

(declare-datatypes ((array!75126 0))(
  ( (array!75127 (arr!36214 (Array (_ BitVec 32) (_ BitVec 64))) (size!36752 (_ BitVec 32))) )
))
(declare-fun lt!524475 () array!75126)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75126 (_ BitVec 32)) Bool)

(assert (=> b!1164410 (= res!772189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524475 mask!1564))))

(declare-fun _keys!1208 () array!75126)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164410 (= lt!524475 (array!75127 (store (arr!36214 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36752 _keys!1208)))))

(declare-fun b!1164411 () Bool)

(declare-fun res!772191 () Bool)

(assert (=> b!1164411 (=> (not res!772191) (not e!662034))))

(declare-datatypes ((List!25481 0))(
  ( (Nil!25478) (Cons!25477 (h!26686 (_ BitVec 64)) (t!37119 List!25481)) )
))
(declare-fun arrayNoDuplicates!0 (array!75126 (_ BitVec 32) List!25481) Bool)

(assert (=> b!1164411 (= res!772191 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25478))))

(declare-fun b!1164412 () Bool)

(declare-fun res!772196 () Bool)

(assert (=> b!1164412 (=> (not res!772196) (not e!662034))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1164412 (= res!772196 (= (select (arr!36214 _keys!1208) i!673) k0!934))))

(declare-fun b!1164413 () Bool)

(declare-fun res!772186 () Bool)

(assert (=> b!1164413 (=> (not res!772186) (not e!662034))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44041 0))(
  ( (V!44042 (val!14649 Int)) )
))
(declare-datatypes ((ValueCell!13883 0))(
  ( (ValueCellFull!13883 (v!17285 V!44041)) (EmptyCell!13883) )
))
(declare-datatypes ((array!75128 0))(
  ( (array!75129 (arr!36215 (Array (_ BitVec 32) ValueCell!13883)) (size!36753 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75128)

(assert (=> b!1164413 (= res!772186 (and (= (size!36753 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36752 _keys!1208) (size!36753 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164414 () Bool)

(declare-fun res!772195 () Bool)

(assert (=> b!1164414 (=> (not res!772195) (not e!662034))))

(assert (=> b!1164414 (= res!772195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164415 () Bool)

(declare-fun e!662031 () Bool)

(assert (=> b!1164415 (= e!662031 true)))

(declare-fun zeroValue!944 () V!44041)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44041)

(declare-datatypes ((tuple2!18764 0))(
  ( (tuple2!18765 (_1!9393 (_ BitVec 64)) (_2!9393 V!44041)) )
))
(declare-datatypes ((List!25482 0))(
  ( (Nil!25479) (Cons!25478 (h!26687 tuple2!18764) (t!37120 List!25482)) )
))
(declare-datatypes ((ListLongMap!16733 0))(
  ( (ListLongMap!16734 (toList!8382 List!25482)) )
))
(declare-fun lt!524474 () ListLongMap!16733)

(declare-fun getCurrentListMapNoExtraKeys!4858 (array!75126 array!75128 (_ BitVec 32) (_ BitVec 32) V!44041 V!44041 (_ BitVec 32) Int) ListLongMap!16733)

(declare-fun dynLambda!2791 (Int (_ BitVec 64)) V!44041)

(assert (=> b!1164415 (= lt!524474 (getCurrentListMapNoExtraKeys!4858 lt!524475 (array!75129 (store (arr!36215 _values!996) i!673 (ValueCellFull!13883 (dynLambda!2791 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36753 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524473 () ListLongMap!16733)

(assert (=> b!1164415 (= lt!524473 (getCurrentListMapNoExtraKeys!4858 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45602 () Bool)

(declare-fun mapRes!45602 () Bool)

(assert (=> mapIsEmpty!45602 mapRes!45602))

(declare-fun b!1164416 () Bool)

(declare-fun e!662028 () Bool)

(declare-fun tp_is_empty!29185 () Bool)

(assert (=> b!1164416 (= e!662028 tp_is_empty!29185)))

(declare-fun b!1164417 () Bool)

(declare-fun e!662029 () Bool)

(assert (=> b!1164417 (= e!662029 tp_is_empty!29185)))

(declare-fun mapNonEmpty!45602 () Bool)

(declare-fun tp!86675 () Bool)

(assert (=> mapNonEmpty!45602 (= mapRes!45602 (and tp!86675 e!662029))))

(declare-fun mapRest!45602 () (Array (_ BitVec 32) ValueCell!13883))

(declare-fun mapValue!45602 () ValueCell!13883)

(declare-fun mapKey!45602 () (_ BitVec 32))

(assert (=> mapNonEmpty!45602 (= (arr!36215 _values!996) (store mapRest!45602 mapKey!45602 mapValue!45602))))

(declare-fun b!1164418 () Bool)

(assert (=> b!1164418 (= e!662033 (not e!662031))))

(declare-fun res!772188 () Bool)

(assert (=> b!1164418 (=> res!772188 e!662031)))

(assert (=> b!1164418 (= res!772188 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164418 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38263 0))(
  ( (Unit!38264) )
))
(declare-fun lt!524472 () Unit!38263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75126 (_ BitVec 64) (_ BitVec 32)) Unit!38263)

(assert (=> b!1164418 (= lt!524472 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!772194 () Bool)

(assert (=> start!99044 (=> (not res!772194) (not e!662034))))

(assert (=> start!99044 (= res!772194 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36752 _keys!1208))))))

(assert (=> start!99044 e!662034))

(assert (=> start!99044 tp_is_empty!29185))

(declare-fun array_inv!27806 (array!75126) Bool)

(assert (=> start!99044 (array_inv!27806 _keys!1208)))

(assert (=> start!99044 true))

(assert (=> start!99044 tp!86676))

(declare-fun e!662032 () Bool)

(declare-fun array_inv!27807 (array!75128) Bool)

(assert (=> start!99044 (and (array_inv!27807 _values!996) e!662032)))

(declare-fun b!1164419 () Bool)

(assert (=> b!1164419 (= e!662032 (and e!662028 mapRes!45602))))

(declare-fun condMapEmpty!45602 () Bool)

(declare-fun mapDefault!45602 () ValueCell!13883)

(assert (=> b!1164419 (= condMapEmpty!45602 (= (arr!36215 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13883)) mapDefault!45602)))))

(declare-fun b!1164420 () Bool)

(declare-fun res!772193 () Bool)

(assert (=> b!1164420 (=> (not res!772193) (not e!662034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164420 (= res!772193 (validKeyInArray!0 k0!934))))

(declare-fun b!1164421 () Bool)

(declare-fun res!772190 () Bool)

(assert (=> b!1164421 (=> (not res!772190) (not e!662034))))

(assert (=> b!1164421 (= res!772190 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36752 _keys!1208))))))

(declare-fun b!1164422 () Bool)

(declare-fun res!772192 () Bool)

(assert (=> b!1164422 (=> (not res!772192) (not e!662034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164422 (= res!772192 (validMask!0 mask!1564))))

(declare-fun b!1164423 () Bool)

(declare-fun res!772187 () Bool)

(assert (=> b!1164423 (=> (not res!772187) (not e!662033))))

(assert (=> b!1164423 (= res!772187 (arrayNoDuplicates!0 lt!524475 #b00000000000000000000000000000000 Nil!25478))))

(assert (= (and start!99044 res!772194) b!1164422))

(assert (= (and b!1164422 res!772192) b!1164413))

(assert (= (and b!1164413 res!772186) b!1164414))

(assert (= (and b!1164414 res!772195) b!1164411))

(assert (= (and b!1164411 res!772191) b!1164421))

(assert (= (and b!1164421 res!772190) b!1164420))

(assert (= (and b!1164420 res!772193) b!1164412))

(assert (= (and b!1164412 res!772196) b!1164410))

(assert (= (and b!1164410 res!772189) b!1164423))

(assert (= (and b!1164423 res!772187) b!1164418))

(assert (= (and b!1164418 (not res!772188)) b!1164415))

(assert (= (and b!1164419 condMapEmpty!45602) mapIsEmpty!45602))

(assert (= (and b!1164419 (not condMapEmpty!45602)) mapNonEmpty!45602))

(get-info :version)

(assert (= (and mapNonEmpty!45602 ((_ is ValueCellFull!13883) mapValue!45602)) b!1164417))

(assert (= (and b!1164419 ((_ is ValueCellFull!13883) mapDefault!45602)) b!1164416))

(assert (= start!99044 b!1164419))

(declare-fun b_lambda!19743 () Bool)

(assert (=> (not b_lambda!19743) (not b!1164415)))

(declare-fun t!37118 () Bool)

(declare-fun tb!9459 () Bool)

(assert (=> (and start!99044 (= defaultEntry!1004 defaultEntry!1004) t!37118) tb!9459))

(declare-fun result!19491 () Bool)

(assert (=> tb!9459 (= result!19491 tp_is_empty!29185)))

(assert (=> b!1164415 t!37118))

(declare-fun b_and!40139 () Bool)

(assert (= b_and!40137 (and (=> t!37118 result!19491) b_and!40139)))

(declare-fun m!1072327 () Bool)

(assert (=> b!1164423 m!1072327))

(declare-fun m!1072329 () Bool)

(assert (=> b!1164420 m!1072329))

(declare-fun m!1072331 () Bool)

(assert (=> b!1164412 m!1072331))

(declare-fun m!1072333 () Bool)

(assert (=> b!1164411 m!1072333))

(declare-fun m!1072335 () Bool)

(assert (=> b!1164414 m!1072335))

(declare-fun m!1072337 () Bool)

(assert (=> b!1164410 m!1072337))

(declare-fun m!1072339 () Bool)

(assert (=> b!1164410 m!1072339))

(declare-fun m!1072341 () Bool)

(assert (=> start!99044 m!1072341))

(declare-fun m!1072343 () Bool)

(assert (=> start!99044 m!1072343))

(declare-fun m!1072345 () Bool)

(assert (=> b!1164418 m!1072345))

(declare-fun m!1072347 () Bool)

(assert (=> b!1164418 m!1072347))

(declare-fun m!1072349 () Bool)

(assert (=> b!1164422 m!1072349))

(declare-fun m!1072351 () Bool)

(assert (=> b!1164415 m!1072351))

(declare-fun m!1072353 () Bool)

(assert (=> b!1164415 m!1072353))

(declare-fun m!1072355 () Bool)

(assert (=> b!1164415 m!1072355))

(declare-fun m!1072357 () Bool)

(assert (=> b!1164415 m!1072357))

(declare-fun m!1072359 () Bool)

(assert (=> mapNonEmpty!45602 m!1072359))

(check-sat (not b!1164420) (not b!1164410) (not b_next!24655) (not b!1164422) (not mapNonEmpty!45602) (not start!99044) (not b!1164414) (not b!1164418) (not b!1164411) (not b!1164423) tp_is_empty!29185 (not b!1164415) b_and!40139 (not b_lambda!19743))
(check-sat b_and!40139 (not b_next!24655))
