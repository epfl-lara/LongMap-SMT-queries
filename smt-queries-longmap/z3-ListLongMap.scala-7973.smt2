; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98914 () Bool)

(assert start!98914)

(declare-fun b_free!24283 () Bool)

(declare-fun b_next!24283 () Bool)

(assert (=> start!98914 (= b_free!24283 (not b_next!24283))))

(declare-fun tp!85559 () Bool)

(declare-fun b_and!39417 () Bool)

(assert (=> start!98914 (= tp!85559 b_and!39417)))

(declare-datatypes ((V!43545 0))(
  ( (V!43546 (val!14463 Int)) )
))
(declare-fun zeroValue!944 () V!43545)

(declare-datatypes ((array!74521 0))(
  ( (array!74522 (arr!35905 (Array (_ BitVec 32) (_ BitVec 64))) (size!36442 (_ BitVec 32))) )
))
(declare-fun lt!513608 () array!74521)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13697 0))(
  ( (ValueCellFull!13697 (v!17096 V!43545)) (EmptyCell!13697) )
))
(declare-datatypes ((array!74523 0))(
  ( (array!74524 (arr!35906 (Array (_ BitVec 32) ValueCell!13697)) (size!36443 (_ BitVec 32))) )
))
(declare-fun lt!513602 () array!74523)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18354 0))(
  ( (tuple2!18355 (_1!9188 (_ BitVec 64)) (_2!9188 V!43545)) )
))
(declare-datatypes ((List!25108 0))(
  ( (Nil!25105) (Cons!25104 (h!26322 tuple2!18354) (t!36375 List!25108)) )
))
(declare-datatypes ((ListLongMap!16331 0))(
  ( (ListLongMap!16332 (toList!8181 List!25108)) )
))
(declare-fun call!53004 () ListLongMap!16331)

(declare-fun minValue!944 () V!43545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!53000 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4683 (array!74521 array!74523 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) Int) ListLongMap!16331)

(assert (=> bm!53000 (= call!53004 (getCurrentListMapNoExtraKeys!4683 lt!513608 lt!513602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149319 () Bool)

(declare-fun res!764553 () Bool)

(declare-fun e!653835 () Bool)

(assert (=> b!1149319 (=> (not res!764553) (not e!653835))))

(declare-fun _keys!1208 () array!74521)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74521 (_ BitVec 32)) Bool)

(assert (=> b!1149319 (= res!764553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149320 () Bool)

(declare-fun res!764551 () Bool)

(assert (=> b!1149320 (=> (not res!764551) (not e!653835))))

(declare-datatypes ((List!25109 0))(
  ( (Nil!25106) (Cons!25105 (h!26323 (_ BitVec 64)) (t!36376 List!25109)) )
))
(declare-fun arrayNoDuplicates!0 (array!74521 (_ BitVec 32) List!25109) Bool)

(assert (=> b!1149320 (= res!764551 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25106))))

(declare-fun b!1149321 () Bool)

(declare-fun e!653836 () Bool)

(declare-fun e!653840 () Bool)

(assert (=> b!1149321 (= e!653836 e!653840)))

(declare-fun res!764548 () Bool)

(assert (=> b!1149321 (=> res!764548 e!653840)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149321 (= res!764548 (not (= from!1455 i!673)))))

(declare-fun lt!513607 () ListLongMap!16331)

(assert (=> b!1149321 (= lt!513607 (getCurrentListMapNoExtraKeys!4683 lt!513608 lt!513602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74523)

(declare-fun lt!513596 () V!43545)

(assert (=> b!1149321 (= lt!513602 (array!74524 (store (arr!35906 _values!996) i!673 (ValueCellFull!13697 lt!513596)) (size!36443 _values!996)))))

(declare-fun dynLambda!2710 (Int (_ BitVec 64)) V!43545)

(assert (=> b!1149321 (= lt!513596 (dynLambda!2710 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513610 () ListLongMap!16331)

(assert (=> b!1149321 (= lt!513610 (getCurrentListMapNoExtraKeys!4683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149322 () Bool)

(declare-fun e!653846 () Bool)

(declare-fun call!53003 () ListLongMap!16331)

(assert (=> b!1149322 (= e!653846 (= call!53004 call!53003))))

(declare-fun c!113805 () Bool)

(declare-fun bm!53001 () Bool)

(declare-datatypes ((Unit!37703 0))(
  ( (Unit!37704) )
))
(declare-fun call!53009 () Unit!37703)

(declare-fun lt!513600 () ListLongMap!16331)

(declare-fun c!113806 () Bool)

(declare-fun lt!513604 () ListLongMap!16331)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!846 (ListLongMap!16331 (_ BitVec 64) V!43545 (_ BitVec 64)) Unit!37703)

(assert (=> bm!53001 (= call!53009 (addStillContains!846 (ite c!113806 lt!513604 lt!513600) (ite c!113806 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113805 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113806 minValue!944 (ite c!113805 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1149323 () Bool)

(declare-fun res!764555 () Bool)

(assert (=> b!1149323 (=> (not res!764555) (not e!653835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149323 (= res!764555 (validMask!0 mask!1564))))

(declare-fun b!1149324 () Bool)

(declare-fun res!764556 () Bool)

(assert (=> b!1149324 (=> (not res!764556) (not e!653835))))

(assert (=> b!1149324 (= res!764556 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36442 _keys!1208))))))

(declare-fun b!1149325 () Bool)

(declare-fun call!53007 () Bool)

(assert (=> b!1149325 call!53007))

(declare-fun lt!513606 () Unit!37703)

(declare-fun call!53010 () Unit!37703)

(assert (=> b!1149325 (= lt!513606 call!53010)))

(declare-fun e!653838 () Unit!37703)

(assert (=> b!1149325 (= e!653838 lt!513606)))

(declare-fun b!1149326 () Bool)

(declare-fun e!653847 () Bool)

(declare-fun e!653832 () Bool)

(declare-fun mapRes!45044 () Bool)

(assert (=> b!1149326 (= e!653847 (and e!653832 mapRes!45044))))

(declare-fun condMapEmpty!45044 () Bool)

(declare-fun mapDefault!45044 () ValueCell!13697)

(assert (=> b!1149326 (= condMapEmpty!45044 (= (arr!35906 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13697)) mapDefault!45044)))))

(declare-fun e!653842 () Bool)

(declare-fun b!1149327 () Bool)

(declare-fun arrayContainsKey!0 (array!74521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149327 (= e!653842 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!53005 () ListLongMap!16331)

(declare-fun bm!53002 () Bool)

(declare-fun call!53008 () Bool)

(declare-fun contains!6719 (ListLongMap!16331 (_ BitVec 64)) Bool)

(assert (=> bm!53002 (= call!53008 (contains!6719 (ite c!113806 lt!513604 call!53005) k0!934))))

(declare-fun b!1149329 () Bool)

(declare-fun e!653837 () Unit!37703)

(assert (=> b!1149329 (= e!653837 e!653838)))

(declare-fun c!113807 () Bool)

(declare-fun lt!513603 () Bool)

(assert (=> b!1149329 (= c!113807 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513603))))

(declare-fun mapNonEmpty!45044 () Bool)

(declare-fun tp!85560 () Bool)

(declare-fun e!653834 () Bool)

(assert (=> mapNonEmpty!45044 (= mapRes!45044 (and tp!85560 e!653834))))

(declare-fun mapRest!45044 () (Array (_ BitVec 32) ValueCell!13697))

(declare-fun mapKey!45044 () (_ BitVec 32))

(declare-fun mapValue!45044 () ValueCell!13697)

(assert (=> mapNonEmpty!45044 (= (arr!35906 _values!996) (store mapRest!45044 mapKey!45044 mapValue!45044))))

(declare-fun b!1149330 () Bool)

(declare-fun e!653848 () Bool)

(declare-fun -!1304 (ListLongMap!16331 (_ BitVec 64)) ListLongMap!16331)

(assert (=> b!1149330 (= e!653848 (= (-!1304 lt!513610 k0!934) lt!513600))))

(declare-fun b!1149331 () Bool)

(declare-fun e!653833 () Bool)

(assert (=> b!1149331 (= e!653835 e!653833)))

(declare-fun res!764554 () Bool)

(assert (=> b!1149331 (=> (not res!764554) (not e!653833))))

(assert (=> b!1149331 (= res!764554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513608 mask!1564))))

(assert (=> b!1149331 (= lt!513608 (array!74522 (store (arr!35905 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36442 _keys!1208)))))

(declare-fun b!1149332 () Bool)

(declare-fun Unit!37705 () Unit!37703)

(assert (=> b!1149332 (= e!653838 Unit!37705)))

(declare-fun b!1149333 () Bool)

(declare-fun lt!513599 () Unit!37703)

(assert (=> b!1149333 (= e!653837 lt!513599)))

(assert (=> b!1149333 (= lt!513599 call!53010)))

(assert (=> b!1149333 call!53007))

(declare-fun b!1149334 () Bool)

(declare-fun e!653843 () Unit!37703)

(declare-fun Unit!37706 () Unit!37703)

(assert (=> b!1149334 (= e!653843 Unit!37706)))

(declare-fun bm!53003 () Bool)

(assert (=> bm!53003 (= call!53010 call!53009)))

(declare-fun bm!53004 () Bool)

(assert (=> bm!53004 (= call!53003 (getCurrentListMapNoExtraKeys!4683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53005 () Bool)

(assert (=> bm!53005 (= call!53007 call!53008)))

(declare-fun b!1149335 () Bool)

(declare-fun Unit!37707 () Unit!37703)

(assert (=> b!1149335 (= e!653843 Unit!37707)))

(assert (=> b!1149335 (= lt!513603 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149335 (= c!113806 (and (not lt!513603) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513595 () Unit!37703)

(declare-fun e!653845 () Unit!37703)

(assert (=> b!1149335 (= lt!513595 e!653845)))

(declare-fun lt!513594 () Unit!37703)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!443 (array!74521 array!74523 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 64) (_ BitVec 32) Int) Unit!37703)

(assert (=> b!1149335 (= lt!513594 (lemmaListMapContainsThenArrayContainsFrom!443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113808 () Bool)

(assert (=> b!1149335 (= c!113808 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764542 () Bool)

(assert (=> b!1149335 (= res!764542 e!653842)))

(declare-fun e!653841 () Bool)

(assert (=> b!1149335 (=> (not res!764542) (not e!653841))))

(assert (=> b!1149335 e!653841))

(declare-fun lt!513593 () Unit!37703)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74521 (_ BitVec 32) (_ BitVec 32)) Unit!37703)

(assert (=> b!1149335 (= lt!513593 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149335 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25106)))

(declare-fun lt!513609 () Unit!37703)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74521 (_ BitVec 64) (_ BitVec 32) List!25109) Unit!37703)

(assert (=> b!1149335 (= lt!513609 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25106))))

(assert (=> b!1149335 false))

(declare-fun bm!53006 () Bool)

(declare-fun call!53006 () ListLongMap!16331)

(assert (=> bm!53006 (= call!53005 call!53006)))

(declare-fun b!1149336 () Bool)

(declare-fun tp_is_empty!28813 () Bool)

(assert (=> b!1149336 (= e!653834 tp_is_empty!28813)))

(declare-fun b!1149337 () Bool)

(assert (=> b!1149337 (= e!653846 (= call!53004 (-!1304 call!53003 k0!934)))))

(declare-fun b!1149338 () Bool)

(declare-fun res!764552 () Bool)

(assert (=> b!1149338 (=> (not res!764552) (not e!653835))))

(assert (=> b!1149338 (= res!764552 (and (= (size!36443 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36442 _keys!1208) (size!36443 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149339 () Bool)

(declare-fun e!653844 () Bool)

(assert (=> b!1149339 (= e!653844 true)))

(assert (=> b!1149339 e!653848))

(declare-fun res!764550 () Bool)

(assert (=> b!1149339 (=> (not res!764550) (not e!653848))))

(declare-fun lt!513591 () V!43545)

(declare-fun +!3621 (ListLongMap!16331 tuple2!18354) ListLongMap!16331)

(assert (=> b!1149339 (= res!764550 (= (-!1304 (+!3621 lt!513600 (tuple2!18355 (select (arr!35905 _keys!1208) from!1455) lt!513591)) (select (arr!35905 _keys!1208) from!1455)) lt!513600))))

(declare-fun lt!513598 () Unit!37703)

(declare-fun addThenRemoveForNewKeyIsSame!156 (ListLongMap!16331 (_ BitVec 64) V!43545) Unit!37703)

(assert (=> b!1149339 (= lt!513598 (addThenRemoveForNewKeyIsSame!156 lt!513600 (select (arr!35905 _keys!1208) from!1455) lt!513591))))

(declare-fun get!18295 (ValueCell!13697 V!43545) V!43545)

(assert (=> b!1149339 (= lt!513591 (get!18295 (select (arr!35906 _values!996) from!1455) lt!513596))))

(declare-fun lt!513590 () Unit!37703)

(assert (=> b!1149339 (= lt!513590 e!653843)))

(declare-fun c!113803 () Bool)

(assert (=> b!1149339 (= c!113803 (contains!6719 lt!513600 k0!934))))

(assert (=> b!1149339 (= lt!513600 (getCurrentListMapNoExtraKeys!4683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149340 () Bool)

(assert (=> b!1149340 (= e!653841 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149341 () Bool)

(assert (=> b!1149341 (= e!653832 tp_is_empty!28813)))

(declare-fun b!1149342 () Bool)

(declare-fun res!764549 () Bool)

(assert (=> b!1149342 (=> (not res!764549) (not e!653835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149342 (= res!764549 (validKeyInArray!0 k0!934))))

(declare-fun b!1149343 () Bool)

(declare-fun res!764547 () Bool)

(assert (=> b!1149343 (=> (not res!764547) (not e!653833))))

(assert (=> b!1149343 (= res!764547 (arrayNoDuplicates!0 lt!513608 #b00000000000000000000000000000000 Nil!25106))))

(declare-fun b!1149344 () Bool)

(declare-fun res!764544 () Bool)

(assert (=> b!1149344 (=> (not res!764544) (not e!653835))))

(assert (=> b!1149344 (= res!764544 (= (select (arr!35905 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45044 () Bool)

(assert (=> mapIsEmpty!45044 mapRes!45044))

(declare-fun bm!53007 () Bool)

(assert (=> bm!53007 (= call!53006 (+!3621 lt!513600 (ite (or c!113806 c!113805) (tuple2!18355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun res!764543 () Bool)

(assert (=> start!98914 (=> (not res!764543) (not e!653835))))

(assert (=> start!98914 (= res!764543 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36442 _keys!1208))))))

(assert (=> start!98914 e!653835))

(assert (=> start!98914 tp_is_empty!28813))

(declare-fun array_inv!27558 (array!74521) Bool)

(assert (=> start!98914 (array_inv!27558 _keys!1208)))

(assert (=> start!98914 true))

(assert (=> start!98914 tp!85559))

(declare-fun array_inv!27559 (array!74523) Bool)

(assert (=> start!98914 (and (array_inv!27559 _values!996) e!653847)))

(declare-fun b!1149328 () Bool)

(assert (=> b!1149328 (= e!653840 e!653844)))

(declare-fun res!764545 () Bool)

(assert (=> b!1149328 (=> res!764545 e!653844)))

(assert (=> b!1149328 (= res!764545 (not (= (select (arr!35905 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149328 e!653846))

(declare-fun c!113804 () Bool)

(assert (=> b!1149328 (= c!113804 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513601 () Unit!37703)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 (array!74521 array!74523 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37703)

(assert (=> b!1149328 (= lt!513601 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149345 () Bool)

(assert (=> b!1149345 (= e!653833 (not e!653836))))

(declare-fun res!764546 () Bool)

(assert (=> b!1149345 (=> res!764546 e!653836)))

(assert (=> b!1149345 (= res!764546 (bvsgt from!1455 i!673))))

(assert (=> b!1149345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513597 () Unit!37703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74521 (_ BitVec 64) (_ BitVec 32)) Unit!37703)

(assert (=> b!1149345 (= lt!513597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149346 () Bool)

(assert (=> b!1149346 (= c!113805 (and (not lt!513603) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149346 (= e!653845 e!653837)))

(declare-fun b!1149347 () Bool)

(assert (=> b!1149347 (contains!6719 (+!3621 lt!513604 (tuple2!18355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513605 () Unit!37703)

(assert (=> b!1149347 (= lt!513605 call!53009)))

(assert (=> b!1149347 call!53008))

(assert (=> b!1149347 (= lt!513604 call!53006)))

(declare-fun lt!513592 () Unit!37703)

(assert (=> b!1149347 (= lt!513592 (addStillContains!846 lt!513600 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1149347 (= e!653845 lt!513605)))

(declare-fun b!1149348 () Bool)

(assert (=> b!1149348 (= e!653842 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513603) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!98914 res!764543) b!1149323))

(assert (= (and b!1149323 res!764555) b!1149338))

(assert (= (and b!1149338 res!764552) b!1149319))

(assert (= (and b!1149319 res!764553) b!1149320))

(assert (= (and b!1149320 res!764551) b!1149324))

(assert (= (and b!1149324 res!764556) b!1149342))

(assert (= (and b!1149342 res!764549) b!1149344))

(assert (= (and b!1149344 res!764544) b!1149331))

(assert (= (and b!1149331 res!764554) b!1149343))

(assert (= (and b!1149343 res!764547) b!1149345))

(assert (= (and b!1149345 (not res!764546)) b!1149321))

(assert (= (and b!1149321 (not res!764548)) b!1149328))

(assert (= (and b!1149328 c!113804) b!1149337))

(assert (= (and b!1149328 (not c!113804)) b!1149322))

(assert (= (or b!1149337 b!1149322) bm!53000))

(assert (= (or b!1149337 b!1149322) bm!53004))

(assert (= (and b!1149328 (not res!764545)) b!1149339))

(assert (= (and b!1149339 c!113803) b!1149335))

(assert (= (and b!1149339 (not c!113803)) b!1149334))

(assert (= (and b!1149335 c!113806) b!1149347))

(assert (= (and b!1149335 (not c!113806)) b!1149346))

(assert (= (and b!1149346 c!113805) b!1149333))

(assert (= (and b!1149346 (not c!113805)) b!1149329))

(assert (= (and b!1149329 c!113807) b!1149325))

(assert (= (and b!1149329 (not c!113807)) b!1149332))

(assert (= (or b!1149333 b!1149325) bm!53003))

(assert (= (or b!1149333 b!1149325) bm!53006))

(assert (= (or b!1149333 b!1149325) bm!53005))

(assert (= (or b!1149347 bm!53005) bm!53002))

(assert (= (or b!1149347 bm!53003) bm!53001))

(assert (= (or b!1149347 bm!53006) bm!53007))

(assert (= (and b!1149335 c!113808) b!1149327))

(assert (= (and b!1149335 (not c!113808)) b!1149348))

(assert (= (and b!1149335 res!764542) b!1149340))

(assert (= (and b!1149339 res!764550) b!1149330))

(assert (= (and b!1149326 condMapEmpty!45044) mapIsEmpty!45044))

(assert (= (and b!1149326 (not condMapEmpty!45044)) mapNonEmpty!45044))

(get-info :version)

(assert (= (and mapNonEmpty!45044 ((_ is ValueCellFull!13697) mapValue!45044)) b!1149336))

(assert (= (and b!1149326 ((_ is ValueCellFull!13697) mapDefault!45044)) b!1149341))

(assert (= start!98914 b!1149326))

(declare-fun b_lambda!19383 () Bool)

(assert (=> (not b_lambda!19383) (not b!1149321)))

(declare-fun t!36374 () Bool)

(declare-fun tb!9087 () Bool)

(assert (=> (and start!98914 (= defaultEntry!1004 defaultEntry!1004) t!36374) tb!9087))

(declare-fun result!18747 () Bool)

(assert (=> tb!9087 (= result!18747 tp_is_empty!28813)))

(assert (=> b!1149321 t!36374))

(declare-fun b_and!39419 () Bool)

(assert (= b_and!39417 (and (=> t!36374 result!18747) b_and!39419)))

(declare-fun m!1060153 () Bool)

(assert (=> bm!53001 m!1060153))

(declare-fun m!1060155 () Bool)

(assert (=> b!1149328 m!1060155))

(declare-fun m!1060157 () Bool)

(assert (=> b!1149328 m!1060157))

(declare-fun m!1060159 () Bool)

(assert (=> mapNonEmpty!45044 m!1060159))

(declare-fun m!1060161 () Bool)

(assert (=> b!1149340 m!1060161))

(declare-fun m!1060163 () Bool)

(assert (=> b!1149347 m!1060163))

(assert (=> b!1149347 m!1060163))

(declare-fun m!1060165 () Bool)

(assert (=> b!1149347 m!1060165))

(declare-fun m!1060167 () Bool)

(assert (=> b!1149347 m!1060167))

(declare-fun m!1060169 () Bool)

(assert (=> b!1149345 m!1060169))

(declare-fun m!1060171 () Bool)

(assert (=> b!1149345 m!1060171))

(declare-fun m!1060173 () Bool)

(assert (=> bm!53007 m!1060173))

(declare-fun m!1060175 () Bool)

(assert (=> b!1149339 m!1060175))

(declare-fun m!1060177 () Bool)

(assert (=> b!1149339 m!1060177))

(assert (=> b!1149339 m!1060155))

(declare-fun m!1060179 () Bool)

(assert (=> b!1149339 m!1060179))

(assert (=> b!1149339 m!1060175))

(declare-fun m!1060181 () Bool)

(assert (=> b!1149339 m!1060181))

(declare-fun m!1060183 () Bool)

(assert (=> b!1149339 m!1060183))

(declare-fun m!1060185 () Bool)

(assert (=> b!1149339 m!1060185))

(assert (=> b!1149339 m!1060177))

(assert (=> b!1149339 m!1060155))

(declare-fun m!1060187 () Bool)

(assert (=> b!1149339 m!1060187))

(assert (=> b!1149339 m!1060155))

(assert (=> b!1149327 m!1060161))

(declare-fun m!1060189 () Bool)

(assert (=> b!1149343 m!1060189))

(declare-fun m!1060191 () Bool)

(assert (=> b!1149331 m!1060191))

(declare-fun m!1060193 () Bool)

(assert (=> b!1149331 m!1060193))

(declare-fun m!1060195 () Bool)

(assert (=> b!1149323 m!1060195))

(declare-fun m!1060197 () Bool)

(assert (=> b!1149319 m!1060197))

(declare-fun m!1060199 () Bool)

(assert (=> b!1149335 m!1060199))

(declare-fun m!1060201 () Bool)

(assert (=> b!1149335 m!1060201))

(declare-fun m!1060203 () Bool)

(assert (=> b!1149335 m!1060203))

(declare-fun m!1060205 () Bool)

(assert (=> b!1149335 m!1060205))

(declare-fun m!1060207 () Bool)

(assert (=> bm!53000 m!1060207))

(declare-fun m!1060209 () Bool)

(assert (=> bm!53002 m!1060209))

(declare-fun m!1060211 () Bool)

(assert (=> b!1149321 m!1060211))

(declare-fun m!1060213 () Bool)

(assert (=> b!1149321 m!1060213))

(declare-fun m!1060215 () Bool)

(assert (=> b!1149321 m!1060215))

(declare-fun m!1060217 () Bool)

(assert (=> b!1149321 m!1060217))

(declare-fun m!1060219 () Bool)

(assert (=> b!1149337 m!1060219))

(declare-fun m!1060221 () Bool)

(assert (=> b!1149344 m!1060221))

(declare-fun m!1060223 () Bool)

(assert (=> b!1149330 m!1060223))

(declare-fun m!1060225 () Bool)

(assert (=> b!1149320 m!1060225))

(assert (=> bm!53004 m!1060183))

(declare-fun m!1060227 () Bool)

(assert (=> b!1149342 m!1060227))

(declare-fun m!1060229 () Bool)

(assert (=> start!98914 m!1060229))

(declare-fun m!1060231 () Bool)

(assert (=> start!98914 m!1060231))

(check-sat (not b!1149328) (not start!98914) (not b!1149319) (not b!1149323) (not b!1149340) (not b!1149331) (not bm!53001) (not b!1149320) (not mapNonEmpty!45044) (not bm!53000) (not b!1149330) (not b!1149345) (not bm!53002) (not bm!53004) (not b!1149343) (not b_lambda!19383) (not b!1149337) (not b!1149347) (not b!1149335) (not b!1149327) (not b_next!24283) (not b!1149339) (not b!1149342) (not b!1149321) (not bm!53007) b_and!39419 tp_is_empty!28813)
(check-sat b_and!39419 (not b_next!24283))
