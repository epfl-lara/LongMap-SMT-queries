; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97996 () Bool)

(assert start!97996)

(declare-fun b_free!23697 () Bool)

(declare-fun b_next!23697 () Bool)

(assert (=> start!97996 (= b_free!23697 (not b_next!23697))))

(declare-fun tp!83794 () Bool)

(declare-fun b_and!38177 () Bool)

(assert (=> start!97996 (= tp!83794 b_and!38177)))

(declare-fun b!1123954 () Bool)

(declare-fun e!639849 () Bool)

(declare-fun e!639848 () Bool)

(assert (=> b!1123954 (= e!639849 e!639848)))

(declare-fun res!750946 () Bool)

(assert (=> b!1123954 (=> res!750946 e!639848)))

(declare-datatypes ((array!73321 0))(
  ( (array!73322 (arr!35313 (Array (_ BitVec 32) (_ BitVec 64))) (size!35849 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73321)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1123954 (= res!750946 (not (= (select (arr!35313 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639843 () Bool)

(assert (=> b!1123954 e!639843))

(declare-fun c!109536 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123954 (= c!109536 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42763 0))(
  ( (V!42764 (val!14170 Int)) )
))
(declare-fun zeroValue!944 () V!42763)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36850 0))(
  ( (Unit!36851) )
))
(declare-fun lt!499275 () Unit!36850)

(declare-datatypes ((ValueCell!13404 0))(
  ( (ValueCellFull!13404 (v!16803 V!42763)) (EmptyCell!13404) )
))
(declare-datatypes ((array!73323 0))(
  ( (array!73324 (arr!35314 (Array (_ BitVec 32) ValueCell!13404)) (size!35850 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73323)

(declare-fun minValue!944 () V!42763)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 (array!73321 array!73323 (_ BitVec 32) (_ BitVec 32) V!42763 V!42763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36850)

(assert (=> b!1123954 (= lt!499275 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123955 () Bool)

(declare-fun e!639846 () Bool)

(declare-fun e!639850 () Bool)

(declare-fun mapRes!44158 () Bool)

(assert (=> b!1123955 (= e!639846 (and e!639850 mapRes!44158))))

(declare-fun condMapEmpty!44158 () Bool)

(declare-fun mapDefault!44158 () ValueCell!13404)

(assert (=> b!1123955 (= condMapEmpty!44158 (= (arr!35314 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13404)) mapDefault!44158)))))

(declare-fun b!1123956 () Bool)

(declare-fun e!639842 () Bool)

(assert (=> b!1123956 (= e!639848 e!639842)))

(declare-fun res!750955 () Bool)

(assert (=> b!1123956 (=> res!750955 e!639842)))

(declare-datatypes ((tuple2!17796 0))(
  ( (tuple2!17797 (_1!8909 (_ BitVec 64)) (_2!8909 V!42763)) )
))
(declare-datatypes ((List!24575 0))(
  ( (Nil!24572) (Cons!24571 (h!25780 tuple2!17796) (t!35264 List!24575)) )
))
(declare-datatypes ((ListLongMap!15765 0))(
  ( (ListLongMap!15766 (toList!7898 List!24575)) )
))
(declare-fun lt!499278 () ListLongMap!15765)

(declare-fun contains!6437 (ListLongMap!15765 (_ BitVec 64)) Bool)

(assert (=> b!1123956 (= res!750955 (not (contains!6437 lt!499278 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4386 (array!73321 array!73323 (_ BitVec 32) (_ BitVec 32) V!42763 V!42763 (_ BitVec 32) Int) ListLongMap!15765)

(assert (=> b!1123956 (= lt!499278 (getCurrentListMapNoExtraKeys!4386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123957 () Bool)

(declare-fun res!750954 () Bool)

(assert (=> b!1123957 (=> res!750954 e!639842)))

(assert (=> b!1123957 (= res!750954 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1123958 () Bool)

(declare-fun e!639844 () Bool)

(assert (=> b!1123958 (= e!639844 e!639849)))

(declare-fun res!750941 () Bool)

(assert (=> b!1123958 (=> res!750941 e!639849)))

(assert (=> b!1123958 (= res!750941 (not (= from!1455 i!673)))))

(declare-fun lt!499273 () array!73323)

(declare-fun lt!499279 () array!73321)

(declare-fun lt!499277 () ListLongMap!15765)

(assert (=> b!1123958 (= lt!499277 (getCurrentListMapNoExtraKeys!4386 lt!499279 lt!499273 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2482 (Int (_ BitVec 64)) V!42763)

(assert (=> b!1123958 (= lt!499273 (array!73324 (store (arr!35314 _values!996) i!673 (ValueCellFull!13404 (dynLambda!2482 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35850 _values!996)))))

(declare-fun lt!499276 () ListLongMap!15765)

(assert (=> b!1123958 (= lt!499276 (getCurrentListMapNoExtraKeys!4386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47370 () Bool)

(declare-fun call!47373 () ListLongMap!15765)

(assert (=> bm!47370 (= call!47373 (getCurrentListMapNoExtraKeys!4386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123959 () Bool)

(declare-fun res!750949 () Bool)

(declare-fun e!639852 () Bool)

(assert (=> b!1123959 (=> (not res!750949) (not e!639852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123959 (= res!750949 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44158 () Bool)

(assert (=> mapIsEmpty!44158 mapRes!44158))

(declare-fun b!1123960 () Bool)

(declare-fun res!750947 () Bool)

(assert (=> b!1123960 (=> (not res!750947) (not e!639852))))

(assert (=> b!1123960 (= res!750947 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35849 _keys!1208))))))

(declare-fun mapNonEmpty!44158 () Bool)

(declare-fun tp!83795 () Bool)

(declare-fun e!639851 () Bool)

(assert (=> mapNonEmpty!44158 (= mapRes!44158 (and tp!83795 e!639851))))

(declare-fun mapKey!44158 () (_ BitVec 32))

(declare-fun mapRest!44158 () (Array (_ BitVec 32) ValueCell!13404))

(declare-fun mapValue!44158 () ValueCell!13404)

(assert (=> mapNonEmpty!44158 (= (arr!35314 _values!996) (store mapRest!44158 mapKey!44158 mapValue!44158))))

(declare-fun res!750953 () Bool)

(assert (=> start!97996 (=> (not res!750953) (not e!639852))))

(assert (=> start!97996 (= res!750953 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35849 _keys!1208))))))

(assert (=> start!97996 e!639852))

(declare-fun tp_is_empty!28227 () Bool)

(assert (=> start!97996 tp_is_empty!28227))

(declare-fun array_inv!27108 (array!73321) Bool)

(assert (=> start!97996 (array_inv!27108 _keys!1208)))

(assert (=> start!97996 true))

(assert (=> start!97996 tp!83794))

(declare-fun array_inv!27109 (array!73323) Bool)

(assert (=> start!97996 (and (array_inv!27109 _values!996) e!639846)))

(declare-fun b!1123961 () Bool)

(assert (=> b!1123961 (= e!639842 true)))

(declare-fun +!3409 (ListLongMap!15765 tuple2!17796) ListLongMap!15765)

(assert (=> b!1123961 (contains!6437 (+!3409 lt!499278 (tuple2!17797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499274 () Unit!36850)

(declare-fun addStillContains!671 (ListLongMap!15765 (_ BitVec 64) V!42763 (_ BitVec 64)) Unit!36850)

(assert (=> b!1123961 (= lt!499274 (addStillContains!671 lt!499278 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1123962 () Bool)

(declare-fun res!750945 () Bool)

(assert (=> b!1123962 (=> (not res!750945) (not e!639852))))

(assert (=> b!1123962 (= res!750945 (and (= (size!35850 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35849 _keys!1208) (size!35850 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123963 () Bool)

(declare-fun res!750942 () Bool)

(assert (=> b!1123963 (=> (not res!750942) (not e!639852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73321 (_ BitVec 32)) Bool)

(assert (=> b!1123963 (= res!750942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47371 () Bool)

(declare-fun call!47374 () ListLongMap!15765)

(assert (=> bm!47371 (= call!47374 (getCurrentListMapNoExtraKeys!4386 lt!499279 lt!499273 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123964 () Bool)

(declare-fun res!750943 () Bool)

(assert (=> b!1123964 (=> (not res!750943) (not e!639852))))

(assert (=> b!1123964 (= res!750943 (= (select (arr!35313 _keys!1208) i!673) k0!934))))

(declare-fun b!1123965 () Bool)

(declare-fun e!639845 () Bool)

(assert (=> b!1123965 (= e!639845 (not e!639844))))

(declare-fun res!750951 () Bool)

(assert (=> b!1123965 (=> res!750951 e!639844)))

(assert (=> b!1123965 (= res!750951 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123965 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499280 () Unit!36850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73321 (_ BitVec 64) (_ BitVec 32)) Unit!36850)

(assert (=> b!1123965 (= lt!499280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123966 () Bool)

(declare-fun -!1103 (ListLongMap!15765 (_ BitVec 64)) ListLongMap!15765)

(assert (=> b!1123966 (= e!639843 (= call!47374 (-!1103 call!47373 k0!934)))))

(declare-fun b!1123967 () Bool)

(declare-fun res!750952 () Bool)

(assert (=> b!1123967 (=> (not res!750952) (not e!639845))))

(declare-datatypes ((List!24576 0))(
  ( (Nil!24573) (Cons!24572 (h!25781 (_ BitVec 64)) (t!35265 List!24576)) )
))
(declare-fun arrayNoDuplicates!0 (array!73321 (_ BitVec 32) List!24576) Bool)

(assert (=> b!1123967 (= res!750952 (arrayNoDuplicates!0 lt!499279 #b00000000000000000000000000000000 Nil!24573))))

(declare-fun b!1123968 () Bool)

(assert (=> b!1123968 (= e!639851 tp_is_empty!28227)))

(declare-fun b!1123969 () Bool)

(assert (=> b!1123969 (= e!639843 (= call!47374 call!47373))))

(declare-fun b!1123970 () Bool)

(assert (=> b!1123970 (= e!639850 tp_is_empty!28227)))

(declare-fun b!1123971 () Bool)

(declare-fun res!750944 () Bool)

(assert (=> b!1123971 (=> (not res!750944) (not e!639852))))

(assert (=> b!1123971 (= res!750944 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24573))))

(declare-fun b!1123972 () Bool)

(declare-fun res!750948 () Bool)

(assert (=> b!1123972 (=> (not res!750948) (not e!639852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123972 (= res!750948 (validKeyInArray!0 k0!934))))

(declare-fun b!1123973 () Bool)

(assert (=> b!1123973 (= e!639852 e!639845)))

(declare-fun res!750950 () Bool)

(assert (=> b!1123973 (=> (not res!750950) (not e!639845))))

(assert (=> b!1123973 (= res!750950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499279 mask!1564))))

(assert (=> b!1123973 (= lt!499279 (array!73322 (store (arr!35313 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35849 _keys!1208)))))

(assert (= (and start!97996 res!750953) b!1123959))

(assert (= (and b!1123959 res!750949) b!1123962))

(assert (= (and b!1123962 res!750945) b!1123963))

(assert (= (and b!1123963 res!750942) b!1123971))

(assert (= (and b!1123971 res!750944) b!1123960))

(assert (= (and b!1123960 res!750947) b!1123972))

(assert (= (and b!1123972 res!750948) b!1123964))

(assert (= (and b!1123964 res!750943) b!1123973))

(assert (= (and b!1123973 res!750950) b!1123967))

(assert (= (and b!1123967 res!750952) b!1123965))

(assert (= (and b!1123965 (not res!750951)) b!1123958))

(assert (= (and b!1123958 (not res!750941)) b!1123954))

(assert (= (and b!1123954 c!109536) b!1123966))

(assert (= (and b!1123954 (not c!109536)) b!1123969))

(assert (= (or b!1123966 b!1123969) bm!47370))

(assert (= (or b!1123966 b!1123969) bm!47371))

(assert (= (and b!1123954 (not res!750946)) b!1123956))

(assert (= (and b!1123956 (not res!750955)) b!1123957))

(assert (= (and b!1123957 (not res!750954)) b!1123961))

(assert (= (and b!1123955 condMapEmpty!44158) mapIsEmpty!44158))

(assert (= (and b!1123955 (not condMapEmpty!44158)) mapNonEmpty!44158))

(get-info :version)

(assert (= (and mapNonEmpty!44158 ((_ is ValueCellFull!13404) mapValue!44158)) b!1123968))

(assert (= (and b!1123955 ((_ is ValueCellFull!13404) mapDefault!44158)) b!1123970))

(assert (= start!97996 b!1123955))

(declare-fun b_lambda!18667 () Bool)

(assert (=> (not b_lambda!18667) (not b!1123958)))

(declare-fun t!35263 () Bool)

(declare-fun tb!8509 () Bool)

(assert (=> (and start!97996 (= defaultEntry!1004 defaultEntry!1004) t!35263) tb!8509))

(declare-fun result!17579 () Bool)

(assert (=> tb!8509 (= result!17579 tp_is_empty!28227)))

(assert (=> b!1123958 t!35263))

(declare-fun b_and!38179 () Bool)

(assert (= b_and!38177 (and (=> t!35263 result!17579) b_and!38179)))

(declare-fun m!1038329 () Bool)

(assert (=> b!1123954 m!1038329))

(declare-fun m!1038331 () Bool)

(assert (=> b!1123954 m!1038331))

(declare-fun m!1038333 () Bool)

(assert (=> start!97996 m!1038333))

(declare-fun m!1038335 () Bool)

(assert (=> start!97996 m!1038335))

(declare-fun m!1038337 () Bool)

(assert (=> b!1123959 m!1038337))

(declare-fun m!1038339 () Bool)

(assert (=> b!1123972 m!1038339))

(declare-fun m!1038341 () Bool)

(assert (=> b!1123956 m!1038341))

(declare-fun m!1038343 () Bool)

(assert (=> b!1123956 m!1038343))

(declare-fun m!1038345 () Bool)

(assert (=> b!1123964 m!1038345))

(declare-fun m!1038347 () Bool)

(assert (=> b!1123961 m!1038347))

(assert (=> b!1123961 m!1038347))

(declare-fun m!1038349 () Bool)

(assert (=> b!1123961 m!1038349))

(declare-fun m!1038351 () Bool)

(assert (=> b!1123961 m!1038351))

(declare-fun m!1038353 () Bool)

(assert (=> b!1123973 m!1038353))

(declare-fun m!1038355 () Bool)

(assert (=> b!1123973 m!1038355))

(declare-fun m!1038357 () Bool)

(assert (=> b!1123971 m!1038357))

(declare-fun m!1038359 () Bool)

(assert (=> b!1123967 m!1038359))

(declare-fun m!1038361 () Bool)

(assert (=> mapNonEmpty!44158 m!1038361))

(declare-fun m!1038363 () Bool)

(assert (=> b!1123958 m!1038363))

(declare-fun m!1038365 () Bool)

(assert (=> b!1123958 m!1038365))

(declare-fun m!1038367 () Bool)

(assert (=> b!1123958 m!1038367))

(declare-fun m!1038369 () Bool)

(assert (=> b!1123958 m!1038369))

(declare-fun m!1038371 () Bool)

(assert (=> bm!47371 m!1038371))

(assert (=> bm!47370 m!1038343))

(declare-fun m!1038373 () Bool)

(assert (=> b!1123965 m!1038373))

(declare-fun m!1038375 () Bool)

(assert (=> b!1123965 m!1038375))

(declare-fun m!1038377 () Bool)

(assert (=> b!1123966 m!1038377))

(declare-fun m!1038379 () Bool)

(assert (=> b!1123963 m!1038379))

(check-sat (not b!1123963) (not b!1123959) (not b!1123972) (not b!1123967) tp_is_empty!28227 (not b_lambda!18667) (not b!1123966) (not b_next!23697) (not b!1123958) (not b!1123961) (not b!1123956) (not bm!47370) (not start!97996) (not b!1123971) (not bm!47371) (not b!1123954) b_and!38179 (not b!1123965) (not mapNonEmpty!44158) (not b!1123973))
(check-sat b_and!38179 (not b_next!23697))
