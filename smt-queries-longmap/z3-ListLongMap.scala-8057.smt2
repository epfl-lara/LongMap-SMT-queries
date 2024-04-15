; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99176 () Bool)

(assert start!99176)

(declare-fun b_free!24787 () Bool)

(declare-fun b_next!24787 () Bool)

(assert (=> start!99176 (= b_free!24787 (not b_next!24787))))

(declare-fun tp!87071 () Bool)

(declare-fun b_and!40401 () Bool)

(assert (=> start!99176 (= tp!87071 b_and!40401)))

(declare-fun b!1167424 () Bool)

(declare-fun e!663526 () Bool)

(declare-fun e!663530 () Bool)

(assert (=> b!1167424 (= e!663526 (not e!663530))))

(declare-fun res!774478 () Bool)

(assert (=> b!1167424 (=> res!774478 e!663530)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167424 (= res!774478 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75384 0))(
  ( (array!75385 (arr!36343 (Array (_ BitVec 32) (_ BitVec 64))) (size!36881 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75384)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167424 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38353 0))(
  ( (Unit!38354) )
))
(declare-fun lt!525487 () Unit!38353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75384 (_ BitVec 64) (_ BitVec 32)) Unit!38353)

(assert (=> b!1167424 (= lt!525487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45800 () Bool)

(declare-fun mapRes!45800 () Bool)

(assert (=> mapIsEmpty!45800 mapRes!45800))

(declare-fun b!1167425 () Bool)

(declare-fun res!774477 () Bool)

(declare-fun e!663524 () Bool)

(assert (=> b!1167425 (=> (not res!774477) (not e!663524))))

(assert (=> b!1167425 (= res!774477 (= (select (arr!36343 _keys!1208) i!673) k0!934))))

(declare-fun b!1167426 () Bool)

(declare-fun res!774482 () Bool)

(assert (=> b!1167426 (=> (not res!774482) (not e!663524))))

(assert (=> b!1167426 (= res!774482 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36881 _keys!1208))))))

(declare-fun b!1167427 () Bool)

(declare-fun e!663527 () Bool)

(declare-fun e!663525 () Bool)

(assert (=> b!1167427 (= e!663527 (and e!663525 mapRes!45800))))

(declare-fun condMapEmpty!45800 () Bool)

(declare-datatypes ((V!44217 0))(
  ( (V!44218 (val!14715 Int)) )
))
(declare-datatypes ((ValueCell!13949 0))(
  ( (ValueCellFull!13949 (v!17351 V!44217)) (EmptyCell!13949) )
))
(declare-datatypes ((array!75386 0))(
  ( (array!75387 (arr!36344 (Array (_ BitVec 32) ValueCell!13949)) (size!36882 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75386)

(declare-fun mapDefault!45800 () ValueCell!13949)

(assert (=> b!1167427 (= condMapEmpty!45800 (= (arr!36344 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13949)) mapDefault!45800)))))

(declare-fun b!1167428 () Bool)

(declare-fun e!663528 () Bool)

(declare-fun tp_is_empty!29317 () Bool)

(assert (=> b!1167428 (= e!663528 tp_is_empty!29317)))

(declare-fun b!1167430 () Bool)

(declare-fun res!774483 () Bool)

(assert (=> b!1167430 (=> (not res!774483) (not e!663524))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167430 (= res!774483 (validMask!0 mask!1564))))

(declare-fun b!1167431 () Bool)

(assert (=> b!1167431 (= e!663525 tp_is_empty!29317)))

(declare-fun b!1167432 () Bool)

(declare-fun e!663529 () Bool)

(assert (=> b!1167432 (= e!663530 e!663529)))

(declare-fun res!774485 () Bool)

(assert (=> b!1167432 (=> res!774485 e!663529)))

(assert (=> b!1167432 (= res!774485 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44217)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18866 0))(
  ( (tuple2!18867 (_1!9444 (_ BitVec 64)) (_2!9444 V!44217)) )
))
(declare-datatypes ((List!25580 0))(
  ( (Nil!25577) (Cons!25576 (h!26785 tuple2!18866) (t!37350 List!25580)) )
))
(declare-datatypes ((ListLongMap!16835 0))(
  ( (ListLongMap!16836 (toList!8433 List!25580)) )
))
(declare-fun lt!525485 () ListLongMap!16835)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525488 () array!75384)

(declare-fun minValue!944 () V!44217)

(declare-fun lt!525486 () array!75386)

(declare-fun getCurrentListMapNoExtraKeys!4909 (array!75384 array!75386 (_ BitVec 32) (_ BitVec 32) V!44217 V!44217 (_ BitVec 32) Int) ListLongMap!16835)

(assert (=> b!1167432 (= lt!525485 (getCurrentListMapNoExtraKeys!4909 lt!525488 lt!525486 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2841 (Int (_ BitVec 64)) V!44217)

(assert (=> b!1167432 (= lt!525486 (array!75387 (store (arr!36344 _values!996) i!673 (ValueCellFull!13949 (dynLambda!2841 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36882 _values!996)))))

(declare-fun lt!525489 () ListLongMap!16835)

(assert (=> b!1167432 (= lt!525489 (getCurrentListMapNoExtraKeys!4909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167433 () Bool)

(declare-fun res!774474 () Bool)

(assert (=> b!1167433 (=> (not res!774474) (not e!663524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167433 (= res!774474 (validKeyInArray!0 k0!934))))

(declare-fun b!1167434 () Bool)

(assert (=> b!1167434 (= e!663524 e!663526)))

(declare-fun res!774484 () Bool)

(assert (=> b!1167434 (=> (not res!774484) (not e!663526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75384 (_ BitVec 32)) Bool)

(assert (=> b!1167434 (= res!774484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525488 mask!1564))))

(assert (=> b!1167434 (= lt!525488 (array!75385 (store (arr!36343 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36881 _keys!1208)))))

(declare-fun b!1167435 () Bool)

(assert (=> b!1167435 (= e!663529 true)))

(declare-fun -!1442 (ListLongMap!16835 (_ BitVec 64)) ListLongMap!16835)

(assert (=> b!1167435 (= (getCurrentListMapNoExtraKeys!4909 lt!525488 lt!525486 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1442 (getCurrentListMapNoExtraKeys!4909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525484 () Unit!38353)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 (array!75384 array!75386 (_ BitVec 32) (_ BitVec 32) V!44217 V!44217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38353)

(assert (=> b!1167435 (= lt!525484 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167436 () Bool)

(declare-fun res!774481 () Bool)

(assert (=> b!1167436 (=> (not res!774481) (not e!663526))))

(declare-datatypes ((List!25581 0))(
  ( (Nil!25578) (Cons!25577 (h!26786 (_ BitVec 64)) (t!37351 List!25581)) )
))
(declare-fun arrayNoDuplicates!0 (array!75384 (_ BitVec 32) List!25581) Bool)

(assert (=> b!1167436 (= res!774481 (arrayNoDuplicates!0 lt!525488 #b00000000000000000000000000000000 Nil!25578))))

(declare-fun mapNonEmpty!45800 () Bool)

(declare-fun tp!87072 () Bool)

(assert (=> mapNonEmpty!45800 (= mapRes!45800 (and tp!87072 e!663528))))

(declare-fun mapKey!45800 () (_ BitVec 32))

(declare-fun mapValue!45800 () ValueCell!13949)

(declare-fun mapRest!45800 () (Array (_ BitVec 32) ValueCell!13949))

(assert (=> mapNonEmpty!45800 (= (arr!36344 _values!996) (store mapRest!45800 mapKey!45800 mapValue!45800))))

(declare-fun b!1167429 () Bool)

(declare-fun res!774476 () Bool)

(assert (=> b!1167429 (=> (not res!774476) (not e!663524))))

(assert (=> b!1167429 (= res!774476 (and (= (size!36882 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36881 _keys!1208) (size!36882 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!774479 () Bool)

(assert (=> start!99176 (=> (not res!774479) (not e!663524))))

(assert (=> start!99176 (= res!774479 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36881 _keys!1208))))))

(assert (=> start!99176 e!663524))

(assert (=> start!99176 tp_is_empty!29317))

(declare-fun array_inv!27888 (array!75384) Bool)

(assert (=> start!99176 (array_inv!27888 _keys!1208)))

(assert (=> start!99176 true))

(assert (=> start!99176 tp!87071))

(declare-fun array_inv!27889 (array!75386) Bool)

(assert (=> start!99176 (and (array_inv!27889 _values!996) e!663527)))

(declare-fun b!1167437 () Bool)

(declare-fun res!774480 () Bool)

(assert (=> b!1167437 (=> (not res!774480) (not e!663524))))

(assert (=> b!1167437 (= res!774480 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25578))))

(declare-fun b!1167438 () Bool)

(declare-fun res!774475 () Bool)

(assert (=> b!1167438 (=> (not res!774475) (not e!663524))))

(assert (=> b!1167438 (= res!774475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99176 res!774479) b!1167430))

(assert (= (and b!1167430 res!774483) b!1167429))

(assert (= (and b!1167429 res!774476) b!1167438))

(assert (= (and b!1167438 res!774475) b!1167437))

(assert (= (and b!1167437 res!774480) b!1167426))

(assert (= (and b!1167426 res!774482) b!1167433))

(assert (= (and b!1167433 res!774474) b!1167425))

(assert (= (and b!1167425 res!774477) b!1167434))

(assert (= (and b!1167434 res!774484) b!1167436))

(assert (= (and b!1167436 res!774481) b!1167424))

(assert (= (and b!1167424 (not res!774478)) b!1167432))

(assert (= (and b!1167432 (not res!774485)) b!1167435))

(assert (= (and b!1167427 condMapEmpty!45800) mapIsEmpty!45800))

(assert (= (and b!1167427 (not condMapEmpty!45800)) mapNonEmpty!45800))

(get-info :version)

(assert (= (and mapNonEmpty!45800 ((_ is ValueCellFull!13949) mapValue!45800)) b!1167428))

(assert (= (and b!1167427 ((_ is ValueCellFull!13949) mapDefault!45800)) b!1167431))

(assert (= start!99176 b!1167427))

(declare-fun b_lambda!19875 () Bool)

(assert (=> (not b_lambda!19875) (not b!1167432)))

(declare-fun t!37349 () Bool)

(declare-fun tb!9591 () Bool)

(assert (=> (and start!99176 (= defaultEntry!1004 defaultEntry!1004) t!37349) tb!9591))

(declare-fun result!19755 () Bool)

(assert (=> tb!9591 (= result!19755 tp_is_empty!29317)))

(assert (=> b!1167432 t!37349))

(declare-fun b_and!40403 () Bool)

(assert (= b_and!40401 (and (=> t!37349 result!19755) b_and!40403)))

(declare-fun m!1074859 () Bool)

(assert (=> b!1167436 m!1074859))

(declare-fun m!1074861 () Bool)

(assert (=> b!1167424 m!1074861))

(declare-fun m!1074863 () Bool)

(assert (=> b!1167424 m!1074863))

(declare-fun m!1074865 () Bool)

(assert (=> b!1167425 m!1074865))

(declare-fun m!1074867 () Bool)

(assert (=> b!1167437 m!1074867))

(declare-fun m!1074869 () Bool)

(assert (=> b!1167434 m!1074869))

(declare-fun m!1074871 () Bool)

(assert (=> b!1167434 m!1074871))

(declare-fun m!1074873 () Bool)

(assert (=> b!1167435 m!1074873))

(declare-fun m!1074875 () Bool)

(assert (=> b!1167435 m!1074875))

(assert (=> b!1167435 m!1074875))

(declare-fun m!1074877 () Bool)

(assert (=> b!1167435 m!1074877))

(declare-fun m!1074879 () Bool)

(assert (=> b!1167435 m!1074879))

(declare-fun m!1074881 () Bool)

(assert (=> b!1167430 m!1074881))

(declare-fun m!1074883 () Bool)

(assert (=> b!1167438 m!1074883))

(declare-fun m!1074885 () Bool)

(assert (=> start!99176 m!1074885))

(declare-fun m!1074887 () Bool)

(assert (=> start!99176 m!1074887))

(declare-fun m!1074889 () Bool)

(assert (=> b!1167432 m!1074889))

(declare-fun m!1074891 () Bool)

(assert (=> b!1167432 m!1074891))

(declare-fun m!1074893 () Bool)

(assert (=> b!1167432 m!1074893))

(declare-fun m!1074895 () Bool)

(assert (=> b!1167432 m!1074895))

(declare-fun m!1074897 () Bool)

(assert (=> mapNonEmpty!45800 m!1074897))

(declare-fun m!1074899 () Bool)

(assert (=> b!1167433 m!1074899))

(check-sat (not b!1167435) (not b!1167436) (not b!1167432) (not b!1167430) (not b!1167437) (not mapNonEmpty!45800) (not b!1167434) (not b_lambda!19875) (not b!1167424) (not b_next!24787) (not b!1167438) (not b!1167433) tp_is_empty!29317 b_and!40403 (not start!99176))
(check-sat b_and!40403 (not b_next!24787))
