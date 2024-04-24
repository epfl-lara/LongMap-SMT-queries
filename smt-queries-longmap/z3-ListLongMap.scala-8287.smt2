; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101230 () Bool)

(assert start!101230)

(declare-fun b_free!25993 () Bool)

(declare-fun b_next!25993 () Bool)

(assert (=> start!101230 (= b_free!25993 (not b_next!25993))))

(declare-fun tp!90995 () Bool)

(declare-fun b_and!43069 () Bool)

(assert (=> start!101230 (= tp!90995 b_and!43069)))

(declare-fun b!1210695 () Bool)

(declare-fun res!804308 () Bool)

(declare-fun e!687718 () Bool)

(assert (=> b!1210695 (=> (not res!804308) (not e!687718))))

(declare-datatypes ((array!78213 0))(
  ( (array!78214 (arr!37737 (Array (_ BitVec 32) (_ BitVec 64))) (size!38274 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78213)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46057 0))(
  ( (V!46058 (val!15405 Int)) )
))
(declare-datatypes ((ValueCell!14639 0))(
  ( (ValueCellFull!14639 (v!18052 V!46057)) (EmptyCell!14639) )
))
(declare-datatypes ((array!78215 0))(
  ( (array!78216 (arr!37738 (Array (_ BitVec 32) ValueCell!14639)) (size!38275 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78215)

(assert (=> b!1210695 (= res!804308 (and (= (size!38275 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38274 _keys!1208) (size!38275 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210696 () Bool)

(declare-fun e!687706 () Bool)

(assert (=> b!1210696 (= e!687718 e!687706)))

(declare-fun res!804300 () Bool)

(assert (=> b!1210696 (=> (not res!804300) (not e!687706))))

(declare-fun lt!549445 () array!78213)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78213 (_ BitVec 32)) Bool)

(assert (=> b!1210696 (= res!804300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549445 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210696 (= lt!549445 (array!78214 (store (arr!37737 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38274 _keys!1208)))))

(declare-fun b!1210697 () Bool)

(declare-fun call!59429 () Bool)

(assert (=> b!1210697 call!59429))

(declare-datatypes ((Unit!40040 0))(
  ( (Unit!40041) )
))
(declare-fun lt!549453 () Unit!40040)

(declare-fun call!59425 () Unit!40040)

(assert (=> b!1210697 (= lt!549453 call!59425)))

(declare-fun e!687715 () Unit!40040)

(assert (=> b!1210697 (= e!687715 lt!549453)))

(declare-fun b!1210698 () Bool)

(declare-fun c!119465 () Bool)

(declare-fun lt!549459 () Bool)

(assert (=> b!1210698 (= c!119465 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549459))))

(declare-fun e!687714 () Unit!40040)

(assert (=> b!1210698 (= e!687715 e!687714)))

(declare-fun b!1210699 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!687709 () Bool)

(declare-fun arrayContainsKey!0 (array!78213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210699 (= e!687709 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210700 () Bool)

(declare-fun e!687710 () Unit!40040)

(assert (=> b!1210700 (= e!687710 e!687715)))

(declare-fun c!119463 () Bool)

(assert (=> b!1210700 (= c!119463 (and (not lt!549459) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1210702 () Bool)

(declare-fun res!804298 () Bool)

(assert (=> b!1210702 (=> (not res!804298) (not e!687718))))

(declare-datatypes ((List!26596 0))(
  ( (Nil!26593) (Cons!26592 (h!27810 (_ BitVec 64)) (t!39561 List!26596)) )
))
(declare-fun arrayNoDuplicates!0 (array!78213 (_ BitVec 32) List!26596) Bool)

(assert (=> b!1210702 (= res!804298 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26593))))

(declare-fun b!1210703 () Bool)

(declare-fun res!804299 () Bool)

(declare-fun e!687703 () Bool)

(assert (=> b!1210703 (=> res!804299 e!687703)))

(declare-fun noDuplicate!1646 (List!26596) Bool)

(assert (=> b!1210703 (= res!804299 (not (noDuplicate!1646 Nil!26593)))))

(declare-fun b!1210704 () Bool)

(declare-fun e!687713 () Bool)

(assert (=> b!1210704 (= e!687706 (not e!687713))))

(declare-fun res!804296 () Bool)

(assert (=> b!1210704 (=> res!804296 e!687713)))

(assert (=> b!1210704 (= res!804296 (bvsgt from!1455 i!673))))

(assert (=> b!1210704 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549448 () Unit!40040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78213 (_ BitVec 64) (_ BitVec 32)) Unit!40040)

(assert (=> b!1210704 (= lt!549448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59419 () Bool)

(declare-datatypes ((tuple2!19790 0))(
  ( (tuple2!19791 (_1!9906 (_ BitVec 64)) (_2!9906 V!46057)) )
))
(declare-datatypes ((List!26597 0))(
  ( (Nil!26594) (Cons!26593 (h!27811 tuple2!19790) (t!39562 List!26597)) )
))
(declare-datatypes ((ListLongMap!17767 0))(
  ( (ListLongMap!17768 (toList!8899 List!26597)) )
))
(declare-fun call!59423 () ListLongMap!17767)

(declare-fun call!59428 () ListLongMap!17767)

(assert (=> bm!59419 (= call!59423 call!59428)))

(declare-fun b!1210705 () Bool)

(declare-fun e!687707 () Bool)

(declare-fun e!687704 () Bool)

(declare-fun mapRes!47914 () Bool)

(assert (=> b!1210705 (= e!687707 (and e!687704 mapRes!47914))))

(declare-fun condMapEmpty!47914 () Bool)

(declare-fun mapDefault!47914 () ValueCell!14639)

(assert (=> b!1210705 (= condMapEmpty!47914 (= (arr!37738 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14639)) mapDefault!47914)))))

(declare-fun b!1210706 () Bool)

(declare-fun e!687719 () Bool)

(assert (=> b!1210706 (= e!687719 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210707 () Bool)

(declare-fun res!804307 () Bool)

(assert (=> b!1210707 (=> (not res!804307) (not e!687718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210707 (= res!804307 (validMask!0 mask!1564))))

(declare-fun b!1210708 () Bool)

(declare-fun res!804311 () Bool)

(assert (=> b!1210708 (=> (not res!804311) (not e!687718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210708 (= res!804311 (validKeyInArray!0 k0!934))))

(declare-fun b!1210709 () Bool)

(assert (=> b!1210709 (= e!687709 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549459) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210710 () Bool)

(declare-fun e!687708 () Bool)

(declare-fun tp_is_empty!30697 () Bool)

(assert (=> b!1210710 (= e!687708 tp_is_empty!30697)))

(declare-fun bm!59420 () Bool)

(declare-fun call!59422 () Unit!40040)

(assert (=> bm!59420 (= call!59425 call!59422)))

(declare-fun zeroValue!944 () V!46057)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!59426 () ListLongMap!17767)

(declare-fun lt!549460 () array!78215)

(declare-fun minValue!944 () V!46057)

(declare-fun bm!59421 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5360 (array!78213 array!78215 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) Int) ListLongMap!17767)

(assert (=> bm!59421 (= call!59426 (getCurrentListMapNoExtraKeys!5360 lt!549445 lt!549460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210711 () Bool)

(declare-fun lt!549452 () Unit!40040)

(assert (=> b!1210711 (= e!687714 lt!549452)))

(assert (=> b!1210711 (= lt!549452 call!59425)))

(assert (=> b!1210711 call!59429))

(declare-fun res!804309 () Bool)

(assert (=> start!101230 (=> (not res!804309) (not e!687718))))

(assert (=> start!101230 (= res!804309 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38274 _keys!1208))))))

(assert (=> start!101230 e!687718))

(assert (=> start!101230 tp_is_empty!30697))

(declare-fun array_inv!28810 (array!78213) Bool)

(assert (=> start!101230 (array_inv!28810 _keys!1208)))

(assert (=> start!101230 true))

(assert (=> start!101230 tp!90995))

(declare-fun array_inv!28811 (array!78215) Bool)

(assert (=> start!101230 (and (array_inv!28811 _values!996) e!687707)))

(declare-fun b!1210701 () Bool)

(declare-fun e!687717 () Bool)

(declare-fun call!59427 () ListLongMap!17767)

(assert (=> b!1210701 (= e!687717 (= call!59426 call!59427))))

(declare-fun call!59424 () Bool)

(declare-fun c!119466 () Bool)

(declare-fun lt!549456 () ListLongMap!17767)

(declare-fun bm!59422 () Bool)

(declare-fun contains!6990 (ListLongMap!17767 (_ BitVec 64)) Bool)

(assert (=> bm!59422 (= call!59424 (contains!6990 (ite c!119466 lt!549456 call!59423) k0!934))))

(declare-fun bm!59423 () Bool)

(assert (=> bm!59423 (= call!59429 call!59424)))

(declare-fun b!1210712 () Bool)

(declare-fun e!687716 () Bool)

(declare-fun e!687711 () Bool)

(assert (=> b!1210712 (= e!687716 e!687711)))

(declare-fun res!804303 () Bool)

(assert (=> b!1210712 (=> res!804303 e!687711)))

(assert (=> b!1210712 (= res!804303 (not (= (select (arr!37737 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210712 e!687717))

(declare-fun c!119464 () Bool)

(assert (=> b!1210712 (= c!119464 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549444 () Unit!40040)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1049 (array!78213 array!78215 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40040)

(assert (=> b!1210712 (= lt!549444 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1049 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47914 () Bool)

(assert (=> mapIsEmpty!47914 mapRes!47914))

(declare-fun b!1210713 () Bool)

(declare-fun res!804305 () Bool)

(assert (=> b!1210713 (=> (not res!804305) (not e!687718))))

(assert (=> b!1210713 (= res!804305 (= (select (arr!37737 _keys!1208) i!673) k0!934))))

(declare-fun bm!59424 () Bool)

(assert (=> bm!59424 (= call!59427 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210714 () Bool)

(declare-fun Unit!40042 () Unit!40040)

(assert (=> b!1210714 (= e!687714 Unit!40042)))

(declare-fun b!1210715 () Bool)

(assert (=> b!1210715 (= e!687703 true)))

(declare-fun lt!549458 () Bool)

(declare-fun contains!6991 (List!26596 (_ BitVec 64)) Bool)

(assert (=> b!1210715 (= lt!549458 (contains!6991 Nil!26593 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1210716 () Bool)

(assert (=> b!1210716 (= e!687713 e!687716)))

(declare-fun res!804294 () Bool)

(assert (=> b!1210716 (=> res!804294 e!687716)))

(assert (=> b!1210716 (= res!804294 (not (= from!1455 i!673)))))

(declare-fun lt!549454 () ListLongMap!17767)

(assert (=> b!1210716 (= lt!549454 (getCurrentListMapNoExtraKeys!5360 lt!549445 lt!549460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3279 (Int (_ BitVec 64)) V!46057)

(assert (=> b!1210716 (= lt!549460 (array!78216 (store (arr!37738 _values!996) i!673 (ValueCellFull!14639 (dynLambda!3279 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38275 _values!996)))))

(declare-fun lt!549447 () ListLongMap!17767)

(assert (=> b!1210716 (= lt!549447 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210717 () Bool)

(declare-fun e!687705 () Bool)

(assert (=> b!1210717 (= e!687705 e!687703)))

(declare-fun res!804304 () Bool)

(assert (=> b!1210717 (=> res!804304 e!687703)))

(assert (=> b!1210717 (= res!804304 (or (bvsge (size!38274 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38274 _keys!1208)) (bvsge from!1455 (size!38274 _keys!1208))))))

(assert (=> b!1210717 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26593)))

(declare-fun lt!549457 () Unit!40040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78213 (_ BitVec 32) (_ BitVec 32)) Unit!40040)

(assert (=> b!1210717 (= lt!549457 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210717 e!687719))

(declare-fun res!804302 () Bool)

(assert (=> b!1210717 (=> (not res!804302) (not e!687719))))

(assert (=> b!1210717 (= res!804302 e!687709)))

(declare-fun c!119467 () Bool)

(assert (=> b!1210717 (= c!119467 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549446 () Unit!40040)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!595 (array!78213 array!78215 (_ BitVec 32) (_ BitVec 32) V!46057 V!46057 (_ BitVec 64) (_ BitVec 32) Int) Unit!40040)

(assert (=> b!1210717 (= lt!549446 (lemmaListMapContainsThenArrayContainsFrom!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549449 () Unit!40040)

(assert (=> b!1210717 (= lt!549449 e!687710)))

(assert (=> b!1210717 (= c!119466 (and (not lt!549459) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1210717 (= lt!549459 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!549455 () ListLongMap!17767)

(declare-fun bm!59425 () Bool)

(declare-fun +!4060 (ListLongMap!17767 tuple2!19790) ListLongMap!17767)

(assert (=> bm!59425 (= call!59428 (+!4060 lt!549455 (ite (or c!119466 c!119463) (tuple2!19791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210718 () Bool)

(declare-fun res!804306 () Bool)

(assert (=> b!1210718 (=> (not res!804306) (not e!687706))))

(assert (=> b!1210718 (= res!804306 (arrayNoDuplicates!0 lt!549445 #b00000000000000000000000000000000 Nil!26593))))

(declare-fun b!1210719 () Bool)

(declare-fun lt!549451 () Unit!40040)

(assert (=> b!1210719 (= e!687710 lt!549451)))

(declare-fun lt!549450 () Unit!40040)

(declare-fun addStillContains!1043 (ListLongMap!17767 (_ BitVec 64) V!46057 (_ BitVec 64)) Unit!40040)

(assert (=> b!1210719 (= lt!549450 (addStillContains!1043 lt!549455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210719 (= lt!549456 call!59428)))

(assert (=> b!1210719 call!59424))

(assert (=> b!1210719 (= lt!549451 call!59422)))

(assert (=> b!1210719 (contains!6990 (+!4060 lt!549456 (tuple2!19791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1210720 () Bool)

(declare-fun res!804310 () Bool)

(assert (=> b!1210720 (=> (not res!804310) (not e!687718))))

(assert (=> b!1210720 (= res!804310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38274 _keys!1208))))))

(declare-fun b!1210721 () Bool)

(assert (=> b!1210721 (= e!687711 e!687705)))

(declare-fun res!804295 () Bool)

(assert (=> b!1210721 (=> res!804295 e!687705)))

(assert (=> b!1210721 (= res!804295 (not (contains!6990 lt!549455 k0!934)))))

(assert (=> b!1210721 (= lt!549455 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210722 () Bool)

(declare-fun res!804301 () Bool)

(assert (=> b!1210722 (=> res!804301 e!687703)))

(assert (=> b!1210722 (= res!804301 (contains!6991 Nil!26593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1210723 () Bool)

(declare-fun res!804297 () Bool)

(assert (=> b!1210723 (=> (not res!804297) (not e!687718))))

(assert (=> b!1210723 (= res!804297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210724 () Bool)

(declare-fun -!1831 (ListLongMap!17767 (_ BitVec 64)) ListLongMap!17767)

(assert (=> b!1210724 (= e!687717 (= call!59426 (-!1831 call!59427 k0!934)))))

(declare-fun b!1210725 () Bool)

(assert (=> b!1210725 (= e!687704 tp_is_empty!30697)))

(declare-fun mapNonEmpty!47914 () Bool)

(declare-fun tp!90994 () Bool)

(assert (=> mapNonEmpty!47914 (= mapRes!47914 (and tp!90994 e!687708))))

(declare-fun mapRest!47914 () (Array (_ BitVec 32) ValueCell!14639))

(declare-fun mapValue!47914 () ValueCell!14639)

(declare-fun mapKey!47914 () (_ BitVec 32))

(assert (=> mapNonEmpty!47914 (= (arr!37738 _values!996) (store mapRest!47914 mapKey!47914 mapValue!47914))))

(declare-fun bm!59426 () Bool)

(assert (=> bm!59426 (= call!59422 (addStillContains!1043 (ite c!119466 lt!549456 lt!549455) (ite c!119466 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119463 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119466 minValue!944 (ite c!119463 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!101230 res!804309) b!1210707))

(assert (= (and b!1210707 res!804307) b!1210695))

(assert (= (and b!1210695 res!804308) b!1210723))

(assert (= (and b!1210723 res!804297) b!1210702))

(assert (= (and b!1210702 res!804298) b!1210720))

(assert (= (and b!1210720 res!804310) b!1210708))

(assert (= (and b!1210708 res!804311) b!1210713))

(assert (= (and b!1210713 res!804305) b!1210696))

(assert (= (and b!1210696 res!804300) b!1210718))

(assert (= (and b!1210718 res!804306) b!1210704))

(assert (= (and b!1210704 (not res!804296)) b!1210716))

(assert (= (and b!1210716 (not res!804294)) b!1210712))

(assert (= (and b!1210712 c!119464) b!1210724))

(assert (= (and b!1210712 (not c!119464)) b!1210701))

(assert (= (or b!1210724 b!1210701) bm!59421))

(assert (= (or b!1210724 b!1210701) bm!59424))

(assert (= (and b!1210712 (not res!804303)) b!1210721))

(assert (= (and b!1210721 (not res!804295)) b!1210717))

(assert (= (and b!1210717 c!119466) b!1210719))

(assert (= (and b!1210717 (not c!119466)) b!1210700))

(assert (= (and b!1210700 c!119463) b!1210697))

(assert (= (and b!1210700 (not c!119463)) b!1210698))

(assert (= (and b!1210698 c!119465) b!1210711))

(assert (= (and b!1210698 (not c!119465)) b!1210714))

(assert (= (or b!1210697 b!1210711) bm!59420))

(assert (= (or b!1210697 b!1210711) bm!59419))

(assert (= (or b!1210697 b!1210711) bm!59423))

(assert (= (or b!1210719 bm!59423) bm!59422))

(assert (= (or b!1210719 bm!59420) bm!59426))

(assert (= (or b!1210719 bm!59419) bm!59425))

(assert (= (and b!1210717 c!119467) b!1210699))

(assert (= (and b!1210717 (not c!119467)) b!1210709))

(assert (= (and b!1210717 res!804302) b!1210706))

(assert (= (and b!1210717 (not res!804304)) b!1210703))

(assert (= (and b!1210703 (not res!804299)) b!1210722))

(assert (= (and b!1210722 (not res!804301)) b!1210715))

(assert (= (and b!1210705 condMapEmpty!47914) mapIsEmpty!47914))

(assert (= (and b!1210705 (not condMapEmpty!47914)) mapNonEmpty!47914))

(get-info :version)

(assert (= (and mapNonEmpty!47914 ((_ is ValueCellFull!14639) mapValue!47914)) b!1210710))

(assert (= (and b!1210705 ((_ is ValueCellFull!14639) mapDefault!47914)) b!1210725))

(assert (= start!101230 b!1210705))

(declare-fun b_lambda!21587 () Bool)

(assert (=> (not b_lambda!21587) (not b!1210716)))

(declare-fun t!39560 () Bool)

(declare-fun tb!10785 () Bool)

(assert (=> (and start!101230 (= defaultEntry!1004 defaultEntry!1004) t!39560) tb!10785))

(declare-fun result!22171 () Bool)

(assert (=> tb!10785 (= result!22171 tp_is_empty!30697)))

(assert (=> b!1210716 t!39560))

(declare-fun b_and!43071 () Bool)

(assert (= b_and!43069 (and (=> t!39560 result!22171) b_and!43071)))

(declare-fun m!1116717 () Bool)

(assert (=> bm!59422 m!1116717))

(declare-fun m!1116719 () Bool)

(assert (=> b!1210722 m!1116719))

(declare-fun m!1116721 () Bool)

(assert (=> b!1210713 m!1116721))

(declare-fun m!1116723 () Bool)

(assert (=> b!1210708 m!1116723))

(declare-fun m!1116725 () Bool)

(assert (=> bm!59421 m!1116725))

(declare-fun m!1116727 () Bool)

(assert (=> bm!59425 m!1116727))

(declare-fun m!1116729 () Bool)

(assert (=> b!1210719 m!1116729))

(declare-fun m!1116731 () Bool)

(assert (=> b!1210719 m!1116731))

(assert (=> b!1210719 m!1116731))

(declare-fun m!1116733 () Bool)

(assert (=> b!1210719 m!1116733))

(declare-fun m!1116735 () Bool)

(assert (=> b!1210704 m!1116735))

(declare-fun m!1116737 () Bool)

(assert (=> b!1210704 m!1116737))

(declare-fun m!1116739 () Bool)

(assert (=> b!1210712 m!1116739))

(declare-fun m!1116741 () Bool)

(assert (=> b!1210712 m!1116741))

(declare-fun m!1116743 () Bool)

(assert (=> b!1210707 m!1116743))

(declare-fun m!1116745 () Bool)

(assert (=> b!1210721 m!1116745))

(declare-fun m!1116747 () Bool)

(assert (=> b!1210721 m!1116747))

(declare-fun m!1116749 () Bool)

(assert (=> b!1210703 m!1116749))

(declare-fun m!1116751 () Bool)

(assert (=> bm!59426 m!1116751))

(declare-fun m!1116753 () Bool)

(assert (=> b!1210706 m!1116753))

(declare-fun m!1116755 () Bool)

(assert (=> b!1210718 m!1116755))

(declare-fun m!1116757 () Bool)

(assert (=> b!1210716 m!1116757))

(declare-fun m!1116759 () Bool)

(assert (=> b!1210716 m!1116759))

(declare-fun m!1116761 () Bool)

(assert (=> b!1210716 m!1116761))

(declare-fun m!1116763 () Bool)

(assert (=> b!1210716 m!1116763))

(declare-fun m!1116765 () Bool)

(assert (=> b!1210702 m!1116765))

(assert (=> bm!59424 m!1116747))

(declare-fun m!1116767 () Bool)

(assert (=> b!1210723 m!1116767))

(declare-fun m!1116769 () Bool)

(assert (=> start!101230 m!1116769))

(declare-fun m!1116771 () Bool)

(assert (=> start!101230 m!1116771))

(declare-fun m!1116773 () Bool)

(assert (=> b!1210696 m!1116773))

(declare-fun m!1116775 () Bool)

(assert (=> b!1210696 m!1116775))

(declare-fun m!1116777 () Bool)

(assert (=> b!1210715 m!1116777))

(declare-fun m!1116779 () Bool)

(assert (=> b!1210724 m!1116779))

(assert (=> b!1210699 m!1116753))

(declare-fun m!1116781 () Bool)

(assert (=> mapNonEmpty!47914 m!1116781))

(declare-fun m!1116783 () Bool)

(assert (=> b!1210717 m!1116783))

(declare-fun m!1116785 () Bool)

(assert (=> b!1210717 m!1116785))

(declare-fun m!1116787 () Bool)

(assert (=> b!1210717 m!1116787))

(check-sat (not b!1210704) (not b!1210717) (not b!1210715) (not bm!59425) (not b!1210706) (not mapNonEmpty!47914) (not b_next!25993) (not b!1210707) (not bm!59421) (not b!1210712) (not bm!59424) (not bm!59422) (not b!1210708) (not bm!59426) (not b!1210718) (not b!1210723) (not b!1210699) (not b!1210722) (not b!1210721) b_and!43071 (not start!101230) (not b!1210702) (not b!1210716) (not b!1210724) tp_is_empty!30697 (not b!1210719) (not b_lambda!21587) (not b!1210703) (not b!1210696))
(check-sat b_and!43071 (not b_next!25993))
