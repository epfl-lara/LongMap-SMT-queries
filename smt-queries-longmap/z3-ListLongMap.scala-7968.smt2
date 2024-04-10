; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98650 () Bool)

(assert start!98650)

(declare-fun b_free!24255 () Bool)

(declare-fun b_next!24255 () Bool)

(assert (=> start!98650 (= b_free!24255 (not b_next!24255))))

(declare-fun tp!85476 () Bool)

(declare-fun b_and!39359 () Bool)

(assert (=> start!98650 (= tp!85476 b_and!39359)))

(declare-fun b!1146742 () Bool)

(declare-datatypes ((Unit!37655 0))(
  ( (Unit!37656) )
))
(declare-fun e!652286 () Unit!37655)

(declare-fun Unit!37657 () Unit!37655)

(assert (=> b!1146742 (= e!652286 Unit!37657)))

(declare-datatypes ((V!43507 0))(
  ( (V!43508 (val!14449 Int)) )
))
(declare-fun zeroValue!944 () V!43507)

(declare-fun c!113158 () Bool)

(declare-fun call!52609 () Unit!37655)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43507)

(declare-fun c!113157 () Bool)

(declare-datatypes ((tuple2!18310 0))(
  ( (tuple2!18311 (_1!9166 (_ BitVec 64)) (_2!9166 V!43507)) )
))
(declare-datatypes ((List!25061 0))(
  ( (Nil!25058) (Cons!25057 (h!26266 tuple2!18310) (t!36308 List!25061)) )
))
(declare-datatypes ((ListLongMap!16279 0))(
  ( (ListLongMap!16280 (toList!8155 List!25061)) )
))
(declare-fun lt!512234 () ListLongMap!16279)

(declare-fun bm!52599 () Bool)

(declare-fun addStillContains!831 (ListLongMap!16279 (_ BitVec 64) V!43507 (_ BitVec 64)) Unit!37655)

(assert (=> bm!52599 (= call!52609 (addStillContains!831 lt!512234 (ite (or c!113157 c!113158) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113157 c!113158) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146743 () Bool)

(declare-fun res!763417 () Bool)

(declare-fun e!652301 () Bool)

(assert (=> b!1146743 (=> (not res!763417) (not e!652301))))

(declare-datatypes ((array!74417 0))(
  ( (array!74418 (arr!35859 (Array (_ BitVec 32) (_ BitVec 64))) (size!36395 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13683 0))(
  ( (ValueCellFull!13683 (v!17086 V!43507)) (EmptyCell!13683) )
))
(declare-datatypes ((array!74419 0))(
  ( (array!74420 (arr!35860 (Array (_ BitVec 32) ValueCell!13683)) (size!36396 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74419)

(assert (=> b!1146743 (= res!763417 (and (= (size!36396 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36395 _keys!1208) (size!36396 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146744 () Bool)

(declare-fun lt!512225 () ListLongMap!16279)

(declare-fun e!652291 () Bool)

(declare-fun -!1292 (ListLongMap!16279 (_ BitVec 64)) ListLongMap!16279)

(assert (=> b!1146744 (= e!652291 (= (-!1292 lt!512225 k0!934) lt!512234))))

(declare-fun b!1146745 () Bool)

(declare-fun res!763416 () Bool)

(declare-fun e!652300 () Bool)

(assert (=> b!1146745 (=> (not res!763416) (not e!652300))))

(declare-fun lt!512229 () array!74417)

(declare-datatypes ((List!25062 0))(
  ( (Nil!25059) (Cons!25058 (h!26267 (_ BitVec 64)) (t!36309 List!25062)) )
))
(declare-fun arrayNoDuplicates!0 (array!74417 (_ BitVec 32) List!25062) Bool)

(assert (=> b!1146745 (= res!763416 (arrayNoDuplicates!0 lt!512229 #b00000000000000000000000000000000 Nil!25059))))

(declare-fun lt!512242 () Bool)

(declare-fun e!652288 () Bool)

(declare-fun b!1146746 () Bool)

(assert (=> b!1146746 (= e!652288 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512242) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512226 () ListLongMap!16279)

(declare-fun call!52608 () ListLongMap!16279)

(declare-fun bm!52600 () Bool)

(declare-fun +!3579 (ListLongMap!16279 tuple2!18310) ListLongMap!16279)

(assert (=> bm!52600 (= call!52608 (+!3579 (ite c!113157 lt!512226 lt!512234) (ite c!113157 (tuple2!18311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113158 (tuple2!18311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1146748 () Bool)

(declare-fun e!652290 () Bool)

(declare-fun e!652287 () Bool)

(assert (=> b!1146748 (= e!652290 e!652287)))

(declare-fun res!763407 () Bool)

(assert (=> b!1146748 (=> res!763407 e!652287)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146748 (= res!763407 (not (= (select (arr!35859 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652302 () Bool)

(assert (=> b!1146748 e!652302))

(declare-fun c!113154 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146748 (= c!113154 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!512227 () Unit!37655)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!530 (array!74417 array!74419 (_ BitVec 32) (_ BitVec 32) V!43507 V!43507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37655)

(assert (=> b!1146748 (= lt!512227 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52607 () ListLongMap!16279)

(declare-fun bm!52601 () Bool)

(declare-fun call!52603 () Bool)

(declare-fun contains!6679 (ListLongMap!16279 (_ BitVec 64)) Bool)

(assert (=> bm!52601 (= call!52603 (contains!6679 (ite c!113157 lt!512226 call!52607) k0!934))))

(declare-fun b!1146749 () Bool)

(assert (=> b!1146749 (contains!6679 call!52608 k0!934)))

(declare-fun lt!512240 () Unit!37655)

(assert (=> b!1146749 (= lt!512240 (addStillContains!831 lt!512226 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1146749 call!52603))

(assert (=> b!1146749 (= lt!512226 (+!3579 lt!512234 (tuple2!18311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512241 () Unit!37655)

(assert (=> b!1146749 (= lt!512241 call!52609)))

(declare-fun e!652296 () Unit!37655)

(assert (=> b!1146749 (= e!652296 lt!512240)))

(declare-fun b!1146750 () Bool)

(declare-fun e!652293 () Bool)

(declare-fun tp_is_empty!28785 () Bool)

(assert (=> b!1146750 (= e!652293 tp_is_empty!28785)))

(declare-fun b!1146751 () Bool)

(declare-fun arrayContainsKey!0 (array!74417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146751 (= e!652288 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146752 () Bool)

(declare-fun e!652292 () Bool)

(assert (=> b!1146752 (= e!652292 tp_is_empty!28785)))

(declare-fun mapNonEmpty!45002 () Bool)

(declare-fun mapRes!45002 () Bool)

(declare-fun tp!85475 () Bool)

(assert (=> mapNonEmpty!45002 (= mapRes!45002 (and tp!85475 e!652292))))

(declare-fun mapKey!45002 () (_ BitVec 32))

(declare-fun mapRest!45002 () (Array (_ BitVec 32) ValueCell!13683))

(declare-fun mapValue!45002 () ValueCell!13683)

(assert (=> mapNonEmpty!45002 (= (arr!35860 _values!996) (store mapRest!45002 mapKey!45002 mapValue!45002))))

(declare-fun b!1146753 () Bool)

(declare-fun res!763413 () Bool)

(assert (=> b!1146753 (=> (not res!763413) (not e!652301))))

(assert (=> b!1146753 (= res!763413 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36395 _keys!1208))))))

(declare-fun b!1146754 () Bool)

(declare-fun e!652297 () Bool)

(assert (=> b!1146754 (= e!652297 (and e!652293 mapRes!45002))))

(declare-fun condMapEmpty!45002 () Bool)

(declare-fun mapDefault!45002 () ValueCell!13683)

(assert (=> b!1146754 (= condMapEmpty!45002 (= (arr!35860 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13683)) mapDefault!45002)))))

(declare-fun bm!52602 () Bool)

(declare-fun call!52602 () Unit!37655)

(assert (=> bm!52602 (= call!52602 call!52609)))

(declare-fun b!1146755 () Bool)

(assert (=> b!1146755 (= e!652287 true)))

(assert (=> b!1146755 e!652291))

(declare-fun res!763411 () Bool)

(assert (=> b!1146755 (=> (not res!763411) (not e!652291))))

(declare-fun lt!512228 () V!43507)

(assert (=> b!1146755 (= res!763411 (= (-!1292 (+!3579 lt!512234 (tuple2!18311 (select (arr!35859 _keys!1208) from!1455) lt!512228)) (select (arr!35859 _keys!1208) from!1455)) lt!512234))))

(declare-fun lt!512224 () Unit!37655)

(declare-fun addThenRemoveForNewKeyIsSame!140 (ListLongMap!16279 (_ BitVec 64) V!43507) Unit!37655)

(assert (=> b!1146755 (= lt!512224 (addThenRemoveForNewKeyIsSame!140 lt!512234 (select (arr!35859 _keys!1208) from!1455) lt!512228))))

(declare-fun lt!512238 () V!43507)

(declare-fun get!18238 (ValueCell!13683 V!43507) V!43507)

(assert (=> b!1146755 (= lt!512228 (get!18238 (select (arr!35860 _values!996) from!1455) lt!512238))))

(declare-fun lt!512244 () Unit!37655)

(declare-fun e!652298 () Unit!37655)

(assert (=> b!1146755 (= lt!512244 e!652298)))

(declare-fun c!113153 () Bool)

(assert (=> b!1146755 (= c!113153 (contains!6679 lt!512234 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4629 (array!74417 array!74419 (_ BitVec 32) (_ BitVec 32) V!43507 V!43507 (_ BitVec 32) Int) ListLongMap!16279)

(assert (=> b!1146755 (= lt!512234 (getCurrentListMapNoExtraKeys!4629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146756 () Bool)

(declare-fun call!52606 () ListLongMap!16279)

(declare-fun call!52605 () ListLongMap!16279)

(assert (=> b!1146756 (= e!652302 (= call!52606 call!52605))))

(declare-fun b!1146757 () Bool)

(declare-fun res!763410 () Bool)

(assert (=> b!1146757 (=> (not res!763410) (not e!652301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146757 (= res!763410 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45002 () Bool)

(assert (=> mapIsEmpty!45002 mapRes!45002))

(declare-fun b!1146758 () Bool)

(declare-fun e!652295 () Unit!37655)

(declare-fun lt!512243 () Unit!37655)

(assert (=> b!1146758 (= e!652295 lt!512243)))

(assert (=> b!1146758 (= lt!512243 call!52602)))

(declare-fun call!52604 () Bool)

(assert (=> b!1146758 call!52604))

(declare-fun e!652289 () Bool)

(declare-fun b!1146759 () Bool)

(assert (=> b!1146759 (= e!652289 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146747 () Bool)

(assert (=> b!1146747 (= e!652301 e!652300)))

(declare-fun res!763405 () Bool)

(assert (=> b!1146747 (=> (not res!763405) (not e!652300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74417 (_ BitVec 32)) Bool)

(assert (=> b!1146747 (= res!763405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512229 mask!1564))))

(assert (=> b!1146747 (= lt!512229 (array!74418 (store (arr!35859 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36395 _keys!1208)))))

(declare-fun res!763415 () Bool)

(assert (=> start!98650 (=> (not res!763415) (not e!652301))))

(assert (=> start!98650 (= res!763415 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36395 _keys!1208))))))

(assert (=> start!98650 e!652301))

(assert (=> start!98650 tp_is_empty!28785))

(declare-fun array_inv!27468 (array!74417) Bool)

(assert (=> start!98650 (array_inv!27468 _keys!1208)))

(assert (=> start!98650 true))

(assert (=> start!98650 tp!85476))

(declare-fun array_inv!27469 (array!74419) Bool)

(assert (=> start!98650 (and (array_inv!27469 _values!996) e!652297)))

(declare-fun bm!52603 () Bool)

(assert (=> bm!52603 (= call!52604 call!52603)))

(declare-fun b!1146760 () Bool)

(declare-fun res!763404 () Bool)

(assert (=> b!1146760 (=> (not res!763404) (not e!652301))))

(assert (=> b!1146760 (= res!763404 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25059))))

(declare-fun b!1146761 () Bool)

(assert (=> b!1146761 (= c!113158 (and (not lt!512242) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146761 (= e!652296 e!652295)))

(declare-fun b!1146762 () Bool)

(assert (=> b!1146762 (= e!652302 (= call!52606 (-!1292 call!52605 k0!934)))))

(declare-fun bm!52604 () Bool)

(assert (=> bm!52604 (= call!52605 (getCurrentListMapNoExtraKeys!4629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146763 () Bool)

(declare-fun e!652294 () Bool)

(assert (=> b!1146763 (= e!652300 (not e!652294))))

(declare-fun res!763412 () Bool)

(assert (=> b!1146763 (=> res!763412 e!652294)))

(assert (=> b!1146763 (= res!763412 (bvsgt from!1455 i!673))))

(assert (=> b!1146763 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512235 () Unit!37655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74417 (_ BitVec 64) (_ BitVec 32)) Unit!37655)

(assert (=> b!1146763 (= lt!512235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52605 () Bool)

(declare-fun lt!512239 () array!74419)

(assert (=> bm!52605 (= call!52606 (getCurrentListMapNoExtraKeys!4629 lt!512229 lt!512239 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146764 () Bool)

(assert (=> b!1146764 call!52604))

(declare-fun lt!512233 () Unit!37655)

(assert (=> b!1146764 (= lt!512233 call!52602)))

(assert (=> b!1146764 (= e!652286 lt!512233)))

(declare-fun b!1146765 () Bool)

(assert (=> b!1146765 (= e!652295 e!652286)))

(declare-fun c!113156 () Bool)

(assert (=> b!1146765 (= c!113156 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512242))))

(declare-fun b!1146766 () Bool)

(declare-fun res!763418 () Bool)

(assert (=> b!1146766 (=> (not res!763418) (not e!652301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146766 (= res!763418 (validMask!0 mask!1564))))

(declare-fun b!1146767 () Bool)

(declare-fun Unit!37658 () Unit!37655)

(assert (=> b!1146767 (= e!652298 Unit!37658)))

(assert (=> b!1146767 (= lt!512242 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146767 (= c!113157 (and (not lt!512242) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512230 () Unit!37655)

(assert (=> b!1146767 (= lt!512230 e!652296)))

(declare-fun lt!512232 () Unit!37655)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!424 (array!74417 array!74419 (_ BitVec 32) (_ BitVec 32) V!43507 V!43507 (_ BitVec 64) (_ BitVec 32) Int) Unit!37655)

(assert (=> b!1146767 (= lt!512232 (lemmaListMapContainsThenArrayContainsFrom!424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113155 () Bool)

(assert (=> b!1146767 (= c!113155 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763409 () Bool)

(assert (=> b!1146767 (= res!763409 e!652288)))

(assert (=> b!1146767 (=> (not res!763409) (not e!652289))))

(assert (=> b!1146767 e!652289))

(declare-fun lt!512231 () Unit!37655)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74417 (_ BitVec 32) (_ BitVec 32)) Unit!37655)

(assert (=> b!1146767 (= lt!512231 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146767 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25059)))

(declare-fun lt!512236 () Unit!37655)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74417 (_ BitVec 64) (_ BitVec 32) List!25062) Unit!37655)

(assert (=> b!1146767 (= lt!512236 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25059))))

(assert (=> b!1146767 false))

(declare-fun bm!52606 () Bool)

(assert (=> bm!52606 (= call!52607 call!52608)))

(declare-fun b!1146768 () Bool)

(declare-fun Unit!37659 () Unit!37655)

(assert (=> b!1146768 (= e!652298 Unit!37659)))

(declare-fun b!1146769 () Bool)

(declare-fun res!763414 () Bool)

(assert (=> b!1146769 (=> (not res!763414) (not e!652301))))

(assert (=> b!1146769 (= res!763414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146770 () Bool)

(assert (=> b!1146770 (= e!652294 e!652290)))

(declare-fun res!763406 () Bool)

(assert (=> b!1146770 (=> res!763406 e!652290)))

(assert (=> b!1146770 (= res!763406 (not (= from!1455 i!673)))))

(declare-fun lt!512237 () ListLongMap!16279)

(assert (=> b!1146770 (= lt!512237 (getCurrentListMapNoExtraKeys!4629 lt!512229 lt!512239 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146770 (= lt!512239 (array!74420 (store (arr!35860 _values!996) i!673 (ValueCellFull!13683 lt!512238)) (size!36396 _values!996)))))

(declare-fun dynLambda!2662 (Int (_ BitVec 64)) V!43507)

(assert (=> b!1146770 (= lt!512238 (dynLambda!2662 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1146770 (= lt!512225 (getCurrentListMapNoExtraKeys!4629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146771 () Bool)

(declare-fun res!763408 () Bool)

(assert (=> b!1146771 (=> (not res!763408) (not e!652301))))

(assert (=> b!1146771 (= res!763408 (= (select (arr!35859 _keys!1208) i!673) k0!934))))

(assert (= (and start!98650 res!763415) b!1146766))

(assert (= (and b!1146766 res!763418) b!1146743))

(assert (= (and b!1146743 res!763417) b!1146769))

(assert (= (and b!1146769 res!763414) b!1146760))

(assert (= (and b!1146760 res!763404) b!1146753))

(assert (= (and b!1146753 res!763413) b!1146757))

(assert (= (and b!1146757 res!763410) b!1146771))

(assert (= (and b!1146771 res!763408) b!1146747))

(assert (= (and b!1146747 res!763405) b!1146745))

(assert (= (and b!1146745 res!763416) b!1146763))

(assert (= (and b!1146763 (not res!763412)) b!1146770))

(assert (= (and b!1146770 (not res!763406)) b!1146748))

(assert (= (and b!1146748 c!113154) b!1146762))

(assert (= (and b!1146748 (not c!113154)) b!1146756))

(assert (= (or b!1146762 b!1146756) bm!52604))

(assert (= (or b!1146762 b!1146756) bm!52605))

(assert (= (and b!1146748 (not res!763407)) b!1146755))

(assert (= (and b!1146755 c!113153) b!1146767))

(assert (= (and b!1146755 (not c!113153)) b!1146768))

(assert (= (and b!1146767 c!113157) b!1146749))

(assert (= (and b!1146767 (not c!113157)) b!1146761))

(assert (= (and b!1146761 c!113158) b!1146758))

(assert (= (and b!1146761 (not c!113158)) b!1146765))

(assert (= (and b!1146765 c!113156) b!1146764))

(assert (= (and b!1146765 (not c!113156)) b!1146742))

(assert (= (or b!1146758 b!1146764) bm!52602))

(assert (= (or b!1146758 b!1146764) bm!52606))

(assert (= (or b!1146758 b!1146764) bm!52603))

(assert (= (or b!1146749 bm!52603) bm!52601))

(assert (= (or b!1146749 bm!52602) bm!52599))

(assert (= (or b!1146749 bm!52606) bm!52600))

(assert (= (and b!1146767 c!113155) b!1146751))

(assert (= (and b!1146767 (not c!113155)) b!1146746))

(assert (= (and b!1146767 res!763409) b!1146759))

(assert (= (and b!1146755 res!763411) b!1146744))

(assert (= (and b!1146754 condMapEmpty!45002) mapIsEmpty!45002))

(assert (= (and b!1146754 (not condMapEmpty!45002)) mapNonEmpty!45002))

(get-info :version)

(assert (= (and mapNonEmpty!45002 ((_ is ValueCellFull!13683) mapValue!45002)) b!1146752))

(assert (= (and b!1146754 ((_ is ValueCellFull!13683) mapDefault!45002)) b!1146750))

(assert (= start!98650 b!1146754))

(declare-fun b_lambda!19361 () Bool)

(assert (=> (not b_lambda!19361) (not b!1146770)))

(declare-fun t!36307 () Bool)

(declare-fun tb!9067 () Bool)

(assert (=> (and start!98650 (= defaultEntry!1004 defaultEntry!1004) t!36307) tb!9067))

(declare-fun result!18699 () Bool)

(assert (=> tb!9067 (= result!18699 tp_is_empty!28785)))

(assert (=> b!1146770 t!36307))

(declare-fun b_and!39361 () Bool)

(assert (= b_and!39359 (and (=> t!36307 result!18699) b_and!39361)))

(declare-fun m!1057459 () Bool)

(assert (=> b!1146762 m!1057459))

(declare-fun m!1057461 () Bool)

(assert (=> b!1146744 m!1057461))

(declare-fun m!1057463 () Bool)

(assert (=> b!1146767 m!1057463))

(declare-fun m!1057465 () Bool)

(assert (=> b!1146767 m!1057465))

(declare-fun m!1057467 () Bool)

(assert (=> b!1146767 m!1057467))

(declare-fun m!1057469 () Bool)

(assert (=> b!1146767 m!1057469))

(declare-fun m!1057471 () Bool)

(assert (=> bm!52600 m!1057471))

(declare-fun m!1057473 () Bool)

(assert (=> b!1146745 m!1057473))

(declare-fun m!1057475 () Bool)

(assert (=> bm!52599 m!1057475))

(declare-fun m!1057477 () Bool)

(assert (=> b!1146747 m!1057477))

(declare-fun m!1057479 () Bool)

(assert (=> b!1146747 m!1057479))

(declare-fun m!1057481 () Bool)

(assert (=> b!1146771 m!1057481))

(declare-fun m!1057483 () Bool)

(assert (=> bm!52605 m!1057483))

(declare-fun m!1057485 () Bool)

(assert (=> b!1146755 m!1057485))

(declare-fun m!1057487 () Bool)

(assert (=> b!1146755 m!1057487))

(assert (=> b!1146755 m!1057487))

(declare-fun m!1057489 () Bool)

(assert (=> b!1146755 m!1057489))

(declare-fun m!1057491 () Bool)

(assert (=> b!1146755 m!1057491))

(assert (=> b!1146755 m!1057489))

(declare-fun m!1057493 () Bool)

(assert (=> b!1146755 m!1057493))

(declare-fun m!1057495 () Bool)

(assert (=> b!1146755 m!1057495))

(assert (=> b!1146755 m!1057489))

(declare-fun m!1057497 () Bool)

(assert (=> b!1146755 m!1057497))

(assert (=> b!1146755 m!1057485))

(declare-fun m!1057499 () Bool)

(assert (=> b!1146755 m!1057499))

(declare-fun m!1057501 () Bool)

(assert (=> b!1146751 m!1057501))

(declare-fun m!1057503 () Bool)

(assert (=> start!98650 m!1057503))

(declare-fun m!1057505 () Bool)

(assert (=> start!98650 m!1057505))

(declare-fun m!1057507 () Bool)

(assert (=> b!1146770 m!1057507))

(declare-fun m!1057509 () Bool)

(assert (=> b!1146770 m!1057509))

(declare-fun m!1057511 () Bool)

(assert (=> b!1146770 m!1057511))

(declare-fun m!1057513 () Bool)

(assert (=> b!1146770 m!1057513))

(assert (=> b!1146759 m!1057501))

(declare-fun m!1057515 () Bool)

(assert (=> b!1146760 m!1057515))

(declare-fun m!1057517 () Bool)

(assert (=> b!1146766 m!1057517))

(declare-fun m!1057519 () Bool)

(assert (=> b!1146757 m!1057519))

(declare-fun m!1057521 () Bool)

(assert (=> b!1146769 m!1057521))

(declare-fun m!1057523 () Bool)

(assert (=> bm!52601 m!1057523))

(declare-fun m!1057525 () Bool)

(assert (=> b!1146749 m!1057525))

(declare-fun m!1057527 () Bool)

(assert (=> b!1146749 m!1057527))

(declare-fun m!1057529 () Bool)

(assert (=> b!1146749 m!1057529))

(declare-fun m!1057531 () Bool)

(assert (=> mapNonEmpty!45002 m!1057531))

(declare-fun m!1057533 () Bool)

(assert (=> b!1146763 m!1057533))

(declare-fun m!1057535 () Bool)

(assert (=> b!1146763 m!1057535))

(assert (=> b!1146748 m!1057489))

(declare-fun m!1057537 () Bool)

(assert (=> b!1146748 m!1057537))

(assert (=> bm!52604 m!1057497))

(check-sat (not mapNonEmpty!45002) (not b!1146766) (not b!1146748) (not b!1146757) (not b!1146762) (not b!1146767) (not b!1146749) (not bm!52604) (not b!1146759) b_and!39361 (not b!1146763) (not b_lambda!19361) (not b!1146755) (not bm!52601) (not b_next!24255) (not bm!52600) (not bm!52599) (not bm!52605) tp_is_empty!28785 (not b!1146747) (not b!1146745) (not b!1146760) (not b!1146769) (not start!98650) (not b!1146744) (not b!1146770) (not b!1146751))
(check-sat b_and!39361 (not b_next!24255))
