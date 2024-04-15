; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99496 () Bool)

(assert start!99496)

(declare-fun b_free!25081 () Bool)

(declare-fun b_next!25081 () Bool)

(assert (=> start!99496 (= b_free!25081 (not b_next!25081))))

(declare-fun tp!87956 () Bool)

(declare-fun b_and!41007 () Bool)

(assert (=> start!99496 (= tp!87956 b_and!41007)))

(declare-fun b!1176351 () Bool)

(declare-fun e!668689 () Bool)

(declare-fun e!668688 () Bool)

(assert (=> b!1176351 (= e!668689 e!668688)))

(declare-fun res!781339 () Bool)

(assert (=> b!1176351 (=> res!781339 e!668688)))

(declare-datatypes ((array!75962 0))(
  ( (array!75963 (arr!36631 (Array (_ BitVec 32) (_ BitVec 64))) (size!37169 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75962)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176351 (= res!781339 (not (validKeyInArray!0 (select (arr!36631 _keys!1208) from!1455))))))

(declare-datatypes ((V!44609 0))(
  ( (V!44610 (val!14862 Int)) )
))
(declare-datatypes ((tuple2!19112 0))(
  ( (tuple2!19113 (_1!9567 (_ BitVec 64)) (_2!9567 V!44609)) )
))
(declare-datatypes ((List!25823 0))(
  ( (Nil!25820) (Cons!25819 (h!27028 tuple2!19112) (t!37887 List!25823)) )
))
(declare-datatypes ((ListLongMap!17081 0))(
  ( (ListLongMap!17082 (toList!8556 List!25823)) )
))
(declare-fun lt!530802 () ListLongMap!17081)

(declare-fun lt!530799 () ListLongMap!17081)

(assert (=> b!1176351 (= lt!530802 lt!530799)))

(declare-fun lt!530804 () ListLongMap!17081)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1534 (ListLongMap!17081 (_ BitVec 64)) ListLongMap!17081)

(assert (=> b!1176351 (= lt!530799 (-!1534 lt!530804 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44609)

(declare-datatypes ((ValueCell!14096 0))(
  ( (ValueCellFull!14096 (v!17499 V!44609)) (EmptyCell!14096) )
))
(declare-datatypes ((array!75964 0))(
  ( (array!75965 (arr!36632 (Array (_ BitVec 32) ValueCell!14096)) (size!37170 (_ BitVec 32))) )
))
(declare-fun lt!530803 () array!75964)

(declare-fun zeroValue!944 () V!44609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530800 () array!75962)

(declare-fun getCurrentListMapNoExtraKeys!5024 (array!75962 array!75964 (_ BitVec 32) (_ BitVec 32) V!44609 V!44609 (_ BitVec 32) Int) ListLongMap!17081)

(assert (=> b!1176351 (= lt!530802 (getCurrentListMapNoExtraKeys!5024 lt!530800 lt!530803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75964)

(assert (=> b!1176351 (= lt!530804 (getCurrentListMapNoExtraKeys!5024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38673 0))(
  ( (Unit!38674) )
))
(declare-fun lt!530806 () Unit!38673)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!798 (array!75962 array!75964 (_ BitVec 32) (_ BitVec 32) V!44609 V!44609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38673)

(assert (=> b!1176351 (= lt!530806 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!798 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176352 () Bool)

(declare-fun e!668685 () Unit!38673)

(declare-fun Unit!38675 () Unit!38673)

(assert (=> b!1176352 (= e!668685 Unit!38675)))

(declare-fun b!1176353 () Bool)

(declare-fun res!781336 () Bool)

(declare-fun e!668678 () Bool)

(assert (=> b!1176353 (=> (not res!781336) (not e!668678))))

(assert (=> b!1176353 (= res!781336 (and (= (size!37170 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37169 _keys!1208) (size!37170 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176354 () Bool)

(assert (=> b!1176354 (= e!668688 true)))

(declare-fun e!668677 () Bool)

(assert (=> b!1176354 e!668677))

(declare-fun res!781350 () Bool)

(assert (=> b!1176354 (=> (not res!781350) (not e!668677))))

(assert (=> b!1176354 (= res!781350 (not (= (select (arr!36631 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!530811 () Unit!38673)

(assert (=> b!1176354 (= lt!530811 e!668685)))

(declare-fun c!116719 () Bool)

(assert (=> b!1176354 (= c!116719 (= (select (arr!36631 _keys!1208) from!1455) k0!934))))

(declare-fun e!668680 () Bool)

(assert (=> b!1176354 e!668680))

(declare-fun res!781348 () Bool)

(assert (=> b!1176354 (=> (not res!781348) (not e!668680))))

(declare-fun lt!530809 () tuple2!19112)

(declare-fun lt!530808 () ListLongMap!17081)

(declare-fun +!3859 (ListLongMap!17081 tuple2!19112) ListLongMap!17081)

(assert (=> b!1176354 (= res!781348 (= lt!530808 (+!3859 lt!530799 lt!530809)))))

(declare-fun lt!530797 () V!44609)

(declare-fun get!18718 (ValueCell!14096 V!44609) V!44609)

(assert (=> b!1176354 (= lt!530809 (tuple2!19113 (select (arr!36631 _keys!1208) from!1455) (get!18718 (select (arr!36632 _values!996) from!1455) lt!530797)))))

(declare-fun b!1176355 () Bool)

(declare-fun res!781349 () Bool)

(assert (=> b!1176355 (=> (not res!781349) (not e!668678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176355 (= res!781349 (validMask!0 mask!1564))))

(declare-fun b!1176356 () Bool)

(declare-fun lt!530807 () ListLongMap!17081)

(assert (=> b!1176356 (= e!668677 (= lt!530807 (+!3859 lt!530804 lt!530809)))))

(declare-fun b!1176357 () Bool)

(declare-fun e!668681 () Bool)

(assert (=> b!1176357 (= e!668680 e!668681)))

(declare-fun res!781346 () Bool)

(assert (=> b!1176357 (=> res!781346 e!668681)))

(assert (=> b!1176357 (= res!781346 (not (= (select (arr!36631 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176358 () Bool)

(declare-fun e!668683 () Bool)

(declare-fun e!668686 () Bool)

(assert (=> b!1176358 (= e!668683 (not e!668686))))

(declare-fun res!781345 () Bool)

(assert (=> b!1176358 (=> res!781345 e!668686)))

(assert (=> b!1176358 (= res!781345 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176358 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530810 () Unit!38673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75962 (_ BitVec 64) (_ BitVec 32)) Unit!38673)

(assert (=> b!1176358 (= lt!530810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176359 () Bool)

(assert (=> b!1176359 (= e!668681 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176360 () Bool)

(declare-fun Unit!38676 () Unit!38673)

(assert (=> b!1176360 (= e!668685 Unit!38676)))

(declare-fun lt!530805 () Unit!38673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75962 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38673)

(assert (=> b!1176360 (= lt!530805 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176360 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530801 () Unit!38673)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75962 (_ BitVec 32) (_ BitVec 32)) Unit!38673)

(assert (=> b!1176360 (= lt!530801 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25824 0))(
  ( (Nil!25821) (Cons!25820 (h!27029 (_ BitVec 64)) (t!37888 List!25824)) )
))
(declare-fun arrayNoDuplicates!0 (array!75962 (_ BitVec 32) List!25824) Bool)

(assert (=> b!1176360 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25821)))

(declare-fun lt!530798 () Unit!38673)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75962 (_ BitVec 64) (_ BitVec 32) List!25824) Unit!38673)

(assert (=> b!1176360 (= lt!530798 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25821))))

(assert (=> b!1176360 false))

(declare-fun b!1176361 () Bool)

(declare-fun res!781351 () Bool)

(assert (=> b!1176361 (=> (not res!781351) (not e!668678))))

(assert (=> b!1176361 (= res!781351 (validKeyInArray!0 k0!934))))

(declare-fun b!1176362 () Bool)

(declare-fun res!781342 () Bool)

(assert (=> b!1176362 (=> (not res!781342) (not e!668683))))

(assert (=> b!1176362 (= res!781342 (arrayNoDuplicates!0 lt!530800 #b00000000000000000000000000000000 Nil!25821))))

(declare-fun b!1176363 () Bool)

(declare-fun e!668679 () Bool)

(declare-fun tp_is_empty!29611 () Bool)

(assert (=> b!1176363 (= e!668679 tp_is_empty!29611)))

(declare-fun b!1176364 () Bool)

(declare-fun e!668687 () Bool)

(assert (=> b!1176364 (= e!668687 tp_is_empty!29611)))

(declare-fun mapNonEmpty!46244 () Bool)

(declare-fun mapRes!46244 () Bool)

(declare-fun tp!87957 () Bool)

(assert (=> mapNonEmpty!46244 (= mapRes!46244 (and tp!87957 e!668679))))

(declare-fun mapRest!46244 () (Array (_ BitVec 32) ValueCell!14096))

(declare-fun mapValue!46244 () ValueCell!14096)

(declare-fun mapKey!46244 () (_ BitVec 32))

(assert (=> mapNonEmpty!46244 (= (arr!36632 _values!996) (store mapRest!46244 mapKey!46244 mapValue!46244))))

(declare-fun b!1176365 () Bool)

(declare-fun e!668682 () Bool)

(assert (=> b!1176365 (= e!668682 (and e!668687 mapRes!46244))))

(declare-fun condMapEmpty!46244 () Bool)

(declare-fun mapDefault!46244 () ValueCell!14096)

(assert (=> b!1176365 (= condMapEmpty!46244 (= (arr!36632 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14096)) mapDefault!46244)))))

(declare-fun b!1176366 () Bool)

(assert (=> b!1176366 (= e!668678 e!668683)))

(declare-fun res!781338 () Bool)

(assert (=> b!1176366 (=> (not res!781338) (not e!668683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75962 (_ BitVec 32)) Bool)

(assert (=> b!1176366 (= res!781338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530800 mask!1564))))

(assert (=> b!1176366 (= lt!530800 (array!75963 (store (arr!36631 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37169 _keys!1208)))))

(declare-fun b!1176367 () Bool)

(declare-fun res!781344 () Bool)

(assert (=> b!1176367 (=> (not res!781344) (not e!668678))))

(assert (=> b!1176367 (= res!781344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37169 _keys!1208))))))

(declare-fun b!1176368 () Bool)

(declare-fun res!781340 () Bool)

(assert (=> b!1176368 (=> (not res!781340) (not e!668678))))

(assert (=> b!1176368 (= res!781340 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25821))))

(declare-fun mapIsEmpty!46244 () Bool)

(assert (=> mapIsEmpty!46244 mapRes!46244))

(declare-fun b!1176369 () Bool)

(declare-fun res!781341 () Bool)

(assert (=> b!1176369 (=> (not res!781341) (not e!668678))))

(assert (=> b!1176369 (= res!781341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!781343 () Bool)

(assert (=> start!99496 (=> (not res!781343) (not e!668678))))

(assert (=> start!99496 (= res!781343 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37169 _keys!1208))))))

(assert (=> start!99496 e!668678))

(assert (=> start!99496 tp_is_empty!29611))

(declare-fun array_inv!28084 (array!75962) Bool)

(assert (=> start!99496 (array_inv!28084 _keys!1208)))

(assert (=> start!99496 true))

(assert (=> start!99496 tp!87956))

(declare-fun array_inv!28085 (array!75964) Bool)

(assert (=> start!99496 (and (array_inv!28085 _values!996) e!668682)))

(declare-fun b!1176370 () Bool)

(assert (=> b!1176370 (= e!668686 e!668689)))

(declare-fun res!781337 () Bool)

(assert (=> b!1176370 (=> res!781337 e!668689)))

(assert (=> b!1176370 (= res!781337 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176370 (= lt!530808 (getCurrentListMapNoExtraKeys!5024 lt!530800 lt!530803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176370 (= lt!530803 (array!75965 (store (arr!36632 _values!996) i!673 (ValueCellFull!14096 lt!530797)) (size!37170 _values!996)))))

(declare-fun dynLambda!2941 (Int (_ BitVec 64)) V!44609)

(assert (=> b!1176370 (= lt!530797 (dynLambda!2941 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1176370 (= lt!530807 (getCurrentListMapNoExtraKeys!5024 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176371 () Bool)

(declare-fun res!781347 () Bool)

(assert (=> b!1176371 (=> (not res!781347) (not e!668678))))

(assert (=> b!1176371 (= res!781347 (= (select (arr!36631 _keys!1208) i!673) k0!934))))

(assert (= (and start!99496 res!781343) b!1176355))

(assert (= (and b!1176355 res!781349) b!1176353))

(assert (= (and b!1176353 res!781336) b!1176369))

(assert (= (and b!1176369 res!781341) b!1176368))

(assert (= (and b!1176368 res!781340) b!1176367))

(assert (= (and b!1176367 res!781344) b!1176361))

(assert (= (and b!1176361 res!781351) b!1176371))

(assert (= (and b!1176371 res!781347) b!1176366))

(assert (= (and b!1176366 res!781338) b!1176362))

(assert (= (and b!1176362 res!781342) b!1176358))

(assert (= (and b!1176358 (not res!781345)) b!1176370))

(assert (= (and b!1176370 (not res!781337)) b!1176351))

(assert (= (and b!1176351 (not res!781339)) b!1176354))

(assert (= (and b!1176354 res!781348) b!1176357))

(assert (= (and b!1176357 (not res!781346)) b!1176359))

(assert (= (and b!1176354 c!116719) b!1176360))

(assert (= (and b!1176354 (not c!116719)) b!1176352))

(assert (= (and b!1176354 res!781350) b!1176356))

(assert (= (and b!1176365 condMapEmpty!46244) mapIsEmpty!46244))

(assert (= (and b!1176365 (not condMapEmpty!46244)) mapNonEmpty!46244))

(get-info :version)

(assert (= (and mapNonEmpty!46244 ((_ is ValueCellFull!14096) mapValue!46244)) b!1176363))

(assert (= (and b!1176365 ((_ is ValueCellFull!14096) mapDefault!46244)) b!1176364))

(assert (= start!99496 b!1176365))

(declare-fun b_lambda!20207 () Bool)

(assert (=> (not b_lambda!20207) (not b!1176370)))

(declare-fun t!37886 () Bool)

(declare-fun tb!9885 () Bool)

(assert (=> (and start!99496 (= defaultEntry!1004 defaultEntry!1004) t!37886) tb!9885))

(declare-fun result!20345 () Bool)

(assert (=> tb!9885 (= result!20345 tp_is_empty!29611)))

(assert (=> b!1176370 t!37886))

(declare-fun b_and!41009 () Bool)

(assert (= b_and!41007 (and (=> t!37886 result!20345) b_and!41009)))

(declare-fun m!1083797 () Bool)

(assert (=> b!1176361 m!1083797))

(declare-fun m!1083799 () Bool)

(assert (=> b!1176359 m!1083799))

(declare-fun m!1083801 () Bool)

(assert (=> b!1176369 m!1083801))

(declare-fun m!1083803 () Bool)

(assert (=> mapNonEmpty!46244 m!1083803))

(declare-fun m!1083805 () Bool)

(assert (=> b!1176356 m!1083805))

(declare-fun m!1083807 () Bool)

(assert (=> b!1176358 m!1083807))

(declare-fun m!1083809 () Bool)

(assert (=> b!1176358 m!1083809))

(declare-fun m!1083811 () Bool)

(assert (=> b!1176354 m!1083811))

(declare-fun m!1083813 () Bool)

(assert (=> b!1176354 m!1083813))

(declare-fun m!1083815 () Bool)

(assert (=> b!1176354 m!1083815))

(assert (=> b!1176354 m!1083815))

(declare-fun m!1083817 () Bool)

(assert (=> b!1176354 m!1083817))

(declare-fun m!1083819 () Bool)

(assert (=> b!1176371 m!1083819))

(declare-fun m!1083821 () Bool)

(assert (=> b!1176360 m!1083821))

(declare-fun m!1083823 () Bool)

(assert (=> b!1176360 m!1083823))

(declare-fun m!1083825 () Bool)

(assert (=> b!1176360 m!1083825))

(declare-fun m!1083827 () Bool)

(assert (=> b!1176360 m!1083827))

(declare-fun m!1083829 () Bool)

(assert (=> b!1176360 m!1083829))

(declare-fun m!1083831 () Bool)

(assert (=> b!1176370 m!1083831))

(declare-fun m!1083833 () Bool)

(assert (=> b!1176370 m!1083833))

(declare-fun m!1083835 () Bool)

(assert (=> b!1176370 m!1083835))

(declare-fun m!1083837 () Bool)

(assert (=> b!1176370 m!1083837))

(declare-fun m!1083839 () Bool)

(assert (=> b!1176362 m!1083839))

(declare-fun m!1083841 () Bool)

(assert (=> b!1176368 m!1083841))

(declare-fun m!1083843 () Bool)

(assert (=> b!1176366 m!1083843))

(declare-fun m!1083845 () Bool)

(assert (=> b!1176366 m!1083845))

(declare-fun m!1083847 () Bool)

(assert (=> start!99496 m!1083847))

(declare-fun m!1083849 () Bool)

(assert (=> start!99496 m!1083849))

(declare-fun m!1083851 () Bool)

(assert (=> b!1176355 m!1083851))

(assert (=> b!1176357 m!1083811))

(declare-fun m!1083853 () Bool)

(assert (=> b!1176351 m!1083853))

(declare-fun m!1083855 () Bool)

(assert (=> b!1176351 m!1083855))

(assert (=> b!1176351 m!1083811))

(declare-fun m!1083857 () Bool)

(assert (=> b!1176351 m!1083857))

(declare-fun m!1083859 () Bool)

(assert (=> b!1176351 m!1083859))

(declare-fun m!1083861 () Bool)

(assert (=> b!1176351 m!1083861))

(assert (=> b!1176351 m!1083811))

(check-sat (not b!1176359) (not start!99496) (not b!1176362) tp_is_empty!29611 (not b!1176361) b_and!41009 (not b_next!25081) (not b!1176358) (not b!1176360) (not b!1176354) (not b!1176355) (not b!1176368) (not b!1176351) (not b_lambda!20207) (not mapNonEmpty!46244) (not b!1176369) (not b!1176366) (not b!1176356) (not b!1176370))
(check-sat b_and!41009 (not b_next!25081))
