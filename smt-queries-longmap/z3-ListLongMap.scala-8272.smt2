; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100878 () Bool)

(assert start!100878)

(declare-fun b_free!25903 () Bool)

(declare-fun b_next!25903 () Bool)

(assert (=> start!100878 (= b_free!25903 (not b_next!25903))))

(declare-fun tp!90703 () Bool)

(declare-fun b_and!42735 () Bool)

(assert (=> start!100878 (= tp!90703 b_and!42735)))

(declare-fun bm!58145 () Bool)

(declare-fun call!58151 () Bool)

(declare-fun call!58149 () Bool)

(assert (=> bm!58145 (= call!58151 call!58149)))

(declare-datatypes ((V!45937 0))(
  ( (V!45938 (val!15360 Int)) )
))
(declare-datatypes ((tuple2!19706 0))(
  ( (tuple2!19707 (_1!9864 (_ BitVec 64)) (_2!9864 V!45937)) )
))
(declare-datatypes ((List!26516 0))(
  ( (Nil!26513) (Cons!26512 (h!27730 tuple2!19706) (t!39391 List!26516)) )
))
(declare-datatypes ((ListLongMap!17683 0))(
  ( (ListLongMap!17684 (toList!8857 List!26516)) )
))
(declare-fun lt!546302 () ListLongMap!17683)

(declare-fun c!118362 () Bool)

(declare-fun call!58148 () ListLongMap!17683)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!58146 () Bool)

(declare-fun contains!6932 (ListLongMap!17683 (_ BitVec 64)) Bool)

(assert (=> bm!58146 (= call!58149 (contains!6932 (ite c!118362 lt!546302 call!58148) k0!934))))

(declare-fun b!1205166 () Bool)

(declare-fun e!684466 () Bool)

(declare-fun e!684468 () Bool)

(assert (=> b!1205166 (= e!684466 e!684468)))

(declare-fun res!801545 () Bool)

(assert (=> b!1205166 (=> res!801545 e!684468)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205166 (= res!801545 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45937)

(declare-datatypes ((ValueCell!14594 0))(
  ( (ValueCellFull!14594 (v!17997 V!45937)) (EmptyCell!14594) )
))
(declare-datatypes ((array!78023 0))(
  ( (array!78024 (arr!37649 (Array (_ BitVec 32) ValueCell!14594)) (size!38186 (_ BitVec 32))) )
))
(declare-fun lt!546304 () array!78023)

(declare-fun lt!546313 () ListLongMap!17683)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78025 0))(
  ( (array!78026 (arr!37650 (Array (_ BitVec 32) (_ BitVec 64))) (size!38187 (_ BitVec 32))) )
))
(declare-fun lt!546314 () array!78025)

(declare-fun getCurrentListMapNoExtraKeys!5323 (array!78025 array!78023 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) Int) ListLongMap!17683)

(assert (=> b!1205166 (= lt!546313 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78023)

(declare-fun dynLambda!3250 (Int (_ BitVec 64)) V!45937)

(assert (=> b!1205166 (= lt!546304 (array!78024 (store (arr!37649 _values!996) i!673 (ValueCellFull!14594 (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38186 _values!996)))))

(declare-fun _keys!1208 () array!78025)

(declare-fun lt!546308 () ListLongMap!17683)

(assert (=> b!1205166 (= lt!546308 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205167 () Bool)

(declare-fun res!801542 () Bool)

(declare-fun e!684477 () Bool)

(assert (=> b!1205167 (=> (not res!801542) (not e!684477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205167 (= res!801542 (validKeyInArray!0 k0!934))))

(declare-fun b!1205168 () Bool)

(declare-fun res!801535 () Bool)

(declare-fun e!684471 () Bool)

(assert (=> b!1205168 (=> (not res!801535) (not e!684471))))

(declare-datatypes ((List!26517 0))(
  ( (Nil!26514) (Cons!26513 (h!27731 (_ BitVec 64)) (t!39392 List!26517)) )
))
(declare-fun arrayNoDuplicates!0 (array!78025 (_ BitVec 32) List!26517) Bool)

(assert (=> b!1205168 (= res!801535 (arrayNoDuplicates!0 lt!546314 #b00000000000000000000000000000000 Nil!26514))))

(declare-fun b!1205169 () Bool)

(declare-fun e!684475 () Bool)

(declare-fun e!684473 () Bool)

(assert (=> b!1205169 (= e!684475 e!684473)))

(declare-fun res!801539 () Bool)

(assert (=> b!1205169 (=> res!801539 e!684473)))

(declare-fun lt!546309 () ListLongMap!17683)

(assert (=> b!1205169 (= res!801539 (not (contains!6932 lt!546309 k0!934)))))

(assert (=> b!1205169 (= lt!546309 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118363 () Bool)

(declare-datatypes ((Unit!39880 0))(
  ( (Unit!39881) )
))
(declare-fun call!58153 () Unit!39880)

(declare-fun bm!58147 () Bool)

(declare-fun addStillContains!1007 (ListLongMap!17683 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39880)

(assert (=> bm!58147 (= call!58153 (addStillContains!1007 lt!546309 (ite (or c!118362 c!118363) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118362 c!118363) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!58154 () ListLongMap!17683)

(declare-fun bm!58148 () Bool)

(assert (=> bm!58148 (= call!58154 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205170 () Bool)

(declare-fun e!684470 () Unit!39880)

(declare-fun lt!546303 () Unit!39880)

(assert (=> b!1205170 (= e!684470 lt!546303)))

(declare-fun lt!546305 () Unit!39880)

(assert (=> b!1205170 (= lt!546305 call!58153)))

(declare-fun +!4023 (ListLongMap!17683 tuple2!19706) ListLongMap!17683)

(assert (=> b!1205170 (= lt!546302 (+!4023 lt!546309 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205170 call!58149))

(assert (=> b!1205170 (= lt!546303 (addStillContains!1007 lt!546302 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!58150 () ListLongMap!17683)

(assert (=> b!1205170 (contains!6932 call!58150 k0!934)))

(declare-fun b!1205171 () Bool)

(assert (=> b!1205171 (= e!684477 e!684471)))

(declare-fun res!801544 () Bool)

(assert (=> b!1205171 (=> (not res!801544) (not e!684471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78025 (_ BitVec 32)) Bool)

(assert (=> b!1205171 (= res!801544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546314 mask!1564))))

(assert (=> b!1205171 (= lt!546314 (array!78026 (store (arr!37650 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38187 _keys!1208)))))

(declare-fun b!1205172 () Bool)

(declare-fun e!684474 () Unit!39880)

(declare-fun lt!546315 () Unit!39880)

(assert (=> b!1205172 (= e!684474 lt!546315)))

(declare-fun call!58152 () Unit!39880)

(assert (=> b!1205172 (= lt!546315 call!58152)))

(assert (=> b!1205172 call!58151))

(declare-fun b!1205173 () Bool)

(declare-fun e!684476 () Bool)

(declare-fun tp_is_empty!30607 () Bool)

(assert (=> b!1205173 (= e!684476 tp_is_empty!30607)))

(declare-fun b!1205174 () Bool)

(declare-fun res!801536 () Bool)

(assert (=> b!1205174 (=> (not res!801536) (not e!684477))))

(assert (=> b!1205174 (= res!801536 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38187 _keys!1208))))))

(declare-fun b!1205175 () Bool)

(declare-fun e!684465 () Bool)

(declare-fun mapRes!47757 () Bool)

(assert (=> b!1205175 (= e!684465 (and e!684476 mapRes!47757))))

(declare-fun condMapEmpty!47757 () Bool)

(declare-fun mapDefault!47757 () ValueCell!14594)

(assert (=> b!1205175 (= condMapEmpty!47757 (= (arr!37649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14594)) mapDefault!47757)))))

(declare-fun b!1205176 () Bool)

(declare-fun c!118361 () Bool)

(declare-fun lt!546311 () Bool)

(assert (=> b!1205176 (= c!118361 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546311))))

(declare-fun e!684479 () Unit!39880)

(assert (=> b!1205176 (= e!684479 e!684474)))

(declare-fun mapNonEmpty!47757 () Bool)

(declare-fun tp!90702 () Bool)

(declare-fun e!684472 () Bool)

(assert (=> mapNonEmpty!47757 (= mapRes!47757 (and tp!90702 e!684472))))

(declare-fun mapRest!47757 () (Array (_ BitVec 32) ValueCell!14594))

(declare-fun mapValue!47757 () ValueCell!14594)

(declare-fun mapKey!47757 () (_ BitVec 32))

(assert (=> mapNonEmpty!47757 (= (arr!37649 _values!996) (store mapRest!47757 mapKey!47757 mapValue!47757))))

(declare-fun b!1205177 () Bool)

(declare-fun Unit!39882 () Unit!39880)

(assert (=> b!1205177 (= e!684474 Unit!39882)))

(declare-fun b!1205178 () Bool)

(assert (=> b!1205178 (= e!684468 e!684475)))

(declare-fun res!801540 () Bool)

(assert (=> b!1205178 (=> res!801540 e!684475)))

(assert (=> b!1205178 (= res!801540 (not (= (select (arr!37650 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684467 () Bool)

(assert (=> b!1205178 e!684467))

(declare-fun c!118360 () Bool)

(assert (=> b!1205178 (= c!118360 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546310 () Unit!39880)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 (array!78025 array!78023 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39880)

(assert (=> b!1205178 (= lt!546310 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58149 () Bool)

(declare-fun call!58155 () ListLongMap!17683)

(assert (=> bm!58149 (= call!58155 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205179 () Bool)

(declare-fun e!684478 () Bool)

(assert (=> b!1205179 (= e!684473 e!684478)))

(declare-fun res!801537 () Bool)

(assert (=> b!1205179 (=> res!801537 e!684478)))

(assert (=> b!1205179 (= res!801537 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208))))))

(declare-fun lt!546307 () Unit!39880)

(assert (=> b!1205179 (= lt!546307 e!684470)))

(assert (=> b!1205179 (= c!118362 (and (not lt!546311) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205179 (= lt!546311 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!801538 () Bool)

(assert (=> start!100878 (=> (not res!801538) (not e!684477))))

(assert (=> start!100878 (= res!801538 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38187 _keys!1208))))))

(assert (=> start!100878 e!684477))

(assert (=> start!100878 tp_is_empty!30607))

(declare-fun array_inv!28752 (array!78025) Bool)

(assert (=> start!100878 (array_inv!28752 _keys!1208)))

(assert (=> start!100878 true))

(assert (=> start!100878 tp!90703))

(declare-fun array_inv!28753 (array!78023) Bool)

(assert (=> start!100878 (and (array_inv!28753 _values!996) e!684465)))

(declare-fun b!1205180 () Bool)

(assert (=> b!1205180 (= e!684471 (not e!684466))))

(declare-fun res!801541 () Bool)

(assert (=> b!1205180 (=> res!801541 e!684466)))

(assert (=> b!1205180 (= res!801541 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205180 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546312 () Unit!39880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78025 (_ BitVec 64) (_ BitVec 32)) Unit!39880)

(assert (=> b!1205180 (= lt!546312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1205181 () Bool)

(assert (=> b!1205181 (= e!684470 e!684479)))

(assert (=> b!1205181 (= c!118363 (and (not lt!546311) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58150 () Bool)

(assert (=> bm!58150 (= call!58152 call!58153)))

(declare-fun b!1205182 () Bool)

(assert (=> b!1205182 call!58151))

(declare-fun lt!546306 () Unit!39880)

(assert (=> b!1205182 (= lt!546306 call!58152)))

(assert (=> b!1205182 (= e!684479 lt!546306)))

(declare-fun b!1205183 () Bool)

(declare-fun res!801546 () Bool)

(assert (=> b!1205183 (=> (not res!801546) (not e!684477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205183 (= res!801546 (validMask!0 mask!1564))))

(declare-fun b!1205184 () Bool)

(declare-fun res!801547 () Bool)

(assert (=> b!1205184 (=> (not res!801547) (not e!684477))))

(assert (=> b!1205184 (= res!801547 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26514))))

(declare-fun b!1205185 () Bool)

(declare-fun getCurrentListMap!4439 (array!78025 array!78023 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) Int) ListLongMap!17683)

(assert (=> b!1205185 (= e!684478 (contains!6932 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1205186 () Bool)

(declare-fun res!801543 () Bool)

(assert (=> b!1205186 (=> (not res!801543) (not e!684477))))

(assert (=> b!1205186 (= res!801543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58151 () Bool)

(assert (=> bm!58151 (= call!58148 call!58150)))

(declare-fun b!1205187 () Bool)

(declare-fun -!1803 (ListLongMap!17683 (_ BitVec 64)) ListLongMap!17683)

(assert (=> b!1205187 (= e!684467 (= call!58154 (-!1803 call!58155 k0!934)))))

(declare-fun mapIsEmpty!47757 () Bool)

(assert (=> mapIsEmpty!47757 mapRes!47757))

(declare-fun bm!58152 () Bool)

(assert (=> bm!58152 (= call!58150 (+!4023 (ite c!118362 lt!546302 lt!546309) (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205188 () Bool)

(declare-fun res!801534 () Bool)

(assert (=> b!1205188 (=> (not res!801534) (not e!684477))))

(assert (=> b!1205188 (= res!801534 (= (select (arr!37650 _keys!1208) i!673) k0!934))))

(declare-fun b!1205189 () Bool)

(declare-fun res!801533 () Bool)

(assert (=> b!1205189 (=> (not res!801533) (not e!684477))))

(assert (=> b!1205189 (= res!801533 (and (= (size!38186 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38187 _keys!1208) (size!38186 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205190 () Bool)

(assert (=> b!1205190 (= e!684472 tp_is_empty!30607)))

(declare-fun b!1205191 () Bool)

(assert (=> b!1205191 (= e!684467 (= call!58154 call!58155))))

(assert (= (and start!100878 res!801538) b!1205183))

(assert (= (and b!1205183 res!801546) b!1205189))

(assert (= (and b!1205189 res!801533) b!1205186))

(assert (= (and b!1205186 res!801543) b!1205184))

(assert (= (and b!1205184 res!801547) b!1205174))

(assert (= (and b!1205174 res!801536) b!1205167))

(assert (= (and b!1205167 res!801542) b!1205188))

(assert (= (and b!1205188 res!801534) b!1205171))

(assert (= (and b!1205171 res!801544) b!1205168))

(assert (= (and b!1205168 res!801535) b!1205180))

(assert (= (and b!1205180 (not res!801541)) b!1205166))

(assert (= (and b!1205166 (not res!801545)) b!1205178))

(assert (= (and b!1205178 c!118360) b!1205187))

(assert (= (and b!1205178 (not c!118360)) b!1205191))

(assert (= (or b!1205187 b!1205191) bm!58148))

(assert (= (or b!1205187 b!1205191) bm!58149))

(assert (= (and b!1205178 (not res!801540)) b!1205169))

(assert (= (and b!1205169 (not res!801539)) b!1205179))

(assert (= (and b!1205179 c!118362) b!1205170))

(assert (= (and b!1205179 (not c!118362)) b!1205181))

(assert (= (and b!1205181 c!118363) b!1205182))

(assert (= (and b!1205181 (not c!118363)) b!1205176))

(assert (= (and b!1205176 c!118361) b!1205172))

(assert (= (and b!1205176 (not c!118361)) b!1205177))

(assert (= (or b!1205182 b!1205172) bm!58150))

(assert (= (or b!1205182 b!1205172) bm!58151))

(assert (= (or b!1205182 b!1205172) bm!58145))

(assert (= (or b!1205170 bm!58145) bm!58146))

(assert (= (or b!1205170 bm!58150) bm!58147))

(assert (= (or b!1205170 bm!58151) bm!58152))

(assert (= (and b!1205179 (not res!801537)) b!1205185))

(assert (= (and b!1205175 condMapEmpty!47757) mapIsEmpty!47757))

(assert (= (and b!1205175 (not condMapEmpty!47757)) mapNonEmpty!47757))

(get-info :version)

(assert (= (and mapNonEmpty!47757 ((_ is ValueCellFull!14594) mapValue!47757)) b!1205190))

(assert (= (and b!1205175 ((_ is ValueCellFull!14594) mapDefault!47757)) b!1205173))

(assert (= start!100878 b!1205175))

(declare-fun b_lambda!21175 () Bool)

(assert (=> (not b_lambda!21175) (not b!1205166)))

(declare-fun t!39390 () Bool)

(declare-fun tb!10695 () Bool)

(assert (=> (and start!100878 (= defaultEntry!1004 defaultEntry!1004) t!39390) tb!10695))

(declare-fun result!21977 () Bool)

(assert (=> tb!10695 (= result!21977 tp_is_empty!30607)))

(assert (=> b!1205166 t!39390))

(declare-fun b_and!42737 () Bool)

(assert (= b_and!42735 (and (=> t!39390 result!21977) b_and!42737)))

(declare-fun m!1111443 () Bool)

(assert (=> bm!58149 m!1111443))

(declare-fun m!1111445 () Bool)

(assert (=> b!1205178 m!1111445))

(declare-fun m!1111447 () Bool)

(assert (=> b!1205178 m!1111447))

(declare-fun m!1111449 () Bool)

(assert (=> b!1205188 m!1111449))

(declare-fun m!1111451 () Bool)

(assert (=> b!1205187 m!1111451))

(declare-fun m!1111453 () Bool)

(assert (=> b!1205168 m!1111453))

(declare-fun m!1111455 () Bool)

(assert (=> b!1205167 m!1111455))

(declare-fun m!1111457 () Bool)

(assert (=> bm!58152 m!1111457))

(declare-fun m!1111459 () Bool)

(assert (=> b!1205169 m!1111459))

(assert (=> b!1205169 m!1111443))

(declare-fun m!1111461 () Bool)

(assert (=> b!1205185 m!1111461))

(assert (=> b!1205185 m!1111461))

(declare-fun m!1111463 () Bool)

(assert (=> b!1205185 m!1111463))

(declare-fun m!1111465 () Bool)

(assert (=> b!1205170 m!1111465))

(declare-fun m!1111467 () Bool)

(assert (=> b!1205170 m!1111467))

(declare-fun m!1111469 () Bool)

(assert (=> b!1205170 m!1111469))

(declare-fun m!1111471 () Bool)

(assert (=> bm!58146 m!1111471))

(declare-fun m!1111473 () Bool)

(assert (=> b!1205184 m!1111473))

(declare-fun m!1111475 () Bool)

(assert (=> b!1205186 m!1111475))

(declare-fun m!1111477 () Bool)

(assert (=> bm!58148 m!1111477))

(declare-fun m!1111479 () Bool)

(assert (=> b!1205180 m!1111479))

(declare-fun m!1111481 () Bool)

(assert (=> b!1205180 m!1111481))

(declare-fun m!1111483 () Bool)

(assert (=> start!100878 m!1111483))

(declare-fun m!1111485 () Bool)

(assert (=> start!100878 m!1111485))

(declare-fun m!1111487 () Bool)

(assert (=> mapNonEmpty!47757 m!1111487))

(declare-fun m!1111489 () Bool)

(assert (=> b!1205183 m!1111489))

(declare-fun m!1111491 () Bool)

(assert (=> bm!58147 m!1111491))

(declare-fun m!1111493 () Bool)

(assert (=> b!1205171 m!1111493))

(declare-fun m!1111495 () Bool)

(assert (=> b!1205171 m!1111495))

(declare-fun m!1111497 () Bool)

(assert (=> b!1205166 m!1111497))

(declare-fun m!1111499 () Bool)

(assert (=> b!1205166 m!1111499))

(declare-fun m!1111501 () Bool)

(assert (=> b!1205166 m!1111501))

(declare-fun m!1111503 () Bool)

(assert (=> b!1205166 m!1111503))

(check-sat (not b!1205186) tp_is_empty!30607 (not b!1205184) (not b_lambda!21175) (not b!1205180) (not bm!58147) (not b_next!25903) (not mapNonEmpty!47757) b_and!42737 (not b!1205178) (not start!100878) (not bm!58149) (not b!1205170) (not b!1205183) (not bm!58152) (not b!1205166) (not b!1205168) (not b!1205171) (not bm!58146) (not b!1205169) (not bm!58148) (not b!1205167) (not b!1205187) (not b!1205185))
(check-sat b_and!42737 (not b_next!25903))
(get-model)

(declare-fun b_lambda!21181 () Bool)

(assert (= b_lambda!21175 (or (and start!100878 b_free!25903) b_lambda!21181)))

(check-sat (not b!1205186) tp_is_empty!30607 (not b!1205184) (not b!1205180) (not bm!58147) (not b_next!25903) (not mapNonEmpty!47757) b_and!42737 (not b!1205178) (not start!100878) (not bm!58149) (not b!1205170) (not b!1205183) (not bm!58152) (not b!1205166) (not b!1205168) (not b_lambda!21181) (not b!1205171) (not bm!58146) (not b!1205169) (not bm!58148) (not b!1205167) (not b!1205187) (not b!1205185))
(check-sat b_and!42737 (not b_next!25903))
(get-model)

(declare-fun d!133171 () Bool)

(assert (=> d!133171 (contains!6932 (+!4023 lt!546309 (tuple2!19707 (ite (or c!118362 c!118363) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118362 c!118363) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546402 () Unit!39880)

(declare-fun choose!1795 (ListLongMap!17683 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39880)

(assert (=> d!133171 (= lt!546402 (choose!1795 lt!546309 (ite (or c!118362 c!118363) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118362 c!118363) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133171 (contains!6932 lt!546309 k0!934)))

(assert (=> d!133171 (= (addStillContains!1007 lt!546309 (ite (or c!118362 c!118363) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118362 c!118363) zeroValue!944 minValue!944) k0!934) lt!546402)))

(declare-fun bs!34100 () Bool)

(assert (= bs!34100 d!133171))

(declare-fun m!1111629 () Bool)

(assert (=> bs!34100 m!1111629))

(assert (=> bs!34100 m!1111629))

(declare-fun m!1111631 () Bool)

(assert (=> bs!34100 m!1111631))

(declare-fun m!1111633 () Bool)

(assert (=> bs!34100 m!1111633))

(assert (=> bs!34100 m!1111459))

(assert (=> bm!58147 d!133171))

(declare-fun call!58208 () ListLongMap!17683)

(declare-fun bm!58205 () Bool)

(assert (=> bm!58205 (= call!58208 (getCurrentListMapNoExtraKeys!5323 (array!78026 (store (arr!37650 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38187 _keys!1208)) (array!78024 (store (arr!37649 _values!996) i!673 (ValueCellFull!14594 (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38186 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205361 () Bool)

(declare-fun e!684575 () Bool)

(declare-fun call!58209 () ListLongMap!17683)

(assert (=> b!1205361 (= e!684575 (= call!58208 call!58209))))

(assert (=> b!1205361 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38186 _values!996)))))

(declare-fun d!133173 () Bool)

(declare-fun e!684574 () Bool)

(assert (=> d!133173 e!684574))

(declare-fun res!801640 () Bool)

(assert (=> d!133173 (=> (not res!801640) (not e!684574))))

(assert (=> d!133173 (= res!801640 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38187 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38187 _keys!1208))))))))

(declare-fun lt!546405 () Unit!39880)

(declare-fun choose!1796 (array!78025 array!78023 (_ BitVec 32) (_ BitVec 32) V!45937 V!45937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39880)

(assert (=> d!133173 (= lt!546405 (choose!1796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133173 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(assert (=> d!133173 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546405)))

(declare-fun b!1205362 () Bool)

(assert (=> b!1205362 (= e!684575 (= call!58208 (-!1803 call!58209 k0!934)))))

(assert (=> b!1205362 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38186 _values!996)))))

(declare-fun b!1205363 () Bool)

(assert (=> b!1205363 (= e!684574 e!684575)))

(declare-fun c!118390 () Bool)

(assert (=> b!1205363 (= c!118390 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!58206 () Bool)

(assert (=> bm!58206 (= call!58209 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133173 res!801640) b!1205363))

(assert (= (and b!1205363 c!118390) b!1205362))

(assert (= (and b!1205363 (not c!118390)) b!1205361))

(assert (= (or b!1205362 b!1205361) bm!58206))

(assert (= (or b!1205362 b!1205361) bm!58205))

(declare-fun b_lambda!21183 () Bool)

(assert (=> (not b_lambda!21183) (not bm!58205)))

(assert (=> bm!58205 t!39390))

(declare-fun b_and!42747 () Bool)

(assert (= b_and!42737 (and (=> t!39390 result!21977) b_and!42747)))

(assert (=> bm!58205 m!1111495))

(assert (=> bm!58205 m!1111499))

(assert (=> bm!58205 m!1111501))

(declare-fun m!1111635 () Bool)

(assert (=> bm!58205 m!1111635))

(declare-fun m!1111637 () Bool)

(assert (=> d!133173 m!1111637))

(declare-fun m!1111639 () Bool)

(assert (=> b!1205362 m!1111639))

(assert (=> bm!58206 m!1111443))

(assert (=> b!1205178 d!133173))

(declare-fun b!1205388 () Bool)

(declare-fun e!684593 () Bool)

(declare-fun lt!546422 () ListLongMap!17683)

(declare-fun isEmpty!987 (ListLongMap!17683) Bool)

(assert (=> b!1205388 (= e!684593 (isEmpty!987 lt!546422))))

(declare-fun b!1205389 () Bool)

(assert (=> b!1205389 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 lt!546314)))))

(assert (=> b!1205389 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38186 lt!546304)))))

(declare-fun e!684595 () Bool)

(declare-fun apply!970 (ListLongMap!17683 (_ BitVec 64)) V!45937)

(declare-fun get!19239 (ValueCell!14594 V!45937) V!45937)

(assert (=> b!1205389 (= e!684595 (= (apply!970 lt!546422 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19239 (select (arr!37649 lt!546304) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205390 () Bool)

(declare-fun e!684591 () ListLongMap!17683)

(assert (=> b!1205390 (= e!684591 (ListLongMap!17684 Nil!26513))))

(declare-fun b!1205391 () Bool)

(declare-fun e!684592 () ListLongMap!17683)

(assert (=> b!1205391 (= e!684591 e!684592)))

(declare-fun c!118402 () Bool)

(assert (=> b!1205391 (= c!118402 (validKeyInArray!0 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205392 () Bool)

(declare-fun e!684594 () Bool)

(declare-fun e!684590 () Bool)

(assert (=> b!1205392 (= e!684594 e!684590)))

(declare-fun c!118399 () Bool)

(declare-fun e!684596 () Bool)

(assert (=> b!1205392 (= c!118399 e!684596)))

(declare-fun res!801651 () Bool)

(assert (=> b!1205392 (=> (not res!801651) (not e!684596))))

(assert (=> b!1205392 (= res!801651 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 lt!546314)))))

(declare-fun b!1205393 () Bool)

(declare-fun lt!546424 () Unit!39880)

(declare-fun lt!546425 () Unit!39880)

(assert (=> b!1205393 (= lt!546424 lt!546425)))

(declare-fun lt!546426 () V!45937)

(declare-fun lt!546420 () (_ BitVec 64))

(declare-fun lt!546423 () ListLongMap!17683)

(declare-fun lt!546421 () (_ BitVec 64))

(assert (=> b!1205393 (not (contains!6932 (+!4023 lt!546423 (tuple2!19707 lt!546421 lt!546426)) lt!546420))))

(declare-fun addStillNotContains!291 (ListLongMap!17683 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39880)

(assert (=> b!1205393 (= lt!546425 (addStillNotContains!291 lt!546423 lt!546421 lt!546426 lt!546420))))

(assert (=> b!1205393 (= lt!546420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205393 (= lt!546426 (get!19239 (select (arr!37649 lt!546304) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205393 (= lt!546421 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58212 () ListLongMap!17683)

(assert (=> b!1205393 (= lt!546423 call!58212)))

(assert (=> b!1205393 (= e!684592 (+!4023 call!58212 (tuple2!19707 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19239 (select (arr!37649 lt!546304) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205394 () Bool)

(declare-fun res!801649 () Bool)

(assert (=> b!1205394 (=> (not res!801649) (not e!684594))))

(assert (=> b!1205394 (= res!801649 (not (contains!6932 lt!546422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58209 () Bool)

(assert (=> bm!58209 (= call!58212 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205395 () Bool)

(assert (=> b!1205395 (= e!684590 e!684593)))

(declare-fun c!118401 () Bool)

(assert (=> b!1205395 (= c!118401 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 lt!546314)))))

(declare-fun b!1205396 () Bool)

(assert (=> b!1205396 (= e!684592 call!58212)))

(declare-fun b!1205397 () Bool)

(assert (=> b!1205397 (= e!684593 (= lt!546422 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133175 () Bool)

(assert (=> d!133175 e!684594))

(declare-fun res!801650 () Bool)

(assert (=> d!133175 (=> (not res!801650) (not e!684594))))

(assert (=> d!133175 (= res!801650 (not (contains!6932 lt!546422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133175 (= lt!546422 e!684591)))

(declare-fun c!118400 () Bool)

(assert (=> d!133175 (= c!118400 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 lt!546314)))))

(assert (=> d!133175 (validMask!0 mask!1564)))

(assert (=> d!133175 (= (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546422)))

(declare-fun b!1205398 () Bool)

(assert (=> b!1205398 (= e!684596 (validKeyInArray!0 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205398 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1205399 () Bool)

(assert (=> b!1205399 (= e!684590 e!684595)))

(assert (=> b!1205399 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 lt!546314)))))

(declare-fun res!801652 () Bool)

(assert (=> b!1205399 (= res!801652 (contains!6932 lt!546422 (select (arr!37650 lt!546314) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205399 (=> (not res!801652) (not e!684595))))

(assert (= (and d!133175 c!118400) b!1205390))

(assert (= (and d!133175 (not c!118400)) b!1205391))

(assert (= (and b!1205391 c!118402) b!1205393))

(assert (= (and b!1205391 (not c!118402)) b!1205396))

(assert (= (or b!1205393 b!1205396) bm!58209))

(assert (= (and d!133175 res!801650) b!1205394))

(assert (= (and b!1205394 res!801649) b!1205392))

(assert (= (and b!1205392 res!801651) b!1205398))

(assert (= (and b!1205392 c!118399) b!1205399))

(assert (= (and b!1205392 (not c!118399)) b!1205395))

(assert (= (and b!1205399 res!801652) b!1205389))

(assert (= (and b!1205395 c!118401) b!1205397))

(assert (= (and b!1205395 (not c!118401)) b!1205388))

(declare-fun b_lambda!21185 () Bool)

(assert (=> (not b_lambda!21185) (not b!1205389)))

(assert (=> b!1205389 t!39390))

(declare-fun b_and!42749 () Bool)

(assert (= b_and!42747 (and (=> t!39390 result!21977) b_and!42749)))

(declare-fun b_lambda!21187 () Bool)

(assert (=> (not b_lambda!21187) (not b!1205393)))

(assert (=> b!1205393 t!39390))

(declare-fun b_and!42751 () Bool)

(assert (= b_and!42749 (and (=> t!39390 result!21977) b_and!42751)))

(declare-fun m!1111641 () Bool)

(assert (=> b!1205397 m!1111641))

(declare-fun m!1111643 () Bool)

(assert (=> b!1205393 m!1111643))

(declare-fun m!1111645 () Bool)

(assert (=> b!1205393 m!1111645))

(declare-fun m!1111647 () Bool)

(assert (=> b!1205393 m!1111647))

(declare-fun m!1111649 () Bool)

(assert (=> b!1205393 m!1111649))

(declare-fun m!1111651 () Bool)

(assert (=> b!1205393 m!1111651))

(assert (=> b!1205393 m!1111499))

(declare-fun m!1111653 () Bool)

(assert (=> b!1205393 m!1111653))

(assert (=> b!1205393 m!1111499))

(assert (=> b!1205393 m!1111651))

(assert (=> b!1205393 m!1111645))

(declare-fun m!1111655 () Bool)

(assert (=> b!1205393 m!1111655))

(assert (=> b!1205398 m!1111647))

(assert (=> b!1205398 m!1111647))

(declare-fun m!1111657 () Bool)

(assert (=> b!1205398 m!1111657))

(assert (=> bm!58209 m!1111641))

(declare-fun m!1111659 () Bool)

(assert (=> b!1205394 m!1111659))

(assert (=> b!1205391 m!1111647))

(assert (=> b!1205391 m!1111647))

(assert (=> b!1205391 m!1111657))

(assert (=> b!1205389 m!1111647))

(declare-fun m!1111661 () Bool)

(assert (=> b!1205389 m!1111661))

(assert (=> b!1205389 m!1111651))

(assert (=> b!1205389 m!1111647))

(assert (=> b!1205389 m!1111651))

(assert (=> b!1205389 m!1111499))

(assert (=> b!1205389 m!1111653))

(assert (=> b!1205389 m!1111499))

(declare-fun m!1111663 () Bool)

(assert (=> b!1205388 m!1111663))

(declare-fun m!1111665 () Bool)

(assert (=> d!133175 m!1111665))

(assert (=> d!133175 m!1111489))

(assert (=> b!1205399 m!1111647))

(assert (=> b!1205399 m!1111647))

(declare-fun m!1111667 () Bool)

(assert (=> b!1205399 m!1111667))

(assert (=> bm!58148 d!133175))

(declare-fun d!133177 () Bool)

(declare-fun e!684601 () Bool)

(assert (=> d!133177 e!684601))

(declare-fun res!801655 () Bool)

(assert (=> d!133177 (=> res!801655 e!684601)))

(declare-fun lt!546437 () Bool)

(assert (=> d!133177 (= res!801655 (not lt!546437))))

(declare-fun lt!546436 () Bool)

(assert (=> d!133177 (= lt!546437 lt!546436)))

(declare-fun lt!546438 () Unit!39880)

(declare-fun e!684602 () Unit!39880)

(assert (=> d!133177 (= lt!546438 e!684602)))

(declare-fun c!118405 () Bool)

(assert (=> d!133177 (= c!118405 lt!546436)))

(declare-fun containsKey!590 (List!26516 (_ BitVec 64)) Bool)

(assert (=> d!133177 (= lt!546436 (containsKey!590 (toList!8857 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(assert (=> d!133177 (= (contains!6932 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!546437)))

(declare-fun b!1205406 () Bool)

(declare-fun lt!546435 () Unit!39880)

(assert (=> b!1205406 (= e!684602 lt!546435)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!418 (List!26516 (_ BitVec 64)) Unit!39880)

(assert (=> b!1205406 (= lt!546435 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8857 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(declare-datatypes ((Option!679 0))(
  ( (Some!678 (v!18000 V!45937)) (None!677) )
))
(declare-fun isDefined!456 (Option!679) Bool)

(declare-fun getValueByKey!628 (List!26516 (_ BitVec 64)) Option!679)

(assert (=> b!1205406 (isDefined!456 (getValueByKey!628 (toList!8857 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(declare-fun b!1205407 () Bool)

(declare-fun Unit!39889 () Unit!39880)

(assert (=> b!1205407 (= e!684602 Unit!39889)))

(declare-fun b!1205408 () Bool)

(assert (=> b!1205408 (= e!684601 (isDefined!456 (getValueByKey!628 (toList!8857 (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (= (and d!133177 c!118405) b!1205406))

(assert (= (and d!133177 (not c!118405)) b!1205407))

(assert (= (and d!133177 (not res!801655)) b!1205408))

(declare-fun m!1111669 () Bool)

(assert (=> d!133177 m!1111669))

(declare-fun m!1111671 () Bool)

(assert (=> b!1205406 m!1111671))

(declare-fun m!1111673 () Bool)

(assert (=> b!1205406 m!1111673))

(assert (=> b!1205406 m!1111673))

(declare-fun m!1111675 () Bool)

(assert (=> b!1205406 m!1111675))

(assert (=> b!1205408 m!1111673))

(assert (=> b!1205408 m!1111673))

(assert (=> b!1205408 m!1111675))

(assert (=> b!1205185 d!133177))

(declare-fun b!1205451 () Bool)

(declare-fun e!684637 () ListLongMap!17683)

(declare-fun call!58232 () ListLongMap!17683)

(assert (=> b!1205451 (= e!684637 call!58232)))

(declare-fun bm!58224 () Bool)

(declare-fun call!58233 () ListLongMap!17683)

(assert (=> bm!58224 (= call!58232 call!58233)))

(declare-fun d!133179 () Bool)

(declare-fun e!684630 () Bool)

(assert (=> d!133179 e!684630))

(declare-fun res!801675 () Bool)

(assert (=> d!133179 (=> (not res!801675) (not e!684630))))

(assert (=> d!133179 (= res!801675 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))))

(declare-fun lt!546492 () ListLongMap!17683)

(declare-fun lt!546486 () ListLongMap!17683)

(assert (=> d!133179 (= lt!546492 lt!546486)))

(declare-fun lt!546485 () Unit!39880)

(declare-fun e!684633 () Unit!39880)

(assert (=> d!133179 (= lt!546485 e!684633)))

(declare-fun c!118419 () Bool)

(declare-fun e!684635 () Bool)

(assert (=> d!133179 (= c!118419 e!684635)))

(declare-fun res!801674 () Bool)

(assert (=> d!133179 (=> (not res!801674) (not e!684635))))

(assert (=> d!133179 (= res!801674 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun e!684639 () ListLongMap!17683)

(assert (=> d!133179 (= lt!546486 e!684639)))

(declare-fun c!118418 () Bool)

(assert (=> d!133179 (= c!118418 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!133179 (validMask!0 mask!1564)))

(assert (=> d!133179 (= (getCurrentListMap!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546492)))

(declare-fun b!1205452 () Bool)

(declare-fun e!684636 () Bool)

(declare-fun e!684632 () Bool)

(assert (=> b!1205452 (= e!684636 e!684632)))

(declare-fun res!801682 () Bool)

(assert (=> b!1205452 (=> (not res!801682) (not e!684632))))

(assert (=> b!1205452 (= res!801682 (contains!6932 lt!546492 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205452 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun b!1205453 () Bool)

(declare-fun e!684629 () Bool)

(declare-fun e!684638 () Bool)

(assert (=> b!1205453 (= e!684629 e!684638)))

(declare-fun res!801679 () Bool)

(declare-fun call!58227 () Bool)

(assert (=> b!1205453 (= res!801679 call!58227)))

(assert (=> b!1205453 (=> (not res!801679) (not e!684638))))

(declare-fun bm!58225 () Bool)

(declare-fun call!58229 () ListLongMap!17683)

(declare-fun call!58228 () ListLongMap!17683)

(assert (=> bm!58225 (= call!58229 call!58228)))

(declare-fun b!1205454 () Bool)

(declare-fun c!118423 () Bool)

(assert (=> b!1205454 (= c!118423 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!684631 () ListLongMap!17683)

(assert (=> b!1205454 (= e!684631 e!684637)))

(declare-fun c!118421 () Bool)

(declare-fun call!58230 () ListLongMap!17683)

(declare-fun bm!58226 () Bool)

(assert (=> bm!58226 (= call!58228 (+!4023 (ite c!118418 call!58230 (ite c!118421 call!58233 call!58232)) (ite (or c!118418 c!118421) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!58227 () Bool)

(declare-fun call!58231 () Bool)

(assert (=> bm!58227 (= call!58231 (contains!6932 lt!546492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1205455 () Bool)

(assert (=> b!1205455 (= e!684632 (= (apply!970 lt!546492 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19239 (select (arr!37649 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1205455 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38186 _values!996)))))

(assert (=> b!1205455 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun b!1205456 () Bool)

(assert (=> b!1205456 (= e!684629 (not call!58227))))

(declare-fun b!1205457 () Bool)

(declare-fun e!684640 () Bool)

(assert (=> b!1205457 (= e!684640 (not call!58231))))

(declare-fun b!1205458 () Bool)

(declare-fun res!801678 () Bool)

(assert (=> b!1205458 (=> (not res!801678) (not e!684630))))

(assert (=> b!1205458 (= res!801678 e!684640)))

(declare-fun c!118420 () Bool)

(assert (=> b!1205458 (= c!118420 (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1205459 () Bool)

(declare-fun e!684641 () Bool)

(assert (=> b!1205459 (= e!684641 (validKeyInArray!0 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205460 () Bool)

(assert (=> b!1205460 (= e!684631 call!58229)))

(declare-fun b!1205461 () Bool)

(assert (=> b!1205461 (= e!684639 e!684631)))

(assert (=> b!1205461 (= c!118421 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205462 () Bool)

(declare-fun e!684634 () Bool)

(assert (=> b!1205462 (= e!684640 e!684634)))

(declare-fun res!801676 () Bool)

(assert (=> b!1205462 (= res!801676 call!58231)))

(assert (=> b!1205462 (=> (not res!801676) (not e!684634))))

(declare-fun b!1205463 () Bool)

(assert (=> b!1205463 (= e!684634 (= (apply!970 lt!546492 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!944))))

(declare-fun b!1205464 () Bool)

(assert (=> b!1205464 (= e!684630 e!684629)))

(declare-fun c!118422 () Bool)

(assert (=> b!1205464 (= c!118422 (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205465 () Bool)

(declare-fun lt!546493 () Unit!39880)

(assert (=> b!1205465 (= e!684633 lt!546493)))

(declare-fun lt!546500 () ListLongMap!17683)

(assert (=> b!1205465 (= lt!546500 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546484 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546501 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546501 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546495 () Unit!39880)

(assert (=> b!1205465 (= lt!546495 (addStillContains!1007 lt!546500 lt!546484 zeroValue!944 lt!546501))))

(assert (=> b!1205465 (contains!6932 (+!4023 lt!546500 (tuple2!19707 lt!546484 zeroValue!944)) lt!546501)))

(declare-fun lt!546503 () Unit!39880)

(assert (=> b!1205465 (= lt!546503 lt!546495)))

(declare-fun lt!546487 () ListLongMap!17683)

(assert (=> b!1205465 (= lt!546487 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546483 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546491 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546491 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546498 () Unit!39880)

(declare-fun addApplyDifferent!524 (ListLongMap!17683 (_ BitVec 64) V!45937 (_ BitVec 64)) Unit!39880)

(assert (=> b!1205465 (= lt!546498 (addApplyDifferent!524 lt!546487 lt!546483 minValue!944 lt!546491))))

(assert (=> b!1205465 (= (apply!970 (+!4023 lt!546487 (tuple2!19707 lt!546483 minValue!944)) lt!546491) (apply!970 lt!546487 lt!546491))))

(declare-fun lt!546496 () Unit!39880)

(assert (=> b!1205465 (= lt!546496 lt!546498)))

(declare-fun lt!546488 () ListLongMap!17683)

(assert (=> b!1205465 (= lt!546488 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546490 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546502 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546502 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546497 () Unit!39880)

(assert (=> b!1205465 (= lt!546497 (addApplyDifferent!524 lt!546488 lt!546490 zeroValue!944 lt!546502))))

(assert (=> b!1205465 (= (apply!970 (+!4023 lt!546488 (tuple2!19707 lt!546490 zeroValue!944)) lt!546502) (apply!970 lt!546488 lt!546502))))

(declare-fun lt!546504 () Unit!39880)

(assert (=> b!1205465 (= lt!546504 lt!546497)))

(declare-fun lt!546489 () ListLongMap!17683)

(assert (=> b!1205465 (= lt!546489 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546499 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546494 () (_ BitVec 64))

(assert (=> b!1205465 (= lt!546494 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1205465 (= lt!546493 (addApplyDifferent!524 lt!546489 lt!546499 minValue!944 lt!546494))))

(assert (=> b!1205465 (= (apply!970 (+!4023 lt!546489 (tuple2!19707 lt!546499 minValue!944)) lt!546494) (apply!970 lt!546489 lt!546494))))

(declare-fun b!1205466 () Bool)

(assert (=> b!1205466 (= e!684637 call!58229)))

(declare-fun bm!58228 () Bool)

(assert (=> bm!58228 (= call!58227 (contains!6932 lt!546492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!58229 () Bool)

(assert (=> bm!58229 (= call!58233 call!58230)))

(declare-fun b!1205467 () Bool)

(declare-fun res!801680 () Bool)

(assert (=> b!1205467 (=> (not res!801680) (not e!684630))))

(assert (=> b!1205467 (= res!801680 e!684636)))

(declare-fun res!801677 () Bool)

(assert (=> b!1205467 (=> res!801677 e!684636)))

(assert (=> b!1205467 (= res!801677 (not e!684641))))

(declare-fun res!801681 () Bool)

(assert (=> b!1205467 (=> (not res!801681) (not e!684641))))

(assert (=> b!1205467 (= res!801681 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun b!1205468 () Bool)

(assert (=> b!1205468 (= e!684635 (validKeyInArray!0 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205469 () Bool)

(assert (=> b!1205469 (= e!684638 (= (apply!970 lt!546492 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!944))))

(declare-fun b!1205470 () Bool)

(assert (=> b!1205470 (= e!684639 (+!4023 call!58228 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1205471 () Bool)

(declare-fun Unit!39890 () Unit!39880)

(assert (=> b!1205471 (= e!684633 Unit!39890)))

(declare-fun bm!58230 () Bool)

(assert (=> bm!58230 (= call!58230 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133179 c!118418) b!1205470))

(assert (= (and d!133179 (not c!118418)) b!1205461))

(assert (= (and b!1205461 c!118421) b!1205460))

(assert (= (and b!1205461 (not c!118421)) b!1205454))

(assert (= (and b!1205454 c!118423) b!1205466))

(assert (= (and b!1205454 (not c!118423)) b!1205451))

(assert (= (or b!1205466 b!1205451) bm!58224))

(assert (= (or b!1205460 bm!58224) bm!58229))

(assert (= (or b!1205460 b!1205466) bm!58225))

(assert (= (or b!1205470 bm!58229) bm!58230))

(assert (= (or b!1205470 bm!58225) bm!58226))

(assert (= (and d!133179 res!801674) b!1205468))

(assert (= (and d!133179 c!118419) b!1205465))

(assert (= (and d!133179 (not c!118419)) b!1205471))

(assert (= (and d!133179 res!801675) b!1205467))

(assert (= (and b!1205467 res!801681) b!1205459))

(assert (= (and b!1205467 (not res!801677)) b!1205452))

(assert (= (and b!1205452 res!801682) b!1205455))

(assert (= (and b!1205467 res!801680) b!1205458))

(assert (= (and b!1205458 c!118420) b!1205462))

(assert (= (and b!1205458 (not c!118420)) b!1205457))

(assert (= (and b!1205462 res!801676) b!1205463))

(assert (= (or b!1205462 b!1205457) bm!58227))

(assert (= (and b!1205458 res!801678) b!1205464))

(assert (= (and b!1205464 c!118422) b!1205453))

(assert (= (and b!1205464 (not c!118422)) b!1205456))

(assert (= (and b!1205453 res!801679) b!1205469))

(assert (= (or b!1205453 b!1205456) bm!58228))

(declare-fun b_lambda!21189 () Bool)

(assert (=> (not b_lambda!21189) (not b!1205455)))

(assert (=> b!1205455 t!39390))

(declare-fun b_and!42753 () Bool)

(assert (= b_and!42751 (and (=> t!39390 result!21977) b_and!42753)))

(declare-fun m!1111677 () Bool)

(assert (=> bm!58228 m!1111677))

(declare-fun m!1111679 () Bool)

(assert (=> b!1205469 m!1111679))

(declare-fun m!1111681 () Bool)

(assert (=> b!1205452 m!1111681))

(assert (=> b!1205452 m!1111681))

(declare-fun m!1111683 () Bool)

(assert (=> b!1205452 m!1111683))

(declare-fun m!1111685 () Bool)

(assert (=> b!1205470 m!1111685))

(assert (=> b!1205455 m!1111681))

(declare-fun m!1111687 () Bool)

(assert (=> b!1205455 m!1111687))

(assert (=> b!1205455 m!1111681))

(declare-fun m!1111689 () Bool)

(assert (=> b!1205455 m!1111689))

(assert (=> b!1205455 m!1111499))

(declare-fun m!1111691 () Bool)

(assert (=> b!1205455 m!1111691))

(assert (=> b!1205455 m!1111689))

(assert (=> b!1205455 m!1111499))

(assert (=> b!1205468 m!1111681))

(assert (=> b!1205468 m!1111681))

(declare-fun m!1111693 () Bool)

(assert (=> b!1205468 m!1111693))

(assert (=> d!133179 m!1111489))

(assert (=> bm!58230 m!1111443))

(assert (=> b!1205459 m!1111681))

(assert (=> b!1205459 m!1111681))

(assert (=> b!1205459 m!1111693))

(declare-fun m!1111695 () Bool)

(assert (=> b!1205465 m!1111695))

(declare-fun m!1111697 () Bool)

(assert (=> b!1205465 m!1111697))

(declare-fun m!1111699 () Bool)

(assert (=> b!1205465 m!1111699))

(assert (=> b!1205465 m!1111681))

(declare-fun m!1111701 () Bool)

(assert (=> b!1205465 m!1111701))

(declare-fun m!1111703 () Bool)

(assert (=> b!1205465 m!1111703))

(assert (=> b!1205465 m!1111697))

(declare-fun m!1111705 () Bool)

(assert (=> b!1205465 m!1111705))

(assert (=> b!1205465 m!1111443))

(declare-fun m!1111707 () Bool)

(assert (=> b!1205465 m!1111707))

(declare-fun m!1111709 () Bool)

(assert (=> b!1205465 m!1111709))

(declare-fun m!1111711 () Bool)

(assert (=> b!1205465 m!1111711))

(declare-fun m!1111713 () Bool)

(assert (=> b!1205465 m!1111713))

(declare-fun m!1111715 () Bool)

(assert (=> b!1205465 m!1111715))

(assert (=> b!1205465 m!1111713))

(declare-fun m!1111717 () Bool)

(assert (=> b!1205465 m!1111717))

(assert (=> b!1205465 m!1111715))

(declare-fun m!1111719 () Bool)

(assert (=> b!1205465 m!1111719))

(assert (=> b!1205465 m!1111707))

(declare-fun m!1111721 () Bool)

(assert (=> b!1205465 m!1111721))

(declare-fun m!1111723 () Bool)

(assert (=> b!1205465 m!1111723))

(declare-fun m!1111725 () Bool)

(assert (=> bm!58226 m!1111725))

(declare-fun m!1111727 () Bool)

(assert (=> bm!58227 m!1111727))

(declare-fun m!1111729 () Bool)

(assert (=> b!1205463 m!1111729))

(assert (=> b!1205185 d!133179))

(declare-fun d!133181 () Bool)

(declare-fun e!684642 () Bool)

(assert (=> d!133181 e!684642))

(declare-fun res!801683 () Bool)

(assert (=> d!133181 (=> res!801683 e!684642)))

(declare-fun lt!546507 () Bool)

(assert (=> d!133181 (= res!801683 (not lt!546507))))

(declare-fun lt!546506 () Bool)

(assert (=> d!133181 (= lt!546507 lt!546506)))

(declare-fun lt!546508 () Unit!39880)

(declare-fun e!684643 () Unit!39880)

(assert (=> d!133181 (= lt!546508 e!684643)))

(declare-fun c!118424 () Bool)

(assert (=> d!133181 (= c!118424 lt!546506)))

(assert (=> d!133181 (= lt!546506 (containsKey!590 (toList!8857 lt!546309) k0!934))))

(assert (=> d!133181 (= (contains!6932 lt!546309 k0!934) lt!546507)))

(declare-fun b!1205472 () Bool)

(declare-fun lt!546505 () Unit!39880)

(assert (=> b!1205472 (= e!684643 lt!546505)))

(assert (=> b!1205472 (= lt!546505 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8857 lt!546309) k0!934))))

(assert (=> b!1205472 (isDefined!456 (getValueByKey!628 (toList!8857 lt!546309) k0!934))))

(declare-fun b!1205473 () Bool)

(declare-fun Unit!39891 () Unit!39880)

(assert (=> b!1205473 (= e!684643 Unit!39891)))

(declare-fun b!1205474 () Bool)

(assert (=> b!1205474 (= e!684642 (isDefined!456 (getValueByKey!628 (toList!8857 lt!546309) k0!934)))))

(assert (= (and d!133181 c!118424) b!1205472))

(assert (= (and d!133181 (not c!118424)) b!1205473))

(assert (= (and d!133181 (not res!801683)) b!1205474))

(declare-fun m!1111731 () Bool)

(assert (=> d!133181 m!1111731))

(declare-fun m!1111733 () Bool)

(assert (=> b!1205472 m!1111733))

(declare-fun m!1111735 () Bool)

(assert (=> b!1205472 m!1111735))

(assert (=> b!1205472 m!1111735))

(declare-fun m!1111737 () Bool)

(assert (=> b!1205472 m!1111737))

(assert (=> b!1205474 m!1111735))

(assert (=> b!1205474 m!1111735))

(assert (=> b!1205474 m!1111737))

(assert (=> b!1205169 d!133181))

(declare-fun b!1205475 () Bool)

(declare-fun e!684647 () Bool)

(declare-fun lt!546511 () ListLongMap!17683)

(assert (=> b!1205475 (= e!684647 (isEmpty!987 lt!546511))))

(declare-fun b!1205476 () Bool)

(assert (=> b!1205476 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(assert (=> b!1205476 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38186 _values!996)))))

(declare-fun e!684649 () Bool)

(assert (=> b!1205476 (= e!684649 (= (apply!970 lt!546511 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19239 (select (arr!37649 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205477 () Bool)

(declare-fun e!684645 () ListLongMap!17683)

(assert (=> b!1205477 (= e!684645 (ListLongMap!17684 Nil!26513))))

(declare-fun b!1205478 () Bool)

(declare-fun e!684646 () ListLongMap!17683)

(assert (=> b!1205478 (= e!684645 e!684646)))

(declare-fun c!118428 () Bool)

(assert (=> b!1205478 (= c!118428 (validKeyInArray!0 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205479 () Bool)

(declare-fun e!684648 () Bool)

(declare-fun e!684644 () Bool)

(assert (=> b!1205479 (= e!684648 e!684644)))

(declare-fun c!118425 () Bool)

(declare-fun e!684650 () Bool)

(assert (=> b!1205479 (= c!118425 e!684650)))

(declare-fun res!801686 () Bool)

(assert (=> b!1205479 (=> (not res!801686) (not e!684650))))

(assert (=> b!1205479 (= res!801686 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun b!1205480 () Bool)

(declare-fun lt!546513 () Unit!39880)

(declare-fun lt!546514 () Unit!39880)

(assert (=> b!1205480 (= lt!546513 lt!546514)))

(declare-fun lt!546515 () V!45937)

(declare-fun lt!546509 () (_ BitVec 64))

(declare-fun lt!546510 () (_ BitVec 64))

(declare-fun lt!546512 () ListLongMap!17683)

(assert (=> b!1205480 (not (contains!6932 (+!4023 lt!546512 (tuple2!19707 lt!546510 lt!546515)) lt!546509))))

(assert (=> b!1205480 (= lt!546514 (addStillNotContains!291 lt!546512 lt!546510 lt!546515 lt!546509))))

(assert (=> b!1205480 (= lt!546509 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205480 (= lt!546515 (get!19239 (select (arr!37649 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205480 (= lt!546510 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58234 () ListLongMap!17683)

(assert (=> b!1205480 (= lt!546512 call!58234)))

(assert (=> b!1205480 (= e!684646 (+!4023 call!58234 (tuple2!19707 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19239 (select (arr!37649 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205481 () Bool)

(declare-fun res!801684 () Bool)

(assert (=> b!1205481 (=> (not res!801684) (not e!684648))))

(assert (=> b!1205481 (= res!801684 (not (contains!6932 lt!546511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58231 () Bool)

(assert (=> bm!58231 (= call!58234 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205482 () Bool)

(assert (=> b!1205482 (= e!684644 e!684647)))

(declare-fun c!118427 () Bool)

(assert (=> b!1205482 (= c!118427 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun b!1205483 () Bool)

(assert (=> b!1205483 (= e!684646 call!58234)))

(declare-fun b!1205484 () Bool)

(assert (=> b!1205484 (= e!684647 (= lt!546511 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133183 () Bool)

(assert (=> d!133183 e!684648))

(declare-fun res!801685 () Bool)

(assert (=> d!133183 (=> (not res!801685) (not e!684648))))

(assert (=> d!133183 (= res!801685 (not (contains!6932 lt!546511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133183 (= lt!546511 e!684645)))

(declare-fun c!118426 () Bool)

(assert (=> d!133183 (= c!118426 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(assert (=> d!133183 (validMask!0 mask!1564)))

(assert (=> d!133183 (= (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546511)))

(declare-fun b!1205485 () Bool)

(assert (=> b!1205485 (= e!684650 (validKeyInArray!0 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205485 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1205486 () Bool)

(assert (=> b!1205486 (= e!684644 e!684649)))

(assert (=> b!1205486 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38187 _keys!1208)))))

(declare-fun res!801687 () Bool)

(assert (=> b!1205486 (= res!801687 (contains!6932 lt!546511 (select (arr!37650 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205486 (=> (not res!801687) (not e!684649))))

(assert (= (and d!133183 c!118426) b!1205477))

(assert (= (and d!133183 (not c!118426)) b!1205478))

(assert (= (and b!1205478 c!118428) b!1205480))

(assert (= (and b!1205478 (not c!118428)) b!1205483))

(assert (= (or b!1205480 b!1205483) bm!58231))

(assert (= (and d!133183 res!801685) b!1205481))

(assert (= (and b!1205481 res!801684) b!1205479))

(assert (= (and b!1205479 res!801686) b!1205485))

(assert (= (and b!1205479 c!118425) b!1205486))

(assert (= (and b!1205479 (not c!118425)) b!1205482))

(assert (= (and b!1205486 res!801687) b!1205476))

(assert (= (and b!1205482 c!118427) b!1205484))

(assert (= (and b!1205482 (not c!118427)) b!1205475))

(declare-fun b_lambda!21191 () Bool)

(assert (=> (not b_lambda!21191) (not b!1205476)))

(assert (=> b!1205476 t!39390))

(declare-fun b_and!42755 () Bool)

(assert (= b_and!42753 (and (=> t!39390 result!21977) b_and!42755)))

(declare-fun b_lambda!21193 () Bool)

(assert (=> (not b_lambda!21193) (not b!1205480)))

(assert (=> b!1205480 t!39390))

(declare-fun b_and!42757 () Bool)

(assert (= b_and!42755 (and (=> t!39390 result!21977) b_and!42757)))

(declare-fun m!1111739 () Bool)

(assert (=> b!1205484 m!1111739))

(declare-fun m!1111741 () Bool)

(assert (=> b!1205480 m!1111741))

(declare-fun m!1111743 () Bool)

(assert (=> b!1205480 m!1111743))

(assert (=> b!1205480 m!1111681))

(declare-fun m!1111745 () Bool)

(assert (=> b!1205480 m!1111745))

(assert (=> b!1205480 m!1111689))

(assert (=> b!1205480 m!1111499))

(assert (=> b!1205480 m!1111691))

(assert (=> b!1205480 m!1111499))

(assert (=> b!1205480 m!1111689))

(assert (=> b!1205480 m!1111743))

(declare-fun m!1111747 () Bool)

(assert (=> b!1205480 m!1111747))

(assert (=> b!1205485 m!1111681))

(assert (=> b!1205485 m!1111681))

(assert (=> b!1205485 m!1111693))

(assert (=> bm!58231 m!1111739))

(declare-fun m!1111749 () Bool)

(assert (=> b!1205481 m!1111749))

(assert (=> b!1205478 m!1111681))

(assert (=> b!1205478 m!1111681))

(assert (=> b!1205478 m!1111693))

(assert (=> b!1205476 m!1111681))

(declare-fun m!1111751 () Bool)

(assert (=> b!1205476 m!1111751))

(assert (=> b!1205476 m!1111689))

(assert (=> b!1205476 m!1111681))

(assert (=> b!1205476 m!1111689))

(assert (=> b!1205476 m!1111499))

(assert (=> b!1205476 m!1111691))

(assert (=> b!1205476 m!1111499))

(declare-fun m!1111753 () Bool)

(assert (=> b!1205475 m!1111753))

(declare-fun m!1111755 () Bool)

(assert (=> d!133183 m!1111755))

(assert (=> d!133183 m!1111489))

(assert (=> b!1205486 m!1111681))

(assert (=> b!1205486 m!1111681))

(declare-fun m!1111757 () Bool)

(assert (=> b!1205486 m!1111757))

(assert (=> b!1205169 d!133183))

(declare-fun d!133185 () Bool)

(declare-fun res!801693 () Bool)

(declare-fun e!684657 () Bool)

(assert (=> d!133185 (=> res!801693 e!684657)))

(assert (=> d!133185 (= res!801693 (bvsge #b00000000000000000000000000000000 (size!38187 _keys!1208)))))

(assert (=> d!133185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684657)))

(declare-fun b!1205495 () Bool)

(declare-fun e!684658 () Bool)

(assert (=> b!1205495 (= e!684657 e!684658)))

(declare-fun c!118431 () Bool)

(assert (=> b!1205495 (= c!118431 (validKeyInArray!0 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205496 () Bool)

(declare-fun call!58237 () Bool)

(assert (=> b!1205496 (= e!684658 call!58237)))

(declare-fun b!1205497 () Bool)

(declare-fun e!684659 () Bool)

(assert (=> b!1205497 (= e!684658 e!684659)))

(declare-fun lt!546523 () (_ BitVec 64))

(assert (=> b!1205497 (= lt!546523 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546524 () Unit!39880)

(assert (=> b!1205497 (= lt!546524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546523 #b00000000000000000000000000000000))))

(assert (=> b!1205497 (arrayContainsKey!0 _keys!1208 lt!546523 #b00000000000000000000000000000000)))

(declare-fun lt!546522 () Unit!39880)

(assert (=> b!1205497 (= lt!546522 lt!546524)))

(declare-fun res!801692 () Bool)

(declare-datatypes ((SeekEntryResult!9890 0))(
  ( (MissingZero!9890 (index!41931 (_ BitVec 32))) (Found!9890 (index!41932 (_ BitVec 32))) (Intermediate!9890 (undefined!10702 Bool) (index!41933 (_ BitVec 32)) (x!106370 (_ BitVec 32))) (Undefined!9890) (MissingVacant!9890 (index!41934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78025 (_ BitVec 32)) SeekEntryResult!9890)

(assert (=> b!1205497 (= res!801692 (= (seekEntryOrOpen!0 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9890 #b00000000000000000000000000000000)))))

(assert (=> b!1205497 (=> (not res!801692) (not e!684659))))

(declare-fun bm!58234 () Bool)

(assert (=> bm!58234 (= call!58237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1205498 () Bool)

(assert (=> b!1205498 (= e!684659 call!58237)))

(assert (= (and d!133185 (not res!801693)) b!1205495))

(assert (= (and b!1205495 c!118431) b!1205497))

(assert (= (and b!1205495 (not c!118431)) b!1205496))

(assert (= (and b!1205497 res!801692) b!1205498))

(assert (= (or b!1205498 b!1205496) bm!58234))

(declare-fun m!1111759 () Bool)

(assert (=> b!1205495 m!1111759))

(assert (=> b!1205495 m!1111759))

(declare-fun m!1111761 () Bool)

(assert (=> b!1205495 m!1111761))

(assert (=> b!1205497 m!1111759))

(declare-fun m!1111763 () Bool)

(assert (=> b!1205497 m!1111763))

(declare-fun m!1111765 () Bool)

(assert (=> b!1205497 m!1111765))

(assert (=> b!1205497 m!1111759))

(declare-fun m!1111767 () Bool)

(assert (=> b!1205497 m!1111767))

(declare-fun m!1111769 () Bool)

(assert (=> bm!58234 m!1111769))

(assert (=> b!1205186 d!133185))

(declare-fun b!1205509 () Bool)

(declare-fun e!684670 () Bool)

(declare-fun call!58240 () Bool)

(assert (=> b!1205509 (= e!684670 call!58240)))

(declare-fun b!1205511 () Bool)

(declare-fun e!684668 () Bool)

(declare-fun e!684669 () Bool)

(assert (=> b!1205511 (= e!684668 e!684669)))

(declare-fun res!801700 () Bool)

(assert (=> b!1205511 (=> (not res!801700) (not e!684669))))

(declare-fun e!684671 () Bool)

(assert (=> b!1205511 (= res!801700 (not e!684671))))

(declare-fun res!801701 () Bool)

(assert (=> b!1205511 (=> (not res!801701) (not e!684671))))

(assert (=> b!1205511 (= res!801701 (validKeyInArray!0 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205512 () Bool)

(assert (=> b!1205512 (= e!684669 e!684670)))

(declare-fun c!118434 () Bool)

(assert (=> b!1205512 (= c!118434 (validKeyInArray!0 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205513 () Bool)

(assert (=> b!1205513 (= e!684670 call!58240)))

(declare-fun bm!58237 () Bool)

(assert (=> bm!58237 (= call!58240 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118434 (Cons!26513 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000) Nil!26514) Nil!26514)))))

(declare-fun b!1205510 () Bool)

(declare-fun contains!6935 (List!26517 (_ BitVec 64)) Bool)

(assert (=> b!1205510 (= e!684671 (contains!6935 Nil!26514 (select (arr!37650 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133187 () Bool)

(declare-fun res!801702 () Bool)

(assert (=> d!133187 (=> res!801702 e!684668)))

(assert (=> d!133187 (= res!801702 (bvsge #b00000000000000000000000000000000 (size!38187 _keys!1208)))))

(assert (=> d!133187 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26514) e!684668)))

(assert (= (and d!133187 (not res!801702)) b!1205511))

(assert (= (and b!1205511 res!801701) b!1205510))

(assert (= (and b!1205511 res!801700) b!1205512))

(assert (= (and b!1205512 c!118434) b!1205509))

(assert (= (and b!1205512 (not c!118434)) b!1205513))

(assert (= (or b!1205509 b!1205513) bm!58237))

(assert (=> b!1205511 m!1111759))

(assert (=> b!1205511 m!1111759))

(assert (=> b!1205511 m!1111761))

(assert (=> b!1205512 m!1111759))

(assert (=> b!1205512 m!1111759))

(assert (=> b!1205512 m!1111761))

(assert (=> bm!58237 m!1111759))

(declare-fun m!1111771 () Bool)

(assert (=> bm!58237 m!1111771))

(assert (=> b!1205510 m!1111759))

(assert (=> b!1205510 m!1111759))

(declare-fun m!1111773 () Bool)

(assert (=> b!1205510 m!1111773))

(assert (=> b!1205184 d!133187))

(declare-fun b!1205514 () Bool)

(declare-fun e!684674 () Bool)

(declare-fun call!58241 () Bool)

(assert (=> b!1205514 (= e!684674 call!58241)))

(declare-fun b!1205516 () Bool)

(declare-fun e!684672 () Bool)

(declare-fun e!684673 () Bool)

(assert (=> b!1205516 (= e!684672 e!684673)))

(declare-fun res!801703 () Bool)

(assert (=> b!1205516 (=> (not res!801703) (not e!684673))))

(declare-fun e!684675 () Bool)

(assert (=> b!1205516 (= res!801703 (not e!684675))))

(declare-fun res!801704 () Bool)

(assert (=> b!1205516 (=> (not res!801704) (not e!684675))))

(assert (=> b!1205516 (= res!801704 (validKeyInArray!0 (select (arr!37650 lt!546314) #b00000000000000000000000000000000)))))

(declare-fun b!1205517 () Bool)

(assert (=> b!1205517 (= e!684673 e!684674)))

(declare-fun c!118435 () Bool)

(assert (=> b!1205517 (= c!118435 (validKeyInArray!0 (select (arr!37650 lt!546314) #b00000000000000000000000000000000)))))

(declare-fun b!1205518 () Bool)

(assert (=> b!1205518 (= e!684674 call!58241)))

(declare-fun bm!58238 () Bool)

(assert (=> bm!58238 (= call!58241 (arrayNoDuplicates!0 lt!546314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118435 (Cons!26513 (select (arr!37650 lt!546314) #b00000000000000000000000000000000) Nil!26514) Nil!26514)))))

(declare-fun b!1205515 () Bool)

(assert (=> b!1205515 (= e!684675 (contains!6935 Nil!26514 (select (arr!37650 lt!546314) #b00000000000000000000000000000000)))))

(declare-fun d!133189 () Bool)

(declare-fun res!801705 () Bool)

(assert (=> d!133189 (=> res!801705 e!684672)))

(assert (=> d!133189 (= res!801705 (bvsge #b00000000000000000000000000000000 (size!38187 lt!546314)))))

(assert (=> d!133189 (= (arrayNoDuplicates!0 lt!546314 #b00000000000000000000000000000000 Nil!26514) e!684672)))

(assert (= (and d!133189 (not res!801705)) b!1205516))

(assert (= (and b!1205516 res!801704) b!1205515))

(assert (= (and b!1205516 res!801703) b!1205517))

(assert (= (and b!1205517 c!118435) b!1205514))

(assert (= (and b!1205517 (not c!118435)) b!1205518))

(assert (= (or b!1205514 b!1205518) bm!58238))

(declare-fun m!1111775 () Bool)

(assert (=> b!1205516 m!1111775))

(assert (=> b!1205516 m!1111775))

(declare-fun m!1111777 () Bool)

(assert (=> b!1205516 m!1111777))

(assert (=> b!1205517 m!1111775))

(assert (=> b!1205517 m!1111775))

(assert (=> b!1205517 m!1111777))

(assert (=> bm!58238 m!1111775))

(declare-fun m!1111779 () Bool)

(assert (=> bm!58238 m!1111779))

(assert (=> b!1205515 m!1111775))

(assert (=> b!1205515 m!1111775))

(declare-fun m!1111781 () Bool)

(assert (=> b!1205515 m!1111781))

(assert (=> b!1205168 d!133189))

(declare-fun b!1205519 () Bool)

(declare-fun e!684679 () Bool)

(declare-fun lt!546527 () ListLongMap!17683)

(assert (=> b!1205519 (= e!684679 (isEmpty!987 lt!546527))))

(declare-fun b!1205520 () Bool)

(assert (=> b!1205520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38187 lt!546314)))))

(assert (=> b!1205520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38186 lt!546304)))))

(declare-fun e!684681 () Bool)

(assert (=> b!1205520 (= e!684681 (= (apply!970 lt!546527 (select (arr!37650 lt!546314) from!1455)) (get!19239 (select (arr!37649 lt!546304) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205521 () Bool)

(declare-fun e!684677 () ListLongMap!17683)

(assert (=> b!1205521 (= e!684677 (ListLongMap!17684 Nil!26513))))

(declare-fun b!1205522 () Bool)

(declare-fun e!684678 () ListLongMap!17683)

(assert (=> b!1205522 (= e!684677 e!684678)))

(declare-fun c!118439 () Bool)

(assert (=> b!1205522 (= c!118439 (validKeyInArray!0 (select (arr!37650 lt!546314) from!1455)))))

(declare-fun b!1205523 () Bool)

(declare-fun e!684680 () Bool)

(declare-fun e!684676 () Bool)

(assert (=> b!1205523 (= e!684680 e!684676)))

(declare-fun c!118436 () Bool)

(declare-fun e!684682 () Bool)

(assert (=> b!1205523 (= c!118436 e!684682)))

(declare-fun res!801708 () Bool)

(assert (=> b!1205523 (=> (not res!801708) (not e!684682))))

(assert (=> b!1205523 (= res!801708 (bvslt from!1455 (size!38187 lt!546314)))))

(declare-fun b!1205524 () Bool)

(declare-fun lt!546529 () Unit!39880)

(declare-fun lt!546530 () Unit!39880)

(assert (=> b!1205524 (= lt!546529 lt!546530)))

(declare-fun lt!546525 () (_ BitVec 64))

(declare-fun lt!546531 () V!45937)

(declare-fun lt!546526 () (_ BitVec 64))

(declare-fun lt!546528 () ListLongMap!17683)

(assert (=> b!1205524 (not (contains!6932 (+!4023 lt!546528 (tuple2!19707 lt!546526 lt!546531)) lt!546525))))

(assert (=> b!1205524 (= lt!546530 (addStillNotContains!291 lt!546528 lt!546526 lt!546531 lt!546525))))

(assert (=> b!1205524 (= lt!546525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205524 (= lt!546531 (get!19239 (select (arr!37649 lt!546304) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205524 (= lt!546526 (select (arr!37650 lt!546314) from!1455))))

(declare-fun call!58242 () ListLongMap!17683)

(assert (=> b!1205524 (= lt!546528 call!58242)))

(assert (=> b!1205524 (= e!684678 (+!4023 call!58242 (tuple2!19707 (select (arr!37650 lt!546314) from!1455) (get!19239 (select (arr!37649 lt!546304) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205525 () Bool)

(declare-fun res!801706 () Bool)

(assert (=> b!1205525 (=> (not res!801706) (not e!684680))))

(assert (=> b!1205525 (= res!801706 (not (contains!6932 lt!546527 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58239 () Bool)

(assert (=> bm!58239 (= call!58242 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205526 () Bool)

(assert (=> b!1205526 (= e!684676 e!684679)))

(declare-fun c!118438 () Bool)

(assert (=> b!1205526 (= c!118438 (bvslt from!1455 (size!38187 lt!546314)))))

(declare-fun b!1205527 () Bool)

(assert (=> b!1205527 (= e!684678 call!58242)))

(declare-fun b!1205528 () Bool)

(assert (=> b!1205528 (= e!684679 (= lt!546527 (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133191 () Bool)

(assert (=> d!133191 e!684680))

(declare-fun res!801707 () Bool)

(assert (=> d!133191 (=> (not res!801707) (not e!684680))))

(assert (=> d!133191 (= res!801707 (not (contains!6932 lt!546527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133191 (= lt!546527 e!684677)))

(declare-fun c!118437 () Bool)

(assert (=> d!133191 (= c!118437 (bvsge from!1455 (size!38187 lt!546314)))))

(assert (=> d!133191 (validMask!0 mask!1564)))

(assert (=> d!133191 (= (getCurrentListMapNoExtraKeys!5323 lt!546314 lt!546304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546527)))

(declare-fun b!1205529 () Bool)

(assert (=> b!1205529 (= e!684682 (validKeyInArray!0 (select (arr!37650 lt!546314) from!1455)))))

(assert (=> b!1205529 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1205530 () Bool)

(assert (=> b!1205530 (= e!684676 e!684681)))

(assert (=> b!1205530 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38187 lt!546314)))))

(declare-fun res!801709 () Bool)

(assert (=> b!1205530 (= res!801709 (contains!6932 lt!546527 (select (arr!37650 lt!546314) from!1455)))))

(assert (=> b!1205530 (=> (not res!801709) (not e!684681))))

(assert (= (and d!133191 c!118437) b!1205521))

(assert (= (and d!133191 (not c!118437)) b!1205522))

(assert (= (and b!1205522 c!118439) b!1205524))

(assert (= (and b!1205522 (not c!118439)) b!1205527))

(assert (= (or b!1205524 b!1205527) bm!58239))

(assert (= (and d!133191 res!801707) b!1205525))

(assert (= (and b!1205525 res!801706) b!1205523))

(assert (= (and b!1205523 res!801708) b!1205529))

(assert (= (and b!1205523 c!118436) b!1205530))

(assert (= (and b!1205523 (not c!118436)) b!1205526))

(assert (= (and b!1205530 res!801709) b!1205520))

(assert (= (and b!1205526 c!118438) b!1205528))

(assert (= (and b!1205526 (not c!118438)) b!1205519))

(declare-fun b_lambda!21195 () Bool)

(assert (=> (not b_lambda!21195) (not b!1205520)))

(assert (=> b!1205520 t!39390))

(declare-fun b_and!42759 () Bool)

(assert (= b_and!42757 (and (=> t!39390 result!21977) b_and!42759)))

(declare-fun b_lambda!21197 () Bool)

(assert (=> (not b_lambda!21197) (not b!1205524)))

(assert (=> b!1205524 t!39390))

(declare-fun b_and!42761 () Bool)

(assert (= b_and!42759 (and (=> t!39390 result!21977) b_and!42761)))

(declare-fun m!1111783 () Bool)

(assert (=> b!1205528 m!1111783))

(declare-fun m!1111785 () Bool)

(assert (=> b!1205524 m!1111785))

(declare-fun m!1111787 () Bool)

(assert (=> b!1205524 m!1111787))

(declare-fun m!1111789 () Bool)

(assert (=> b!1205524 m!1111789))

(declare-fun m!1111791 () Bool)

(assert (=> b!1205524 m!1111791))

(declare-fun m!1111793 () Bool)

(assert (=> b!1205524 m!1111793))

(assert (=> b!1205524 m!1111499))

(declare-fun m!1111795 () Bool)

(assert (=> b!1205524 m!1111795))

(assert (=> b!1205524 m!1111499))

(assert (=> b!1205524 m!1111793))

(assert (=> b!1205524 m!1111787))

(declare-fun m!1111797 () Bool)

(assert (=> b!1205524 m!1111797))

(assert (=> b!1205529 m!1111789))

(assert (=> b!1205529 m!1111789))

(declare-fun m!1111799 () Bool)

(assert (=> b!1205529 m!1111799))

(assert (=> bm!58239 m!1111783))

(declare-fun m!1111801 () Bool)

(assert (=> b!1205525 m!1111801))

(assert (=> b!1205522 m!1111789))

(assert (=> b!1205522 m!1111789))

(assert (=> b!1205522 m!1111799))

(assert (=> b!1205520 m!1111789))

(declare-fun m!1111803 () Bool)

(assert (=> b!1205520 m!1111803))

(assert (=> b!1205520 m!1111793))

(assert (=> b!1205520 m!1111789))

(assert (=> b!1205520 m!1111793))

(assert (=> b!1205520 m!1111499))

(assert (=> b!1205520 m!1111795))

(assert (=> b!1205520 m!1111499))

(declare-fun m!1111805 () Bool)

(assert (=> b!1205519 m!1111805))

(declare-fun m!1111807 () Bool)

(assert (=> d!133191 m!1111807))

(assert (=> d!133191 m!1111489))

(assert (=> b!1205530 m!1111789))

(assert (=> b!1205530 m!1111789))

(declare-fun m!1111809 () Bool)

(assert (=> b!1205530 m!1111809))

(assert (=> b!1205166 d!133191))

(declare-fun b!1205531 () Bool)

(declare-fun e!684686 () Bool)

(declare-fun lt!546534 () ListLongMap!17683)

(assert (=> b!1205531 (= e!684686 (isEmpty!987 lt!546534))))

(declare-fun b!1205532 () Bool)

(assert (=> b!1205532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38187 _keys!1208)))))

(assert (=> b!1205532 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38186 _values!996)))))

(declare-fun e!684688 () Bool)

(assert (=> b!1205532 (= e!684688 (= (apply!970 lt!546534 (select (arr!37650 _keys!1208) from!1455)) (get!19239 (select (arr!37649 _values!996) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205533 () Bool)

(declare-fun e!684684 () ListLongMap!17683)

(assert (=> b!1205533 (= e!684684 (ListLongMap!17684 Nil!26513))))

(declare-fun b!1205534 () Bool)

(declare-fun e!684685 () ListLongMap!17683)

(assert (=> b!1205534 (= e!684684 e!684685)))

(declare-fun c!118443 () Bool)

(assert (=> b!1205534 (= c!118443 (validKeyInArray!0 (select (arr!37650 _keys!1208) from!1455)))))

(declare-fun b!1205535 () Bool)

(declare-fun e!684687 () Bool)

(declare-fun e!684683 () Bool)

(assert (=> b!1205535 (= e!684687 e!684683)))

(declare-fun c!118440 () Bool)

(declare-fun e!684689 () Bool)

(assert (=> b!1205535 (= c!118440 e!684689)))

(declare-fun res!801712 () Bool)

(assert (=> b!1205535 (=> (not res!801712) (not e!684689))))

(assert (=> b!1205535 (= res!801712 (bvslt from!1455 (size!38187 _keys!1208)))))

(declare-fun b!1205536 () Bool)

(declare-fun lt!546536 () Unit!39880)

(declare-fun lt!546537 () Unit!39880)

(assert (=> b!1205536 (= lt!546536 lt!546537)))

(declare-fun lt!546533 () (_ BitVec 64))

(declare-fun lt!546535 () ListLongMap!17683)

(declare-fun lt!546538 () V!45937)

(declare-fun lt!546532 () (_ BitVec 64))

(assert (=> b!1205536 (not (contains!6932 (+!4023 lt!546535 (tuple2!19707 lt!546533 lt!546538)) lt!546532))))

(assert (=> b!1205536 (= lt!546537 (addStillNotContains!291 lt!546535 lt!546533 lt!546538 lt!546532))))

(assert (=> b!1205536 (= lt!546532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205536 (= lt!546538 (get!19239 (select (arr!37649 _values!996) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205536 (= lt!546533 (select (arr!37650 _keys!1208) from!1455))))

(declare-fun call!58243 () ListLongMap!17683)

(assert (=> b!1205536 (= lt!546535 call!58243)))

(assert (=> b!1205536 (= e!684685 (+!4023 call!58243 (tuple2!19707 (select (arr!37650 _keys!1208) from!1455) (get!19239 (select (arr!37649 _values!996) from!1455) (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205537 () Bool)

(declare-fun res!801710 () Bool)

(assert (=> b!1205537 (=> (not res!801710) (not e!684687))))

(assert (=> b!1205537 (= res!801710 (not (contains!6932 lt!546534 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58240 () Bool)

(assert (=> bm!58240 (= call!58243 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205538 () Bool)

(assert (=> b!1205538 (= e!684683 e!684686)))

(declare-fun c!118442 () Bool)

(assert (=> b!1205538 (= c!118442 (bvslt from!1455 (size!38187 _keys!1208)))))

(declare-fun b!1205539 () Bool)

(assert (=> b!1205539 (= e!684685 call!58243)))

(declare-fun b!1205540 () Bool)

(assert (=> b!1205540 (= e!684686 (= lt!546534 (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!133193 () Bool)

(assert (=> d!133193 e!684687))

(declare-fun res!801711 () Bool)

(assert (=> d!133193 (=> (not res!801711) (not e!684687))))

(assert (=> d!133193 (= res!801711 (not (contains!6932 lt!546534 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133193 (= lt!546534 e!684684)))

(declare-fun c!118441 () Bool)

(assert (=> d!133193 (= c!118441 (bvsge from!1455 (size!38187 _keys!1208)))))

(assert (=> d!133193 (validMask!0 mask!1564)))

(assert (=> d!133193 (= (getCurrentListMapNoExtraKeys!5323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546534)))

(declare-fun b!1205541 () Bool)

(assert (=> b!1205541 (= e!684689 (validKeyInArray!0 (select (arr!37650 _keys!1208) from!1455)))))

(assert (=> b!1205541 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1205542 () Bool)

(assert (=> b!1205542 (= e!684683 e!684688)))

(assert (=> b!1205542 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38187 _keys!1208)))))

(declare-fun res!801713 () Bool)

(assert (=> b!1205542 (= res!801713 (contains!6932 lt!546534 (select (arr!37650 _keys!1208) from!1455)))))

(assert (=> b!1205542 (=> (not res!801713) (not e!684688))))

(assert (= (and d!133193 c!118441) b!1205533))

(assert (= (and d!133193 (not c!118441)) b!1205534))

(assert (= (and b!1205534 c!118443) b!1205536))

(assert (= (and b!1205534 (not c!118443)) b!1205539))

(assert (= (or b!1205536 b!1205539) bm!58240))

(assert (= (and d!133193 res!801711) b!1205537))

(assert (= (and b!1205537 res!801710) b!1205535))

(assert (= (and b!1205535 res!801712) b!1205541))

(assert (= (and b!1205535 c!118440) b!1205542))

(assert (= (and b!1205535 (not c!118440)) b!1205538))

(assert (= (and b!1205542 res!801713) b!1205532))

(assert (= (and b!1205538 c!118442) b!1205540))

(assert (= (and b!1205538 (not c!118442)) b!1205531))

(declare-fun b_lambda!21199 () Bool)

(assert (=> (not b_lambda!21199) (not b!1205532)))

(assert (=> b!1205532 t!39390))

(declare-fun b_and!42763 () Bool)

(assert (= b_and!42761 (and (=> t!39390 result!21977) b_and!42763)))

(declare-fun b_lambda!21201 () Bool)

(assert (=> (not b_lambda!21201) (not b!1205536)))

(assert (=> b!1205536 t!39390))

(declare-fun b_and!42765 () Bool)

(assert (= b_and!42763 (and (=> t!39390 result!21977) b_and!42765)))

(declare-fun m!1111811 () Bool)

(assert (=> b!1205540 m!1111811))

(declare-fun m!1111813 () Bool)

(assert (=> b!1205536 m!1111813))

(declare-fun m!1111815 () Bool)

(assert (=> b!1205536 m!1111815))

(assert (=> b!1205536 m!1111445))

(declare-fun m!1111817 () Bool)

(assert (=> b!1205536 m!1111817))

(declare-fun m!1111819 () Bool)

(assert (=> b!1205536 m!1111819))

(assert (=> b!1205536 m!1111499))

(declare-fun m!1111821 () Bool)

(assert (=> b!1205536 m!1111821))

(assert (=> b!1205536 m!1111499))

(assert (=> b!1205536 m!1111819))

(assert (=> b!1205536 m!1111815))

(declare-fun m!1111823 () Bool)

(assert (=> b!1205536 m!1111823))

(assert (=> b!1205541 m!1111445))

(assert (=> b!1205541 m!1111445))

(declare-fun m!1111825 () Bool)

(assert (=> b!1205541 m!1111825))

(assert (=> bm!58240 m!1111811))

(declare-fun m!1111827 () Bool)

(assert (=> b!1205537 m!1111827))

(assert (=> b!1205534 m!1111445))

(assert (=> b!1205534 m!1111445))

(assert (=> b!1205534 m!1111825))

(assert (=> b!1205532 m!1111445))

(declare-fun m!1111829 () Bool)

(assert (=> b!1205532 m!1111829))

(assert (=> b!1205532 m!1111819))

(assert (=> b!1205532 m!1111445))

(assert (=> b!1205532 m!1111819))

(assert (=> b!1205532 m!1111499))

(assert (=> b!1205532 m!1111821))

(assert (=> b!1205532 m!1111499))

(declare-fun m!1111831 () Bool)

(assert (=> b!1205531 m!1111831))

(declare-fun m!1111833 () Bool)

(assert (=> d!133193 m!1111833))

(assert (=> d!133193 m!1111489))

(assert (=> b!1205542 m!1111445))

(assert (=> b!1205542 m!1111445))

(declare-fun m!1111835 () Bool)

(assert (=> b!1205542 m!1111835))

(assert (=> b!1205166 d!133193))

(declare-fun d!133195 () Bool)

(assert (=> d!133195 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1205183 d!133195))

(declare-fun d!133197 () Bool)

(assert (=> d!133197 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1205167 d!133197))

(declare-fun d!133199 () Bool)

(declare-fun e!684690 () Bool)

(assert (=> d!133199 e!684690))

(declare-fun res!801714 () Bool)

(assert (=> d!133199 (=> res!801714 e!684690)))

(declare-fun lt!546541 () Bool)

(assert (=> d!133199 (= res!801714 (not lt!546541))))

(declare-fun lt!546540 () Bool)

(assert (=> d!133199 (= lt!546541 lt!546540)))

(declare-fun lt!546542 () Unit!39880)

(declare-fun e!684691 () Unit!39880)

(assert (=> d!133199 (= lt!546542 e!684691)))

(declare-fun c!118444 () Bool)

(assert (=> d!133199 (= c!118444 lt!546540)))

(assert (=> d!133199 (= lt!546540 (containsKey!590 (toList!8857 (ite c!118362 lt!546302 call!58148)) k0!934))))

(assert (=> d!133199 (= (contains!6932 (ite c!118362 lt!546302 call!58148) k0!934) lt!546541)))

(declare-fun b!1205543 () Bool)

(declare-fun lt!546539 () Unit!39880)

(assert (=> b!1205543 (= e!684691 lt!546539)))

(assert (=> b!1205543 (= lt!546539 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8857 (ite c!118362 lt!546302 call!58148)) k0!934))))

(assert (=> b!1205543 (isDefined!456 (getValueByKey!628 (toList!8857 (ite c!118362 lt!546302 call!58148)) k0!934))))

(declare-fun b!1205544 () Bool)

(declare-fun Unit!39892 () Unit!39880)

(assert (=> b!1205544 (= e!684691 Unit!39892)))

(declare-fun b!1205545 () Bool)

(assert (=> b!1205545 (= e!684690 (isDefined!456 (getValueByKey!628 (toList!8857 (ite c!118362 lt!546302 call!58148)) k0!934)))))

(assert (= (and d!133199 c!118444) b!1205543))

(assert (= (and d!133199 (not c!118444)) b!1205544))

(assert (= (and d!133199 (not res!801714)) b!1205545))

(declare-fun m!1111837 () Bool)

(assert (=> d!133199 m!1111837))

(declare-fun m!1111839 () Bool)

(assert (=> b!1205543 m!1111839))

(declare-fun m!1111841 () Bool)

(assert (=> b!1205543 m!1111841))

(assert (=> b!1205543 m!1111841))

(declare-fun m!1111843 () Bool)

(assert (=> b!1205543 m!1111843))

(assert (=> b!1205545 m!1111841))

(assert (=> b!1205545 m!1111841))

(assert (=> b!1205545 m!1111843))

(assert (=> bm!58146 d!133199))

(declare-fun d!133201 () Bool)

(assert (=> d!133201 (= (array_inv!28752 _keys!1208) (bvsge (size!38187 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100878 d!133201))

(declare-fun d!133203 () Bool)

(assert (=> d!133203 (= (array_inv!28753 _values!996) (bvsge (size!38186 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100878 d!133203))

(declare-fun d!133205 () Bool)

(declare-fun res!801716 () Bool)

(declare-fun e!684692 () Bool)

(assert (=> d!133205 (=> res!801716 e!684692)))

(assert (=> d!133205 (= res!801716 (bvsge #b00000000000000000000000000000000 (size!38187 lt!546314)))))

(assert (=> d!133205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546314 mask!1564) e!684692)))

(declare-fun b!1205546 () Bool)

(declare-fun e!684693 () Bool)

(assert (=> b!1205546 (= e!684692 e!684693)))

(declare-fun c!118445 () Bool)

(assert (=> b!1205546 (= c!118445 (validKeyInArray!0 (select (arr!37650 lt!546314) #b00000000000000000000000000000000)))))

(declare-fun b!1205547 () Bool)

(declare-fun call!58244 () Bool)

(assert (=> b!1205547 (= e!684693 call!58244)))

(declare-fun b!1205548 () Bool)

(declare-fun e!684694 () Bool)

(assert (=> b!1205548 (= e!684693 e!684694)))

(declare-fun lt!546544 () (_ BitVec 64))

(assert (=> b!1205548 (= lt!546544 (select (arr!37650 lt!546314) #b00000000000000000000000000000000))))

(declare-fun lt!546545 () Unit!39880)

(assert (=> b!1205548 (= lt!546545 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546314 lt!546544 #b00000000000000000000000000000000))))

(assert (=> b!1205548 (arrayContainsKey!0 lt!546314 lt!546544 #b00000000000000000000000000000000)))

(declare-fun lt!546543 () Unit!39880)

(assert (=> b!1205548 (= lt!546543 lt!546545)))

(declare-fun res!801715 () Bool)

(assert (=> b!1205548 (= res!801715 (= (seekEntryOrOpen!0 (select (arr!37650 lt!546314) #b00000000000000000000000000000000) lt!546314 mask!1564) (Found!9890 #b00000000000000000000000000000000)))))

(assert (=> b!1205548 (=> (not res!801715) (not e!684694))))

(declare-fun bm!58241 () Bool)

(assert (=> bm!58241 (= call!58244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546314 mask!1564))))

(declare-fun b!1205549 () Bool)

(assert (=> b!1205549 (= e!684694 call!58244)))

(assert (= (and d!133205 (not res!801716)) b!1205546))

(assert (= (and b!1205546 c!118445) b!1205548))

(assert (= (and b!1205546 (not c!118445)) b!1205547))

(assert (= (and b!1205548 res!801715) b!1205549))

(assert (= (or b!1205549 b!1205547) bm!58241))

(assert (=> b!1205546 m!1111775))

(assert (=> b!1205546 m!1111775))

(assert (=> b!1205546 m!1111777))

(assert (=> b!1205548 m!1111775))

(declare-fun m!1111845 () Bool)

(assert (=> b!1205548 m!1111845))

(declare-fun m!1111847 () Bool)

(assert (=> b!1205548 m!1111847))

(assert (=> b!1205548 m!1111775))

(declare-fun m!1111849 () Bool)

(assert (=> b!1205548 m!1111849))

(declare-fun m!1111851 () Bool)

(assert (=> bm!58241 m!1111851))

(assert (=> b!1205171 d!133205))

(declare-fun d!133207 () Bool)

(declare-fun res!801721 () Bool)

(declare-fun e!684699 () Bool)

(assert (=> d!133207 (=> res!801721 e!684699)))

(assert (=> d!133207 (= res!801721 (= (select (arr!37650 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133207 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684699)))

(declare-fun b!1205554 () Bool)

(declare-fun e!684700 () Bool)

(assert (=> b!1205554 (= e!684699 e!684700)))

(declare-fun res!801722 () Bool)

(assert (=> b!1205554 (=> (not res!801722) (not e!684700))))

(assert (=> b!1205554 (= res!801722 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38187 _keys!1208)))))

(declare-fun b!1205555 () Bool)

(assert (=> b!1205555 (= e!684700 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133207 (not res!801721)) b!1205554))

(assert (= (and b!1205554 res!801722) b!1205555))

(assert (=> d!133207 m!1111759))

(declare-fun m!1111853 () Bool)

(assert (=> b!1205555 m!1111853))

(assert (=> b!1205180 d!133207))

(declare-fun d!133209 () Bool)

(assert (=> d!133209 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546548 () Unit!39880)

(declare-fun choose!13 (array!78025 (_ BitVec 64) (_ BitVec 32)) Unit!39880)

(assert (=> d!133209 (= lt!546548 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133209 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133209 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546548)))

(declare-fun bs!34101 () Bool)

(assert (= bs!34101 d!133209))

(assert (=> bs!34101 m!1111479))

(declare-fun m!1111855 () Bool)

(assert (=> bs!34101 m!1111855))

(assert (=> b!1205180 d!133209))

(declare-fun d!133211 () Bool)

(declare-fun e!684703 () Bool)

(assert (=> d!133211 e!684703))

(declare-fun res!801728 () Bool)

(assert (=> d!133211 (=> (not res!801728) (not e!684703))))

(declare-fun lt!546559 () ListLongMap!17683)

(assert (=> d!133211 (= res!801728 (contains!6932 lt!546559 (_1!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!546558 () List!26516)

(assert (=> d!133211 (= lt!546559 (ListLongMap!17684 lt!546558))))

(declare-fun lt!546557 () Unit!39880)

(declare-fun lt!546560 () Unit!39880)

(assert (=> d!133211 (= lt!546557 lt!546560)))

(assert (=> d!133211 (= (getValueByKey!628 lt!546558 (_1!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!678 (_2!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!310 (List!26516 (_ BitVec 64) V!45937) Unit!39880)

(assert (=> d!133211 (= lt!546560 (lemmaContainsTupThenGetReturnValue!310 lt!546558 (_1!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!403 (List!26516 (_ BitVec 64) V!45937) List!26516)

(assert (=> d!133211 (= lt!546558 (insertStrictlySorted!403 (toList!8857 (ite c!118362 lt!546302 lt!546309)) (_1!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133211 (= (+!4023 (ite c!118362 lt!546302 lt!546309) (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!546559)))

(declare-fun b!1205560 () Bool)

(declare-fun res!801727 () Bool)

(assert (=> b!1205560 (=> (not res!801727) (not e!684703))))

(assert (=> b!1205560 (= res!801727 (= (getValueByKey!628 (toList!8857 lt!546559) (_1!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!678 (_2!9864 (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1205561 () Bool)

(declare-fun contains!6936 (List!26516 tuple2!19706) Bool)

(assert (=> b!1205561 (= e!684703 (contains!6936 (toList!8857 lt!546559) (ite c!118362 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118363 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133211 res!801728) b!1205560))

(assert (= (and b!1205560 res!801727) b!1205561))

(declare-fun m!1111857 () Bool)

(assert (=> d!133211 m!1111857))

(declare-fun m!1111859 () Bool)

(assert (=> d!133211 m!1111859))

(declare-fun m!1111861 () Bool)

(assert (=> d!133211 m!1111861))

(declare-fun m!1111863 () Bool)

(assert (=> d!133211 m!1111863))

(declare-fun m!1111865 () Bool)

(assert (=> b!1205560 m!1111865))

(declare-fun m!1111867 () Bool)

(assert (=> b!1205561 m!1111867))

(assert (=> bm!58152 d!133211))

(assert (=> bm!58149 d!133183))

(declare-fun d!133213 () Bool)

(declare-fun lt!546563 () ListLongMap!17683)

(assert (=> d!133213 (not (contains!6932 lt!546563 k0!934))))

(declare-fun removeStrictlySorted!93 (List!26516 (_ BitVec 64)) List!26516)

(assert (=> d!133213 (= lt!546563 (ListLongMap!17684 (removeStrictlySorted!93 (toList!8857 call!58155) k0!934)))))

(assert (=> d!133213 (= (-!1803 call!58155 k0!934) lt!546563)))

(declare-fun bs!34102 () Bool)

(assert (= bs!34102 d!133213))

(declare-fun m!1111869 () Bool)

(assert (=> bs!34102 m!1111869))

(declare-fun m!1111871 () Bool)

(assert (=> bs!34102 m!1111871))

(assert (=> b!1205187 d!133213))

(declare-fun d!133215 () Bool)

(declare-fun e!684704 () Bool)

(assert (=> d!133215 e!684704))

(declare-fun res!801730 () Bool)

(assert (=> d!133215 (=> (not res!801730) (not e!684704))))

(declare-fun lt!546566 () ListLongMap!17683)

(assert (=> d!133215 (= res!801730 (contains!6932 lt!546566 (_1!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!546565 () List!26516)

(assert (=> d!133215 (= lt!546566 (ListLongMap!17684 lt!546565))))

(declare-fun lt!546564 () Unit!39880)

(declare-fun lt!546567 () Unit!39880)

(assert (=> d!133215 (= lt!546564 lt!546567)))

(assert (=> d!133215 (= (getValueByKey!628 lt!546565 (_1!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!678 (_2!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133215 (= lt!546567 (lemmaContainsTupThenGetReturnValue!310 lt!546565 (_1!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133215 (= lt!546565 (insertStrictlySorted!403 (toList!8857 lt!546309) (_1!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133215 (= (+!4023 lt!546309 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!546566)))

(declare-fun b!1205562 () Bool)

(declare-fun res!801729 () Bool)

(assert (=> b!1205562 (=> (not res!801729) (not e!684704))))

(assert (=> b!1205562 (= res!801729 (= (getValueByKey!628 (toList!8857 lt!546566) (_1!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!678 (_2!9864 (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1205563 () Bool)

(assert (=> b!1205563 (= e!684704 (contains!6936 (toList!8857 lt!546566) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133215 res!801730) b!1205562))

(assert (= (and b!1205562 res!801729) b!1205563))

(declare-fun m!1111873 () Bool)

(assert (=> d!133215 m!1111873))

(declare-fun m!1111875 () Bool)

(assert (=> d!133215 m!1111875))

(declare-fun m!1111877 () Bool)

(assert (=> d!133215 m!1111877))

(declare-fun m!1111879 () Bool)

(assert (=> d!133215 m!1111879))

(declare-fun m!1111881 () Bool)

(assert (=> b!1205562 m!1111881))

(declare-fun m!1111883 () Bool)

(assert (=> b!1205563 m!1111883))

(assert (=> b!1205170 d!133215))

(declare-fun d!133217 () Bool)

(assert (=> d!133217 (contains!6932 (+!4023 lt!546302 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546568 () Unit!39880)

(assert (=> d!133217 (= lt!546568 (choose!1795 lt!546302 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133217 (contains!6932 lt!546302 k0!934)))

(assert (=> d!133217 (= (addStillContains!1007 lt!546302 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546568)))

(declare-fun bs!34103 () Bool)

(assert (= bs!34103 d!133217))

(declare-fun m!1111885 () Bool)

(assert (=> bs!34103 m!1111885))

(assert (=> bs!34103 m!1111885))

(declare-fun m!1111887 () Bool)

(assert (=> bs!34103 m!1111887))

(declare-fun m!1111889 () Bool)

(assert (=> bs!34103 m!1111889))

(declare-fun m!1111891 () Bool)

(assert (=> bs!34103 m!1111891))

(assert (=> b!1205170 d!133217))

(declare-fun d!133219 () Bool)

(declare-fun e!684705 () Bool)

(assert (=> d!133219 e!684705))

(declare-fun res!801731 () Bool)

(assert (=> d!133219 (=> res!801731 e!684705)))

(declare-fun lt!546571 () Bool)

(assert (=> d!133219 (= res!801731 (not lt!546571))))

(declare-fun lt!546570 () Bool)

(assert (=> d!133219 (= lt!546571 lt!546570)))

(declare-fun lt!546572 () Unit!39880)

(declare-fun e!684706 () Unit!39880)

(assert (=> d!133219 (= lt!546572 e!684706)))

(declare-fun c!118446 () Bool)

(assert (=> d!133219 (= c!118446 lt!546570)))

(assert (=> d!133219 (= lt!546570 (containsKey!590 (toList!8857 call!58150) k0!934))))

(assert (=> d!133219 (= (contains!6932 call!58150 k0!934) lt!546571)))

(declare-fun b!1205564 () Bool)

(declare-fun lt!546569 () Unit!39880)

(assert (=> b!1205564 (= e!684706 lt!546569)))

(assert (=> b!1205564 (= lt!546569 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8857 call!58150) k0!934))))

(assert (=> b!1205564 (isDefined!456 (getValueByKey!628 (toList!8857 call!58150) k0!934))))

(declare-fun b!1205565 () Bool)

(declare-fun Unit!39893 () Unit!39880)

(assert (=> b!1205565 (= e!684706 Unit!39893)))

(declare-fun b!1205566 () Bool)

(assert (=> b!1205566 (= e!684705 (isDefined!456 (getValueByKey!628 (toList!8857 call!58150) k0!934)))))

(assert (= (and d!133219 c!118446) b!1205564))

(assert (= (and d!133219 (not c!118446)) b!1205565))

(assert (= (and d!133219 (not res!801731)) b!1205566))

(declare-fun m!1111893 () Bool)

(assert (=> d!133219 m!1111893))

(declare-fun m!1111895 () Bool)

(assert (=> b!1205564 m!1111895))

(declare-fun m!1111897 () Bool)

(assert (=> b!1205564 m!1111897))

(assert (=> b!1205564 m!1111897))

(declare-fun m!1111899 () Bool)

(assert (=> b!1205564 m!1111899))

(assert (=> b!1205566 m!1111897))

(assert (=> b!1205566 m!1111897))

(assert (=> b!1205566 m!1111899))

(assert (=> b!1205170 d!133219))

(declare-fun b!1205574 () Bool)

(declare-fun e!684712 () Bool)

(assert (=> b!1205574 (= e!684712 tp_is_empty!30607)))

(declare-fun condMapEmpty!47766 () Bool)

(declare-fun mapDefault!47766 () ValueCell!14594)

(assert (=> mapNonEmpty!47757 (= condMapEmpty!47766 (= mapRest!47757 ((as const (Array (_ BitVec 32) ValueCell!14594)) mapDefault!47766)))))

(declare-fun mapRes!47766 () Bool)

(assert (=> mapNonEmpty!47757 (= tp!90702 (and e!684712 mapRes!47766))))

(declare-fun mapIsEmpty!47766 () Bool)

(assert (=> mapIsEmpty!47766 mapRes!47766))

(declare-fun b!1205573 () Bool)

(declare-fun e!684711 () Bool)

(assert (=> b!1205573 (= e!684711 tp_is_empty!30607)))

(declare-fun mapNonEmpty!47766 () Bool)

(declare-fun tp!90718 () Bool)

(assert (=> mapNonEmpty!47766 (= mapRes!47766 (and tp!90718 e!684711))))

(declare-fun mapRest!47766 () (Array (_ BitVec 32) ValueCell!14594))

(declare-fun mapValue!47766 () ValueCell!14594)

(declare-fun mapKey!47766 () (_ BitVec 32))

(assert (=> mapNonEmpty!47766 (= mapRest!47757 (store mapRest!47766 mapKey!47766 mapValue!47766))))

(assert (= (and mapNonEmpty!47757 condMapEmpty!47766) mapIsEmpty!47766))

(assert (= (and mapNonEmpty!47757 (not condMapEmpty!47766)) mapNonEmpty!47766))

(assert (= (and mapNonEmpty!47766 ((_ is ValueCellFull!14594) mapValue!47766)) b!1205573))

(assert (= (and mapNonEmpty!47757 ((_ is ValueCellFull!14594) mapDefault!47766)) b!1205574))

(declare-fun m!1111901 () Bool)

(assert (=> mapNonEmpty!47766 m!1111901))

(declare-fun b_lambda!21203 () Bool)

(assert (= b_lambda!21187 (or (and start!100878 b_free!25903) b_lambda!21203)))

(declare-fun b_lambda!21205 () Bool)

(assert (= b_lambda!21199 (or (and start!100878 b_free!25903) b_lambda!21205)))

(declare-fun b_lambda!21207 () Bool)

(assert (= b_lambda!21189 (or (and start!100878 b_free!25903) b_lambda!21207)))

(declare-fun b_lambda!21209 () Bool)

(assert (= b_lambda!21193 (or (and start!100878 b_free!25903) b_lambda!21209)))

(declare-fun b_lambda!21211 () Bool)

(assert (= b_lambda!21201 (or (and start!100878 b_free!25903) b_lambda!21211)))

(declare-fun b_lambda!21213 () Bool)

(assert (= b_lambda!21183 (or (and start!100878 b_free!25903) b_lambda!21213)))

(declare-fun b_lambda!21215 () Bool)

(assert (= b_lambda!21185 (or (and start!100878 b_free!25903) b_lambda!21215)))

(declare-fun b_lambda!21217 () Bool)

(assert (= b_lambda!21197 (or (and start!100878 b_free!25903) b_lambda!21217)))

(declare-fun b_lambda!21219 () Bool)

(assert (= b_lambda!21195 (or (and start!100878 b_free!25903) b_lambda!21219)))

(declare-fun b_lambda!21221 () Bool)

(assert (= b_lambda!21191 (or (and start!100878 b_free!25903) b_lambda!21221)))

(check-sat (not bm!58206) (not b!1205455) (not bm!58226) (not d!133209) (not b!1205389) (not b!1205362) (not b!1205515) (not b!1205486) (not bm!58209) (not b!1205465) (not b!1205388) (not bm!58241) (not b!1205408) (not b!1205406) (not b!1205537) (not b!1205459) (not d!133213) (not b!1205519) (not b!1205485) (not b_lambda!21203) (not b!1205511) (not b!1205470) (not b!1205495) tp_is_empty!30607 (not d!133217) (not b!1205566) (not b!1205561) (not b!1205393) (not d!133179) (not b!1205536) (not b_lambda!21213) (not bm!58227) (not b!1205517) (not b_lambda!21181) (not bm!58239) (not b!1205532) (not b!1205520) (not b!1205529) (not b!1205543) (not b!1205478) (not b!1205545) (not b!1205522) (not b!1205541) (not d!133171) (not b!1205562) (not b_lambda!21219) (not b_lambda!21221) (not b_lambda!21215) (not b!1205475) (not b!1205542) (not bm!58234) (not d!133181) (not b_lambda!21207) (not d!133177) (not bm!58240) (not b_lambda!21217) (not b!1205548) (not bm!58230) (not d!133211) (not b!1205469) (not b!1205531) (not bm!58228) (not bm!58205) (not b!1205468) (not b!1205555) (not b!1205472) (not mapNonEmpty!47766) (not b!1205528) (not d!133193) (not bm!58238) (not b!1205524) (not d!133173) (not b!1205560) (not b_lambda!21211) (not b!1205484) (not bm!58231) (not b_lambda!21205) (not b_next!25903) (not d!133199) (not b!1205534) (not b!1205394) (not b!1205474) (not b!1205564) (not b_lambda!21209) (not b!1205563) (not b!1205546) (not d!133219) (not d!133183) (not b!1205398) (not b!1205510) (not b!1205480) (not bm!58237) (not d!133175) b_and!42765 (not b!1205481) (not b!1205512) (not b!1205391) (not b!1205463) (not b!1205530) (not b!1205399) (not b!1205525) (not b!1205397) (not d!133191) (not b!1205497) (not b!1205516) (not b!1205452) (not d!133215) (not b!1205540) (not b!1205476))
(check-sat b_and!42765 (not b_next!25903))
