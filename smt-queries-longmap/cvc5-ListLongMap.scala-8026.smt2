; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98996 () Bool)

(assert start!98996)

(declare-fun b_free!24601 () Bool)

(declare-fun b_next!24601 () Bool)

(assert (=> start!98996 (= b_free!24601 (not b_next!24601))))

(declare-fun tp!86513 () Bool)

(declare-fun b_and!40051 () Bool)

(assert (=> start!98996 (= tp!86513 b_and!40051)))

(declare-datatypes ((array!75101 0))(
  ( (array!75102 (arr!36201 (Array (_ BitVec 32) (_ BitVec 64))) (size!36737 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75101)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!661114 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1162658 () Bool)

(declare-fun arrayContainsKey!0 (array!75101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162658 (= e!661114 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162659 () Bool)

(declare-datatypes ((V!43969 0))(
  ( (V!43970 (val!14622 Int)) )
))
(declare-datatypes ((tuple2!18640 0))(
  ( (tuple2!18641 (_1!9331 (_ BitVec 64)) (_2!9331 V!43969)) )
))
(declare-datatypes ((List!25374 0))(
  ( (Nil!25371) (Cons!25370 (h!26579 tuple2!18640) (t!36967 List!25374)) )
))
(declare-datatypes ((ListLongMap!16609 0))(
  ( (ListLongMap!16610 (toList!8320 List!25374)) )
))
(declare-fun lt!523568 () ListLongMap!16609)

(declare-fun minValue!944 () V!43969)

(declare-fun contains!6825 (ListLongMap!16609 (_ BitVec 64)) Bool)

(declare-fun +!3724 (ListLongMap!16609 tuple2!18640) ListLongMap!16609)

(assert (=> b!1162659 (contains!6825 (+!3724 lt!523568 (tuple2!18641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-datatypes ((Unit!38364 0))(
  ( (Unit!38365) )
))
(declare-fun lt!523578 () Unit!38364)

(declare-fun call!56755 () Unit!38364)

(assert (=> b!1162659 (= lt!523578 call!56755)))

(declare-fun call!56754 () Bool)

(assert (=> b!1162659 call!56754))

(declare-fun call!56758 () ListLongMap!16609)

(assert (=> b!1162659 (= lt!523568 call!56758)))

(declare-fun zeroValue!944 () V!43969)

(declare-fun lt!523584 () Unit!38364)

(declare-fun lt!523586 () ListLongMap!16609)

(declare-fun addStillContains!965 (ListLongMap!16609 (_ BitVec 64) V!43969 (_ BitVec 64)) Unit!38364)

(assert (=> b!1162659 (= lt!523584 (addStillContains!965 lt!523586 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!661121 () Unit!38364)

(assert (=> b!1162659 (= e!661121 lt!523578)))

(declare-fun lt!523569 () array!75101)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!56757 () ListLongMap!16609)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13856 0))(
  ( (ValueCellFull!13856 (v!17259 V!43969)) (EmptyCell!13856) )
))
(declare-datatypes ((array!75103 0))(
  ( (array!75104 (arr!36202 (Array (_ BitVec 32) ValueCell!13856)) (size!36738 (_ BitVec 32))) )
))
(declare-fun lt!523571 () array!75103)

(declare-fun bm!56751 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4784 (array!75101 array!75103 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) Int) ListLongMap!16609)

(assert (=> bm!56751 (= call!56757 (getCurrentListMapNoExtraKeys!4784 lt!523569 lt!523571 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56752 () Bool)

(declare-fun call!56761 () Unit!38364)

(assert (=> bm!56752 (= call!56761 call!56755)))

(declare-fun c!116268 () Bool)

(declare-fun c!116272 () Bool)

(declare-fun bm!56753 () Bool)

(assert (=> bm!56753 (= call!56755 (addStillContains!965 (ite c!116268 lt!523568 lt!523586) (ite c!116268 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116272 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116268 minValue!944 (ite c!116272 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1162660 () Bool)

(declare-fun e!661116 () Unit!38364)

(declare-fun e!661115 () Unit!38364)

(assert (=> b!1162660 (= e!661116 e!661115)))

(declare-fun c!116270 () Bool)

(declare-fun lt!523572 () Bool)

(assert (=> b!1162660 (= c!116270 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523572))))

(declare-fun b!1162661 () Bool)

(declare-fun e!661117 () Bool)

(declare-fun tp_is_empty!29131 () Bool)

(assert (=> b!1162661 (= e!661117 tp_is_empty!29131)))

(declare-fun b!1162662 () Bool)

(assert (=> b!1162662 (= c!116272 (and (not lt!523572) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162662 (= e!661121 e!661116)))

(declare-fun b!1162663 () Bool)

(declare-fun e!661122 () Unit!38364)

(declare-fun Unit!38366 () Unit!38364)

(assert (=> b!1162663 (= e!661122 Unit!38366)))

(declare-fun b!1162664 () Bool)

(declare-fun call!56756 () Bool)

(assert (=> b!1162664 call!56756))

(declare-fun lt!523579 () Unit!38364)

(assert (=> b!1162664 (= lt!523579 call!56761)))

(assert (=> b!1162664 (= e!661115 lt!523579)))

(declare-fun b!1162665 () Bool)

(declare-fun res!771199 () Bool)

(declare-fun e!661112 () Bool)

(assert (=> b!1162665 (=> (not res!771199) (not e!661112))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162665 (= res!771199 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36737 _keys!1208))))))

(declare-fun b!1162666 () Bool)

(declare-fun res!771203 () Bool)

(assert (=> b!1162666 (=> (not res!771203) (not e!661112))))

(declare-datatypes ((List!25375 0))(
  ( (Nil!25372) (Cons!25371 (h!26580 (_ BitVec 64)) (t!36968 List!25375)) )
))
(declare-fun arrayNoDuplicates!0 (array!75101 (_ BitVec 32) List!25375) Bool)

(assert (=> b!1162666 (= res!771203 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25372))))

(declare-fun b!1162667 () Bool)

(declare-fun e!661120 () Bool)

(assert (=> b!1162667 (= e!661112 e!661120)))

(declare-fun res!771198 () Bool)

(assert (=> b!1162667 (=> (not res!771198) (not e!661120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75101 (_ BitVec 32)) Bool)

(assert (=> b!1162667 (= res!771198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523569 mask!1564))))

(assert (=> b!1162667 (= lt!523569 (array!75102 (store (arr!36201 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36737 _keys!1208)))))

(declare-fun call!56760 () ListLongMap!16609)

(declare-fun b!1162668 () Bool)

(declare-fun e!661125 () Bool)

(declare-fun -!1426 (ListLongMap!16609 (_ BitVec 64)) ListLongMap!16609)

(assert (=> b!1162668 (= e!661125 (= call!56757 (-!1426 call!56760 k!934)))))

(declare-fun call!56759 () ListLongMap!16609)

(declare-fun bm!56754 () Bool)

(assert (=> bm!56754 (= call!56754 (contains!6825 (ite c!116268 lt!523568 call!56759) k!934))))

(declare-fun _values!996 () array!75103)

(declare-fun bm!56755 () Bool)

(assert (=> bm!56755 (= call!56760 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162669 () Bool)

(declare-fun Unit!38367 () Unit!38364)

(assert (=> b!1162669 (= e!661122 Unit!38367)))

(assert (=> b!1162669 (= lt!523572 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162669 (= c!116268 (and (not lt!523572) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523567 () Unit!38364)

(assert (=> b!1162669 (= lt!523567 e!661121)))

(declare-fun lt!523576 () Unit!38364)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!550 (array!75101 array!75103 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 64) (_ BitVec 32) Int) Unit!38364)

(assert (=> b!1162669 (= lt!523576 (lemmaListMapContainsThenArrayContainsFrom!550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116271 () Bool)

(assert (=> b!1162669 (= c!116271 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771202 () Bool)

(assert (=> b!1162669 (= res!771202 e!661114)))

(declare-fun e!661109 () Bool)

(assert (=> b!1162669 (=> (not res!771202) (not e!661109))))

(assert (=> b!1162669 e!661109))

(declare-fun lt!523566 () Unit!38364)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75101 (_ BitVec 32) (_ BitVec 32)) Unit!38364)

(assert (=> b!1162669 (= lt!523566 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162669 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25372)))

(declare-fun lt!523582 () Unit!38364)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75101 (_ BitVec 64) (_ BitVec 32) List!25375) Unit!38364)

(assert (=> b!1162669 (= lt!523582 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25372))))

(assert (=> b!1162669 false))

(declare-fun b!1162670 () Bool)

(declare-fun res!771192 () Bool)

(assert (=> b!1162670 (=> (not res!771192) (not e!661112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162670 (= res!771192 (validKeyInArray!0 k!934))))

(declare-fun bm!56756 () Bool)

(assert (=> bm!56756 (= call!56756 call!56754)))

(declare-fun res!771191 () Bool)

(assert (=> start!98996 (=> (not res!771191) (not e!661112))))

(assert (=> start!98996 (= res!771191 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36737 _keys!1208))))))

(assert (=> start!98996 e!661112))

(assert (=> start!98996 tp_is_empty!29131))

(declare-fun array_inv!27702 (array!75101) Bool)

(assert (=> start!98996 (array_inv!27702 _keys!1208)))

(assert (=> start!98996 true))

(assert (=> start!98996 tp!86513))

(declare-fun e!661123 () Bool)

(declare-fun array_inv!27703 (array!75103) Bool)

(assert (=> start!98996 (and (array_inv!27703 _values!996) e!661123)))

(declare-fun b!1162671 () Bool)

(assert (=> b!1162671 (= e!661114 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523572) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56757 () Bool)

(assert (=> bm!56757 (= call!56758 (+!3724 lt!523586 (ite (or c!116268 c!116272) (tuple2!18641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1162672 () Bool)

(declare-fun lt!523581 () Unit!38364)

(assert (=> b!1162672 (= e!661116 lt!523581)))

(assert (=> b!1162672 (= lt!523581 call!56761)))

(assert (=> b!1162672 call!56756))

(declare-fun mapNonEmpty!45521 () Bool)

(declare-fun mapRes!45521 () Bool)

(declare-fun tp!86514 () Bool)

(assert (=> mapNonEmpty!45521 (= mapRes!45521 (and tp!86514 e!661117))))

(declare-fun mapKey!45521 () (_ BitVec 32))

(declare-fun mapRest!45521 () (Array (_ BitVec 32) ValueCell!13856))

(declare-fun mapValue!45521 () ValueCell!13856)

(assert (=> mapNonEmpty!45521 (= (arr!36202 _values!996) (store mapRest!45521 mapKey!45521 mapValue!45521))))

(declare-fun b!1162673 () Bool)

(declare-fun res!771189 () Bool)

(assert (=> b!1162673 (=> (not res!771189) (not e!661112))))

(assert (=> b!1162673 (= res!771189 (and (= (size!36738 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36737 _keys!1208) (size!36738 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162674 () Bool)

(assert (=> b!1162674 (= e!661109 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162675 () Bool)

(declare-fun e!661124 () Bool)

(declare-fun e!661113 () Bool)

(assert (=> b!1162675 (= e!661124 e!661113)))

(declare-fun res!771196 () Bool)

(assert (=> b!1162675 (=> res!771196 e!661113)))

(assert (=> b!1162675 (= res!771196 (not (= from!1455 i!673)))))

(declare-fun lt!523583 () ListLongMap!16609)

(assert (=> b!1162675 (= lt!523583 (getCurrentListMapNoExtraKeys!4784 lt!523569 lt!523571 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523580 () V!43969)

(assert (=> b!1162675 (= lt!523571 (array!75104 (store (arr!36202 _values!996) i!673 (ValueCellFull!13856 lt!523580)) (size!36738 _values!996)))))

(declare-fun dynLambda!2780 (Int (_ BitVec 64)) V!43969)

(assert (=> b!1162675 (= lt!523580 (dynLambda!2780 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523570 () ListLongMap!16609)

(assert (=> b!1162675 (= lt!523570 (getCurrentListMapNoExtraKeys!4784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162676 () Bool)

(declare-fun res!771200 () Bool)

(assert (=> b!1162676 (=> (not res!771200) (not e!661112))))

(assert (=> b!1162676 (= res!771200 (= (select (arr!36201 _keys!1208) i!673) k!934))))

(declare-fun b!1162677 () Bool)

(declare-fun e!661111 () Bool)

(assert (=> b!1162677 (= e!661111 tp_is_empty!29131)))

(declare-fun b!1162678 () Bool)

(declare-fun lt!523585 () ListLongMap!16609)

(declare-fun e!661119 () Bool)

(assert (=> b!1162678 (= e!661119 (= lt!523585 (getCurrentListMapNoExtraKeys!4784 lt!523569 lt!523571 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56758 () Bool)

(assert (=> bm!56758 (= call!56759 call!56758)))

(declare-fun b!1162679 () Bool)

(declare-fun e!661110 () Bool)

(assert (=> b!1162679 (= e!661113 e!661110)))

(declare-fun res!771197 () Bool)

(assert (=> b!1162679 (=> res!771197 e!661110)))

(assert (=> b!1162679 (= res!771197 (not (= (select (arr!36201 _keys!1208) from!1455) k!934)))))

(assert (=> b!1162679 e!661125))

(declare-fun c!116267 () Bool)

(assert (=> b!1162679 (= c!116267 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523573 () Unit!38364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!655 (array!75101 array!75103 (_ BitVec 32) (_ BitVec 32) V!43969 V!43969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38364)

(assert (=> b!1162679 (= lt!523573 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!655 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162680 () Bool)

(declare-fun Unit!38368 () Unit!38364)

(assert (=> b!1162680 (= e!661115 Unit!38368)))

(declare-fun b!1162681 () Bool)

(assert (=> b!1162681 (= e!661120 (not e!661124))))

(declare-fun res!771190 () Bool)

(assert (=> b!1162681 (=> res!771190 e!661124)))

(assert (=> b!1162681 (= res!771190 (bvsgt from!1455 i!673))))

(assert (=> b!1162681 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!523575 () Unit!38364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75101 (_ BitVec 64) (_ BitVec 32)) Unit!38364)

(assert (=> b!1162681 (= lt!523575 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1162682 () Bool)

(declare-fun res!771193 () Bool)

(assert (=> b!1162682 (=> (not res!771193) (not e!661112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162682 (= res!771193 (validMask!0 mask!1564))))

(declare-fun b!1162683 () Bool)

(assert (=> b!1162683 (= e!661123 (and e!661111 mapRes!45521))))

(declare-fun condMapEmpty!45521 () Bool)

(declare-fun mapDefault!45521 () ValueCell!13856)

