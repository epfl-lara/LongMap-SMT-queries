; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98866 () Bool)

(assert start!98866)

(declare-fun b_free!24471 () Bool)

(declare-fun b_next!24471 () Bool)

(assert (=> start!98866 (= b_free!24471 (not b_next!24471))))

(declare-fun tp!86123 () Bool)

(declare-fun b_and!39791 () Bool)

(assert (=> start!98866 (= tp!86123 b_and!39791)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1156678 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74847 0))(
  ( (array!74848 (arr!36074 (Array (_ BitVec 32) (_ BitVec 64))) (size!36610 (_ BitVec 32))) )
))
(declare-fun lt!519281 () array!74847)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43795 0))(
  ( (V!43796 (val!14557 Int)) )
))
(declare-datatypes ((tuple2!18518 0))(
  ( (tuple2!18519 (_1!9270 (_ BitVec 64)) (_2!9270 V!43795)) )
))
(declare-datatypes ((List!25260 0))(
  ( (Nil!25257) (Cons!25256 (h!26465 tuple2!18518) (t!36723 List!25260)) )
))
(declare-datatypes ((ListLongMap!16487 0))(
  ( (ListLongMap!16488 (toList!8259 List!25260)) )
))
(declare-fun lt!519296 () ListLongMap!16487)

(declare-fun e!657795 () Bool)

(declare-fun minValue!944 () V!43795)

(declare-datatypes ((ValueCell!13791 0))(
  ( (ValueCellFull!13791 (v!17194 V!43795)) (EmptyCell!13791) )
))
(declare-datatypes ((array!74849 0))(
  ( (array!74850 (arr!36075 (Array (_ BitVec 32) ValueCell!13791)) (size!36611 (_ BitVec 32))) )
))
(declare-fun lt!519288 () array!74849)

(declare-fun zeroValue!944 () V!43795)

(declare-fun getCurrentListMapNoExtraKeys!4727 (array!74847 array!74849 (_ BitVec 32) (_ BitVec 32) V!43795 V!43795 (_ BitVec 32) Int) ListLongMap!16487)

(assert (=> b!1156678 (= e!657795 (= lt!519296 (getCurrentListMapNoExtraKeys!4727 lt!519281 lt!519288 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156679 () Bool)

(declare-fun res!768272 () Bool)

(declare-fun e!657801 () Bool)

(assert (=> b!1156679 (=> (not res!768272) (not e!657801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156679 (= res!768272 (validMask!0 mask!1564))))

(declare-fun b!1156680 () Bool)

(declare-fun e!657805 () Bool)

(declare-fun e!657802 () Bool)

(assert (=> b!1156680 (= e!657805 e!657802)))

(declare-fun res!768270 () Bool)

(assert (=> b!1156680 (=> res!768270 e!657802)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156680 (= res!768270 (not (= from!1455 i!673)))))

(declare-fun lt!519291 () ListLongMap!16487)

(assert (=> b!1156680 (= lt!519291 (getCurrentListMapNoExtraKeys!4727 lt!519281 lt!519288 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519285 () V!43795)

(declare-fun _values!996 () array!74849)

(assert (=> b!1156680 (= lt!519288 (array!74850 (store (arr!36075 _values!996) i!673 (ValueCellFull!13791 lt!519285)) (size!36611 _values!996)))))

(declare-fun dynLambda!2735 (Int (_ BitVec 64)) V!43795)

(assert (=> b!1156680 (= lt!519285 (dynLambda!2735 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74847)

(declare-fun lt!519276 () ListLongMap!16487)

(assert (=> b!1156680 (= lt!519276 (getCurrentListMapNoExtraKeys!4727 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55191 () Bool)

(declare-fun call!55200 () Bool)

(declare-fun call!55199 () Bool)

(assert (=> bm!55191 (= call!55200 call!55199)))

(declare-fun bm!55192 () Bool)

(declare-datatypes ((Unit!38098 0))(
  ( (Unit!38099) )
))
(declare-fun call!55197 () Unit!38098)

(declare-fun call!55194 () Unit!38098)

(assert (=> bm!55192 (= call!55197 call!55194)))

(declare-fun bm!55193 () Bool)

(declare-fun c!115098 () Bool)

(declare-fun lt!519280 () ListLongMap!16487)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!55196 () ListLongMap!16487)

(declare-fun contains!6771 (ListLongMap!16487 (_ BitVec 64)) Bool)

(assert (=> bm!55193 (= call!55199 (contains!6771 (ite c!115098 lt!519280 call!55196) k0!934))))

(declare-fun b!1156682 () Bool)

(declare-fun res!768274 () Bool)

(assert (=> b!1156682 (=> (not res!768274) (not e!657801))))

(assert (=> b!1156682 (= res!768274 (and (= (size!36611 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36610 _keys!1208) (size!36611 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156683 () Bool)

(declare-fun e!657794 () Bool)

(assert (=> b!1156683 (= e!657801 e!657794)))

(declare-fun res!768265 () Bool)

(assert (=> b!1156683 (=> (not res!768265) (not e!657794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74847 (_ BitVec 32)) Bool)

(assert (=> b!1156683 (= res!768265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519281 mask!1564))))

(assert (=> b!1156683 (= lt!519281 (array!74848 (store (arr!36074 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36610 _keys!1208)))))

(declare-fun b!1156684 () Bool)

(declare-fun res!768276 () Bool)

(assert (=> b!1156684 (=> (not res!768276) (not e!657801))))

(assert (=> b!1156684 (= res!768276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!55201 () ListLongMap!16487)

(declare-fun bm!55194 () Bool)

(assert (=> bm!55194 (= call!55201 (getCurrentListMapNoExtraKeys!4727 lt!519281 lt!519288 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!657804 () Bool)

(declare-fun b!1156685 () Bool)

(declare-fun call!55195 () ListLongMap!16487)

(declare-fun -!1375 (ListLongMap!16487 (_ BitVec 64)) ListLongMap!16487)

(assert (=> b!1156685 (= e!657804 (= call!55201 (-!1375 call!55195 k0!934)))))

(declare-fun b!1156686 () Bool)

(assert (=> b!1156686 (= e!657804 (= call!55201 call!55195))))

(declare-fun b!1156687 () Bool)

(declare-fun e!657800 () Bool)

(assert (=> b!1156687 (= e!657800 true)))

(assert (=> b!1156687 e!657795))

(declare-fun res!768275 () Bool)

(assert (=> b!1156687 (=> (not res!768275) (not e!657795))))

(declare-fun lt!519293 () ListLongMap!16487)

(assert (=> b!1156687 (= res!768275 (= lt!519296 lt!519293))))

(assert (=> b!1156687 (= lt!519296 (-!1375 lt!519276 k0!934))))

(declare-fun lt!519277 () V!43795)

(declare-fun +!3672 (ListLongMap!16487 tuple2!18518) ListLongMap!16487)

(assert (=> b!1156687 (= (-!1375 (+!3672 lt!519293 (tuple2!18519 (select (arr!36074 _keys!1208) from!1455) lt!519277)) (select (arr!36074 _keys!1208) from!1455)) lt!519293)))

(declare-fun lt!519282 () Unit!38098)

(declare-fun addThenRemoveForNewKeyIsSame!214 (ListLongMap!16487 (_ BitVec 64) V!43795) Unit!38098)

(assert (=> b!1156687 (= lt!519282 (addThenRemoveForNewKeyIsSame!214 lt!519293 (select (arr!36074 _keys!1208) from!1455) lt!519277))))

(declare-fun get!18384 (ValueCell!13791 V!43795) V!43795)

(assert (=> b!1156687 (= lt!519277 (get!18384 (select (arr!36075 _values!996) from!1455) lt!519285))))

(declare-fun lt!519290 () Unit!38098)

(declare-fun e!657797 () Unit!38098)

(assert (=> b!1156687 (= lt!519290 e!657797)))

(declare-fun c!115102 () Bool)

(assert (=> b!1156687 (= c!115102 (contains!6771 lt!519293 k0!934))))

(assert (=> b!1156687 (= lt!519293 (getCurrentListMapNoExtraKeys!4727 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!768277 () Bool)

(assert (=> start!98866 (=> (not res!768277) (not e!657801))))

(assert (=> start!98866 (= res!768277 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36610 _keys!1208))))))

(assert (=> start!98866 e!657801))

(declare-fun tp_is_empty!29001 () Bool)

(assert (=> start!98866 tp_is_empty!29001))

(declare-fun array_inv!27608 (array!74847) Bool)

(assert (=> start!98866 (array_inv!27608 _keys!1208)))

(assert (=> start!98866 true))

(assert (=> start!98866 tp!86123))

(declare-fun e!657806 () Bool)

(declare-fun array_inv!27609 (array!74849) Bool)

(assert (=> start!98866 (and (array_inv!27609 _values!996) e!657806)))

(declare-fun b!1156681 () Bool)

(declare-fun e!657798 () Unit!38098)

(declare-fun Unit!38100 () Unit!38098)

(assert (=> b!1156681 (= e!657798 Unit!38100)))

(declare-fun b!1156688 () Bool)

(assert (=> b!1156688 (= e!657802 e!657800)))

(declare-fun res!768271 () Bool)

(assert (=> b!1156688 (=> res!768271 e!657800)))

(assert (=> b!1156688 (= res!768271 (not (= (select (arr!36074 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156688 e!657804))

(declare-fun c!115099 () Bool)

(assert (=> b!1156688 (= c!115099 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519284 () Unit!38098)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!607 (array!74847 array!74849 (_ BitVec 32) (_ BitVec 32) V!43795 V!43795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38098)

(assert (=> b!1156688 (= lt!519284 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156689 () Bool)

(declare-fun e!657807 () Unit!38098)

(assert (=> b!1156689 (= e!657807 e!657798)))

(declare-fun c!115101 () Bool)

(declare-fun lt!519278 () Bool)

(assert (=> b!1156689 (= c!115101 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519278))))

(declare-fun e!657809 () Bool)

(declare-fun b!1156690 () Bool)

(declare-fun arrayContainsKey!0 (array!74847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156690 (= e!657809 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156691 () Bool)

(declare-fun res!768267 () Bool)

(assert (=> b!1156691 (=> (not res!768267) (not e!657801))))

(assert (=> b!1156691 (= res!768267 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36610 _keys!1208))))))

(declare-fun mapIsEmpty!45326 () Bool)

(declare-fun mapRes!45326 () Bool)

(assert (=> mapIsEmpty!45326 mapRes!45326))

(declare-fun b!1156692 () Bool)

(declare-fun e!657796 () Bool)

(assert (=> b!1156692 (= e!657806 (and e!657796 mapRes!45326))))

(declare-fun condMapEmpty!45326 () Bool)

(declare-fun mapDefault!45326 () ValueCell!13791)

(assert (=> b!1156692 (= condMapEmpty!45326 (= (arr!36075 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13791)) mapDefault!45326)))))

(declare-fun b!1156693 () Bool)

(declare-fun lt!519297 () Unit!38098)

(assert (=> b!1156693 (= e!657807 lt!519297)))

(assert (=> b!1156693 (= lt!519297 call!55197)))

(assert (=> b!1156693 call!55200))

(declare-fun b!1156694 () Bool)

(declare-fun res!768266 () Bool)

(assert (=> b!1156694 (=> (not res!768266) (not e!657801))))

(assert (=> b!1156694 (= res!768266 (= (select (arr!36074 _keys!1208) i!673) k0!934))))

(declare-fun b!1156695 () Bool)

(assert (=> b!1156695 (= e!657794 (not e!657805))))

(declare-fun res!768264 () Bool)

(assert (=> b!1156695 (=> res!768264 e!657805)))

(assert (=> b!1156695 (= res!768264 (bvsgt from!1455 i!673))))

(assert (=> b!1156695 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519294 () Unit!38098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74847 (_ BitVec 64) (_ BitVec 32)) Unit!38098)

(assert (=> b!1156695 (= lt!519294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156696 () Bool)

(assert (=> b!1156696 (= e!657796 tp_is_empty!29001)))

(declare-fun b!1156697 () Bool)

(declare-fun c!115097 () Bool)

(assert (=> b!1156697 (= c!115097 (and (not lt!519278) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657810 () Unit!38098)

(assert (=> b!1156697 (= e!657810 e!657807)))

(declare-fun b!1156698 () Bool)

(declare-fun call!55198 () ListLongMap!16487)

(assert (=> b!1156698 (contains!6771 call!55198 k0!934)))

(declare-fun lt!519286 () Unit!38098)

(assert (=> b!1156698 (= lt!519286 call!55194)))

(assert (=> b!1156698 call!55199))

(assert (=> b!1156698 (= lt!519280 (+!3672 lt!519293 (tuple2!18519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519292 () Unit!38098)

(declare-fun addStillContains!914 (ListLongMap!16487 (_ BitVec 64) V!43795 (_ BitVec 64)) Unit!38098)

(assert (=> b!1156698 (= lt!519292 (addStillContains!914 lt!519293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1156698 (= e!657810 lt!519286)))

(declare-fun b!1156699 () Bool)

(declare-fun Unit!38101 () Unit!38098)

(assert (=> b!1156699 (= e!657797 Unit!38101)))

(assert (=> b!1156699 (= lt!519278 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156699 (= c!115098 (and (not lt!519278) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519295 () Unit!38098)

(assert (=> b!1156699 (= lt!519295 e!657810)))

(declare-fun lt!519283 () Unit!38098)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!502 (array!74847 array!74849 (_ BitVec 32) (_ BitVec 32) V!43795 V!43795 (_ BitVec 64) (_ BitVec 32) Int) Unit!38098)

(assert (=> b!1156699 (= lt!519283 (lemmaListMapContainsThenArrayContainsFrom!502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115100 () Bool)

(assert (=> b!1156699 (= c!115100 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768268 () Bool)

(assert (=> b!1156699 (= res!768268 e!657809)))

(declare-fun e!657803 () Bool)

(assert (=> b!1156699 (=> (not res!768268) (not e!657803))))

(assert (=> b!1156699 e!657803))

(declare-fun lt!519287 () Unit!38098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74847 (_ BitVec 32) (_ BitVec 32)) Unit!38098)

(assert (=> b!1156699 (= lt!519287 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25261 0))(
  ( (Nil!25258) (Cons!25257 (h!26466 (_ BitVec 64)) (t!36724 List!25261)) )
))
(declare-fun arrayNoDuplicates!0 (array!74847 (_ BitVec 32) List!25261) Bool)

(assert (=> b!1156699 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25258)))

(declare-fun lt!519289 () Unit!38098)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74847 (_ BitVec 64) (_ BitVec 32) List!25261) Unit!38098)

(assert (=> b!1156699 (= lt!519289 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25258))))

(assert (=> b!1156699 false))

(declare-fun b!1156700 () Bool)

(declare-fun e!657808 () Bool)

(assert (=> b!1156700 (= e!657808 tp_is_empty!29001)))

(declare-fun b!1156701 () Bool)

(declare-fun res!768269 () Bool)

(assert (=> b!1156701 (=> (not res!768269) (not e!657801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156701 (= res!768269 (validKeyInArray!0 k0!934))))

(declare-fun b!1156702 () Bool)

(declare-fun res!768278 () Bool)

(assert (=> b!1156702 (=> (not res!768278) (not e!657794))))

(assert (=> b!1156702 (= res!768278 (arrayNoDuplicates!0 lt!519281 #b00000000000000000000000000000000 Nil!25258))))

(declare-fun b!1156703 () Bool)

(assert (=> b!1156703 call!55200))

(declare-fun lt!519279 () Unit!38098)

(assert (=> b!1156703 (= lt!519279 call!55197)))

(assert (=> b!1156703 (= e!657798 lt!519279)))

(declare-fun mapNonEmpty!45326 () Bool)

(declare-fun tp!86124 () Bool)

(assert (=> mapNonEmpty!45326 (= mapRes!45326 (and tp!86124 e!657808))))

(declare-fun mapRest!45326 () (Array (_ BitVec 32) ValueCell!13791))

(declare-fun mapValue!45326 () ValueCell!13791)

(declare-fun mapKey!45326 () (_ BitVec 32))

(assert (=> mapNonEmpty!45326 (= (arr!36075 _values!996) (store mapRest!45326 mapKey!45326 mapValue!45326))))

(declare-fun bm!55195 () Bool)

(assert (=> bm!55195 (= call!55198 (+!3672 (ite c!115098 lt!519280 lt!519293) (ite c!115098 (tuple2!18519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115097 (tuple2!18519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1156704 () Bool)

(assert (=> b!1156704 (= e!657803 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156705 () Bool)

(declare-fun res!768273 () Bool)

(assert (=> b!1156705 (=> (not res!768273) (not e!657801))))

(assert (=> b!1156705 (= res!768273 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25258))))

(declare-fun b!1156706 () Bool)

(assert (=> b!1156706 (= e!657809 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519278) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156707 () Bool)

(declare-fun Unit!38102 () Unit!38098)

(assert (=> b!1156707 (= e!657797 Unit!38102)))

(declare-fun bm!55196 () Bool)

(assert (=> bm!55196 (= call!55195 (getCurrentListMapNoExtraKeys!4727 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55197 () Bool)

(assert (=> bm!55197 (= call!55196 call!55198)))

(declare-fun bm!55198 () Bool)

(assert (=> bm!55198 (= call!55194 (addStillContains!914 (ite c!115098 lt!519280 lt!519293) (ite c!115098 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115097 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115098 minValue!944 (ite c!115097 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!98866 res!768277) b!1156679))

(assert (= (and b!1156679 res!768272) b!1156682))

(assert (= (and b!1156682 res!768274) b!1156684))

(assert (= (and b!1156684 res!768276) b!1156705))

(assert (= (and b!1156705 res!768273) b!1156691))

(assert (= (and b!1156691 res!768267) b!1156701))

(assert (= (and b!1156701 res!768269) b!1156694))

(assert (= (and b!1156694 res!768266) b!1156683))

(assert (= (and b!1156683 res!768265) b!1156702))

(assert (= (and b!1156702 res!768278) b!1156695))

(assert (= (and b!1156695 (not res!768264)) b!1156680))

(assert (= (and b!1156680 (not res!768270)) b!1156688))

(assert (= (and b!1156688 c!115099) b!1156685))

(assert (= (and b!1156688 (not c!115099)) b!1156686))

(assert (= (or b!1156685 b!1156686) bm!55194))

(assert (= (or b!1156685 b!1156686) bm!55196))

(assert (= (and b!1156688 (not res!768271)) b!1156687))

(assert (= (and b!1156687 c!115102) b!1156699))

(assert (= (and b!1156687 (not c!115102)) b!1156707))

(assert (= (and b!1156699 c!115098) b!1156698))

(assert (= (and b!1156699 (not c!115098)) b!1156697))

(assert (= (and b!1156697 c!115097) b!1156693))

(assert (= (and b!1156697 (not c!115097)) b!1156689))

(assert (= (and b!1156689 c!115101) b!1156703))

(assert (= (and b!1156689 (not c!115101)) b!1156681))

(assert (= (or b!1156693 b!1156703) bm!55192))

(assert (= (or b!1156693 b!1156703) bm!55197))

(assert (= (or b!1156693 b!1156703) bm!55191))

(assert (= (or b!1156698 bm!55191) bm!55193))

(assert (= (or b!1156698 bm!55192) bm!55198))

(assert (= (or b!1156698 bm!55197) bm!55195))

(assert (= (and b!1156699 c!115100) b!1156690))

(assert (= (and b!1156699 (not c!115100)) b!1156706))

(assert (= (and b!1156699 res!768268) b!1156704))

(assert (= (and b!1156687 res!768275) b!1156678))

(assert (= (and b!1156692 condMapEmpty!45326) mapIsEmpty!45326))

(assert (= (and b!1156692 (not condMapEmpty!45326)) mapNonEmpty!45326))

(get-info :version)

(assert (= (and mapNonEmpty!45326 ((_ is ValueCellFull!13791) mapValue!45326)) b!1156700))

(assert (= (and b!1156692 ((_ is ValueCellFull!13791) mapDefault!45326)) b!1156696))

(assert (= start!98866 b!1156692))

(declare-fun b_lambda!19577 () Bool)

(assert (=> (not b_lambda!19577) (not b!1156680)))

(declare-fun t!36722 () Bool)

(declare-fun tb!9283 () Bool)

(assert (=> (and start!98866 (= defaultEntry!1004 defaultEntry!1004) t!36722) tb!9283))

(declare-fun result!19131 () Bool)

(assert (=> tb!9283 (= result!19131 tp_is_empty!29001)))

(assert (=> b!1156680 t!36722))

(declare-fun b_and!39793 () Bool)

(assert (= b_and!39791 (and (=> t!36722 result!19131) b_and!39793)))

(declare-fun m!1066109 () Bool)

(assert (=> b!1156698 m!1066109))

(declare-fun m!1066111 () Bool)

(assert (=> b!1156698 m!1066111))

(declare-fun m!1066113 () Bool)

(assert (=> b!1156698 m!1066113))

(declare-fun m!1066115 () Bool)

(assert (=> mapNonEmpty!45326 m!1066115))

(declare-fun m!1066117 () Bool)

(assert (=> bm!55195 m!1066117))

(declare-fun m!1066119 () Bool)

(assert (=> start!98866 m!1066119))

(declare-fun m!1066121 () Bool)

(assert (=> start!98866 m!1066121))

(declare-fun m!1066123 () Bool)

(assert (=> b!1156685 m!1066123))

(declare-fun m!1066125 () Bool)

(assert (=> b!1156688 m!1066125))

(declare-fun m!1066127 () Bool)

(assert (=> b!1156688 m!1066127))

(declare-fun m!1066129 () Bool)

(assert (=> b!1156702 m!1066129))

(declare-fun m!1066131 () Bool)

(assert (=> b!1156687 m!1066131))

(declare-fun m!1066133 () Bool)

(assert (=> b!1156687 m!1066133))

(declare-fun m!1066135 () Bool)

(assert (=> b!1156687 m!1066135))

(assert (=> b!1156687 m!1066133))

(assert (=> b!1156687 m!1066125))

(declare-fun m!1066137 () Bool)

(assert (=> b!1156687 m!1066137))

(assert (=> b!1156687 m!1066125))

(declare-fun m!1066139 () Bool)

(assert (=> b!1156687 m!1066139))

(declare-fun m!1066141 () Bool)

(assert (=> b!1156687 m!1066141))

(declare-fun m!1066143 () Bool)

(assert (=> b!1156687 m!1066143))

(assert (=> b!1156687 m!1066135))

(declare-fun m!1066145 () Bool)

(assert (=> b!1156687 m!1066145))

(assert (=> b!1156687 m!1066125))

(declare-fun m!1066147 () Bool)

(assert (=> bm!55194 m!1066147))

(declare-fun m!1066149 () Bool)

(assert (=> b!1156701 m!1066149))

(declare-fun m!1066151 () Bool)

(assert (=> b!1156705 m!1066151))

(declare-fun m!1066153 () Bool)

(assert (=> bm!55198 m!1066153))

(declare-fun m!1066155 () Bool)

(assert (=> b!1156679 m!1066155))

(declare-fun m!1066157 () Bool)

(assert (=> b!1156683 m!1066157))

(declare-fun m!1066159 () Bool)

(assert (=> b!1156683 m!1066159))

(declare-fun m!1066161 () Bool)

(assert (=> b!1156680 m!1066161))

(declare-fun m!1066163 () Bool)

(assert (=> b!1156680 m!1066163))

(declare-fun m!1066165 () Bool)

(assert (=> b!1156680 m!1066165))

(declare-fun m!1066167 () Bool)

(assert (=> b!1156680 m!1066167))

(declare-fun m!1066169 () Bool)

(assert (=> b!1156694 m!1066169))

(declare-fun m!1066171 () Bool)

(assert (=> bm!55193 m!1066171))

(assert (=> b!1156678 m!1066147))

(declare-fun m!1066173 () Bool)

(assert (=> b!1156704 m!1066173))

(declare-fun m!1066175 () Bool)

(assert (=> b!1156699 m!1066175))

(declare-fun m!1066177 () Bool)

(assert (=> b!1156699 m!1066177))

(declare-fun m!1066179 () Bool)

(assert (=> b!1156699 m!1066179))

(declare-fun m!1066181 () Bool)

(assert (=> b!1156699 m!1066181))

(assert (=> b!1156690 m!1066173))

(assert (=> bm!55196 m!1066131))

(declare-fun m!1066183 () Bool)

(assert (=> b!1156695 m!1066183))

(declare-fun m!1066185 () Bool)

(assert (=> b!1156695 m!1066185))

(declare-fun m!1066187 () Bool)

(assert (=> b!1156684 m!1066187))

(check-sat (not start!98866) (not b!1156690) (not b!1156705) (not b!1156684) (not b!1156680) (not mapNonEmpty!45326) (not bm!55196) (not b!1156702) b_and!39793 (not b!1156683) (not bm!55194) (not b!1156699) (not b!1156701) (not b!1156704) (not b!1156695) (not b!1156678) (not b!1156685) (not b!1156688) (not b!1156679) (not bm!55195) (not b_next!24471) (not b_lambda!19577) (not b!1156698) (not b!1156687) (not bm!55193) (not bm!55198) tp_is_empty!29001)
(check-sat b_and!39793 (not b_next!24471))
