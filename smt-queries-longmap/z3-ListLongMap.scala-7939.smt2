; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98710 () Bool)

(assert start!98710)

(declare-fun b_free!24079 () Bool)

(declare-fun b_next!24079 () Bool)

(assert (=> start!98710 (= b_free!24079 (not b_next!24079))))

(declare-fun tp!84948 () Bool)

(declare-fun b_and!39009 () Bool)

(assert (=> start!98710 (= tp!84948 b_and!39009)))

(declare-fun b!1140113 () Bool)

(declare-fun e!648815 () Bool)

(declare-fun e!648821 () Bool)

(declare-fun mapRes!44738 () Bool)

(assert (=> b!1140113 (= e!648815 (and e!648821 mapRes!44738))))

(declare-fun condMapEmpty!44738 () Bool)

(declare-datatypes ((V!43273 0))(
  ( (V!43274 (val!14361 Int)) )
))
(declare-datatypes ((ValueCell!13595 0))(
  ( (ValueCellFull!13595 (v!16994 V!43273)) (EmptyCell!13595) )
))
(declare-datatypes ((array!74119 0))(
  ( (array!74120 (arr!35704 (Array (_ BitVec 32) ValueCell!13595)) (size!36241 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74119)

(declare-fun mapDefault!44738 () ValueCell!13595)

(assert (=> b!1140113 (= condMapEmpty!44738 (= (arr!35704 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13595)) mapDefault!44738)))))

(declare-fun b!1140114 () Bool)

(declare-fun res!760138 () Bool)

(declare-fun e!648810 () Bool)

(assert (=> b!1140114 (=> (not res!760138) (not e!648810))))

(declare-datatypes ((array!74121 0))(
  ( (array!74122 (arr!35705 (Array (_ BitVec 32) (_ BitVec 64))) (size!36242 (_ BitVec 32))) )
))
(declare-fun lt!507207 () array!74121)

(declare-datatypes ((List!24924 0))(
  ( (Nil!24921) (Cons!24920 (h!26138 (_ BitVec 64)) (t!35987 List!24924)) )
))
(declare-fun arrayNoDuplicates!0 (array!74121 (_ BitVec 32) List!24924) Bool)

(assert (=> b!1140114 (= res!760138 (arrayNoDuplicates!0 lt!507207 #b00000000000000000000000000000000 Nil!24921))))

(declare-fun b!1140115 () Bool)

(declare-fun res!760141 () Bool)

(declare-fun e!648817 () Bool)

(assert (=> b!1140115 (=> (not res!760141) (not e!648817))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74121)

(assert (=> b!1140115 (= res!760141 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36242 _keys!1208))))))

(declare-fun mapIsEmpty!44738 () Bool)

(assert (=> mapIsEmpty!44738 mapRes!44738))

(declare-fun b!1140116 () Bool)

(declare-datatypes ((Unit!37299 0))(
  ( (Unit!37300) )
))
(declare-fun e!648814 () Unit!37299)

(declare-fun Unit!37301 () Unit!37299)

(assert (=> b!1140116 (= e!648814 Unit!37301)))

(declare-fun lt!507220 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1140117 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!648823 () Bool)

(assert (=> b!1140117 (= e!648823 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507220) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140118 () Bool)

(declare-fun e!648809 () Unit!37299)

(declare-fun lt!507208 () Unit!37299)

(assert (=> b!1140118 (= e!648809 lt!507208)))

(declare-fun call!50562 () Unit!37299)

(assert (=> b!1140118 (= lt!507208 call!50562)))

(declare-fun call!50561 () Bool)

(assert (=> b!1140118 call!50561))

(declare-fun b!1140119 () Bool)

(declare-fun res!760139 () Bool)

(assert (=> b!1140119 (=> (not res!760139) (not e!648817))))

(assert (=> b!1140119 (= res!760139 (= (select (arr!35705 _keys!1208) i!673) k0!934))))

(declare-fun b!1140120 () Bool)

(declare-fun e!648819 () Bool)

(declare-datatypes ((tuple2!18160 0))(
  ( (tuple2!18161 (_1!9091 (_ BitVec 64)) (_2!9091 V!43273)) )
))
(declare-datatypes ((List!24925 0))(
  ( (Nil!24922) (Cons!24921 (h!26139 tuple2!18160) (t!35988 List!24925)) )
))
(declare-datatypes ((ListLongMap!16137 0))(
  ( (ListLongMap!16138 (toList!8084 List!24925)) )
))
(declare-fun call!50559 () ListLongMap!16137)

(declare-fun call!50558 () ListLongMap!16137)

(assert (=> b!1140120 (= e!648819 (= call!50559 call!50558))))

(declare-fun res!760132 () Bool)

(assert (=> start!98710 (=> (not res!760132) (not e!648817))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98710 (= res!760132 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36242 _keys!1208))))))

(assert (=> start!98710 e!648817))

(declare-fun tp_is_empty!28609 () Bool)

(assert (=> start!98710 tp_is_empty!28609))

(declare-fun array_inv!27418 (array!74121) Bool)

(assert (=> start!98710 (array_inv!27418 _keys!1208)))

(assert (=> start!98710 true))

(assert (=> start!98710 tp!84948))

(declare-fun array_inv!27419 (array!74119) Bool)

(assert (=> start!98710 (and (array_inv!27419 _values!996) e!648815)))

(declare-fun zeroValue!944 () V!43273)

(declare-fun c!111967 () Bool)

(declare-fun call!50555 () ListLongMap!16137)

(declare-fun bm!50552 () Bool)

(declare-fun lt!507212 () ListLongMap!16137)

(declare-fun c!111969 () Bool)

(declare-fun minValue!944 () V!43273)

(declare-fun lt!507214 () ListLongMap!16137)

(declare-fun +!3535 (ListLongMap!16137 tuple2!18160) ListLongMap!16137)

(assert (=> bm!50552 (= call!50555 (+!3535 (ite c!111969 lt!507214 lt!507212) (ite c!111969 (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111967 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!507206 () array!74119)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!50553 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4594 (array!74121 array!74119 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) Int) ListLongMap!16137)

(assert (=> bm!50553 (= call!50559 (getCurrentListMapNoExtraKeys!4594 lt!507207 lt!507206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50554 () Bool)

(declare-fun call!50560 () Bool)

(assert (=> bm!50554 (= call!50561 call!50560)))

(declare-fun b!1140121 () Bool)

(declare-fun e!648822 () Bool)

(assert (=> b!1140121 (= e!648822 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36242 _keys!1208))))))

(declare-fun lt!507204 () Unit!37299)

(assert (=> b!1140121 (= lt!507204 e!648814)))

(declare-fun c!111968 () Bool)

(declare-fun contains!6634 (ListLongMap!16137 (_ BitVec 64)) Bool)

(assert (=> b!1140121 (= c!111968 (contains!6634 lt!507212 k0!934))))

(assert (=> b!1140121 (= lt!507212 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140122 () Bool)

(assert (=> b!1140122 (= e!648821 tp_is_empty!28609)))

(declare-fun b!1140123 () Bool)

(declare-fun e!648808 () Unit!37299)

(declare-fun Unit!37302 () Unit!37299)

(assert (=> b!1140123 (= e!648808 Unit!37302)))

(declare-fun b!1140124 () Bool)

(declare-fun arrayContainsKey!0 (array!74121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140124 (= e!648823 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140125 () Bool)

(declare-fun e!648818 () Bool)

(assert (=> b!1140125 (= e!648818 e!648822)))

(declare-fun res!760143 () Bool)

(assert (=> b!1140125 (=> res!760143 e!648822)))

(assert (=> b!1140125 (= res!760143 (not (= (select (arr!35705 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140125 e!648819))

(declare-fun c!111972 () Bool)

(assert (=> b!1140125 (= c!111972 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507213 () Unit!37299)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!479 (array!74121 array!74119 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37299)

(assert (=> b!1140125 (= lt!507213 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50555 () Bool)

(declare-fun call!50556 () Unit!37299)

(assert (=> bm!50555 (= call!50562 call!50556)))

(declare-fun mapNonEmpty!44738 () Bool)

(declare-fun tp!84947 () Bool)

(declare-fun e!648812 () Bool)

(assert (=> mapNonEmpty!44738 (= mapRes!44738 (and tp!84947 e!648812))))

(declare-fun mapKey!44738 () (_ BitVec 32))

(declare-fun mapValue!44738 () ValueCell!13595)

(declare-fun mapRest!44738 () (Array (_ BitVec 32) ValueCell!13595))

(assert (=> mapNonEmpty!44738 (= (arr!35704 _values!996) (store mapRest!44738 mapKey!44738 mapValue!44738))))

(declare-fun b!1140126 () Bool)

(declare-fun e!648816 () Bool)

(assert (=> b!1140126 (= e!648816 e!648818)))

(declare-fun res!760133 () Bool)

(assert (=> b!1140126 (=> res!760133 e!648818)))

(assert (=> b!1140126 (= res!760133 (not (= from!1455 i!673)))))

(declare-fun lt!507217 () ListLongMap!16137)

(assert (=> b!1140126 (= lt!507217 (getCurrentListMapNoExtraKeys!4594 lt!507207 lt!507206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2641 (Int (_ BitVec 64)) V!43273)

(assert (=> b!1140126 (= lt!507206 (array!74120 (store (arr!35704 _values!996) i!673 (ValueCellFull!13595 (dynLambda!2641 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36241 _values!996)))))

(declare-fun lt!507205 () ListLongMap!16137)

(assert (=> b!1140126 (= lt!507205 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140127 () Bool)

(declare-fun -!1219 (ListLongMap!16137 (_ BitVec 64)) ListLongMap!16137)

(assert (=> b!1140127 (= e!648819 (= call!50559 (-!1219 call!50558 k0!934)))))

(declare-fun b!1140128 () Bool)

(declare-fun Unit!37303 () Unit!37299)

(assert (=> b!1140128 (= e!648814 Unit!37303)))

(assert (=> b!1140128 (= lt!507220 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140128 (= c!111969 (and (not lt!507220) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507218 () Unit!37299)

(declare-fun e!648820 () Unit!37299)

(assert (=> b!1140128 (= lt!507218 e!648820)))

(declare-fun lt!507203 () Unit!37299)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!369 (array!74121 array!74119 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 64) (_ BitVec 32) Int) Unit!37299)

(assert (=> b!1140128 (= lt!507203 (lemmaListMapContainsThenArrayContainsFrom!369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111970 () Bool)

(assert (=> b!1140128 (= c!111970 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760134 () Bool)

(assert (=> b!1140128 (= res!760134 e!648823)))

(declare-fun e!648811 () Bool)

(assert (=> b!1140128 (=> (not res!760134) (not e!648811))))

(assert (=> b!1140128 e!648811))

(declare-fun lt!507209 () Unit!37299)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74121 (_ BitVec 32) (_ BitVec 32)) Unit!37299)

(assert (=> b!1140128 (= lt!507209 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140128 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24921)))

(declare-fun lt!507215 () Unit!37299)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74121 (_ BitVec 64) (_ BitVec 32) List!24924) Unit!37299)

(assert (=> b!1140128 (= lt!507215 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24921))))

(assert (=> b!1140128 false))

(declare-fun b!1140129 () Bool)

(assert (=> b!1140129 (= c!111967 (and (not lt!507220) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140129 (= e!648820 e!648809)))

(declare-fun b!1140130 () Bool)

(declare-fun res!760135 () Bool)

(assert (=> b!1140130 (=> (not res!760135) (not e!648817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140130 (= res!760135 (validKeyInArray!0 k0!934))))

(declare-fun call!50557 () ListLongMap!16137)

(declare-fun bm!50556 () Bool)

(assert (=> bm!50556 (= call!50560 (contains!6634 (ite c!111969 lt!507214 call!50557) k0!934))))

(declare-fun b!1140131 () Bool)

(assert (=> b!1140131 (contains!6634 call!50555 k0!934)))

(declare-fun lt!507211 () Unit!37299)

(assert (=> b!1140131 (= lt!507211 call!50556)))

(assert (=> b!1140131 call!50560))

(assert (=> b!1140131 (= lt!507214 (+!3535 lt!507212 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507210 () Unit!37299)

(declare-fun addStillContains!763 (ListLongMap!16137 (_ BitVec 64) V!43273 (_ BitVec 64)) Unit!37299)

(assert (=> b!1140131 (= lt!507210 (addStillContains!763 lt!507212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140131 (= e!648820 lt!507211)))

(declare-fun b!1140132 () Bool)

(assert (=> b!1140132 (= e!648817 e!648810)))

(declare-fun res!760136 () Bool)

(assert (=> b!1140132 (=> (not res!760136) (not e!648810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74121 (_ BitVec 32)) Bool)

(assert (=> b!1140132 (= res!760136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507207 mask!1564))))

(assert (=> b!1140132 (= lt!507207 (array!74122 (store (arr!35705 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36242 _keys!1208)))))

(declare-fun b!1140133 () Bool)

(assert (=> b!1140133 (= e!648809 e!648808)))

(declare-fun c!111971 () Bool)

(assert (=> b!1140133 (= c!111971 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507220))))

(declare-fun bm!50557 () Bool)

(assert (=> bm!50557 (= call!50556 (addStillContains!763 (ite c!111969 lt!507214 lt!507212) (ite c!111969 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111967 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111969 minValue!944 (ite c!111967 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140134 () Bool)

(assert (=> b!1140134 (= e!648812 tp_is_empty!28609)))

(declare-fun b!1140135 () Bool)

(declare-fun res!760140 () Bool)

(assert (=> b!1140135 (=> (not res!760140) (not e!648817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140135 (= res!760140 (validMask!0 mask!1564))))

(declare-fun b!1140136 () Bool)

(assert (=> b!1140136 call!50561))

(declare-fun lt!507219 () Unit!37299)

(assert (=> b!1140136 (= lt!507219 call!50562)))

(assert (=> b!1140136 (= e!648808 lt!507219)))

(declare-fun b!1140137 () Bool)

(assert (=> b!1140137 (= e!648810 (not e!648816))))

(declare-fun res!760131 () Bool)

(assert (=> b!1140137 (=> res!760131 e!648816)))

(assert (=> b!1140137 (= res!760131 (bvsgt from!1455 i!673))))

(assert (=> b!1140137 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507216 () Unit!37299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74121 (_ BitVec 64) (_ BitVec 32)) Unit!37299)

(assert (=> b!1140137 (= lt!507216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50558 () Bool)

(assert (=> bm!50558 (= call!50558 (getCurrentListMapNoExtraKeys!4594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140138 () Bool)

(declare-fun res!760142 () Bool)

(assert (=> b!1140138 (=> (not res!760142) (not e!648817))))

(assert (=> b!1140138 (= res!760142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140139 () Bool)

(declare-fun res!760137 () Bool)

(assert (=> b!1140139 (=> (not res!760137) (not e!648817))))

(assert (=> b!1140139 (= res!760137 (and (= (size!36241 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36242 _keys!1208) (size!36241 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50559 () Bool)

(assert (=> bm!50559 (= call!50557 call!50555)))

(declare-fun b!1140140 () Bool)

(assert (=> b!1140140 (= e!648811 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140141 () Bool)

(declare-fun res!760130 () Bool)

(assert (=> b!1140141 (=> (not res!760130) (not e!648817))))

(assert (=> b!1140141 (= res!760130 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24921))))

(assert (= (and start!98710 res!760132) b!1140135))

(assert (= (and b!1140135 res!760140) b!1140139))

(assert (= (and b!1140139 res!760137) b!1140138))

(assert (= (and b!1140138 res!760142) b!1140141))

(assert (= (and b!1140141 res!760130) b!1140115))

(assert (= (and b!1140115 res!760141) b!1140130))

(assert (= (and b!1140130 res!760135) b!1140119))

(assert (= (and b!1140119 res!760139) b!1140132))

(assert (= (and b!1140132 res!760136) b!1140114))

(assert (= (and b!1140114 res!760138) b!1140137))

(assert (= (and b!1140137 (not res!760131)) b!1140126))

(assert (= (and b!1140126 (not res!760133)) b!1140125))

(assert (= (and b!1140125 c!111972) b!1140127))

(assert (= (and b!1140125 (not c!111972)) b!1140120))

(assert (= (or b!1140127 b!1140120) bm!50553))

(assert (= (or b!1140127 b!1140120) bm!50558))

(assert (= (and b!1140125 (not res!760143)) b!1140121))

(assert (= (and b!1140121 c!111968) b!1140128))

(assert (= (and b!1140121 (not c!111968)) b!1140116))

(assert (= (and b!1140128 c!111969) b!1140131))

(assert (= (and b!1140128 (not c!111969)) b!1140129))

(assert (= (and b!1140129 c!111967) b!1140118))

(assert (= (and b!1140129 (not c!111967)) b!1140133))

(assert (= (and b!1140133 c!111971) b!1140136))

(assert (= (and b!1140133 (not c!111971)) b!1140123))

(assert (= (or b!1140118 b!1140136) bm!50555))

(assert (= (or b!1140118 b!1140136) bm!50559))

(assert (= (or b!1140118 b!1140136) bm!50554))

(assert (= (or b!1140131 bm!50554) bm!50556))

(assert (= (or b!1140131 bm!50555) bm!50557))

(assert (= (or b!1140131 bm!50559) bm!50552))

(assert (= (and b!1140128 c!111970) b!1140124))

(assert (= (and b!1140128 (not c!111970)) b!1140117))

(assert (= (and b!1140128 res!760134) b!1140140))

(assert (= (and b!1140113 condMapEmpty!44738) mapIsEmpty!44738))

(assert (= (and b!1140113 (not condMapEmpty!44738)) mapNonEmpty!44738))

(get-info :version)

(assert (= (and mapNonEmpty!44738 ((_ is ValueCellFull!13595) mapValue!44738)) b!1140134))

(assert (= (and b!1140113 ((_ is ValueCellFull!13595) mapDefault!44738)) b!1140122))

(assert (= start!98710 b!1140113))

(declare-fun b_lambda!19179 () Bool)

(assert (=> (not b_lambda!19179) (not b!1140126)))

(declare-fun t!35986 () Bool)

(declare-fun tb!8883 () Bool)

(assert (=> (and start!98710 (= defaultEntry!1004 defaultEntry!1004) t!35986) tb!8883))

(declare-fun result!18339 () Bool)

(assert (=> tb!8883 (= result!18339 tp_is_empty!28609)))

(assert (=> b!1140126 t!35986))

(declare-fun b_and!39011 () Bool)

(assert (= b_and!39009 (and (=> t!35986 result!18339) b_and!39011)))

(declare-fun m!1052163 () Bool)

(assert (=> b!1140138 m!1052163))

(declare-fun m!1052165 () Bool)

(assert (=> bm!50552 m!1052165))

(declare-fun m!1052167 () Bool)

(assert (=> mapNonEmpty!44738 m!1052167))

(declare-fun m!1052169 () Bool)

(assert (=> b!1140135 m!1052169))

(declare-fun m!1052171 () Bool)

(assert (=> bm!50553 m!1052171))

(declare-fun m!1052173 () Bool)

(assert (=> b!1140126 m!1052173))

(declare-fun m!1052175 () Bool)

(assert (=> b!1140126 m!1052175))

(declare-fun m!1052177 () Bool)

(assert (=> b!1140126 m!1052177))

(declare-fun m!1052179 () Bool)

(assert (=> b!1140126 m!1052179))

(declare-fun m!1052181 () Bool)

(assert (=> b!1140127 m!1052181))

(declare-fun m!1052183 () Bool)

(assert (=> start!98710 m!1052183))

(declare-fun m!1052185 () Bool)

(assert (=> start!98710 m!1052185))

(declare-fun m!1052187 () Bool)

(assert (=> bm!50557 m!1052187))

(declare-fun m!1052189 () Bool)

(assert (=> b!1140131 m!1052189))

(declare-fun m!1052191 () Bool)

(assert (=> b!1140131 m!1052191))

(declare-fun m!1052193 () Bool)

(assert (=> b!1140131 m!1052193))

(declare-fun m!1052195 () Bool)

(assert (=> b!1140124 m!1052195))

(declare-fun m!1052197 () Bool)

(assert (=> b!1140125 m!1052197))

(declare-fun m!1052199 () Bool)

(assert (=> b!1140125 m!1052199))

(declare-fun m!1052201 () Bool)

(assert (=> b!1140121 m!1052201))

(declare-fun m!1052203 () Bool)

(assert (=> b!1140121 m!1052203))

(assert (=> bm!50558 m!1052203))

(declare-fun m!1052205 () Bool)

(assert (=> b!1140128 m!1052205))

(declare-fun m!1052207 () Bool)

(assert (=> b!1140128 m!1052207))

(declare-fun m!1052209 () Bool)

(assert (=> b!1140128 m!1052209))

(declare-fun m!1052211 () Bool)

(assert (=> b!1140128 m!1052211))

(declare-fun m!1052213 () Bool)

(assert (=> b!1140137 m!1052213))

(declare-fun m!1052215 () Bool)

(assert (=> b!1140137 m!1052215))

(declare-fun m!1052217 () Bool)

(assert (=> b!1140130 m!1052217))

(declare-fun m!1052219 () Bool)

(assert (=> b!1140132 m!1052219))

(declare-fun m!1052221 () Bool)

(assert (=> b!1140132 m!1052221))

(assert (=> b!1140140 m!1052195))

(declare-fun m!1052223 () Bool)

(assert (=> b!1140141 m!1052223))

(declare-fun m!1052225 () Bool)

(assert (=> bm!50556 m!1052225))

(declare-fun m!1052227 () Bool)

(assert (=> b!1140119 m!1052227))

(declare-fun m!1052229 () Bool)

(assert (=> b!1140114 m!1052229))

(check-sat (not b!1140128) (not b!1140131) (not b!1140130) (not bm!50557) (not b!1140137) (not b!1140124) (not b!1140141) (not bm!50556) (not b_next!24079) (not bm!50552) tp_is_empty!28609 (not b!1140132) (not b!1140121) (not b!1140140) (not b!1140135) (not b!1140126) (not b_lambda!19179) (not start!98710) (not b!1140127) (not bm!50558) (not b!1140114) b_and!39011 (not bm!50553) (not b!1140125) (not mapNonEmpty!44738) (not b!1140138))
(check-sat b_and!39011 (not b_next!24079))
