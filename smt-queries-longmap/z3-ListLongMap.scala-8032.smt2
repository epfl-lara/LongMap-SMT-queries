; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99268 () Bool)

(assert start!99268)

(declare-fun b_free!24637 () Bool)

(declare-fun b_next!24637 () Bool)

(assert (=> start!99268 (= b_free!24637 (not b_next!24637))))

(declare-fun tp!86621 () Bool)

(declare-fun b_and!40125 () Bool)

(assert (=> start!99268 (= tp!86621 b_and!40125)))

(declare-fun b!1165427 () Bool)

(declare-fun e!662753 () Bool)

(declare-fun e!662751 () Bool)

(assert (=> b!1165427 (= e!662753 (not e!662751))))

(declare-fun res!772470 () Bool)

(assert (=> b!1165427 (=> res!772470 e!662751)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165427 (= res!772470 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75221 0))(
  ( (array!75222 (arr!36255 (Array (_ BitVec 32) (_ BitVec 64))) (size!36792 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75221)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165427 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38409 0))(
  ( (Unit!38410) )
))
(declare-fun lt!525041 () Unit!38409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75221 (_ BitVec 64) (_ BitVec 32)) Unit!38409)

(assert (=> b!1165427 (= lt!525041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165428 () Bool)

(declare-fun res!772472 () Bool)

(declare-fun e!662754 () Bool)

(assert (=> b!1165428 (=> (not res!772472) (not e!662754))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165428 (= res!772472 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45575 () Bool)

(declare-fun mapRes!45575 () Bool)

(declare-fun tp!86622 () Bool)

(declare-fun e!662749 () Bool)

(assert (=> mapNonEmpty!45575 (= mapRes!45575 (and tp!86622 e!662749))))

(declare-datatypes ((V!44017 0))(
  ( (V!44018 (val!14640 Int)) )
))
(declare-datatypes ((ValueCell!13874 0))(
  ( (ValueCellFull!13874 (v!17273 V!44017)) (EmptyCell!13874) )
))
(declare-fun mapRest!45575 () (Array (_ BitVec 32) ValueCell!13874))

(declare-fun mapKey!45575 () (_ BitVec 32))

(declare-fun mapValue!45575 () ValueCell!13874)

(declare-datatypes ((array!75223 0))(
  ( (array!75224 (arr!36256 (Array (_ BitVec 32) ValueCell!13874)) (size!36793 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75223)

(assert (=> mapNonEmpty!45575 (= (arr!36256 _values!996) (store mapRest!45575 mapKey!45575 mapValue!45575))))

(declare-fun b!1165429 () Bool)

(declare-fun res!772469 () Bool)

(assert (=> b!1165429 (=> (not res!772469) (not e!662754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75221 (_ BitVec 32)) Bool)

(assert (=> b!1165429 (= res!772469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165430 () Bool)

(declare-fun res!772466 () Bool)

(assert (=> b!1165430 (=> (not res!772466) (not e!662754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165430 (= res!772466 (validKeyInArray!0 k0!934))))

(declare-fun b!1165431 () Bool)

(declare-fun res!772464 () Bool)

(assert (=> b!1165431 (=> (not res!772464) (not e!662754))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165431 (= res!772464 (and (= (size!36793 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36792 _keys!1208) (size!36793 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45575 () Bool)

(assert (=> mapIsEmpty!45575 mapRes!45575))

(declare-fun b!1165433 () Bool)

(declare-fun e!662755 () Bool)

(declare-fun tp_is_empty!29167 () Bool)

(assert (=> b!1165433 (= e!662755 tp_is_empty!29167)))

(declare-fun b!1165434 () Bool)

(declare-fun res!772471 () Bool)

(assert (=> b!1165434 (=> (not res!772471) (not e!662754))))

(declare-datatypes ((List!25435 0))(
  ( (Nil!25432) (Cons!25431 (h!26649 (_ BitVec 64)) (t!37056 List!25435)) )
))
(declare-fun arrayNoDuplicates!0 (array!75221 (_ BitVec 32) List!25435) Bool)

(assert (=> b!1165434 (= res!772471 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25432))))

(declare-fun b!1165435 () Bool)

(declare-fun res!772463 () Bool)

(assert (=> b!1165435 (=> (not res!772463) (not e!662754))))

(assert (=> b!1165435 (= res!772463 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36792 _keys!1208))))))

(declare-fun b!1165436 () Bool)

(declare-fun res!772473 () Bool)

(assert (=> b!1165436 (=> (not res!772473) (not e!662754))))

(assert (=> b!1165436 (= res!772473 (= (select (arr!36255 _keys!1208) i!673) k0!934))))

(declare-fun b!1165437 () Bool)

(declare-fun res!772467 () Bool)

(assert (=> b!1165437 (=> (not res!772467) (not e!662753))))

(declare-fun lt!525042 () array!75221)

(assert (=> b!1165437 (= res!772467 (arrayNoDuplicates!0 lt!525042 #b00000000000000000000000000000000 Nil!25432))))

(declare-fun b!1165438 () Bool)

(assert (=> b!1165438 (= e!662751 true)))

(declare-fun zeroValue!944 () V!44017)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44017)

(declare-datatypes ((tuple2!18700 0))(
  ( (tuple2!18701 (_1!9361 (_ BitVec 64)) (_2!9361 V!44017)) )
))
(declare-datatypes ((List!25436 0))(
  ( (Nil!25433) (Cons!25432 (h!26650 tuple2!18700) (t!37057 List!25436)) )
))
(declare-datatypes ((ListLongMap!16677 0))(
  ( (ListLongMap!16678 (toList!8354 List!25436)) )
))
(declare-fun lt!525043 () ListLongMap!16677)

(declare-fun getCurrentListMapNoExtraKeys!4845 (array!75221 array!75223 (_ BitVec 32) (_ BitVec 32) V!44017 V!44017 (_ BitVec 32) Int) ListLongMap!16677)

(declare-fun dynLambda!2834 (Int (_ BitVec 64)) V!44017)

(assert (=> b!1165438 (= lt!525043 (getCurrentListMapNoExtraKeys!4845 lt!525042 (array!75224 (store (arr!36256 _values!996) i!673 (ValueCellFull!13874 (dynLambda!2834 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36793 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525040 () ListLongMap!16677)

(assert (=> b!1165438 (= lt!525040 (getCurrentListMapNoExtraKeys!4845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165439 () Bool)

(assert (=> b!1165439 (= e!662749 tp_is_empty!29167)))

(declare-fun b!1165440 () Bool)

(declare-fun e!662750 () Bool)

(assert (=> b!1165440 (= e!662750 (and e!662755 mapRes!45575))))

(declare-fun condMapEmpty!45575 () Bool)

(declare-fun mapDefault!45575 () ValueCell!13874)

(assert (=> b!1165440 (= condMapEmpty!45575 (= (arr!36256 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13874)) mapDefault!45575)))))

(declare-fun b!1165432 () Bool)

(assert (=> b!1165432 (= e!662754 e!662753)))

(declare-fun res!772468 () Bool)

(assert (=> b!1165432 (=> (not res!772468) (not e!662753))))

(assert (=> b!1165432 (= res!772468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525042 mask!1564))))

(assert (=> b!1165432 (= lt!525042 (array!75222 (store (arr!36255 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36792 _keys!1208)))))

(declare-fun res!772465 () Bool)

(assert (=> start!99268 (=> (not res!772465) (not e!662754))))

(assert (=> start!99268 (= res!772465 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36792 _keys!1208))))))

(assert (=> start!99268 e!662754))

(assert (=> start!99268 tp_is_empty!29167))

(declare-fun array_inv!27804 (array!75221) Bool)

(assert (=> start!99268 (array_inv!27804 _keys!1208)))

(assert (=> start!99268 true))

(assert (=> start!99268 tp!86621))

(declare-fun array_inv!27805 (array!75223) Bool)

(assert (=> start!99268 (and (array_inv!27805 _values!996) e!662750)))

(assert (= (and start!99268 res!772465) b!1165428))

(assert (= (and b!1165428 res!772472) b!1165431))

(assert (= (and b!1165431 res!772464) b!1165429))

(assert (= (and b!1165429 res!772469) b!1165434))

(assert (= (and b!1165434 res!772471) b!1165435))

(assert (= (and b!1165435 res!772463) b!1165430))

(assert (= (and b!1165430 res!772466) b!1165436))

(assert (= (and b!1165436 res!772473) b!1165432))

(assert (= (and b!1165432 res!772468) b!1165437))

(assert (= (and b!1165437 res!772467) b!1165427))

(assert (= (and b!1165427 (not res!772470)) b!1165438))

(assert (= (and b!1165440 condMapEmpty!45575) mapIsEmpty!45575))

(assert (= (and b!1165440 (not condMapEmpty!45575)) mapNonEmpty!45575))

(get-info :version)

(assert (= (and mapNonEmpty!45575 ((_ is ValueCellFull!13874) mapValue!45575)) b!1165439))

(assert (= (and b!1165440 ((_ is ValueCellFull!13874) mapDefault!45575)) b!1165433))

(assert (= start!99268 b!1165440))

(declare-fun b_lambda!19737 () Bool)

(assert (=> (not b_lambda!19737) (not b!1165438)))

(declare-fun t!37055 () Bool)

(declare-fun tb!9441 () Bool)

(assert (=> (and start!99268 (= defaultEntry!1004 defaultEntry!1004) t!37055) tb!9441))

(declare-fun result!19455 () Bool)

(assert (=> tb!9441 (= result!19455 tp_is_empty!29167)))

(assert (=> b!1165438 t!37055))

(declare-fun b_and!40127 () Bool)

(assert (= b_and!40125 (and (=> t!37055 result!19455) b_and!40127)))

(declare-fun m!1074203 () Bool)

(assert (=> b!1165437 m!1074203))

(declare-fun m!1074205 () Bool)

(assert (=> start!99268 m!1074205))

(declare-fun m!1074207 () Bool)

(assert (=> start!99268 m!1074207))

(declare-fun m!1074209 () Bool)

(assert (=> mapNonEmpty!45575 m!1074209))

(declare-fun m!1074211 () Bool)

(assert (=> b!1165436 m!1074211))

(declare-fun m!1074213 () Bool)

(assert (=> b!1165438 m!1074213))

(declare-fun m!1074215 () Bool)

(assert (=> b!1165438 m!1074215))

(declare-fun m!1074217 () Bool)

(assert (=> b!1165438 m!1074217))

(declare-fun m!1074219 () Bool)

(assert (=> b!1165438 m!1074219))

(declare-fun m!1074221 () Bool)

(assert (=> b!1165429 m!1074221))

(declare-fun m!1074223 () Bool)

(assert (=> b!1165434 m!1074223))

(declare-fun m!1074225 () Bool)

(assert (=> b!1165432 m!1074225))

(declare-fun m!1074227 () Bool)

(assert (=> b!1165432 m!1074227))

(declare-fun m!1074229 () Bool)

(assert (=> b!1165430 m!1074229))

(declare-fun m!1074231 () Bool)

(assert (=> b!1165428 m!1074231))

(declare-fun m!1074233 () Bool)

(assert (=> b!1165427 m!1074233))

(declare-fun m!1074235 () Bool)

(assert (=> b!1165427 m!1074235))

(check-sat (not start!99268) (not b!1165428) (not b!1165437) (not b!1165430) (not b!1165434) (not b_lambda!19737) (not mapNonEmpty!45575) (not b!1165429) tp_is_empty!29167 b_and!40127 (not b!1165432) (not b!1165427) (not b!1165438) (not b_next!24637))
(check-sat b_and!40127 (not b_next!24637))
