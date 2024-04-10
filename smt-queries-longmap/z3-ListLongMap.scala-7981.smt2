; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98728 () Bool)

(assert start!98728)

(declare-fun b_free!24333 () Bool)

(declare-fun b_next!24333 () Bool)

(assert (=> start!98728 (= b_free!24333 (not b_next!24333))))

(declare-fun tp!85709 () Bool)

(declare-fun b_and!39515 () Bool)

(assert (=> start!98728 (= tp!85709 b_and!39515)))

(declare-fun b!1150330 () Bool)

(declare-fun res!765173 () Bool)

(declare-fun e!654277 () Bool)

(assert (=> b!1150330 (=> (not res!765173) (not e!654277))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74573 0))(
  ( (array!74574 (arr!35937 (Array (_ BitVec 32) (_ BitVec 64))) (size!36473 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74573)

(assert (=> b!1150330 (= res!765173 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36473 _keys!1208))))))

(declare-fun bm!53535 () Bool)

(declare-datatypes ((Unit!37826 0))(
  ( (Unit!37827) )
))
(declare-fun call!53541 () Unit!37826)

(declare-fun call!53545 () Unit!37826)

(assert (=> bm!53535 (= call!53541 call!53545)))

(declare-fun b!1150331 () Bool)

(declare-fun res!765170 () Bool)

(assert (=> b!1150331 (=> (not res!765170) (not e!654277))))

(declare-datatypes ((List!25137 0))(
  ( (Nil!25134) (Cons!25133 (h!26342 (_ BitVec 64)) (t!36462 List!25137)) )
))
(declare-fun arrayNoDuplicates!0 (array!74573 (_ BitVec 32) List!25137) Bool)

(assert (=> b!1150331 (= res!765170 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25134))))

(declare-fun b!1150332 () Bool)

(declare-fun e!654283 () Unit!37826)

(declare-fun e!654282 () Unit!37826)

(assert (=> b!1150332 (= e!654283 e!654282)))

(declare-fun c!113858 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!514740 () Bool)

(assert (=> b!1150332 (= c!113858 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514740))))

(declare-fun mapIsEmpty!45119 () Bool)

(declare-fun mapRes!45119 () Bool)

(assert (=> mapIsEmpty!45119 mapRes!45119))

(declare-fun b!1150333 () Bool)

(declare-fun e!654287 () Bool)

(assert (=> b!1150333 (= e!654277 e!654287)))

(declare-fun res!765169 () Bool)

(assert (=> b!1150333 (=> (not res!765169) (not e!654287))))

(declare-fun lt!514732 () array!74573)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74573 (_ BitVec 32)) Bool)

(assert (=> b!1150333 (= res!765169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514732 mask!1564))))

(assert (=> b!1150333 (= lt!514732 (array!74574 (store (arr!35937 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36473 _keys!1208)))))

(declare-fun e!654284 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1150334 () Bool)

(assert (=> b!1150334 (= e!654284 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514740) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150335 () Bool)

(declare-datatypes ((V!43611 0))(
  ( (V!43612 (val!14488 Int)) )
))
(declare-datatypes ((tuple2!18388 0))(
  ( (tuple2!18389 (_1!9205 (_ BitVec 64)) (_2!9205 V!43611)) )
))
(declare-datatypes ((List!25138 0))(
  ( (Nil!25135) (Cons!25134 (h!26343 tuple2!18388) (t!36463 List!25138)) )
))
(declare-datatypes ((ListLongMap!16357 0))(
  ( (ListLongMap!16358 (toList!8194 List!25138)) )
))
(declare-fun call!53542 () ListLongMap!16357)

(declare-fun contains!6715 (ListLongMap!16357 (_ BitVec 64)) Bool)

(assert (=> b!1150335 (contains!6715 call!53542 k0!934)))

(declare-fun lt!514727 () Unit!37826)

(assert (=> b!1150335 (= lt!514727 call!53545)))

(declare-fun call!53544 () Bool)

(assert (=> b!1150335 call!53544))

(declare-fun lt!514742 () ListLongMap!16357)

(declare-fun lt!514736 () ListLongMap!16357)

(declare-fun zeroValue!944 () V!43611)

(declare-fun +!3614 (ListLongMap!16357 tuple2!18388) ListLongMap!16357)

(assert (=> b!1150335 (= lt!514742 (+!3614 lt!514736 (tuple2!18389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514723 () Unit!37826)

(declare-fun addStillContains!864 (ListLongMap!16357 (_ BitVec 64) V!43611 (_ BitVec 64)) Unit!37826)

(assert (=> b!1150335 (= lt!514723 (addStillContains!864 lt!514736 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!654280 () Unit!37826)

(assert (=> b!1150335 (= e!654280 lt!514727)))

(declare-fun e!654288 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1150336 () Bool)

(declare-fun arrayContainsKey!0 (array!74573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150336 (= e!654288 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53536 () Bool)

(declare-fun call!53538 () ListLongMap!16357)

(declare-fun c!113855 () Bool)

(assert (=> bm!53536 (= call!53544 (contains!6715 (ite c!113855 lt!514742 call!53538) k0!934))))

(declare-fun c!113857 () Bool)

(declare-fun bm!53537 () Bool)

(declare-fun minValue!944 () V!43611)

(assert (=> bm!53537 (= call!53542 (+!3614 (ite c!113855 lt!514742 lt!514736) (ite c!113855 (tuple2!18389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113857 (tuple2!18389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150337 () Bool)

(declare-fun e!654285 () Bool)

(declare-fun e!654279 () Bool)

(assert (=> b!1150337 (= e!654285 e!654279)))

(declare-fun res!765166 () Bool)

(assert (=> b!1150337 (=> res!765166 e!654279)))

(assert (=> b!1150337 (= res!765166 (not (= (select (arr!35937 _keys!1208) from!1455) k0!934)))))

(declare-fun e!654275 () Bool)

(assert (=> b!1150337 e!654275))

(declare-fun c!113860 () Bool)

(assert (=> b!1150337 (= c!113860 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514741 () Unit!37826)

(declare-datatypes ((ValueCell!13722 0))(
  ( (ValueCellFull!13722 (v!17125 V!43611)) (EmptyCell!13722) )
))
(declare-datatypes ((array!74575 0))(
  ( (array!74576 (arr!35938 (Array (_ BitVec 32) ValueCell!13722)) (size!36474 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74575)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!564 (array!74573 array!74575 (_ BitVec 32) (_ BitVec 32) V!43611 V!43611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37826)

(assert (=> b!1150337 (= lt!514741 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53538 () Bool)

(declare-fun call!53543 () ListLongMap!16357)

(declare-fun getCurrentListMapNoExtraKeys!4666 (array!74573 array!74575 (_ BitVec 32) (_ BitVec 32) V!43611 V!43611 (_ BitVec 32) Int) ListLongMap!16357)

(assert (=> bm!53538 (= call!53543 (getCurrentListMapNoExtraKeys!4666 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150338 () Bool)

(declare-fun lt!514739 () Unit!37826)

(assert (=> b!1150338 (= e!654283 lt!514739)))

(assert (=> b!1150338 (= lt!514739 call!53541)))

(declare-fun call!53539 () Bool)

(assert (=> b!1150338 call!53539))

(declare-fun b!1150339 () Bool)

(assert (=> b!1150339 (= e!654279 true)))

(declare-fun e!654281 () Bool)

(assert (=> b!1150339 e!654281))

(declare-fun res!765168 () Bool)

(assert (=> b!1150339 (=> (not res!765168) (not e!654281))))

(declare-fun lt!514737 () ListLongMap!16357)

(assert (=> b!1150339 (= res!765168 (= lt!514737 lt!514736))))

(declare-fun lt!514722 () ListLongMap!16357)

(declare-fun -!1326 (ListLongMap!16357 (_ BitVec 64)) ListLongMap!16357)

(assert (=> b!1150339 (= lt!514737 (-!1326 lt!514722 k0!934))))

(declare-fun lt!514734 () V!43611)

(assert (=> b!1150339 (= (-!1326 (+!3614 lt!514736 (tuple2!18389 (select (arr!35937 _keys!1208) from!1455) lt!514734)) (select (arr!35937 _keys!1208) from!1455)) lt!514736)))

(declare-fun lt!514729 () Unit!37826)

(declare-fun addThenRemoveForNewKeyIsSame!170 (ListLongMap!16357 (_ BitVec 64) V!43611) Unit!37826)

(assert (=> b!1150339 (= lt!514729 (addThenRemoveForNewKeyIsSame!170 lt!514736 (select (arr!35937 _keys!1208) from!1455) lt!514734))))

(declare-fun lt!514738 () V!43611)

(declare-fun get!18294 (ValueCell!13722 V!43611) V!43611)

(assert (=> b!1150339 (= lt!514734 (get!18294 (select (arr!35938 _values!996) from!1455) lt!514738))))

(declare-fun lt!514728 () Unit!37826)

(declare-fun e!654276 () Unit!37826)

(assert (=> b!1150339 (= lt!514728 e!654276)))

(declare-fun c!113859 () Bool)

(assert (=> b!1150339 (= c!113859 (contains!6715 lt!514736 k0!934))))

(assert (=> b!1150339 (= lt!514736 (getCurrentListMapNoExtraKeys!4666 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150340 () Bool)

(declare-fun call!53540 () ListLongMap!16357)

(assert (=> b!1150340 (= e!654275 (= call!53540 call!53543))))

(declare-fun b!1150341 () Bool)

(assert (=> b!1150341 (= e!654284 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150342 () Bool)

(assert (=> b!1150342 call!53539))

(declare-fun lt!514743 () Unit!37826)

(assert (=> b!1150342 (= lt!514743 call!53541)))

(assert (=> b!1150342 (= e!654282 lt!514743)))

(declare-fun b!1150343 () Bool)

(declare-fun res!765167 () Bool)

(assert (=> b!1150343 (=> (not res!765167) (not e!654277))))

(assert (=> b!1150343 (= res!765167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150344 () Bool)

(declare-fun res!765164 () Bool)

(assert (=> b!1150344 (=> (not res!765164) (not e!654277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150344 (= res!765164 (validKeyInArray!0 k0!934))))

(declare-fun bm!53539 () Bool)

(assert (=> bm!53539 (= call!53545 (addStillContains!864 (ite c!113855 lt!514742 lt!514736) (ite c!113855 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113857 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113855 minValue!944 (ite c!113857 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!53540 () Bool)

(declare-fun lt!514726 () array!74575)

(assert (=> bm!53540 (= call!53540 (getCurrentListMapNoExtraKeys!4666 lt!514732 lt!514726 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150345 () Bool)

(assert (=> b!1150345 (= c!113857 (and (not lt!514740) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150345 (= e!654280 e!654283)))

(declare-fun b!1150346 () Bool)

(assert (=> b!1150346 (= e!654281 (= lt!514737 (getCurrentListMapNoExtraKeys!4666 lt!514732 lt!514726 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53541 () Bool)

(assert (=> bm!53541 (= call!53539 call!53544)))

(declare-fun b!1150347 () Bool)

(declare-fun res!765160 () Bool)

(assert (=> b!1150347 (=> (not res!765160) (not e!654277))))

(assert (=> b!1150347 (= res!765160 (and (= (size!36474 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36473 _keys!1208) (size!36474 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150348 () Bool)

(declare-fun Unit!37828 () Unit!37826)

(assert (=> b!1150348 (= e!654276 Unit!37828)))

(declare-fun bm!53542 () Bool)

(assert (=> bm!53542 (= call!53538 call!53542)))

(declare-fun b!1150349 () Bool)

(declare-fun e!654278 () Bool)

(declare-fun tp_is_empty!28863 () Bool)

(assert (=> b!1150349 (= e!654278 tp_is_empty!28863)))

(declare-fun mapNonEmpty!45119 () Bool)

(declare-fun tp!85710 () Bool)

(declare-fun e!654286 () Bool)

(assert (=> mapNonEmpty!45119 (= mapRes!45119 (and tp!85710 e!654286))))

(declare-fun mapValue!45119 () ValueCell!13722)

(declare-fun mapKey!45119 () (_ BitVec 32))

(declare-fun mapRest!45119 () (Array (_ BitVec 32) ValueCell!13722))

(assert (=> mapNonEmpty!45119 (= (arr!35938 _values!996) (store mapRest!45119 mapKey!45119 mapValue!45119))))

(declare-fun b!1150350 () Bool)

(declare-fun e!654291 () Bool)

(assert (=> b!1150350 (= e!654291 e!654285)))

(declare-fun res!765162 () Bool)

(assert (=> b!1150350 (=> res!765162 e!654285)))

(assert (=> b!1150350 (= res!765162 (not (= from!1455 i!673)))))

(declare-fun lt!514730 () ListLongMap!16357)

(assert (=> b!1150350 (= lt!514730 (getCurrentListMapNoExtraKeys!4666 lt!514732 lt!514726 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150350 (= lt!514726 (array!74576 (store (arr!35938 _values!996) i!673 (ValueCellFull!13722 lt!514738)) (size!36474 _values!996)))))

(declare-fun dynLambda!2690 (Int (_ BitVec 64)) V!43611)

(assert (=> b!1150350 (= lt!514738 (dynLambda!2690 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150350 (= lt!514722 (getCurrentListMapNoExtraKeys!4666 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150351 () Bool)

(declare-fun Unit!37829 () Unit!37826)

(assert (=> b!1150351 (= e!654282 Unit!37829)))

(declare-fun b!1150352 () Bool)

(assert (=> b!1150352 (= e!654275 (= call!53540 (-!1326 call!53543 k0!934)))))

(declare-fun b!1150353 () Bool)

(declare-fun res!765171 () Bool)

(assert (=> b!1150353 (=> (not res!765171) (not e!654287))))

(assert (=> b!1150353 (= res!765171 (arrayNoDuplicates!0 lt!514732 #b00000000000000000000000000000000 Nil!25134))))

(declare-fun b!1150354 () Bool)

(declare-fun res!765165 () Bool)

(assert (=> b!1150354 (=> (not res!765165) (not e!654277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150354 (= res!765165 (validMask!0 mask!1564))))

(declare-fun b!1150355 () Bool)

(declare-fun e!654290 () Bool)

(assert (=> b!1150355 (= e!654290 (and e!654278 mapRes!45119))))

(declare-fun condMapEmpty!45119 () Bool)

(declare-fun mapDefault!45119 () ValueCell!13722)

(assert (=> b!1150355 (= condMapEmpty!45119 (= (arr!35938 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13722)) mapDefault!45119)))))

(declare-fun b!1150356 () Bool)

(declare-fun Unit!37830 () Unit!37826)

(assert (=> b!1150356 (= e!654276 Unit!37830)))

(assert (=> b!1150356 (= lt!514740 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150356 (= c!113855 (and (not lt!514740) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514731 () Unit!37826)

(assert (=> b!1150356 (= lt!514731 e!654280)))

(declare-fun lt!514735 () Unit!37826)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!456 (array!74573 array!74575 (_ BitVec 32) (_ BitVec 32) V!43611 V!43611 (_ BitVec 64) (_ BitVec 32) Int) Unit!37826)

(assert (=> b!1150356 (= lt!514735 (lemmaListMapContainsThenArrayContainsFrom!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113856 () Bool)

(assert (=> b!1150356 (= c!113856 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765163 () Bool)

(assert (=> b!1150356 (= res!765163 e!654284)))

(assert (=> b!1150356 (=> (not res!765163) (not e!654288))))

(assert (=> b!1150356 e!654288))

(declare-fun lt!514724 () Unit!37826)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74573 (_ BitVec 32) (_ BitVec 32)) Unit!37826)

(assert (=> b!1150356 (= lt!514724 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150356 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25134)))

(declare-fun lt!514725 () Unit!37826)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74573 (_ BitVec 64) (_ BitVec 32) List!25137) Unit!37826)

(assert (=> b!1150356 (= lt!514725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25134))))

(assert (=> b!1150356 false))

(declare-fun b!1150357 () Bool)

(assert (=> b!1150357 (= e!654286 tp_is_empty!28863)))

(declare-fun res!765172 () Bool)

(assert (=> start!98728 (=> (not res!765172) (not e!654277))))

(assert (=> start!98728 (= res!765172 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36473 _keys!1208))))))

(assert (=> start!98728 e!654277))

(assert (=> start!98728 tp_is_empty!28863))

(declare-fun array_inv!27524 (array!74573) Bool)

(assert (=> start!98728 (array_inv!27524 _keys!1208)))

(assert (=> start!98728 true))

(assert (=> start!98728 tp!85709))

(declare-fun array_inv!27525 (array!74575) Bool)

(assert (=> start!98728 (and (array_inv!27525 _values!996) e!654290)))

(declare-fun b!1150358 () Bool)

(assert (=> b!1150358 (= e!654287 (not e!654291))))

(declare-fun res!765161 () Bool)

(assert (=> b!1150358 (=> res!765161 e!654291)))

(assert (=> b!1150358 (= res!765161 (bvsgt from!1455 i!673))))

(assert (=> b!1150358 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514733 () Unit!37826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74573 (_ BitVec 64) (_ BitVec 32)) Unit!37826)

(assert (=> b!1150358 (= lt!514733 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150359 () Bool)

(declare-fun res!765159 () Bool)

(assert (=> b!1150359 (=> (not res!765159) (not e!654277))))

(assert (=> b!1150359 (= res!765159 (= (select (arr!35937 _keys!1208) i!673) k0!934))))

(assert (= (and start!98728 res!765172) b!1150354))

(assert (= (and b!1150354 res!765165) b!1150347))

(assert (= (and b!1150347 res!765160) b!1150343))

(assert (= (and b!1150343 res!765167) b!1150331))

(assert (= (and b!1150331 res!765170) b!1150330))

(assert (= (and b!1150330 res!765173) b!1150344))

(assert (= (and b!1150344 res!765164) b!1150359))

(assert (= (and b!1150359 res!765159) b!1150333))

(assert (= (and b!1150333 res!765169) b!1150353))

(assert (= (and b!1150353 res!765171) b!1150358))

(assert (= (and b!1150358 (not res!765161)) b!1150350))

(assert (= (and b!1150350 (not res!765162)) b!1150337))

(assert (= (and b!1150337 c!113860) b!1150352))

(assert (= (and b!1150337 (not c!113860)) b!1150340))

(assert (= (or b!1150352 b!1150340) bm!53540))

(assert (= (or b!1150352 b!1150340) bm!53538))

(assert (= (and b!1150337 (not res!765166)) b!1150339))

(assert (= (and b!1150339 c!113859) b!1150356))

(assert (= (and b!1150339 (not c!113859)) b!1150348))

(assert (= (and b!1150356 c!113855) b!1150335))

(assert (= (and b!1150356 (not c!113855)) b!1150345))

(assert (= (and b!1150345 c!113857) b!1150338))

(assert (= (and b!1150345 (not c!113857)) b!1150332))

(assert (= (and b!1150332 c!113858) b!1150342))

(assert (= (and b!1150332 (not c!113858)) b!1150351))

(assert (= (or b!1150338 b!1150342) bm!53535))

(assert (= (or b!1150338 b!1150342) bm!53542))

(assert (= (or b!1150338 b!1150342) bm!53541))

(assert (= (or b!1150335 bm!53541) bm!53536))

(assert (= (or b!1150335 bm!53535) bm!53539))

(assert (= (or b!1150335 bm!53542) bm!53537))

(assert (= (and b!1150356 c!113856) b!1150341))

(assert (= (and b!1150356 (not c!113856)) b!1150334))

(assert (= (and b!1150356 res!765163) b!1150336))

(assert (= (and b!1150339 res!765168) b!1150346))

(assert (= (and b!1150355 condMapEmpty!45119) mapIsEmpty!45119))

(assert (= (and b!1150355 (not condMapEmpty!45119)) mapNonEmpty!45119))

(get-info :version)

(assert (= (and mapNonEmpty!45119 ((_ is ValueCellFull!13722) mapValue!45119)) b!1150357))

(assert (= (and b!1150355 ((_ is ValueCellFull!13722) mapDefault!45119)) b!1150349))

(assert (= start!98728 b!1150355))

(declare-fun b_lambda!19439 () Bool)

(assert (=> (not b_lambda!19439) (not b!1150350)))

(declare-fun t!36461 () Bool)

(declare-fun tb!9145 () Bool)

(assert (=> (and start!98728 (= defaultEntry!1004 defaultEntry!1004) t!36461) tb!9145))

(declare-fun result!18855 () Bool)

(assert (=> tb!9145 (= result!18855 tp_is_empty!28863)))

(assert (=> b!1150350 t!36461))

(declare-fun b_and!39517 () Bool)

(assert (= b_and!39515 (and (=> t!36461 result!18855) b_and!39517)))

(declare-fun m!1060581 () Bool)

(assert (=> bm!53540 m!1060581))

(declare-fun m!1060583 () Bool)

(assert (=> b!1150343 m!1060583))

(declare-fun m!1060585 () Bool)

(assert (=> b!1150335 m!1060585))

(declare-fun m!1060587 () Bool)

(assert (=> b!1150335 m!1060587))

(declare-fun m!1060589 () Bool)

(assert (=> b!1150335 m!1060589))

(declare-fun m!1060591 () Bool)

(assert (=> b!1150333 m!1060591))

(declare-fun m!1060593 () Bool)

(assert (=> b!1150333 m!1060593))

(declare-fun m!1060595 () Bool)

(assert (=> b!1150359 m!1060595))

(declare-fun m!1060597 () Bool)

(assert (=> bm!53536 m!1060597))

(declare-fun m!1060599 () Bool)

(assert (=> start!98728 m!1060599))

(declare-fun m!1060601 () Bool)

(assert (=> start!98728 m!1060601))

(assert (=> b!1150346 m!1060581))

(declare-fun m!1060603 () Bool)

(assert (=> b!1150336 m!1060603))

(declare-fun m!1060605 () Bool)

(assert (=> b!1150337 m!1060605))

(declare-fun m!1060607 () Bool)

(assert (=> b!1150337 m!1060607))

(declare-fun m!1060609 () Bool)

(assert (=> b!1150350 m!1060609))

(declare-fun m!1060611 () Bool)

(assert (=> b!1150350 m!1060611))

(declare-fun m!1060613 () Bool)

(assert (=> b!1150350 m!1060613))

(declare-fun m!1060615 () Bool)

(assert (=> b!1150350 m!1060615))

(declare-fun m!1060617 () Bool)

(assert (=> b!1150339 m!1060617))

(assert (=> b!1150339 m!1060605))

(declare-fun m!1060619 () Bool)

(assert (=> b!1150339 m!1060619))

(assert (=> b!1150339 m!1060617))

(assert (=> b!1150339 m!1060605))

(declare-fun m!1060621 () Bool)

(assert (=> b!1150339 m!1060621))

(declare-fun m!1060623 () Bool)

(assert (=> b!1150339 m!1060623))

(assert (=> b!1150339 m!1060605))

(declare-fun m!1060625 () Bool)

(assert (=> b!1150339 m!1060625))

(declare-fun m!1060627 () Bool)

(assert (=> b!1150339 m!1060627))

(declare-fun m!1060629 () Bool)

(assert (=> b!1150339 m!1060629))

(assert (=> b!1150339 m!1060629))

(declare-fun m!1060631 () Bool)

(assert (=> b!1150339 m!1060631))

(declare-fun m!1060633 () Bool)

(assert (=> b!1150331 m!1060633))

(declare-fun m!1060635 () Bool)

(assert (=> b!1150352 m!1060635))

(declare-fun m!1060637 () Bool)

(assert (=> b!1150358 m!1060637))

(declare-fun m!1060639 () Bool)

(assert (=> b!1150358 m!1060639))

(assert (=> b!1150341 m!1060603))

(declare-fun m!1060641 () Bool)

(assert (=> bm!53539 m!1060641))

(assert (=> bm!53538 m!1060627))

(declare-fun m!1060643 () Bool)

(assert (=> b!1150354 m!1060643))

(declare-fun m!1060645 () Bool)

(assert (=> b!1150356 m!1060645))

(declare-fun m!1060647 () Bool)

(assert (=> b!1150356 m!1060647))

(declare-fun m!1060649 () Bool)

(assert (=> b!1150356 m!1060649))

(declare-fun m!1060651 () Bool)

(assert (=> b!1150356 m!1060651))

(declare-fun m!1060653 () Bool)

(assert (=> bm!53537 m!1060653))

(declare-fun m!1060655 () Bool)

(assert (=> b!1150344 m!1060655))

(declare-fun m!1060657 () Bool)

(assert (=> b!1150353 m!1060657))

(declare-fun m!1060659 () Bool)

(assert (=> mapNonEmpty!45119 m!1060659))

(check-sat (not bm!53538) (not bm!53537) b_and!39517 (not b!1150356) (not b!1150352) (not b!1150341) (not b!1150354) (not mapNonEmpty!45119) (not b!1150331) (not b!1150335) (not b!1150336) (not b!1150353) tp_is_empty!28863 (not bm!53540) (not b!1150339) (not start!98728) (not b!1150346) (not b!1150358) (not b_lambda!19439) (not b_next!24333) (not bm!53539) (not bm!53536) (not b!1150343) (not b!1150333) (not b!1150344) (not b!1150337) (not b!1150350))
(check-sat b_and!39517 (not b_next!24333))
