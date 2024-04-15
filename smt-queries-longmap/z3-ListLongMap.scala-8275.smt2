; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100744 () Bool)

(assert start!100744)

(declare-fun b_free!25921 () Bool)

(declare-fun b_next!25921 () Bool)

(assert (=> start!100744 (= b_free!25921 (not b_next!25921))))

(declare-fun tp!90766 () Bool)

(declare-fun b_and!42803 () Bool)

(assert (=> start!100744 (= tp!90766 b_and!42803)))

(declare-datatypes ((V!45961 0))(
  ( (V!45962 (val!15369 Int)) )
))
(declare-datatypes ((tuple2!19782 0))(
  ( (tuple2!19783 (_1!9902 (_ BitVec 64)) (_2!9902 V!45961)) )
))
(declare-datatypes ((List!26567 0))(
  ( (Nil!26564) (Cons!26563 (h!27772 tuple2!19782) (t!39459 List!26567)) )
))
(declare-datatypes ((ListLongMap!17751 0))(
  ( (ListLongMap!17752 (toList!8891 List!26567)) )
))
(declare-fun call!58361 () ListLongMap!17751)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1205053 () Bool)

(declare-fun call!58360 () ListLongMap!17751)

(declare-fun e!684337 () Bool)

(declare-fun -!1782 (ListLongMap!17751 (_ BitVec 64)) ListLongMap!17751)

(assert (=> b!1205053 (= e!684337 (= call!58361 (-!1782 call!58360 k0!934)))))

(declare-fun bm!58354 () Bool)

(declare-datatypes ((Unit!39800 0))(
  ( (Unit!39801) )
))
(declare-fun call!58364 () Unit!39800)

(declare-fun call!58357 () Unit!39800)

(assert (=> bm!58354 (= call!58364 call!58357)))

(declare-fun b!1205054 () Bool)

(declare-fun res!801593 () Bool)

(declare-fun e!684330 () Bool)

(assert (=> b!1205054 (=> (not res!801593) (not e!684330))))

(declare-datatypes ((array!77946 0))(
  ( (array!77947 (arr!37614 (Array (_ BitVec 32) (_ BitVec 64))) (size!38152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77946)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205054 (= res!801593 (= (select (arr!37614 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47793 () Bool)

(declare-fun mapRes!47793 () Bool)

(declare-fun tp!90765 () Bool)

(declare-fun e!684338 () Bool)

(assert (=> mapNonEmpty!47793 (= mapRes!47793 (and tp!90765 e!684338))))

(declare-datatypes ((ValueCell!14603 0))(
  ( (ValueCellFull!14603 (v!18012 V!45961)) (EmptyCell!14603) )
))
(declare-fun mapRest!47793 () (Array (_ BitVec 32) ValueCell!14603))

(declare-fun mapKey!47793 () (_ BitVec 32))

(declare-datatypes ((array!77948 0))(
  ( (array!77949 (arr!37615 (Array (_ BitVec 32) ValueCell!14603)) (size!38153 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77948)

(declare-fun mapValue!47793 () ValueCell!14603)

(assert (=> mapNonEmpty!47793 (= (arr!37615 _values!996) (store mapRest!47793 mapKey!47793 mapValue!47793))))

(declare-fun e!684343 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1205055 () Bool)

(declare-fun arrayContainsKey!0 (array!77946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205055 (= e!684343 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205056 () Bool)

(declare-fun res!801594 () Bool)

(assert (=> b!1205056 (=> (not res!801594) (not e!684330))))

(declare-datatypes ((List!26568 0))(
  ( (Nil!26565) (Cons!26564 (h!27773 (_ BitVec 64)) (t!39460 List!26568)) )
))
(declare-fun arrayNoDuplicates!0 (array!77946 (_ BitVec 32) List!26568) Bool)

(assert (=> b!1205056 (= res!801594 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26565))))

(declare-fun res!801595 () Bool)

(assert (=> start!100744 (=> (not res!801595) (not e!684330))))

(assert (=> start!100744 (= res!801595 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38152 _keys!1208))))))

(assert (=> start!100744 e!684330))

(declare-fun tp_is_empty!30625 () Bool)

(assert (=> start!100744 tp_is_empty!30625))

(declare-fun array_inv!28766 (array!77946) Bool)

(assert (=> start!100744 (array_inv!28766 _keys!1208)))

(assert (=> start!100744 true))

(assert (=> start!100744 tp!90766))

(declare-fun e!684342 () Bool)

(declare-fun array_inv!28767 (array!77948) Bool)

(assert (=> start!100744 (and (array_inv!28767 _values!996) e!684342)))

(declare-fun b!1205057 () Bool)

(declare-fun c!118210 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!546414 () Bool)

(assert (=> b!1205057 (= c!118210 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546414))))

(declare-fun e!684341 () Unit!39800)

(declare-fun e!684334 () Unit!39800)

(assert (=> b!1205057 (= e!684341 e!684334)))

(declare-fun b!1205058 () Bool)

(declare-fun e!684339 () Bool)

(declare-fun e!684332 () Bool)

(assert (=> b!1205058 (= e!684339 e!684332)))

(declare-fun res!801587 () Bool)

(assert (=> b!1205058 (=> res!801587 e!684332)))

(assert (=> b!1205058 (= res!801587 (not (= (select (arr!37614 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1205058 e!684337))

(declare-fun c!118213 () Bool)

(assert (=> b!1205058 (= c!118213 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!45961)

(declare-fun lt!546424 () Unit!39800)

(declare-fun minValue!944 () V!45961)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 (array!77946 array!77948 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39800)

(assert (=> b!1205058 (= lt!546424 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205059 () Bool)

(declare-fun Unit!39802 () Unit!39800)

(assert (=> b!1205059 (= e!684334 Unit!39802)))

(declare-fun bm!58355 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5337 (array!77946 array!77948 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 32) Int) ListLongMap!17751)

(assert (=> bm!58355 (= call!58360 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205060 () Bool)

(declare-fun e!684333 () Bool)

(assert (=> b!1205060 (= e!684333 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!47793 () Bool)

(assert (=> mapIsEmpty!47793 mapRes!47793))

(declare-fun b!1205061 () Bool)

(declare-fun e!684329 () Bool)

(assert (=> b!1205061 (= e!684332 e!684329)))

(declare-fun res!801598 () Bool)

(assert (=> b!1205061 (=> res!801598 e!684329)))

(declare-fun lt!546416 () ListLongMap!17751)

(declare-fun contains!6893 (ListLongMap!17751 (_ BitVec 64)) Bool)

(assert (=> b!1205061 (= res!801598 (not (contains!6893 lt!546416 k0!934)))))

(assert (=> b!1205061 (= lt!546416 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205062 () Bool)

(assert (=> b!1205062 (= e!684343 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546414) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205063 () Bool)

(declare-fun res!801597 () Bool)

(assert (=> b!1205063 (=> (not res!801597) (not e!684330))))

(assert (=> b!1205063 (= res!801597 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38152 _keys!1208))))))

(declare-fun b!1205064 () Bool)

(declare-fun e!684344 () Unit!39800)

(assert (=> b!1205064 (= e!684344 e!684341)))

(declare-fun c!118212 () Bool)

(assert (=> b!1205064 (= c!118212 (and (not lt!546414) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58356 () Bool)

(declare-fun call!58362 () Bool)

(declare-fun call!58358 () Bool)

(assert (=> bm!58356 (= call!58362 call!58358)))

(declare-fun b!1205065 () Bool)

(declare-fun e!684335 () Bool)

(assert (=> b!1205065 (= e!684342 (and e!684335 mapRes!47793))))

(declare-fun condMapEmpty!47793 () Bool)

(declare-fun mapDefault!47793 () ValueCell!14603)

(assert (=> b!1205065 (= condMapEmpty!47793 (= (arr!37615 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14603)) mapDefault!47793)))))

(declare-fun bm!58357 () Bool)

(declare-fun lt!546427 () array!77948)

(declare-fun lt!546419 () array!77946)

(assert (=> bm!58357 (= call!58361 (getCurrentListMapNoExtraKeys!5337 lt!546419 lt!546427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118211 () Bool)

(declare-fun call!58359 () ListLongMap!17751)

(declare-fun lt!546423 () ListLongMap!17751)

(declare-fun bm!58358 () Bool)

(assert (=> bm!58358 (= call!58358 (contains!6893 (ite c!118211 lt!546423 call!58359) k0!934))))

(declare-fun call!58363 () ListLongMap!17751)

(declare-fun bm!58359 () Bool)

(declare-fun +!4022 (ListLongMap!17751 tuple2!19782) ListLongMap!17751)

(assert (=> bm!58359 (= call!58363 (+!4022 (ite c!118211 lt!546423 lt!546416) (ite c!118211 (tuple2!19783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118212 (tuple2!19783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205066 () Bool)

(declare-fun e!684336 () Bool)

(assert (=> b!1205066 (= e!684336 e!684339)))

(declare-fun res!801591 () Bool)

(assert (=> b!1205066 (=> res!801591 e!684339)))

(assert (=> b!1205066 (= res!801591 (not (= from!1455 i!673)))))

(declare-fun lt!546418 () ListLongMap!17751)

(assert (=> b!1205066 (= lt!546418 (getCurrentListMapNoExtraKeys!5337 lt!546419 lt!546427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3207 (Int (_ BitVec 64)) V!45961)

(assert (=> b!1205066 (= lt!546427 (array!77949 (store (arr!37615 _values!996) i!673 (ValueCellFull!14603 (dynLambda!3207 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38153 _values!996)))))

(declare-fun lt!546421 () ListLongMap!17751)

(assert (=> b!1205066 (= lt!546421 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205067 () Bool)

(declare-fun e!684331 () Bool)

(assert (=> b!1205067 (= e!684330 e!684331)))

(declare-fun res!801588 () Bool)

(assert (=> b!1205067 (=> (not res!801588) (not e!684331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77946 (_ BitVec 32)) Bool)

(assert (=> b!1205067 (= res!801588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546419 mask!1564))))

(assert (=> b!1205067 (= lt!546419 (array!77947 (store (arr!37614 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38152 _keys!1208)))))

(declare-fun b!1205068 () Bool)

(assert (=> b!1205068 (= e!684338 tp_is_empty!30625)))

(declare-fun b!1205069 () Bool)

(declare-fun res!801590 () Bool)

(assert (=> b!1205069 (=> (not res!801590) (not e!684331))))

(assert (=> b!1205069 (= res!801590 (arrayNoDuplicates!0 lt!546419 #b00000000000000000000000000000000 Nil!26565))))

(declare-fun b!1205070 () Bool)

(declare-fun res!801592 () Bool)

(assert (=> b!1205070 (=> (not res!801592) (not e!684330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205070 (= res!801592 (validMask!0 mask!1564))))

(declare-fun b!1205071 () Bool)

(assert (=> b!1205071 (= e!684335 tp_is_empty!30625)))

(declare-fun b!1205072 () Bool)

(declare-fun res!801601 () Bool)

(assert (=> b!1205072 (=> (not res!801601) (not e!684330))))

(assert (=> b!1205072 (= res!801601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205073 () Bool)

(declare-fun lt!546420 () Unit!39800)

(assert (=> b!1205073 (= e!684334 lt!546420)))

(assert (=> b!1205073 (= lt!546420 call!58364)))

(assert (=> b!1205073 call!58362))

(declare-fun b!1205074 () Bool)

(assert (=> b!1205074 (= e!684329 true)))

(assert (=> b!1205074 e!684333))

(declare-fun res!801596 () Bool)

(assert (=> b!1205074 (=> (not res!801596) (not e!684333))))

(assert (=> b!1205074 (= res!801596 e!684343)))

(declare-fun c!118209 () Bool)

(assert (=> b!1205074 (= c!118209 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546425 () Unit!39800)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!558 (array!77946 array!77948 (_ BitVec 32) (_ BitVec 32) V!45961 V!45961 (_ BitVec 64) (_ BitVec 32) Int) Unit!39800)

(assert (=> b!1205074 (= lt!546425 (lemmaListMapContainsThenArrayContainsFrom!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546413 () Unit!39800)

(assert (=> b!1205074 (= lt!546413 e!684344)))

(assert (=> b!1205074 (= c!118211 (and (not lt!546414) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205074 (= lt!546414 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205075 () Bool)

(declare-fun res!801600 () Bool)

(assert (=> b!1205075 (=> (not res!801600) (not e!684330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205075 (= res!801600 (validKeyInArray!0 k0!934))))

(declare-fun bm!58360 () Bool)

(assert (=> bm!58360 (= call!58359 call!58363)))

(declare-fun b!1205076 () Bool)

(declare-fun res!801589 () Bool)

(assert (=> b!1205076 (=> (not res!801589) (not e!684330))))

(assert (=> b!1205076 (= res!801589 (and (= (size!38153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38152 _keys!1208) (size!38153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205077 () Bool)

(assert (=> b!1205077 (= e!684337 (= call!58361 call!58360))))

(declare-fun bm!58361 () Bool)

(declare-fun addStillContains!1005 (ListLongMap!17751 (_ BitVec 64) V!45961 (_ BitVec 64)) Unit!39800)

(assert (=> bm!58361 (= call!58357 (addStillContains!1005 lt!546416 (ite (or c!118211 c!118212) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118211 c!118212) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1205078 () Bool)

(assert (=> b!1205078 call!58362))

(declare-fun lt!546415 () Unit!39800)

(assert (=> b!1205078 (= lt!546415 call!58364)))

(assert (=> b!1205078 (= e!684341 lt!546415)))

(declare-fun b!1205079 () Bool)

(declare-fun lt!546417 () Unit!39800)

(assert (=> b!1205079 (= e!684344 lt!546417)))

(declare-fun lt!546426 () Unit!39800)

(assert (=> b!1205079 (= lt!546426 call!58357)))

(assert (=> b!1205079 (= lt!546423 (+!4022 lt!546416 (tuple2!19783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205079 call!58358))

(assert (=> b!1205079 (= lt!546417 (addStillContains!1005 lt!546423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1205079 (contains!6893 call!58363 k0!934)))

(declare-fun b!1205080 () Bool)

(assert (=> b!1205080 (= e!684331 (not e!684336))))

(declare-fun res!801599 () Bool)

(assert (=> b!1205080 (=> res!801599 e!684336)))

(assert (=> b!1205080 (= res!801599 (bvsgt from!1455 i!673))))

(assert (=> b!1205080 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546422 () Unit!39800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77946 (_ BitVec 64) (_ BitVec 32)) Unit!39800)

(assert (=> b!1205080 (= lt!546422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100744 res!801595) b!1205070))

(assert (= (and b!1205070 res!801592) b!1205076))

(assert (= (and b!1205076 res!801589) b!1205072))

(assert (= (and b!1205072 res!801601) b!1205056))

(assert (= (and b!1205056 res!801594) b!1205063))

(assert (= (and b!1205063 res!801597) b!1205075))

(assert (= (and b!1205075 res!801600) b!1205054))

(assert (= (and b!1205054 res!801593) b!1205067))

(assert (= (and b!1205067 res!801588) b!1205069))

(assert (= (and b!1205069 res!801590) b!1205080))

(assert (= (and b!1205080 (not res!801599)) b!1205066))

(assert (= (and b!1205066 (not res!801591)) b!1205058))

(assert (= (and b!1205058 c!118213) b!1205053))

(assert (= (and b!1205058 (not c!118213)) b!1205077))

(assert (= (or b!1205053 b!1205077) bm!58357))

(assert (= (or b!1205053 b!1205077) bm!58355))

(assert (= (and b!1205058 (not res!801587)) b!1205061))

(assert (= (and b!1205061 (not res!801598)) b!1205074))

(assert (= (and b!1205074 c!118211) b!1205079))

(assert (= (and b!1205074 (not c!118211)) b!1205064))

(assert (= (and b!1205064 c!118212) b!1205078))

(assert (= (and b!1205064 (not c!118212)) b!1205057))

(assert (= (and b!1205057 c!118210) b!1205073))

(assert (= (and b!1205057 (not c!118210)) b!1205059))

(assert (= (or b!1205078 b!1205073) bm!58354))

(assert (= (or b!1205078 b!1205073) bm!58360))

(assert (= (or b!1205078 b!1205073) bm!58356))

(assert (= (or b!1205079 bm!58356) bm!58358))

(assert (= (or b!1205079 bm!58354) bm!58361))

(assert (= (or b!1205079 bm!58360) bm!58359))

(assert (= (and b!1205074 c!118209) b!1205055))

(assert (= (and b!1205074 (not c!118209)) b!1205062))

(assert (= (and b!1205074 res!801596) b!1205060))

(assert (= (and b!1205065 condMapEmpty!47793) mapIsEmpty!47793))

(assert (= (and b!1205065 (not condMapEmpty!47793)) mapNonEmpty!47793))

(get-info :version)

(assert (= (and mapNonEmpty!47793 ((_ is ValueCellFull!14603) mapValue!47793)) b!1205068))

(assert (= (and b!1205065 ((_ is ValueCellFull!14603) mapDefault!47793)) b!1205071))

(assert (= start!100744 b!1205065))

(declare-fun b_lambda!21299 () Bool)

(assert (=> (not b_lambda!21299) (not b!1205066)))

(declare-fun t!39458 () Bool)

(declare-fun tb!10713 () Bool)

(assert (=> (and start!100744 (= defaultEntry!1004 defaultEntry!1004) t!39458) tb!10713))

(declare-fun result!22019 () Bool)

(assert (=> tb!10713 (= result!22019 tp_is_empty!30625)))

(assert (=> b!1205066 t!39458))

(declare-fun b_and!42805 () Bool)

(assert (= b_and!42803 (and (=> t!39458 result!22019) b_and!42805)))

(declare-fun m!1110543 () Bool)

(assert (=> b!1205080 m!1110543))

(declare-fun m!1110545 () Bool)

(assert (=> b!1205080 m!1110545))

(declare-fun m!1110547 () Bool)

(assert (=> b!1205054 m!1110547))

(declare-fun m!1110549 () Bool)

(assert (=> b!1205070 m!1110549))

(declare-fun m!1110551 () Bool)

(assert (=> start!100744 m!1110551))

(declare-fun m!1110553 () Bool)

(assert (=> start!100744 m!1110553))

(declare-fun m!1110555 () Bool)

(assert (=> b!1205058 m!1110555))

(declare-fun m!1110557 () Bool)

(assert (=> b!1205058 m!1110557))

(declare-fun m!1110559 () Bool)

(assert (=> bm!58355 m!1110559))

(declare-fun m!1110561 () Bool)

(assert (=> b!1205072 m!1110561))

(declare-fun m!1110563 () Bool)

(assert (=> b!1205074 m!1110563))

(declare-fun m!1110565 () Bool)

(assert (=> b!1205061 m!1110565))

(assert (=> b!1205061 m!1110559))

(declare-fun m!1110567 () Bool)

(assert (=> mapNonEmpty!47793 m!1110567))

(declare-fun m!1110569 () Bool)

(assert (=> b!1205079 m!1110569))

(declare-fun m!1110571 () Bool)

(assert (=> b!1205079 m!1110571))

(declare-fun m!1110573 () Bool)

(assert (=> b!1205079 m!1110573))

(declare-fun m!1110575 () Bool)

(assert (=> b!1205069 m!1110575))

(declare-fun m!1110577 () Bool)

(assert (=> bm!58358 m!1110577))

(declare-fun m!1110579 () Bool)

(assert (=> bm!58357 m!1110579))

(declare-fun m!1110581 () Bool)

(assert (=> bm!58359 m!1110581))

(declare-fun m!1110583 () Bool)

(assert (=> b!1205075 m!1110583))

(declare-fun m!1110585 () Bool)

(assert (=> b!1205055 m!1110585))

(declare-fun m!1110587 () Bool)

(assert (=> b!1205056 m!1110587))

(assert (=> b!1205060 m!1110585))

(declare-fun m!1110589 () Bool)

(assert (=> b!1205066 m!1110589))

(declare-fun m!1110591 () Bool)

(assert (=> b!1205066 m!1110591))

(declare-fun m!1110593 () Bool)

(assert (=> b!1205066 m!1110593))

(declare-fun m!1110595 () Bool)

(assert (=> b!1205066 m!1110595))

(declare-fun m!1110597 () Bool)

(assert (=> b!1205067 m!1110597))

(declare-fun m!1110599 () Bool)

(assert (=> b!1205067 m!1110599))

(declare-fun m!1110601 () Bool)

(assert (=> b!1205053 m!1110601))

(declare-fun m!1110603 () Bool)

(assert (=> bm!58361 m!1110603))

(check-sat (not b!1205074) (not b!1205061) (not b!1205070) (not bm!58355) (not mapNonEmpty!47793) (not b!1205067) (not b_lambda!21299) (not b!1205060) (not b!1205072) (not b_next!25921) tp_is_empty!30625 (not b!1205053) (not b!1205055) (not b!1205069) (not start!100744) (not b!1205075) (not b!1205066) (not b!1205080) b_and!42805 (not b!1205058) (not b!1205056) (not bm!58358) (not bm!58357) (not bm!58361) (not b!1205079) (not bm!58359))
(check-sat b_and!42805 (not b_next!25921))
