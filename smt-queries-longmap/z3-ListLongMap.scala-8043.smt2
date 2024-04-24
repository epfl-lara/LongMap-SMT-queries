; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99334 () Bool)

(assert start!99334)

(declare-fun b_free!24703 () Bool)

(declare-fun b_next!24703 () Bool)

(assert (=> start!99334 (= b_free!24703 (not b_next!24703))))

(declare-fun tp!86819 () Bool)

(declare-fun b_and!40257 () Bool)

(assert (=> start!99334 (= tp!86819 b_and!40257)))

(declare-fun b!1166879 () Bool)

(declare-fun res!773557 () Bool)

(declare-fun e!663446 () Bool)

(assert (=> b!1166879 (=> (not res!773557) (not e!663446))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166879 (= res!773557 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45674 () Bool)

(declare-fun mapRes!45674 () Bool)

(assert (=> mapIsEmpty!45674 mapRes!45674))

(declare-fun b!1166880 () Bool)

(declare-fun e!663448 () Bool)

(declare-fun tp_is_empty!29233 () Bool)

(assert (=> b!1166880 (= e!663448 tp_is_empty!29233)))

(declare-fun res!773559 () Bool)

(assert (=> start!99334 (=> (not res!773559) (not e!663446))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75347 0))(
  ( (array!75348 (arr!36318 (Array (_ BitVec 32) (_ BitVec 64))) (size!36855 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75347)

(assert (=> start!99334 (= res!773559 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36855 _keys!1208))))))

(assert (=> start!99334 e!663446))

(assert (=> start!99334 tp_is_empty!29233))

(declare-fun array_inv!27846 (array!75347) Bool)

(assert (=> start!99334 (array_inv!27846 _keys!1208)))

(assert (=> start!99334 true))

(assert (=> start!99334 tp!86819))

(declare-datatypes ((V!44105 0))(
  ( (V!44106 (val!14673 Int)) )
))
(declare-datatypes ((ValueCell!13907 0))(
  ( (ValueCellFull!13907 (v!17306 V!44105)) (EmptyCell!13907) )
))
(declare-datatypes ((array!75349 0))(
  ( (array!75350 (arr!36319 (Array (_ BitVec 32) ValueCell!13907)) (size!36856 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75349)

(declare-fun e!663444 () Bool)

(declare-fun array_inv!27847 (array!75349) Bool)

(assert (=> start!99334 (and (array_inv!27847 _values!996) e!663444)))

(declare-fun b!1166881 () Bool)

(declare-fun res!773555 () Bool)

(assert (=> b!1166881 (=> (not res!773555) (not e!663446))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166881 (= res!773555 (validMask!0 mask!1564))))

(declare-fun b!1166882 () Bool)

(declare-fun res!773562 () Bool)

(assert (=> b!1166882 (=> (not res!773562) (not e!663446))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166882 (= res!773562 (and (= (size!36856 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36855 _keys!1208) (size!36856 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166883 () Bool)

(declare-fun res!773558 () Bool)

(declare-fun e!663445 () Bool)

(assert (=> b!1166883 (=> (not res!773558) (not e!663445))))

(declare-fun lt!525438 () array!75347)

(declare-datatypes ((List!25484 0))(
  ( (Nil!25481) (Cons!25480 (h!26698 (_ BitVec 64)) (t!37171 List!25484)) )
))
(declare-fun arrayNoDuplicates!0 (array!75347 (_ BitVec 32) List!25484) Bool)

(assert (=> b!1166883 (= res!773558 (arrayNoDuplicates!0 lt!525438 #b00000000000000000000000000000000 Nil!25481))))

(declare-fun b!1166884 () Bool)

(assert (=> b!1166884 (= e!663446 e!663445)))

(declare-fun res!773554 () Bool)

(assert (=> b!1166884 (=> (not res!773554) (not e!663445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75347 (_ BitVec 32)) Bool)

(assert (=> b!1166884 (= res!773554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525438 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166884 (= lt!525438 (array!75348 (store (arr!36318 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36855 _keys!1208)))))

(declare-fun b!1166885 () Bool)

(declare-fun res!773560 () Bool)

(assert (=> b!1166885 (=> (not res!773560) (not e!663446))))

(assert (=> b!1166885 (= res!773560 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36855 _keys!1208))))))

(declare-fun b!1166886 () Bool)

(declare-fun res!773556 () Bool)

(assert (=> b!1166886 (=> (not res!773556) (not e!663446))))

(assert (=> b!1166886 (= res!773556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166887 () Bool)

(declare-fun e!663447 () Bool)

(assert (=> b!1166887 (= e!663445 (not e!663447))))

(declare-fun res!773553 () Bool)

(assert (=> b!1166887 (=> res!773553 e!663447)))

(assert (=> b!1166887 (= res!773553 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166887 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38457 0))(
  ( (Unit!38458) )
))
(declare-fun lt!525439 () Unit!38457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75347 (_ BitVec 64) (_ BitVec 32)) Unit!38457)

(assert (=> b!1166887 (= lt!525439 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166888 () Bool)

(declare-fun res!773561 () Bool)

(assert (=> b!1166888 (=> (not res!773561) (not e!663446))))

(assert (=> b!1166888 (= res!773561 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25481))))

(declare-fun b!1166889 () Bool)

(declare-fun e!663442 () Bool)

(assert (=> b!1166889 (= e!663442 tp_is_empty!29233)))

(declare-fun b!1166890 () Bool)

(declare-fun res!773552 () Bool)

(assert (=> b!1166890 (=> (not res!773552) (not e!663446))))

(assert (=> b!1166890 (= res!773552 (= (select (arr!36318 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45674 () Bool)

(declare-fun tp!86820 () Bool)

(assert (=> mapNonEmpty!45674 (= mapRes!45674 (and tp!86820 e!663448))))

(declare-fun mapKey!45674 () (_ BitVec 32))

(declare-fun mapValue!45674 () ValueCell!13907)

(declare-fun mapRest!45674 () (Array (_ BitVec 32) ValueCell!13907))

(assert (=> mapNonEmpty!45674 (= (arr!36319 _values!996) (store mapRest!45674 mapKey!45674 mapValue!45674))))

(declare-fun b!1166891 () Bool)

(assert (=> b!1166891 (= e!663447 true)))

(declare-fun zeroValue!944 () V!44105)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18744 0))(
  ( (tuple2!18745 (_1!9383 (_ BitVec 64)) (_2!9383 V!44105)) )
))
(declare-datatypes ((List!25485 0))(
  ( (Nil!25482) (Cons!25481 (h!26699 tuple2!18744) (t!37172 List!25485)) )
))
(declare-datatypes ((ListLongMap!16721 0))(
  ( (ListLongMap!16722 (toList!8376 List!25485)) )
))
(declare-fun lt!525437 () ListLongMap!16721)

(declare-fun minValue!944 () V!44105)

(declare-fun getCurrentListMapNoExtraKeys!4867 (array!75347 array!75349 (_ BitVec 32) (_ BitVec 32) V!44105 V!44105 (_ BitVec 32) Int) ListLongMap!16721)

(declare-fun dynLambda!2856 (Int (_ BitVec 64)) V!44105)

(assert (=> b!1166891 (= lt!525437 (getCurrentListMapNoExtraKeys!4867 lt!525438 (array!75350 (store (arr!36319 _values!996) i!673 (ValueCellFull!13907 (dynLambda!2856 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36856 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525436 () ListLongMap!16721)

(assert (=> b!1166891 (= lt!525436 (getCurrentListMapNoExtraKeys!4867 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166892 () Bool)

(assert (=> b!1166892 (= e!663444 (and e!663442 mapRes!45674))))

(declare-fun condMapEmpty!45674 () Bool)

(declare-fun mapDefault!45674 () ValueCell!13907)

(assert (=> b!1166892 (= condMapEmpty!45674 (= (arr!36319 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13907)) mapDefault!45674)))))

(assert (= (and start!99334 res!773559) b!1166881))

(assert (= (and b!1166881 res!773555) b!1166882))

(assert (= (and b!1166882 res!773562) b!1166886))

(assert (= (and b!1166886 res!773556) b!1166888))

(assert (= (and b!1166888 res!773561) b!1166885))

(assert (= (and b!1166885 res!773560) b!1166879))

(assert (= (and b!1166879 res!773557) b!1166890))

(assert (= (and b!1166890 res!773552) b!1166884))

(assert (= (and b!1166884 res!773554) b!1166883))

(assert (= (and b!1166883 res!773558) b!1166887))

(assert (= (and b!1166887 (not res!773553)) b!1166891))

(assert (= (and b!1166892 condMapEmpty!45674) mapIsEmpty!45674))

(assert (= (and b!1166892 (not condMapEmpty!45674)) mapNonEmpty!45674))

(get-info :version)

(assert (= (and mapNonEmpty!45674 ((_ is ValueCellFull!13907) mapValue!45674)) b!1166880))

(assert (= (and b!1166892 ((_ is ValueCellFull!13907) mapDefault!45674)) b!1166889))

(assert (= start!99334 b!1166892))

(declare-fun b_lambda!19803 () Bool)

(assert (=> (not b_lambda!19803) (not b!1166891)))

(declare-fun t!37170 () Bool)

(declare-fun tb!9507 () Bool)

(assert (=> (and start!99334 (= defaultEntry!1004 defaultEntry!1004) t!37170) tb!9507))

(declare-fun result!19587 () Bool)

(assert (=> tb!9507 (= result!19587 tp_is_empty!29233)))

(assert (=> b!1166891 t!37170))

(declare-fun b_and!40259 () Bool)

(assert (= b_and!40257 (and (=> t!37170 result!19587) b_and!40259)))

(declare-fun m!1075325 () Bool)

(assert (=> start!99334 m!1075325))

(declare-fun m!1075327 () Bool)

(assert (=> start!99334 m!1075327))

(declare-fun m!1075329 () Bool)

(assert (=> b!1166884 m!1075329))

(declare-fun m!1075331 () Bool)

(assert (=> b!1166884 m!1075331))

(declare-fun m!1075333 () Bool)

(assert (=> b!1166888 m!1075333))

(declare-fun m!1075335 () Bool)

(assert (=> b!1166886 m!1075335))

(declare-fun m!1075337 () Bool)

(assert (=> b!1166879 m!1075337))

(declare-fun m!1075339 () Bool)

(assert (=> b!1166881 m!1075339))

(declare-fun m!1075341 () Bool)

(assert (=> mapNonEmpty!45674 m!1075341))

(declare-fun m!1075343 () Bool)

(assert (=> b!1166883 m!1075343))

(declare-fun m!1075345 () Bool)

(assert (=> b!1166887 m!1075345))

(declare-fun m!1075347 () Bool)

(assert (=> b!1166887 m!1075347))

(declare-fun m!1075349 () Bool)

(assert (=> b!1166890 m!1075349))

(declare-fun m!1075351 () Bool)

(assert (=> b!1166891 m!1075351))

(declare-fun m!1075353 () Bool)

(assert (=> b!1166891 m!1075353))

(declare-fun m!1075355 () Bool)

(assert (=> b!1166891 m!1075355))

(declare-fun m!1075357 () Bool)

(assert (=> b!1166891 m!1075357))

(check-sat (not b!1166887) (not b!1166886) (not b_lambda!19803) (not b!1166888) (not b!1166881) (not b_next!24703) (not b!1166884) (not mapNonEmpty!45674) b_and!40259 (not b!1166879) tp_is_empty!29233 (not start!99334) (not b!1166883) (not b!1166891))
(check-sat b_and!40259 (not b_next!24703))
