; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101054 () Bool)

(assert start!101054)

(declare-fun b_free!25957 () Bool)

(declare-fun b_next!25957 () Bool)

(assert (=> start!101054 (= b_free!25957 (not b_next!25957))))

(declare-fun tp!90876 () Bool)

(declare-fun b_and!42921 () Bool)

(assert (=> start!101054 (= tp!90876 b_and!42921)))

(declare-fun bm!58896 () Bool)

(declare-fun call!58899 () Bool)

(declare-fun call!58901 () Bool)

(assert (=> bm!58896 (= call!58899 call!58901)))

(declare-fun b!1208193 () Bool)

(declare-fun e!686226 () Bool)

(declare-fun e!686228 () Bool)

(assert (=> b!1208193 (= e!686226 e!686228)))

(declare-fun res!803054 () Bool)

(assert (=> b!1208193 (=> res!803054 e!686228)))

(declare-datatypes ((V!46009 0))(
  ( (V!46010 (val!15387 Int)) )
))
(declare-datatypes ((tuple2!19756 0))(
  ( (tuple2!19757 (_1!9889 (_ BitVec 64)) (_2!9889 V!46009)) )
))
(declare-datatypes ((List!26564 0))(
  ( (Nil!26561) (Cons!26560 (h!27778 tuple2!19756) (t!39493 List!26564)) )
))
(declare-datatypes ((ListLongMap!17733 0))(
  ( (ListLongMap!17734 (toList!8882 List!26564)) )
))
(declare-fun lt!548031 () ListLongMap!17733)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6963 (ListLongMap!17733 (_ BitVec 64)) Bool)

(assert (=> b!1208193 (= res!803054 (not (contains!6963 lt!548031 k0!934)))))

(declare-fun zeroValue!944 () V!46009)

(declare-datatypes ((array!78137 0))(
  ( (array!78138 (arr!37702 (Array (_ BitVec 32) (_ BitVec 64))) (size!38239 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78137)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14621 0))(
  ( (ValueCellFull!14621 (v!18028 V!46009)) (EmptyCell!14621) )
))
(declare-datatypes ((array!78139 0))(
  ( (array!78140 (arr!37703 (Array (_ BitVec 32) ValueCell!14621)) (size!38240 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78139)

(declare-fun minValue!944 () V!46009)

(declare-fun getCurrentListMapNoExtraKeys!5344 (array!78137 array!78139 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 32) Int) ListLongMap!17733)

(assert (=> b!1208193 (= lt!548031 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208194 () Bool)

(declare-fun e!686233 () Bool)

(declare-fun e!686231 () Bool)

(assert (=> b!1208194 (= e!686233 e!686231)))

(declare-fun res!803044 () Bool)

(assert (=> b!1208194 (=> res!803044 e!686231)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208194 (= res!803044 (not (= from!1455 i!673)))))

(declare-fun lt!548037 () ListLongMap!17733)

(declare-fun lt!548044 () array!78139)

(declare-fun lt!548033 () array!78137)

(assert (=> b!1208194 (= lt!548037 (getCurrentListMapNoExtraKeys!5344 lt!548033 lt!548044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3265 (Int (_ BitVec 64)) V!46009)

(assert (=> b!1208194 (= lt!548044 (array!78140 (store (arr!37703 _values!996) i!673 (ValueCellFull!14621 (dynLambda!3265 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38240 _values!996)))))

(declare-fun lt!548039 () ListLongMap!17733)

(assert (=> b!1208194 (= lt!548039 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47850 () Bool)

(declare-fun mapRes!47850 () Bool)

(declare-fun tp!90877 () Bool)

(declare-fun e!686224 () Bool)

(assert (=> mapNonEmpty!47850 (= mapRes!47850 (and tp!90877 e!686224))))

(declare-fun mapKey!47850 () (_ BitVec 32))

(declare-fun mapRest!47850 () (Array (_ BitVec 32) ValueCell!14621))

(declare-fun mapValue!47850 () ValueCell!14621)

(assert (=> mapNonEmpty!47850 (= (arr!37703 _values!996) (store mapRest!47850 mapKey!47850 mapValue!47850))))

(declare-fun b!1208195 () Bool)

(assert (=> b!1208195 (= e!686231 e!686226)))

(declare-fun res!803052 () Bool)

(assert (=> b!1208195 (=> res!803052 e!686226)))

(assert (=> b!1208195 (= res!803052 (not (= (select (arr!37702 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686225 () Bool)

(assert (=> b!1208195 e!686225))

(declare-fun c!118951 () Bool)

(assert (=> b!1208195 (= c!118951 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39965 0))(
  ( (Unit!39966) )
))
(declare-fun lt!548035 () Unit!39965)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1040 (array!78137 array!78139 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39965)

(assert (=> b!1208195 (= lt!548035 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1040 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208196 () Bool)

(declare-fun e!686234 () Bool)

(declare-fun e!686227 () Bool)

(assert (=> b!1208196 (= e!686234 e!686227)))

(declare-fun res!803051 () Bool)

(assert (=> b!1208196 (=> (not res!803051) (not e!686227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78137 (_ BitVec 32)) Bool)

(assert (=> b!1208196 (= res!803051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548033 mask!1564))))

(assert (=> b!1208196 (= lt!548033 (array!78138 (store (arr!37702 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38239 _keys!1208)))))

(declare-fun mapIsEmpty!47850 () Bool)

(assert (=> mapIsEmpty!47850 mapRes!47850))

(declare-fun lt!548038 () Bool)

(declare-fun b!1208197 () Bool)

(declare-fun e!686232 () Bool)

(assert (=> b!1208197 (= e!686232 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548038) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58897 () Bool)

(declare-fun c!118955 () Bool)

(declare-fun call!58900 () Unit!39965)

(declare-fun c!118954 () Bool)

(declare-fun lt!548041 () ListLongMap!17733)

(declare-fun addStillContains!1029 (ListLongMap!17733 (_ BitVec 64) V!46009 (_ BitVec 64)) Unit!39965)

(assert (=> bm!58897 (= call!58900 (addStillContains!1029 (ite c!118954 lt!548041 lt!548031) (ite c!118954 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118955 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118954 minValue!944 (ite c!118955 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1208198 () Bool)

(declare-fun tp_is_empty!30661 () Bool)

(assert (=> b!1208198 (= e!686224 tp_is_empty!30661)))

(declare-fun b!1208199 () Bool)

(declare-fun e!686220 () Bool)

(declare-fun arrayContainsKey!0 (array!78137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208199 (= e!686220 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208200 () Bool)

(declare-fun res!803053 () Bool)

(assert (=> b!1208200 (=> (not res!803053) (not e!686234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208200 (= res!803053 (validMask!0 mask!1564))))

(declare-fun b!1208201 () Bool)

(declare-fun e!686235 () Bool)

(assert (=> b!1208201 (= e!686235 tp_is_empty!30661)))

(declare-fun b!1208202 () Bool)

(declare-fun res!803050 () Bool)

(assert (=> b!1208202 (=> (not res!803050) (not e!686234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208202 (= res!803050 (validKeyInArray!0 k0!934))))

(declare-fun bm!58898 () Bool)

(declare-fun call!58902 () ListLongMap!17733)

(declare-fun +!4044 (ListLongMap!17733 tuple2!19756) ListLongMap!17733)

(assert (=> bm!58898 (= call!58902 (+!4044 (ite c!118954 lt!548041 lt!548031) (ite c!118954 (tuple2!19757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118955 (tuple2!19757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!803045 () Bool)

(assert (=> start!101054 (=> (not res!803045) (not e!686234))))

(assert (=> start!101054 (= res!803045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38239 _keys!1208))))))

(assert (=> start!101054 e!686234))

(assert (=> start!101054 tp_is_empty!30661))

(declare-fun array_inv!28788 (array!78137) Bool)

(assert (=> start!101054 (array_inv!28788 _keys!1208)))

(assert (=> start!101054 true))

(assert (=> start!101054 tp!90876))

(declare-fun e!686221 () Bool)

(declare-fun array_inv!28789 (array!78139) Bool)

(assert (=> start!101054 (and (array_inv!28789 _values!996) e!686221)))

(declare-fun b!1208192 () Bool)

(declare-fun e!686229 () Unit!39965)

(declare-fun lt!548032 () Unit!39965)

(assert (=> b!1208192 (= e!686229 lt!548032)))

(declare-fun lt!548036 () Unit!39965)

(assert (=> b!1208192 (= lt!548036 (addStillContains!1029 lt!548031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1208192 (= lt!548041 (+!4044 lt!548031 (tuple2!19757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1208192 call!58901))

(assert (=> b!1208192 (= lt!548032 call!58900)))

(assert (=> b!1208192 (contains!6963 call!58902 k0!934)))

(declare-fun bm!58899 () Bool)

(declare-fun call!58903 () Unit!39965)

(assert (=> bm!58899 (= call!58903 call!58900)))

(declare-fun b!1208203 () Bool)

(assert (=> b!1208203 (= e!686232 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208204 () Bool)

(assert (=> b!1208204 call!58899))

(declare-fun lt!548046 () Unit!39965)

(assert (=> b!1208204 (= lt!548046 call!58903)))

(declare-fun e!686222 () Unit!39965)

(assert (=> b!1208204 (= e!686222 lt!548046)))

(declare-fun b!1208205 () Bool)

(declare-fun res!803047 () Bool)

(assert (=> b!1208205 (=> (not res!803047) (not e!686234))))

(assert (=> b!1208205 (= res!803047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208206 () Bool)

(declare-fun call!58904 () ListLongMap!17733)

(declare-fun call!58905 () ListLongMap!17733)

(declare-fun -!1820 (ListLongMap!17733 (_ BitVec 64)) ListLongMap!17733)

(assert (=> b!1208206 (= e!686225 (= call!58904 (-!1820 call!58905 k0!934)))))

(declare-fun b!1208207 () Bool)

(declare-fun res!803049 () Bool)

(assert (=> b!1208207 (=> (not res!803049) (not e!686234))))

(assert (=> b!1208207 (= res!803049 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38239 _keys!1208))))))

(declare-fun b!1208208 () Bool)

(assert (=> b!1208208 (= e!686225 (= call!58904 call!58905))))

(declare-fun b!1208209 () Bool)

(declare-fun res!803058 () Bool)

(assert (=> b!1208209 (=> (not res!803058) (not e!686234))))

(assert (=> b!1208209 (= res!803058 (= (select (arr!37702 _keys!1208) i!673) k0!934))))

(declare-fun bm!58900 () Bool)

(declare-fun call!58906 () ListLongMap!17733)

(assert (=> bm!58900 (= call!58901 (contains!6963 (ite c!118954 lt!548041 call!58906) k0!934))))

(declare-fun bm!58901 () Bool)

(assert (=> bm!58901 (= call!58905 (getCurrentListMapNoExtraKeys!5344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208210 () Bool)

(assert (=> b!1208210 (= e!686221 (and e!686235 mapRes!47850))))

(declare-fun condMapEmpty!47850 () Bool)

(declare-fun mapDefault!47850 () ValueCell!14621)

(assert (=> b!1208210 (= condMapEmpty!47850 (= (arr!37703 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14621)) mapDefault!47850)))))

(declare-fun b!1208211 () Bool)

(declare-fun e!686223 () Unit!39965)

(declare-fun lt!548043 () Unit!39965)

(assert (=> b!1208211 (= e!686223 lt!548043)))

(assert (=> b!1208211 (= lt!548043 call!58903)))

(assert (=> b!1208211 call!58899))

(declare-fun b!1208212 () Bool)

(declare-fun c!118953 () Bool)

(assert (=> b!1208212 (= c!118953 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548038))))

(assert (=> b!1208212 (= e!686222 e!686223)))

(declare-fun b!1208213 () Bool)

(declare-fun Unit!39967 () Unit!39965)

(assert (=> b!1208213 (= e!686223 Unit!39967)))

(declare-fun b!1208214 () Bool)

(declare-fun res!803046 () Bool)

(assert (=> b!1208214 (=> (not res!803046) (not e!686234))))

(declare-datatypes ((List!26565 0))(
  ( (Nil!26562) (Cons!26561 (h!27779 (_ BitVec 64)) (t!39494 List!26565)) )
))
(declare-fun arrayNoDuplicates!0 (array!78137 (_ BitVec 32) List!26565) Bool)

(assert (=> b!1208214 (= res!803046 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26562))))

(declare-fun b!1208215 () Bool)

(assert (=> b!1208215 (= e!686227 (not e!686233))))

(declare-fun res!803057 () Bool)

(assert (=> b!1208215 (=> res!803057 e!686233)))

(assert (=> b!1208215 (= res!803057 (bvsgt from!1455 i!673))))

(assert (=> b!1208215 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548034 () Unit!39965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78137 (_ BitVec 64) (_ BitVec 32)) Unit!39965)

(assert (=> b!1208215 (= lt!548034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58902 () Bool)

(assert (=> bm!58902 (= call!58904 (getCurrentListMapNoExtraKeys!5344 lt!548033 lt!548044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208216 () Bool)

(declare-fun res!803055 () Bool)

(assert (=> b!1208216 (=> (not res!803055) (not e!686227))))

(assert (=> b!1208216 (= res!803055 (arrayNoDuplicates!0 lt!548033 #b00000000000000000000000000000000 Nil!26562))))

(declare-fun b!1208217 () Bool)

(assert (=> b!1208217 (= e!686228 true)))

(assert (=> b!1208217 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26562)))

(declare-fun lt!548040 () Unit!39965)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78137 (_ BitVec 32) (_ BitVec 32)) Unit!39965)

(assert (=> b!1208217 (= lt!548040 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208217 e!686220))

(declare-fun res!803048 () Bool)

(assert (=> b!1208217 (=> (not res!803048) (not e!686220))))

(assert (=> b!1208217 (= res!803048 e!686232)))

(declare-fun c!118952 () Bool)

(assert (=> b!1208217 (= c!118952 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548042 () Unit!39965)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!582 (array!78137 array!78139 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 64) (_ BitVec 32) Int) Unit!39965)

(assert (=> b!1208217 (= lt!548042 (lemmaListMapContainsThenArrayContainsFrom!582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548045 () Unit!39965)

(assert (=> b!1208217 (= lt!548045 e!686229)))

(assert (=> b!1208217 (= c!118954 (and (not lt!548038) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208217 (= lt!548038 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58903 () Bool)

(assert (=> bm!58903 (= call!58906 call!58902)))

(declare-fun b!1208218 () Bool)

(declare-fun res!803056 () Bool)

(assert (=> b!1208218 (=> (not res!803056) (not e!686234))))

(assert (=> b!1208218 (= res!803056 (and (= (size!38240 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38239 _keys!1208) (size!38240 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208219 () Bool)

(assert (=> b!1208219 (= e!686229 e!686222)))

(assert (=> b!1208219 (= c!118955 (and (not lt!548038) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!101054 res!803045) b!1208200))

(assert (= (and b!1208200 res!803053) b!1208218))

(assert (= (and b!1208218 res!803056) b!1208205))

(assert (= (and b!1208205 res!803047) b!1208214))

(assert (= (and b!1208214 res!803046) b!1208207))

(assert (= (and b!1208207 res!803049) b!1208202))

(assert (= (and b!1208202 res!803050) b!1208209))

(assert (= (and b!1208209 res!803058) b!1208196))

(assert (= (and b!1208196 res!803051) b!1208216))

(assert (= (and b!1208216 res!803055) b!1208215))

(assert (= (and b!1208215 (not res!803057)) b!1208194))

(assert (= (and b!1208194 (not res!803044)) b!1208195))

(assert (= (and b!1208195 c!118951) b!1208206))

(assert (= (and b!1208195 (not c!118951)) b!1208208))

(assert (= (or b!1208206 b!1208208) bm!58902))

(assert (= (or b!1208206 b!1208208) bm!58901))

(assert (= (and b!1208195 (not res!803052)) b!1208193))

(assert (= (and b!1208193 (not res!803054)) b!1208217))

(assert (= (and b!1208217 c!118954) b!1208192))

(assert (= (and b!1208217 (not c!118954)) b!1208219))

(assert (= (and b!1208219 c!118955) b!1208204))

(assert (= (and b!1208219 (not c!118955)) b!1208212))

(assert (= (and b!1208212 c!118953) b!1208211))

(assert (= (and b!1208212 (not c!118953)) b!1208213))

(assert (= (or b!1208204 b!1208211) bm!58899))

(assert (= (or b!1208204 b!1208211) bm!58903))

(assert (= (or b!1208204 b!1208211) bm!58896))

(assert (= (or b!1208192 bm!58896) bm!58900))

(assert (= (or b!1208192 bm!58899) bm!58897))

(assert (= (or b!1208192 bm!58903) bm!58898))

(assert (= (and b!1208217 c!118952) b!1208203))

(assert (= (and b!1208217 (not c!118952)) b!1208197))

(assert (= (and b!1208217 res!803048) b!1208199))

(assert (= (and b!1208210 condMapEmpty!47850) mapIsEmpty!47850))

(assert (= (and b!1208210 (not condMapEmpty!47850)) mapNonEmpty!47850))

(get-info :version)

(assert (= (and mapNonEmpty!47850 ((_ is ValueCellFull!14621) mapValue!47850)) b!1208198))

(assert (= (and b!1208210 ((_ is ValueCellFull!14621) mapDefault!47850)) b!1208201))

(assert (= start!101054 b!1208210))

(declare-fun b_lambda!21393 () Bool)

(assert (=> (not b_lambda!21393) (not b!1208194)))

(declare-fun t!39492 () Bool)

(declare-fun tb!10749 () Bool)

(assert (=> (and start!101054 (= defaultEntry!1004 defaultEntry!1004) t!39492) tb!10749))

(declare-fun result!22093 () Bool)

(assert (=> tb!10749 (= result!22093 tp_is_empty!30661)))

(assert (=> b!1208194 t!39492))

(declare-fun b_and!42923 () Bool)

(assert (= b_and!42921 (and (=> t!39492 result!22093) b_and!42923)))

(declare-fun m!1114125 () Bool)

(assert (=> bm!58902 m!1114125))

(declare-fun m!1114127 () Bool)

(assert (=> b!1208199 m!1114127))

(declare-fun m!1114129 () Bool)

(assert (=> b!1208195 m!1114129))

(declare-fun m!1114131 () Bool)

(assert (=> b!1208195 m!1114131))

(assert (=> b!1208203 m!1114127))

(declare-fun m!1114133 () Bool)

(assert (=> b!1208202 m!1114133))

(declare-fun m!1114135 () Bool)

(assert (=> b!1208216 m!1114135))

(declare-fun m!1114137 () Bool)

(assert (=> b!1208192 m!1114137))

(declare-fun m!1114139 () Bool)

(assert (=> b!1208192 m!1114139))

(declare-fun m!1114141 () Bool)

(assert (=> b!1208192 m!1114141))

(declare-fun m!1114143 () Bool)

(assert (=> b!1208193 m!1114143))

(declare-fun m!1114145 () Bool)

(assert (=> b!1208193 m!1114145))

(declare-fun m!1114147 () Bool)

(assert (=> bm!58898 m!1114147))

(declare-fun m!1114149 () Bool)

(assert (=> b!1208209 m!1114149))

(declare-fun m!1114151 () Bool)

(assert (=> b!1208196 m!1114151))

(declare-fun m!1114153 () Bool)

(assert (=> b!1208196 m!1114153))

(declare-fun m!1114155 () Bool)

(assert (=> b!1208205 m!1114155))

(declare-fun m!1114157 () Bool)

(assert (=> b!1208194 m!1114157))

(declare-fun m!1114159 () Bool)

(assert (=> b!1208194 m!1114159))

(declare-fun m!1114161 () Bool)

(assert (=> b!1208194 m!1114161))

(declare-fun m!1114163 () Bool)

(assert (=> b!1208194 m!1114163))

(declare-fun m!1114165 () Bool)

(assert (=> bm!58897 m!1114165))

(declare-fun m!1114167 () Bool)

(assert (=> bm!58900 m!1114167))

(assert (=> bm!58901 m!1114145))

(declare-fun m!1114169 () Bool)

(assert (=> b!1208206 m!1114169))

(declare-fun m!1114171 () Bool)

(assert (=> b!1208217 m!1114171))

(declare-fun m!1114173 () Bool)

(assert (=> b!1208217 m!1114173))

(declare-fun m!1114175 () Bool)

(assert (=> b!1208217 m!1114175))

(declare-fun m!1114177 () Bool)

(assert (=> b!1208214 m!1114177))

(declare-fun m!1114179 () Bool)

(assert (=> b!1208215 m!1114179))

(declare-fun m!1114181 () Bool)

(assert (=> b!1208215 m!1114181))

(declare-fun m!1114183 () Bool)

(assert (=> mapNonEmpty!47850 m!1114183))

(declare-fun m!1114185 () Bool)

(assert (=> start!101054 m!1114185))

(declare-fun m!1114187 () Bool)

(assert (=> start!101054 m!1114187))

(declare-fun m!1114189 () Bool)

(assert (=> b!1208200 m!1114189))

(check-sat (not b_next!25957) (not b!1208202) (not b!1208216) (not b!1208205) (not bm!58902) (not b!1208214) (not bm!58897) (not b!1208215) (not mapNonEmpty!47850) (not start!101054) (not bm!58898) (not b!1208217) (not b!1208195) b_and!42923 (not b!1208194) (not b!1208203) (not b!1208200) (not b!1208192) (not bm!58900) tp_is_empty!30661 (not bm!58901) (not b!1208199) (not b!1208206) (not b!1208193) (not b_lambda!21393) (not b!1208196))
(check-sat b_and!42923 (not b_next!25957))
