; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97306 () Bool)

(assert start!97306)

(declare-fun b_free!23277 () Bool)

(declare-fun b_next!23277 () Bool)

(assert (=> start!97306 (= b_free!23277 (not b_next!23277))))

(declare-fun tp!82129 () Bool)

(declare-fun b_and!37385 () Bool)

(assert (=> start!97306 (= tp!82129 b_and!37385)))

(declare-fun b!1108295 () Bool)

(declare-fun e!632258 () Bool)

(declare-fun e!632264 () Bool)

(assert (=> b!1108295 (= e!632258 (not e!632264))))

(declare-fun res!739635 () Bool)

(assert (=> b!1108295 (=> res!739635 e!632264)))

(declare-datatypes ((array!71991 0))(
  ( (array!71992 (arr!34648 (Array (_ BitVec 32) (_ BitVec 64))) (size!35184 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71991)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108295 (= res!739635 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35184 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36376 0))(
  ( (Unit!36377) )
))
(declare-fun lt!495783 () Unit!36376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71991 (_ BitVec 64) (_ BitVec 32)) Unit!36376)

(assert (=> b!1108295 (= lt!495783 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108296 () Bool)

(declare-fun e!632263 () Bool)

(declare-fun tp_is_empty!27537 () Bool)

(assert (=> b!1108296 (= e!632263 tp_is_empty!27537)))

(declare-fun b!1108297 () Bool)

(assert (=> b!1108297 (= e!632264 true)))

(declare-fun e!632261 () Bool)

(assert (=> b!1108297 e!632261))

(declare-fun c!109095 () Bool)

(assert (=> b!1108297 (= c!109095 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41843 0))(
  ( (V!41844 (val!13825 Int)) )
))
(declare-fun zeroValue!944 () V!41843)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!495784 () Unit!36376)

(declare-datatypes ((ValueCell!13059 0))(
  ( (ValueCellFull!13059 (v!16458 V!41843)) (EmptyCell!13059) )
))
(declare-datatypes ((array!71993 0))(
  ( (array!71994 (arr!34649 (Array (_ BitVec 32) ValueCell!13059)) (size!35185 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71993)

(declare-fun minValue!944 () V!41843)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 (array!71991 array!71993 (_ BitVec 32) (_ BitVec 32) V!41843 V!41843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36376)

(assert (=> b!1108297 (= lt!495784 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108299 () Bool)

(declare-fun e!632259 () Bool)

(assert (=> b!1108299 (= e!632259 e!632258)))

(declare-fun res!739636 () Bool)

(assert (=> b!1108299 (=> (not res!739636) (not e!632258))))

(declare-fun lt!495785 () array!71991)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71991 (_ BitVec 32)) Bool)

(assert (=> b!1108299 (= res!739636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495785 mask!1564))))

(assert (=> b!1108299 (= lt!495785 (array!71992 (store (arr!34648 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35184 _keys!1208)))))

(declare-datatypes ((tuple2!17472 0))(
  ( (tuple2!17473 (_1!8747 (_ BitVec 64)) (_2!8747 V!41843)) )
))
(declare-datatypes ((List!24155 0))(
  ( (Nil!24152) (Cons!24151 (h!25360 tuple2!17472) (t!34478 List!24155)) )
))
(declare-datatypes ((ListLongMap!15441 0))(
  ( (ListLongMap!15442 (toList!7736 List!24155)) )
))
(declare-fun call!46528 () ListLongMap!15441)

(declare-fun call!46527 () ListLongMap!15441)

(declare-fun b!1108300 () Bool)

(declare-fun -!1015 (ListLongMap!15441 (_ BitVec 64)) ListLongMap!15441)

(assert (=> b!1108300 (= e!632261 (= call!46528 (-!1015 call!46527 k0!934)))))

(declare-fun b!1108301 () Bool)

(declare-fun e!632262 () Bool)

(declare-fun mapRes!43123 () Bool)

(assert (=> b!1108301 (= e!632262 (and e!632263 mapRes!43123))))

(declare-fun condMapEmpty!43123 () Bool)

(declare-fun mapDefault!43123 () ValueCell!13059)

(assert (=> b!1108301 (= condMapEmpty!43123 (= (arr!34649 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13059)) mapDefault!43123)))))

(declare-fun mapIsEmpty!43123 () Bool)

(assert (=> mapIsEmpty!43123 mapRes!43123))

(declare-fun b!1108302 () Bool)

(declare-fun res!739637 () Bool)

(assert (=> b!1108302 (=> (not res!739637) (not e!632258))))

(declare-datatypes ((List!24156 0))(
  ( (Nil!24153) (Cons!24152 (h!25361 (_ BitVec 64)) (t!34479 List!24156)) )
))
(declare-fun arrayNoDuplicates!0 (array!71991 (_ BitVec 32) List!24156) Bool)

(assert (=> b!1108302 (= res!739637 (arrayNoDuplicates!0 lt!495785 #b00000000000000000000000000000000 Nil!24153))))

(declare-fun bm!46524 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4232 (array!71991 array!71993 (_ BitVec 32) (_ BitVec 32) V!41843 V!41843 (_ BitVec 32) Int) ListLongMap!15441)

(assert (=> bm!46524 (= call!46527 (getCurrentListMapNoExtraKeys!4232 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43123 () Bool)

(declare-fun tp!82130 () Bool)

(declare-fun e!632265 () Bool)

(assert (=> mapNonEmpty!43123 (= mapRes!43123 (and tp!82130 e!632265))))

(declare-fun mapKey!43123 () (_ BitVec 32))

(declare-fun mapValue!43123 () ValueCell!13059)

(declare-fun mapRest!43123 () (Array (_ BitVec 32) ValueCell!13059))

(assert (=> mapNonEmpty!43123 (= (arr!34649 _values!996) (store mapRest!43123 mapKey!43123 mapValue!43123))))

(declare-fun b!1108303 () Bool)

(declare-fun res!739643 () Bool)

(assert (=> b!1108303 (=> (not res!739643) (not e!632259))))

(assert (=> b!1108303 (= res!739643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108304 () Bool)

(declare-fun res!739644 () Bool)

(assert (=> b!1108304 (=> (not res!739644) (not e!632259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108304 (= res!739644 (validKeyInArray!0 k0!934))))

(declare-fun b!1108305 () Bool)

(declare-fun res!739639 () Bool)

(assert (=> b!1108305 (=> (not res!739639) (not e!632259))))

(assert (=> b!1108305 (= res!739639 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35184 _keys!1208))))))

(declare-fun bm!46525 () Bool)

(declare-fun dynLambda!2364 (Int (_ BitVec 64)) V!41843)

(assert (=> bm!46525 (= call!46528 (getCurrentListMapNoExtraKeys!4232 lt!495785 (array!71994 (store (arr!34649 _values!996) i!673 (ValueCellFull!13059 (dynLambda!2364 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35185 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108306 () Bool)

(declare-fun res!739642 () Bool)

(assert (=> b!1108306 (=> (not res!739642) (not e!632259))))

(assert (=> b!1108306 (= res!739642 (and (= (size!35185 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35184 _keys!1208) (size!35185 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108307 () Bool)

(assert (=> b!1108307 (= e!632261 (= call!46528 call!46527))))

(declare-fun b!1108308 () Bool)

(declare-fun res!739640 () Bool)

(assert (=> b!1108308 (=> (not res!739640) (not e!632259))))

(assert (=> b!1108308 (= res!739640 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24153))))

(declare-fun res!739638 () Bool)

(assert (=> start!97306 (=> (not res!739638) (not e!632259))))

(assert (=> start!97306 (= res!739638 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35184 _keys!1208))))))

(assert (=> start!97306 e!632259))

(assert (=> start!97306 tp_is_empty!27537))

(declare-fun array_inv!26666 (array!71991) Bool)

(assert (=> start!97306 (array_inv!26666 _keys!1208)))

(assert (=> start!97306 true))

(assert (=> start!97306 tp!82129))

(declare-fun array_inv!26667 (array!71993) Bool)

(assert (=> start!97306 (and (array_inv!26667 _values!996) e!632262)))

(declare-fun b!1108298 () Bool)

(declare-fun res!739645 () Bool)

(assert (=> b!1108298 (=> (not res!739645) (not e!632259))))

(assert (=> b!1108298 (= res!739645 (= (select (arr!34648 _keys!1208) i!673) k0!934))))

(declare-fun b!1108309 () Bool)

(declare-fun res!739641 () Bool)

(assert (=> b!1108309 (=> (not res!739641) (not e!632259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108309 (= res!739641 (validMask!0 mask!1564))))

(declare-fun b!1108310 () Bool)

(assert (=> b!1108310 (= e!632265 tp_is_empty!27537)))

(assert (= (and start!97306 res!739638) b!1108309))

(assert (= (and b!1108309 res!739641) b!1108306))

(assert (= (and b!1108306 res!739642) b!1108303))

(assert (= (and b!1108303 res!739643) b!1108308))

(assert (= (and b!1108308 res!739640) b!1108305))

(assert (= (and b!1108305 res!739639) b!1108304))

(assert (= (and b!1108304 res!739644) b!1108298))

(assert (= (and b!1108298 res!739645) b!1108299))

(assert (= (and b!1108299 res!739636) b!1108302))

(assert (= (and b!1108302 res!739637) b!1108295))

(assert (= (and b!1108295 (not res!739635)) b!1108297))

(assert (= (and b!1108297 c!109095) b!1108300))

(assert (= (and b!1108297 (not c!109095)) b!1108307))

(assert (= (or b!1108300 b!1108307) bm!46525))

(assert (= (or b!1108300 b!1108307) bm!46524))

(assert (= (and b!1108301 condMapEmpty!43123) mapIsEmpty!43123))

(assert (= (and b!1108301 (not condMapEmpty!43123)) mapNonEmpty!43123))

(get-info :version)

(assert (= (and mapNonEmpty!43123 ((_ is ValueCellFull!13059) mapValue!43123)) b!1108310))

(assert (= (and b!1108301 ((_ is ValueCellFull!13059) mapDefault!43123)) b!1108296))

(assert (= start!97306 b!1108301))

(declare-fun b_lambda!18295 () Bool)

(assert (=> (not b_lambda!18295) (not bm!46525)))

(declare-fun t!34477 () Bool)

(declare-fun tb!8143 () Bool)

(assert (=> (and start!97306 (= defaultEntry!1004 defaultEntry!1004) t!34477) tb!8143))

(declare-fun result!16847 () Bool)

(assert (=> tb!8143 (= result!16847 tp_is_empty!27537)))

(assert (=> bm!46525 t!34477))

(declare-fun b_and!37387 () Bool)

(assert (= b_and!37385 (and (=> t!34477 result!16847) b_and!37387)))

(declare-fun m!1026865 () Bool)

(assert (=> start!97306 m!1026865))

(declare-fun m!1026867 () Bool)

(assert (=> start!97306 m!1026867))

(declare-fun m!1026869 () Bool)

(assert (=> mapNonEmpty!43123 m!1026869))

(declare-fun m!1026871 () Bool)

(assert (=> b!1108299 m!1026871))

(declare-fun m!1026873 () Bool)

(assert (=> b!1108299 m!1026873))

(declare-fun m!1026875 () Bool)

(assert (=> b!1108302 m!1026875))

(declare-fun m!1026877 () Bool)

(assert (=> bm!46525 m!1026877))

(declare-fun m!1026879 () Bool)

(assert (=> bm!46525 m!1026879))

(declare-fun m!1026881 () Bool)

(assert (=> bm!46525 m!1026881))

(declare-fun m!1026883 () Bool)

(assert (=> b!1108304 m!1026883))

(declare-fun m!1026885 () Bool)

(assert (=> b!1108303 m!1026885))

(declare-fun m!1026887 () Bool)

(assert (=> b!1108309 m!1026887))

(declare-fun m!1026889 () Bool)

(assert (=> b!1108297 m!1026889))

(declare-fun m!1026891 () Bool)

(assert (=> b!1108300 m!1026891))

(declare-fun m!1026893 () Bool)

(assert (=> bm!46524 m!1026893))

(declare-fun m!1026895 () Bool)

(assert (=> b!1108298 m!1026895))

(declare-fun m!1026897 () Bool)

(assert (=> b!1108308 m!1026897))

(declare-fun m!1026899 () Bool)

(assert (=> b!1108295 m!1026899))

(declare-fun m!1026901 () Bool)

(assert (=> b!1108295 m!1026901))

(check-sat (not b!1108309) (not mapNonEmpty!43123) tp_is_empty!27537 (not bm!46525) (not b!1108304) (not b!1108297) (not b!1108300) (not b!1108303) (not b!1108302) b_and!37387 (not b_lambda!18295) (not b!1108295) (not b_next!23277) (not b!1108299) (not b!1108308) (not start!97306) (not bm!46524))
(check-sat b_and!37387 (not b_next!23277))
