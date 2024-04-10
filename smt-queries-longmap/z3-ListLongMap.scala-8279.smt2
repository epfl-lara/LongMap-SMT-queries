; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100776 () Bool)

(assert start!100776)

(declare-fun b_free!25947 () Bool)

(declare-fun b_next!25947 () Bool)

(assert (=> start!100776 (= b_free!25947 (not b_next!25947))))

(declare-fun tp!90844 () Bool)

(declare-fun b_and!42877 () Bool)

(assert (=> start!100776 (= tp!90844 b_and!42877)))

(declare-fun b!1206295 () Bool)

(declare-fun e!685036 () Bool)

(declare-datatypes ((array!78083 0))(
  ( (array!78084 (arr!37682 (Array (_ BitVec 32) (_ BitVec 64))) (size!38218 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78083)

(assert (=> b!1206295 (= e!685036 (bvslt (size!38218 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((List!26539 0))(
  ( (Nil!26536) (Cons!26535 (h!27744 (_ BitVec 64)) (t!39466 List!26539)) )
))
(declare-fun arrayNoDuplicates!0 (array!78083 (_ BitVec 32) List!26539) Bool)

(assert (=> b!1206295 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26536)))

(declare-datatypes ((Unit!39990 0))(
  ( (Unit!39991) )
))
(declare-fun lt!547195 () Unit!39990)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78083 (_ BitVec 32) (_ BitVec 32)) Unit!39990)

(assert (=> b!1206295 (= lt!547195 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!685039 () Bool)

(assert (=> b!1206295 e!685039))

(declare-fun res!802251 () Bool)

(assert (=> b!1206295 (=> (not res!802251) (not e!685039))))

(declare-fun e!685037 () Bool)

(assert (=> b!1206295 (= res!802251 e!685037)))

(declare-fun c!118430 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1206295 (= c!118430 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!45995 0))(
  ( (V!45996 (val!15382 Int)) )
))
(declare-fun zeroValue!944 () V!45995)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!547197 () Unit!39990)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14616 0))(
  ( (ValueCellFull!14616 (v!18026 V!45995)) (EmptyCell!14616) )
))
(declare-datatypes ((array!78085 0))(
  ( (array!78086 (arr!37683 (Array (_ BitVec 32) ValueCell!14616)) (size!38219 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78085)

(declare-fun minValue!944 () V!45995)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!573 (array!78083 array!78085 (_ BitVec 32) (_ BitVec 32) V!45995 V!45995 (_ BitVec 64) (_ BitVec 32) Int) Unit!39990)

(assert (=> b!1206295 (= lt!547197 (lemmaListMapContainsThenArrayContainsFrom!573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547208 () Unit!39990)

(declare-fun e!685033 () Unit!39990)

(assert (=> b!1206295 (= lt!547208 e!685033)))

(declare-fun c!118434 () Bool)

(declare-fun lt!547199 () Bool)

(assert (=> b!1206295 (= c!118434 (and (not lt!547199) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206295 (= lt!547199 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206296 () Bool)

(declare-fun e!685043 () Unit!39990)

(assert (=> b!1206296 (= e!685033 e!685043)))

(declare-fun c!118431 () Bool)

(assert (=> b!1206296 (= c!118431 (and (not lt!547199) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!19736 0))(
  ( (tuple2!19737 (_1!9879 (_ BitVec 64)) (_2!9879 V!45995)) )
))
(declare-datatypes ((List!26540 0))(
  ( (Nil!26537) (Cons!26536 (h!27745 tuple2!19736) (t!39467 List!26540)) )
))
(declare-datatypes ((ListLongMap!17705 0))(
  ( (ListLongMap!17706 (toList!8868 List!26540)) )
))
(declare-fun call!58698 () ListLongMap!17705)

(declare-fun bm!58689 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5303 (array!78083 array!78085 (_ BitVec 32) (_ BitVec 32) V!45995 V!45995 (_ BitVec 32) Int) ListLongMap!17705)

(assert (=> bm!58689 (= call!58698 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206297 () Bool)

(declare-fun res!802238 () Bool)

(declare-fun e!685032 () Bool)

(assert (=> b!1206297 (=> (not res!802238) (not e!685032))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206297 (= res!802238 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38218 _keys!1208))))))

(declare-fun b!1206298 () Bool)

(declare-fun e!685041 () Bool)

(declare-fun tp_is_empty!30651 () Bool)

(assert (=> b!1206298 (= e!685041 tp_is_empty!30651)))

(declare-fun b!1206299 () Bool)

(declare-fun e!685034 () Bool)

(assert (=> b!1206299 (= e!685034 tp_is_empty!30651)))

(declare-fun mapNonEmpty!47832 () Bool)

(declare-fun mapRes!47832 () Bool)

(declare-fun tp!90843 () Bool)

(assert (=> mapNonEmpty!47832 (= mapRes!47832 (and tp!90843 e!685041))))

(declare-fun mapValue!47832 () ValueCell!14616)

(declare-fun mapRest!47832 () (Array (_ BitVec 32) ValueCell!14616))

(declare-fun mapKey!47832 () (_ BitVec 32))

(assert (=> mapNonEmpty!47832 (= (arr!37683 _values!996) (store mapRest!47832 mapKey!47832 mapValue!47832))))

(declare-fun b!1206300 () Bool)

(declare-fun res!802252 () Bool)

(assert (=> b!1206300 (=> (not res!802252) (not e!685032))))

(assert (=> b!1206300 (= res!802252 (and (= (size!38219 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38218 _keys!1208) (size!38219 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206301 () Bool)

(declare-fun res!802250 () Bool)

(assert (=> b!1206301 (=> (not res!802250) (not e!685032))))

(assert (=> b!1206301 (= res!802250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26536))))

(declare-fun bm!58690 () Bool)

(declare-fun call!58692 () ListLongMap!17705)

(declare-fun call!58699 () ListLongMap!17705)

(assert (=> bm!58690 (= call!58692 call!58699)))

(declare-fun b!1206302 () Bool)

(declare-fun arrayContainsKey!0 (array!78083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206302 (= e!685037 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206303 () Bool)

(declare-fun e!685046 () Bool)

(declare-fun e!685045 () Bool)

(assert (=> b!1206303 (= e!685046 e!685045)))

(declare-fun res!802240 () Bool)

(assert (=> b!1206303 (=> res!802240 e!685045)))

(assert (=> b!1206303 (= res!802240 (not (= from!1455 i!673)))))

(declare-fun lt!547202 () array!78085)

(declare-fun lt!547198 () ListLongMap!17705)

(declare-fun lt!547209 () array!78083)

(assert (=> b!1206303 (= lt!547198 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3209 (Int (_ BitVec 64)) V!45995)

(assert (=> b!1206303 (= lt!547202 (array!78086 (store (arr!37683 _values!996) i!673 (ValueCellFull!14616 (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38219 _values!996)))))

(declare-fun lt!547206 () ListLongMap!17705)

(assert (=> b!1206303 (= lt!547206 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206304 () Bool)

(assert (=> b!1206304 (= e!685039 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206305 () Bool)

(declare-fun e!685040 () Unit!39990)

(declare-fun lt!547203 () Unit!39990)

(assert (=> b!1206305 (= e!685040 lt!547203)))

(declare-fun call!58693 () Unit!39990)

(assert (=> b!1206305 (= lt!547203 call!58693)))

(declare-fun call!58694 () Bool)

(assert (=> b!1206305 call!58694))

(declare-fun b!1206306 () Bool)

(declare-fun Unit!39992 () Unit!39990)

(assert (=> b!1206306 (= e!685040 Unit!39992)))

(declare-fun b!1206307 () Bool)

(assert (=> b!1206307 (= e!685037 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547199) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206308 () Bool)

(declare-fun e!685042 () Bool)

(assert (=> b!1206308 (= e!685045 e!685042)))

(declare-fun res!802246 () Bool)

(assert (=> b!1206308 (=> res!802246 e!685042)))

(assert (=> b!1206308 (= res!802246 (not (= (select (arr!37682 _keys!1208) from!1455) k0!934)))))

(declare-fun e!685044 () Bool)

(assert (=> b!1206308 e!685044))

(declare-fun c!118432 () Bool)

(assert (=> b!1206308 (= c!118432 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547200 () Unit!39990)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 (array!78083 array!78085 (_ BitVec 32) (_ BitVec 32) V!45995 V!45995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39990)

(assert (=> b!1206308 (= lt!547200 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206309 () Bool)

(declare-fun res!802247 () Bool)

(assert (=> b!1206309 (=> (not res!802247) (not e!685032))))

(assert (=> b!1206309 (= res!802247 (= (select (arr!37682 _keys!1208) i!673) k0!934))))

(declare-fun b!1206310 () Bool)

(declare-fun res!802248 () Bool)

(assert (=> b!1206310 (=> (not res!802248) (not e!685032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206310 (= res!802248 (validMask!0 mask!1564))))

(declare-fun b!1206311 () Bool)

(declare-fun c!118433 () Bool)

(assert (=> b!1206311 (= c!118433 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547199))))

(assert (=> b!1206311 (= e!685043 e!685040)))

(declare-fun b!1206312 () Bool)

(declare-fun e!685035 () Bool)

(assert (=> b!1206312 (= e!685035 (and e!685034 mapRes!47832))))

(declare-fun condMapEmpty!47832 () Bool)

(declare-fun mapDefault!47832 () ValueCell!14616)

(assert (=> b!1206312 (= condMapEmpty!47832 (= (arr!37683 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14616)) mapDefault!47832)))))

(declare-fun bm!58691 () Bool)

(declare-fun lt!547204 () ListLongMap!17705)

(declare-fun +!3989 (ListLongMap!17705 tuple2!19736) ListLongMap!17705)

(assert (=> bm!58691 (= call!58699 (+!3989 lt!547204 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206313 () Bool)

(declare-fun res!802239 () Bool)

(declare-fun e!685031 () Bool)

(assert (=> b!1206313 (=> (not res!802239) (not e!685031))))

(assert (=> b!1206313 (= res!802239 (arrayNoDuplicates!0 lt!547209 #b00000000000000000000000000000000 Nil!26536))))

(declare-fun b!1206314 () Bool)

(assert (=> b!1206314 (= e!685031 (not e!685046))))

(declare-fun res!802244 () Bool)

(assert (=> b!1206314 (=> res!802244 e!685046)))

(assert (=> b!1206314 (= res!802244 (bvsgt from!1455 i!673))))

(assert (=> b!1206314 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547210 () Unit!39990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78083 (_ BitVec 64) (_ BitVec 32)) Unit!39990)

(assert (=> b!1206314 (= lt!547210 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206315 () Bool)

(declare-fun call!58695 () ListLongMap!17705)

(assert (=> b!1206315 (= e!685044 (= call!58695 call!58698))))

(declare-fun b!1206316 () Bool)

(assert (=> b!1206316 (= e!685042 e!685036)))

(declare-fun res!802249 () Bool)

(assert (=> b!1206316 (=> res!802249 e!685036)))

(declare-fun contains!6926 (ListLongMap!17705 (_ BitVec 64)) Bool)

(assert (=> b!1206316 (= res!802249 (not (contains!6926 lt!547204 k0!934)))))

(assert (=> b!1206316 (= lt!547204 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206317 () Bool)

(declare-fun res!802243 () Bool)

(assert (=> b!1206317 (=> (not res!802243) (not e!685032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206317 (= res!802243 (validKeyInArray!0 k0!934))))

(declare-fun b!1206318 () Bool)

(declare-fun lt!547201 () Unit!39990)

(assert (=> b!1206318 (= e!685033 lt!547201)))

(declare-fun lt!547196 () Unit!39990)

(declare-fun addStillContains!1018 (ListLongMap!17705 (_ BitVec 64) V!45995 (_ BitVec 64)) Unit!39990)

(assert (=> b!1206318 (= lt!547196 (addStillContains!1018 lt!547204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!547207 () ListLongMap!17705)

(assert (=> b!1206318 (= lt!547207 call!58699)))

(declare-fun call!58697 () Bool)

(assert (=> b!1206318 call!58697))

(declare-fun call!58696 () Unit!39990)

(assert (=> b!1206318 (= lt!547201 call!58696)))

(assert (=> b!1206318 (contains!6926 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun res!802241 () Bool)

(assert (=> start!100776 (=> (not res!802241) (not e!685032))))

(assert (=> start!100776 (= res!802241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38218 _keys!1208))))))

(assert (=> start!100776 e!685032))

(assert (=> start!100776 tp_is_empty!30651))

(declare-fun array_inv!28706 (array!78083) Bool)

(assert (=> start!100776 (array_inv!28706 _keys!1208)))

(assert (=> start!100776 true))

(assert (=> start!100776 tp!90844))

(declare-fun array_inv!28707 (array!78085) Bool)

(assert (=> start!100776 (and (array_inv!28707 _values!996) e!685035)))

(declare-fun b!1206319 () Bool)

(assert (=> b!1206319 call!58694))

(declare-fun lt!547205 () Unit!39990)

(assert (=> b!1206319 (= lt!547205 call!58693)))

(assert (=> b!1206319 (= e!685043 lt!547205)))

(declare-fun bm!58692 () Bool)

(assert (=> bm!58692 (= call!58693 call!58696)))

(declare-fun bm!58693 () Bool)

(assert (=> bm!58693 (= call!58697 (contains!6926 (ite c!118434 lt!547207 call!58692) k0!934))))

(declare-fun bm!58694 () Bool)

(assert (=> bm!58694 (= call!58696 (addStillContains!1018 (ite c!118434 lt!547207 lt!547204) (ite c!118434 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118431 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118434 minValue!944 (ite c!118431 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206320 () Bool)

(assert (=> b!1206320 (= e!685032 e!685031)))

(declare-fun res!802245 () Bool)

(assert (=> b!1206320 (=> (not res!802245) (not e!685031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78083 (_ BitVec 32)) Bool)

(assert (=> b!1206320 (= res!802245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547209 mask!1564))))

(assert (=> b!1206320 (= lt!547209 (array!78084 (store (arr!37682 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38218 _keys!1208)))))

(declare-fun b!1206321 () Bool)

(declare-fun res!802242 () Bool)

(assert (=> b!1206321 (=> (not res!802242) (not e!685032))))

(assert (=> b!1206321 (= res!802242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206322 () Bool)

(declare-fun -!1826 (ListLongMap!17705 (_ BitVec 64)) ListLongMap!17705)

(assert (=> b!1206322 (= e!685044 (= call!58695 (-!1826 call!58698 k0!934)))))

(declare-fun mapIsEmpty!47832 () Bool)

(assert (=> mapIsEmpty!47832 mapRes!47832))

(declare-fun bm!58695 () Bool)

(assert (=> bm!58695 (= call!58695 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58696 () Bool)

(assert (=> bm!58696 (= call!58694 call!58697)))

(assert (= (and start!100776 res!802241) b!1206310))

(assert (= (and b!1206310 res!802248) b!1206300))

(assert (= (and b!1206300 res!802252) b!1206321))

(assert (= (and b!1206321 res!802242) b!1206301))

(assert (= (and b!1206301 res!802250) b!1206297))

(assert (= (and b!1206297 res!802238) b!1206317))

(assert (= (and b!1206317 res!802243) b!1206309))

(assert (= (and b!1206309 res!802247) b!1206320))

(assert (= (and b!1206320 res!802245) b!1206313))

(assert (= (and b!1206313 res!802239) b!1206314))

(assert (= (and b!1206314 (not res!802244)) b!1206303))

(assert (= (and b!1206303 (not res!802240)) b!1206308))

(assert (= (and b!1206308 c!118432) b!1206322))

(assert (= (and b!1206308 (not c!118432)) b!1206315))

(assert (= (or b!1206322 b!1206315) bm!58695))

(assert (= (or b!1206322 b!1206315) bm!58689))

(assert (= (and b!1206308 (not res!802246)) b!1206316))

(assert (= (and b!1206316 (not res!802249)) b!1206295))

(assert (= (and b!1206295 c!118434) b!1206318))

(assert (= (and b!1206295 (not c!118434)) b!1206296))

(assert (= (and b!1206296 c!118431) b!1206319))

(assert (= (and b!1206296 (not c!118431)) b!1206311))

(assert (= (and b!1206311 c!118433) b!1206305))

(assert (= (and b!1206311 (not c!118433)) b!1206306))

(assert (= (or b!1206319 b!1206305) bm!58692))

(assert (= (or b!1206319 b!1206305) bm!58690))

(assert (= (or b!1206319 b!1206305) bm!58696))

(assert (= (or b!1206318 bm!58696) bm!58693))

(assert (= (or b!1206318 bm!58692) bm!58694))

(assert (= (or b!1206318 bm!58690) bm!58691))

(assert (= (and b!1206295 c!118430) b!1206302))

(assert (= (and b!1206295 (not c!118430)) b!1206307))

(assert (= (and b!1206295 res!802251) b!1206304))

(assert (= (and b!1206312 condMapEmpty!47832) mapIsEmpty!47832))

(assert (= (and b!1206312 (not condMapEmpty!47832)) mapNonEmpty!47832))

(get-info :version)

(assert (= (and mapNonEmpty!47832 ((_ is ValueCellFull!14616) mapValue!47832)) b!1206298))

(assert (= (and b!1206312 ((_ is ValueCellFull!14616) mapDefault!47832)) b!1206299))

(assert (= start!100776 b!1206312))

(declare-fun b_lambda!21343 () Bool)

(assert (=> (not b_lambda!21343) (not b!1206303)))

(declare-fun t!39465 () Bool)

(declare-fun tb!10747 () Bool)

(assert (=> (and start!100776 (= defaultEntry!1004 defaultEntry!1004) t!39465) tb!10747))

(declare-fun result!22079 () Bool)

(assert (=> tb!10747 (= result!22079 tp_is_empty!30651)))

(assert (=> b!1206303 t!39465))

(declare-fun b_and!42879 () Bool)

(assert (= b_and!42877 (and (=> t!39465 result!22079) b_and!42879)))

(declare-fun m!1111967 () Bool)

(assert (=> b!1206313 m!1111967))

(declare-fun m!1111969 () Bool)

(assert (=> b!1206295 m!1111969))

(declare-fun m!1111971 () Bool)

(assert (=> b!1206295 m!1111971))

(declare-fun m!1111973 () Bool)

(assert (=> b!1206295 m!1111973))

(declare-fun m!1111975 () Bool)

(assert (=> b!1206322 m!1111975))

(declare-fun m!1111977 () Bool)

(assert (=> b!1206321 m!1111977))

(declare-fun m!1111979 () Bool)

(assert (=> b!1206302 m!1111979))

(declare-fun m!1111981 () Bool)

(assert (=> bm!58689 m!1111981))

(declare-fun m!1111983 () Bool)

(assert (=> b!1206301 m!1111983))

(declare-fun m!1111985 () Bool)

(assert (=> b!1206316 m!1111985))

(assert (=> b!1206316 m!1111981))

(assert (=> b!1206304 m!1111979))

(declare-fun m!1111987 () Bool)

(assert (=> b!1206303 m!1111987))

(declare-fun m!1111989 () Bool)

(assert (=> b!1206303 m!1111989))

(declare-fun m!1111991 () Bool)

(assert (=> b!1206303 m!1111991))

(declare-fun m!1111993 () Bool)

(assert (=> b!1206303 m!1111993))

(declare-fun m!1111995 () Bool)

(assert (=> b!1206320 m!1111995))

(declare-fun m!1111997 () Bool)

(assert (=> b!1206320 m!1111997))

(declare-fun m!1111999 () Bool)

(assert (=> b!1206309 m!1111999))

(declare-fun m!1112001 () Bool)

(assert (=> b!1206317 m!1112001))

(declare-fun m!1112003 () Bool)

(assert (=> b!1206314 m!1112003))

(declare-fun m!1112005 () Bool)

(assert (=> b!1206314 m!1112005))

(declare-fun m!1112007 () Bool)

(assert (=> start!100776 m!1112007))

(declare-fun m!1112009 () Bool)

(assert (=> start!100776 m!1112009))

(declare-fun m!1112011 () Bool)

(assert (=> b!1206308 m!1112011))

(declare-fun m!1112013 () Bool)

(assert (=> b!1206308 m!1112013))

(declare-fun m!1112015 () Bool)

(assert (=> bm!58693 m!1112015))

(declare-fun m!1112017 () Bool)

(assert (=> bm!58691 m!1112017))

(declare-fun m!1112019 () Bool)

(assert (=> b!1206310 m!1112019))

(declare-fun m!1112021 () Bool)

(assert (=> bm!58694 m!1112021))

(declare-fun m!1112023 () Bool)

(assert (=> bm!58695 m!1112023))

(declare-fun m!1112025 () Bool)

(assert (=> mapNonEmpty!47832 m!1112025))

(declare-fun m!1112027 () Bool)

(assert (=> b!1206318 m!1112027))

(declare-fun m!1112029 () Bool)

(assert (=> b!1206318 m!1112029))

(assert (=> b!1206318 m!1112029))

(declare-fun m!1112031 () Bool)

(assert (=> b!1206318 m!1112031))

(check-sat b_and!42879 (not b!1206304) (not b!1206316) (not start!100776) (not b!1206321) (not b!1206303) tp_is_empty!30651 (not bm!58689) (not b!1206301) (not b!1206314) (not b!1206310) (not b!1206308) (not b_lambda!21343) (not mapNonEmpty!47832) (not b!1206317) (not b!1206295) (not bm!58693) (not b!1206320) (not b_next!25947) (not bm!58691) (not b!1206313) (not bm!58694) (not bm!58695) (not b!1206322) (not b!1206318) (not b!1206302))
(check-sat b_and!42879 (not b_next!25947))
(get-model)

(declare-fun b_lambda!21347 () Bool)

(assert (= b_lambda!21343 (or (and start!100776 b_free!25947) b_lambda!21347)))

(check-sat b_and!42879 (not b!1206304) (not b!1206316) (not mapNonEmpty!47832) (not start!100776) (not b!1206321) (not b!1206303) tp_is_empty!30651 (not bm!58689) (not b!1206301) (not b!1206314) (not b!1206310) (not b!1206308) (not b!1206317) (not b!1206295) (not bm!58693) (not b!1206320) (not b_next!25947) (not bm!58691) (not b!1206313) (not bm!58694) (not b_lambda!21347) (not bm!58695) (not b!1206322) (not b!1206318) (not b!1206302))
(check-sat b_and!42879 (not b_next!25947))
(get-model)

(declare-fun d!132895 () Bool)

(declare-fun res!802302 () Bool)

(declare-fun e!685099 () Bool)

(assert (=> d!132895 (=> res!802302 e!685099)))

(assert (=> d!132895 (= res!802302 (= (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132895 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685099)))

(declare-fun b!1206415 () Bool)

(declare-fun e!685100 () Bool)

(assert (=> b!1206415 (= e!685099 e!685100)))

(declare-fun res!802303 () Bool)

(assert (=> b!1206415 (=> (not res!802303) (not e!685100))))

(assert (=> b!1206415 (= res!802303 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38218 _keys!1208)))))

(declare-fun b!1206416 () Bool)

(assert (=> b!1206416 (= e!685100 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132895 (not res!802302)) b!1206415))

(assert (= (and b!1206415 res!802303) b!1206416))

(declare-fun m!1112099 () Bool)

(assert (=> d!132895 m!1112099))

(declare-fun m!1112101 () Bool)

(assert (=> b!1206416 m!1112101))

(assert (=> b!1206304 d!132895))

(declare-fun b!1206425 () Bool)

(declare-fun e!685108 () Bool)

(declare-fun e!685109 () Bool)

(assert (=> b!1206425 (= e!685108 e!685109)))

(declare-fun lt!547265 () (_ BitVec 64))

(assert (=> b!1206425 (= lt!547265 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547267 () Unit!39990)

(assert (=> b!1206425 (= lt!547267 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547265 #b00000000000000000000000000000000))))

(assert (=> b!1206425 (arrayContainsKey!0 _keys!1208 lt!547265 #b00000000000000000000000000000000)))

(declare-fun lt!547266 () Unit!39990)

(assert (=> b!1206425 (= lt!547266 lt!547267)))

(declare-fun res!802308 () Bool)

(declare-datatypes ((SeekEntryResult!9937 0))(
  ( (MissingZero!9937 (index!42119 (_ BitVec 32))) (Found!9937 (index!42120 (_ BitVec 32))) (Intermediate!9937 (undefined!10749 Bool) (index!42121 (_ BitVec 32)) (x!106526 (_ BitVec 32))) (Undefined!9937) (MissingVacant!9937 (index!42122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78083 (_ BitVec 32)) SeekEntryResult!9937)

(assert (=> b!1206425 (= res!802308 (= (seekEntryOrOpen!0 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9937 #b00000000000000000000000000000000)))))

(assert (=> b!1206425 (=> (not res!802308) (not e!685109))))

(declare-fun d!132897 () Bool)

(declare-fun res!802309 () Bool)

(declare-fun e!685107 () Bool)

(assert (=> d!132897 (=> res!802309 e!685107)))

(assert (=> d!132897 (= res!802309 (bvsge #b00000000000000000000000000000000 (size!38218 _keys!1208)))))

(assert (=> d!132897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685107)))

(declare-fun b!1206426 () Bool)

(declare-fun call!58726 () Bool)

(assert (=> b!1206426 (= e!685109 call!58726)))

(declare-fun b!1206427 () Bool)

(assert (=> b!1206427 (= e!685108 call!58726)))

(declare-fun b!1206428 () Bool)

(assert (=> b!1206428 (= e!685107 e!685108)))

(declare-fun c!118452 () Bool)

(assert (=> b!1206428 (= c!118452 (validKeyInArray!0 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58723 () Bool)

(assert (=> bm!58723 (= call!58726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!132897 (not res!802309)) b!1206428))

(assert (= (and b!1206428 c!118452) b!1206425))

(assert (= (and b!1206428 (not c!118452)) b!1206427))

(assert (= (and b!1206425 res!802308) b!1206426))

(assert (= (or b!1206426 b!1206427) bm!58723))

(declare-fun m!1112103 () Bool)

(assert (=> b!1206425 m!1112103))

(declare-fun m!1112105 () Bool)

(assert (=> b!1206425 m!1112105))

(declare-fun m!1112107 () Bool)

(assert (=> b!1206425 m!1112107))

(assert (=> b!1206425 m!1112103))

(declare-fun m!1112109 () Bool)

(assert (=> b!1206425 m!1112109))

(assert (=> b!1206428 m!1112103))

(assert (=> b!1206428 m!1112103))

(declare-fun m!1112111 () Bool)

(assert (=> b!1206428 m!1112111))

(declare-fun m!1112113 () Bool)

(assert (=> bm!58723 m!1112113))

(assert (=> b!1206321 d!132897))

(declare-fun call!58729 () ListLongMap!17705)

(declare-fun bm!58726 () Bool)

(assert (=> bm!58726 (= call!58729 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206453 () Bool)

(declare-fun e!685129 () Bool)

(declare-fun e!685124 () Bool)

(assert (=> b!1206453 (= e!685129 e!685124)))

(declare-fun c!118461 () Bool)

(assert (=> b!1206453 (= c!118461 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(declare-fun b!1206454 () Bool)

(declare-fun e!685125 () Bool)

(assert (=> b!1206454 (= e!685125 e!685129)))

(declare-fun c!118463 () Bool)

(declare-fun e!685128 () Bool)

(assert (=> b!1206454 (= c!118463 e!685128)))

(declare-fun res!802318 () Bool)

(assert (=> b!1206454 (=> (not res!802318) (not e!685128))))

(assert (=> b!1206454 (= res!802318 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(declare-fun b!1206456 () Bool)

(declare-fun e!685127 () ListLongMap!17705)

(assert (=> b!1206456 (= e!685127 (ListLongMap!17706 Nil!26537))))

(declare-fun b!1206457 () Bool)

(declare-fun lt!547282 () ListLongMap!17705)

(declare-fun isEmpty!986 (ListLongMap!17705) Bool)

(assert (=> b!1206457 (= e!685124 (isEmpty!986 lt!547282))))

(declare-fun b!1206458 () Bool)

(assert (=> b!1206458 (= e!685124 (= lt!547282 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206459 () Bool)

(declare-fun res!802321 () Bool)

(assert (=> b!1206459 (=> (not res!802321) (not e!685125))))

(assert (=> b!1206459 (= res!802321 (not (contains!6926 lt!547282 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1206460 () Bool)

(declare-fun e!685130 () Bool)

(assert (=> b!1206460 (= e!685129 e!685130)))

(assert (=> b!1206460 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(declare-fun res!802319 () Bool)

(assert (=> b!1206460 (= res!802319 (contains!6926 lt!547282 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206460 (=> (not res!802319) (not e!685130))))

(declare-fun b!1206461 () Bool)

(declare-fun e!685126 () ListLongMap!17705)

(assert (=> b!1206461 (= e!685126 call!58729)))

(declare-fun b!1206462 () Bool)

(declare-fun lt!547285 () Unit!39990)

(declare-fun lt!547284 () Unit!39990)

(assert (=> b!1206462 (= lt!547285 lt!547284)))

(declare-fun lt!547288 () (_ BitVec 64))

(declare-fun lt!547286 () ListLongMap!17705)

(declare-fun lt!547283 () (_ BitVec 64))

(declare-fun lt!547287 () V!45995)

(assert (=> b!1206462 (not (contains!6926 (+!3989 lt!547286 (tuple2!19737 lt!547283 lt!547287)) lt!547288))))

(declare-fun addStillNotContains!292 (ListLongMap!17705 (_ BitVec 64) V!45995 (_ BitVec 64)) Unit!39990)

(assert (=> b!1206462 (= lt!547284 (addStillNotContains!292 lt!547286 lt!547283 lt!547287 lt!547288))))

(assert (=> b!1206462 (= lt!547288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19203 (ValueCell!14616 V!45995) V!45995)

(assert (=> b!1206462 (= lt!547287 (get!19203 (select (arr!37683 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206462 (= lt!547283 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1206462 (= lt!547286 call!58729)))

(assert (=> b!1206462 (= e!685126 (+!3989 call!58729 (tuple2!19737 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19203 (select (arr!37683 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132899 () Bool)

(assert (=> d!132899 e!685125))

(declare-fun res!802320 () Bool)

(assert (=> d!132899 (=> (not res!802320) (not e!685125))))

(assert (=> d!132899 (= res!802320 (not (contains!6926 lt!547282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132899 (= lt!547282 e!685127)))

(declare-fun c!118464 () Bool)

(assert (=> d!132899 (= c!118464 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(assert (=> d!132899 (validMask!0 mask!1564)))

(assert (=> d!132899 (= (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547282)))

(declare-fun b!1206455 () Bool)

(assert (=> b!1206455 (= e!685128 (validKeyInArray!0 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206455 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206463 () Bool)

(assert (=> b!1206463 (= e!685127 e!685126)))

(declare-fun c!118462 () Bool)

(assert (=> b!1206463 (= c!118462 (validKeyInArray!0 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1206464 () Bool)

(assert (=> b!1206464 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(assert (=> b!1206464 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38219 _values!996)))))

(declare-fun apply!964 (ListLongMap!17705 (_ BitVec 64)) V!45995)

(assert (=> b!1206464 (= e!685130 (= (apply!964 lt!547282 (select (arr!37682 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19203 (select (arr!37683 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132899 c!118464) b!1206456))

(assert (= (and d!132899 (not c!118464)) b!1206463))

(assert (= (and b!1206463 c!118462) b!1206462))

(assert (= (and b!1206463 (not c!118462)) b!1206461))

(assert (= (or b!1206462 b!1206461) bm!58726))

(assert (= (and d!132899 res!802320) b!1206459))

(assert (= (and b!1206459 res!802321) b!1206454))

(assert (= (and b!1206454 res!802318) b!1206455))

(assert (= (and b!1206454 c!118463) b!1206460))

(assert (= (and b!1206454 (not c!118463)) b!1206453))

(assert (= (and b!1206460 res!802319) b!1206464))

(assert (= (and b!1206453 c!118461) b!1206458))

(assert (= (and b!1206453 (not c!118461)) b!1206457))

(declare-fun b_lambda!21349 () Bool)

(assert (=> (not b_lambda!21349) (not b!1206462)))

(assert (=> b!1206462 t!39465))

(declare-fun b_and!42885 () Bool)

(assert (= b_and!42879 (and (=> t!39465 result!22079) b_and!42885)))

(declare-fun b_lambda!21351 () Bool)

(assert (=> (not b_lambda!21351) (not b!1206464)))

(assert (=> b!1206464 t!39465))

(declare-fun b_and!42887 () Bool)

(assert (= b_and!42885 (and (=> t!39465 result!22079) b_and!42887)))

(declare-fun m!1112115 () Bool)

(assert (=> b!1206458 m!1112115))

(declare-fun m!1112117 () Bool)

(assert (=> b!1206459 m!1112117))

(declare-fun m!1112119 () Bool)

(assert (=> d!132899 m!1112119))

(assert (=> d!132899 m!1112019))

(assert (=> bm!58726 m!1112115))

(declare-fun m!1112121 () Bool)

(assert (=> b!1206462 m!1112121))

(assert (=> b!1206462 m!1111989))

(declare-fun m!1112123 () Bool)

(assert (=> b!1206462 m!1112123))

(assert (=> b!1206462 m!1111989))

(declare-fun m!1112125 () Bool)

(assert (=> b!1206462 m!1112125))

(assert (=> b!1206462 m!1112099))

(assert (=> b!1206462 m!1112123))

(declare-fun m!1112127 () Bool)

(assert (=> b!1206462 m!1112127))

(declare-fun m!1112129 () Bool)

(assert (=> b!1206462 m!1112129))

(assert (=> b!1206462 m!1112127))

(declare-fun m!1112131 () Bool)

(assert (=> b!1206462 m!1112131))

(assert (=> b!1206463 m!1112099))

(assert (=> b!1206463 m!1112099))

(declare-fun m!1112133 () Bool)

(assert (=> b!1206463 m!1112133))

(assert (=> b!1206455 m!1112099))

(assert (=> b!1206455 m!1112099))

(assert (=> b!1206455 m!1112133))

(assert (=> b!1206464 m!1112123))

(assert (=> b!1206464 m!1112099))

(declare-fun m!1112135 () Bool)

(assert (=> b!1206464 m!1112135))

(assert (=> b!1206464 m!1111989))

(assert (=> b!1206464 m!1112123))

(assert (=> b!1206464 m!1111989))

(assert (=> b!1206464 m!1112125))

(assert (=> b!1206464 m!1112099))

(assert (=> b!1206460 m!1112099))

(assert (=> b!1206460 m!1112099))

(declare-fun m!1112137 () Bool)

(assert (=> b!1206460 m!1112137))

(declare-fun m!1112139 () Bool)

(assert (=> b!1206457 m!1112139))

(assert (=> bm!58689 d!132899))

(declare-fun d!132901 () Bool)

(declare-fun lt!547291 () ListLongMap!17705)

(assert (=> d!132901 (not (contains!6926 lt!547291 k0!934))))

(declare-fun removeStrictlySorted!97 (List!26540 (_ BitVec 64)) List!26540)

(assert (=> d!132901 (= lt!547291 (ListLongMap!17706 (removeStrictlySorted!97 (toList!8868 call!58698) k0!934)))))

(assert (=> d!132901 (= (-!1826 call!58698 k0!934) lt!547291)))

(declare-fun bs!34115 () Bool)

(assert (= bs!34115 d!132901))

(declare-fun m!1112141 () Bool)

(assert (=> bs!34115 m!1112141))

(declare-fun m!1112143 () Bool)

(assert (=> bs!34115 m!1112143))

(assert (=> b!1206322 d!132901))

(declare-fun d!132903 () Bool)

(declare-fun res!802322 () Bool)

(declare-fun e!685131 () Bool)

(assert (=> d!132903 (=> res!802322 e!685131)))

(assert (=> d!132903 (= res!802322 (= (select (arr!37682 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132903 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!685131)))

(declare-fun b!1206465 () Bool)

(declare-fun e!685132 () Bool)

(assert (=> b!1206465 (= e!685131 e!685132)))

(declare-fun res!802323 () Bool)

(assert (=> b!1206465 (=> (not res!802323) (not e!685132))))

(assert (=> b!1206465 (= res!802323 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38218 _keys!1208)))))

(declare-fun b!1206466 () Bool)

(assert (=> b!1206466 (= e!685132 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132903 (not res!802322)) b!1206465))

(assert (= (and b!1206465 res!802323) b!1206466))

(assert (=> d!132903 m!1112103))

(declare-fun m!1112145 () Bool)

(assert (=> b!1206466 m!1112145))

(assert (=> b!1206314 d!132903))

(declare-fun d!132905 () Bool)

(assert (=> d!132905 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547294 () Unit!39990)

(declare-fun choose!13 (array!78083 (_ BitVec 64) (_ BitVec 32)) Unit!39990)

(assert (=> d!132905 (= lt!547294 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132905 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132905 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547294)))

(declare-fun bs!34116 () Bool)

(assert (= bs!34116 d!132905))

(assert (=> bs!34116 m!1112003))

(declare-fun m!1112147 () Bool)

(assert (=> bs!34116 m!1112147))

(assert (=> b!1206314 d!132905))

(declare-fun b!1206477 () Bool)

(declare-fun e!685144 () Bool)

(declare-fun call!58732 () Bool)

(assert (=> b!1206477 (= e!685144 call!58732)))

(declare-fun b!1206478 () Bool)

(declare-fun e!685142 () Bool)

(assert (=> b!1206478 (= e!685142 e!685144)))

(declare-fun c!118467 () Bool)

(assert (=> b!1206478 (= c!118467 (validKeyInArray!0 (select (arr!37682 _keys!1208) from!1455)))))

(declare-fun bm!58729 () Bool)

(assert (=> bm!58729 (= call!58732 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118467 (Cons!26535 (select (arr!37682 _keys!1208) from!1455) Nil!26536) Nil!26536)))))

(declare-fun b!1206479 () Bool)

(assert (=> b!1206479 (= e!685144 call!58732)))

(declare-fun b!1206480 () Bool)

(declare-fun e!685143 () Bool)

(declare-fun contains!6928 (List!26539 (_ BitVec 64)) Bool)

(assert (=> b!1206480 (= e!685143 (contains!6928 Nil!26536 (select (arr!37682 _keys!1208) from!1455)))))

(declare-fun b!1206481 () Bool)

(declare-fun e!685141 () Bool)

(assert (=> b!1206481 (= e!685141 e!685142)))

(declare-fun res!802332 () Bool)

(assert (=> b!1206481 (=> (not res!802332) (not e!685142))))

(assert (=> b!1206481 (= res!802332 (not e!685143))))

(declare-fun res!802330 () Bool)

(assert (=> b!1206481 (=> (not res!802330) (not e!685143))))

(assert (=> b!1206481 (= res!802330 (validKeyInArray!0 (select (arr!37682 _keys!1208) from!1455)))))

(declare-fun d!132907 () Bool)

(declare-fun res!802331 () Bool)

(assert (=> d!132907 (=> res!802331 e!685141)))

(assert (=> d!132907 (= res!802331 (bvsge from!1455 (size!38218 _keys!1208)))))

(assert (=> d!132907 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26536) e!685141)))

(assert (= (and d!132907 (not res!802331)) b!1206481))

(assert (= (and b!1206481 res!802330) b!1206480))

(assert (= (and b!1206481 res!802332) b!1206478))

(assert (= (and b!1206478 c!118467) b!1206479))

(assert (= (and b!1206478 (not c!118467)) b!1206477))

(assert (= (or b!1206479 b!1206477) bm!58729))

(assert (=> b!1206478 m!1112011))

(assert (=> b!1206478 m!1112011))

(declare-fun m!1112149 () Bool)

(assert (=> b!1206478 m!1112149))

(assert (=> bm!58729 m!1112011))

(declare-fun m!1112151 () Bool)

(assert (=> bm!58729 m!1112151))

(assert (=> b!1206480 m!1112011))

(assert (=> b!1206480 m!1112011))

(declare-fun m!1112153 () Bool)

(assert (=> b!1206480 m!1112153))

(assert (=> b!1206481 m!1112011))

(assert (=> b!1206481 m!1112011))

(assert (=> b!1206481 m!1112149))

(assert (=> b!1206295 d!132907))

(declare-fun d!132909 () Bool)

(assert (=> d!132909 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26536)))

(declare-fun lt!547297 () Unit!39990)

(declare-fun choose!39 (array!78083 (_ BitVec 32) (_ BitVec 32)) Unit!39990)

(assert (=> d!132909 (= lt!547297 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!132909 (bvslt (size!38218 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!132909 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!547297)))

(declare-fun bs!34117 () Bool)

(assert (= bs!34117 d!132909))

(assert (=> bs!34117 m!1111969))

(declare-fun m!1112155 () Bool)

(assert (=> bs!34117 m!1112155))

(assert (=> b!1206295 d!132909))

(declare-fun d!132911 () Bool)

(declare-fun e!685147 () Bool)

(assert (=> d!132911 e!685147))

(declare-fun c!118470 () Bool)

(assert (=> d!132911 (= c!118470 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547300 () Unit!39990)

(declare-fun choose!1798 (array!78083 array!78085 (_ BitVec 32) (_ BitVec 32) V!45995 V!45995 (_ BitVec 64) (_ BitVec 32) Int) Unit!39990)

(assert (=> d!132911 (= lt!547300 (choose!1798 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132911 (validMask!0 mask!1564)))

(assert (=> d!132911 (= (lemmaListMapContainsThenArrayContainsFrom!573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547300)))

(declare-fun b!1206486 () Bool)

(assert (=> b!1206486 (= e!685147 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206487 () Bool)

(assert (=> b!1206487 (= e!685147 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132911 c!118470) b!1206486))

(assert (= (and d!132911 (not c!118470)) b!1206487))

(declare-fun m!1112157 () Bool)

(assert (=> d!132911 m!1112157))

(assert (=> d!132911 m!1112019))

(assert (=> b!1206486 m!1111979))

(assert (=> b!1206295 d!132911))

(declare-fun b!1206488 () Bool)

(declare-fun e!685149 () Bool)

(declare-fun e!685150 () Bool)

(assert (=> b!1206488 (= e!685149 e!685150)))

(declare-fun lt!547301 () (_ BitVec 64))

(assert (=> b!1206488 (= lt!547301 (select (arr!37682 lt!547209) #b00000000000000000000000000000000))))

(declare-fun lt!547303 () Unit!39990)

(assert (=> b!1206488 (= lt!547303 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547209 lt!547301 #b00000000000000000000000000000000))))

(assert (=> b!1206488 (arrayContainsKey!0 lt!547209 lt!547301 #b00000000000000000000000000000000)))

(declare-fun lt!547302 () Unit!39990)

(assert (=> b!1206488 (= lt!547302 lt!547303)))

(declare-fun res!802333 () Bool)

(assert (=> b!1206488 (= res!802333 (= (seekEntryOrOpen!0 (select (arr!37682 lt!547209) #b00000000000000000000000000000000) lt!547209 mask!1564) (Found!9937 #b00000000000000000000000000000000)))))

(assert (=> b!1206488 (=> (not res!802333) (not e!685150))))

(declare-fun d!132913 () Bool)

(declare-fun res!802334 () Bool)

(declare-fun e!685148 () Bool)

(assert (=> d!132913 (=> res!802334 e!685148)))

(assert (=> d!132913 (= res!802334 (bvsge #b00000000000000000000000000000000 (size!38218 lt!547209)))))

(assert (=> d!132913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547209 mask!1564) e!685148)))

(declare-fun b!1206489 () Bool)

(declare-fun call!58733 () Bool)

(assert (=> b!1206489 (= e!685150 call!58733)))

(declare-fun b!1206490 () Bool)

(assert (=> b!1206490 (= e!685149 call!58733)))

(declare-fun b!1206491 () Bool)

(assert (=> b!1206491 (= e!685148 e!685149)))

(declare-fun c!118471 () Bool)

(assert (=> b!1206491 (= c!118471 (validKeyInArray!0 (select (arr!37682 lt!547209) #b00000000000000000000000000000000)))))

(declare-fun bm!58730 () Bool)

(assert (=> bm!58730 (= call!58733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547209 mask!1564))))

(assert (= (and d!132913 (not res!802334)) b!1206491))

(assert (= (and b!1206491 c!118471) b!1206488))

(assert (= (and b!1206491 (not c!118471)) b!1206490))

(assert (= (and b!1206488 res!802333) b!1206489))

(assert (= (or b!1206489 b!1206490) bm!58730))

(declare-fun m!1112159 () Bool)

(assert (=> b!1206488 m!1112159))

(declare-fun m!1112161 () Bool)

(assert (=> b!1206488 m!1112161))

(declare-fun m!1112163 () Bool)

(assert (=> b!1206488 m!1112163))

(assert (=> b!1206488 m!1112159))

(declare-fun m!1112165 () Bool)

(assert (=> b!1206488 m!1112165))

(assert (=> b!1206491 m!1112159))

(assert (=> b!1206491 m!1112159))

(declare-fun m!1112167 () Bool)

(assert (=> b!1206491 m!1112167))

(declare-fun m!1112169 () Bool)

(assert (=> bm!58730 m!1112169))

(assert (=> b!1206320 d!132913))

(declare-fun d!132915 () Bool)

(declare-fun e!685153 () Bool)

(assert (=> d!132915 e!685153))

(declare-fun res!802340 () Bool)

(assert (=> d!132915 (=> (not res!802340) (not e!685153))))

(declare-fun lt!547315 () ListLongMap!17705)

(assert (=> d!132915 (= res!802340 (contains!6926 lt!547315 (_1!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!547314 () List!26540)

(assert (=> d!132915 (= lt!547315 (ListLongMap!17706 lt!547314))))

(declare-fun lt!547313 () Unit!39990)

(declare-fun lt!547312 () Unit!39990)

(assert (=> d!132915 (= lt!547313 lt!547312)))

(declare-datatypes ((Option!686 0))(
  ( (Some!685 (v!18028 V!45995)) (None!684) )
))
(declare-fun getValueByKey!635 (List!26540 (_ BitVec 64)) Option!686)

(assert (=> d!132915 (= (getValueByKey!635 lt!547314 (_1!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!685 (_2!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!312 (List!26540 (_ BitVec 64) V!45995) Unit!39990)

(assert (=> d!132915 (= lt!547312 (lemmaContainsTupThenGetReturnValue!312 lt!547314 (_1!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!405 (List!26540 (_ BitVec 64) V!45995) List!26540)

(assert (=> d!132915 (= lt!547314 (insertStrictlySorted!405 (toList!8868 lt!547204) (_1!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132915 (= (+!3989 lt!547204 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!547315)))

(declare-fun b!1206496 () Bool)

(declare-fun res!802339 () Bool)

(assert (=> b!1206496 (=> (not res!802339) (not e!685153))))

(assert (=> b!1206496 (= res!802339 (= (getValueByKey!635 (toList!8868 lt!547315) (_1!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!685 (_2!9879 (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1206497 () Bool)

(declare-fun contains!6929 (List!26540 tuple2!19736) Bool)

(assert (=> b!1206497 (= e!685153 (contains!6929 (toList!8868 lt!547315) (ite (or c!118434 c!118431) (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132915 res!802340) b!1206496))

(assert (= (and b!1206496 res!802339) b!1206497))

(declare-fun m!1112171 () Bool)

(assert (=> d!132915 m!1112171))

(declare-fun m!1112173 () Bool)

(assert (=> d!132915 m!1112173))

(declare-fun m!1112175 () Bool)

(assert (=> d!132915 m!1112175))

(declare-fun m!1112177 () Bool)

(assert (=> d!132915 m!1112177))

(declare-fun m!1112179 () Bool)

(assert (=> b!1206496 m!1112179))

(declare-fun m!1112181 () Bool)

(assert (=> b!1206497 m!1112181))

(assert (=> bm!58691 d!132915))

(declare-fun b!1206498 () Bool)

(declare-fun e!685157 () Bool)

(declare-fun call!58734 () Bool)

(assert (=> b!1206498 (= e!685157 call!58734)))

(declare-fun b!1206499 () Bool)

(declare-fun e!685155 () Bool)

(assert (=> b!1206499 (= e!685155 e!685157)))

(declare-fun c!118472 () Bool)

(assert (=> b!1206499 (= c!118472 (validKeyInArray!0 (select (arr!37682 lt!547209) #b00000000000000000000000000000000)))))

(declare-fun bm!58731 () Bool)

(assert (=> bm!58731 (= call!58734 (arrayNoDuplicates!0 lt!547209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118472 (Cons!26535 (select (arr!37682 lt!547209) #b00000000000000000000000000000000) Nil!26536) Nil!26536)))))

(declare-fun b!1206500 () Bool)

(assert (=> b!1206500 (= e!685157 call!58734)))

(declare-fun b!1206501 () Bool)

(declare-fun e!685156 () Bool)

(assert (=> b!1206501 (= e!685156 (contains!6928 Nil!26536 (select (arr!37682 lt!547209) #b00000000000000000000000000000000)))))

(declare-fun b!1206502 () Bool)

(declare-fun e!685154 () Bool)

(assert (=> b!1206502 (= e!685154 e!685155)))

(declare-fun res!802343 () Bool)

(assert (=> b!1206502 (=> (not res!802343) (not e!685155))))

(assert (=> b!1206502 (= res!802343 (not e!685156))))

(declare-fun res!802341 () Bool)

(assert (=> b!1206502 (=> (not res!802341) (not e!685156))))

(assert (=> b!1206502 (= res!802341 (validKeyInArray!0 (select (arr!37682 lt!547209) #b00000000000000000000000000000000)))))

(declare-fun d!132917 () Bool)

(declare-fun res!802342 () Bool)

(assert (=> d!132917 (=> res!802342 e!685154)))

(assert (=> d!132917 (= res!802342 (bvsge #b00000000000000000000000000000000 (size!38218 lt!547209)))))

(assert (=> d!132917 (= (arrayNoDuplicates!0 lt!547209 #b00000000000000000000000000000000 Nil!26536) e!685154)))

(assert (= (and d!132917 (not res!802342)) b!1206502))

(assert (= (and b!1206502 res!802341) b!1206501))

(assert (= (and b!1206502 res!802343) b!1206499))

(assert (= (and b!1206499 c!118472) b!1206500))

(assert (= (and b!1206499 (not c!118472)) b!1206498))

(assert (= (or b!1206500 b!1206498) bm!58731))

(assert (=> b!1206499 m!1112159))

(assert (=> b!1206499 m!1112159))

(assert (=> b!1206499 m!1112167))

(assert (=> bm!58731 m!1112159))

(declare-fun m!1112183 () Bool)

(assert (=> bm!58731 m!1112183))

(assert (=> b!1206501 m!1112159))

(assert (=> b!1206501 m!1112159))

(declare-fun m!1112185 () Bool)

(assert (=> b!1206501 m!1112185))

(assert (=> b!1206502 m!1112159))

(assert (=> b!1206502 m!1112159))

(assert (=> b!1206502 m!1112167))

(assert (=> b!1206313 d!132917))

(declare-fun bm!58732 () Bool)

(declare-fun call!58735 () ListLongMap!17705)

(assert (=> bm!58732 (= call!58735 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206503 () Bool)

(declare-fun e!685163 () Bool)

(declare-fun e!685158 () Bool)

(assert (=> b!1206503 (= e!685163 e!685158)))

(declare-fun c!118473 () Bool)

(assert (=> b!1206503 (= c!118473 (bvslt from!1455 (size!38218 lt!547209)))))

(declare-fun b!1206504 () Bool)

(declare-fun e!685159 () Bool)

(assert (=> b!1206504 (= e!685159 e!685163)))

(declare-fun c!118475 () Bool)

(declare-fun e!685162 () Bool)

(assert (=> b!1206504 (= c!118475 e!685162)))

(declare-fun res!802344 () Bool)

(assert (=> b!1206504 (=> (not res!802344) (not e!685162))))

(assert (=> b!1206504 (= res!802344 (bvslt from!1455 (size!38218 lt!547209)))))

(declare-fun b!1206506 () Bool)

(declare-fun e!685161 () ListLongMap!17705)

(assert (=> b!1206506 (= e!685161 (ListLongMap!17706 Nil!26537))))

(declare-fun b!1206507 () Bool)

(declare-fun lt!547316 () ListLongMap!17705)

(assert (=> b!1206507 (= e!685158 (isEmpty!986 lt!547316))))

(declare-fun b!1206508 () Bool)

(assert (=> b!1206508 (= e!685158 (= lt!547316 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206509 () Bool)

(declare-fun res!802347 () Bool)

(assert (=> b!1206509 (=> (not res!802347) (not e!685159))))

(assert (=> b!1206509 (= res!802347 (not (contains!6926 lt!547316 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1206510 () Bool)

(declare-fun e!685164 () Bool)

(assert (=> b!1206510 (= e!685163 e!685164)))

(assert (=> b!1206510 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38218 lt!547209)))))

(declare-fun res!802345 () Bool)

(assert (=> b!1206510 (= res!802345 (contains!6926 lt!547316 (select (arr!37682 lt!547209) from!1455)))))

(assert (=> b!1206510 (=> (not res!802345) (not e!685164))))

(declare-fun b!1206511 () Bool)

(declare-fun e!685160 () ListLongMap!17705)

(assert (=> b!1206511 (= e!685160 call!58735)))

(declare-fun b!1206512 () Bool)

(declare-fun lt!547319 () Unit!39990)

(declare-fun lt!547318 () Unit!39990)

(assert (=> b!1206512 (= lt!547319 lt!547318)))

(declare-fun lt!547321 () V!45995)

(declare-fun lt!547317 () (_ BitVec 64))

(declare-fun lt!547320 () ListLongMap!17705)

(declare-fun lt!547322 () (_ BitVec 64))

(assert (=> b!1206512 (not (contains!6926 (+!3989 lt!547320 (tuple2!19737 lt!547317 lt!547321)) lt!547322))))

(assert (=> b!1206512 (= lt!547318 (addStillNotContains!292 lt!547320 lt!547317 lt!547321 lt!547322))))

(assert (=> b!1206512 (= lt!547322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206512 (= lt!547321 (get!19203 (select (arr!37683 lt!547202) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206512 (= lt!547317 (select (arr!37682 lt!547209) from!1455))))

(assert (=> b!1206512 (= lt!547320 call!58735)))

(assert (=> b!1206512 (= e!685160 (+!3989 call!58735 (tuple2!19737 (select (arr!37682 lt!547209) from!1455) (get!19203 (select (arr!37683 lt!547202) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132919 () Bool)

(assert (=> d!132919 e!685159))

(declare-fun res!802346 () Bool)

(assert (=> d!132919 (=> (not res!802346) (not e!685159))))

(assert (=> d!132919 (= res!802346 (not (contains!6926 lt!547316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132919 (= lt!547316 e!685161)))

(declare-fun c!118476 () Bool)

(assert (=> d!132919 (= c!118476 (bvsge from!1455 (size!38218 lt!547209)))))

(assert (=> d!132919 (validMask!0 mask!1564)))

(assert (=> d!132919 (= (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547316)))

(declare-fun b!1206505 () Bool)

(assert (=> b!1206505 (= e!685162 (validKeyInArray!0 (select (arr!37682 lt!547209) from!1455)))))

(assert (=> b!1206505 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206513 () Bool)

(assert (=> b!1206513 (= e!685161 e!685160)))

(declare-fun c!118474 () Bool)

(assert (=> b!1206513 (= c!118474 (validKeyInArray!0 (select (arr!37682 lt!547209) from!1455)))))

(declare-fun b!1206514 () Bool)

(assert (=> b!1206514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38218 lt!547209)))))

(assert (=> b!1206514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38219 lt!547202)))))

(assert (=> b!1206514 (= e!685164 (= (apply!964 lt!547316 (select (arr!37682 lt!547209) from!1455)) (get!19203 (select (arr!37683 lt!547202) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132919 c!118476) b!1206506))

(assert (= (and d!132919 (not c!118476)) b!1206513))

(assert (= (and b!1206513 c!118474) b!1206512))

(assert (= (and b!1206513 (not c!118474)) b!1206511))

(assert (= (or b!1206512 b!1206511) bm!58732))

(assert (= (and d!132919 res!802346) b!1206509))

(assert (= (and b!1206509 res!802347) b!1206504))

(assert (= (and b!1206504 res!802344) b!1206505))

(assert (= (and b!1206504 c!118475) b!1206510))

(assert (= (and b!1206504 (not c!118475)) b!1206503))

(assert (= (and b!1206510 res!802345) b!1206514))

(assert (= (and b!1206503 c!118473) b!1206508))

(assert (= (and b!1206503 (not c!118473)) b!1206507))

(declare-fun b_lambda!21353 () Bool)

(assert (=> (not b_lambda!21353) (not b!1206512)))

(assert (=> b!1206512 t!39465))

(declare-fun b_and!42889 () Bool)

(assert (= b_and!42887 (and (=> t!39465 result!22079) b_and!42889)))

(declare-fun b_lambda!21355 () Bool)

(assert (=> (not b_lambda!21355) (not b!1206514)))

(assert (=> b!1206514 t!39465))

(declare-fun b_and!42891 () Bool)

(assert (= b_and!42889 (and (=> t!39465 result!22079) b_and!42891)))

(declare-fun m!1112187 () Bool)

(assert (=> b!1206508 m!1112187))

(declare-fun m!1112189 () Bool)

(assert (=> b!1206509 m!1112189))

(declare-fun m!1112191 () Bool)

(assert (=> d!132919 m!1112191))

(assert (=> d!132919 m!1112019))

(assert (=> bm!58732 m!1112187))

(declare-fun m!1112193 () Bool)

(assert (=> b!1206512 m!1112193))

(assert (=> b!1206512 m!1111989))

(declare-fun m!1112195 () Bool)

(assert (=> b!1206512 m!1112195))

(assert (=> b!1206512 m!1111989))

(declare-fun m!1112197 () Bool)

(assert (=> b!1206512 m!1112197))

(declare-fun m!1112199 () Bool)

(assert (=> b!1206512 m!1112199))

(assert (=> b!1206512 m!1112195))

(declare-fun m!1112201 () Bool)

(assert (=> b!1206512 m!1112201))

(declare-fun m!1112203 () Bool)

(assert (=> b!1206512 m!1112203))

(assert (=> b!1206512 m!1112201))

(declare-fun m!1112205 () Bool)

(assert (=> b!1206512 m!1112205))

(assert (=> b!1206513 m!1112199))

(assert (=> b!1206513 m!1112199))

(declare-fun m!1112207 () Bool)

(assert (=> b!1206513 m!1112207))

(assert (=> b!1206505 m!1112199))

(assert (=> b!1206505 m!1112199))

(assert (=> b!1206505 m!1112207))

(assert (=> b!1206514 m!1112195))

(assert (=> b!1206514 m!1112199))

(declare-fun m!1112209 () Bool)

(assert (=> b!1206514 m!1112209))

(assert (=> b!1206514 m!1111989))

(assert (=> b!1206514 m!1112195))

(assert (=> b!1206514 m!1111989))

(assert (=> b!1206514 m!1112197))

(assert (=> b!1206514 m!1112199))

(assert (=> b!1206510 m!1112199))

(assert (=> b!1206510 m!1112199))

(declare-fun m!1112211 () Bool)

(assert (=> b!1206510 m!1112211))

(declare-fun m!1112213 () Bool)

(assert (=> b!1206507 m!1112213))

(assert (=> b!1206303 d!132919))

(declare-fun bm!58733 () Bool)

(declare-fun call!58736 () ListLongMap!17705)

(assert (=> bm!58733 (= call!58736 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206515 () Bool)

(declare-fun e!685170 () Bool)

(declare-fun e!685165 () Bool)

(assert (=> b!1206515 (= e!685170 e!685165)))

(declare-fun c!118477 () Bool)

(assert (=> b!1206515 (= c!118477 (bvslt from!1455 (size!38218 _keys!1208)))))

(declare-fun b!1206516 () Bool)

(declare-fun e!685166 () Bool)

(assert (=> b!1206516 (= e!685166 e!685170)))

(declare-fun c!118479 () Bool)

(declare-fun e!685169 () Bool)

(assert (=> b!1206516 (= c!118479 e!685169)))

(declare-fun res!802348 () Bool)

(assert (=> b!1206516 (=> (not res!802348) (not e!685169))))

(assert (=> b!1206516 (= res!802348 (bvslt from!1455 (size!38218 _keys!1208)))))

(declare-fun b!1206518 () Bool)

(declare-fun e!685168 () ListLongMap!17705)

(assert (=> b!1206518 (= e!685168 (ListLongMap!17706 Nil!26537))))

(declare-fun b!1206519 () Bool)

(declare-fun lt!547323 () ListLongMap!17705)

(assert (=> b!1206519 (= e!685165 (isEmpty!986 lt!547323))))

(declare-fun b!1206520 () Bool)

(assert (=> b!1206520 (= e!685165 (= lt!547323 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206521 () Bool)

(declare-fun res!802351 () Bool)

(assert (=> b!1206521 (=> (not res!802351) (not e!685166))))

(assert (=> b!1206521 (= res!802351 (not (contains!6926 lt!547323 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1206522 () Bool)

(declare-fun e!685171 () Bool)

(assert (=> b!1206522 (= e!685170 e!685171)))

(assert (=> b!1206522 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38218 _keys!1208)))))

(declare-fun res!802349 () Bool)

(assert (=> b!1206522 (= res!802349 (contains!6926 lt!547323 (select (arr!37682 _keys!1208) from!1455)))))

(assert (=> b!1206522 (=> (not res!802349) (not e!685171))))

(declare-fun b!1206523 () Bool)

(declare-fun e!685167 () ListLongMap!17705)

(assert (=> b!1206523 (= e!685167 call!58736)))

(declare-fun b!1206524 () Bool)

(declare-fun lt!547326 () Unit!39990)

(declare-fun lt!547325 () Unit!39990)

(assert (=> b!1206524 (= lt!547326 lt!547325)))

(declare-fun lt!547327 () ListLongMap!17705)

(declare-fun lt!547329 () (_ BitVec 64))

(declare-fun lt!547324 () (_ BitVec 64))

(declare-fun lt!547328 () V!45995)

(assert (=> b!1206524 (not (contains!6926 (+!3989 lt!547327 (tuple2!19737 lt!547324 lt!547328)) lt!547329))))

(assert (=> b!1206524 (= lt!547325 (addStillNotContains!292 lt!547327 lt!547324 lt!547328 lt!547329))))

(assert (=> b!1206524 (= lt!547329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206524 (= lt!547328 (get!19203 (select (arr!37683 _values!996) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206524 (= lt!547324 (select (arr!37682 _keys!1208) from!1455))))

(assert (=> b!1206524 (= lt!547327 call!58736)))

(assert (=> b!1206524 (= e!685167 (+!3989 call!58736 (tuple2!19737 (select (arr!37682 _keys!1208) from!1455) (get!19203 (select (arr!37683 _values!996) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132921 () Bool)

(assert (=> d!132921 e!685166))

(declare-fun res!802350 () Bool)

(assert (=> d!132921 (=> (not res!802350) (not e!685166))))

(assert (=> d!132921 (= res!802350 (not (contains!6926 lt!547323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132921 (= lt!547323 e!685168)))

(declare-fun c!118480 () Bool)

(assert (=> d!132921 (= c!118480 (bvsge from!1455 (size!38218 _keys!1208)))))

(assert (=> d!132921 (validMask!0 mask!1564)))

(assert (=> d!132921 (= (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547323)))

(declare-fun b!1206517 () Bool)

(assert (=> b!1206517 (= e!685169 (validKeyInArray!0 (select (arr!37682 _keys!1208) from!1455)))))

(assert (=> b!1206517 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206525 () Bool)

(assert (=> b!1206525 (= e!685168 e!685167)))

(declare-fun c!118478 () Bool)

(assert (=> b!1206525 (= c!118478 (validKeyInArray!0 (select (arr!37682 _keys!1208) from!1455)))))

(declare-fun b!1206526 () Bool)

(assert (=> b!1206526 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38218 _keys!1208)))))

(assert (=> b!1206526 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38219 _values!996)))))

(assert (=> b!1206526 (= e!685171 (= (apply!964 lt!547323 (select (arr!37682 _keys!1208) from!1455)) (get!19203 (select (arr!37683 _values!996) from!1455) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132921 c!118480) b!1206518))

(assert (= (and d!132921 (not c!118480)) b!1206525))

(assert (= (and b!1206525 c!118478) b!1206524))

(assert (= (and b!1206525 (not c!118478)) b!1206523))

(assert (= (or b!1206524 b!1206523) bm!58733))

(assert (= (and d!132921 res!802350) b!1206521))

(assert (= (and b!1206521 res!802351) b!1206516))

(assert (= (and b!1206516 res!802348) b!1206517))

(assert (= (and b!1206516 c!118479) b!1206522))

(assert (= (and b!1206516 (not c!118479)) b!1206515))

(assert (= (and b!1206522 res!802349) b!1206526))

(assert (= (and b!1206515 c!118477) b!1206520))

(assert (= (and b!1206515 (not c!118477)) b!1206519))

(declare-fun b_lambda!21357 () Bool)

(assert (=> (not b_lambda!21357) (not b!1206524)))

(assert (=> b!1206524 t!39465))

(declare-fun b_and!42893 () Bool)

(assert (= b_and!42891 (and (=> t!39465 result!22079) b_and!42893)))

(declare-fun b_lambda!21359 () Bool)

(assert (=> (not b_lambda!21359) (not b!1206526)))

(assert (=> b!1206526 t!39465))

(declare-fun b_and!42895 () Bool)

(assert (= b_and!42893 (and (=> t!39465 result!22079) b_and!42895)))

(declare-fun m!1112215 () Bool)

(assert (=> b!1206520 m!1112215))

(declare-fun m!1112217 () Bool)

(assert (=> b!1206521 m!1112217))

(declare-fun m!1112219 () Bool)

(assert (=> d!132921 m!1112219))

(assert (=> d!132921 m!1112019))

(assert (=> bm!58733 m!1112215))

(declare-fun m!1112221 () Bool)

(assert (=> b!1206524 m!1112221))

(assert (=> b!1206524 m!1111989))

(declare-fun m!1112223 () Bool)

(assert (=> b!1206524 m!1112223))

(assert (=> b!1206524 m!1111989))

(declare-fun m!1112225 () Bool)

(assert (=> b!1206524 m!1112225))

(assert (=> b!1206524 m!1112011))

(assert (=> b!1206524 m!1112223))

(declare-fun m!1112227 () Bool)

(assert (=> b!1206524 m!1112227))

(declare-fun m!1112229 () Bool)

(assert (=> b!1206524 m!1112229))

(assert (=> b!1206524 m!1112227))

(declare-fun m!1112231 () Bool)

(assert (=> b!1206524 m!1112231))

(assert (=> b!1206525 m!1112011))

(assert (=> b!1206525 m!1112011))

(assert (=> b!1206525 m!1112149))

(assert (=> b!1206517 m!1112011))

(assert (=> b!1206517 m!1112011))

(assert (=> b!1206517 m!1112149))

(assert (=> b!1206526 m!1112223))

(assert (=> b!1206526 m!1112011))

(declare-fun m!1112233 () Bool)

(assert (=> b!1206526 m!1112233))

(assert (=> b!1206526 m!1111989))

(assert (=> b!1206526 m!1112223))

(assert (=> b!1206526 m!1111989))

(assert (=> b!1206526 m!1112225))

(assert (=> b!1206526 m!1112011))

(assert (=> b!1206522 m!1112011))

(assert (=> b!1206522 m!1112011))

(declare-fun m!1112235 () Bool)

(assert (=> b!1206522 m!1112235))

(declare-fun m!1112237 () Bool)

(assert (=> b!1206519 m!1112237))

(assert (=> b!1206303 d!132921))

(declare-fun bm!58734 () Bool)

(declare-fun call!58737 () ListLongMap!17705)

(assert (=> bm!58734 (= call!58737 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206527 () Bool)

(declare-fun e!685177 () Bool)

(declare-fun e!685172 () Bool)

(assert (=> b!1206527 (= e!685177 e!685172)))

(declare-fun c!118481 () Bool)

(assert (=> b!1206527 (= c!118481 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 lt!547209)))))

(declare-fun b!1206528 () Bool)

(declare-fun e!685173 () Bool)

(assert (=> b!1206528 (= e!685173 e!685177)))

(declare-fun c!118483 () Bool)

(declare-fun e!685176 () Bool)

(assert (=> b!1206528 (= c!118483 e!685176)))

(declare-fun res!802352 () Bool)

(assert (=> b!1206528 (=> (not res!802352) (not e!685176))))

(assert (=> b!1206528 (= res!802352 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 lt!547209)))))

(declare-fun b!1206530 () Bool)

(declare-fun e!685175 () ListLongMap!17705)

(assert (=> b!1206530 (= e!685175 (ListLongMap!17706 Nil!26537))))

(declare-fun b!1206531 () Bool)

(declare-fun lt!547330 () ListLongMap!17705)

(assert (=> b!1206531 (= e!685172 (isEmpty!986 lt!547330))))

(declare-fun b!1206532 () Bool)

(assert (=> b!1206532 (= e!685172 (= lt!547330 (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206533 () Bool)

(declare-fun res!802355 () Bool)

(assert (=> b!1206533 (=> (not res!802355) (not e!685173))))

(assert (=> b!1206533 (= res!802355 (not (contains!6926 lt!547330 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1206534 () Bool)

(declare-fun e!685178 () Bool)

(assert (=> b!1206534 (= e!685177 e!685178)))

(assert (=> b!1206534 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 lt!547209)))))

(declare-fun res!802353 () Bool)

(assert (=> b!1206534 (= res!802353 (contains!6926 lt!547330 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206534 (=> (not res!802353) (not e!685178))))

(declare-fun b!1206535 () Bool)

(declare-fun e!685174 () ListLongMap!17705)

(assert (=> b!1206535 (= e!685174 call!58737)))

(declare-fun b!1206536 () Bool)

(declare-fun lt!547333 () Unit!39990)

(declare-fun lt!547332 () Unit!39990)

(assert (=> b!1206536 (= lt!547333 lt!547332)))

(declare-fun lt!547336 () (_ BitVec 64))

(declare-fun lt!547331 () (_ BitVec 64))

(declare-fun lt!547335 () V!45995)

(declare-fun lt!547334 () ListLongMap!17705)

(assert (=> b!1206536 (not (contains!6926 (+!3989 lt!547334 (tuple2!19737 lt!547331 lt!547335)) lt!547336))))

(assert (=> b!1206536 (= lt!547332 (addStillNotContains!292 lt!547334 lt!547331 lt!547335 lt!547336))))

(assert (=> b!1206536 (= lt!547336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206536 (= lt!547335 (get!19203 (select (arr!37683 lt!547202) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206536 (= lt!547331 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1206536 (= lt!547334 call!58737)))

(assert (=> b!1206536 (= e!685174 (+!3989 call!58737 (tuple2!19737 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19203 (select (arr!37683 lt!547202) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!132923 () Bool)

(assert (=> d!132923 e!685173))

(declare-fun res!802354 () Bool)

(assert (=> d!132923 (=> (not res!802354) (not e!685173))))

(assert (=> d!132923 (= res!802354 (not (contains!6926 lt!547330 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132923 (= lt!547330 e!685175)))

(declare-fun c!118484 () Bool)

(assert (=> d!132923 (= c!118484 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 lt!547209)))))

(assert (=> d!132923 (validMask!0 mask!1564)))

(assert (=> d!132923 (= (getCurrentListMapNoExtraKeys!5303 lt!547209 lt!547202 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547330)))

(declare-fun b!1206529 () Bool)

(assert (=> b!1206529 (= e!685176 (validKeyInArray!0 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206529 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206537 () Bool)

(assert (=> b!1206537 (= e!685175 e!685174)))

(declare-fun c!118482 () Bool)

(assert (=> b!1206537 (= c!118482 (validKeyInArray!0 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1206538 () Bool)

(assert (=> b!1206538 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 lt!547209)))))

(assert (=> b!1206538 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38219 lt!547202)))))

(assert (=> b!1206538 (= e!685178 (= (apply!964 lt!547330 (select (arr!37682 lt!547209) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19203 (select (arr!37683 lt!547202) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132923 c!118484) b!1206530))

(assert (= (and d!132923 (not c!118484)) b!1206537))

(assert (= (and b!1206537 c!118482) b!1206536))

(assert (= (and b!1206537 (not c!118482)) b!1206535))

(assert (= (or b!1206536 b!1206535) bm!58734))

(assert (= (and d!132923 res!802354) b!1206533))

(assert (= (and b!1206533 res!802355) b!1206528))

(assert (= (and b!1206528 res!802352) b!1206529))

(assert (= (and b!1206528 c!118483) b!1206534))

(assert (= (and b!1206528 (not c!118483)) b!1206527))

(assert (= (and b!1206534 res!802353) b!1206538))

(assert (= (and b!1206527 c!118481) b!1206532))

(assert (= (and b!1206527 (not c!118481)) b!1206531))

(declare-fun b_lambda!21361 () Bool)

(assert (=> (not b_lambda!21361) (not b!1206536)))

(assert (=> b!1206536 t!39465))

(declare-fun b_and!42897 () Bool)

(assert (= b_and!42895 (and (=> t!39465 result!22079) b_and!42897)))

(declare-fun b_lambda!21363 () Bool)

(assert (=> (not b_lambda!21363) (not b!1206538)))

(assert (=> b!1206538 t!39465))

(declare-fun b_and!42899 () Bool)

(assert (= b_and!42897 (and (=> t!39465 result!22079) b_and!42899)))

(declare-fun m!1112239 () Bool)

(assert (=> b!1206532 m!1112239))

(declare-fun m!1112241 () Bool)

(assert (=> b!1206533 m!1112241))

(declare-fun m!1112243 () Bool)

(assert (=> d!132923 m!1112243))

(assert (=> d!132923 m!1112019))

(assert (=> bm!58734 m!1112239))

(declare-fun m!1112245 () Bool)

(assert (=> b!1206536 m!1112245))

(assert (=> b!1206536 m!1111989))

(declare-fun m!1112247 () Bool)

(assert (=> b!1206536 m!1112247))

(assert (=> b!1206536 m!1111989))

(declare-fun m!1112249 () Bool)

(assert (=> b!1206536 m!1112249))

(declare-fun m!1112251 () Bool)

(assert (=> b!1206536 m!1112251))

(assert (=> b!1206536 m!1112247))

(declare-fun m!1112253 () Bool)

(assert (=> b!1206536 m!1112253))

(declare-fun m!1112255 () Bool)

(assert (=> b!1206536 m!1112255))

(assert (=> b!1206536 m!1112253))

(declare-fun m!1112257 () Bool)

(assert (=> b!1206536 m!1112257))

(assert (=> b!1206537 m!1112251))

(assert (=> b!1206537 m!1112251))

(declare-fun m!1112259 () Bool)

(assert (=> b!1206537 m!1112259))

(assert (=> b!1206529 m!1112251))

(assert (=> b!1206529 m!1112251))

(assert (=> b!1206529 m!1112259))

(assert (=> b!1206538 m!1112247))

(assert (=> b!1206538 m!1112251))

(declare-fun m!1112261 () Bool)

(assert (=> b!1206538 m!1112261))

(assert (=> b!1206538 m!1111989))

(assert (=> b!1206538 m!1112247))

(assert (=> b!1206538 m!1111989))

(assert (=> b!1206538 m!1112249))

(assert (=> b!1206538 m!1112251))

(assert (=> b!1206534 m!1112251))

(assert (=> b!1206534 m!1112251))

(declare-fun m!1112263 () Bool)

(assert (=> b!1206534 m!1112263))

(declare-fun m!1112265 () Bool)

(assert (=> b!1206531 m!1112265))

(assert (=> bm!58695 d!132923))

(declare-fun d!132925 () Bool)

(declare-fun e!685183 () Bool)

(assert (=> d!132925 e!685183))

(declare-fun res!802358 () Bool)

(assert (=> d!132925 (=> res!802358 e!685183)))

(declare-fun lt!547345 () Bool)

(assert (=> d!132925 (= res!802358 (not lt!547345))))

(declare-fun lt!547348 () Bool)

(assert (=> d!132925 (= lt!547345 lt!547348)))

(declare-fun lt!547347 () Unit!39990)

(declare-fun e!685184 () Unit!39990)

(assert (=> d!132925 (= lt!547347 e!685184)))

(declare-fun c!118487 () Bool)

(assert (=> d!132925 (= c!118487 lt!547348)))

(declare-fun containsKey!591 (List!26540 (_ BitVec 64)) Bool)

(assert (=> d!132925 (= lt!547348 (containsKey!591 (toList!8868 lt!547204) k0!934))))

(assert (=> d!132925 (= (contains!6926 lt!547204 k0!934) lt!547345)))

(declare-fun b!1206545 () Bool)

(declare-fun lt!547346 () Unit!39990)

(assert (=> b!1206545 (= e!685184 lt!547346)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!421 (List!26540 (_ BitVec 64)) Unit!39990)

(assert (=> b!1206545 (= lt!547346 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8868 lt!547204) k0!934))))

(declare-fun isDefined!460 (Option!686) Bool)

(assert (=> b!1206545 (isDefined!460 (getValueByKey!635 (toList!8868 lt!547204) k0!934))))

(declare-fun b!1206546 () Bool)

(declare-fun Unit!39996 () Unit!39990)

(assert (=> b!1206546 (= e!685184 Unit!39996)))

(declare-fun b!1206547 () Bool)

(assert (=> b!1206547 (= e!685183 (isDefined!460 (getValueByKey!635 (toList!8868 lt!547204) k0!934)))))

(assert (= (and d!132925 c!118487) b!1206545))

(assert (= (and d!132925 (not c!118487)) b!1206546))

(assert (= (and d!132925 (not res!802358)) b!1206547))

(declare-fun m!1112267 () Bool)

(assert (=> d!132925 m!1112267))

(declare-fun m!1112269 () Bool)

(assert (=> b!1206545 m!1112269))

(declare-fun m!1112271 () Bool)

(assert (=> b!1206545 m!1112271))

(assert (=> b!1206545 m!1112271))

(declare-fun m!1112273 () Bool)

(assert (=> b!1206545 m!1112273))

(assert (=> b!1206547 m!1112271))

(assert (=> b!1206547 m!1112271))

(assert (=> b!1206547 m!1112273))

(assert (=> b!1206316 d!132925))

(assert (=> b!1206316 d!132899))

(declare-fun d!132927 () Bool)

(assert (=> d!132927 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1206317 d!132927))

(declare-fun d!132929 () Bool)

(assert (=> d!132929 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1206310 d!132929))

(declare-fun b!1206554 () Bool)

(declare-fun e!685189 () Bool)

(declare-fun call!58743 () ListLongMap!17705)

(declare-fun call!58742 () ListLongMap!17705)

(assert (=> b!1206554 (= e!685189 (= call!58743 call!58742))))

(assert (=> b!1206554 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38219 _values!996)))))

(declare-fun b!1206555 () Bool)

(declare-fun e!685190 () Bool)

(assert (=> b!1206555 (= e!685190 e!685189)))

(declare-fun c!118490 () Bool)

(assert (=> b!1206555 (= c!118490 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!58739 () Bool)

(assert (=> bm!58739 (= call!58742 (getCurrentListMapNoExtraKeys!5303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132931 () Bool)

(assert (=> d!132931 e!685190))

(declare-fun res!802361 () Bool)

(assert (=> d!132931 (=> (not res!802361) (not e!685190))))

(assert (=> d!132931 (= res!802361 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38218 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38218 _keys!1208))))))))

(declare-fun lt!547351 () Unit!39990)

(declare-fun choose!1799 (array!78083 array!78085 (_ BitVec 32) (_ BitVec 32) V!45995 V!45995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39990)

(assert (=> d!132931 (= lt!547351 (choose!1799 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132931 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38218 _keys!1208)))))

(assert (=> d!132931 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547351)))

(declare-fun bm!58740 () Bool)

(assert (=> bm!58740 (= call!58743 (getCurrentListMapNoExtraKeys!5303 (array!78084 (store (arr!37682 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38218 _keys!1208)) (array!78086 (store (arr!37683 _values!996) i!673 (ValueCellFull!14616 (dynLambda!3209 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38219 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206556 () Bool)

(assert (=> b!1206556 (= e!685189 (= call!58743 (-!1826 call!58742 k0!934)))))

(assert (=> b!1206556 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38219 _values!996)))))

(assert (= (and d!132931 res!802361) b!1206555))

(assert (= (and b!1206555 c!118490) b!1206556))

(assert (= (and b!1206555 (not c!118490)) b!1206554))

(assert (= (or b!1206556 b!1206554) bm!58739))

(assert (= (or b!1206556 b!1206554) bm!58740))

(declare-fun b_lambda!21365 () Bool)

(assert (=> (not b_lambda!21365) (not bm!58740)))

(assert (=> bm!58740 t!39465))

(declare-fun b_and!42901 () Bool)

(assert (= b_and!42899 (and (=> t!39465 result!22079) b_and!42901)))

(assert (=> bm!58739 m!1111981))

(declare-fun m!1112275 () Bool)

(assert (=> d!132931 m!1112275))

(assert (=> bm!58740 m!1111997))

(assert (=> bm!58740 m!1111989))

(assert (=> bm!58740 m!1111991))

(declare-fun m!1112277 () Bool)

(assert (=> bm!58740 m!1112277))

(declare-fun m!1112279 () Bool)

(assert (=> b!1206556 m!1112279))

(assert (=> b!1206308 d!132931))

(declare-fun d!132933 () Bool)

(assert (=> d!132933 (= (array_inv!28706 _keys!1208) (bvsge (size!38218 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100776 d!132933))

(declare-fun d!132935 () Bool)

(assert (=> d!132935 (= (array_inv!28707 _values!996) (bvsge (size!38219 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100776 d!132935))

(declare-fun d!132937 () Bool)

(assert (=> d!132937 (contains!6926 (+!3989 lt!547204 (tuple2!19737 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!547354 () Unit!39990)

(declare-fun choose!1800 (ListLongMap!17705 (_ BitVec 64) V!45995 (_ BitVec 64)) Unit!39990)

(assert (=> d!132937 (= lt!547354 (choose!1800 lt!547204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132937 (contains!6926 lt!547204 k0!934)))

(assert (=> d!132937 (= (addStillContains!1018 lt!547204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!547354)))

(declare-fun bs!34118 () Bool)

(assert (= bs!34118 d!132937))

(declare-fun m!1112281 () Bool)

(assert (=> bs!34118 m!1112281))

(assert (=> bs!34118 m!1112281))

(declare-fun m!1112283 () Bool)

(assert (=> bs!34118 m!1112283))

(declare-fun m!1112285 () Bool)

(assert (=> bs!34118 m!1112285))

(assert (=> bs!34118 m!1111985))

(assert (=> b!1206318 d!132937))

(declare-fun d!132939 () Bool)

(declare-fun e!685191 () Bool)

(assert (=> d!132939 e!685191))

(declare-fun res!802362 () Bool)

(assert (=> d!132939 (=> res!802362 e!685191)))

(declare-fun lt!547355 () Bool)

(assert (=> d!132939 (= res!802362 (not lt!547355))))

(declare-fun lt!547358 () Bool)

(assert (=> d!132939 (= lt!547355 lt!547358)))

(declare-fun lt!547357 () Unit!39990)

(declare-fun e!685192 () Unit!39990)

(assert (=> d!132939 (= lt!547357 e!685192)))

(declare-fun c!118491 () Bool)

(assert (=> d!132939 (= c!118491 lt!547358)))

(assert (=> d!132939 (= lt!547358 (containsKey!591 (toList!8868 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132939 (= (contains!6926 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!547355)))

(declare-fun b!1206558 () Bool)

(declare-fun lt!547356 () Unit!39990)

(assert (=> b!1206558 (= e!685192 lt!547356)))

(assert (=> b!1206558 (= lt!547356 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8868 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1206558 (isDefined!460 (getValueByKey!635 (toList!8868 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1206559 () Bool)

(declare-fun Unit!39997 () Unit!39990)

(assert (=> b!1206559 (= e!685192 Unit!39997)))

(declare-fun b!1206560 () Bool)

(assert (=> b!1206560 (= e!685191 (isDefined!460 (getValueByKey!635 (toList!8868 (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132939 c!118491) b!1206558))

(assert (= (and d!132939 (not c!118491)) b!1206559))

(assert (= (and d!132939 (not res!802362)) b!1206560))

(declare-fun m!1112287 () Bool)

(assert (=> d!132939 m!1112287))

(declare-fun m!1112289 () Bool)

(assert (=> b!1206558 m!1112289))

(declare-fun m!1112291 () Bool)

(assert (=> b!1206558 m!1112291))

(assert (=> b!1206558 m!1112291))

(declare-fun m!1112293 () Bool)

(assert (=> b!1206558 m!1112293))

(assert (=> b!1206560 m!1112291))

(assert (=> b!1206560 m!1112291))

(assert (=> b!1206560 m!1112293))

(assert (=> b!1206318 d!132939))

(declare-fun d!132941 () Bool)

(declare-fun e!685193 () Bool)

(assert (=> d!132941 e!685193))

(declare-fun res!802364 () Bool)

(assert (=> d!132941 (=> (not res!802364) (not e!685193))))

(declare-fun lt!547362 () ListLongMap!17705)

(assert (=> d!132941 (= res!802364 (contains!6926 lt!547362 (_1!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!547361 () List!26540)

(assert (=> d!132941 (= lt!547362 (ListLongMap!17706 lt!547361))))

(declare-fun lt!547360 () Unit!39990)

(declare-fun lt!547359 () Unit!39990)

(assert (=> d!132941 (= lt!547360 lt!547359)))

(assert (=> d!132941 (= (getValueByKey!635 lt!547361 (_1!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!685 (_2!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132941 (= lt!547359 (lemmaContainsTupThenGetReturnValue!312 lt!547361 (_1!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132941 (= lt!547361 (insertStrictlySorted!405 (toList!8868 lt!547207) (_1!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132941 (= (+!3989 lt!547207 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!547362)))

(declare-fun b!1206561 () Bool)

(declare-fun res!802363 () Bool)

(assert (=> b!1206561 (=> (not res!802363) (not e!685193))))

(assert (=> b!1206561 (= res!802363 (= (getValueByKey!635 (toList!8868 lt!547362) (_1!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!685 (_2!9879 (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206562 () Bool)

(assert (=> b!1206562 (= e!685193 (contains!6929 (toList!8868 lt!547362) (tuple2!19737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132941 res!802364) b!1206561))

(assert (= (and b!1206561 res!802363) b!1206562))

(declare-fun m!1112295 () Bool)

(assert (=> d!132941 m!1112295))

(declare-fun m!1112297 () Bool)

(assert (=> d!132941 m!1112297))

(declare-fun m!1112299 () Bool)

(assert (=> d!132941 m!1112299))

(declare-fun m!1112301 () Bool)

(assert (=> d!132941 m!1112301))

(declare-fun m!1112303 () Bool)

(assert (=> b!1206561 m!1112303))

(declare-fun m!1112305 () Bool)

(assert (=> b!1206562 m!1112305))

(assert (=> b!1206318 d!132941))

(assert (=> b!1206302 d!132895))

(declare-fun d!132943 () Bool)

(assert (=> d!132943 (contains!6926 (+!3989 (ite c!118434 lt!547207 lt!547204) (tuple2!19737 (ite c!118434 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118431 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118434 minValue!944 (ite c!118431 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!547363 () Unit!39990)

(assert (=> d!132943 (= lt!547363 (choose!1800 (ite c!118434 lt!547207 lt!547204) (ite c!118434 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118431 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118434 minValue!944 (ite c!118431 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132943 (contains!6926 (ite c!118434 lt!547207 lt!547204) k0!934)))

(assert (=> d!132943 (= (addStillContains!1018 (ite c!118434 lt!547207 lt!547204) (ite c!118434 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118431 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118434 minValue!944 (ite c!118431 zeroValue!944 minValue!944)) k0!934) lt!547363)))

(declare-fun bs!34119 () Bool)

(assert (= bs!34119 d!132943))

(declare-fun m!1112307 () Bool)

(assert (=> bs!34119 m!1112307))

(assert (=> bs!34119 m!1112307))

(declare-fun m!1112309 () Bool)

(assert (=> bs!34119 m!1112309))

(declare-fun m!1112311 () Bool)

(assert (=> bs!34119 m!1112311))

(declare-fun m!1112313 () Bool)

(assert (=> bs!34119 m!1112313))

(assert (=> bm!58694 d!132943))

(declare-fun b!1206563 () Bool)

(declare-fun e!685197 () Bool)

(declare-fun call!58744 () Bool)

(assert (=> b!1206563 (= e!685197 call!58744)))

(declare-fun b!1206564 () Bool)

(declare-fun e!685195 () Bool)

(assert (=> b!1206564 (= e!685195 e!685197)))

(declare-fun c!118492 () Bool)

(assert (=> b!1206564 (= c!118492 (validKeyInArray!0 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58741 () Bool)

(assert (=> bm!58741 (= call!58744 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118492 (Cons!26535 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000) Nil!26536) Nil!26536)))))

(declare-fun b!1206565 () Bool)

(assert (=> b!1206565 (= e!685197 call!58744)))

(declare-fun b!1206566 () Bool)

(declare-fun e!685196 () Bool)

(assert (=> b!1206566 (= e!685196 (contains!6928 Nil!26536 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206567 () Bool)

(declare-fun e!685194 () Bool)

(assert (=> b!1206567 (= e!685194 e!685195)))

(declare-fun res!802367 () Bool)

(assert (=> b!1206567 (=> (not res!802367) (not e!685195))))

(assert (=> b!1206567 (= res!802367 (not e!685196))))

(declare-fun res!802365 () Bool)

(assert (=> b!1206567 (=> (not res!802365) (not e!685196))))

(assert (=> b!1206567 (= res!802365 (validKeyInArray!0 (select (arr!37682 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132945 () Bool)

(declare-fun res!802366 () Bool)

(assert (=> d!132945 (=> res!802366 e!685194)))

(assert (=> d!132945 (= res!802366 (bvsge #b00000000000000000000000000000000 (size!38218 _keys!1208)))))

(assert (=> d!132945 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26536) e!685194)))

(assert (= (and d!132945 (not res!802366)) b!1206567))

(assert (= (and b!1206567 res!802365) b!1206566))

(assert (= (and b!1206567 res!802367) b!1206564))

(assert (= (and b!1206564 c!118492) b!1206565))

(assert (= (and b!1206564 (not c!118492)) b!1206563))

(assert (= (or b!1206565 b!1206563) bm!58741))

(assert (=> b!1206564 m!1112103))

(assert (=> b!1206564 m!1112103))

(assert (=> b!1206564 m!1112111))

(assert (=> bm!58741 m!1112103))

(declare-fun m!1112315 () Bool)

(assert (=> bm!58741 m!1112315))

(assert (=> b!1206566 m!1112103))

(assert (=> b!1206566 m!1112103))

(declare-fun m!1112317 () Bool)

(assert (=> b!1206566 m!1112317))

(assert (=> b!1206567 m!1112103))

(assert (=> b!1206567 m!1112103))

(assert (=> b!1206567 m!1112111))

(assert (=> b!1206301 d!132945))

(declare-fun d!132947 () Bool)

(declare-fun e!685198 () Bool)

(assert (=> d!132947 e!685198))

(declare-fun res!802368 () Bool)

(assert (=> d!132947 (=> res!802368 e!685198)))

(declare-fun lt!547364 () Bool)

(assert (=> d!132947 (= res!802368 (not lt!547364))))

(declare-fun lt!547367 () Bool)

(assert (=> d!132947 (= lt!547364 lt!547367)))

(declare-fun lt!547366 () Unit!39990)

(declare-fun e!685199 () Unit!39990)

(assert (=> d!132947 (= lt!547366 e!685199)))

(declare-fun c!118493 () Bool)

(assert (=> d!132947 (= c!118493 lt!547367)))

(assert (=> d!132947 (= lt!547367 (containsKey!591 (toList!8868 (ite c!118434 lt!547207 call!58692)) k0!934))))

(assert (=> d!132947 (= (contains!6926 (ite c!118434 lt!547207 call!58692) k0!934) lt!547364)))

(declare-fun b!1206568 () Bool)

(declare-fun lt!547365 () Unit!39990)

(assert (=> b!1206568 (= e!685199 lt!547365)))

(assert (=> b!1206568 (= lt!547365 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8868 (ite c!118434 lt!547207 call!58692)) k0!934))))

(assert (=> b!1206568 (isDefined!460 (getValueByKey!635 (toList!8868 (ite c!118434 lt!547207 call!58692)) k0!934))))

(declare-fun b!1206569 () Bool)

(declare-fun Unit!39998 () Unit!39990)

(assert (=> b!1206569 (= e!685199 Unit!39998)))

(declare-fun b!1206570 () Bool)

(assert (=> b!1206570 (= e!685198 (isDefined!460 (getValueByKey!635 (toList!8868 (ite c!118434 lt!547207 call!58692)) k0!934)))))

(assert (= (and d!132947 c!118493) b!1206568))

(assert (= (and d!132947 (not c!118493)) b!1206569))

(assert (= (and d!132947 (not res!802368)) b!1206570))

(declare-fun m!1112319 () Bool)

(assert (=> d!132947 m!1112319))

(declare-fun m!1112321 () Bool)

(assert (=> b!1206568 m!1112321))

(declare-fun m!1112323 () Bool)

(assert (=> b!1206568 m!1112323))

(assert (=> b!1206568 m!1112323))

(declare-fun m!1112325 () Bool)

(assert (=> b!1206568 m!1112325))

(assert (=> b!1206570 m!1112323))

(assert (=> b!1206570 m!1112323))

(assert (=> b!1206570 m!1112325))

(assert (=> bm!58693 d!132947))

(declare-fun b!1206577 () Bool)

(declare-fun e!685204 () Bool)

(assert (=> b!1206577 (= e!685204 tp_is_empty!30651)))

(declare-fun condMapEmpty!47838 () Bool)

(declare-fun mapDefault!47838 () ValueCell!14616)

(assert (=> mapNonEmpty!47832 (= condMapEmpty!47838 (= mapRest!47832 ((as const (Array (_ BitVec 32) ValueCell!14616)) mapDefault!47838)))))

(declare-fun e!685205 () Bool)

(declare-fun mapRes!47838 () Bool)

(assert (=> mapNonEmpty!47832 (= tp!90843 (and e!685205 mapRes!47838))))

(declare-fun b!1206578 () Bool)

(assert (=> b!1206578 (= e!685205 tp_is_empty!30651)))

(declare-fun mapNonEmpty!47838 () Bool)

(declare-fun tp!90853 () Bool)

(assert (=> mapNonEmpty!47838 (= mapRes!47838 (and tp!90853 e!685204))))

(declare-fun mapRest!47838 () (Array (_ BitVec 32) ValueCell!14616))

(declare-fun mapKey!47838 () (_ BitVec 32))

(declare-fun mapValue!47838 () ValueCell!14616)

(assert (=> mapNonEmpty!47838 (= mapRest!47832 (store mapRest!47838 mapKey!47838 mapValue!47838))))

(declare-fun mapIsEmpty!47838 () Bool)

(assert (=> mapIsEmpty!47838 mapRes!47838))

(assert (= (and mapNonEmpty!47832 condMapEmpty!47838) mapIsEmpty!47838))

(assert (= (and mapNonEmpty!47832 (not condMapEmpty!47838)) mapNonEmpty!47838))

(assert (= (and mapNonEmpty!47838 ((_ is ValueCellFull!14616) mapValue!47838)) b!1206577))

(assert (= (and mapNonEmpty!47832 ((_ is ValueCellFull!14616) mapDefault!47838)) b!1206578))

(declare-fun m!1112327 () Bool)

(assert (=> mapNonEmpty!47838 m!1112327))

(declare-fun b_lambda!21367 () Bool)

(assert (= b_lambda!21353 (or (and start!100776 b_free!25947) b_lambda!21367)))

(declare-fun b_lambda!21369 () Bool)

(assert (= b_lambda!21351 (or (and start!100776 b_free!25947) b_lambda!21369)))

(declare-fun b_lambda!21371 () Bool)

(assert (= b_lambda!21349 (or (and start!100776 b_free!25947) b_lambda!21371)))

(declare-fun b_lambda!21373 () Bool)

(assert (= b_lambda!21359 (or (and start!100776 b_free!25947) b_lambda!21373)))

(declare-fun b_lambda!21375 () Bool)

(assert (= b_lambda!21365 (or (and start!100776 b_free!25947) b_lambda!21375)))

(declare-fun b_lambda!21377 () Bool)

(assert (= b_lambda!21357 (or (and start!100776 b_free!25947) b_lambda!21377)))

(declare-fun b_lambda!21379 () Bool)

(assert (= b_lambda!21361 (or (and start!100776 b_free!25947) b_lambda!21379)))

(declare-fun b_lambda!21381 () Bool)

(assert (= b_lambda!21355 (or (and start!100776 b_free!25947) b_lambda!21381)))

(declare-fun b_lambda!21383 () Bool)

(assert (= b_lambda!21363 (or (and start!100776 b_free!25947) b_lambda!21383)))

(check-sat (not b!1206532) (not bm!58739) (not b!1206570) (not b_lambda!21381) (not b!1206507) (not b!1206517) (not b!1206567) (not d!132921) (not d!132947) (not b!1206531) (not bm!58729) (not d!132915) (not d!132901) (not b!1206499) (not b!1206534) (not b!1206562) (not b!1206458) (not b!1206556) (not bm!58723) (not d!132937) (not b!1206526) (not d!132925) (not b_lambda!21371) (not bm!58726) (not d!132909) (not b!1206463) (not b!1206512) (not bm!58740) (not b!1206547) (not bm!58731) (not b_lambda!21373) (not b!1206509) (not d!132939) (not b!1206491) (not mapNonEmpty!47838) (not d!132911) (not b!1206462) (not d!132905) b_and!42901 (not b!1206545) (not b!1206525) (not b!1206496) (not b!1206520) (not b_lambda!21383) (not b!1206533) (not b!1206536) (not b!1206508) (not d!132931) (not b!1206522) (not b!1206564) (not bm!58734) (not b!1206488) (not b!1206529) (not bm!58730) (not b!1206478) (not b!1206464) (not d!132899) (not b_next!25947) (not b!1206560) (not b!1206425) (not d!132919) (not b_lambda!21347) (not b!1206459) (not b!1206514) (not b!1206510) (not b!1206558) (not b!1206455) tp_is_empty!30651 (not b!1206416) (not b!1206497) (not b_lambda!21369) (not b!1206538) (not bm!58741) (not b!1206519) (not b!1206566) (not b!1206521) (not d!132943) (not b_lambda!21379) (not b!1206501) (not b!1206502) (not b!1206480) (not b!1206457) (not b_lambda!21375) (not bm!58733) (not b!1206466) (not d!132941) (not b_lambda!21377) (not b!1206561) (not b!1206524) (not bm!58732) (not b!1206428) (not d!132923) (not b!1206537) (not b!1206460) (not b!1206513) (not b!1206481) (not b_lambda!21367) (not b!1206568) (not b!1206505) (not b!1206486))
(check-sat b_and!42901 (not b_next!25947))
