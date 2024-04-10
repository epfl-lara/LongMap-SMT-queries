; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100716 () Bool)

(assert start!100716)

(declare-fun b_free!25917 () Bool)

(declare-fun b_next!25917 () Bool)

(assert (=> start!100716 (= b_free!25917 (not b_next!25917))))

(declare-fun tp!90751 () Bool)

(declare-fun b_and!42799 () Bool)

(assert (=> start!100716 (= tp!90751 b_and!42799)))

(declare-fun b!1204842 () Bool)

(declare-fun e!684217 () Bool)

(declare-fun e!684209 () Bool)

(assert (=> b!1204842 (= e!684217 e!684209)))

(declare-fun res!801501 () Bool)

(assert (=> b!1204842 (=> (not res!801501) (not e!684209))))

(declare-datatypes ((array!78021 0))(
  ( (array!78022 (arr!37652 (Array (_ BitVec 32) (_ BitVec 64))) (size!38188 (_ BitVec 32))) )
))
(declare-fun lt!546421 () array!78021)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78021 (_ BitVec 32)) Bool)

(assert (=> b!1204842 (= res!801501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546421 mask!1564))))

(declare-fun _keys!1208 () array!78021)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204842 (= lt!546421 (array!78022 (store (arr!37652 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38188 _keys!1208)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1204843 () Bool)

(declare-fun lt!546423 () Bool)

(declare-fun e!684210 () Bool)

(assert (=> b!1204843 (= e!684210 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546423) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1204844 () Bool)

(declare-fun e!684212 () Bool)

(declare-fun e!684204 () Bool)

(declare-fun mapRes!47784 () Bool)

(assert (=> b!1204844 (= e!684212 (and e!684204 mapRes!47784))))

(declare-fun condMapEmpty!47784 () Bool)

(declare-datatypes ((V!45955 0))(
  ( (V!45956 (val!15367 Int)) )
))
(declare-datatypes ((ValueCell!14601 0))(
  ( (ValueCellFull!14601 (v!18010 V!45955)) (EmptyCell!14601) )
))
(declare-datatypes ((array!78023 0))(
  ( (array!78024 (arr!37653 (Array (_ BitVec 32) ValueCell!14601)) (size!38189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78023)

(declare-fun mapDefault!47784 () ValueCell!14601)

(assert (=> b!1204844 (= condMapEmpty!47784 (= (arr!37653 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14601)) mapDefault!47784)))))

(declare-fun b!1204845 () Bool)

(declare-fun e!684214 () Bool)

(assert (=> b!1204845 (= e!684209 (not e!684214))))

(declare-fun res!801503 () Bool)

(assert (=> b!1204845 (=> res!801503 e!684214)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1204845 (= res!801503 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204845 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39947 0))(
  ( (Unit!39948) )
))
(declare-fun lt!546410 () Unit!39947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78021 (_ BitVec 64) (_ BitVec 32)) Unit!39947)

(assert (=> b!1204845 (= lt!546410 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47784 () Bool)

(declare-fun tp!90750 () Bool)

(declare-fun e!684207 () Bool)

(assert (=> mapNonEmpty!47784 (= mapRes!47784 (and tp!90750 e!684207))))

(declare-fun mapValue!47784 () ValueCell!14601)

(declare-fun mapKey!47784 () (_ BitVec 32))

(declare-fun mapRest!47784 () (Array (_ BitVec 32) ValueCell!14601))

(assert (=> mapNonEmpty!47784 (= (arr!37653 _values!996) (store mapRest!47784 mapKey!47784 mapValue!47784))))

(declare-fun call!58312 () Bool)

(declare-fun c!118165 () Bool)

(declare-fun bm!58309 () Bool)

(declare-datatypes ((tuple2!19706 0))(
  ( (tuple2!19707 (_1!9864 (_ BitVec 64)) (_2!9864 V!45955)) )
))
(declare-datatypes ((List!26514 0))(
  ( (Nil!26511) (Cons!26510 (h!27719 tuple2!19706) (t!39411 List!26514)) )
))
(declare-datatypes ((ListLongMap!17675 0))(
  ( (ListLongMap!17676 (toList!8853 List!26514)) )
))
(declare-fun call!58319 () ListLongMap!17675)

(declare-fun lt!546417 () ListLongMap!17675)

(declare-fun contains!6912 (ListLongMap!17675 (_ BitVec 64)) Bool)

(assert (=> bm!58309 (= call!58312 (contains!6912 (ite c!118165 lt!546417 call!58319) k0!934))))

(declare-fun b!1204846 () Bool)

(declare-fun e!684213 () Bool)

(declare-fun e!684218 () Bool)

(assert (=> b!1204846 (= e!684213 e!684218)))

(declare-fun res!801499 () Bool)

(assert (=> b!1204846 (=> res!801499 e!684218)))

(assert (=> b!1204846 (= res!801499 (not (= (select (arr!37652 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684219 () Bool)

(assert (=> b!1204846 e!684219))

(declare-fun c!118162 () Bool)

(assert (=> b!1204846 (= c!118162 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45955)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!546419 () Unit!39947)

(declare-fun minValue!944 () V!45955)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 (array!78021 array!78023 (_ BitVec 32) (_ BitVec 32) V!45955 V!45955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39947)

(assert (=> b!1204846 (= lt!546419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!684208 () Bool)

(declare-fun b!1204847 () Bool)

(assert (=> b!1204847 (= e!684208 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204848 () Bool)

(declare-fun res!801495 () Bool)

(assert (=> b!1204848 (=> (not res!801495) (not e!684217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204848 (= res!801495 (validMask!0 mask!1564))))

(declare-fun b!1204849 () Bool)

(declare-fun res!801507 () Bool)

(assert (=> b!1204849 (=> (not res!801507) (not e!684217))))

(assert (=> b!1204849 (= res!801507 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38188 _keys!1208))))))

(declare-fun b!1204850 () Bool)

(assert (=> b!1204850 (= e!684210 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1204851 () Bool)

(declare-fun e!684216 () Unit!39947)

(declare-fun lt!546420 () Unit!39947)

(assert (=> b!1204851 (= e!684216 lt!546420)))

(declare-fun lt!546415 () Unit!39947)

(declare-fun call!58313 () Unit!39947)

(assert (=> b!1204851 (= lt!546415 call!58313)))

(declare-fun call!58315 () ListLongMap!17675)

(assert (=> b!1204851 (= lt!546417 call!58315)))

(assert (=> b!1204851 call!58312))

(declare-fun addStillContains!1007 (ListLongMap!17675 (_ BitVec 64) V!45955 (_ BitVec 64)) Unit!39947)

(assert (=> b!1204851 (= lt!546420 (addStillContains!1007 lt!546417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3979 (ListLongMap!17675 tuple2!19706) ListLongMap!17675)

(assert (=> b!1204851 (contains!6912 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1204852 () Bool)

(declare-fun tp_is_empty!30621 () Bool)

(assert (=> b!1204852 (= e!684207 tp_is_empty!30621)))

(declare-fun b!1204853 () Bool)

(declare-fun e!684215 () Bool)

(assert (=> b!1204853 (= e!684218 e!684215)))

(declare-fun res!801496 () Bool)

(assert (=> b!1204853 (=> res!801496 e!684215)))

(declare-fun lt!546409 () ListLongMap!17675)

(assert (=> b!1204853 (= res!801496 (not (contains!6912 lt!546409 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5289 (array!78021 array!78023 (_ BitVec 32) (_ BitVec 32) V!45955 V!45955 (_ BitVec 32) Int) ListLongMap!17675)

(assert (=> b!1204853 (= lt!546409 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546416 () array!78023)

(declare-fun call!58314 () ListLongMap!17675)

(declare-fun bm!58310 () Bool)

(assert (=> bm!58310 (= call!58314 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204854 () Bool)

(assert (=> b!1204854 (= e!684204 tp_is_empty!30621)))

(declare-fun call!58316 () ListLongMap!17675)

(declare-fun b!1204855 () Bool)

(declare-fun -!1818 (ListLongMap!17675 (_ BitVec 64)) ListLongMap!17675)

(assert (=> b!1204855 (= e!684219 (= call!58314 (-!1818 call!58316 k0!934)))))

(declare-fun b!1204856 () Bool)

(declare-fun call!58317 () Bool)

(assert (=> b!1204856 call!58317))

(declare-fun lt!546413 () Unit!39947)

(declare-fun call!58318 () Unit!39947)

(assert (=> b!1204856 (= lt!546413 call!58318)))

(declare-fun e!684206 () Unit!39947)

(assert (=> b!1204856 (= e!684206 lt!546413)))

(declare-fun c!118166 () Bool)

(declare-fun bm!58311 () Bool)

(assert (=> bm!58311 (= call!58313 (addStillContains!1007 lt!546409 (ite (or c!118165 c!118166) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118165 c!118166) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1204857 () Bool)

(declare-fun res!801497 () Bool)

(assert (=> b!1204857 (=> (not res!801497) (not e!684217))))

(assert (=> b!1204857 (= res!801497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1204858 () Bool)

(declare-fun e!684205 () Unit!39947)

(declare-fun lt!546412 () Unit!39947)

(assert (=> b!1204858 (= e!684205 lt!546412)))

(assert (=> b!1204858 (= lt!546412 call!58318)))

(assert (=> b!1204858 call!58317))

(declare-fun b!1204859 () Bool)

(declare-fun res!801506 () Bool)

(assert (=> b!1204859 (=> (not res!801506) (not e!684217))))

(assert (=> b!1204859 (= res!801506 (= (select (arr!37652 _keys!1208) i!673) k0!934))))

(declare-fun b!1204860 () Bool)

(assert (=> b!1204860 (= e!684216 e!684206)))

(assert (=> b!1204860 (= c!118166 (and (not lt!546423) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58312 () Bool)

(assert (=> bm!58312 (= call!58317 call!58312)))

(declare-fun b!1204861 () Bool)

(declare-fun res!801500 () Bool)

(assert (=> b!1204861 (=> (not res!801500) (not e!684209))))

(declare-datatypes ((List!26515 0))(
  ( (Nil!26512) (Cons!26511 (h!27720 (_ BitVec 64)) (t!39412 List!26515)) )
))
(declare-fun arrayNoDuplicates!0 (array!78021 (_ BitVec 32) List!26515) Bool)

(assert (=> b!1204861 (= res!801500 (arrayNoDuplicates!0 lt!546421 #b00000000000000000000000000000000 Nil!26512))))

(declare-fun b!1204862 () Bool)

(declare-fun c!118163 () Bool)

(assert (=> b!1204862 (= c!118163 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546423))))

(assert (=> b!1204862 (= e!684206 e!684205)))

(declare-fun mapIsEmpty!47784 () Bool)

(assert (=> mapIsEmpty!47784 mapRes!47784))

(declare-fun bm!58313 () Bool)

(assert (=> bm!58313 (= call!58318 call!58313)))

(declare-fun b!1204863 () Bool)

(declare-fun Unit!39949 () Unit!39947)

(assert (=> b!1204863 (= e!684205 Unit!39949)))

(declare-fun bm!58314 () Bool)

(assert (=> bm!58314 (= call!58319 call!58315)))

(declare-fun bm!58315 () Bool)

(assert (=> bm!58315 (= call!58316 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204864 () Bool)

(assert (=> b!1204864 (= e!684219 (= call!58314 call!58316))))

(declare-fun b!1204865 () Bool)

(assert (=> b!1204865 (= e!684214 e!684213)))

(declare-fun res!801505 () Bool)

(assert (=> b!1204865 (=> res!801505 e!684213)))

(assert (=> b!1204865 (= res!801505 (not (= from!1455 i!673)))))

(declare-fun lt!546422 () ListLongMap!17675)

(assert (=> b!1204865 (= lt!546422 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3199 (Int (_ BitVec 64)) V!45955)

(assert (=> b!1204865 (= lt!546416 (array!78024 (store (arr!37653 _values!996) i!673 (ValueCellFull!14601 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38189 _values!996)))))

(declare-fun lt!546411 () ListLongMap!17675)

(assert (=> b!1204865 (= lt!546411 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1204866 () Bool)

(assert (=> b!1204866 (= e!684215 (bvslt (size!38188 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1204866 e!684208))

(declare-fun res!801504 () Bool)

(assert (=> b!1204866 (=> (not res!801504) (not e!684208))))

(assert (=> b!1204866 (= res!801504 e!684210)))

(declare-fun c!118164 () Bool)

(assert (=> b!1204866 (= c!118164 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546418 () Unit!39947)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!563 (array!78021 array!78023 (_ BitVec 32) (_ BitVec 32) V!45955 V!45955 (_ BitVec 64) (_ BitVec 32) Int) Unit!39947)

(assert (=> b!1204866 (= lt!546418 (lemmaListMapContainsThenArrayContainsFrom!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546414 () Unit!39947)

(assert (=> b!1204866 (= lt!546414 e!684216)))

(assert (=> b!1204866 (= c!118165 (and (not lt!546423) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204866 (= lt!546423 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58316 () Bool)

(assert (=> bm!58316 (= call!58315 (+!3979 lt!546409 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204867 () Bool)

(declare-fun res!801498 () Bool)

(assert (=> b!1204867 (=> (not res!801498) (not e!684217))))

(assert (=> b!1204867 (= res!801498 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26512))))

(declare-fun b!1204869 () Bool)

(declare-fun res!801509 () Bool)

(assert (=> b!1204869 (=> (not res!801509) (not e!684217))))

(assert (=> b!1204869 (= res!801509 (and (= (size!38189 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38188 _keys!1208) (size!38189 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!801502 () Bool)

(assert (=> start!100716 (=> (not res!801502) (not e!684217))))

(assert (=> start!100716 (= res!801502 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38188 _keys!1208))))))

(assert (=> start!100716 e!684217))

(assert (=> start!100716 tp_is_empty!30621))

(declare-fun array_inv!28686 (array!78021) Bool)

(assert (=> start!100716 (array_inv!28686 _keys!1208)))

(assert (=> start!100716 true))

(assert (=> start!100716 tp!90751))

(declare-fun array_inv!28687 (array!78023) Bool)

(assert (=> start!100716 (and (array_inv!28687 _values!996) e!684212)))

(declare-fun b!1204868 () Bool)

(declare-fun res!801508 () Bool)

(assert (=> b!1204868 (=> (not res!801508) (not e!684217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204868 (= res!801508 (validKeyInArray!0 k0!934))))

(assert (= (and start!100716 res!801502) b!1204848))

(assert (= (and b!1204848 res!801495) b!1204869))

(assert (= (and b!1204869 res!801509) b!1204857))

(assert (= (and b!1204857 res!801497) b!1204867))

(assert (= (and b!1204867 res!801498) b!1204849))

(assert (= (and b!1204849 res!801507) b!1204868))

(assert (= (and b!1204868 res!801508) b!1204859))

(assert (= (and b!1204859 res!801506) b!1204842))

(assert (= (and b!1204842 res!801501) b!1204861))

(assert (= (and b!1204861 res!801500) b!1204845))

(assert (= (and b!1204845 (not res!801503)) b!1204865))

(assert (= (and b!1204865 (not res!801505)) b!1204846))

(assert (= (and b!1204846 c!118162) b!1204855))

(assert (= (and b!1204846 (not c!118162)) b!1204864))

(assert (= (or b!1204855 b!1204864) bm!58310))

(assert (= (or b!1204855 b!1204864) bm!58315))

(assert (= (and b!1204846 (not res!801499)) b!1204853))

(assert (= (and b!1204853 (not res!801496)) b!1204866))

(assert (= (and b!1204866 c!118165) b!1204851))

(assert (= (and b!1204866 (not c!118165)) b!1204860))

(assert (= (and b!1204860 c!118166) b!1204856))

(assert (= (and b!1204860 (not c!118166)) b!1204862))

(assert (= (and b!1204862 c!118163) b!1204858))

(assert (= (and b!1204862 (not c!118163)) b!1204863))

(assert (= (or b!1204856 b!1204858) bm!58313))

(assert (= (or b!1204856 b!1204858) bm!58314))

(assert (= (or b!1204856 b!1204858) bm!58312))

(assert (= (or b!1204851 bm!58312) bm!58309))

(assert (= (or b!1204851 bm!58313) bm!58311))

(assert (= (or b!1204851 bm!58314) bm!58316))

(assert (= (and b!1204866 c!118164) b!1204850))

(assert (= (and b!1204866 (not c!118164)) b!1204843))

(assert (= (and b!1204866 res!801504) b!1204847))

(assert (= (and b!1204844 condMapEmpty!47784) mapIsEmpty!47784))

(assert (= (and b!1204844 (not condMapEmpty!47784)) mapNonEmpty!47784))

(get-info :version)

(assert (= (and mapNonEmpty!47784 ((_ is ValueCellFull!14601) mapValue!47784)) b!1204852))

(assert (= (and b!1204844 ((_ is ValueCellFull!14601) mapDefault!47784)) b!1204854))

(assert (= start!100716 b!1204844))

(declare-fun b_lambda!21275 () Bool)

(assert (=> (not b_lambda!21275) (not b!1204865)))

(declare-fun t!39410 () Bool)

(declare-fun tb!10717 () Bool)

(assert (=> (and start!100716 (= defaultEntry!1004 defaultEntry!1004) t!39410) tb!10717))

(declare-fun result!22017 () Bool)

(assert (=> tb!10717 (= result!22017 tp_is_empty!30621)))

(assert (=> b!1204865 t!39410))

(declare-fun b_and!42801 () Bool)

(assert (= b_and!42799 (and (=> t!39410 result!22017) b_and!42801)))

(declare-fun m!1110813 () Bool)

(assert (=> b!1204847 m!1110813))

(declare-fun m!1110815 () Bool)

(assert (=> b!1204866 m!1110815))

(declare-fun m!1110817 () Bool)

(assert (=> b!1204865 m!1110817))

(declare-fun m!1110819 () Bool)

(assert (=> b!1204865 m!1110819))

(declare-fun m!1110821 () Bool)

(assert (=> b!1204865 m!1110821))

(declare-fun m!1110823 () Bool)

(assert (=> b!1204865 m!1110823))

(declare-fun m!1110825 () Bool)

(assert (=> b!1204848 m!1110825))

(declare-fun m!1110827 () Bool)

(assert (=> b!1204867 m!1110827))

(declare-fun m!1110829 () Bool)

(assert (=> start!100716 m!1110829))

(declare-fun m!1110831 () Bool)

(assert (=> start!100716 m!1110831))

(declare-fun m!1110833 () Bool)

(assert (=> b!1204855 m!1110833))

(declare-fun m!1110835 () Bool)

(assert (=> b!1204842 m!1110835))

(declare-fun m!1110837 () Bool)

(assert (=> b!1204842 m!1110837))

(declare-fun m!1110839 () Bool)

(assert (=> bm!58311 m!1110839))

(assert (=> b!1204850 m!1110813))

(declare-fun m!1110841 () Bool)

(assert (=> bm!58309 m!1110841))

(declare-fun m!1110843 () Bool)

(assert (=> b!1204859 m!1110843))

(declare-fun m!1110845 () Bool)

(assert (=> b!1204868 m!1110845))

(declare-fun m!1110847 () Bool)

(assert (=> bm!58310 m!1110847))

(declare-fun m!1110849 () Bool)

(assert (=> b!1204857 m!1110849))

(declare-fun m!1110851 () Bool)

(assert (=> b!1204853 m!1110851))

(declare-fun m!1110853 () Bool)

(assert (=> b!1204853 m!1110853))

(declare-fun m!1110855 () Bool)

(assert (=> mapNonEmpty!47784 m!1110855))

(declare-fun m!1110857 () Bool)

(assert (=> b!1204845 m!1110857))

(declare-fun m!1110859 () Bool)

(assert (=> b!1204845 m!1110859))

(assert (=> bm!58315 m!1110853))

(declare-fun m!1110861 () Bool)

(assert (=> bm!58316 m!1110861))

(declare-fun m!1110863 () Bool)

(assert (=> b!1204851 m!1110863))

(declare-fun m!1110865 () Bool)

(assert (=> b!1204851 m!1110865))

(assert (=> b!1204851 m!1110865))

(declare-fun m!1110867 () Bool)

(assert (=> b!1204851 m!1110867))

(declare-fun m!1110869 () Bool)

(assert (=> b!1204846 m!1110869))

(declare-fun m!1110871 () Bool)

(assert (=> b!1204846 m!1110871))

(declare-fun m!1110873 () Bool)

(assert (=> b!1204861 m!1110873))

(check-sat (not bm!58316) (not b!1204868) (not b!1204861) (not b!1204847) (not b!1204867) tp_is_empty!30621 (not b!1204851) (not b!1204853) (not bm!58315) (not bm!58309) (not b!1204855) (not b!1204846) (not b_next!25917) (not b!1204865) (not mapNonEmpty!47784) (not b_lambda!21275) (not bm!58310) (not b!1204842) (not bm!58311) (not start!100716) (not b!1204866) (not b!1204857) (not b!1204848) (not b!1204850) b_and!42801 (not b!1204845))
(check-sat b_and!42801 (not b_next!25917))
(get-model)

(declare-fun b_lambda!21279 () Bool)

(assert (= b_lambda!21275 (or (and start!100716 b_free!25917) b_lambda!21279)))

(check-sat (not bm!58316) (not b!1204868) (not b!1204861) (not b!1204847) (not b!1204867) tp_is_empty!30621 (not b!1204851) (not b!1204853) (not bm!58315) (not bm!58309) (not b!1204846) (not b_next!25917) (not b!1204865) (not mapNonEmpty!47784) (not bm!58310) (not b!1204842) (not bm!58311) (not start!100716) (not b!1204866) (not b!1204857) (not b!1204848) (not b!1204850) (not b_lambda!21279) (not b!1204855) b_and!42801 (not b!1204845))
(check-sat b_and!42801 (not b_next!25917))
(get-model)

(declare-fun d!132835 () Bool)

(declare-fun e!684272 () Bool)

(assert (=> d!132835 e!684272))

(declare-fun res!801557 () Bool)

(assert (=> d!132835 (=> res!801557 e!684272)))

(declare-fun lt!546478 () Bool)

(assert (=> d!132835 (= res!801557 (not lt!546478))))

(declare-fun lt!546480 () Bool)

(assert (=> d!132835 (= lt!546478 lt!546480)))

(declare-fun lt!546477 () Unit!39947)

(declare-fun e!684273 () Unit!39947)

(assert (=> d!132835 (= lt!546477 e!684273)))

(declare-fun c!118184 () Bool)

(assert (=> d!132835 (= c!118184 lt!546480)))

(declare-fun containsKey!590 (List!26514 (_ BitVec 64)) Bool)

(assert (=> d!132835 (= lt!546480 (containsKey!590 (toList!8853 (ite c!118165 lt!546417 call!58319)) k0!934))))

(assert (=> d!132835 (= (contains!6912 (ite c!118165 lt!546417 call!58319) k0!934) lt!546478)))

(declare-fun b!1204964 () Bool)

(declare-fun lt!546479 () Unit!39947)

(assert (=> b!1204964 (= e!684273 lt!546479)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!420 (List!26514 (_ BitVec 64)) Unit!39947)

(assert (=> b!1204964 (= lt!546479 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8853 (ite c!118165 lt!546417 call!58319)) k0!934))))

(declare-datatypes ((Option!685 0))(
  ( (Some!684 (v!18012 V!45955)) (None!683) )
))
(declare-fun isDefined!459 (Option!685) Bool)

(declare-fun getValueByKey!634 (List!26514 (_ BitVec 64)) Option!685)

(assert (=> b!1204964 (isDefined!459 (getValueByKey!634 (toList!8853 (ite c!118165 lt!546417 call!58319)) k0!934))))

(declare-fun b!1204965 () Bool)

(declare-fun Unit!39952 () Unit!39947)

(assert (=> b!1204965 (= e!684273 Unit!39952)))

(declare-fun b!1204966 () Bool)

(assert (=> b!1204966 (= e!684272 (isDefined!459 (getValueByKey!634 (toList!8853 (ite c!118165 lt!546417 call!58319)) k0!934)))))

(assert (= (and d!132835 c!118184) b!1204964))

(assert (= (and d!132835 (not c!118184)) b!1204965))

(assert (= (and d!132835 (not res!801557)) b!1204966))

(declare-fun m!1110937 () Bool)

(assert (=> d!132835 m!1110937))

(declare-fun m!1110939 () Bool)

(assert (=> b!1204964 m!1110939))

(declare-fun m!1110941 () Bool)

(assert (=> b!1204964 m!1110941))

(assert (=> b!1204964 m!1110941))

(declare-fun m!1110943 () Bool)

(assert (=> b!1204964 m!1110943))

(assert (=> b!1204966 m!1110941))

(assert (=> b!1204966 m!1110941))

(assert (=> b!1204966 m!1110943))

(assert (=> bm!58309 d!132835))

(declare-fun d!132837 () Bool)

(declare-fun lt!546483 () ListLongMap!17675)

(assert (=> d!132837 (not (contains!6912 lt!546483 k0!934))))

(declare-fun removeStrictlySorted!96 (List!26514 (_ BitVec 64)) List!26514)

(assert (=> d!132837 (= lt!546483 (ListLongMap!17676 (removeStrictlySorted!96 (toList!8853 call!58316) k0!934)))))

(assert (=> d!132837 (= (-!1818 call!58316 k0!934) lt!546483)))

(declare-fun bs!34096 () Bool)

(assert (= bs!34096 d!132837))

(declare-fun m!1110945 () Bool)

(assert (=> bs!34096 m!1110945))

(declare-fun m!1110947 () Bool)

(assert (=> bs!34096 m!1110947))

(assert (=> b!1204855 d!132837))

(declare-fun b!1204991 () Bool)

(declare-fun e!684288 () Bool)

(declare-fun lt!546501 () ListLongMap!17675)

(declare-fun isEmpty!985 (ListLongMap!17675) Bool)

(assert (=> b!1204991 (= e!684288 (isEmpty!985 lt!546501))))

(declare-fun b!1204992 () Bool)

(assert (=> b!1204992 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 lt!546421)))))

(assert (=> b!1204992 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38189 lt!546416)))))

(declare-fun e!684292 () Bool)

(declare-fun apply!963 (ListLongMap!17675 (_ BitVec 64)) V!45955)

(declare-fun get!19192 (ValueCell!14601 V!45955) V!45955)

(assert (=> b!1204992 (= e!684292 (= (apply!963 lt!546501 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19192 (select (arr!37653 lt!546416) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204993 () Bool)

(declare-fun e!684289 () ListLongMap!17675)

(declare-fun call!58346 () ListLongMap!17675)

(assert (=> b!1204993 (= e!684289 call!58346)))

(declare-fun b!1204994 () Bool)

(assert (=> b!1204994 (= e!684288 (= lt!546501 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204995 () Bool)

(declare-fun e!684291 () ListLongMap!17675)

(assert (=> b!1204995 (= e!684291 e!684289)))

(declare-fun c!118196 () Bool)

(assert (=> b!1204995 (= c!118196 (validKeyInArray!0 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204997 () Bool)

(declare-fun e!684294 () Bool)

(declare-fun e!684290 () Bool)

(assert (=> b!1204997 (= e!684294 e!684290)))

(declare-fun c!118193 () Bool)

(declare-fun e!684293 () Bool)

(assert (=> b!1204997 (= c!118193 e!684293)))

(declare-fun res!801569 () Bool)

(assert (=> b!1204997 (=> (not res!801569) (not e!684293))))

(assert (=> b!1204997 (= res!801569 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 lt!546421)))))

(declare-fun bm!58343 () Bool)

(assert (=> bm!58343 (= call!58346 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204998 () Bool)

(declare-fun lt!546500 () Unit!39947)

(declare-fun lt!546498 () Unit!39947)

(assert (=> b!1204998 (= lt!546500 lt!546498)))

(declare-fun lt!546504 () (_ BitVec 64))

(declare-fun lt!546502 () ListLongMap!17675)

(declare-fun lt!546499 () (_ BitVec 64))

(declare-fun lt!546503 () V!45955)

(assert (=> b!1204998 (not (contains!6912 (+!3979 lt!546502 (tuple2!19707 lt!546504 lt!546503)) lt!546499))))

(declare-fun addStillNotContains!291 (ListLongMap!17675 (_ BitVec 64) V!45955 (_ BitVec 64)) Unit!39947)

(assert (=> b!1204998 (= lt!546498 (addStillNotContains!291 lt!546502 lt!546504 lt!546503 lt!546499))))

(assert (=> b!1204998 (= lt!546499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204998 (= lt!546503 (get!19192 (select (arr!37653 lt!546416) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204998 (= lt!546504 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204998 (= lt!546502 call!58346)))

(assert (=> b!1204998 (= e!684289 (+!3979 call!58346 (tuple2!19707 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19192 (select (arr!37653 lt!546416) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204999 () Bool)

(assert (=> b!1204999 (= e!684293 (validKeyInArray!0 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204999 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1205000 () Bool)

(assert (=> b!1205000 (= e!684290 e!684288)))

(declare-fun c!118195 () Bool)

(assert (=> b!1205000 (= c!118195 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 lt!546421)))))

(declare-fun d!132839 () Bool)

(assert (=> d!132839 e!684294))

(declare-fun res!801566 () Bool)

(assert (=> d!132839 (=> (not res!801566) (not e!684294))))

(assert (=> d!132839 (= res!801566 (not (contains!6912 lt!546501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132839 (= lt!546501 e!684291)))

(declare-fun c!118194 () Bool)

(assert (=> d!132839 (= c!118194 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 lt!546421)))))

(assert (=> d!132839 (validMask!0 mask!1564)))

(assert (=> d!132839 (= (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546501)))

(declare-fun b!1204996 () Bool)

(declare-fun res!801567 () Bool)

(assert (=> b!1204996 (=> (not res!801567) (not e!684294))))

(assert (=> b!1204996 (= res!801567 (not (contains!6912 lt!546501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205001 () Bool)

(assert (=> b!1205001 (= e!684290 e!684292)))

(assert (=> b!1205001 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 lt!546421)))))

(declare-fun res!801568 () Bool)

(assert (=> b!1205001 (= res!801568 (contains!6912 lt!546501 (select (arr!37652 lt!546421) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205001 (=> (not res!801568) (not e!684292))))

(declare-fun b!1205002 () Bool)

(assert (=> b!1205002 (= e!684291 (ListLongMap!17676 Nil!26511))))

(assert (= (and d!132839 c!118194) b!1205002))

(assert (= (and d!132839 (not c!118194)) b!1204995))

(assert (= (and b!1204995 c!118196) b!1204998))

(assert (= (and b!1204995 (not c!118196)) b!1204993))

(assert (= (or b!1204998 b!1204993) bm!58343))

(assert (= (and d!132839 res!801566) b!1204996))

(assert (= (and b!1204996 res!801567) b!1204997))

(assert (= (and b!1204997 res!801569) b!1204999))

(assert (= (and b!1204997 c!118193) b!1205001))

(assert (= (and b!1204997 (not c!118193)) b!1205000))

(assert (= (and b!1205001 res!801568) b!1204992))

(assert (= (and b!1205000 c!118195) b!1204994))

(assert (= (and b!1205000 (not c!118195)) b!1204991))

(declare-fun b_lambda!21281 () Bool)

(assert (=> (not b_lambda!21281) (not b!1204992)))

(assert (=> b!1204992 t!39410))

(declare-fun b_and!42807 () Bool)

(assert (= b_and!42801 (and (=> t!39410 result!22017) b_and!42807)))

(declare-fun b_lambda!21283 () Bool)

(assert (=> (not b_lambda!21283) (not b!1204998)))

(assert (=> b!1204998 t!39410))

(declare-fun b_and!42809 () Bool)

(assert (= b_and!42807 (and (=> t!39410 result!22017) b_and!42809)))

(declare-fun m!1110949 () Bool)

(assert (=> b!1204999 m!1110949))

(assert (=> b!1204999 m!1110949))

(declare-fun m!1110951 () Bool)

(assert (=> b!1204999 m!1110951))

(declare-fun m!1110953 () Bool)

(assert (=> b!1204994 m!1110953))

(assert (=> bm!58343 m!1110953))

(declare-fun m!1110955 () Bool)

(assert (=> b!1204991 m!1110955))

(assert (=> b!1204995 m!1110949))

(assert (=> b!1204995 m!1110949))

(assert (=> b!1204995 m!1110951))

(declare-fun m!1110957 () Bool)

(assert (=> b!1204996 m!1110957))

(assert (=> b!1204998 m!1110949))

(declare-fun m!1110959 () Bool)

(assert (=> b!1204998 m!1110959))

(declare-fun m!1110961 () Bool)

(assert (=> b!1204998 m!1110961))

(assert (=> b!1204998 m!1110961))

(declare-fun m!1110963 () Bool)

(assert (=> b!1204998 m!1110963))

(declare-fun m!1110965 () Bool)

(assert (=> b!1204998 m!1110965))

(assert (=> b!1204998 m!1110819))

(declare-fun m!1110967 () Bool)

(assert (=> b!1204998 m!1110967))

(assert (=> b!1204998 m!1110965))

(declare-fun m!1110969 () Bool)

(assert (=> b!1204998 m!1110969))

(assert (=> b!1204998 m!1110819))

(assert (=> b!1204992 m!1110965))

(assert (=> b!1204992 m!1110819))

(assert (=> b!1204992 m!1110967))

(assert (=> b!1204992 m!1110949))

(assert (=> b!1204992 m!1110949))

(declare-fun m!1110971 () Bool)

(assert (=> b!1204992 m!1110971))

(assert (=> b!1204992 m!1110965))

(assert (=> b!1204992 m!1110819))

(declare-fun m!1110973 () Bool)

(assert (=> d!132839 m!1110973))

(assert (=> d!132839 m!1110825))

(assert (=> b!1205001 m!1110949))

(assert (=> b!1205001 m!1110949))

(declare-fun m!1110975 () Bool)

(assert (=> b!1205001 m!1110975))

(assert (=> bm!58310 d!132839))

(declare-fun d!132841 () Bool)

(assert (=> d!132841 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204868 d!132841))

(declare-fun d!132843 () Bool)

(declare-fun e!684295 () Bool)

(assert (=> d!132843 e!684295))

(declare-fun res!801570 () Bool)

(assert (=> d!132843 (=> res!801570 e!684295)))

(declare-fun lt!546506 () Bool)

(assert (=> d!132843 (= res!801570 (not lt!546506))))

(declare-fun lt!546508 () Bool)

(assert (=> d!132843 (= lt!546506 lt!546508)))

(declare-fun lt!546505 () Unit!39947)

(declare-fun e!684296 () Unit!39947)

(assert (=> d!132843 (= lt!546505 e!684296)))

(declare-fun c!118197 () Bool)

(assert (=> d!132843 (= c!118197 lt!546508)))

(assert (=> d!132843 (= lt!546508 (containsKey!590 (toList!8853 lt!546409) k0!934))))

(assert (=> d!132843 (= (contains!6912 lt!546409 k0!934) lt!546506)))

(declare-fun b!1205003 () Bool)

(declare-fun lt!546507 () Unit!39947)

(assert (=> b!1205003 (= e!684296 lt!546507)))

(assert (=> b!1205003 (= lt!546507 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8853 lt!546409) k0!934))))

(assert (=> b!1205003 (isDefined!459 (getValueByKey!634 (toList!8853 lt!546409) k0!934))))

(declare-fun b!1205004 () Bool)

(declare-fun Unit!39953 () Unit!39947)

(assert (=> b!1205004 (= e!684296 Unit!39953)))

(declare-fun b!1205005 () Bool)

(assert (=> b!1205005 (= e!684295 (isDefined!459 (getValueByKey!634 (toList!8853 lt!546409) k0!934)))))

(assert (= (and d!132843 c!118197) b!1205003))

(assert (= (and d!132843 (not c!118197)) b!1205004))

(assert (= (and d!132843 (not res!801570)) b!1205005))

(declare-fun m!1110977 () Bool)

(assert (=> d!132843 m!1110977))

(declare-fun m!1110979 () Bool)

(assert (=> b!1205003 m!1110979))

(declare-fun m!1110981 () Bool)

(assert (=> b!1205003 m!1110981))

(assert (=> b!1205003 m!1110981))

(declare-fun m!1110983 () Bool)

(assert (=> b!1205003 m!1110983))

(assert (=> b!1205005 m!1110981))

(assert (=> b!1205005 m!1110981))

(assert (=> b!1205005 m!1110983))

(assert (=> b!1204853 d!132843))

(declare-fun b!1205006 () Bool)

(declare-fun e!684297 () Bool)

(declare-fun lt!546512 () ListLongMap!17675)

(assert (=> b!1205006 (= e!684297 (isEmpty!985 lt!546512))))

(declare-fun b!1205007 () Bool)

(assert (=> b!1205007 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(assert (=> b!1205007 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38189 _values!996)))))

(declare-fun e!684301 () Bool)

(assert (=> b!1205007 (= e!684301 (= (apply!963 lt!546512 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19192 (select (arr!37653 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205008 () Bool)

(declare-fun e!684298 () ListLongMap!17675)

(declare-fun call!58347 () ListLongMap!17675)

(assert (=> b!1205008 (= e!684298 call!58347)))

(declare-fun b!1205009 () Bool)

(assert (=> b!1205009 (= e!684297 (= lt!546512 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205010 () Bool)

(declare-fun e!684300 () ListLongMap!17675)

(assert (=> b!1205010 (= e!684300 e!684298)))

(declare-fun c!118201 () Bool)

(assert (=> b!1205010 (= c!118201 (validKeyInArray!0 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205012 () Bool)

(declare-fun e!684303 () Bool)

(declare-fun e!684299 () Bool)

(assert (=> b!1205012 (= e!684303 e!684299)))

(declare-fun c!118198 () Bool)

(declare-fun e!684302 () Bool)

(assert (=> b!1205012 (= c!118198 e!684302)))

(declare-fun res!801574 () Bool)

(assert (=> b!1205012 (=> (not res!801574) (not e!684302))))

(assert (=> b!1205012 (= res!801574 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(declare-fun bm!58344 () Bool)

(assert (=> bm!58344 (= call!58347 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205013 () Bool)

(declare-fun lt!546511 () Unit!39947)

(declare-fun lt!546509 () Unit!39947)

(assert (=> b!1205013 (= lt!546511 lt!546509)))

(declare-fun lt!546510 () (_ BitVec 64))

(declare-fun lt!546513 () ListLongMap!17675)

(declare-fun lt!546514 () V!45955)

(declare-fun lt!546515 () (_ BitVec 64))

(assert (=> b!1205013 (not (contains!6912 (+!3979 lt!546513 (tuple2!19707 lt!546515 lt!546514)) lt!546510))))

(assert (=> b!1205013 (= lt!546509 (addStillNotContains!291 lt!546513 lt!546515 lt!546514 lt!546510))))

(assert (=> b!1205013 (= lt!546510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205013 (= lt!546514 (get!19192 (select (arr!37653 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205013 (= lt!546515 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1205013 (= lt!546513 call!58347)))

(assert (=> b!1205013 (= e!684298 (+!3979 call!58347 (tuple2!19707 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19192 (select (arr!37653 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205014 () Bool)

(assert (=> b!1205014 (= e!684302 (validKeyInArray!0 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205014 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1205015 () Bool)

(assert (=> b!1205015 (= e!684299 e!684297)))

(declare-fun c!118200 () Bool)

(assert (=> b!1205015 (= c!118200 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(declare-fun d!132845 () Bool)

(assert (=> d!132845 e!684303))

(declare-fun res!801571 () Bool)

(assert (=> d!132845 (=> (not res!801571) (not e!684303))))

(assert (=> d!132845 (= res!801571 (not (contains!6912 lt!546512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132845 (= lt!546512 e!684300)))

(declare-fun c!118199 () Bool)

(assert (=> d!132845 (= c!118199 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(assert (=> d!132845 (validMask!0 mask!1564)))

(assert (=> d!132845 (= (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546512)))

(declare-fun b!1205011 () Bool)

(declare-fun res!801572 () Bool)

(assert (=> b!1205011 (=> (not res!801572) (not e!684303))))

(assert (=> b!1205011 (= res!801572 (not (contains!6912 lt!546512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205016 () Bool)

(assert (=> b!1205016 (= e!684299 e!684301)))

(assert (=> b!1205016 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(declare-fun res!801573 () Bool)

(assert (=> b!1205016 (= res!801573 (contains!6912 lt!546512 (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205016 (=> (not res!801573) (not e!684301))))

(declare-fun b!1205017 () Bool)

(assert (=> b!1205017 (= e!684300 (ListLongMap!17676 Nil!26511))))

(assert (= (and d!132845 c!118199) b!1205017))

(assert (= (and d!132845 (not c!118199)) b!1205010))

(assert (= (and b!1205010 c!118201) b!1205013))

(assert (= (and b!1205010 (not c!118201)) b!1205008))

(assert (= (or b!1205013 b!1205008) bm!58344))

(assert (= (and d!132845 res!801571) b!1205011))

(assert (= (and b!1205011 res!801572) b!1205012))

(assert (= (and b!1205012 res!801574) b!1205014))

(assert (= (and b!1205012 c!118198) b!1205016))

(assert (= (and b!1205012 (not c!118198)) b!1205015))

(assert (= (and b!1205016 res!801573) b!1205007))

(assert (= (and b!1205015 c!118200) b!1205009))

(assert (= (and b!1205015 (not c!118200)) b!1205006))

(declare-fun b_lambda!21285 () Bool)

(assert (=> (not b_lambda!21285) (not b!1205007)))

(assert (=> b!1205007 t!39410))

(declare-fun b_and!42811 () Bool)

(assert (= b_and!42809 (and (=> t!39410 result!22017) b_and!42811)))

(declare-fun b_lambda!21287 () Bool)

(assert (=> (not b_lambda!21287) (not b!1205013)))

(assert (=> b!1205013 t!39410))

(declare-fun b_and!42813 () Bool)

(assert (= b_and!42811 (and (=> t!39410 result!22017) b_and!42813)))

(declare-fun m!1110985 () Bool)

(assert (=> b!1205014 m!1110985))

(assert (=> b!1205014 m!1110985))

(declare-fun m!1110987 () Bool)

(assert (=> b!1205014 m!1110987))

(declare-fun m!1110989 () Bool)

(assert (=> b!1205009 m!1110989))

(assert (=> bm!58344 m!1110989))

(declare-fun m!1110991 () Bool)

(assert (=> b!1205006 m!1110991))

(assert (=> b!1205010 m!1110985))

(assert (=> b!1205010 m!1110985))

(assert (=> b!1205010 m!1110987))

(declare-fun m!1110993 () Bool)

(assert (=> b!1205011 m!1110993))

(assert (=> b!1205013 m!1110985))

(declare-fun m!1110995 () Bool)

(assert (=> b!1205013 m!1110995))

(declare-fun m!1110997 () Bool)

(assert (=> b!1205013 m!1110997))

(assert (=> b!1205013 m!1110997))

(declare-fun m!1110999 () Bool)

(assert (=> b!1205013 m!1110999))

(declare-fun m!1111001 () Bool)

(assert (=> b!1205013 m!1111001))

(assert (=> b!1205013 m!1110819))

(declare-fun m!1111003 () Bool)

(assert (=> b!1205013 m!1111003))

(assert (=> b!1205013 m!1111001))

(declare-fun m!1111005 () Bool)

(assert (=> b!1205013 m!1111005))

(assert (=> b!1205013 m!1110819))

(assert (=> b!1205007 m!1111001))

(assert (=> b!1205007 m!1110819))

(assert (=> b!1205007 m!1111003))

(assert (=> b!1205007 m!1110985))

(assert (=> b!1205007 m!1110985))

(declare-fun m!1111007 () Bool)

(assert (=> b!1205007 m!1111007))

(assert (=> b!1205007 m!1111001))

(assert (=> b!1205007 m!1110819))

(declare-fun m!1111009 () Bool)

(assert (=> d!132845 m!1111009))

(assert (=> d!132845 m!1110825))

(assert (=> b!1205016 m!1110985))

(assert (=> b!1205016 m!1110985))

(declare-fun m!1111011 () Bool)

(assert (=> b!1205016 m!1111011))

(assert (=> b!1204853 d!132845))

(declare-fun d!132847 () Bool)

(declare-fun e!684306 () Bool)

(assert (=> d!132847 e!684306))

(declare-fun res!801580 () Bool)

(assert (=> d!132847 (=> (not res!801580) (not e!684306))))

(declare-fun lt!546526 () ListLongMap!17675)

(assert (=> d!132847 (= res!801580 (contains!6912 lt!546526 (_1!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!546524 () List!26514)

(assert (=> d!132847 (= lt!546526 (ListLongMap!17676 lt!546524))))

(declare-fun lt!546525 () Unit!39947)

(declare-fun lt!546527 () Unit!39947)

(assert (=> d!132847 (= lt!546525 lt!546527)))

(assert (=> d!132847 (= (getValueByKey!634 lt!546524 (_1!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!311 (List!26514 (_ BitVec 64) V!45955) Unit!39947)

(assert (=> d!132847 (= lt!546527 (lemmaContainsTupThenGetReturnValue!311 lt!546524 (_1!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!404 (List!26514 (_ BitVec 64) V!45955) List!26514)

(assert (=> d!132847 (= lt!546524 (insertStrictlySorted!404 (toList!8853 lt!546409) (_1!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132847 (= (+!3979 lt!546409 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!546526)))

(declare-fun b!1205022 () Bool)

(declare-fun res!801579 () Bool)

(assert (=> b!1205022 (=> (not res!801579) (not e!684306))))

(assert (=> b!1205022 (= res!801579 (= (getValueByKey!634 (toList!8853 lt!546526) (_1!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!684 (_2!9864 (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1205023 () Bool)

(declare-fun contains!6914 (List!26514 tuple2!19706) Bool)

(assert (=> b!1205023 (= e!684306 (contains!6914 (toList!8853 lt!546526) (ite (or c!118165 c!118166) (tuple2!19707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132847 res!801580) b!1205022))

(assert (= (and b!1205022 res!801579) b!1205023))

(declare-fun m!1111013 () Bool)

(assert (=> d!132847 m!1111013))

(declare-fun m!1111015 () Bool)

(assert (=> d!132847 m!1111015))

(declare-fun m!1111017 () Bool)

(assert (=> d!132847 m!1111017))

(declare-fun m!1111019 () Bool)

(assert (=> d!132847 m!1111019))

(declare-fun m!1111021 () Bool)

(assert (=> b!1205022 m!1111021))

(declare-fun m!1111023 () Bool)

(assert (=> b!1205023 m!1111023))

(assert (=> bm!58316 d!132847))

(declare-fun d!132849 () Bool)

(declare-fun res!801585 () Bool)

(declare-fun e!684311 () Bool)

(assert (=> d!132849 (=> res!801585 e!684311)))

(assert (=> d!132849 (= res!801585 (= (select (arr!37652 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132849 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684311)))

(declare-fun b!1205028 () Bool)

(declare-fun e!684312 () Bool)

(assert (=> b!1205028 (= e!684311 e!684312)))

(declare-fun res!801586 () Bool)

(assert (=> b!1205028 (=> (not res!801586) (not e!684312))))

(assert (=> b!1205028 (= res!801586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38188 _keys!1208)))))

(declare-fun b!1205029 () Bool)

(assert (=> b!1205029 (= e!684312 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132849 (not res!801585)) b!1205028))

(assert (= (and b!1205028 res!801586) b!1205029))

(declare-fun m!1111025 () Bool)

(assert (=> d!132849 m!1111025))

(declare-fun m!1111027 () Bool)

(assert (=> b!1205029 m!1111027))

(assert (=> b!1204845 d!132849))

(declare-fun d!132851 () Bool)

(assert (=> d!132851 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546530 () Unit!39947)

(declare-fun choose!13 (array!78021 (_ BitVec 64) (_ BitVec 32)) Unit!39947)

(assert (=> d!132851 (= lt!546530 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132851 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132851 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546530)))

(declare-fun bs!34097 () Bool)

(assert (= bs!34097 d!132851))

(assert (=> bs!34097 m!1110857))

(declare-fun m!1111029 () Bool)

(assert (=> bs!34097 m!1111029))

(assert (=> b!1204845 d!132851))

(declare-fun b!1205040 () Bool)

(declare-fun e!684322 () Bool)

(declare-fun call!58350 () Bool)

(assert (=> b!1205040 (= e!684322 call!58350)))

(declare-fun b!1205042 () Bool)

(declare-fun e!684321 () Bool)

(declare-fun contains!6915 (List!26515 (_ BitVec 64)) Bool)

(assert (=> b!1205042 (= e!684321 (contains!6915 Nil!26512 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205043 () Bool)

(declare-fun e!684324 () Bool)

(declare-fun e!684323 () Bool)

(assert (=> b!1205043 (= e!684324 e!684323)))

(declare-fun res!801595 () Bool)

(assert (=> b!1205043 (=> (not res!801595) (not e!684323))))

(assert (=> b!1205043 (= res!801595 (not e!684321))))

(declare-fun res!801594 () Bool)

(assert (=> b!1205043 (=> (not res!801594) (not e!684321))))

(assert (=> b!1205043 (= res!801594 (validKeyInArray!0 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58347 () Bool)

(declare-fun c!118204 () Bool)

(assert (=> bm!58347 (= call!58350 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118204 (Cons!26511 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000) Nil!26512) Nil!26512)))))

(declare-fun b!1205044 () Bool)

(assert (=> b!1205044 (= e!684323 e!684322)))

(assert (=> b!1205044 (= c!118204 (validKeyInArray!0 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132853 () Bool)

(declare-fun res!801593 () Bool)

(assert (=> d!132853 (=> res!801593 e!684324)))

(assert (=> d!132853 (= res!801593 (bvsge #b00000000000000000000000000000000 (size!38188 _keys!1208)))))

(assert (=> d!132853 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26512) e!684324)))

(declare-fun b!1205041 () Bool)

(assert (=> b!1205041 (= e!684322 call!58350)))

(assert (= (and d!132853 (not res!801593)) b!1205043))

(assert (= (and b!1205043 res!801594) b!1205042))

(assert (= (and b!1205043 res!801595) b!1205044))

(assert (= (and b!1205044 c!118204) b!1205040))

(assert (= (and b!1205044 (not c!118204)) b!1205041))

(assert (= (or b!1205040 b!1205041) bm!58347))

(assert (=> b!1205042 m!1111025))

(assert (=> b!1205042 m!1111025))

(declare-fun m!1111031 () Bool)

(assert (=> b!1205042 m!1111031))

(assert (=> b!1205043 m!1111025))

(assert (=> b!1205043 m!1111025))

(declare-fun m!1111033 () Bool)

(assert (=> b!1205043 m!1111033))

(assert (=> bm!58347 m!1111025))

(declare-fun m!1111035 () Bool)

(assert (=> bm!58347 m!1111035))

(assert (=> b!1205044 m!1111025))

(assert (=> b!1205044 m!1111025))

(assert (=> b!1205044 m!1111033))

(assert (=> b!1204867 d!132853))

(declare-fun b!1205045 () Bool)

(declare-fun e!684326 () Bool)

(declare-fun call!58351 () Bool)

(assert (=> b!1205045 (= e!684326 call!58351)))

(declare-fun b!1205047 () Bool)

(declare-fun e!684325 () Bool)

(assert (=> b!1205047 (= e!684325 (contains!6915 Nil!26512 (select (arr!37652 lt!546421) #b00000000000000000000000000000000)))))

(declare-fun b!1205048 () Bool)

(declare-fun e!684328 () Bool)

(declare-fun e!684327 () Bool)

(assert (=> b!1205048 (= e!684328 e!684327)))

(declare-fun res!801598 () Bool)

(assert (=> b!1205048 (=> (not res!801598) (not e!684327))))

(assert (=> b!1205048 (= res!801598 (not e!684325))))

(declare-fun res!801597 () Bool)

(assert (=> b!1205048 (=> (not res!801597) (not e!684325))))

(assert (=> b!1205048 (= res!801597 (validKeyInArray!0 (select (arr!37652 lt!546421) #b00000000000000000000000000000000)))))

(declare-fun bm!58348 () Bool)

(declare-fun c!118205 () Bool)

(assert (=> bm!58348 (= call!58351 (arrayNoDuplicates!0 lt!546421 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118205 (Cons!26511 (select (arr!37652 lt!546421) #b00000000000000000000000000000000) Nil!26512) Nil!26512)))))

(declare-fun b!1205049 () Bool)

(assert (=> b!1205049 (= e!684327 e!684326)))

(assert (=> b!1205049 (= c!118205 (validKeyInArray!0 (select (arr!37652 lt!546421) #b00000000000000000000000000000000)))))

(declare-fun d!132855 () Bool)

(declare-fun res!801596 () Bool)

(assert (=> d!132855 (=> res!801596 e!684328)))

(assert (=> d!132855 (= res!801596 (bvsge #b00000000000000000000000000000000 (size!38188 lt!546421)))))

(assert (=> d!132855 (= (arrayNoDuplicates!0 lt!546421 #b00000000000000000000000000000000 Nil!26512) e!684328)))

(declare-fun b!1205046 () Bool)

(assert (=> b!1205046 (= e!684326 call!58351)))

(assert (= (and d!132855 (not res!801596)) b!1205048))

(assert (= (and b!1205048 res!801597) b!1205047))

(assert (= (and b!1205048 res!801598) b!1205049))

(assert (= (and b!1205049 c!118205) b!1205045))

(assert (= (and b!1205049 (not c!118205)) b!1205046))

(assert (= (or b!1205045 b!1205046) bm!58348))

(declare-fun m!1111037 () Bool)

(assert (=> b!1205047 m!1111037))

(assert (=> b!1205047 m!1111037))

(declare-fun m!1111039 () Bool)

(assert (=> b!1205047 m!1111039))

(assert (=> b!1205048 m!1111037))

(assert (=> b!1205048 m!1111037))

(declare-fun m!1111041 () Bool)

(assert (=> b!1205048 m!1111041))

(assert (=> bm!58348 m!1111037))

(declare-fun m!1111043 () Bool)

(assert (=> bm!58348 m!1111043))

(assert (=> b!1205049 m!1111037))

(assert (=> b!1205049 m!1111037))

(assert (=> b!1205049 m!1111041))

(assert (=> b!1204861 d!132855))

(declare-fun d!132857 () Bool)

(declare-fun e!684331 () Bool)

(assert (=> d!132857 e!684331))

(declare-fun c!118208 () Bool)

(assert (=> d!132857 (= c!118208 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546533 () Unit!39947)

(declare-fun choose!1795 (array!78021 array!78023 (_ BitVec 32) (_ BitVec 32) V!45955 V!45955 (_ BitVec 64) (_ BitVec 32) Int) Unit!39947)

(assert (=> d!132857 (= lt!546533 (choose!1795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132857 (validMask!0 mask!1564)))

(assert (=> d!132857 (= (lemmaListMapContainsThenArrayContainsFrom!563 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546533)))

(declare-fun b!1205054 () Bool)

(assert (=> b!1205054 (= e!684331 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205055 () Bool)

(assert (=> b!1205055 (= e!684331 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132857 c!118208) b!1205054))

(assert (= (and d!132857 (not c!118208)) b!1205055))

(declare-fun m!1111045 () Bool)

(assert (=> d!132857 m!1111045))

(assert (=> d!132857 m!1110825))

(assert (=> b!1205054 m!1110813))

(assert (=> b!1204866 d!132857))

(declare-fun d!132859 () Bool)

(declare-fun res!801599 () Bool)

(declare-fun e!684332 () Bool)

(assert (=> d!132859 (=> res!801599 e!684332)))

(assert (=> d!132859 (= res!801599 (= (select (arr!37652 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132859 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!684332)))

(declare-fun b!1205056 () Bool)

(declare-fun e!684333 () Bool)

(assert (=> b!1205056 (= e!684332 e!684333)))

(declare-fun res!801600 () Bool)

(assert (=> b!1205056 (=> (not res!801600) (not e!684333))))

(assert (=> b!1205056 (= res!801600 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38188 _keys!1208)))))

(declare-fun b!1205057 () Bool)

(assert (=> b!1205057 (= e!684333 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132859 (not res!801599)) b!1205056))

(assert (= (and b!1205056 res!801600) b!1205057))

(assert (=> d!132859 m!1110985))

(declare-fun m!1111047 () Bool)

(assert (=> b!1205057 m!1111047))

(assert (=> b!1204850 d!132859))

(declare-fun d!132861 () Bool)

(assert (=> d!132861 (contains!6912 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546536 () Unit!39947)

(declare-fun choose!1796 (ListLongMap!17675 (_ BitVec 64) V!45955 (_ BitVec 64)) Unit!39947)

(assert (=> d!132861 (= lt!546536 (choose!1796 lt!546417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132861 (contains!6912 lt!546417 k0!934)))

(assert (=> d!132861 (= (addStillContains!1007 lt!546417 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546536)))

(declare-fun bs!34098 () Bool)

(assert (= bs!34098 d!132861))

(assert (=> bs!34098 m!1110865))

(assert (=> bs!34098 m!1110865))

(assert (=> bs!34098 m!1110867))

(declare-fun m!1111049 () Bool)

(assert (=> bs!34098 m!1111049))

(declare-fun m!1111051 () Bool)

(assert (=> bs!34098 m!1111051))

(assert (=> b!1204851 d!132861))

(declare-fun d!132863 () Bool)

(declare-fun e!684334 () Bool)

(assert (=> d!132863 e!684334))

(declare-fun res!801601 () Bool)

(assert (=> d!132863 (=> res!801601 e!684334)))

(declare-fun lt!546538 () Bool)

(assert (=> d!132863 (= res!801601 (not lt!546538))))

(declare-fun lt!546540 () Bool)

(assert (=> d!132863 (= lt!546538 lt!546540)))

(declare-fun lt!546537 () Unit!39947)

(declare-fun e!684335 () Unit!39947)

(assert (=> d!132863 (= lt!546537 e!684335)))

(declare-fun c!118209 () Bool)

(assert (=> d!132863 (= c!118209 lt!546540)))

(assert (=> d!132863 (= lt!546540 (containsKey!590 (toList!8853 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132863 (= (contains!6912 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!546538)))

(declare-fun b!1205059 () Bool)

(declare-fun lt!546539 () Unit!39947)

(assert (=> b!1205059 (= e!684335 lt!546539)))

(assert (=> b!1205059 (= lt!546539 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8853 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1205059 (isDefined!459 (getValueByKey!634 (toList!8853 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1205060 () Bool)

(declare-fun Unit!39954 () Unit!39947)

(assert (=> b!1205060 (= e!684335 Unit!39954)))

(declare-fun b!1205061 () Bool)

(assert (=> b!1205061 (= e!684334 (isDefined!459 (getValueByKey!634 (toList!8853 (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132863 c!118209) b!1205059))

(assert (= (and d!132863 (not c!118209)) b!1205060))

(assert (= (and d!132863 (not res!801601)) b!1205061))

(declare-fun m!1111053 () Bool)

(assert (=> d!132863 m!1111053))

(declare-fun m!1111055 () Bool)

(assert (=> b!1205059 m!1111055))

(declare-fun m!1111057 () Bool)

(assert (=> b!1205059 m!1111057))

(assert (=> b!1205059 m!1111057))

(declare-fun m!1111059 () Bool)

(assert (=> b!1205059 m!1111059))

(assert (=> b!1205061 m!1111057))

(assert (=> b!1205061 m!1111057))

(assert (=> b!1205061 m!1111059))

(assert (=> b!1204851 d!132863))

(declare-fun d!132865 () Bool)

(declare-fun e!684336 () Bool)

(assert (=> d!132865 e!684336))

(declare-fun res!801603 () Bool)

(assert (=> d!132865 (=> (not res!801603) (not e!684336))))

(declare-fun lt!546543 () ListLongMap!17675)

(assert (=> d!132865 (= res!801603 (contains!6912 lt!546543 (_1!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!546541 () List!26514)

(assert (=> d!132865 (= lt!546543 (ListLongMap!17676 lt!546541))))

(declare-fun lt!546542 () Unit!39947)

(declare-fun lt!546544 () Unit!39947)

(assert (=> d!132865 (= lt!546542 lt!546544)))

(assert (=> d!132865 (= (getValueByKey!634 lt!546541 (_1!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132865 (= lt!546544 (lemmaContainsTupThenGetReturnValue!311 lt!546541 (_1!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132865 (= lt!546541 (insertStrictlySorted!404 (toList!8853 lt!546417) (_1!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132865 (= (+!3979 lt!546417 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!546543)))

(declare-fun b!1205062 () Bool)

(declare-fun res!801602 () Bool)

(assert (=> b!1205062 (=> (not res!801602) (not e!684336))))

(assert (=> b!1205062 (= res!801602 (= (getValueByKey!634 (toList!8853 lt!546543) (_1!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!684 (_2!9864 (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205063 () Bool)

(assert (=> b!1205063 (= e!684336 (contains!6914 (toList!8853 lt!546543) (tuple2!19707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132865 res!801603) b!1205062))

(assert (= (and b!1205062 res!801602) b!1205063))

(declare-fun m!1111061 () Bool)

(assert (=> d!132865 m!1111061))

(declare-fun m!1111063 () Bool)

(assert (=> d!132865 m!1111063))

(declare-fun m!1111065 () Bool)

(assert (=> d!132865 m!1111065))

(declare-fun m!1111067 () Bool)

(assert (=> d!132865 m!1111067))

(declare-fun m!1111069 () Bool)

(assert (=> b!1205062 m!1111069))

(declare-fun m!1111071 () Bool)

(assert (=> b!1205063 m!1111071))

(assert (=> b!1204851 d!132865))

(declare-fun b!1205072 () Bool)

(declare-fun e!684343 () Bool)

(declare-fun e!684345 () Bool)

(assert (=> b!1205072 (= e!684343 e!684345)))

(declare-fun lt!546552 () (_ BitVec 64))

(assert (=> b!1205072 (= lt!546552 (select (arr!37652 lt!546421) #b00000000000000000000000000000000))))

(declare-fun lt!546553 () Unit!39947)

(assert (=> b!1205072 (= lt!546553 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546421 lt!546552 #b00000000000000000000000000000000))))

(assert (=> b!1205072 (arrayContainsKey!0 lt!546421 lt!546552 #b00000000000000000000000000000000)))

(declare-fun lt!546551 () Unit!39947)

(assert (=> b!1205072 (= lt!546551 lt!546553)))

(declare-fun res!801609 () Bool)

(declare-datatypes ((SeekEntryResult!9936 0))(
  ( (MissingZero!9936 (index!42115 (_ BitVec 32))) (Found!9936 (index!42116 (_ BitVec 32))) (Intermediate!9936 (undefined!10748 Bool) (index!42117 (_ BitVec 32)) (x!106444 (_ BitVec 32))) (Undefined!9936) (MissingVacant!9936 (index!42118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78021 (_ BitVec 32)) SeekEntryResult!9936)

(assert (=> b!1205072 (= res!801609 (= (seekEntryOrOpen!0 (select (arr!37652 lt!546421) #b00000000000000000000000000000000) lt!546421 mask!1564) (Found!9936 #b00000000000000000000000000000000)))))

(assert (=> b!1205072 (=> (not res!801609) (not e!684345))))

(declare-fun b!1205073 () Bool)

(declare-fun e!684344 () Bool)

(assert (=> b!1205073 (= e!684344 e!684343)))

(declare-fun c!118212 () Bool)

(assert (=> b!1205073 (= c!118212 (validKeyInArray!0 (select (arr!37652 lt!546421) #b00000000000000000000000000000000)))))

(declare-fun b!1205074 () Bool)

(declare-fun call!58354 () Bool)

(assert (=> b!1205074 (= e!684345 call!58354)))

(declare-fun bm!58351 () Bool)

(assert (=> bm!58351 (= call!58354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546421 mask!1564))))

(declare-fun b!1205075 () Bool)

(assert (=> b!1205075 (= e!684343 call!58354)))

(declare-fun d!132867 () Bool)

(declare-fun res!801608 () Bool)

(assert (=> d!132867 (=> res!801608 e!684344)))

(assert (=> d!132867 (= res!801608 (bvsge #b00000000000000000000000000000000 (size!38188 lt!546421)))))

(assert (=> d!132867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546421 mask!1564) e!684344)))

(assert (= (and d!132867 (not res!801608)) b!1205073))

(assert (= (and b!1205073 c!118212) b!1205072))

(assert (= (and b!1205073 (not c!118212)) b!1205075))

(assert (= (and b!1205072 res!801609) b!1205074))

(assert (= (or b!1205074 b!1205075) bm!58351))

(assert (=> b!1205072 m!1111037))

(declare-fun m!1111073 () Bool)

(assert (=> b!1205072 m!1111073))

(declare-fun m!1111075 () Bool)

(assert (=> b!1205072 m!1111075))

(assert (=> b!1205072 m!1111037))

(declare-fun m!1111077 () Bool)

(assert (=> b!1205072 m!1111077))

(assert (=> b!1205073 m!1111037))

(assert (=> b!1205073 m!1111037))

(assert (=> b!1205073 m!1111041))

(declare-fun m!1111079 () Bool)

(assert (=> bm!58351 m!1111079))

(assert (=> b!1204842 d!132867))

(declare-fun b!1205076 () Bool)

(declare-fun e!684346 () Bool)

(declare-fun lt!546557 () ListLongMap!17675)

(assert (=> b!1205076 (= e!684346 (isEmpty!985 lt!546557))))

(declare-fun b!1205077 () Bool)

(assert (=> b!1205077 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38188 lt!546421)))))

(assert (=> b!1205077 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38189 lt!546416)))))

(declare-fun e!684350 () Bool)

(assert (=> b!1205077 (= e!684350 (= (apply!963 lt!546557 (select (arr!37652 lt!546421) from!1455)) (get!19192 (select (arr!37653 lt!546416) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205078 () Bool)

(declare-fun e!684347 () ListLongMap!17675)

(declare-fun call!58355 () ListLongMap!17675)

(assert (=> b!1205078 (= e!684347 call!58355)))

(declare-fun b!1205079 () Bool)

(assert (=> b!1205079 (= e!684346 (= lt!546557 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205080 () Bool)

(declare-fun e!684349 () ListLongMap!17675)

(assert (=> b!1205080 (= e!684349 e!684347)))

(declare-fun c!118216 () Bool)

(assert (=> b!1205080 (= c!118216 (validKeyInArray!0 (select (arr!37652 lt!546421) from!1455)))))

(declare-fun b!1205082 () Bool)

(declare-fun e!684352 () Bool)

(declare-fun e!684348 () Bool)

(assert (=> b!1205082 (= e!684352 e!684348)))

(declare-fun c!118213 () Bool)

(declare-fun e!684351 () Bool)

(assert (=> b!1205082 (= c!118213 e!684351)))

(declare-fun res!801613 () Bool)

(assert (=> b!1205082 (=> (not res!801613) (not e!684351))))

(assert (=> b!1205082 (= res!801613 (bvslt from!1455 (size!38188 lt!546421)))))

(declare-fun bm!58352 () Bool)

(assert (=> bm!58352 (= call!58355 (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205083 () Bool)

(declare-fun lt!546556 () Unit!39947)

(declare-fun lt!546554 () Unit!39947)

(assert (=> b!1205083 (= lt!546556 lt!546554)))

(declare-fun lt!546558 () ListLongMap!17675)

(declare-fun lt!546560 () (_ BitVec 64))

(declare-fun lt!546559 () V!45955)

(declare-fun lt!546555 () (_ BitVec 64))

(assert (=> b!1205083 (not (contains!6912 (+!3979 lt!546558 (tuple2!19707 lt!546560 lt!546559)) lt!546555))))

(assert (=> b!1205083 (= lt!546554 (addStillNotContains!291 lt!546558 lt!546560 lt!546559 lt!546555))))

(assert (=> b!1205083 (= lt!546555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205083 (= lt!546559 (get!19192 (select (arr!37653 lt!546416) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205083 (= lt!546560 (select (arr!37652 lt!546421) from!1455))))

(assert (=> b!1205083 (= lt!546558 call!58355)))

(assert (=> b!1205083 (= e!684347 (+!3979 call!58355 (tuple2!19707 (select (arr!37652 lt!546421) from!1455) (get!19192 (select (arr!37653 lt!546416) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205084 () Bool)

(assert (=> b!1205084 (= e!684351 (validKeyInArray!0 (select (arr!37652 lt!546421) from!1455)))))

(assert (=> b!1205084 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1205085 () Bool)

(assert (=> b!1205085 (= e!684348 e!684346)))

(declare-fun c!118215 () Bool)

(assert (=> b!1205085 (= c!118215 (bvslt from!1455 (size!38188 lt!546421)))))

(declare-fun d!132869 () Bool)

(assert (=> d!132869 e!684352))

(declare-fun res!801610 () Bool)

(assert (=> d!132869 (=> (not res!801610) (not e!684352))))

(assert (=> d!132869 (= res!801610 (not (contains!6912 lt!546557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132869 (= lt!546557 e!684349)))

(declare-fun c!118214 () Bool)

(assert (=> d!132869 (= c!118214 (bvsge from!1455 (size!38188 lt!546421)))))

(assert (=> d!132869 (validMask!0 mask!1564)))

(assert (=> d!132869 (= (getCurrentListMapNoExtraKeys!5289 lt!546421 lt!546416 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546557)))

(declare-fun b!1205081 () Bool)

(declare-fun res!801611 () Bool)

(assert (=> b!1205081 (=> (not res!801611) (not e!684352))))

(assert (=> b!1205081 (= res!801611 (not (contains!6912 lt!546557 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205086 () Bool)

(assert (=> b!1205086 (= e!684348 e!684350)))

(assert (=> b!1205086 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38188 lt!546421)))))

(declare-fun res!801612 () Bool)

(assert (=> b!1205086 (= res!801612 (contains!6912 lt!546557 (select (arr!37652 lt!546421) from!1455)))))

(assert (=> b!1205086 (=> (not res!801612) (not e!684350))))

(declare-fun b!1205087 () Bool)

(assert (=> b!1205087 (= e!684349 (ListLongMap!17676 Nil!26511))))

(assert (= (and d!132869 c!118214) b!1205087))

(assert (= (and d!132869 (not c!118214)) b!1205080))

(assert (= (and b!1205080 c!118216) b!1205083))

(assert (= (and b!1205080 (not c!118216)) b!1205078))

(assert (= (or b!1205083 b!1205078) bm!58352))

(assert (= (and d!132869 res!801610) b!1205081))

(assert (= (and b!1205081 res!801611) b!1205082))

(assert (= (and b!1205082 res!801613) b!1205084))

(assert (= (and b!1205082 c!118213) b!1205086))

(assert (= (and b!1205082 (not c!118213)) b!1205085))

(assert (= (and b!1205086 res!801612) b!1205077))

(assert (= (and b!1205085 c!118215) b!1205079))

(assert (= (and b!1205085 (not c!118215)) b!1205076))

(declare-fun b_lambda!21289 () Bool)

(assert (=> (not b_lambda!21289) (not b!1205077)))

(assert (=> b!1205077 t!39410))

(declare-fun b_and!42815 () Bool)

(assert (= b_and!42813 (and (=> t!39410 result!22017) b_and!42815)))

(declare-fun b_lambda!21291 () Bool)

(assert (=> (not b_lambda!21291) (not b!1205083)))

(assert (=> b!1205083 t!39410))

(declare-fun b_and!42817 () Bool)

(assert (= b_and!42815 (and (=> t!39410 result!22017) b_and!42817)))

(declare-fun m!1111081 () Bool)

(assert (=> b!1205084 m!1111081))

(assert (=> b!1205084 m!1111081))

(declare-fun m!1111083 () Bool)

(assert (=> b!1205084 m!1111083))

(declare-fun m!1111085 () Bool)

(assert (=> b!1205079 m!1111085))

(assert (=> bm!58352 m!1111085))

(declare-fun m!1111087 () Bool)

(assert (=> b!1205076 m!1111087))

(assert (=> b!1205080 m!1111081))

(assert (=> b!1205080 m!1111081))

(assert (=> b!1205080 m!1111083))

(declare-fun m!1111089 () Bool)

(assert (=> b!1205081 m!1111089))

(assert (=> b!1205083 m!1111081))

(declare-fun m!1111091 () Bool)

(assert (=> b!1205083 m!1111091))

(declare-fun m!1111093 () Bool)

(assert (=> b!1205083 m!1111093))

(assert (=> b!1205083 m!1111093))

(declare-fun m!1111095 () Bool)

(assert (=> b!1205083 m!1111095))

(declare-fun m!1111097 () Bool)

(assert (=> b!1205083 m!1111097))

(assert (=> b!1205083 m!1110819))

(declare-fun m!1111099 () Bool)

(assert (=> b!1205083 m!1111099))

(assert (=> b!1205083 m!1111097))

(declare-fun m!1111101 () Bool)

(assert (=> b!1205083 m!1111101))

(assert (=> b!1205083 m!1110819))

(assert (=> b!1205077 m!1111097))

(assert (=> b!1205077 m!1110819))

(assert (=> b!1205077 m!1111099))

(assert (=> b!1205077 m!1111081))

(assert (=> b!1205077 m!1111081))

(declare-fun m!1111103 () Bool)

(assert (=> b!1205077 m!1111103))

(assert (=> b!1205077 m!1111097))

(assert (=> b!1205077 m!1110819))

(declare-fun m!1111105 () Bool)

(assert (=> d!132869 m!1111105))

(assert (=> d!132869 m!1110825))

(assert (=> b!1205086 m!1111081))

(assert (=> b!1205086 m!1111081))

(declare-fun m!1111107 () Bool)

(assert (=> b!1205086 m!1111107))

(assert (=> b!1204865 d!132869))

(declare-fun b!1205088 () Bool)

(declare-fun e!684353 () Bool)

(declare-fun lt!546564 () ListLongMap!17675)

(assert (=> b!1205088 (= e!684353 (isEmpty!985 lt!546564))))

(declare-fun b!1205089 () Bool)

(assert (=> b!1205089 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38188 _keys!1208)))))

(assert (=> b!1205089 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38189 _values!996)))))

(declare-fun e!684357 () Bool)

(assert (=> b!1205089 (= e!684357 (= (apply!963 lt!546564 (select (arr!37652 _keys!1208) from!1455)) (get!19192 (select (arr!37653 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1205090 () Bool)

(declare-fun e!684354 () ListLongMap!17675)

(declare-fun call!58356 () ListLongMap!17675)

(assert (=> b!1205090 (= e!684354 call!58356)))

(declare-fun b!1205091 () Bool)

(assert (=> b!1205091 (= e!684353 (= lt!546564 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205092 () Bool)

(declare-fun e!684356 () ListLongMap!17675)

(assert (=> b!1205092 (= e!684356 e!684354)))

(declare-fun c!118220 () Bool)

(assert (=> b!1205092 (= c!118220 (validKeyInArray!0 (select (arr!37652 _keys!1208) from!1455)))))

(declare-fun b!1205094 () Bool)

(declare-fun e!684359 () Bool)

(declare-fun e!684355 () Bool)

(assert (=> b!1205094 (= e!684359 e!684355)))

(declare-fun c!118217 () Bool)

(declare-fun e!684358 () Bool)

(assert (=> b!1205094 (= c!118217 e!684358)))

(declare-fun res!801617 () Bool)

(assert (=> b!1205094 (=> (not res!801617) (not e!684358))))

(assert (=> b!1205094 (= res!801617 (bvslt from!1455 (size!38188 _keys!1208)))))

(declare-fun bm!58353 () Bool)

(assert (=> bm!58353 (= call!58356 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205095 () Bool)

(declare-fun lt!546563 () Unit!39947)

(declare-fun lt!546561 () Unit!39947)

(assert (=> b!1205095 (= lt!546563 lt!546561)))

(declare-fun lt!546562 () (_ BitVec 64))

(declare-fun lt!546567 () (_ BitVec 64))

(declare-fun lt!546566 () V!45955)

(declare-fun lt!546565 () ListLongMap!17675)

(assert (=> b!1205095 (not (contains!6912 (+!3979 lt!546565 (tuple2!19707 lt!546567 lt!546566)) lt!546562))))

(assert (=> b!1205095 (= lt!546561 (addStillNotContains!291 lt!546565 lt!546567 lt!546566 lt!546562))))

(assert (=> b!1205095 (= lt!546562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205095 (= lt!546566 (get!19192 (select (arr!37653 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205095 (= lt!546567 (select (arr!37652 _keys!1208) from!1455))))

(assert (=> b!1205095 (= lt!546565 call!58356)))

(assert (=> b!1205095 (= e!684354 (+!3979 call!58356 (tuple2!19707 (select (arr!37652 _keys!1208) from!1455) (get!19192 (select (arr!37653 _values!996) from!1455) (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205096 () Bool)

(assert (=> b!1205096 (= e!684358 (validKeyInArray!0 (select (arr!37652 _keys!1208) from!1455)))))

(assert (=> b!1205096 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1205097 () Bool)

(assert (=> b!1205097 (= e!684355 e!684353)))

(declare-fun c!118219 () Bool)

(assert (=> b!1205097 (= c!118219 (bvslt from!1455 (size!38188 _keys!1208)))))

(declare-fun d!132871 () Bool)

(assert (=> d!132871 e!684359))

(declare-fun res!801614 () Bool)

(assert (=> d!132871 (=> (not res!801614) (not e!684359))))

(assert (=> d!132871 (= res!801614 (not (contains!6912 lt!546564 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132871 (= lt!546564 e!684356)))

(declare-fun c!118218 () Bool)

(assert (=> d!132871 (= c!118218 (bvsge from!1455 (size!38188 _keys!1208)))))

(assert (=> d!132871 (validMask!0 mask!1564)))

(assert (=> d!132871 (= (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546564)))

(declare-fun b!1205093 () Bool)

(declare-fun res!801615 () Bool)

(assert (=> b!1205093 (=> (not res!801615) (not e!684359))))

(assert (=> b!1205093 (= res!801615 (not (contains!6912 lt!546564 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1205098 () Bool)

(assert (=> b!1205098 (= e!684355 e!684357)))

(assert (=> b!1205098 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38188 _keys!1208)))))

(declare-fun res!801616 () Bool)

(assert (=> b!1205098 (= res!801616 (contains!6912 lt!546564 (select (arr!37652 _keys!1208) from!1455)))))

(assert (=> b!1205098 (=> (not res!801616) (not e!684357))))

(declare-fun b!1205099 () Bool)

(assert (=> b!1205099 (= e!684356 (ListLongMap!17676 Nil!26511))))

(assert (= (and d!132871 c!118218) b!1205099))

(assert (= (and d!132871 (not c!118218)) b!1205092))

(assert (= (and b!1205092 c!118220) b!1205095))

(assert (= (and b!1205092 (not c!118220)) b!1205090))

(assert (= (or b!1205095 b!1205090) bm!58353))

(assert (= (and d!132871 res!801614) b!1205093))

(assert (= (and b!1205093 res!801615) b!1205094))

(assert (= (and b!1205094 res!801617) b!1205096))

(assert (= (and b!1205094 c!118217) b!1205098))

(assert (= (and b!1205094 (not c!118217)) b!1205097))

(assert (= (and b!1205098 res!801616) b!1205089))

(assert (= (and b!1205097 c!118219) b!1205091))

(assert (= (and b!1205097 (not c!118219)) b!1205088))

(declare-fun b_lambda!21293 () Bool)

(assert (=> (not b_lambda!21293) (not b!1205089)))

(assert (=> b!1205089 t!39410))

(declare-fun b_and!42819 () Bool)

(assert (= b_and!42817 (and (=> t!39410 result!22017) b_and!42819)))

(declare-fun b_lambda!21295 () Bool)

(assert (=> (not b_lambda!21295) (not b!1205095)))

(assert (=> b!1205095 t!39410))

(declare-fun b_and!42821 () Bool)

(assert (= b_and!42819 (and (=> t!39410 result!22017) b_and!42821)))

(assert (=> b!1205096 m!1110869))

(assert (=> b!1205096 m!1110869))

(declare-fun m!1111109 () Bool)

(assert (=> b!1205096 m!1111109))

(declare-fun m!1111111 () Bool)

(assert (=> b!1205091 m!1111111))

(assert (=> bm!58353 m!1111111))

(declare-fun m!1111113 () Bool)

(assert (=> b!1205088 m!1111113))

(assert (=> b!1205092 m!1110869))

(assert (=> b!1205092 m!1110869))

(assert (=> b!1205092 m!1111109))

(declare-fun m!1111115 () Bool)

(assert (=> b!1205093 m!1111115))

(assert (=> b!1205095 m!1110869))

(declare-fun m!1111117 () Bool)

(assert (=> b!1205095 m!1111117))

(declare-fun m!1111119 () Bool)

(assert (=> b!1205095 m!1111119))

(assert (=> b!1205095 m!1111119))

(declare-fun m!1111121 () Bool)

(assert (=> b!1205095 m!1111121))

(declare-fun m!1111123 () Bool)

(assert (=> b!1205095 m!1111123))

(assert (=> b!1205095 m!1110819))

(declare-fun m!1111125 () Bool)

(assert (=> b!1205095 m!1111125))

(assert (=> b!1205095 m!1111123))

(declare-fun m!1111127 () Bool)

(assert (=> b!1205095 m!1111127))

(assert (=> b!1205095 m!1110819))

(assert (=> b!1205089 m!1111123))

(assert (=> b!1205089 m!1110819))

(assert (=> b!1205089 m!1111125))

(assert (=> b!1205089 m!1110869))

(assert (=> b!1205089 m!1110869))

(declare-fun m!1111129 () Bool)

(assert (=> b!1205089 m!1111129))

(assert (=> b!1205089 m!1111123))

(assert (=> b!1205089 m!1110819))

(declare-fun m!1111131 () Bool)

(assert (=> d!132871 m!1111131))

(assert (=> d!132871 m!1110825))

(assert (=> b!1205098 m!1110869))

(assert (=> b!1205098 m!1110869))

(declare-fun m!1111133 () Bool)

(assert (=> b!1205098 m!1111133))

(assert (=> b!1204865 d!132871))

(assert (=> bm!58315 d!132845))

(declare-fun d!132873 () Bool)

(assert (=> d!132873 (contains!6912 (+!3979 lt!546409 (tuple2!19707 (ite (or c!118165 c!118166) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118165 c!118166) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546568 () Unit!39947)

(assert (=> d!132873 (= lt!546568 (choose!1796 lt!546409 (ite (or c!118165 c!118166) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118165 c!118166) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132873 (contains!6912 lt!546409 k0!934)))

(assert (=> d!132873 (= (addStillContains!1007 lt!546409 (ite (or c!118165 c!118166) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118165 c!118166) zeroValue!944 minValue!944) k0!934) lt!546568)))

(declare-fun bs!34099 () Bool)

(assert (= bs!34099 d!132873))

(declare-fun m!1111135 () Bool)

(assert (=> bs!34099 m!1111135))

(assert (=> bs!34099 m!1111135))

(declare-fun m!1111137 () Bool)

(assert (=> bs!34099 m!1111137))

(declare-fun m!1111139 () Bool)

(assert (=> bs!34099 m!1111139))

(assert (=> bs!34099 m!1110851))

(assert (=> bm!58311 d!132873))

(declare-fun b!1205100 () Bool)

(declare-fun e!684360 () Bool)

(declare-fun e!684362 () Bool)

(assert (=> b!1205100 (= e!684360 e!684362)))

(declare-fun lt!546570 () (_ BitVec 64))

(assert (=> b!1205100 (= lt!546570 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546571 () Unit!39947)

(assert (=> b!1205100 (= lt!546571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546570 #b00000000000000000000000000000000))))

(assert (=> b!1205100 (arrayContainsKey!0 _keys!1208 lt!546570 #b00000000000000000000000000000000)))

(declare-fun lt!546569 () Unit!39947)

(assert (=> b!1205100 (= lt!546569 lt!546571)))

(declare-fun res!801619 () Bool)

(assert (=> b!1205100 (= res!801619 (= (seekEntryOrOpen!0 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9936 #b00000000000000000000000000000000)))))

(assert (=> b!1205100 (=> (not res!801619) (not e!684362))))

(declare-fun b!1205101 () Bool)

(declare-fun e!684361 () Bool)

(assert (=> b!1205101 (= e!684361 e!684360)))

(declare-fun c!118221 () Bool)

(assert (=> b!1205101 (= c!118221 (validKeyInArray!0 (select (arr!37652 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205102 () Bool)

(declare-fun call!58357 () Bool)

(assert (=> b!1205102 (= e!684362 call!58357)))

(declare-fun bm!58354 () Bool)

(assert (=> bm!58354 (= call!58357 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1205103 () Bool)

(assert (=> b!1205103 (= e!684360 call!58357)))

(declare-fun d!132875 () Bool)

(declare-fun res!801618 () Bool)

(assert (=> d!132875 (=> res!801618 e!684361)))

(assert (=> d!132875 (= res!801618 (bvsge #b00000000000000000000000000000000 (size!38188 _keys!1208)))))

(assert (=> d!132875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684361)))

(assert (= (and d!132875 (not res!801618)) b!1205101))

(assert (= (and b!1205101 c!118221) b!1205100))

(assert (= (and b!1205101 (not c!118221)) b!1205103))

(assert (= (and b!1205100 res!801619) b!1205102))

(assert (= (or b!1205102 b!1205103) bm!58354))

(assert (=> b!1205100 m!1111025))

(declare-fun m!1111141 () Bool)

(assert (=> b!1205100 m!1111141))

(declare-fun m!1111143 () Bool)

(assert (=> b!1205100 m!1111143))

(assert (=> b!1205100 m!1111025))

(declare-fun m!1111145 () Bool)

(assert (=> b!1205100 m!1111145))

(assert (=> b!1205101 m!1111025))

(assert (=> b!1205101 m!1111025))

(assert (=> b!1205101 m!1111033))

(declare-fun m!1111147 () Bool)

(assert (=> bm!58354 m!1111147))

(assert (=> b!1204857 d!132875))

(declare-fun d!132877 () Bool)

(assert (=> d!132877 (= (array_inv!28686 _keys!1208) (bvsge (size!38188 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100716 d!132877))

(declare-fun d!132879 () Bool)

(assert (=> d!132879 (= (array_inv!28687 _values!996) (bvsge (size!38189 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100716 d!132879))

(declare-fun d!132881 () Bool)

(assert (=> d!132881 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1204848 d!132881))

(declare-fun call!58362 () ListLongMap!17675)

(declare-fun bm!58359 () Bool)

(assert (=> bm!58359 (= call!58362 (getCurrentListMapNoExtraKeys!5289 (array!78022 (store (arr!37652 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38188 _keys!1208)) (array!78024 (store (arr!37653 _values!996) i!673 (ValueCellFull!14601 (dynLambda!3199 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38189 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205110 () Bool)

(declare-fun e!684368 () Bool)

(declare-fun e!684367 () Bool)

(assert (=> b!1205110 (= e!684368 e!684367)))

(declare-fun c!118224 () Bool)

(assert (=> b!1205110 (= c!118224 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1205111 () Bool)

(declare-fun call!58363 () ListLongMap!17675)

(assert (=> b!1205111 (= e!684367 (= call!58362 call!58363))))

(assert (=> b!1205111 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38189 _values!996)))))

(declare-fun b!1205112 () Bool)

(assert (=> b!1205112 (= e!684367 (= call!58362 (-!1818 call!58363 k0!934)))))

(assert (=> b!1205112 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38189 _values!996)))))

(declare-fun d!132883 () Bool)

(assert (=> d!132883 e!684368))

(declare-fun res!801622 () Bool)

(assert (=> d!132883 (=> (not res!801622) (not e!684368))))

(assert (=> d!132883 (= res!801622 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38188 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38188 _keys!1208))))))))

(declare-fun lt!546574 () Unit!39947)

(declare-fun choose!1797 (array!78021 array!78023 (_ BitVec 32) (_ BitVec 32) V!45955 V!45955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39947)

(assert (=> d!132883 (= lt!546574 (choose!1797 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132883 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38188 _keys!1208)))))

(assert (=> d!132883 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546574)))

(declare-fun bm!58360 () Bool)

(assert (=> bm!58360 (= call!58363 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132883 res!801622) b!1205110))

(assert (= (and b!1205110 c!118224) b!1205112))

(assert (= (and b!1205110 (not c!118224)) b!1205111))

(assert (= (or b!1205112 b!1205111) bm!58360))

(assert (= (or b!1205112 b!1205111) bm!58359))

(declare-fun b_lambda!21297 () Bool)

(assert (=> (not b_lambda!21297) (not bm!58359)))

(assert (=> bm!58359 t!39410))

(declare-fun b_and!42823 () Bool)

(assert (= b_and!42821 (and (=> t!39410 result!22017) b_and!42823)))

(assert (=> bm!58359 m!1110837))

(assert (=> bm!58359 m!1110819))

(assert (=> bm!58359 m!1110821))

(declare-fun m!1111149 () Bool)

(assert (=> bm!58359 m!1111149))

(declare-fun m!1111151 () Bool)

(assert (=> b!1205112 m!1111151))

(declare-fun m!1111153 () Bool)

(assert (=> d!132883 m!1111153))

(assert (=> bm!58360 m!1110853))

(assert (=> b!1204846 d!132883))

(assert (=> b!1204847 d!132859))

(declare-fun condMapEmpty!47790 () Bool)

(declare-fun mapDefault!47790 () ValueCell!14601)

(assert (=> mapNonEmpty!47784 (= condMapEmpty!47790 (= mapRest!47784 ((as const (Array (_ BitVec 32) ValueCell!14601)) mapDefault!47790)))))

(declare-fun e!684374 () Bool)

(declare-fun mapRes!47790 () Bool)

(assert (=> mapNonEmpty!47784 (= tp!90750 (and e!684374 mapRes!47790))))

(declare-fun mapIsEmpty!47790 () Bool)

(assert (=> mapIsEmpty!47790 mapRes!47790))

(declare-fun b!1205120 () Bool)

(assert (=> b!1205120 (= e!684374 tp_is_empty!30621)))

(declare-fun mapNonEmpty!47790 () Bool)

(declare-fun tp!90760 () Bool)

(declare-fun e!684373 () Bool)

(assert (=> mapNonEmpty!47790 (= mapRes!47790 (and tp!90760 e!684373))))

(declare-fun mapKey!47790 () (_ BitVec 32))

(declare-fun mapValue!47790 () ValueCell!14601)

(declare-fun mapRest!47790 () (Array (_ BitVec 32) ValueCell!14601))

(assert (=> mapNonEmpty!47790 (= mapRest!47784 (store mapRest!47790 mapKey!47790 mapValue!47790))))

(declare-fun b!1205119 () Bool)

(assert (=> b!1205119 (= e!684373 tp_is_empty!30621)))

(assert (= (and mapNonEmpty!47784 condMapEmpty!47790) mapIsEmpty!47790))

(assert (= (and mapNonEmpty!47784 (not condMapEmpty!47790)) mapNonEmpty!47790))

(assert (= (and mapNonEmpty!47790 ((_ is ValueCellFull!14601) mapValue!47790)) b!1205119))

(assert (= (and mapNonEmpty!47784 ((_ is ValueCellFull!14601) mapDefault!47790)) b!1205120))

(declare-fun m!1111155 () Bool)

(assert (=> mapNonEmpty!47790 m!1111155))

(declare-fun b_lambda!21299 () Bool)

(assert (= b_lambda!21289 (or (and start!100716 b_free!25917) b_lambda!21299)))

(declare-fun b_lambda!21301 () Bool)

(assert (= b_lambda!21293 (or (and start!100716 b_free!25917) b_lambda!21301)))

(declare-fun b_lambda!21303 () Bool)

(assert (= b_lambda!21287 (or (and start!100716 b_free!25917) b_lambda!21303)))

(declare-fun b_lambda!21305 () Bool)

(assert (= b_lambda!21285 (or (and start!100716 b_free!25917) b_lambda!21305)))

(declare-fun b_lambda!21307 () Bool)

(assert (= b_lambda!21297 (or (and start!100716 b_free!25917) b_lambda!21307)))

(declare-fun b_lambda!21309 () Bool)

(assert (= b_lambda!21281 (or (and start!100716 b_free!25917) b_lambda!21309)))

(declare-fun b_lambda!21311 () Bool)

(assert (= b_lambda!21291 (or (and start!100716 b_free!25917) b_lambda!21311)))

(declare-fun b_lambda!21313 () Bool)

(assert (= b_lambda!21295 (or (and start!100716 b_free!25917) b_lambda!21313)))

(declare-fun b_lambda!21315 () Bool)

(assert (= b_lambda!21283 (or (and start!100716 b_free!25917) b_lambda!21315)))

(check-sat (not b_next!25917) (not b!1205091) (not b!1205059) (not b!1205057) (not b!1205054) (not bm!58360) (not b!1205048) (not b_lambda!21301) (not b!1205096) (not b!1204996) (not b_lambda!21313) (not b!1205079) (not b_lambda!21311) (not b!1205077) (not b!1204992) (not d!132851) (not d!132847) (not d!132861) (not d!132845) (not d!132883) (not b!1204991) (not d!132871) (not b!1205073) (not d!132837) (not b!1205112) (not b!1205003) (not d!132839) (not bm!58351) (not b!1205088) (not b!1205011) (not bm!58344) (not b!1205080) (not b!1205001) (not b_lambda!21303) (not b!1205013) (not b!1205101) (not d!132857) (not mapNonEmpty!47790) (not d!132863) (not b_lambda!21299) (not b!1205010) tp_is_empty!30621 (not b!1205095) (not b!1205042) (not b!1204964) (not b_lambda!21309) (not bm!58352) (not b!1205044) (not d!132843) (not b!1205014) (not b!1205016) (not bm!58353) (not bm!58359) (not d!132869) (not b!1205043) (not b!1205076) (not b_lambda!21315) (not d!132865) (not b!1205009) (not b!1205093) (not b!1204995) (not b!1205029) (not b!1204994) (not b!1205089) (not b!1205049) (not b!1205006) (not bm!58354) (not b!1204998) (not bm!58348) (not b_lambda!21305) (not b!1205086) (not b!1205063) (not b!1205005) (not b!1205084) (not bm!58343) (not b!1204966) (not b_lambda!21307) (not b!1205061) (not d!132873) (not b_lambda!21279) b_and!42823 (not b!1205081) (not b!1204999) (not b!1205023) (not bm!58347) (not b!1205007) (not b!1205072) (not b!1205098) (not b!1205047) (not d!132835) (not b!1205062) (not b!1205083) (not b!1205100) (not b!1205022) (not b!1205092))
(check-sat b_and!42823 (not b_next!25917))
