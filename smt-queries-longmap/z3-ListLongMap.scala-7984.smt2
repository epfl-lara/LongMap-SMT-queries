; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98746 () Bool)

(assert start!98746)

(declare-fun b_free!24351 () Bool)

(declare-fun b_next!24351 () Bool)

(assert (=> start!98746 (= b_free!24351 (not b_next!24351))))

(declare-fun tp!85763 () Bool)

(declare-fun b_and!39551 () Bool)

(assert (=> start!98746 (= tp!85763 b_and!39551)))

(declare-datatypes ((V!43635 0))(
  ( (V!43636 (val!14497 Int)) )
))
(declare-fun zeroValue!944 () V!43635)

(declare-datatypes ((array!74609 0))(
  ( (array!74610 (arr!35955 (Array (_ BitVec 32) (_ BitVec 64))) (size!36491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!53751 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13731 0))(
  ( (ValueCellFull!13731 (v!17134 V!43635)) (EmptyCell!13731) )
))
(declare-datatypes ((array!74611 0))(
  ( (array!74612 (arr!35956 (Array (_ BitVec 32) ValueCell!13731)) (size!36492 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74611)

(declare-fun minValue!944 () V!43635)

(declare-datatypes ((tuple2!18404 0))(
  ( (tuple2!18405 (_1!9213 (_ BitVec 64)) (_2!9213 V!43635)) )
))
(declare-datatypes ((List!25152 0))(
  ( (Nil!25149) (Cons!25148 (h!26357 tuple2!18404) (t!36495 List!25152)) )
))
(declare-datatypes ((ListLongMap!16373 0))(
  ( (ListLongMap!16374 (toList!8202 List!25152)) )
))
(declare-fun call!53754 () ListLongMap!16373)

(declare-fun getCurrentListMapNoExtraKeys!4674 (array!74609 array!74611 (_ BitVec 32) (_ BitVec 32) V!43635 V!43635 (_ BitVec 32) Int) ListLongMap!16373)

(assert (=> bm!53751 (= call!53754 (getCurrentListMapNoExtraKeys!4674 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151158 () Bool)

(declare-fun res!765577 () Bool)

(declare-fun e!654740 () Bool)

(assert (=> b!1151158 (=> (not res!765577) (not e!654740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74609 (_ BitVec 32)) Bool)

(assert (=> b!1151158 (= res!765577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151159 () Bool)

(declare-fun c!114017 () Bool)

(declare-fun lt!515322 () Bool)

(assert (=> b!1151159 (= c!114017 (and (not lt!515322) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37864 0))(
  ( (Unit!37865) )
))
(declare-fun e!654750 () Unit!37864)

(declare-fun e!654735 () Unit!37864)

(assert (=> b!1151159 (= e!654750 e!654735)))

(declare-fun lt!515332 () ListLongMap!16373)

(declare-fun bm!53752 () Bool)

(declare-fun lt!515327 () ListLongMap!16373)

(declare-fun call!53761 () ListLongMap!16373)

(declare-fun c!114021 () Bool)

(declare-fun +!3620 (ListLongMap!16373 tuple2!18404) ListLongMap!16373)

(assert (=> bm!53752 (= call!53761 (+!3620 (ite c!114021 lt!515327 lt!515332) (ite c!114021 (tuple2!18405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114017 (tuple2!18405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151160 () Bool)

(declare-fun e!654742 () Bool)

(declare-fun e!654745 () Bool)

(declare-fun mapRes!45146 () Bool)

(assert (=> b!1151160 (= e!654742 (and e!654745 mapRes!45146))))

(declare-fun condMapEmpty!45146 () Bool)

(declare-fun mapDefault!45146 () ValueCell!13731)

(assert (=> b!1151160 (= condMapEmpty!45146 (= (arr!35956 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13731)) mapDefault!45146)))))

(declare-fun b!1151161 () Bool)

(declare-fun e!654739 () Unit!37864)

(declare-fun Unit!37866 () Unit!37864)

(assert (=> b!1151161 (= e!654739 Unit!37866)))

(declare-fun b!1151162 () Bool)

(declare-fun res!765574 () Bool)

(assert (=> b!1151162 (=> (not res!765574) (not e!654740))))

(declare-datatypes ((List!25153 0))(
  ( (Nil!25150) (Cons!25149 (h!26358 (_ BitVec 64)) (t!36496 List!25153)) )
))
(declare-fun arrayNoDuplicates!0 (array!74609 (_ BitVec 32) List!25153) Bool)

(assert (=> b!1151162 (= res!765574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25150))))

(declare-fun b!1151163 () Bool)

(declare-fun e!654736 () Bool)

(declare-fun call!53759 () ListLongMap!16373)

(assert (=> b!1151163 (= e!654736 (= call!53759 call!53754))))

(declare-fun b!1151164 () Bool)

(declare-fun res!765576 () Bool)

(assert (=> b!1151164 (=> (not res!765576) (not e!654740))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151164 (= res!765576 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36491 _keys!1208))))))

(declare-fun call!53758 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!53753 () Bool)

(declare-fun call!53755 () ListLongMap!16373)

(declare-fun contains!6721 (ListLongMap!16373 (_ BitVec 64)) Bool)

(assert (=> bm!53753 (= call!53758 (contains!6721 (ite c!114021 lt!515327 call!53755) k0!934))))

(declare-fun e!654746 () Bool)

(declare-fun b!1151165 () Bool)

(declare-fun arrayContainsKey!0 (array!74609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151165 (= e!654746 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151166 () Bool)

(declare-fun e!654748 () Unit!37864)

(declare-fun Unit!37867 () Unit!37864)

(assert (=> b!1151166 (= e!654748 Unit!37867)))

(declare-fun bm!53754 () Bool)

(declare-fun call!53760 () Unit!37864)

(declare-fun call!53756 () Unit!37864)

(assert (=> bm!53754 (= call!53760 call!53756)))

(declare-fun bm!53755 () Bool)

(assert (=> bm!53755 (= call!53755 call!53761)))

(declare-fun b!1151167 () Bool)

(declare-fun Unit!37868 () Unit!37864)

(assert (=> b!1151167 (= e!654739 Unit!37868)))

(assert (=> b!1151167 (= lt!515322 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151167 (= c!114021 (and (not lt!515322) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515320 () Unit!37864)

(assert (=> b!1151167 (= lt!515320 e!654750)))

(declare-fun lt!515331 () Unit!37864)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!462 (array!74609 array!74611 (_ BitVec 32) (_ BitVec 32) V!43635 V!43635 (_ BitVec 64) (_ BitVec 32) Int) Unit!37864)

(assert (=> b!1151167 (= lt!515331 (lemmaListMapContainsThenArrayContainsFrom!462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114022 () Bool)

(assert (=> b!1151167 (= c!114022 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765568 () Bool)

(declare-fun e!654749 () Bool)

(assert (=> b!1151167 (= res!765568 e!654749)))

(assert (=> b!1151167 (=> (not res!765568) (not e!654746))))

(assert (=> b!1151167 e!654746))

(declare-fun lt!515325 () Unit!37864)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74609 (_ BitVec 32) (_ BitVec 32)) Unit!37864)

(assert (=> b!1151167 (= lt!515325 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151167 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25150)))

(declare-fun lt!515326 () Unit!37864)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74609 (_ BitVec 64) (_ BitVec 32) List!25153) Unit!37864)

(assert (=> b!1151167 (= lt!515326 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25150))))

(assert (=> b!1151167 false))

(declare-fun res!765570 () Bool)

(assert (=> start!98746 (=> (not res!765570) (not e!654740))))

(assert (=> start!98746 (= res!765570 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36491 _keys!1208))))))

(assert (=> start!98746 e!654740))

(declare-fun tp_is_empty!28881 () Bool)

(assert (=> start!98746 tp_is_empty!28881))

(declare-fun array_inv!27536 (array!74609) Bool)

(assert (=> start!98746 (array_inv!27536 _keys!1208)))

(assert (=> start!98746 true))

(assert (=> start!98746 tp!85763))

(declare-fun array_inv!27537 (array!74611) Bool)

(assert (=> start!98746 (and (array_inv!27537 _values!996) e!654742)))

(declare-fun bm!53756 () Bool)

(declare-fun call!53757 () Bool)

(assert (=> bm!53756 (= call!53757 call!53758)))

(declare-fun b!1151168 () Bool)

(declare-fun res!765565 () Bool)

(assert (=> b!1151168 (=> (not res!765565) (not e!654740))))

(assert (=> b!1151168 (= res!765565 (and (= (size!36492 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36491 _keys!1208) (size!36492 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45146 () Bool)

(assert (=> mapIsEmpty!45146 mapRes!45146))

(declare-fun b!1151169 () Bool)

(declare-fun e!654743 () Bool)

(declare-fun e!654734 () Bool)

(assert (=> b!1151169 (= e!654743 e!654734)))

(declare-fun res!765572 () Bool)

(assert (=> b!1151169 (=> res!765572 e!654734)))

(assert (=> b!1151169 (= res!765572 (not (= from!1455 i!673)))))

(declare-fun lt!515323 () array!74611)

(declare-fun lt!515321 () array!74609)

(declare-fun lt!515330 () ListLongMap!16373)

(assert (=> b!1151169 (= lt!515330 (getCurrentListMapNoExtraKeys!4674 lt!515321 lt!515323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515319 () V!43635)

(assert (=> b!1151169 (= lt!515323 (array!74612 (store (arr!35956 _values!996) i!673 (ValueCellFull!13731 lt!515319)) (size!36492 _values!996)))))

(declare-fun dynLambda!2697 (Int (_ BitVec 64)) V!43635)

(assert (=> b!1151169 (= lt!515319 (dynLambda!2697 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515335 () ListLongMap!16373)

(assert (=> b!1151169 (= lt!515335 (getCurrentListMapNoExtraKeys!4674 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151170 () Bool)

(declare-fun res!765578 () Bool)

(declare-fun e!654741 () Bool)

(assert (=> b!1151170 (=> (not res!765578) (not e!654741))))

(assert (=> b!1151170 (= res!765578 (arrayNoDuplicates!0 lt!515321 #b00000000000000000000000000000000 Nil!25150))))

(declare-fun b!1151171 () Bool)

(declare-fun e!654747 () Bool)

(assert (=> b!1151171 (= e!654747 tp_is_empty!28881)))

(declare-fun b!1151172 () Bool)

(declare-fun lt!515329 () Unit!37864)

(assert (=> b!1151172 (= e!654735 lt!515329)))

(assert (=> b!1151172 (= lt!515329 call!53760)))

(assert (=> b!1151172 call!53757))

(declare-fun b!1151173 () Bool)

(declare-fun res!765567 () Bool)

(assert (=> b!1151173 (=> (not res!765567) (not e!654740))))

(assert (=> b!1151173 (= res!765567 (= (select (arr!35955 _keys!1208) i!673) k0!934))))

(declare-fun b!1151174 () Bool)

(assert (=> b!1151174 (= e!654735 e!654748)))

(declare-fun c!114018 () Bool)

(assert (=> b!1151174 (= c!114018 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515322))))

(declare-fun b!1151175 () Bool)

(declare-fun res!765564 () Bool)

(assert (=> b!1151175 (=> (not res!765564) (not e!654740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151175 (= res!765564 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45146 () Bool)

(declare-fun tp!85764 () Bool)

(assert (=> mapNonEmpty!45146 (= mapRes!45146 (and tp!85764 e!654747))))

(declare-fun mapRest!45146 () (Array (_ BitVec 32) ValueCell!13731))

(declare-fun mapKey!45146 () (_ BitVec 32))

(declare-fun mapValue!45146 () ValueCell!13731)

(assert (=> mapNonEmpty!45146 (= (arr!35956 _values!996) (store mapRest!45146 mapKey!45146 mapValue!45146))))

(declare-fun e!654738 () Bool)

(declare-fun b!1151176 () Bool)

(declare-fun lt!515324 () ListLongMap!16373)

(assert (=> b!1151176 (= e!654738 (= lt!515324 (getCurrentListMapNoExtraKeys!4674 lt!515321 lt!515323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151177 () Bool)

(assert (=> b!1151177 call!53757))

(declare-fun lt!515333 () Unit!37864)

(assert (=> b!1151177 (= lt!515333 call!53760)))

(assert (=> b!1151177 (= e!654748 lt!515333)))

(declare-fun b!1151178 () Bool)

(declare-fun res!765575 () Bool)

(assert (=> b!1151178 (=> (not res!765575) (not e!654740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151178 (= res!765575 (validMask!0 mask!1564))))

(declare-fun b!1151179 () Bool)

(assert (=> b!1151179 (= e!654749 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515322) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151180 () Bool)

(assert (=> b!1151180 (= e!654749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53757 () Bool)

(assert (=> bm!53757 (= call!53759 (getCurrentListMapNoExtraKeys!4674 lt!515321 lt!515323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151181 () Bool)

(assert (=> b!1151181 (= e!654740 e!654741)))

(declare-fun res!765569 () Bool)

(assert (=> b!1151181 (=> (not res!765569) (not e!654741))))

(assert (=> b!1151181 (= res!765569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515321 mask!1564))))

(assert (=> b!1151181 (= lt!515321 (array!74610 (store (arr!35955 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36491 _keys!1208)))))

(declare-fun bm!53758 () Bool)

(declare-fun addStillContains!870 (ListLongMap!16373 (_ BitVec 64) V!43635 (_ BitVec 64)) Unit!37864)

(assert (=> bm!53758 (= call!53756 (addStillContains!870 (ite c!114021 lt!515327 lt!515332) (ite c!114021 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114017 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114021 minValue!944 (ite c!114017 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1151182 () Bool)

(declare-fun e!654744 () Bool)

(assert (=> b!1151182 (= e!654734 e!654744)))

(declare-fun res!765566 () Bool)

(assert (=> b!1151182 (=> res!765566 e!654744)))

(assert (=> b!1151182 (= res!765566 (not (= (select (arr!35955 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151182 e!654736))

(declare-fun c!114020 () Bool)

(assert (=> b!1151182 (= c!114020 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515318 () Unit!37864)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!570 (array!74609 array!74611 (_ BitVec 32) (_ BitVec 32) V!43635 V!43635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37864)

(assert (=> b!1151182 (= lt!515318 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151183 () Bool)

(assert (=> b!1151183 (= e!654744 true)))

(assert (=> b!1151183 e!654738))

(declare-fun res!765571 () Bool)

(assert (=> b!1151183 (=> (not res!765571) (not e!654738))))

(assert (=> b!1151183 (= res!765571 (= lt!515324 lt!515332))))

(declare-fun -!1333 (ListLongMap!16373 (_ BitVec 64)) ListLongMap!16373)

(assert (=> b!1151183 (= lt!515324 (-!1333 lt!515335 k0!934))))

(declare-fun lt!515317 () V!43635)

(assert (=> b!1151183 (= (-!1333 (+!3620 lt!515332 (tuple2!18405 (select (arr!35955 _keys!1208) from!1455) lt!515317)) (select (arr!35955 _keys!1208) from!1455)) lt!515332)))

(declare-fun lt!515334 () Unit!37864)

(declare-fun addThenRemoveForNewKeyIsSame!176 (ListLongMap!16373 (_ BitVec 64) V!43635) Unit!37864)

(assert (=> b!1151183 (= lt!515334 (addThenRemoveForNewKeyIsSame!176 lt!515332 (select (arr!35955 _keys!1208) from!1455) lt!515317))))

(declare-fun get!18306 (ValueCell!13731 V!43635) V!43635)

(assert (=> b!1151183 (= lt!515317 (get!18306 (select (arr!35956 _values!996) from!1455) lt!515319))))

(declare-fun lt!515316 () Unit!37864)

(assert (=> b!1151183 (= lt!515316 e!654739)))

(declare-fun c!114019 () Bool)

(assert (=> b!1151183 (= c!114019 (contains!6721 lt!515332 k0!934))))

(assert (=> b!1151183 (= lt!515332 (getCurrentListMapNoExtraKeys!4674 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151184 () Bool)

(assert (=> b!1151184 (= e!654736 (= call!53759 (-!1333 call!53754 k0!934)))))

(declare-fun b!1151185 () Bool)

(assert (=> b!1151185 (= e!654741 (not e!654743))))

(declare-fun res!765573 () Bool)

(assert (=> b!1151185 (=> res!765573 e!654743)))

(assert (=> b!1151185 (= res!765573 (bvsgt from!1455 i!673))))

(assert (=> b!1151185 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515336 () Unit!37864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74609 (_ BitVec 64) (_ BitVec 32)) Unit!37864)

(assert (=> b!1151185 (= lt!515336 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151186 () Bool)

(assert (=> b!1151186 (= e!654745 tp_is_empty!28881)))

(declare-fun b!1151187 () Bool)

(assert (=> b!1151187 (contains!6721 call!53761 k0!934)))

(declare-fun lt!515328 () Unit!37864)

(assert (=> b!1151187 (= lt!515328 call!53756)))

(assert (=> b!1151187 call!53758))

(assert (=> b!1151187 (= lt!515327 (+!3620 lt!515332 (tuple2!18405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515337 () Unit!37864)

(assert (=> b!1151187 (= lt!515337 (addStillContains!870 lt!515332 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1151187 (= e!654750 lt!515328)))

(assert (= (and start!98746 res!765570) b!1151178))

(assert (= (and b!1151178 res!765575) b!1151168))

(assert (= (and b!1151168 res!765565) b!1151158))

(assert (= (and b!1151158 res!765577) b!1151162))

(assert (= (and b!1151162 res!765574) b!1151164))

(assert (= (and b!1151164 res!765576) b!1151175))

(assert (= (and b!1151175 res!765564) b!1151173))

(assert (= (and b!1151173 res!765567) b!1151181))

(assert (= (and b!1151181 res!765569) b!1151170))

(assert (= (and b!1151170 res!765578) b!1151185))

(assert (= (and b!1151185 (not res!765573)) b!1151169))

(assert (= (and b!1151169 (not res!765572)) b!1151182))

(assert (= (and b!1151182 c!114020) b!1151184))

(assert (= (and b!1151182 (not c!114020)) b!1151163))

(assert (= (or b!1151184 b!1151163) bm!53757))

(assert (= (or b!1151184 b!1151163) bm!53751))

(assert (= (and b!1151182 (not res!765566)) b!1151183))

(assert (= (and b!1151183 c!114019) b!1151167))

(assert (= (and b!1151183 (not c!114019)) b!1151161))

(assert (= (and b!1151167 c!114021) b!1151187))

(assert (= (and b!1151167 (not c!114021)) b!1151159))

(assert (= (and b!1151159 c!114017) b!1151172))

(assert (= (and b!1151159 (not c!114017)) b!1151174))

(assert (= (and b!1151174 c!114018) b!1151177))

(assert (= (and b!1151174 (not c!114018)) b!1151166))

(assert (= (or b!1151172 b!1151177) bm!53754))

(assert (= (or b!1151172 b!1151177) bm!53755))

(assert (= (or b!1151172 b!1151177) bm!53756))

(assert (= (or b!1151187 bm!53756) bm!53753))

(assert (= (or b!1151187 bm!53754) bm!53758))

(assert (= (or b!1151187 bm!53755) bm!53752))

(assert (= (and b!1151167 c!114022) b!1151180))

(assert (= (and b!1151167 (not c!114022)) b!1151179))

(assert (= (and b!1151167 res!765568) b!1151165))

(assert (= (and b!1151183 res!765571) b!1151176))

(assert (= (and b!1151160 condMapEmpty!45146) mapIsEmpty!45146))

(assert (= (and b!1151160 (not condMapEmpty!45146)) mapNonEmpty!45146))

(get-info :version)

(assert (= (and mapNonEmpty!45146 ((_ is ValueCellFull!13731) mapValue!45146)) b!1151171))

(assert (= (and b!1151160 ((_ is ValueCellFull!13731) mapDefault!45146)) b!1151186))

(assert (= start!98746 b!1151160))

(declare-fun b_lambda!19457 () Bool)

(assert (=> (not b_lambda!19457) (not b!1151169)))

(declare-fun t!36494 () Bool)

(declare-fun tb!9163 () Bool)

(assert (=> (and start!98746 (= defaultEntry!1004 defaultEntry!1004) t!36494) tb!9163))

(declare-fun result!18891 () Bool)

(assert (=> tb!9163 (= result!18891 tp_is_empty!28881)))

(assert (=> b!1151169 t!36494))

(declare-fun b_and!39553 () Bool)

(assert (= b_and!39551 (and (=> t!36494 result!18891) b_and!39553)))

(declare-fun m!1061305 () Bool)

(assert (=> b!1151165 m!1061305))

(declare-fun m!1061307 () Bool)

(assert (=> b!1151182 m!1061307))

(declare-fun m!1061309 () Bool)

(assert (=> b!1151182 m!1061309))

(declare-fun m!1061311 () Bool)

(assert (=> bm!53752 m!1061311))

(declare-fun m!1061313 () Bool)

(assert (=> b!1151175 m!1061313))

(declare-fun m!1061315 () Bool)

(assert (=> mapNonEmpty!45146 m!1061315))

(declare-fun m!1061317 () Bool)

(assert (=> b!1151185 m!1061317))

(declare-fun m!1061319 () Bool)

(assert (=> b!1151185 m!1061319))

(declare-fun m!1061321 () Bool)

(assert (=> bm!53751 m!1061321))

(declare-fun m!1061323 () Bool)

(assert (=> b!1151162 m!1061323))

(declare-fun m!1061325 () Bool)

(assert (=> b!1151178 m!1061325))

(declare-fun m!1061327 () Bool)

(assert (=> bm!53758 m!1061327))

(declare-fun m!1061329 () Bool)

(assert (=> b!1151187 m!1061329))

(declare-fun m!1061331 () Bool)

(assert (=> b!1151187 m!1061331))

(declare-fun m!1061333 () Bool)

(assert (=> b!1151187 m!1061333))

(declare-fun m!1061335 () Bool)

(assert (=> bm!53757 m!1061335))

(declare-fun m!1061337 () Bool)

(assert (=> b!1151158 m!1061337))

(assert (=> b!1151180 m!1061305))

(declare-fun m!1061339 () Bool)

(assert (=> b!1151170 m!1061339))

(declare-fun m!1061341 () Bool)

(assert (=> b!1151167 m!1061341))

(declare-fun m!1061343 () Bool)

(assert (=> b!1151167 m!1061343))

(declare-fun m!1061345 () Bool)

(assert (=> b!1151167 m!1061345))

(declare-fun m!1061347 () Bool)

(assert (=> b!1151167 m!1061347))

(assert (=> b!1151176 m!1061335))

(declare-fun m!1061349 () Bool)

(assert (=> b!1151173 m!1061349))

(declare-fun m!1061351 () Bool)

(assert (=> b!1151169 m!1061351))

(declare-fun m!1061353 () Bool)

(assert (=> b!1151169 m!1061353))

(declare-fun m!1061355 () Bool)

(assert (=> b!1151169 m!1061355))

(declare-fun m!1061357 () Bool)

(assert (=> b!1151169 m!1061357))

(assert (=> b!1151183 m!1061321))

(declare-fun m!1061359 () Bool)

(assert (=> b!1151183 m!1061359))

(assert (=> b!1151183 m!1061307))

(declare-fun m!1061361 () Bool)

(assert (=> b!1151183 m!1061361))

(declare-fun m!1061363 () Bool)

(assert (=> b!1151183 m!1061363))

(assert (=> b!1151183 m!1061359))

(declare-fun m!1061365 () Bool)

(assert (=> b!1151183 m!1061365))

(declare-fun m!1061367 () Bool)

(assert (=> b!1151183 m!1061367))

(assert (=> b!1151183 m!1061363))

(assert (=> b!1151183 m!1061307))

(declare-fun m!1061369 () Bool)

(assert (=> b!1151183 m!1061369))

(assert (=> b!1151183 m!1061307))

(declare-fun m!1061371 () Bool)

(assert (=> b!1151183 m!1061371))

(declare-fun m!1061373 () Bool)

(assert (=> start!98746 m!1061373))

(declare-fun m!1061375 () Bool)

(assert (=> start!98746 m!1061375))

(declare-fun m!1061377 () Bool)

(assert (=> b!1151181 m!1061377))

(declare-fun m!1061379 () Bool)

(assert (=> b!1151181 m!1061379))

(declare-fun m!1061381 () Bool)

(assert (=> bm!53753 m!1061381))

(declare-fun m!1061383 () Bool)

(assert (=> b!1151184 m!1061383))

(check-sat (not bm!53752) (not b!1151181) (not b!1151185) (not b!1151169) (not mapNonEmpty!45146) (not b_lambda!19457) (not bm!53751) (not b!1151162) (not b!1151170) (not b!1151178) (not b!1151182) (not b!1151165) (not b!1151187) (not b_next!24351) (not bm!53758) (not b!1151180) (not b!1151158) tp_is_empty!28881 (not start!98746) (not b!1151176) (not b!1151175) (not b!1151167) (not b!1151183) (not bm!53753) (not bm!53757) b_and!39553 (not b!1151184))
(check-sat b_and!39553 (not b_next!24351))
