; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98456 () Bool)

(assert start!98456)

(declare-fun b_free!24067 () Bool)

(declare-fun b_next!24067 () Bool)

(assert (=> start!98456 (= b_free!24067 (not b_next!24067))))

(declare-fun tp!84912 () Bool)

(declare-fun b_and!38961 () Bool)

(assert (=> start!98456 (= tp!84912 b_and!38961)))

(declare-fun mapIsEmpty!44720 () Bool)

(declare-fun mapRes!44720 () Bool)

(assert (=> mapIsEmpty!44720 mapRes!44720))

(declare-datatypes ((array!73976 0))(
  ( (array!73977 (arr!35639 (Array (_ BitVec 32) (_ BitVec 64))) (size!36177 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73976)

(declare-fun b!1138167 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!647621 () Bool)

(declare-fun arrayContainsKey!0 (array!73976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138167 (= e!647621 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138168 () Bool)

(declare-fun e!647613 () Bool)

(declare-fun e!647620 () Bool)

(assert (=> b!1138168 (= e!647613 (not e!647620))))

(declare-fun res!759304 () Bool)

(assert (=> b!1138168 (=> res!759304 e!647620)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138168 (= res!759304 (bvsgt from!1455 i!673))))

(assert (=> b!1138168 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37143 0))(
  ( (Unit!37144) )
))
(declare-fun lt!506211 () Unit!37143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73976 (_ BitVec 64) (_ BitVec 32)) Unit!37143)

(assert (=> b!1138168 (= lt!506211 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138169 () Bool)

(declare-fun e!647625 () Bool)

(declare-datatypes ((V!43257 0))(
  ( (V!43258 (val!14355 Int)) )
))
(declare-datatypes ((tuple2!18224 0))(
  ( (tuple2!18225 (_1!9123 (_ BitVec 64)) (_2!9123 V!43257)) )
))
(declare-datatypes ((List!24964 0))(
  ( (Nil!24961) (Cons!24960 (h!26169 tuple2!18224) (t!36014 List!24964)) )
))
(declare-datatypes ((ListLongMap!16193 0))(
  ( (ListLongMap!16194 (toList!8112 List!24964)) )
))
(declare-fun call!50329 () ListLongMap!16193)

(declare-fun call!50324 () ListLongMap!16193)

(assert (=> b!1138169 (= e!647625 (= call!50329 call!50324))))

(declare-fun b!1138170 () Bool)

(declare-fun res!759307 () Bool)

(declare-fun e!647622 () Bool)

(assert (=> b!1138170 (=> (not res!759307) (not e!647622))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13589 0))(
  ( (ValueCellFull!13589 (v!16991 V!43257)) (EmptyCell!13589) )
))
(declare-datatypes ((array!73978 0))(
  ( (array!73979 (arr!35640 (Array (_ BitVec 32) ValueCell!13589)) (size!36178 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73978)

(assert (=> b!1138170 (= res!759307 (and (= (size!36178 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36177 _keys!1208) (size!36178 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138171 () Bool)

(declare-fun c!111439 () Bool)

(declare-fun lt!506217 () Bool)

(assert (=> b!1138171 (= c!111439 (and (not lt!506217) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647618 () Unit!37143)

(declare-fun e!647617 () Unit!37143)

(assert (=> b!1138171 (= e!647618 e!647617)))

(declare-fun b!1138172 () Bool)

(declare-fun res!759317 () Bool)

(assert (=> b!1138172 (=> (not res!759317) (not e!647622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138172 (= res!759317 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44720 () Bool)

(declare-fun tp!84911 () Bool)

(declare-fun e!647619 () Bool)

(assert (=> mapNonEmpty!44720 (= mapRes!44720 (and tp!84911 e!647619))))

(declare-fun mapRest!44720 () (Array (_ BitVec 32) ValueCell!13589))

(declare-fun mapValue!44720 () ValueCell!13589)

(declare-fun mapKey!44720 () (_ BitVec 32))

(assert (=> mapNonEmpty!44720 (= (arr!35640 _values!996) (store mapRest!44720 mapKey!44720 mapValue!44720))))

(declare-fun b!1138173 () Bool)

(declare-fun e!647615 () Bool)

(assert (=> b!1138173 (= e!647615 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138174 () Bool)

(declare-fun e!647610 () Bool)

(declare-fun e!647624 () Bool)

(assert (=> b!1138174 (= e!647610 e!647624)))

(declare-fun res!759315 () Bool)

(assert (=> b!1138174 (=> res!759315 e!647624)))

(assert (=> b!1138174 (= res!759315 (not (= (select (arr!35639 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138174 e!647625))

(declare-fun c!111438 () Bool)

(assert (=> b!1138174 (= c!111438 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43257)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43257)

(declare-fun lt!506216 () Unit!37143)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!487 (array!73976 array!73978 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37143)

(assert (=> b!1138174 (= lt!506216 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111440 () Bool)

(declare-fun call!50323 () ListLongMap!16193)

(declare-fun call!50325 () Bool)

(declare-fun bm!50320 () Bool)

(declare-fun lt!506213 () ListLongMap!16193)

(declare-fun contains!6585 (ListLongMap!16193 (_ BitVec 64)) Bool)

(assert (=> bm!50320 (= call!50325 (contains!6585 (ite c!111440 lt!506213 call!50323) k0!934))))

(declare-fun lt!506208 () array!73976)

(declare-fun lt!506205 () array!73978)

(declare-fun bm!50321 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4607 (array!73976 array!73978 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 32) Int) ListLongMap!16193)

(assert (=> bm!50321 (= call!50324 (getCurrentListMapNoExtraKeys!4607 (ite c!111438 lt!506208 _keys!1208) (ite c!111438 lt!506205 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138175 () Bool)

(declare-fun call!50327 () Bool)

(assert (=> b!1138175 call!50327))

(declare-fun lt!506203 () Unit!37143)

(declare-fun call!50328 () Unit!37143)

(assert (=> b!1138175 (= lt!506203 call!50328)))

(declare-fun e!647614 () Unit!37143)

(assert (=> b!1138175 (= e!647614 lt!506203)))

(declare-fun b!1138176 () Bool)

(declare-fun -!1202 (ListLongMap!16193 (_ BitVec 64)) ListLongMap!16193)

(assert (=> b!1138176 (= e!647625 (= call!50324 (-!1202 call!50329 k0!934)))))

(declare-fun b!1138177 () Bool)

(declare-fun lt!506204 () Unit!37143)

(assert (=> b!1138177 (= e!647617 lt!506204)))

(assert (=> b!1138177 (= lt!506204 call!50328)))

(assert (=> b!1138177 call!50327))

(declare-fun b!1138178 () Bool)

(declare-fun res!759305 () Bool)

(assert (=> b!1138178 (=> (not res!759305) (not e!647622))))

(assert (=> b!1138178 (= res!759305 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36177 _keys!1208))))))

(declare-fun b!1138179 () Bool)

(declare-fun call!50326 () ListLongMap!16193)

(assert (=> b!1138179 (contains!6585 call!50326 k0!934)))

(declare-fun lt!506214 () Unit!37143)

(declare-fun call!50330 () Unit!37143)

(assert (=> b!1138179 (= lt!506214 call!50330)))

(assert (=> b!1138179 call!50325))

(declare-fun lt!506209 () ListLongMap!16193)

(declare-fun +!3540 (ListLongMap!16193 tuple2!18224) ListLongMap!16193)

(assert (=> b!1138179 (= lt!506213 (+!3540 lt!506209 (tuple2!18225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506206 () Unit!37143)

(declare-fun addStillContains!759 (ListLongMap!16193 (_ BitVec 64) V!43257 (_ BitVec 64)) Unit!37143)

(assert (=> b!1138179 (= lt!506206 (addStillContains!759 lt!506209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1138179 (= e!647618 lt!506214)))

(declare-fun b!1138180 () Bool)

(assert (=> b!1138180 (= e!647620 e!647610)))

(declare-fun res!759308 () Bool)

(assert (=> b!1138180 (=> res!759308 e!647610)))

(assert (=> b!1138180 (= res!759308 (not (= from!1455 i!673)))))

(declare-fun lt!506207 () ListLongMap!16193)

(assert (=> b!1138180 (= lt!506207 (getCurrentListMapNoExtraKeys!4607 lt!506208 lt!506205 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2596 (Int (_ BitVec 64)) V!43257)

(assert (=> b!1138180 (= lt!506205 (array!73979 (store (arr!35640 _values!996) i!673 (ValueCellFull!13589 (dynLambda!2596 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36178 _values!996)))))

(declare-fun lt!506219 () ListLongMap!16193)

(assert (=> b!1138180 (= lt!506219 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50322 () Bool)

(assert (=> bm!50322 (= call!50328 call!50330)))

(declare-fun b!1138181 () Bool)

(declare-fun res!759316 () Bool)

(assert (=> b!1138181 (=> (not res!759316) (not e!647622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73976 (_ BitVec 32)) Bool)

(assert (=> b!1138181 (= res!759316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50323 () Bool)

(assert (=> bm!50323 (= call!50326 (+!3540 (ite c!111440 lt!506213 lt!506209) (ite c!111440 (tuple2!18225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111439 (tuple2!18225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!759309 () Bool)

(assert (=> start!98456 (=> (not res!759309) (not e!647622))))

(assert (=> start!98456 (= res!759309 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36177 _keys!1208))))))

(assert (=> start!98456 e!647622))

(declare-fun tp_is_empty!28597 () Bool)

(assert (=> start!98456 tp_is_empty!28597))

(declare-fun array_inv!27392 (array!73976) Bool)

(assert (=> start!98456 (array_inv!27392 _keys!1208)))

(assert (=> start!98456 true))

(assert (=> start!98456 tp!84912))

(declare-fun e!647616 () Bool)

(declare-fun array_inv!27393 (array!73978) Bool)

(assert (=> start!98456 (and (array_inv!27393 _values!996) e!647616)))

(declare-fun b!1138166 () Bool)

(declare-fun Unit!37145 () Unit!37143)

(assert (=> b!1138166 (= e!647614 Unit!37145)))

(declare-fun b!1138182 () Bool)

(declare-fun e!647611 () Bool)

(assert (=> b!1138182 (= e!647616 (and e!647611 mapRes!44720))))

(declare-fun condMapEmpty!44720 () Bool)

(declare-fun mapDefault!44720 () ValueCell!13589)

(assert (=> b!1138182 (= condMapEmpty!44720 (= (arr!35640 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13589)) mapDefault!44720)))))

(declare-fun b!1138183 () Bool)

(assert (=> b!1138183 (= e!647611 tp_is_empty!28597)))

(declare-fun b!1138184 () Bool)

(declare-fun e!647623 () Unit!37143)

(declare-fun Unit!37146 () Unit!37143)

(assert (=> b!1138184 (= e!647623 Unit!37146)))

(assert (=> b!1138184 (= lt!506217 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138184 (= c!111440 (and (not lt!506217) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506220 () Unit!37143)

(assert (=> b!1138184 (= lt!506220 e!647618)))

(declare-fun lt!506215 () Unit!37143)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!364 (array!73976 array!73978 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 64) (_ BitVec 32) Int) Unit!37143)

(assert (=> b!1138184 (= lt!506215 (lemmaListMapContainsThenArrayContainsFrom!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111436 () Bool)

(assert (=> b!1138184 (= c!111436 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759314 () Bool)

(assert (=> b!1138184 (= res!759314 e!647615)))

(assert (=> b!1138184 (=> (not res!759314) (not e!647621))))

(assert (=> b!1138184 e!647621))

(declare-fun lt!506218 () Unit!37143)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73976 (_ BitVec 32) (_ BitVec 32)) Unit!37143)

(assert (=> b!1138184 (= lt!506218 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24965 0))(
  ( (Nil!24962) (Cons!24961 (h!26170 (_ BitVec 64)) (t!36015 List!24965)) )
))
(declare-fun arrayNoDuplicates!0 (array!73976 (_ BitVec 32) List!24965) Bool)

(assert (=> b!1138184 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24962)))

(declare-fun lt!506210 () Unit!37143)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73976 (_ BitVec 64) (_ BitVec 32) List!24965) Unit!37143)

(assert (=> b!1138184 (= lt!506210 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24962))))

(assert (=> b!1138184 false))

(declare-fun bm!50324 () Bool)

(assert (=> bm!50324 (= call!50323 call!50326)))

(declare-fun b!1138185 () Bool)

(assert (=> b!1138185 (= e!647619 tp_is_empty!28597)))

(declare-fun bm!50325 () Bool)

(assert (=> bm!50325 (= call!50330 (addStillContains!759 (ite c!111440 lt!506213 lt!506209) (ite c!111440 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111439 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111440 minValue!944 (ite c!111439 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1138186 () Bool)

(declare-fun Unit!37147 () Unit!37143)

(assert (=> b!1138186 (= e!647623 Unit!37147)))

(declare-fun bm!50326 () Bool)

(assert (=> bm!50326 (= call!50329 (getCurrentListMapNoExtraKeys!4607 (ite c!111438 _keys!1208 lt!506208) (ite c!111438 _values!996 lt!506205) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138187 () Bool)

(assert (=> b!1138187 (= e!647615 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506217) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!50327 () Bool)

(assert (=> bm!50327 (= call!50327 call!50325)))

(declare-fun b!1138188 () Bool)

(assert (=> b!1138188 (= e!647617 e!647614)))

(declare-fun c!111435 () Bool)

(assert (=> b!1138188 (= c!111435 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506217))))

(declare-fun b!1138189 () Bool)

(declare-fun res!759313 () Bool)

(assert (=> b!1138189 (=> (not res!759313) (not e!647613))))

(assert (=> b!1138189 (= res!759313 (arrayNoDuplicates!0 lt!506208 #b00000000000000000000000000000000 Nil!24962))))

(declare-fun b!1138190 () Bool)

(declare-fun res!759312 () Bool)

(assert (=> b!1138190 (=> (not res!759312) (not e!647622))))

(assert (=> b!1138190 (= res!759312 (= (select (arr!35639 _keys!1208) i!673) k0!934))))

(declare-fun b!1138191 () Bool)

(declare-fun res!759306 () Bool)

(assert (=> b!1138191 (=> (not res!759306) (not e!647622))))

(assert (=> b!1138191 (= res!759306 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24962))))

(declare-fun b!1138192 () Bool)

(assert (=> b!1138192 (= e!647624 true)))

(declare-fun lt!506212 () Unit!37143)

(assert (=> b!1138192 (= lt!506212 e!647623)))

(declare-fun c!111437 () Bool)

(assert (=> b!1138192 (= c!111437 (contains!6585 lt!506209 k0!934))))

(assert (=> b!1138192 (= lt!506209 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138193 () Bool)

(declare-fun res!759311 () Bool)

(assert (=> b!1138193 (=> (not res!759311) (not e!647622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138193 (= res!759311 (validMask!0 mask!1564))))

(declare-fun b!1138194 () Bool)

(assert (=> b!1138194 (= e!647622 e!647613)))

(declare-fun res!759310 () Bool)

(assert (=> b!1138194 (=> (not res!759310) (not e!647613))))

(assert (=> b!1138194 (= res!759310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506208 mask!1564))))

(assert (=> b!1138194 (= lt!506208 (array!73977 (store (arr!35639 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36177 _keys!1208)))))

(assert (= (and start!98456 res!759309) b!1138193))

(assert (= (and b!1138193 res!759311) b!1138170))

(assert (= (and b!1138170 res!759307) b!1138181))

(assert (= (and b!1138181 res!759316) b!1138191))

(assert (= (and b!1138191 res!759306) b!1138178))

(assert (= (and b!1138178 res!759305) b!1138172))

(assert (= (and b!1138172 res!759317) b!1138190))

(assert (= (and b!1138190 res!759312) b!1138194))

(assert (= (and b!1138194 res!759310) b!1138189))

(assert (= (and b!1138189 res!759313) b!1138168))

(assert (= (and b!1138168 (not res!759304)) b!1138180))

(assert (= (and b!1138180 (not res!759308)) b!1138174))

(assert (= (and b!1138174 c!111438) b!1138176))

(assert (= (and b!1138174 (not c!111438)) b!1138169))

(assert (= (or b!1138176 b!1138169) bm!50326))

(assert (= (or b!1138176 b!1138169) bm!50321))

(assert (= (and b!1138174 (not res!759315)) b!1138192))

(assert (= (and b!1138192 c!111437) b!1138184))

(assert (= (and b!1138192 (not c!111437)) b!1138186))

(assert (= (and b!1138184 c!111440) b!1138179))

(assert (= (and b!1138184 (not c!111440)) b!1138171))

(assert (= (and b!1138171 c!111439) b!1138177))

(assert (= (and b!1138171 (not c!111439)) b!1138188))

(assert (= (and b!1138188 c!111435) b!1138175))

(assert (= (and b!1138188 (not c!111435)) b!1138166))

(assert (= (or b!1138177 b!1138175) bm!50322))

(assert (= (or b!1138177 b!1138175) bm!50324))

(assert (= (or b!1138177 b!1138175) bm!50327))

(assert (= (or b!1138179 bm!50327) bm!50320))

(assert (= (or b!1138179 bm!50322) bm!50325))

(assert (= (or b!1138179 bm!50324) bm!50323))

(assert (= (and b!1138184 c!111436) b!1138173))

(assert (= (and b!1138184 (not c!111436)) b!1138187))

(assert (= (and b!1138184 res!759314) b!1138167))

(assert (= (and b!1138182 condMapEmpty!44720) mapIsEmpty!44720))

(assert (= (and b!1138182 (not condMapEmpty!44720)) mapNonEmpty!44720))

(get-info :version)

(assert (= (and mapNonEmpty!44720 ((_ is ValueCellFull!13589) mapValue!44720)) b!1138185))

(assert (= (and b!1138182 ((_ is ValueCellFull!13589) mapDefault!44720)) b!1138183))

(assert (= start!98456 b!1138182))

(declare-fun b_lambda!19155 () Bool)

(assert (=> (not b_lambda!19155) (not b!1138180)))

(declare-fun t!36013 () Bool)

(declare-fun tb!8871 () Bool)

(assert (=> (and start!98456 (= defaultEntry!1004 defaultEntry!1004) t!36013) tb!8871))

(declare-fun result!18315 () Bool)

(assert (=> tb!8871 (= result!18315 tp_is_empty!28597)))

(assert (=> b!1138180 t!36013))

(declare-fun b_and!38963 () Bool)

(assert (= b_and!38961 (and (=> t!36013 result!18315) b_and!38963)))

(declare-fun m!1049577 () Bool)

(assert (=> b!1138191 m!1049577))

(declare-fun m!1049579 () Bool)

(assert (=> b!1138193 m!1049579))

(declare-fun m!1049581 () Bool)

(assert (=> b!1138168 m!1049581))

(declare-fun m!1049583 () Bool)

(assert (=> b!1138168 m!1049583))

(declare-fun m!1049585 () Bool)

(assert (=> b!1138167 m!1049585))

(declare-fun m!1049587 () Bool)

(assert (=> start!98456 m!1049587))

(declare-fun m!1049589 () Bool)

(assert (=> start!98456 m!1049589))

(declare-fun m!1049591 () Bool)

(assert (=> b!1138192 m!1049591))

(declare-fun m!1049593 () Bool)

(assert (=> b!1138192 m!1049593))

(declare-fun m!1049595 () Bool)

(assert (=> bm!50325 m!1049595))

(declare-fun m!1049597 () Bool)

(assert (=> b!1138184 m!1049597))

(declare-fun m!1049599 () Bool)

(assert (=> b!1138184 m!1049599))

(declare-fun m!1049601 () Bool)

(assert (=> b!1138184 m!1049601))

(declare-fun m!1049603 () Bool)

(assert (=> b!1138184 m!1049603))

(declare-fun m!1049605 () Bool)

(assert (=> b!1138176 m!1049605))

(declare-fun m!1049607 () Bool)

(assert (=> b!1138190 m!1049607))

(assert (=> b!1138173 m!1049585))

(declare-fun m!1049609 () Bool)

(assert (=> bm!50323 m!1049609))

(declare-fun m!1049611 () Bool)

(assert (=> b!1138181 m!1049611))

(declare-fun m!1049613 () Bool)

(assert (=> b!1138172 m!1049613))

(declare-fun m!1049615 () Bool)

(assert (=> bm!50320 m!1049615))

(declare-fun m!1049617 () Bool)

(assert (=> b!1138179 m!1049617))

(declare-fun m!1049619 () Bool)

(assert (=> b!1138179 m!1049619))

(declare-fun m!1049621 () Bool)

(assert (=> b!1138179 m!1049621))

(declare-fun m!1049623 () Bool)

(assert (=> bm!50321 m!1049623))

(declare-fun m!1049625 () Bool)

(assert (=> b!1138174 m!1049625))

(declare-fun m!1049627 () Bool)

(assert (=> b!1138174 m!1049627))

(declare-fun m!1049629 () Bool)

(assert (=> b!1138180 m!1049629))

(declare-fun m!1049631 () Bool)

(assert (=> b!1138180 m!1049631))

(declare-fun m!1049633 () Bool)

(assert (=> b!1138180 m!1049633))

(declare-fun m!1049635 () Bool)

(assert (=> b!1138180 m!1049635))

(declare-fun m!1049637 () Bool)

(assert (=> b!1138194 m!1049637))

(declare-fun m!1049639 () Bool)

(assert (=> b!1138194 m!1049639))

(declare-fun m!1049641 () Bool)

(assert (=> b!1138189 m!1049641))

(declare-fun m!1049643 () Bool)

(assert (=> mapNonEmpty!44720 m!1049643))

(declare-fun m!1049645 () Bool)

(assert (=> bm!50326 m!1049645))

(check-sat (not b!1138179) (not b_next!24067) (not bm!50326) (not b!1138191) (not b!1138181) (not b!1138167) (not b!1138184) (not b_lambda!19155) (not bm!50325) (not bm!50323) (not b!1138189) (not b!1138176) (not b!1138174) (not b!1138192) b_and!38963 (not b!1138173) (not b!1138194) (not b!1138168) (not mapNonEmpty!44720) (not b!1138180) (not bm!50320) (not b!1138172) (not bm!50321) (not start!98456) tp_is_empty!28597 (not b!1138193))
(check-sat b_and!38963 (not b_next!24067))
