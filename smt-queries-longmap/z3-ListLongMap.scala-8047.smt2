; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99358 () Bool)

(assert start!99358)

(declare-fun b_free!24727 () Bool)

(declare-fun b_next!24727 () Bool)

(assert (=> start!99358 (= b_free!24727 (not b_next!24727))))

(declare-fun tp!86892 () Bool)

(declare-fun b_and!40305 () Bool)

(assert (=> start!99358 (= tp!86892 b_and!40305)))

(declare-fun b!1167427 () Bool)

(declare-fun res!773977 () Bool)

(declare-fun e!663721 () Bool)

(assert (=> b!1167427 (=> (not res!773977) (not e!663721))))

(declare-datatypes ((array!75395 0))(
  ( (array!75396 (arr!36342 (Array (_ BitVec 32) (_ BitVec 64))) (size!36879 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75395)

(declare-datatypes ((List!25502 0))(
  ( (Nil!25499) (Cons!25498 (h!26716 (_ BitVec 64)) (t!37213 List!25502)) )
))
(declare-fun arrayNoDuplicates!0 (array!75395 (_ BitVec 32) List!25502) Bool)

(assert (=> b!1167427 (= res!773977 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun res!773973 () Bool)

(assert (=> start!99358 (=> (not res!773973) (not e!663721))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99358 (= res!773973 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36879 _keys!1208))))))

(assert (=> start!99358 e!663721))

(declare-fun tp_is_empty!29257 () Bool)

(assert (=> start!99358 tp_is_empty!29257))

(declare-fun array_inv!27862 (array!75395) Bool)

(assert (=> start!99358 (array_inv!27862 _keys!1208)))

(assert (=> start!99358 true))

(assert (=> start!99358 tp!86892))

(declare-datatypes ((V!44137 0))(
  ( (V!44138 (val!14685 Int)) )
))
(declare-datatypes ((ValueCell!13919 0))(
  ( (ValueCellFull!13919 (v!17318 V!44137)) (EmptyCell!13919) )
))
(declare-datatypes ((array!75397 0))(
  ( (array!75398 (arr!36343 (Array (_ BitVec 32) ValueCell!13919)) (size!36880 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75397)

(declare-fun e!663720 () Bool)

(declare-fun array_inv!27863 (array!75397) Bool)

(assert (=> start!99358 (and (array_inv!27863 _values!996) e!663720)))

(declare-fun b!1167428 () Bool)

(declare-fun res!773971 () Bool)

(declare-fun e!663719 () Bool)

(assert (=> b!1167428 (=> (not res!773971) (not e!663719))))

(declare-fun lt!525624 () array!75395)

(assert (=> b!1167428 (= res!773971 (arrayNoDuplicates!0 lt!525624 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun mapIsEmpty!45710 () Bool)

(declare-fun mapRes!45710 () Bool)

(assert (=> mapIsEmpty!45710 mapRes!45710))

(declare-fun b!1167429 () Bool)

(declare-fun e!663714 () Bool)

(assert (=> b!1167429 (= e!663714 tp_is_empty!29257)))

(declare-fun b!1167430 () Bool)

(declare-fun res!773972 () Bool)

(assert (=> b!1167430 (=> (not res!773972) (not e!663721))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1167430 (= res!773972 (and (= (size!36880 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36879 _keys!1208) (size!36880 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167431 () Bool)

(declare-fun res!773974 () Bool)

(assert (=> b!1167431 (=> (not res!773974) (not e!663721))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1167431 (= res!773974 (= (select (arr!36342 _keys!1208) i!673) k0!934))))

(declare-fun b!1167432 () Bool)

(declare-fun e!663717 () Bool)

(assert (=> b!1167432 (= e!663719 (not e!663717))))

(declare-fun res!773979 () Bool)

(assert (=> b!1167432 (=> res!773979 e!663717)))

(assert (=> b!1167432 (= res!773979 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167432 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38471 0))(
  ( (Unit!38472) )
))
(declare-fun lt!525621 () Unit!38471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75395 (_ BitVec 64) (_ BitVec 32)) Unit!38471)

(assert (=> b!1167432 (= lt!525621 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167433 () Bool)

(declare-fun e!663718 () Bool)

(assert (=> b!1167433 (= e!663717 e!663718)))

(declare-fun res!773978 () Bool)

(assert (=> b!1167433 (=> res!773978 e!663718)))

(assert (=> b!1167433 (= res!773978 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44137)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525620 () array!75397)

(declare-datatypes ((tuple2!18762 0))(
  ( (tuple2!18763 (_1!9392 (_ BitVec 64)) (_2!9392 V!44137)) )
))
(declare-datatypes ((List!25503 0))(
  ( (Nil!25500) (Cons!25499 (h!26717 tuple2!18762) (t!37214 List!25503)) )
))
(declare-datatypes ((ListLongMap!16739 0))(
  ( (ListLongMap!16740 (toList!8385 List!25503)) )
))
(declare-fun lt!525623 () ListLongMap!16739)

(declare-fun minValue!944 () V!44137)

(declare-fun getCurrentListMapNoExtraKeys!4876 (array!75395 array!75397 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) Int) ListLongMap!16739)

(assert (=> b!1167433 (= lt!525623 (getCurrentListMapNoExtraKeys!4876 lt!525624 lt!525620 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2865 (Int (_ BitVec 64)) V!44137)

(assert (=> b!1167433 (= lt!525620 (array!75398 (store (arr!36343 _values!996) i!673 (ValueCellFull!13919 (dynLambda!2865 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36880 _values!996)))))

(declare-fun lt!525622 () ListLongMap!16739)

(assert (=> b!1167433 (= lt!525622 (getCurrentListMapNoExtraKeys!4876 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167434 () Bool)

(declare-fun res!773976 () Bool)

(assert (=> b!1167434 (=> (not res!773976) (not e!663721))))

(assert (=> b!1167434 (= res!773976 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36879 _keys!1208))))))

(declare-fun b!1167435 () Bool)

(declare-fun res!773975 () Bool)

(assert (=> b!1167435 (=> (not res!773975) (not e!663721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167435 (= res!773975 (validKeyInArray!0 k0!934))))

(declare-fun b!1167436 () Bool)

(declare-fun res!773968 () Bool)

(assert (=> b!1167436 (=> (not res!773968) (not e!663721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167436 (= res!773968 (validMask!0 mask!1564))))

(declare-fun b!1167437 () Bool)

(declare-fun e!663715 () Bool)

(assert (=> b!1167437 (= e!663715 tp_is_empty!29257)))

(declare-fun b!1167438 () Bool)

(assert (=> b!1167438 (= e!663718 true)))

(declare-fun -!1450 (ListLongMap!16739 (_ BitVec 64)) ListLongMap!16739)

(assert (=> b!1167438 (= (getCurrentListMapNoExtraKeys!4876 lt!525624 lt!525620 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1450 (getCurrentListMapNoExtraKeys!4876 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525625 () Unit!38471)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!675 (array!75395 array!75397 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38471)

(assert (=> b!1167438 (= lt!525625 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167439 () Bool)

(declare-fun res!773969 () Bool)

(assert (=> b!1167439 (=> (not res!773969) (not e!663721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75395 (_ BitVec 32)) Bool)

(assert (=> b!1167439 (= res!773969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167440 () Bool)

(assert (=> b!1167440 (= e!663721 e!663719)))

(declare-fun res!773970 () Bool)

(assert (=> b!1167440 (=> (not res!773970) (not e!663719))))

(assert (=> b!1167440 (= res!773970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525624 mask!1564))))

(assert (=> b!1167440 (= lt!525624 (array!75396 (store (arr!36342 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36879 _keys!1208)))))

(declare-fun mapNonEmpty!45710 () Bool)

(declare-fun tp!86891 () Bool)

(assert (=> mapNonEmpty!45710 (= mapRes!45710 (and tp!86891 e!663715))))

(declare-fun mapRest!45710 () (Array (_ BitVec 32) ValueCell!13919))

(declare-fun mapKey!45710 () (_ BitVec 32))

(declare-fun mapValue!45710 () ValueCell!13919)

(assert (=> mapNonEmpty!45710 (= (arr!36343 _values!996) (store mapRest!45710 mapKey!45710 mapValue!45710))))

(declare-fun b!1167441 () Bool)

(assert (=> b!1167441 (= e!663720 (and e!663714 mapRes!45710))))

(declare-fun condMapEmpty!45710 () Bool)

(declare-fun mapDefault!45710 () ValueCell!13919)

(assert (=> b!1167441 (= condMapEmpty!45710 (= (arr!36343 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13919)) mapDefault!45710)))))

(assert (= (and start!99358 res!773973) b!1167436))

(assert (= (and b!1167436 res!773968) b!1167430))

(assert (= (and b!1167430 res!773972) b!1167439))

(assert (= (and b!1167439 res!773969) b!1167427))

(assert (= (and b!1167427 res!773977) b!1167434))

(assert (= (and b!1167434 res!773976) b!1167435))

(assert (= (and b!1167435 res!773975) b!1167431))

(assert (= (and b!1167431 res!773974) b!1167440))

(assert (= (and b!1167440 res!773970) b!1167428))

(assert (= (and b!1167428 res!773971) b!1167432))

(assert (= (and b!1167432 (not res!773979)) b!1167433))

(assert (= (and b!1167433 (not res!773978)) b!1167438))

(assert (= (and b!1167441 condMapEmpty!45710) mapIsEmpty!45710))

(assert (= (and b!1167441 (not condMapEmpty!45710)) mapNonEmpty!45710))

(get-info :version)

(assert (= (and mapNonEmpty!45710 ((_ is ValueCellFull!13919) mapValue!45710)) b!1167437))

(assert (= (and b!1167441 ((_ is ValueCellFull!13919) mapDefault!45710)) b!1167429))

(assert (= start!99358 b!1167441))

(declare-fun b_lambda!19827 () Bool)

(assert (=> (not b_lambda!19827) (not b!1167433)))

(declare-fun t!37212 () Bool)

(declare-fun tb!9531 () Bool)

(assert (=> (and start!99358 (= defaultEntry!1004 defaultEntry!1004) t!37212) tb!9531))

(declare-fun result!19635 () Bool)

(assert (=> tb!9531 (= result!19635 tp_is_empty!29257)))

(assert (=> b!1167433 t!37212))

(declare-fun b_and!40307 () Bool)

(assert (= b_and!40305 (and (=> t!37212 result!19635) b_and!40307)))

(declare-fun m!1075781 () Bool)

(assert (=> b!1167438 m!1075781))

(declare-fun m!1075783 () Bool)

(assert (=> b!1167438 m!1075783))

(assert (=> b!1167438 m!1075783))

(declare-fun m!1075785 () Bool)

(assert (=> b!1167438 m!1075785))

(declare-fun m!1075787 () Bool)

(assert (=> b!1167438 m!1075787))

(declare-fun m!1075789 () Bool)

(assert (=> b!1167431 m!1075789))

(declare-fun m!1075791 () Bool)

(assert (=> b!1167428 m!1075791))

(declare-fun m!1075793 () Bool)

(assert (=> b!1167435 m!1075793))

(declare-fun m!1075795 () Bool)

(assert (=> start!99358 m!1075795))

(declare-fun m!1075797 () Bool)

(assert (=> start!99358 m!1075797))

(declare-fun m!1075799 () Bool)

(assert (=> mapNonEmpty!45710 m!1075799))

(declare-fun m!1075801 () Bool)

(assert (=> b!1167432 m!1075801))

(declare-fun m!1075803 () Bool)

(assert (=> b!1167432 m!1075803))

(declare-fun m!1075805 () Bool)

(assert (=> b!1167436 m!1075805))

(declare-fun m!1075807 () Bool)

(assert (=> b!1167440 m!1075807))

(declare-fun m!1075809 () Bool)

(assert (=> b!1167440 m!1075809))

(declare-fun m!1075811 () Bool)

(assert (=> b!1167427 m!1075811))

(declare-fun m!1075813 () Bool)

(assert (=> b!1167433 m!1075813))

(declare-fun m!1075815 () Bool)

(assert (=> b!1167433 m!1075815))

(declare-fun m!1075817 () Bool)

(assert (=> b!1167433 m!1075817))

(declare-fun m!1075819 () Bool)

(assert (=> b!1167433 m!1075819))

(declare-fun m!1075821 () Bool)

(assert (=> b!1167439 m!1075821))

(check-sat (not b!1167440) (not b!1167439) tp_is_empty!29257 (not start!99358) (not b!1167428) (not b!1167427) (not b!1167436) (not b!1167438) (not b!1167433) (not b_next!24727) (not b_lambda!19827) (not b!1167435) b_and!40307 (not mapNonEmpty!45710) (not b!1167432))
(check-sat b_and!40307 (not b_next!24727))
