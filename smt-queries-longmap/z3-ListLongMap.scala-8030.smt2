; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99014 () Bool)

(assert start!99014)

(declare-fun b_free!24625 () Bool)

(declare-fun b_next!24625 () Bool)

(assert (=> start!99014 (= b_free!24625 (not b_next!24625))))

(declare-fun tp!86586 () Bool)

(declare-fun b_and!40077 () Bool)

(assert (=> start!99014 (= tp!86586 b_and!40077)))

(declare-fun b!1163638 () Bool)

(declare-fun call!57021 () Bool)

(assert (=> b!1163638 call!57021))

(declare-datatypes ((Unit!38239 0))(
  ( (Unit!38240) )
))
(declare-fun lt!524177 () Unit!38239)

(declare-fun call!57026 () Unit!38239)

(assert (=> b!1163638 (= lt!524177 call!57026)))

(declare-fun e!661644 () Unit!38239)

(assert (=> b!1163638 (= e!661644 lt!524177)))

(declare-fun b!1163639 () Bool)

(declare-fun e!661650 () Unit!38239)

(declare-fun Unit!38241 () Unit!38239)

(assert (=> b!1163639 (= e!661650 Unit!38241)))

(declare-fun lt!524168 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1163639 (= lt!524168 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116460 () Bool)

(assert (=> b!1163639 (= c!116460 (and (not lt!524168) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524182 () Unit!38239)

(declare-fun e!661646 () Unit!38239)

(assert (=> b!1163639 (= lt!524182 e!661646)))

(declare-datatypes ((array!75066 0))(
  ( (array!75067 (arr!36184 (Array (_ BitVec 32) (_ BitVec 64))) (size!36722 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75066)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!44001 0))(
  ( (V!44002 (val!14634 Int)) )
))
(declare-datatypes ((ValueCell!13868 0))(
  ( (ValueCellFull!13868 (v!17270 V!44001)) (EmptyCell!13868) )
))
(declare-datatypes ((array!75068 0))(
  ( (array!75069 (arr!36185 (Array (_ BitVec 32) ValueCell!13868)) (size!36723 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75068)

(declare-fun minValue!944 () V!44001)

(declare-fun zeroValue!944 () V!44001)

(declare-fun lt!524187 () Unit!38239)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!553 (array!75066 array!75068 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 64) (_ BitVec 32) Int) Unit!38239)

(assert (=> b!1163639 (= lt!524187 (lemmaListMapContainsThenArrayContainsFrom!553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116458 () Bool)

(assert (=> b!1163639 (= c!116458 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771675 () Bool)

(declare-fun e!661647 () Bool)

(assert (=> b!1163639 (= res!771675 e!661647)))

(declare-fun e!661659 () Bool)

(assert (=> b!1163639 (=> (not res!771675) (not e!661659))))

(assert (=> b!1163639 e!661659))

(declare-fun lt!524180 () Unit!38239)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75066 (_ BitVec 32) (_ BitVec 32)) Unit!38239)

(assert (=> b!1163639 (= lt!524180 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25462 0))(
  ( (Nil!25459) (Cons!25458 (h!26667 (_ BitVec 64)) (t!37070 List!25462)) )
))
(declare-fun arrayNoDuplicates!0 (array!75066 (_ BitVec 32) List!25462) Bool)

(assert (=> b!1163639 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25459)))

(declare-fun lt!524175 () Unit!38239)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75066 (_ BitVec 64) (_ BitVec 32) List!25462) Unit!38239)

(assert (=> b!1163639 (= lt!524175 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25459))))

(assert (=> b!1163639 false))

(declare-fun b!1163640 () Bool)

(assert (=> b!1163640 (= e!661647 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524168) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163641 () Bool)

(declare-fun res!771664 () Bool)

(declare-fun e!661658 () Bool)

(assert (=> b!1163641 (=> (not res!771664) (not e!661658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75066 (_ BitVec 32)) Bool)

(assert (=> b!1163641 (= res!771664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163642 () Bool)

(declare-fun e!661655 () Bool)

(declare-fun e!661652 () Bool)

(assert (=> b!1163642 (= e!661655 e!661652)))

(declare-fun res!771667 () Bool)

(assert (=> b!1163642 (=> res!771667 e!661652)))

(assert (=> b!1163642 (= res!771667 (not (= (select (arr!36184 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661651 () Bool)

(assert (=> b!1163642 e!661651))

(declare-fun c!116459 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163642 (= c!116459 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524176 () Unit!38239)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!681 (array!75066 array!75068 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38239)

(assert (=> b!1163642 (= lt!524176 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163643 () Bool)

(declare-fun arrayContainsKey!0 (array!75066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163643 (= e!661659 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163644 () Bool)

(assert (=> b!1163644 (= e!661652 true)))

(declare-fun e!661656 () Bool)

(assert (=> b!1163644 e!661656))

(declare-fun res!771676 () Bool)

(assert (=> b!1163644 (=> (not res!771676) (not e!661656))))

(declare-datatypes ((tuple2!18744 0))(
  ( (tuple2!18745 (_1!9383 (_ BitVec 64)) (_2!9383 V!44001)) )
))
(declare-datatypes ((List!25463 0))(
  ( (Nil!25460) (Cons!25459 (h!26668 tuple2!18744) (t!37071 List!25463)) )
))
(declare-datatypes ((ListLongMap!16713 0))(
  ( (ListLongMap!16714 (toList!8372 List!25463)) )
))
(declare-fun lt!524172 () ListLongMap!16713)

(declare-fun lt!524185 () ListLongMap!16713)

(assert (=> b!1163644 (= res!771676 (= lt!524172 lt!524185))))

(declare-fun lt!524170 () ListLongMap!16713)

(declare-fun -!1417 (ListLongMap!16713 (_ BitVec 64)) ListLongMap!16713)

(assert (=> b!1163644 (= lt!524172 (-!1417 lt!524170 k0!934))))

(declare-fun lt!524167 () V!44001)

(declare-fun +!3772 (ListLongMap!16713 tuple2!18744) ListLongMap!16713)

(assert (=> b!1163644 (= (-!1417 (+!3772 lt!524185 (tuple2!18745 (select (arr!36184 _keys!1208) from!1455) lt!524167)) (select (arr!36184 _keys!1208) from!1455)) lt!524185)))

(declare-fun lt!524184 () Unit!38239)

(declare-fun addThenRemoveForNewKeyIsSame!256 (ListLongMap!16713 (_ BitVec 64) V!44001) Unit!38239)

(assert (=> b!1163644 (= lt!524184 (addThenRemoveForNewKeyIsSame!256 lt!524185 (select (arr!36184 _keys!1208) from!1455) lt!524167))))

(declare-fun lt!524169 () V!44001)

(declare-fun get!18478 (ValueCell!13868 V!44001) V!44001)

(assert (=> b!1163644 (= lt!524167 (get!18478 (select (arr!36185 _values!996) from!1455) lt!524169))))

(declare-fun lt!524181 () Unit!38239)

(assert (=> b!1163644 (= lt!524181 e!661650)))

(declare-fun c!116457 () Bool)

(declare-fun contains!6816 (ListLongMap!16713 (_ BitVec 64)) Bool)

(assert (=> b!1163644 (= c!116457 (contains!6816 lt!524185 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4849 (array!75066 array!75068 (_ BitVec 32) (_ BitVec 32) V!44001 V!44001 (_ BitVec 32) Int) ListLongMap!16713)

(assert (=> b!1163644 (= lt!524185 (getCurrentListMapNoExtraKeys!4849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163645 () Bool)

(declare-fun e!661648 () Bool)

(declare-fun tp_is_empty!29155 () Bool)

(assert (=> b!1163645 (= e!661648 tp_is_empty!29155)))

(declare-fun b!1163646 () Bool)

(declare-fun e!661645 () Unit!38239)

(declare-fun lt!524173 () Unit!38239)

(assert (=> b!1163646 (= e!661645 lt!524173)))

(assert (=> b!1163646 (= lt!524173 call!57026)))

(assert (=> b!1163646 call!57021))

(declare-fun b!1163647 () Bool)

(declare-fun e!661649 () Bool)

(declare-fun e!661657 () Bool)

(declare-fun mapRes!45557 () Bool)

(assert (=> b!1163647 (= e!661649 (and e!661657 mapRes!45557))))

(declare-fun condMapEmpty!45557 () Bool)

(declare-fun mapDefault!45557 () ValueCell!13868)

(assert (=> b!1163647 (= condMapEmpty!45557 (= (arr!36185 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13868)) mapDefault!45557)))))

(declare-fun b!1163648 () Bool)

(declare-fun e!661643 () Bool)

(assert (=> b!1163648 (= e!661658 e!661643)))

(declare-fun res!771665 () Bool)

(assert (=> b!1163648 (=> (not res!771665) (not e!661643))))

(declare-fun lt!524166 () array!75066)

(assert (=> b!1163648 (= res!771665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524166 mask!1564))))

(assert (=> b!1163648 (= lt!524166 (array!75067 (store (arr!36184 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36722 _keys!1208)))))

(declare-fun b!1163650 () Bool)

(declare-fun res!771673 () Bool)

(assert (=> b!1163650 (=> (not res!771673) (not e!661658))))

(assert (=> b!1163650 (= res!771673 (= (select (arr!36184 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45557 () Bool)

(assert (=> mapIsEmpty!45557 mapRes!45557))

(declare-fun bm!57016 () Bool)

(declare-fun call!57020 () Unit!38239)

(assert (=> bm!57016 (= call!57026 call!57020)))

(declare-fun b!1163651 () Bool)

(declare-fun e!661653 () Bool)

(assert (=> b!1163651 (= e!661653 e!661655)))

(declare-fun res!771674 () Bool)

(assert (=> b!1163651 (=> res!771674 e!661655)))

(assert (=> b!1163651 (= res!771674 (not (= from!1455 i!673)))))

(declare-fun lt!524179 () array!75068)

(declare-fun lt!524174 () ListLongMap!16713)

(assert (=> b!1163651 (= lt!524174 (getCurrentListMapNoExtraKeys!4849 lt!524166 lt!524179 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163651 (= lt!524179 (array!75069 (store (arr!36185 _values!996) i!673 (ValueCellFull!13868 lt!524169)) (size!36723 _values!996)))))

(declare-fun dynLambda!2782 (Int (_ BitVec 64)) V!44001)

(assert (=> b!1163651 (= lt!524169 (dynLambda!2782 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163651 (= lt!524170 (getCurrentListMapNoExtraKeys!4849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163652 () Bool)

(declare-fun c!116462 () Bool)

(assert (=> b!1163652 (= c!116462 (and (not lt!524168) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1163652 (= e!661646 e!661645)))

(declare-fun b!1163653 () Bool)

(declare-fun Unit!38242 () Unit!38239)

(assert (=> b!1163653 (= e!661644 Unit!38242)))

(declare-fun b!1163654 () Bool)

(assert (=> b!1163654 (= e!661643 (not e!661653))))

(declare-fun res!771668 () Bool)

(assert (=> b!1163654 (=> res!771668 e!661653)))

(assert (=> b!1163654 (= res!771668 (bvsgt from!1455 i!673))))

(assert (=> b!1163654 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524183 () Unit!38239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75066 (_ BitVec 64) (_ BitVec 32)) Unit!38239)

(assert (=> b!1163654 (= lt!524183 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163655 () Bool)

(declare-fun call!57022 () ListLongMap!16713)

(declare-fun call!57025 () ListLongMap!16713)

(assert (=> b!1163655 (= e!661651 (= call!57022 call!57025))))

(declare-fun b!1163656 () Bool)

(declare-fun res!771666 () Bool)

(assert (=> b!1163656 (=> (not res!771666) (not e!661658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163656 (= res!771666 (validMask!0 mask!1564))))

(declare-fun b!1163657 () Bool)

(assert (=> b!1163657 (= e!661656 (= lt!524172 (getCurrentListMapNoExtraKeys!4849 lt!524166 lt!524179 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163658 () Bool)

(assert (=> b!1163658 (= e!661651 (= call!57022 (-!1417 call!57025 k0!934)))))

(declare-fun bm!57017 () Bool)

(declare-fun call!57023 () ListLongMap!16713)

(declare-fun lt!524171 () ListLongMap!16713)

(declare-fun call!57019 () Bool)

(assert (=> bm!57017 (= call!57019 (contains!6816 (ite c!116460 lt!524171 call!57023) k0!934))))

(declare-fun b!1163659 () Bool)

(assert (=> b!1163659 (= e!661645 e!661644)))

(declare-fun c!116461 () Bool)

(assert (=> b!1163659 (= c!116461 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524168))))

(declare-fun bm!57018 () Bool)

(declare-fun addStillContains!980 (ListLongMap!16713 (_ BitVec 64) V!44001 (_ BitVec 64)) Unit!38239)

(assert (=> bm!57018 (= call!57020 (addStillContains!980 (ite c!116460 lt!524171 lt!524185) (ite c!116460 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116462 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116460 minValue!944 (ite c!116462 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163660 () Bool)

(assert (=> b!1163660 (contains!6816 (+!3772 lt!524171 (tuple2!18745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524186 () Unit!38239)

(assert (=> b!1163660 (= lt!524186 call!57020)))

(assert (=> b!1163660 call!57019))

(declare-fun call!57024 () ListLongMap!16713)

(assert (=> b!1163660 (= lt!524171 call!57024)))

(declare-fun lt!524178 () Unit!38239)

(assert (=> b!1163660 (= lt!524178 (addStillContains!980 lt!524185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163660 (= e!661646 lt!524186)))

(declare-fun bm!57019 () Bool)

(assert (=> bm!57019 (= call!57023 call!57024)))

(declare-fun mapNonEmpty!45557 () Bool)

(declare-fun tp!86585 () Bool)

(assert (=> mapNonEmpty!45557 (= mapRes!45557 (and tp!86585 e!661648))))

(declare-fun mapValue!45557 () ValueCell!13868)

(declare-fun mapRest!45557 () (Array (_ BitVec 32) ValueCell!13868))

(declare-fun mapKey!45557 () (_ BitVec 32))

(assert (=> mapNonEmpty!45557 (= (arr!36185 _values!996) (store mapRest!45557 mapKey!45557 mapValue!45557))))

(declare-fun b!1163661 () Bool)

(assert (=> b!1163661 (= e!661657 tp_is_empty!29155)))

(declare-fun b!1163662 () Bool)

(declare-fun res!771663 () Bool)

(assert (=> b!1163662 (=> (not res!771663) (not e!661658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163662 (= res!771663 (validKeyInArray!0 k0!934))))

(declare-fun b!1163663 () Bool)

(assert (=> b!1163663 (= e!661647 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163664 () Bool)

(declare-fun res!771677 () Bool)

(assert (=> b!1163664 (=> (not res!771677) (not e!661658))))

(assert (=> b!1163664 (= res!771677 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36722 _keys!1208))))))

(declare-fun bm!57020 () Bool)

(assert (=> bm!57020 (= call!57021 call!57019)))

(declare-fun bm!57021 () Bool)

(assert (=> bm!57021 (= call!57024 (+!3772 lt!524185 (ite (or c!116460 c!116462) (tuple2!18745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1163665 () Bool)

(declare-fun res!771670 () Bool)

(assert (=> b!1163665 (=> (not res!771670) (not e!661658))))

(assert (=> b!1163665 (= res!771670 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25459))))

(declare-fun bm!57022 () Bool)

(assert (=> bm!57022 (= call!57022 (getCurrentListMapNoExtraKeys!4849 lt!524166 lt!524179 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163666 () Bool)

(declare-fun res!771669 () Bool)

(assert (=> b!1163666 (=> (not res!771669) (not e!661658))))

(assert (=> b!1163666 (= res!771669 (and (= (size!36723 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36722 _keys!1208) (size!36723 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163649 () Bool)

(declare-fun res!771672 () Bool)

(assert (=> b!1163649 (=> (not res!771672) (not e!661643))))

(assert (=> b!1163649 (= res!771672 (arrayNoDuplicates!0 lt!524166 #b00000000000000000000000000000000 Nil!25459))))

(declare-fun res!771671 () Bool)

(assert (=> start!99014 (=> (not res!771671) (not e!661658))))

(assert (=> start!99014 (= res!771671 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36722 _keys!1208))))))

(assert (=> start!99014 e!661658))

(assert (=> start!99014 tp_is_empty!29155))

(declare-fun array_inv!27792 (array!75066) Bool)

(assert (=> start!99014 (array_inv!27792 _keys!1208)))

(assert (=> start!99014 true))

(assert (=> start!99014 tp!86586))

(declare-fun array_inv!27793 (array!75068) Bool)

(assert (=> start!99014 (and (array_inv!27793 _values!996) e!661649)))

(declare-fun b!1163667 () Bool)

(declare-fun Unit!38243 () Unit!38239)

(assert (=> b!1163667 (= e!661650 Unit!38243)))

(declare-fun bm!57023 () Bool)

(assert (=> bm!57023 (= call!57025 (getCurrentListMapNoExtraKeys!4849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99014 res!771671) b!1163656))

(assert (= (and b!1163656 res!771666) b!1163666))

(assert (= (and b!1163666 res!771669) b!1163641))

(assert (= (and b!1163641 res!771664) b!1163665))

(assert (= (and b!1163665 res!771670) b!1163664))

(assert (= (and b!1163664 res!771677) b!1163662))

(assert (= (and b!1163662 res!771663) b!1163650))

(assert (= (and b!1163650 res!771673) b!1163648))

(assert (= (and b!1163648 res!771665) b!1163649))

(assert (= (and b!1163649 res!771672) b!1163654))

(assert (= (and b!1163654 (not res!771668)) b!1163651))

(assert (= (and b!1163651 (not res!771674)) b!1163642))

(assert (= (and b!1163642 c!116459) b!1163658))

(assert (= (and b!1163642 (not c!116459)) b!1163655))

(assert (= (or b!1163658 b!1163655) bm!57022))

(assert (= (or b!1163658 b!1163655) bm!57023))

(assert (= (and b!1163642 (not res!771667)) b!1163644))

(assert (= (and b!1163644 c!116457) b!1163639))

(assert (= (and b!1163644 (not c!116457)) b!1163667))

(assert (= (and b!1163639 c!116460) b!1163660))

(assert (= (and b!1163639 (not c!116460)) b!1163652))

(assert (= (and b!1163652 c!116462) b!1163646))

(assert (= (and b!1163652 (not c!116462)) b!1163659))

(assert (= (and b!1163659 c!116461) b!1163638))

(assert (= (and b!1163659 (not c!116461)) b!1163653))

(assert (= (or b!1163646 b!1163638) bm!57016))

(assert (= (or b!1163646 b!1163638) bm!57019))

(assert (= (or b!1163646 b!1163638) bm!57020))

(assert (= (or b!1163660 bm!57020) bm!57017))

(assert (= (or b!1163660 bm!57016) bm!57018))

(assert (= (or b!1163660 bm!57019) bm!57021))

(assert (= (and b!1163639 c!116458) b!1163663))

(assert (= (and b!1163639 (not c!116458)) b!1163640))

(assert (= (and b!1163639 res!771675) b!1163643))

(assert (= (and b!1163644 res!771676) b!1163657))

(assert (= (and b!1163647 condMapEmpty!45557) mapIsEmpty!45557))

(assert (= (and b!1163647 (not condMapEmpty!45557)) mapNonEmpty!45557))

(get-info :version)

(assert (= (and mapNonEmpty!45557 ((_ is ValueCellFull!13868) mapValue!45557)) b!1163645))

(assert (= (and b!1163647 ((_ is ValueCellFull!13868) mapDefault!45557)) b!1163661))

(assert (= start!99014 b!1163647))

(declare-fun b_lambda!19713 () Bool)

(assert (=> (not b_lambda!19713) (not b!1163651)))

(declare-fun t!37069 () Bool)

(declare-fun tb!9429 () Bool)

(assert (=> (and start!99014 (= defaultEntry!1004 defaultEntry!1004) t!37069) tb!9429))

(declare-fun result!19431 () Bool)

(assert (=> tb!9429 (= result!19431 tp_is_empty!29155)))

(assert (=> b!1163651 t!37069))

(declare-fun b_and!40079 () Bool)

(assert (= b_and!40077 (and (=> t!37069 result!19431) b_and!40079)))

(declare-fun m!1071679 () Bool)

(assert (=> mapNonEmpty!45557 m!1071679))

(declare-fun m!1071681 () Bool)

(assert (=> bm!57023 m!1071681))

(declare-fun m!1071683 () Bool)

(assert (=> bm!57017 m!1071683))

(declare-fun m!1071685 () Bool)

(assert (=> start!99014 m!1071685))

(declare-fun m!1071687 () Bool)

(assert (=> start!99014 m!1071687))

(declare-fun m!1071689 () Bool)

(assert (=> b!1163656 m!1071689))

(declare-fun m!1071691 () Bool)

(assert (=> b!1163639 m!1071691))

(declare-fun m!1071693 () Bool)

(assert (=> b!1163639 m!1071693))

(declare-fun m!1071695 () Bool)

(assert (=> b!1163639 m!1071695))

(declare-fun m!1071697 () Bool)

(assert (=> b!1163639 m!1071697))

(declare-fun m!1071699 () Bool)

(assert (=> b!1163665 m!1071699))

(declare-fun m!1071701 () Bool)

(assert (=> b!1163650 m!1071701))

(declare-fun m!1071703 () Bool)

(assert (=> b!1163654 m!1071703))

(declare-fun m!1071705 () Bool)

(assert (=> b!1163654 m!1071705))

(declare-fun m!1071707 () Bool)

(assert (=> bm!57021 m!1071707))

(declare-fun m!1071709 () Bool)

(assert (=> b!1163648 m!1071709))

(declare-fun m!1071711 () Bool)

(assert (=> b!1163648 m!1071711))

(assert (=> b!1163644 m!1071681))

(declare-fun m!1071713 () Bool)

(assert (=> b!1163644 m!1071713))

(assert (=> b!1163644 m!1071713))

(declare-fun m!1071715 () Bool)

(assert (=> b!1163644 m!1071715))

(declare-fun m!1071717 () Bool)

(assert (=> b!1163644 m!1071717))

(declare-fun m!1071719 () Bool)

(assert (=> b!1163644 m!1071719))

(declare-fun m!1071721 () Bool)

(assert (=> b!1163644 m!1071721))

(declare-fun m!1071723 () Bool)

(assert (=> b!1163644 m!1071723))

(declare-fun m!1071725 () Bool)

(assert (=> b!1163644 m!1071725))

(assert (=> b!1163644 m!1071721))

(assert (=> b!1163644 m!1071719))

(assert (=> b!1163644 m!1071721))

(declare-fun m!1071727 () Bool)

(assert (=> b!1163644 m!1071727))

(declare-fun m!1071729 () Bool)

(assert (=> b!1163662 m!1071729))

(declare-fun m!1071731 () Bool)

(assert (=> b!1163663 m!1071731))

(declare-fun m!1071733 () Bool)

(assert (=> b!1163657 m!1071733))

(assert (=> b!1163642 m!1071721))

(declare-fun m!1071735 () Bool)

(assert (=> b!1163642 m!1071735))

(declare-fun m!1071737 () Bool)

(assert (=> b!1163649 m!1071737))

(declare-fun m!1071739 () Bool)

(assert (=> bm!57018 m!1071739))

(declare-fun m!1071741 () Bool)

(assert (=> b!1163641 m!1071741))

(assert (=> bm!57022 m!1071733))

(declare-fun m!1071743 () Bool)

(assert (=> b!1163651 m!1071743))

(declare-fun m!1071745 () Bool)

(assert (=> b!1163651 m!1071745))

(declare-fun m!1071747 () Bool)

(assert (=> b!1163651 m!1071747))

(declare-fun m!1071749 () Bool)

(assert (=> b!1163651 m!1071749))

(declare-fun m!1071751 () Bool)

(assert (=> b!1163660 m!1071751))

(assert (=> b!1163660 m!1071751))

(declare-fun m!1071753 () Bool)

(assert (=> b!1163660 m!1071753))

(declare-fun m!1071755 () Bool)

(assert (=> b!1163660 m!1071755))

(assert (=> b!1163643 m!1071731))

(declare-fun m!1071757 () Bool)

(assert (=> b!1163658 m!1071757))

(check-sat (not bm!57021) (not b!1163663) (not bm!57018) (not b_lambda!19713) (not b!1163644) (not b_next!24625) (not b!1163642) (not b!1163639) (not b!1163648) (not bm!57022) (not b!1163643) (not bm!57023) (not b!1163662) (not b!1163656) (not start!99014) (not b!1163641) tp_is_empty!29155 (not b!1163649) (not b!1163665) (not b!1163654) b_and!40079 (not b!1163651) (not mapNonEmpty!45557) (not bm!57017) (not b!1163660) (not b!1163657) (not b!1163658))
(check-sat b_and!40079 (not b_next!24625))
