; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100810 () Bool)

(assert start!100810)

(declare-fun b_free!25897 () Bool)

(declare-fun b_next!25897 () Bool)

(assert (=> start!100810 (= b_free!25897 (not b_next!25897))))

(declare-fun tp!90680 () Bool)

(declare-fun b_and!42683 () Bool)

(assert (=> start!100810 (= tp!90680 b_and!42683)))

(declare-datatypes ((V!45929 0))(
  ( (V!45930 (val!15357 Int)) )
))
(declare-fun zeroValue!944 () V!45929)

(declare-fun c!118180 () Bool)

(declare-datatypes ((tuple2!19700 0))(
  ( (tuple2!19701 (_1!9861 (_ BitVec 64)) (_2!9861 V!45929)) )
))
(declare-datatypes ((List!26511 0))(
  ( (Nil!26508) (Cons!26507 (h!27725 tuple2!19700) (t!39380 List!26511)) )
))
(declare-datatypes ((ListLongMap!17677 0))(
  ( (ListLongMap!17678 (toList!8854 List!26511)) )
))
(declare-fun lt!545865 () ListLongMap!17677)

(declare-fun call!58033 () ListLongMap!17677)

(declare-fun c!118179 () Bool)

(declare-fun lt!545866 () ListLongMap!17677)

(declare-fun bm!58026 () Bool)

(declare-fun minValue!944 () V!45929)

(declare-fun +!4021 (ListLongMap!17677 tuple2!19700) ListLongMap!17677)

(assert (=> bm!58026 (= call!58033 (+!4021 (ite c!118180 lt!545866 lt!545865) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204428 () Bool)

(declare-fun res!801214 () Bool)

(declare-fun e!684021 () Bool)

(assert (=> b!1204428 (=> (not res!801214) (not e!684021))))

(declare-datatypes ((array!78011 0))(
  ( (array!78012 (arr!37644 (Array (_ BitVec 32) (_ BitVec 64))) (size!38181 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78011)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78011 (_ BitVec 32)) Bool)

(assert (=> b!1204428 (= res!801214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!58030 () ListLongMap!17677)

(declare-fun bm!58027 () Bool)

(declare-fun call!58034 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6929 (ListLongMap!17677 (_ BitVec 64)) Bool)

(assert (=> bm!58027 (= call!58034 (contains!6929 (ite c!118180 lt!545866 call!58030) k0!934))))

(declare-fun b!1204429 () Bool)

(declare-fun e!684029 () Bool)

(assert (=> b!1204429 (= e!684021 e!684029)))

(declare-fun res!801218 () Bool)

(assert (=> b!1204429 (=> (not res!801218) (not e!684029))))

(declare-fun lt!545876 () array!78011)

(assert (=> b!1204429 (= res!801218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545876 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204429 (= lt!545876 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))

(declare-fun b!1204430 () Bool)

(declare-fun e!684018 () Bool)

(assert (=> b!1204430 (= e!684029 (not e!684018))))

(declare-fun res!801212 () Bool)

(assert (=> b!1204430 (=> res!801212 e!684018)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1204430 (= res!801212 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204430 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39848 0))(
  ( (Unit!39849) )
))
(declare-fun lt!545873 () Unit!39848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78011 (_ BitVec 64) (_ BitVec 32)) Unit!39848)

(assert (=> b!1204430 (= lt!545873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1204431 () Bool)

(declare-fun e!684028 () Bool)

(declare-fun e!684024 () Bool)

(assert (=> b!1204431 (= e!684028 e!684024)))

(declare-fun res!801220 () Bool)

(assert (=> b!1204431 (=> res!801220 e!684024)))

(assert (=> b!1204431 (= res!801220 (not (= (select (arr!37644 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684022 () Bool)

(assert (=> b!1204431 e!684022))

(declare-fun c!118178 () Bool)

(assert (=> b!1204431 (= c!118178 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545872 () Unit!39848)

(declare-datatypes ((ValueCell!14591 0))(
  ( (ValueCellFull!14591 (v!17991 V!45929)) (EmptyCell!14591) )
))
(declare-datatypes ((array!78013 0))(
  ( (array!78014 (arr!37645 (Array (_ BitVec 32) ValueCell!14591)) (size!38182 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78013)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 (array!78011 array!78013 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39848)

(assert (=> b!1204431 (= lt!545872 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204432 () Bool)

(declare-fun res!801217 () Bool)

(assert (=> b!1204432 (=> (not res!801217) (not e!684021))))

(declare-datatypes ((List!26512 0))(
  ( (Nil!26509) (Cons!26508 (h!27726 (_ BitVec 64)) (t!39381 List!26512)) )
))
(declare-fun arrayNoDuplicates!0 (array!78011 (_ BitVec 32) List!26512) Bool)

(assert (=> b!1204432 (= res!801217 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1204433 () Bool)

(declare-fun res!801213 () Bool)

(assert (=> b!1204433 (=> (not res!801213) (not e!684021))))

(assert (=> b!1204433 (= res!801213 (and (= (size!38182 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38181 _keys!1208) (size!38182 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!58028 () Bool)

(assert (=> bm!58028 (= call!58030 call!58033)))

(declare-fun b!1204434 () Bool)

(declare-fun e!684020 () Bool)

(assert (=> b!1204434 (= e!684024 e!684020)))

(declare-fun res!801207 () Bool)

(assert (=> b!1204434 (=> res!801207 e!684020)))

(assert (=> b!1204434 (= res!801207 (not (contains!6929 lt!545865 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5321 (array!78011 array!78013 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) Int) ListLongMap!17677)

(assert (=> b!1204434 (= lt!545865 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204435 () Bool)

(declare-fun res!801211 () Bool)

(assert (=> b!1204435 (=> (not res!801211) (not e!684029))))

(assert (=> b!1204435 (= res!801211 (arrayNoDuplicates!0 lt!545876 #b00000000000000000000000000000000 Nil!26509))))

(declare-fun b!1204436 () Bool)

(declare-fun res!801210 () Bool)

(assert (=> b!1204436 (=> (not res!801210) (not e!684021))))

(assert (=> b!1204436 (= res!801210 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38181 _keys!1208))))))

(declare-fun b!1204437 () Bool)

(declare-fun e!684017 () Bool)

(declare-fun e!684026 () Bool)

(declare-fun mapRes!47744 () Bool)

(assert (=> b!1204437 (= e!684017 (and e!684026 mapRes!47744))))

(declare-fun condMapEmpty!47744 () Bool)

(declare-fun mapDefault!47744 () ValueCell!14591)

(assert (=> b!1204437 (= condMapEmpty!47744 (= (arr!37645 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47744)))))

(declare-fun res!801219 () Bool)

(assert (=> start!100810 (=> (not res!801219) (not e!684021))))

(assert (=> start!100810 (= res!801219 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38181 _keys!1208))))))

(assert (=> start!100810 e!684021))

(declare-fun tp_is_empty!30601 () Bool)

(assert (=> start!100810 tp_is_empty!30601))

(declare-fun array_inv!28748 (array!78011) Bool)

(assert (=> start!100810 (array_inv!28748 _keys!1208)))

(assert (=> start!100810 true))

(assert (=> start!100810 tp!90680))

(declare-fun array_inv!28749 (array!78013) Bool)

(assert (=> start!100810 (and (array_inv!28749 _values!996) e!684017)))

(declare-fun b!1204438 () Bool)

(declare-fun res!801208 () Bool)

(assert (=> b!1204438 (=> (not res!801208) (not e!684021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204438 (= res!801208 (validMask!0 mask!1564))))

(declare-fun bm!58029 () Bool)

(declare-fun call!58035 () Unit!39848)

(declare-fun call!58029 () Unit!39848)

(assert (=> bm!58029 (= call!58035 call!58029)))

(declare-fun b!1204439 () Bool)

(declare-fun e!684023 () Unit!39848)

(declare-fun e!684025 () Unit!39848)

(assert (=> b!1204439 (= e!684023 e!684025)))

(declare-fun lt!545871 () Bool)

(assert (=> b!1204439 (= c!118179 (and (not lt!545871) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!47744 () Bool)

(assert (=> mapIsEmpty!47744 mapRes!47744))

(declare-fun call!58031 () ListLongMap!17677)

(declare-fun bm!58030 () Bool)

(declare-fun lt!545863 () array!78013)

(assert (=> bm!58030 (= call!58031 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204440 () Bool)

(declare-fun c!118177 () Bool)

(assert (=> b!1204440 (= c!118177 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545871))))

(declare-fun e!684016 () Unit!39848)

(assert (=> b!1204440 (= e!684025 e!684016)))

(declare-fun bm!58031 () Bool)

(declare-fun call!58036 () Bool)

(assert (=> bm!58031 (= call!58036 call!58034)))

(declare-fun b!1204441 () Bool)

(declare-fun lt!545868 () Unit!39848)

(assert (=> b!1204441 (= e!684023 lt!545868)))

(declare-fun lt!545870 () Unit!39848)

(declare-fun addStillContains!1006 (ListLongMap!17677 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39848)

(assert (=> b!1204441 (= lt!545870 (addStillContains!1006 lt!545865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1204441 (= lt!545866 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1204441 call!58034))

(assert (=> b!1204441 (= lt!545868 call!58029)))

(assert (=> b!1204441 (contains!6929 call!58033 k0!934)))

(declare-fun b!1204442 () Bool)

(declare-fun lt!545867 () Unit!39848)

(assert (=> b!1204442 (= e!684016 lt!545867)))

(assert (=> b!1204442 (= lt!545867 call!58035)))

(assert (=> b!1204442 call!58036))

(declare-fun b!1204443 () Bool)

(declare-fun res!801215 () Bool)

(assert (=> b!1204443 (=> (not res!801215) (not e!684021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204443 (= res!801215 (validKeyInArray!0 k0!934))))

(declare-fun b!1204444 () Bool)

(assert (=> b!1204444 (= e!684026 tp_is_empty!30601)))

(declare-fun b!1204445 () Bool)

(declare-fun Unit!39850 () Unit!39848)

(assert (=> b!1204445 (= e!684016 Unit!39850)))

(declare-fun b!1204446 () Bool)

(declare-fun res!801216 () Bool)

(assert (=> b!1204446 (=> (not res!801216) (not e!684021))))

(assert (=> b!1204446 (= res!801216 (= (select (arr!37644 _keys!1208) i!673) k0!934))))

(declare-fun bm!58032 () Bool)

(assert (=> bm!58032 (= call!58029 (addStillContains!1006 (ite c!118180 lt!545866 lt!545865) (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1204447 () Bool)

(assert (=> b!1204447 (= e!684020 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208))))))

(declare-fun lt!545864 () Unit!39848)

(assert (=> b!1204447 (= lt!545864 e!684023)))

(assert (=> b!1204447 (= c!118180 (and (not lt!545871) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204447 (= lt!545871 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58033 () Bool)

(declare-fun call!58032 () ListLongMap!17677)

(assert (=> bm!58033 (= call!58032 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204448 () Bool)

(assert (=> b!1204448 call!58036))

(declare-fun lt!545874 () Unit!39848)

(assert (=> b!1204448 (= lt!545874 call!58035)))

(assert (=> b!1204448 (= e!684025 lt!545874)))

(declare-fun b!1204449 () Bool)

(declare-fun e!684019 () Bool)

(assert (=> b!1204449 (= e!684019 tp_is_empty!30601)))

(declare-fun mapNonEmpty!47744 () Bool)

(declare-fun tp!90681 () Bool)

(assert (=> mapNonEmpty!47744 (= mapRes!47744 (and tp!90681 e!684019))))

(declare-fun mapKey!47744 () (_ BitVec 32))

(declare-fun mapRest!47744 () (Array (_ BitVec 32) ValueCell!14591))

(declare-fun mapValue!47744 () ValueCell!14591)

(assert (=> mapNonEmpty!47744 (= (arr!37645 _values!996) (store mapRest!47744 mapKey!47744 mapValue!47744))))

(declare-fun b!1204450 () Bool)

(assert (=> b!1204450 (= e!684022 (= call!58031 call!58032))))

(declare-fun b!1204451 () Bool)

(declare-fun -!1801 (ListLongMap!17677 (_ BitVec 64)) ListLongMap!17677)

(assert (=> b!1204451 (= e!684022 (= call!58031 (-!1801 call!58032 k0!934)))))

(declare-fun b!1204452 () Bool)

(assert (=> b!1204452 (= e!684018 e!684028)))

(declare-fun res!801209 () Bool)

(assert (=> b!1204452 (=> res!801209 e!684028)))

(assert (=> b!1204452 (= res!801209 (not (= from!1455 i!673)))))

(declare-fun lt!545875 () ListLongMap!17677)

(assert (=> b!1204452 (= lt!545875 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3249 (Int (_ BitVec 64)) V!45929)

(assert (=> b!1204452 (= lt!545863 (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)))))

(declare-fun lt!545869 () ListLongMap!17677)

(assert (=> b!1204452 (= lt!545869 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100810 res!801219) b!1204438))

(assert (= (and b!1204438 res!801208) b!1204433))

(assert (= (and b!1204433 res!801213) b!1204428))

(assert (= (and b!1204428 res!801214) b!1204432))

(assert (= (and b!1204432 res!801217) b!1204436))

(assert (= (and b!1204436 res!801210) b!1204443))

(assert (= (and b!1204443 res!801215) b!1204446))

(assert (= (and b!1204446 res!801216) b!1204429))

(assert (= (and b!1204429 res!801218) b!1204435))

(assert (= (and b!1204435 res!801211) b!1204430))

(assert (= (and b!1204430 (not res!801212)) b!1204452))

(assert (= (and b!1204452 (not res!801209)) b!1204431))

(assert (= (and b!1204431 c!118178) b!1204451))

(assert (= (and b!1204431 (not c!118178)) b!1204450))

(assert (= (or b!1204451 b!1204450) bm!58030))

(assert (= (or b!1204451 b!1204450) bm!58033))

(assert (= (and b!1204431 (not res!801220)) b!1204434))

(assert (= (and b!1204434 (not res!801207)) b!1204447))

(assert (= (and b!1204447 c!118180) b!1204441))

(assert (= (and b!1204447 (not c!118180)) b!1204439))

(assert (= (and b!1204439 c!118179) b!1204448))

(assert (= (and b!1204439 (not c!118179)) b!1204440))

(assert (= (and b!1204440 c!118177) b!1204442))

(assert (= (and b!1204440 (not c!118177)) b!1204445))

(assert (= (or b!1204448 b!1204442) bm!58029))

(assert (= (or b!1204448 b!1204442) bm!58028))

(assert (= (or b!1204448 b!1204442) bm!58031))

(assert (= (or b!1204441 bm!58031) bm!58027))

(assert (= (or b!1204441 bm!58029) bm!58032))

(assert (= (or b!1204441 bm!58028) bm!58026))

(assert (= (and b!1204437 condMapEmpty!47744) mapIsEmpty!47744))

(assert (= (and b!1204437 (not condMapEmpty!47744)) mapNonEmpty!47744))

(get-info :version)

(assert (= (and mapNonEmpty!47744 ((_ is ValueCellFull!14591) mapValue!47744)) b!1204449))

(assert (= (and b!1204437 ((_ is ValueCellFull!14591) mapDefault!47744)) b!1204444))

(assert (= start!100810 b!1204437))

(declare-fun b_lambda!21087 () Bool)

(assert (=> (not b_lambda!21087) (not b!1204452)))

(declare-fun t!39379 () Bool)

(declare-fun tb!10689 () Bool)

(assert (=> (and start!100810 (= defaultEntry!1004 defaultEntry!1004) t!39379) tb!10689))

(declare-fun result!21963 () Bool)

(assert (=> tb!10689 (= result!21963 tp_is_empty!30601)))

(assert (=> b!1204452 t!39379))

(declare-fun b_and!42685 () Bool)

(assert (= b_and!42683 (and (=> t!39379 result!21963) b_and!42685)))

(declare-fun m!1110397 () Bool)

(assert (=> b!1204441 m!1110397))

(declare-fun m!1110399 () Bool)

(assert (=> b!1204441 m!1110399))

(declare-fun m!1110401 () Bool)

(assert (=> b!1204441 m!1110401))

(declare-fun m!1110403 () Bool)

(assert (=> b!1204452 m!1110403))

(declare-fun m!1110405 () Bool)

(assert (=> b!1204452 m!1110405))

(declare-fun m!1110407 () Bool)

(assert (=> b!1204452 m!1110407))

(declare-fun m!1110409 () Bool)

(assert (=> b!1204452 m!1110409))

(declare-fun m!1110411 () Bool)

(assert (=> bm!58026 m!1110411))

(declare-fun m!1110413 () Bool)

(assert (=> b!1204446 m!1110413))

(declare-fun m!1110415 () Bool)

(assert (=> bm!58030 m!1110415))

(declare-fun m!1110417 () Bool)

(assert (=> bm!58033 m!1110417))

(declare-fun m!1110419 () Bool)

(assert (=> b!1204434 m!1110419))

(assert (=> b!1204434 m!1110417))

(declare-fun m!1110421 () Bool)

(assert (=> b!1204432 m!1110421))

(declare-fun m!1110423 () Bool)

(assert (=> b!1204443 m!1110423))

(declare-fun m!1110425 () Bool)

(assert (=> b!1204430 m!1110425))

(declare-fun m!1110427 () Bool)

(assert (=> b!1204430 m!1110427))

(declare-fun m!1110429 () Bool)

(assert (=> bm!58027 m!1110429))

(declare-fun m!1110431 () Bool)

(assert (=> b!1204451 m!1110431))

(declare-fun m!1110433 () Bool)

(assert (=> mapNonEmpty!47744 m!1110433))

(declare-fun m!1110435 () Bool)

(assert (=> start!100810 m!1110435))

(declare-fun m!1110437 () Bool)

(assert (=> start!100810 m!1110437))

(declare-fun m!1110439 () Bool)

(assert (=> b!1204435 m!1110439))

(declare-fun m!1110441 () Bool)

(assert (=> b!1204438 m!1110441))

(declare-fun m!1110443 () Bool)

(assert (=> b!1204429 m!1110443))

(declare-fun m!1110445 () Bool)

(assert (=> b!1204429 m!1110445))

(declare-fun m!1110447 () Bool)

(assert (=> b!1204431 m!1110447))

(declare-fun m!1110449 () Bool)

(assert (=> b!1204431 m!1110449))

(declare-fun m!1110451 () Bool)

(assert (=> bm!58032 m!1110451))

(declare-fun m!1110453 () Bool)

(assert (=> b!1204428 m!1110453))

(check-sat (not bm!58030) b_and!42685 (not b!1204452) (not bm!58026) (not b!1204432) (not b!1204443) (not bm!58027) (not b!1204438) tp_is_empty!30601 (not b_lambda!21087) (not b!1204429) (not bm!58032) (not b!1204430) (not b!1204451) (not b!1204428) (not b!1204441) (not b!1204434) (not mapNonEmpty!47744) (not b_next!25897) (not bm!58033) (not b!1204431) (not b!1204435) (not start!100810))
(check-sat b_and!42685 (not b_next!25897))
(get-model)

(declare-fun b_lambda!21093 () Bool)

(assert (= b_lambda!21087 (or (and start!100810 b_free!25897) b_lambda!21093)))

(check-sat (not bm!58030) b_and!42685 (not b!1204452) (not bm!58026) (not b!1204432) (not b!1204443) (not bm!58027) (not b!1204438) tp_is_empty!30601 (not b!1204429) (not b!1204430) (not b!1204451) (not b!1204428) (not b!1204441) (not b!1204434) (not mapNonEmpty!47744) (not b_next!25897) (not bm!58033) (not b!1204431) (not b_lambda!21093) (not bm!58032) (not b!1204435) (not start!100810))
(check-sat b_and!42685 (not b_next!25897))
(get-model)

(declare-fun d!132925 () Bool)

(declare-fun res!801313 () Bool)

(declare-fun e!684122 () Bool)

(assert (=> d!132925 (=> res!801313 e!684122)))

(assert (=> d!132925 (= res!801313 (bvsge #b00000000000000000000000000000000 (size!38181 _keys!1208)))))

(assert (=> d!132925 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26509) e!684122)))

(declare-fun bm!58084 () Bool)

(declare-fun call!58087 () Bool)

(declare-fun c!118207 () Bool)

(assert (=> bm!58084 (= call!58087 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118207 (Cons!26508 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) Nil!26509) Nil!26509)))))

(declare-fun b!1204619 () Bool)

(declare-fun e!684125 () Bool)

(declare-fun e!684123 () Bool)

(assert (=> b!1204619 (= e!684125 e!684123)))

(assert (=> b!1204619 (= c!118207 (validKeyInArray!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204620 () Bool)

(assert (=> b!1204620 (= e!684123 call!58087)))

(declare-fun b!1204621 () Bool)

(assert (=> b!1204621 (= e!684122 e!684125)))

(declare-fun res!801312 () Bool)

(assert (=> b!1204621 (=> (not res!801312) (not e!684125))))

(declare-fun e!684124 () Bool)

(assert (=> b!1204621 (= res!801312 (not e!684124))))

(declare-fun res!801311 () Bool)

(assert (=> b!1204621 (=> (not res!801311) (not e!684124))))

(assert (=> b!1204621 (= res!801311 (validKeyInArray!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204622 () Bool)

(declare-fun contains!6930 (List!26512 (_ BitVec 64)) Bool)

(assert (=> b!1204622 (= e!684124 (contains!6930 Nil!26509 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204623 () Bool)

(assert (=> b!1204623 (= e!684123 call!58087)))

(assert (= (and d!132925 (not res!801313)) b!1204621))

(assert (= (and b!1204621 res!801311) b!1204622))

(assert (= (and b!1204621 res!801312) b!1204619))

(assert (= (and b!1204619 c!118207) b!1204623))

(assert (= (and b!1204619 (not c!118207)) b!1204620))

(assert (= (or b!1204623 b!1204620) bm!58084))

(declare-fun m!1110571 () Bool)

(assert (=> bm!58084 m!1110571))

(declare-fun m!1110573 () Bool)

(assert (=> bm!58084 m!1110573))

(assert (=> b!1204619 m!1110571))

(assert (=> b!1204619 m!1110571))

(declare-fun m!1110575 () Bool)

(assert (=> b!1204619 m!1110575))

(assert (=> b!1204621 m!1110571))

(assert (=> b!1204621 m!1110571))

(assert (=> b!1204621 m!1110575))

(assert (=> b!1204622 m!1110571))

(assert (=> b!1204622 m!1110571))

(declare-fun m!1110577 () Bool)

(assert (=> b!1204622 m!1110577))

(assert (=> b!1204432 d!132925))

(declare-fun b!1204648 () Bool)

(declare-fun lt!545977 () Unit!39848)

(declare-fun lt!545978 () Unit!39848)

(assert (=> b!1204648 (= lt!545977 lt!545978)))

(declare-fun lt!545976 () (_ BitVec 64))

(declare-fun lt!545981 () (_ BitVec 64))

(declare-fun lt!545979 () ListLongMap!17677)

(declare-fun lt!545980 () V!45929)

(assert (=> b!1204648 (not (contains!6929 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980)) lt!545976))))

(declare-fun addStillNotContains!290 (ListLongMap!17677 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39848)

(assert (=> b!1204648 (= lt!545978 (addStillNotContains!290 lt!545979 lt!545981 lt!545980 lt!545976))))

(assert (=> b!1204648 (= lt!545976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19233 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1204648 (= lt!545980 (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204648 (= lt!545981 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58090 () ListLongMap!17677)

(assert (=> b!1204648 (= lt!545979 call!58090)))

(declare-fun e!684146 () ListLongMap!17677)

(assert (=> b!1204648 (= e!684146 (+!4021 call!58090 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204649 () Bool)

(declare-fun e!684142 () ListLongMap!17677)

(assert (=> b!1204649 (= e!684142 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204650 () Bool)

(declare-fun e!684144 () Bool)

(declare-fun e!684145 () Bool)

(assert (=> b!1204650 (= e!684144 e!684145)))

(assert (=> b!1204650 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 lt!545876)))))

(declare-fun lt!545975 () ListLongMap!17677)

(declare-fun res!801324 () Bool)

(assert (=> b!1204650 (= res!801324 (contains!6929 lt!545975 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204650 (=> (not res!801324) (not e!684145))))

(declare-fun b!1204651 () Bool)

(declare-fun e!684143 () Bool)

(assert (=> b!1204651 (= e!684143 (= lt!545975 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204652 () Bool)

(assert (=> b!1204652 (= e!684146 call!58090)))

(declare-fun b!1204653 () Bool)

(declare-fun e!684140 () Bool)

(assert (=> b!1204653 (= e!684140 e!684144)))

(declare-fun c!118216 () Bool)

(declare-fun e!684141 () Bool)

(assert (=> b!1204653 (= c!118216 e!684141)))

(declare-fun res!801322 () Bool)

(assert (=> b!1204653 (=> (not res!801322) (not e!684141))))

(assert (=> b!1204653 (= res!801322 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 lt!545876)))))

(declare-fun d!132927 () Bool)

(assert (=> d!132927 e!684140))

(declare-fun res!801323 () Bool)

(assert (=> d!132927 (=> (not res!801323) (not e!684140))))

(assert (=> d!132927 (= res!801323 (not (contains!6929 lt!545975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132927 (= lt!545975 e!684142)))

(declare-fun c!118218 () Bool)

(assert (=> d!132927 (= c!118218 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 lt!545876)))))

(assert (=> d!132927 (validMask!0 mask!1564)))

(assert (=> d!132927 (= (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545975)))

(declare-fun b!1204654 () Bool)

(assert (=> b!1204654 (= e!684144 e!684143)))

(declare-fun c!118217 () Bool)

(assert (=> b!1204654 (= c!118217 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 lt!545876)))))

(declare-fun b!1204655 () Bool)

(assert (=> b!1204655 (= e!684142 e!684146)))

(declare-fun c!118219 () Bool)

(assert (=> b!1204655 (= c!118219 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204656 () Bool)

(declare-fun isEmpty!984 (ListLongMap!17677) Bool)

(assert (=> b!1204656 (= e!684143 (isEmpty!984 lt!545975))))

(declare-fun b!1204657 () Bool)

(assert (=> b!1204657 (= e!684141 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204657 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204658 () Bool)

(declare-fun res!801325 () Bool)

(assert (=> b!1204658 (=> (not res!801325) (not e!684140))))

(assert (=> b!1204658 (= res!801325 (not (contains!6929 lt!545975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58087 () Bool)

(assert (=> bm!58087 (= call!58090 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204659 () Bool)

(assert (=> b!1204659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 lt!545876)))))

(assert (=> b!1204659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 lt!545863)))))

(declare-fun apply!969 (ListLongMap!17677 (_ BitVec 64)) V!45929)

(assert (=> b!1204659 (= e!684145 (= (apply!969 lt!545975 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132927 c!118218) b!1204649))

(assert (= (and d!132927 (not c!118218)) b!1204655))

(assert (= (and b!1204655 c!118219) b!1204648))

(assert (= (and b!1204655 (not c!118219)) b!1204652))

(assert (= (or b!1204648 b!1204652) bm!58087))

(assert (= (and d!132927 res!801323) b!1204658))

(assert (= (and b!1204658 res!801325) b!1204653))

(assert (= (and b!1204653 res!801322) b!1204657))

(assert (= (and b!1204653 c!118216) b!1204650))

(assert (= (and b!1204653 (not c!118216)) b!1204654))

(assert (= (and b!1204650 res!801324) b!1204659))

(assert (= (and b!1204654 c!118217) b!1204651))

(assert (= (and b!1204654 (not c!118217)) b!1204656))

(declare-fun b_lambda!21095 () Bool)

(assert (=> (not b_lambda!21095) (not b!1204648)))

(assert (=> b!1204648 t!39379))

(declare-fun b_and!42695 () Bool)

(assert (= b_and!42685 (and (=> t!39379 result!21963) b_and!42695)))

(declare-fun b_lambda!21097 () Bool)

(assert (=> (not b_lambda!21097) (not b!1204659)))

(assert (=> b!1204659 t!39379))

(declare-fun b_and!42697 () Bool)

(assert (= b_and!42695 (and (=> t!39379 result!21963) b_and!42697)))

(declare-fun m!1110579 () Bool)

(assert (=> b!1204648 m!1110579))

(assert (=> b!1204648 m!1110579))

(declare-fun m!1110581 () Bool)

(assert (=> b!1204648 m!1110581))

(declare-fun m!1110583 () Bool)

(assert (=> b!1204648 m!1110583))

(assert (=> b!1204648 m!1110405))

(declare-fun m!1110585 () Bool)

(assert (=> b!1204648 m!1110585))

(declare-fun m!1110587 () Bool)

(assert (=> b!1204648 m!1110587))

(assert (=> b!1204648 m!1110585))

(assert (=> b!1204648 m!1110405))

(declare-fun m!1110589 () Bool)

(assert (=> b!1204648 m!1110589))

(declare-fun m!1110591 () Bool)

(assert (=> b!1204648 m!1110591))

(assert (=> b!1204659 m!1110583))

(assert (=> b!1204659 m!1110405))

(assert (=> b!1204659 m!1110585))

(assert (=> b!1204659 m!1110585))

(assert (=> b!1204659 m!1110405))

(assert (=> b!1204659 m!1110589))

(assert (=> b!1204659 m!1110583))

(declare-fun m!1110593 () Bool)

(assert (=> b!1204659 m!1110593))

(declare-fun m!1110595 () Bool)

(assert (=> bm!58087 m!1110595))

(assert (=> b!1204655 m!1110583))

(assert (=> b!1204655 m!1110583))

(declare-fun m!1110597 () Bool)

(assert (=> b!1204655 m!1110597))

(declare-fun m!1110599 () Bool)

(assert (=> b!1204656 m!1110599))

(declare-fun m!1110601 () Bool)

(assert (=> d!132927 m!1110601))

(assert (=> d!132927 m!1110441))

(assert (=> b!1204650 m!1110583))

(assert (=> b!1204650 m!1110583))

(declare-fun m!1110603 () Bool)

(assert (=> b!1204650 m!1110603))

(assert (=> b!1204657 m!1110583))

(assert (=> b!1204657 m!1110583))

(assert (=> b!1204657 m!1110597))

(assert (=> b!1204651 m!1110595))

(declare-fun m!1110605 () Bool)

(assert (=> b!1204658 m!1110605))

(assert (=> bm!58030 d!132927))

(declare-fun b!1204660 () Bool)

(declare-fun lt!545984 () Unit!39848)

(declare-fun lt!545985 () Unit!39848)

(assert (=> b!1204660 (= lt!545984 lt!545985)))

(declare-fun lt!545987 () V!45929)

(declare-fun lt!545988 () (_ BitVec 64))

(declare-fun lt!545986 () ListLongMap!17677)

(declare-fun lt!545983 () (_ BitVec 64))

(assert (=> b!1204660 (not (contains!6929 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987)) lt!545983))))

(assert (=> b!1204660 (= lt!545985 (addStillNotContains!290 lt!545986 lt!545988 lt!545987 lt!545983))))

(assert (=> b!1204660 (= lt!545983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204660 (= lt!545987 (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204660 (= lt!545988 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58091 () ListLongMap!17677)

(assert (=> b!1204660 (= lt!545986 call!58091)))

(declare-fun e!684153 () ListLongMap!17677)

(assert (=> b!1204660 (= e!684153 (+!4021 call!58091 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204661 () Bool)

(declare-fun e!684149 () ListLongMap!17677)

(assert (=> b!1204661 (= e!684149 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204662 () Bool)

(declare-fun e!684151 () Bool)

(declare-fun e!684152 () Bool)

(assert (=> b!1204662 (= e!684151 e!684152)))

(assert (=> b!1204662 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(declare-fun res!801328 () Bool)

(declare-fun lt!545982 () ListLongMap!17677)

(assert (=> b!1204662 (= res!801328 (contains!6929 lt!545982 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204662 (=> (not res!801328) (not e!684152))))

(declare-fun e!684150 () Bool)

(declare-fun b!1204663 () Bool)

(assert (=> b!1204663 (= e!684150 (= lt!545982 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204664 () Bool)

(assert (=> b!1204664 (= e!684153 call!58091)))

(declare-fun b!1204665 () Bool)

(declare-fun e!684147 () Bool)

(assert (=> b!1204665 (= e!684147 e!684151)))

(declare-fun c!118220 () Bool)

(declare-fun e!684148 () Bool)

(assert (=> b!1204665 (= c!118220 e!684148)))

(declare-fun res!801326 () Bool)

(assert (=> b!1204665 (=> (not res!801326) (not e!684148))))

(assert (=> b!1204665 (= res!801326 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(declare-fun d!132929 () Bool)

(assert (=> d!132929 e!684147))

(declare-fun res!801327 () Bool)

(assert (=> d!132929 (=> (not res!801327) (not e!684147))))

(assert (=> d!132929 (= res!801327 (not (contains!6929 lt!545982 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132929 (= lt!545982 e!684149)))

(declare-fun c!118222 () Bool)

(assert (=> d!132929 (= c!118222 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(assert (=> d!132929 (validMask!0 mask!1564)))

(assert (=> d!132929 (= (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545982)))

(declare-fun b!1204666 () Bool)

(assert (=> b!1204666 (= e!684151 e!684150)))

(declare-fun c!118221 () Bool)

(assert (=> b!1204666 (= c!118221 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(declare-fun b!1204667 () Bool)

(assert (=> b!1204667 (= e!684149 e!684153)))

(declare-fun c!118223 () Bool)

(assert (=> b!1204667 (= c!118223 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204668 () Bool)

(assert (=> b!1204668 (= e!684150 (isEmpty!984 lt!545982))))

(declare-fun b!1204669 () Bool)

(assert (=> b!1204669 (= e!684148 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204669 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204670 () Bool)

(declare-fun res!801329 () Bool)

(assert (=> b!1204670 (=> (not res!801329) (not e!684147))))

(assert (=> b!1204670 (= res!801329 (not (contains!6929 lt!545982 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58088 () Bool)

(assert (=> bm!58088 (= call!58091 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204671 () Bool)

(assert (=> b!1204671 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(assert (=> b!1204671 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 _values!996)))))

(assert (=> b!1204671 (= e!684152 (= (apply!969 lt!545982 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132929 c!118222) b!1204661))

(assert (= (and d!132929 (not c!118222)) b!1204667))

(assert (= (and b!1204667 c!118223) b!1204660))

(assert (= (and b!1204667 (not c!118223)) b!1204664))

(assert (= (or b!1204660 b!1204664) bm!58088))

(assert (= (and d!132929 res!801327) b!1204670))

(assert (= (and b!1204670 res!801329) b!1204665))

(assert (= (and b!1204665 res!801326) b!1204669))

(assert (= (and b!1204665 c!118220) b!1204662))

(assert (= (and b!1204665 (not c!118220)) b!1204666))

(assert (= (and b!1204662 res!801328) b!1204671))

(assert (= (and b!1204666 c!118221) b!1204663))

(assert (= (and b!1204666 (not c!118221)) b!1204668))

(declare-fun b_lambda!21099 () Bool)

(assert (=> (not b_lambda!21099) (not b!1204660)))

(assert (=> b!1204660 t!39379))

(declare-fun b_and!42699 () Bool)

(assert (= b_and!42697 (and (=> t!39379 result!21963) b_and!42699)))

(declare-fun b_lambda!21101 () Bool)

(assert (=> (not b_lambda!21101) (not b!1204671)))

(assert (=> b!1204671 t!39379))

(declare-fun b_and!42701 () Bool)

(assert (= b_and!42699 (and (=> t!39379 result!21963) b_and!42701)))

(declare-fun m!1110607 () Bool)

(assert (=> b!1204660 m!1110607))

(assert (=> b!1204660 m!1110607))

(declare-fun m!1110609 () Bool)

(assert (=> b!1204660 m!1110609))

(declare-fun m!1110611 () Bool)

(assert (=> b!1204660 m!1110611))

(assert (=> b!1204660 m!1110405))

(declare-fun m!1110613 () Bool)

(assert (=> b!1204660 m!1110613))

(declare-fun m!1110615 () Bool)

(assert (=> b!1204660 m!1110615))

(assert (=> b!1204660 m!1110613))

(assert (=> b!1204660 m!1110405))

(declare-fun m!1110617 () Bool)

(assert (=> b!1204660 m!1110617))

(declare-fun m!1110619 () Bool)

(assert (=> b!1204660 m!1110619))

(assert (=> b!1204671 m!1110611))

(assert (=> b!1204671 m!1110405))

(assert (=> b!1204671 m!1110613))

(assert (=> b!1204671 m!1110613))

(assert (=> b!1204671 m!1110405))

(assert (=> b!1204671 m!1110617))

(assert (=> b!1204671 m!1110611))

(declare-fun m!1110621 () Bool)

(assert (=> b!1204671 m!1110621))

(declare-fun m!1110623 () Bool)

(assert (=> bm!58088 m!1110623))

(assert (=> b!1204667 m!1110611))

(assert (=> b!1204667 m!1110611))

(declare-fun m!1110625 () Bool)

(assert (=> b!1204667 m!1110625))

(declare-fun m!1110627 () Bool)

(assert (=> b!1204668 m!1110627))

(declare-fun m!1110629 () Bool)

(assert (=> d!132929 m!1110629))

(assert (=> d!132929 m!1110441))

(assert (=> b!1204662 m!1110611))

(assert (=> b!1204662 m!1110611))

(declare-fun m!1110631 () Bool)

(assert (=> b!1204662 m!1110631))

(assert (=> b!1204669 m!1110611))

(assert (=> b!1204669 m!1110611))

(assert (=> b!1204669 m!1110625))

(assert (=> b!1204663 m!1110623))

(declare-fun m!1110633 () Bool)

(assert (=> b!1204670 m!1110633))

(assert (=> bm!58033 d!132929))

(declare-fun d!132931 () Bool)

(assert (=> d!132931 (= (array_inv!28748 _keys!1208) (bvsge (size!38181 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100810 d!132931))

(declare-fun d!132933 () Bool)

(assert (=> d!132933 (= (array_inv!28749 _values!996) (bvsge (size!38182 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100810 d!132933))

(declare-fun d!132935 () Bool)

(declare-fun e!684158 () Bool)

(assert (=> d!132935 e!684158))

(declare-fun res!801332 () Bool)

(assert (=> d!132935 (=> res!801332 e!684158)))

(declare-fun lt!545998 () Bool)

(assert (=> d!132935 (= res!801332 (not lt!545998))))

(declare-fun lt!546000 () Bool)

(assert (=> d!132935 (= lt!545998 lt!546000)))

(declare-fun lt!545997 () Unit!39848)

(declare-fun e!684159 () Unit!39848)

(assert (=> d!132935 (= lt!545997 e!684159)))

(declare-fun c!118226 () Bool)

(assert (=> d!132935 (= c!118226 lt!546000)))

(declare-fun containsKey!589 (List!26511 (_ BitVec 64)) Bool)

(assert (=> d!132935 (= lt!546000 (containsKey!589 (toList!8854 lt!545865) k0!934))))

(assert (=> d!132935 (= (contains!6929 lt!545865 k0!934) lt!545998)))

(declare-fun b!1204678 () Bool)

(declare-fun lt!545999 () Unit!39848)

(assert (=> b!1204678 (= e!684159 lt!545999)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!417 (List!26511 (_ BitVec 64)) Unit!39848)

(assert (=> b!1204678 (= lt!545999 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545865) k0!934))))

(declare-datatypes ((Option!678 0))(
  ( (Some!677 (v!17994 V!45929)) (None!676) )
))
(declare-fun isDefined!455 (Option!678) Bool)

(declare-fun getValueByKey!627 (List!26511 (_ BitVec 64)) Option!678)

(assert (=> b!1204678 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545865) k0!934))))

(declare-fun b!1204679 () Bool)

(declare-fun Unit!39855 () Unit!39848)

(assert (=> b!1204679 (= e!684159 Unit!39855)))

(declare-fun b!1204680 () Bool)

(assert (=> b!1204680 (= e!684158 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545865) k0!934)))))

(assert (= (and d!132935 c!118226) b!1204678))

(assert (= (and d!132935 (not c!118226)) b!1204679))

(assert (= (and d!132935 (not res!801332)) b!1204680))

(declare-fun m!1110635 () Bool)

(assert (=> d!132935 m!1110635))

(declare-fun m!1110637 () Bool)

(assert (=> b!1204678 m!1110637))

(declare-fun m!1110639 () Bool)

(assert (=> b!1204678 m!1110639))

(assert (=> b!1204678 m!1110639))

(declare-fun m!1110641 () Bool)

(assert (=> b!1204678 m!1110641))

(assert (=> b!1204680 m!1110639))

(assert (=> b!1204680 m!1110639))

(assert (=> b!1204680 m!1110641))

(assert (=> b!1204434 d!132935))

(assert (=> b!1204434 d!132929))

(declare-fun d!132937 () Bool)

(assert (=> d!132937 (contains!6929 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!546003 () Unit!39848)

(declare-fun choose!1790 (ListLongMap!17677 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39848)

(assert (=> d!132937 (= lt!546003 (choose!1790 lt!545865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132937 (contains!6929 lt!545865 k0!934)))

(assert (=> d!132937 (= (addStillContains!1006 lt!545865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!546003)))

(declare-fun bs!34076 () Bool)

(assert (= bs!34076 d!132937))

(assert (=> bs!34076 m!1110399))

(assert (=> bs!34076 m!1110399))

(declare-fun m!1110643 () Bool)

(assert (=> bs!34076 m!1110643))

(declare-fun m!1110645 () Bool)

(assert (=> bs!34076 m!1110645))

(assert (=> bs!34076 m!1110419))

(assert (=> b!1204441 d!132937))

(declare-fun d!132939 () Bool)

(declare-fun e!684162 () Bool)

(assert (=> d!132939 e!684162))

(declare-fun res!801337 () Bool)

(assert (=> d!132939 (=> (not res!801337) (not e!684162))))

(declare-fun lt!546015 () ListLongMap!17677)

(assert (=> d!132939 (= res!801337 (contains!6929 lt!546015 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!546013 () List!26511)

(assert (=> d!132939 (= lt!546015 (ListLongMap!17678 lt!546013))))

(declare-fun lt!546012 () Unit!39848)

(declare-fun lt!546014 () Unit!39848)

(assert (=> d!132939 (= lt!546012 lt!546014)))

(assert (=> d!132939 (= (getValueByKey!627 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!677 (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!309 (List!26511 (_ BitVec 64) V!45929) Unit!39848)

(assert (=> d!132939 (= lt!546014 (lemmaContainsTupThenGetReturnValue!309 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!402 (List!26511 (_ BitVec 64) V!45929) List!26511)

(assert (=> d!132939 (= lt!546013 (insertStrictlySorted!402 (toList!8854 lt!545865) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132939 (= (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!546015)))

(declare-fun b!1204686 () Bool)

(declare-fun res!801338 () Bool)

(assert (=> b!1204686 (=> (not res!801338) (not e!684162))))

(assert (=> b!1204686 (= res!801338 (= (getValueByKey!627 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!677 (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1204687 () Bool)

(declare-fun contains!6931 (List!26511 tuple2!19700) Bool)

(assert (=> b!1204687 (= e!684162 (contains!6931 (toList!8854 lt!546015) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132939 res!801337) b!1204686))

(assert (= (and b!1204686 res!801338) b!1204687))

(declare-fun m!1110647 () Bool)

(assert (=> d!132939 m!1110647))

(declare-fun m!1110649 () Bool)

(assert (=> d!132939 m!1110649))

(declare-fun m!1110651 () Bool)

(assert (=> d!132939 m!1110651))

(declare-fun m!1110653 () Bool)

(assert (=> d!132939 m!1110653))

(declare-fun m!1110655 () Bool)

(assert (=> b!1204686 m!1110655))

(declare-fun m!1110657 () Bool)

(assert (=> b!1204687 m!1110657))

(assert (=> b!1204441 d!132939))

(declare-fun d!132941 () Bool)

(declare-fun e!684163 () Bool)

(assert (=> d!132941 e!684163))

(declare-fun res!801339 () Bool)

(assert (=> d!132941 (=> res!801339 e!684163)))

(declare-fun lt!546017 () Bool)

(assert (=> d!132941 (= res!801339 (not lt!546017))))

(declare-fun lt!546019 () Bool)

(assert (=> d!132941 (= lt!546017 lt!546019)))

(declare-fun lt!546016 () Unit!39848)

(declare-fun e!684164 () Unit!39848)

(assert (=> d!132941 (= lt!546016 e!684164)))

(declare-fun c!118227 () Bool)

(assert (=> d!132941 (= c!118227 lt!546019)))

(assert (=> d!132941 (= lt!546019 (containsKey!589 (toList!8854 call!58033) k0!934))))

(assert (=> d!132941 (= (contains!6929 call!58033 k0!934) lt!546017)))

(declare-fun b!1204688 () Bool)

(declare-fun lt!546018 () Unit!39848)

(assert (=> b!1204688 (= e!684164 lt!546018)))

(assert (=> b!1204688 (= lt!546018 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 call!58033) k0!934))))

(assert (=> b!1204688 (isDefined!455 (getValueByKey!627 (toList!8854 call!58033) k0!934))))

(declare-fun b!1204689 () Bool)

(declare-fun Unit!39856 () Unit!39848)

(assert (=> b!1204689 (= e!684164 Unit!39856)))

(declare-fun b!1204690 () Bool)

(assert (=> b!1204690 (= e!684163 (isDefined!455 (getValueByKey!627 (toList!8854 call!58033) k0!934)))))

(assert (= (and d!132941 c!118227) b!1204688))

(assert (= (and d!132941 (not c!118227)) b!1204689))

(assert (= (and d!132941 (not res!801339)) b!1204690))

(declare-fun m!1110659 () Bool)

(assert (=> d!132941 m!1110659))

(declare-fun m!1110661 () Bool)

(assert (=> b!1204688 m!1110661))

(declare-fun m!1110663 () Bool)

(assert (=> b!1204688 m!1110663))

(assert (=> b!1204688 m!1110663))

(declare-fun m!1110665 () Bool)

(assert (=> b!1204688 m!1110665))

(assert (=> b!1204690 m!1110663))

(assert (=> b!1204690 m!1110663))

(assert (=> b!1204690 m!1110665))

(assert (=> b!1204441 d!132941))

(declare-fun d!132943 () Bool)

(declare-fun res!801342 () Bool)

(declare-fun e!684165 () Bool)

(assert (=> d!132943 (=> res!801342 e!684165)))

(assert (=> d!132943 (= res!801342 (bvsge #b00000000000000000000000000000000 (size!38181 lt!545876)))))

(assert (=> d!132943 (= (arrayNoDuplicates!0 lt!545876 #b00000000000000000000000000000000 Nil!26509) e!684165)))

(declare-fun bm!58089 () Bool)

(declare-fun call!58092 () Bool)

(declare-fun c!118228 () Bool)

(assert (=> bm!58089 (= call!58092 (arrayNoDuplicates!0 lt!545876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118228 (Cons!26508 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) Nil!26509) Nil!26509)))))

(declare-fun b!1204691 () Bool)

(declare-fun e!684168 () Bool)

(declare-fun e!684166 () Bool)

(assert (=> b!1204691 (= e!684168 e!684166)))

(assert (=> b!1204691 (= c!118228 (validKeyInArray!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun b!1204692 () Bool)

(assert (=> b!1204692 (= e!684166 call!58092)))

(declare-fun b!1204693 () Bool)

(assert (=> b!1204693 (= e!684165 e!684168)))

(declare-fun res!801341 () Bool)

(assert (=> b!1204693 (=> (not res!801341) (not e!684168))))

(declare-fun e!684167 () Bool)

(assert (=> b!1204693 (= res!801341 (not e!684167))))

(declare-fun res!801340 () Bool)

(assert (=> b!1204693 (=> (not res!801340) (not e!684167))))

(assert (=> b!1204693 (= res!801340 (validKeyInArray!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun b!1204694 () Bool)

(assert (=> b!1204694 (= e!684167 (contains!6930 Nil!26509 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun b!1204695 () Bool)

(assert (=> b!1204695 (= e!684166 call!58092)))

(assert (= (and d!132943 (not res!801342)) b!1204693))

(assert (= (and b!1204693 res!801340) b!1204694))

(assert (= (and b!1204693 res!801341) b!1204691))

(assert (= (and b!1204691 c!118228) b!1204695))

(assert (= (and b!1204691 (not c!118228)) b!1204692))

(assert (= (or b!1204695 b!1204692) bm!58089))

(declare-fun m!1110667 () Bool)

(assert (=> bm!58089 m!1110667))

(declare-fun m!1110669 () Bool)

(assert (=> bm!58089 m!1110669))

(assert (=> b!1204691 m!1110667))

(assert (=> b!1204691 m!1110667))

(declare-fun m!1110671 () Bool)

(assert (=> b!1204691 m!1110671))

(assert (=> b!1204693 m!1110667))

(assert (=> b!1204693 m!1110667))

(assert (=> b!1204693 m!1110671))

(assert (=> b!1204694 m!1110667))

(assert (=> b!1204694 m!1110667))

(declare-fun m!1110673 () Bool)

(assert (=> b!1204694 m!1110673))

(assert (=> b!1204435 d!132943))

(declare-fun d!132945 () Bool)

(declare-fun e!684169 () Bool)

(assert (=> d!132945 e!684169))

(declare-fun res!801343 () Bool)

(assert (=> d!132945 (=> (not res!801343) (not e!684169))))

(declare-fun lt!546023 () ListLongMap!17677)

(assert (=> d!132945 (= res!801343 (contains!6929 lt!546023 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!546021 () List!26511)

(assert (=> d!132945 (= lt!546023 (ListLongMap!17678 lt!546021))))

(declare-fun lt!546020 () Unit!39848)

(declare-fun lt!546022 () Unit!39848)

(assert (=> d!132945 (= lt!546020 lt!546022)))

(assert (=> d!132945 (= (getValueByKey!627 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!677 (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132945 (= lt!546022 (lemmaContainsTupThenGetReturnValue!309 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132945 (= lt!546021 (insertStrictlySorted!402 (toList!8854 (ite c!118180 lt!545866 lt!545865)) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132945 (= (+!4021 (ite c!118180 lt!545866 lt!545865) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!546023)))

(declare-fun b!1204696 () Bool)

(declare-fun res!801344 () Bool)

(assert (=> b!1204696 (=> (not res!801344) (not e!684169))))

(assert (=> b!1204696 (= res!801344 (= (getValueByKey!627 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!677 (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1204697 () Bool)

(assert (=> b!1204697 (= e!684169 (contains!6931 (toList!8854 lt!546023) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132945 res!801343) b!1204696))

(assert (= (and b!1204696 res!801344) b!1204697))

(declare-fun m!1110675 () Bool)

(assert (=> d!132945 m!1110675))

(declare-fun m!1110677 () Bool)

(assert (=> d!132945 m!1110677))

(declare-fun m!1110679 () Bool)

(assert (=> d!132945 m!1110679))

(declare-fun m!1110681 () Bool)

(assert (=> d!132945 m!1110681))

(declare-fun m!1110683 () Bool)

(assert (=> b!1204696 m!1110683))

(declare-fun m!1110685 () Bool)

(assert (=> b!1204697 m!1110685))

(assert (=> bm!58026 d!132945))

(declare-fun d!132947 () Bool)

(assert (=> d!132947 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204443 d!132947))

(declare-fun b!1204706 () Bool)

(declare-fun e!684177 () Bool)

(declare-fun call!58095 () Bool)

(assert (=> b!1204706 (= e!684177 call!58095)))

(declare-fun b!1204707 () Bool)

(declare-fun e!684178 () Bool)

(declare-fun e!684176 () Bool)

(assert (=> b!1204707 (= e!684178 e!684176)))

(declare-fun c!118231 () Bool)

(assert (=> b!1204707 (= c!118231 (validKeyInArray!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58092 () Bool)

(assert (=> bm!58092 (= call!58095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1204708 () Bool)

(assert (=> b!1204708 (= e!684176 call!58095)))

(declare-fun b!1204709 () Bool)

(assert (=> b!1204709 (= e!684176 e!684177)))

(declare-fun lt!546032 () (_ BitVec 64))

(assert (=> b!1204709 (= lt!546032 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546030 () Unit!39848)

(assert (=> b!1204709 (= lt!546030 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546032 #b00000000000000000000000000000000))))

(assert (=> b!1204709 (arrayContainsKey!0 _keys!1208 lt!546032 #b00000000000000000000000000000000)))

(declare-fun lt!546031 () Unit!39848)

(assert (=> b!1204709 (= lt!546031 lt!546030)))

(declare-fun res!801350 () Bool)

(declare-datatypes ((SeekEntryResult!9889 0))(
  ( (MissingZero!9889 (index!41927 (_ BitVec 32))) (Found!9889 (index!41928 (_ BitVec 32))) (Intermediate!9889 (undefined!10701 Bool) (index!41929 (_ BitVec 32)) (x!106340 (_ BitVec 32))) (Undefined!9889) (MissingVacant!9889 (index!41930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78011 (_ BitVec 32)) SeekEntryResult!9889)

(assert (=> b!1204709 (= res!801350 (= (seekEntryOrOpen!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9889 #b00000000000000000000000000000000)))))

(assert (=> b!1204709 (=> (not res!801350) (not e!684177))))

(declare-fun d!132949 () Bool)

(declare-fun res!801349 () Bool)

(assert (=> d!132949 (=> res!801349 e!684178)))

(assert (=> d!132949 (= res!801349 (bvsge #b00000000000000000000000000000000 (size!38181 _keys!1208)))))

(assert (=> d!132949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!684178)))

(assert (= (and d!132949 (not res!801349)) b!1204707))

(assert (= (and b!1204707 c!118231) b!1204709))

(assert (= (and b!1204707 (not c!118231)) b!1204708))

(assert (= (and b!1204709 res!801350) b!1204706))

(assert (= (or b!1204706 b!1204708) bm!58092))

(assert (=> b!1204707 m!1110571))

(assert (=> b!1204707 m!1110571))

(assert (=> b!1204707 m!1110575))

(declare-fun m!1110687 () Bool)

(assert (=> bm!58092 m!1110687))

(assert (=> b!1204709 m!1110571))

(declare-fun m!1110689 () Bool)

(assert (=> b!1204709 m!1110689))

(declare-fun m!1110691 () Bool)

(assert (=> b!1204709 m!1110691))

(assert (=> b!1204709 m!1110571))

(declare-fun m!1110693 () Bool)

(assert (=> b!1204709 m!1110693))

(assert (=> b!1204428 d!132949))

(declare-fun d!132951 () Bool)

(declare-fun lt!546035 () ListLongMap!17677)

(assert (=> d!132951 (not (contains!6929 lt!546035 k0!934))))

(declare-fun removeStrictlySorted!92 (List!26511 (_ BitVec 64)) List!26511)

(assert (=> d!132951 (= lt!546035 (ListLongMap!17678 (removeStrictlySorted!92 (toList!8854 call!58032) k0!934)))))

(assert (=> d!132951 (= (-!1801 call!58032 k0!934) lt!546035)))

(declare-fun bs!34077 () Bool)

(assert (= bs!34077 d!132951))

(declare-fun m!1110695 () Bool)

(assert (=> bs!34077 m!1110695))

(declare-fun m!1110697 () Bool)

(assert (=> bs!34077 m!1110697))

(assert (=> b!1204451 d!132951))

(declare-fun d!132953 () Bool)

(declare-fun e!684179 () Bool)

(assert (=> d!132953 e!684179))

(declare-fun res!801351 () Bool)

(assert (=> d!132953 (=> res!801351 e!684179)))

(declare-fun lt!546037 () Bool)

(assert (=> d!132953 (= res!801351 (not lt!546037))))

(declare-fun lt!546039 () Bool)

(assert (=> d!132953 (= lt!546037 lt!546039)))

(declare-fun lt!546036 () Unit!39848)

(declare-fun e!684180 () Unit!39848)

(assert (=> d!132953 (= lt!546036 e!684180)))

(declare-fun c!118232 () Bool)

(assert (=> d!132953 (= c!118232 lt!546039)))

(assert (=> d!132953 (= lt!546039 (containsKey!589 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(assert (=> d!132953 (= (contains!6929 (ite c!118180 lt!545866 call!58030) k0!934) lt!546037)))

(declare-fun b!1204710 () Bool)

(declare-fun lt!546038 () Unit!39848)

(assert (=> b!1204710 (= e!684180 lt!546038)))

(assert (=> b!1204710 (= lt!546038 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(assert (=> b!1204710 (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(declare-fun b!1204711 () Bool)

(declare-fun Unit!39857 () Unit!39848)

(assert (=> b!1204711 (= e!684180 Unit!39857)))

(declare-fun b!1204712 () Bool)

(assert (=> b!1204712 (= e!684179 (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934)))))

(assert (= (and d!132953 c!118232) b!1204710))

(assert (= (and d!132953 (not c!118232)) b!1204711))

(assert (= (and d!132953 (not res!801351)) b!1204712))

(declare-fun m!1110699 () Bool)

(assert (=> d!132953 m!1110699))

(declare-fun m!1110701 () Bool)

(assert (=> b!1204710 m!1110701))

(declare-fun m!1110703 () Bool)

(assert (=> b!1204710 m!1110703))

(assert (=> b!1204710 m!1110703))

(declare-fun m!1110705 () Bool)

(assert (=> b!1204710 m!1110705))

(assert (=> b!1204712 m!1110703))

(assert (=> b!1204712 m!1110703))

(assert (=> b!1204712 m!1110705))

(assert (=> bm!58027 d!132953))

(declare-fun b!1204713 () Bool)

(declare-fun lt!546042 () Unit!39848)

(declare-fun lt!546043 () Unit!39848)

(assert (=> b!1204713 (= lt!546042 lt!546043)))

(declare-fun lt!546041 () (_ BitVec 64))

(declare-fun lt!546046 () (_ BitVec 64))

(declare-fun lt!546044 () ListLongMap!17677)

(declare-fun lt!546045 () V!45929)

(assert (=> b!1204713 (not (contains!6929 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045)) lt!546041))))

(assert (=> b!1204713 (= lt!546043 (addStillNotContains!290 lt!546044 lt!546046 lt!546045 lt!546041))))

(assert (=> b!1204713 (= lt!546041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204713 (= lt!546045 (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204713 (= lt!546046 (select (arr!37644 lt!545876) from!1455))))

(declare-fun call!58096 () ListLongMap!17677)

(assert (=> b!1204713 (= lt!546044 call!58096)))

(declare-fun e!684187 () ListLongMap!17677)

(assert (=> b!1204713 (= e!684187 (+!4021 call!58096 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204714 () Bool)

(declare-fun e!684183 () ListLongMap!17677)

(assert (=> b!1204714 (= e!684183 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204715 () Bool)

(declare-fun e!684185 () Bool)

(declare-fun e!684186 () Bool)

(assert (=> b!1204715 (= e!684185 e!684186)))

(assert (=> b!1204715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38181 lt!545876)))))

(declare-fun lt!546040 () ListLongMap!17677)

(declare-fun res!801354 () Bool)

(assert (=> b!1204715 (= res!801354 (contains!6929 lt!546040 (select (arr!37644 lt!545876) from!1455)))))

(assert (=> b!1204715 (=> (not res!801354) (not e!684186))))

(declare-fun e!684184 () Bool)

(declare-fun b!1204716 () Bool)

(assert (=> b!1204716 (= e!684184 (= lt!546040 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204717 () Bool)

(assert (=> b!1204717 (= e!684187 call!58096)))

(declare-fun b!1204718 () Bool)

(declare-fun e!684181 () Bool)

(assert (=> b!1204718 (= e!684181 e!684185)))

(declare-fun c!118233 () Bool)

(declare-fun e!684182 () Bool)

(assert (=> b!1204718 (= c!118233 e!684182)))

(declare-fun res!801352 () Bool)

(assert (=> b!1204718 (=> (not res!801352) (not e!684182))))

(assert (=> b!1204718 (= res!801352 (bvslt from!1455 (size!38181 lt!545876)))))

(declare-fun d!132955 () Bool)

(assert (=> d!132955 e!684181))

(declare-fun res!801353 () Bool)

(assert (=> d!132955 (=> (not res!801353) (not e!684181))))

(assert (=> d!132955 (= res!801353 (not (contains!6929 lt!546040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132955 (= lt!546040 e!684183)))

(declare-fun c!118235 () Bool)

(assert (=> d!132955 (= c!118235 (bvsge from!1455 (size!38181 lt!545876)))))

(assert (=> d!132955 (validMask!0 mask!1564)))

(assert (=> d!132955 (= (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546040)))

(declare-fun b!1204719 () Bool)

(assert (=> b!1204719 (= e!684185 e!684184)))

(declare-fun c!118234 () Bool)

(assert (=> b!1204719 (= c!118234 (bvslt from!1455 (size!38181 lt!545876)))))

(declare-fun b!1204720 () Bool)

(assert (=> b!1204720 (= e!684183 e!684187)))

(declare-fun c!118236 () Bool)

(assert (=> b!1204720 (= c!118236 (validKeyInArray!0 (select (arr!37644 lt!545876) from!1455)))))

(declare-fun b!1204721 () Bool)

(assert (=> b!1204721 (= e!684184 (isEmpty!984 lt!546040))))

(declare-fun b!1204722 () Bool)

(assert (=> b!1204722 (= e!684182 (validKeyInArray!0 (select (arr!37644 lt!545876) from!1455)))))

(assert (=> b!1204722 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204723 () Bool)

(declare-fun res!801355 () Bool)

(assert (=> b!1204723 (=> (not res!801355) (not e!684181))))

(assert (=> b!1204723 (= res!801355 (not (contains!6929 lt!546040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58093 () Bool)

(assert (=> bm!58093 (= call!58096 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204724 () Bool)

(assert (=> b!1204724 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38181 lt!545876)))))

(assert (=> b!1204724 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 lt!545863)))))

(assert (=> b!1204724 (= e!684186 (= (apply!969 lt!546040 (select (arr!37644 lt!545876) from!1455)) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132955 c!118235) b!1204714))

(assert (= (and d!132955 (not c!118235)) b!1204720))

(assert (= (and b!1204720 c!118236) b!1204713))

(assert (= (and b!1204720 (not c!118236)) b!1204717))

(assert (= (or b!1204713 b!1204717) bm!58093))

(assert (= (and d!132955 res!801353) b!1204723))

(assert (= (and b!1204723 res!801355) b!1204718))

(assert (= (and b!1204718 res!801352) b!1204722))

(assert (= (and b!1204718 c!118233) b!1204715))

(assert (= (and b!1204718 (not c!118233)) b!1204719))

(assert (= (and b!1204715 res!801354) b!1204724))

(assert (= (and b!1204719 c!118234) b!1204716))

(assert (= (and b!1204719 (not c!118234)) b!1204721))

(declare-fun b_lambda!21103 () Bool)

(assert (=> (not b_lambda!21103) (not b!1204713)))

(assert (=> b!1204713 t!39379))

(declare-fun b_and!42703 () Bool)

(assert (= b_and!42701 (and (=> t!39379 result!21963) b_and!42703)))

(declare-fun b_lambda!21105 () Bool)

(assert (=> (not b_lambda!21105) (not b!1204724)))

(assert (=> b!1204724 t!39379))

(declare-fun b_and!42705 () Bool)

(assert (= b_and!42703 (and (=> t!39379 result!21963) b_and!42705)))

(declare-fun m!1110707 () Bool)

(assert (=> b!1204713 m!1110707))

(assert (=> b!1204713 m!1110707))

(declare-fun m!1110709 () Bool)

(assert (=> b!1204713 m!1110709))

(declare-fun m!1110711 () Bool)

(assert (=> b!1204713 m!1110711))

(assert (=> b!1204713 m!1110405))

(declare-fun m!1110713 () Bool)

(assert (=> b!1204713 m!1110713))

(declare-fun m!1110715 () Bool)

(assert (=> b!1204713 m!1110715))

(assert (=> b!1204713 m!1110713))

(assert (=> b!1204713 m!1110405))

(declare-fun m!1110717 () Bool)

(assert (=> b!1204713 m!1110717))

(declare-fun m!1110719 () Bool)

(assert (=> b!1204713 m!1110719))

(assert (=> b!1204724 m!1110711))

(assert (=> b!1204724 m!1110405))

(assert (=> b!1204724 m!1110713))

(assert (=> b!1204724 m!1110713))

(assert (=> b!1204724 m!1110405))

(assert (=> b!1204724 m!1110717))

(assert (=> b!1204724 m!1110711))

(declare-fun m!1110721 () Bool)

(assert (=> b!1204724 m!1110721))

(declare-fun m!1110723 () Bool)

(assert (=> bm!58093 m!1110723))

(assert (=> b!1204720 m!1110711))

(assert (=> b!1204720 m!1110711))

(declare-fun m!1110725 () Bool)

(assert (=> b!1204720 m!1110725))

(declare-fun m!1110727 () Bool)

(assert (=> b!1204721 m!1110727))

(declare-fun m!1110729 () Bool)

(assert (=> d!132955 m!1110729))

(assert (=> d!132955 m!1110441))

(assert (=> b!1204715 m!1110711))

(assert (=> b!1204715 m!1110711))

(declare-fun m!1110731 () Bool)

(assert (=> b!1204715 m!1110731))

(assert (=> b!1204722 m!1110711))

(assert (=> b!1204722 m!1110711))

(assert (=> b!1204722 m!1110725))

(assert (=> b!1204716 m!1110723))

(declare-fun m!1110733 () Bool)

(assert (=> b!1204723 m!1110733))

(assert (=> b!1204452 d!132955))

(declare-fun b!1204725 () Bool)

(declare-fun lt!546049 () Unit!39848)

(declare-fun lt!546050 () Unit!39848)

(assert (=> b!1204725 (= lt!546049 lt!546050)))

(declare-fun lt!546051 () ListLongMap!17677)

(declare-fun lt!546053 () (_ BitVec 64))

(declare-fun lt!546048 () (_ BitVec 64))

(declare-fun lt!546052 () V!45929)

(assert (=> b!1204725 (not (contains!6929 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052)) lt!546048))))

(assert (=> b!1204725 (= lt!546050 (addStillNotContains!290 lt!546051 lt!546053 lt!546052 lt!546048))))

(assert (=> b!1204725 (= lt!546048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204725 (= lt!546052 (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204725 (= lt!546053 (select (arr!37644 _keys!1208) from!1455))))

(declare-fun call!58097 () ListLongMap!17677)

(assert (=> b!1204725 (= lt!546051 call!58097)))

(declare-fun e!684194 () ListLongMap!17677)

(assert (=> b!1204725 (= e!684194 (+!4021 call!58097 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204726 () Bool)

(declare-fun e!684190 () ListLongMap!17677)

(assert (=> b!1204726 (= e!684190 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204727 () Bool)

(declare-fun e!684192 () Bool)

(declare-fun e!684193 () Bool)

(assert (=> b!1204727 (= e!684192 e!684193)))

(assert (=> b!1204727 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38181 _keys!1208)))))

(declare-fun lt!546047 () ListLongMap!17677)

(declare-fun res!801358 () Bool)

(assert (=> b!1204727 (= res!801358 (contains!6929 lt!546047 (select (arr!37644 _keys!1208) from!1455)))))

(assert (=> b!1204727 (=> (not res!801358) (not e!684193))))

(declare-fun e!684191 () Bool)

(declare-fun b!1204728 () Bool)

(assert (=> b!1204728 (= e!684191 (= lt!546047 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204729 () Bool)

(assert (=> b!1204729 (= e!684194 call!58097)))

(declare-fun b!1204730 () Bool)

(declare-fun e!684188 () Bool)

(assert (=> b!1204730 (= e!684188 e!684192)))

(declare-fun c!118237 () Bool)

(declare-fun e!684189 () Bool)

(assert (=> b!1204730 (= c!118237 e!684189)))

(declare-fun res!801356 () Bool)

(assert (=> b!1204730 (=> (not res!801356) (not e!684189))))

(assert (=> b!1204730 (= res!801356 (bvslt from!1455 (size!38181 _keys!1208)))))

(declare-fun d!132957 () Bool)

(assert (=> d!132957 e!684188))

(declare-fun res!801357 () Bool)

(assert (=> d!132957 (=> (not res!801357) (not e!684188))))

(assert (=> d!132957 (= res!801357 (not (contains!6929 lt!546047 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132957 (= lt!546047 e!684190)))

(declare-fun c!118239 () Bool)

(assert (=> d!132957 (= c!118239 (bvsge from!1455 (size!38181 _keys!1208)))))

(assert (=> d!132957 (validMask!0 mask!1564)))

(assert (=> d!132957 (= (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546047)))

(declare-fun b!1204731 () Bool)

(assert (=> b!1204731 (= e!684192 e!684191)))

(declare-fun c!118238 () Bool)

(assert (=> b!1204731 (= c!118238 (bvslt from!1455 (size!38181 _keys!1208)))))

(declare-fun b!1204732 () Bool)

(assert (=> b!1204732 (= e!684190 e!684194)))

(declare-fun c!118240 () Bool)

(assert (=> b!1204732 (= c!118240 (validKeyInArray!0 (select (arr!37644 _keys!1208) from!1455)))))

(declare-fun b!1204733 () Bool)

(assert (=> b!1204733 (= e!684191 (isEmpty!984 lt!546047))))

(declare-fun b!1204734 () Bool)

(assert (=> b!1204734 (= e!684189 (validKeyInArray!0 (select (arr!37644 _keys!1208) from!1455)))))

(assert (=> b!1204734 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204735 () Bool)

(declare-fun res!801359 () Bool)

(assert (=> b!1204735 (=> (not res!801359) (not e!684188))))

(assert (=> b!1204735 (= res!801359 (not (contains!6929 lt!546047 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58094 () Bool)

(assert (=> bm!58094 (= call!58097 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204736 () Bool)

(assert (=> b!1204736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38181 _keys!1208)))))

(assert (=> b!1204736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38182 _values!996)))))

(assert (=> b!1204736 (= e!684193 (= (apply!969 lt!546047 (select (arr!37644 _keys!1208) from!1455)) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132957 c!118239) b!1204726))

(assert (= (and d!132957 (not c!118239)) b!1204732))

(assert (= (and b!1204732 c!118240) b!1204725))

(assert (= (and b!1204732 (not c!118240)) b!1204729))

(assert (= (or b!1204725 b!1204729) bm!58094))

(assert (= (and d!132957 res!801357) b!1204735))

(assert (= (and b!1204735 res!801359) b!1204730))

(assert (= (and b!1204730 res!801356) b!1204734))

(assert (= (and b!1204730 c!118237) b!1204727))

(assert (= (and b!1204730 (not c!118237)) b!1204731))

(assert (= (and b!1204727 res!801358) b!1204736))

(assert (= (and b!1204731 c!118238) b!1204728))

(assert (= (and b!1204731 (not c!118238)) b!1204733))

(declare-fun b_lambda!21107 () Bool)

(assert (=> (not b_lambda!21107) (not b!1204725)))

(assert (=> b!1204725 t!39379))

(declare-fun b_and!42707 () Bool)

(assert (= b_and!42705 (and (=> t!39379 result!21963) b_and!42707)))

(declare-fun b_lambda!21109 () Bool)

(assert (=> (not b_lambda!21109) (not b!1204736)))

(assert (=> b!1204736 t!39379))

(declare-fun b_and!42709 () Bool)

(assert (= b_and!42707 (and (=> t!39379 result!21963) b_and!42709)))

(declare-fun m!1110735 () Bool)

(assert (=> b!1204725 m!1110735))

(assert (=> b!1204725 m!1110735))

(declare-fun m!1110737 () Bool)

(assert (=> b!1204725 m!1110737))

(assert (=> b!1204725 m!1110447))

(assert (=> b!1204725 m!1110405))

(declare-fun m!1110739 () Bool)

(assert (=> b!1204725 m!1110739))

(declare-fun m!1110741 () Bool)

(assert (=> b!1204725 m!1110741))

(assert (=> b!1204725 m!1110739))

(assert (=> b!1204725 m!1110405))

(declare-fun m!1110743 () Bool)

(assert (=> b!1204725 m!1110743))

(declare-fun m!1110745 () Bool)

(assert (=> b!1204725 m!1110745))

(assert (=> b!1204736 m!1110447))

(assert (=> b!1204736 m!1110405))

(assert (=> b!1204736 m!1110739))

(assert (=> b!1204736 m!1110739))

(assert (=> b!1204736 m!1110405))

(assert (=> b!1204736 m!1110743))

(assert (=> b!1204736 m!1110447))

(declare-fun m!1110747 () Bool)

(assert (=> b!1204736 m!1110747))

(declare-fun m!1110749 () Bool)

(assert (=> bm!58094 m!1110749))

(assert (=> b!1204732 m!1110447))

(assert (=> b!1204732 m!1110447))

(declare-fun m!1110751 () Bool)

(assert (=> b!1204732 m!1110751))

(declare-fun m!1110753 () Bool)

(assert (=> b!1204733 m!1110753))

(declare-fun m!1110755 () Bool)

(assert (=> d!132957 m!1110755))

(assert (=> d!132957 m!1110441))

(assert (=> b!1204727 m!1110447))

(assert (=> b!1204727 m!1110447))

(declare-fun m!1110757 () Bool)

(assert (=> b!1204727 m!1110757))

(assert (=> b!1204734 m!1110447))

(assert (=> b!1204734 m!1110447))

(assert (=> b!1204734 m!1110751))

(assert (=> b!1204728 m!1110749))

(declare-fun m!1110759 () Bool)

(assert (=> b!1204735 m!1110759))

(assert (=> b!1204452 d!132957))

(declare-fun d!132959 () Bool)

(assert (=> d!132959 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1204438 d!132959))

(declare-fun b!1204737 () Bool)

(declare-fun e!684196 () Bool)

(declare-fun call!58098 () Bool)

(assert (=> b!1204737 (= e!684196 call!58098)))

(declare-fun b!1204738 () Bool)

(declare-fun e!684197 () Bool)

(declare-fun e!684195 () Bool)

(assert (=> b!1204738 (= e!684197 e!684195)))

(declare-fun c!118241 () Bool)

(assert (=> b!1204738 (= c!118241 (validKeyInArray!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun bm!58095 () Bool)

(assert (=> bm!58095 (= call!58098 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545876 mask!1564))))

(declare-fun b!1204739 () Bool)

(assert (=> b!1204739 (= e!684195 call!58098)))

(declare-fun b!1204740 () Bool)

(assert (=> b!1204740 (= e!684195 e!684196)))

(declare-fun lt!546056 () (_ BitVec 64))

(assert (=> b!1204740 (= lt!546056 (select (arr!37644 lt!545876) #b00000000000000000000000000000000))))

(declare-fun lt!546054 () Unit!39848)

(assert (=> b!1204740 (= lt!546054 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545876 lt!546056 #b00000000000000000000000000000000))))

(assert (=> b!1204740 (arrayContainsKey!0 lt!545876 lt!546056 #b00000000000000000000000000000000)))

(declare-fun lt!546055 () Unit!39848)

(assert (=> b!1204740 (= lt!546055 lt!546054)))

(declare-fun res!801361 () Bool)

(assert (=> b!1204740 (= res!801361 (= (seekEntryOrOpen!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) lt!545876 mask!1564) (Found!9889 #b00000000000000000000000000000000)))))

(assert (=> b!1204740 (=> (not res!801361) (not e!684196))))

(declare-fun d!132961 () Bool)

(declare-fun res!801360 () Bool)

(assert (=> d!132961 (=> res!801360 e!684197)))

(assert (=> d!132961 (= res!801360 (bvsge #b00000000000000000000000000000000 (size!38181 lt!545876)))))

(assert (=> d!132961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545876 mask!1564) e!684197)))

(assert (= (and d!132961 (not res!801360)) b!1204738))

(assert (= (and b!1204738 c!118241) b!1204740))

(assert (= (and b!1204738 (not c!118241)) b!1204739))

(assert (= (and b!1204740 res!801361) b!1204737))

(assert (= (or b!1204737 b!1204739) bm!58095))

(assert (=> b!1204738 m!1110667))

(assert (=> b!1204738 m!1110667))

(assert (=> b!1204738 m!1110671))

(declare-fun m!1110761 () Bool)

(assert (=> bm!58095 m!1110761))

(assert (=> b!1204740 m!1110667))

(declare-fun m!1110763 () Bool)

(assert (=> b!1204740 m!1110763))

(declare-fun m!1110765 () Bool)

(assert (=> b!1204740 m!1110765))

(assert (=> b!1204740 m!1110667))

(declare-fun m!1110767 () Bool)

(assert (=> b!1204740 m!1110767))

(assert (=> b!1204429 d!132961))

(declare-fun d!132963 () Bool)

(declare-fun res!801366 () Bool)

(declare-fun e!684202 () Bool)

(assert (=> d!132963 (=> res!801366 e!684202)))

(assert (=> d!132963 (= res!801366 (= (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132963 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!684202)))

(declare-fun b!1204745 () Bool)

(declare-fun e!684203 () Bool)

(assert (=> b!1204745 (= e!684202 e!684203)))

(declare-fun res!801367 () Bool)

(assert (=> b!1204745 (=> (not res!801367) (not e!684203))))

(assert (=> b!1204745 (= res!801367 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun b!1204746 () Bool)

(assert (=> b!1204746 (= e!684203 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132963 (not res!801366)) b!1204745))

(assert (= (and b!1204745 res!801367) b!1204746))

(assert (=> d!132963 m!1110571))

(declare-fun m!1110769 () Bool)

(assert (=> b!1204746 m!1110769))

(assert (=> b!1204430 d!132963))

(declare-fun d!132965 () Bool)

(assert (=> d!132965 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546059 () Unit!39848)

(declare-fun choose!13 (array!78011 (_ BitVec 64) (_ BitVec 32)) Unit!39848)

(assert (=> d!132965 (= lt!546059 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132965 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132965 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546059)))

(declare-fun bs!34078 () Bool)

(assert (= bs!34078 d!132965))

(assert (=> bs!34078 m!1110425))

(declare-fun m!1110771 () Bool)

(assert (=> bs!34078 m!1110771))

(assert (=> b!1204430 d!132965))

(declare-fun d!132967 () Bool)

(assert (=> d!132967 (contains!6929 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!546060 () Unit!39848)

(assert (=> d!132967 (= lt!546060 (choose!1790 (ite c!118180 lt!545866 lt!545865) (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132967 (contains!6929 (ite c!118180 lt!545866 lt!545865) k0!934)))

(assert (=> d!132967 (= (addStillContains!1006 (ite c!118180 lt!545866 lt!545865) (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)) k0!934) lt!546060)))

(declare-fun bs!34079 () Bool)

(assert (= bs!34079 d!132967))

(declare-fun m!1110773 () Bool)

(assert (=> bs!34079 m!1110773))

(assert (=> bs!34079 m!1110773))

(declare-fun m!1110775 () Bool)

(assert (=> bs!34079 m!1110775))

(declare-fun m!1110777 () Bool)

(assert (=> bs!34079 m!1110777))

(declare-fun m!1110779 () Bool)

(assert (=> bs!34079 m!1110779))

(assert (=> bm!58032 d!132967))

(declare-fun b!1204753 () Bool)

(declare-fun e!684209 () Bool)

(declare-fun e!684208 () Bool)

(assert (=> b!1204753 (= e!684209 e!684208)))

(declare-fun c!118244 () Bool)

(assert (=> b!1204753 (= c!118244 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun call!58104 () ListLongMap!17677)

(declare-fun bm!58100 () Bool)

(assert (=> bm!58100 (= call!58104 (getCurrentListMapNoExtraKeys!5321 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)) (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58103 () ListLongMap!17677)

(declare-fun b!1204754 () Bool)

(assert (=> b!1204754 (= e!684208 (= call!58104 (-!1801 call!58103 k0!934)))))

(assert (=> b!1204754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38182 _values!996)))))

(declare-fun d!132969 () Bool)

(assert (=> d!132969 e!684209))

(declare-fun res!801370 () Bool)

(assert (=> d!132969 (=> (not res!801370) (not e!684209))))

(assert (=> d!132969 (= res!801370 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38181 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38181 _keys!1208))))))))

(declare-fun lt!546063 () Unit!39848)

(declare-fun choose!1791 (array!78011 array!78013 (_ BitVec 32) (_ BitVec 32) V!45929 V!45929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39848)

(assert (=> d!132969 (= lt!546063 (choose!1791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132969 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 _keys!1208)))))

(assert (=> d!132969 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546063)))

(declare-fun b!1204755 () Bool)

(assert (=> b!1204755 (= e!684208 (= call!58104 call!58103))))

(assert (=> b!1204755 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38182 _values!996)))))

(declare-fun bm!58101 () Bool)

(assert (=> bm!58101 (= call!58103 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!132969 res!801370) b!1204753))

(assert (= (and b!1204753 c!118244) b!1204754))

(assert (= (and b!1204753 (not c!118244)) b!1204755))

(assert (= (or b!1204754 b!1204755) bm!58101))

(assert (= (or b!1204754 b!1204755) bm!58100))

(declare-fun b_lambda!21111 () Bool)

(assert (=> (not b_lambda!21111) (not bm!58100)))

(assert (=> bm!58100 t!39379))

(declare-fun b_and!42711 () Bool)

(assert (= b_and!42709 (and (=> t!39379 result!21963) b_and!42711)))

(assert (=> bm!58100 m!1110445))

(assert (=> bm!58100 m!1110405))

(assert (=> bm!58100 m!1110407))

(declare-fun m!1110781 () Bool)

(assert (=> bm!58100 m!1110781))

(declare-fun m!1110783 () Bool)

(assert (=> b!1204754 m!1110783))

(declare-fun m!1110785 () Bool)

(assert (=> d!132969 m!1110785))

(assert (=> bm!58101 m!1110417))

(assert (=> b!1204431 d!132969))

(declare-fun b!1204762 () Bool)

(declare-fun e!684214 () Bool)

(assert (=> b!1204762 (= e!684214 tp_is_empty!30601)))

(declare-fun b!1204763 () Bool)

(declare-fun e!684215 () Bool)

(assert (=> b!1204763 (= e!684215 tp_is_empty!30601)))

(declare-fun mapIsEmpty!47753 () Bool)

(declare-fun mapRes!47753 () Bool)

(assert (=> mapIsEmpty!47753 mapRes!47753))

(declare-fun condMapEmpty!47753 () Bool)

(declare-fun mapDefault!47753 () ValueCell!14591)

(assert (=> mapNonEmpty!47744 (= condMapEmpty!47753 (= mapRest!47744 ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47753)))))

(assert (=> mapNonEmpty!47744 (= tp!90681 (and e!684215 mapRes!47753))))

(declare-fun mapNonEmpty!47753 () Bool)

(declare-fun tp!90696 () Bool)

(assert (=> mapNonEmpty!47753 (= mapRes!47753 (and tp!90696 e!684214))))

(declare-fun mapKey!47753 () (_ BitVec 32))

(declare-fun mapValue!47753 () ValueCell!14591)

(declare-fun mapRest!47753 () (Array (_ BitVec 32) ValueCell!14591))

(assert (=> mapNonEmpty!47753 (= mapRest!47744 (store mapRest!47753 mapKey!47753 mapValue!47753))))

(assert (= (and mapNonEmpty!47744 condMapEmpty!47753) mapIsEmpty!47753))

(assert (= (and mapNonEmpty!47744 (not condMapEmpty!47753)) mapNonEmpty!47753))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14591) mapValue!47753)) b!1204762))

(assert (= (and mapNonEmpty!47744 ((_ is ValueCellFull!14591) mapDefault!47753)) b!1204763))

(declare-fun m!1110787 () Bool)

(assert (=> mapNonEmpty!47753 m!1110787))

(declare-fun b_lambda!21113 () Bool)

(assert (= b_lambda!21103 (or (and start!100810 b_free!25897) b_lambda!21113)))

(declare-fun b_lambda!21115 () Bool)

(assert (= b_lambda!21109 (or (and start!100810 b_free!25897) b_lambda!21115)))

(declare-fun b_lambda!21117 () Bool)

(assert (= b_lambda!21101 (or (and start!100810 b_free!25897) b_lambda!21117)))

(declare-fun b_lambda!21119 () Bool)

(assert (= b_lambda!21111 (or (and start!100810 b_free!25897) b_lambda!21119)))

(declare-fun b_lambda!21121 () Bool)

(assert (= b_lambda!21105 (or (and start!100810 b_free!25897) b_lambda!21121)))

(declare-fun b_lambda!21123 () Bool)

(assert (= b_lambda!21097 (or (and start!100810 b_free!25897) b_lambda!21123)))

(declare-fun b_lambda!21125 () Bool)

(assert (= b_lambda!21099 (or (and start!100810 b_free!25897) b_lambda!21125)))

(declare-fun b_lambda!21127 () Bool)

(assert (= b_lambda!21095 (or (and start!100810 b_free!25897) b_lambda!21127)))

(declare-fun b_lambda!21129 () Bool)

(assert (= b_lambda!21107 (or (and start!100810 b_free!25897) b_lambda!21129)))

(check-sat (not d!132945) (not b!1204734) (not b!1204690) (not b!1204724) (not bm!58084) (not b!1204670) (not b_lambda!21127) (not b!1204686) (not b_lambda!21117) (not b_lambda!21125) (not b!1204715) (not b!1204660) (not d!132939) (not b!1204668) (not b!1204697) (not mapNonEmpty!47753) (not b!1204693) (not d!132965) (not b!1204732) (not b!1204622) (not bm!58100) (not b_next!25897) (not b!1204725) (not b!1204694) (not b!1204663) (not b!1204723) (not b_lambda!21123) (not b!1204687) (not b!1204707) (not b!1204669) (not b!1204651) (not b!1204657) (not b!1204680) (not b!1204688) (not b!1204713) (not b!1204678) (not bm!58101) (not b!1204736) (not d!132927) (not b!1204659) (not b!1204671) (not b!1204728) (not d!132969) (not b!1204746) (not b!1204648) (not b!1204656) (not b!1204655) (not d!132951) (not b!1204754) (not d!132967) (not bm!58093) (not b!1204710) tp_is_empty!30601 (not d!132941) (not b!1204721) (not d!132929) (not b!1204658) (not b!1204696) (not b!1204619) (not b!1204662) (not b!1204727) (not d!132935) (not b!1204722) (not b_lambda!21093) (not d!132957) (not b!1204691) (not b_lambda!21113) (not b!1204650) (not b!1204716) (not bm!58089) (not b!1204735) (not b!1204720) (not bm!58094) (not b!1204738) (not bm!58087) (not b!1204621) (not b_lambda!21115) (not d!132953) (not bm!58095) (not b!1204740) (not bm!58088) (not b!1204667) (not bm!58092) b_and!42711 (not d!132937) (not b!1204709) (not b!1204733) (not d!132955) (not b_lambda!21119) (not b_lambda!21129) (not b_lambda!21121) (not b!1204712))
(check-sat b_and!42711 (not b_next!25897))
(get-model)

(declare-fun d!132971 () Bool)

(declare-fun isEmpty!985 (List!26511) Bool)

(assert (=> d!132971 (= (isEmpty!984 lt!545982) (isEmpty!985 (toList!8854 lt!545982)))))

(declare-fun bs!34080 () Bool)

(assert (= bs!34080 d!132971))

(declare-fun m!1110789 () Bool)

(assert (=> bs!34080 m!1110789))

(assert (=> b!1204668 d!132971))

(declare-fun d!132973 () Bool)

(declare-fun res!801373 () Bool)

(declare-fun e!684216 () Bool)

(assert (=> d!132973 (=> res!801373 e!684216)))

(assert (=> d!132973 (= res!801373 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> d!132973 (= (arrayNoDuplicates!0 lt!545876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118228 (Cons!26508 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) Nil!26509) Nil!26509)) e!684216)))

(declare-fun bm!58102 () Bool)

(declare-fun call!58105 () Bool)

(declare-fun c!118245 () Bool)

(assert (=> bm!58102 (= call!58105 (arrayNoDuplicates!0 lt!545876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118245 (Cons!26508 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118228 (Cons!26508 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) Nil!26509) Nil!26509)) (ite c!118228 (Cons!26508 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) Nil!26509) Nil!26509))))))

(declare-fun b!1204764 () Bool)

(declare-fun e!684219 () Bool)

(declare-fun e!684217 () Bool)

(assert (=> b!1204764 (= e!684219 e!684217)))

(assert (=> b!1204764 (= c!118245 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1204765 () Bool)

(assert (=> b!1204765 (= e!684217 call!58105)))

(declare-fun b!1204766 () Bool)

(assert (=> b!1204766 (= e!684216 e!684219)))

(declare-fun res!801372 () Bool)

(assert (=> b!1204766 (=> (not res!801372) (not e!684219))))

(declare-fun e!684218 () Bool)

(assert (=> b!1204766 (= res!801372 (not e!684218))))

(declare-fun res!801371 () Bool)

(assert (=> b!1204766 (=> (not res!801371) (not e!684218))))

(assert (=> b!1204766 (= res!801371 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1204767 () Bool)

(assert (=> b!1204767 (= e!684218 (contains!6930 (ite c!118228 (Cons!26508 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) Nil!26509) Nil!26509) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1204768 () Bool)

(assert (=> b!1204768 (= e!684217 call!58105)))

(assert (= (and d!132973 (not res!801373)) b!1204766))

(assert (= (and b!1204766 res!801371) b!1204767))

(assert (= (and b!1204766 res!801372) b!1204764))

(assert (= (and b!1204764 c!118245) b!1204768))

(assert (= (and b!1204764 (not c!118245)) b!1204765))

(assert (= (or b!1204768 b!1204765) bm!58102))

(declare-fun m!1110791 () Bool)

(assert (=> bm!58102 m!1110791))

(declare-fun m!1110793 () Bool)

(assert (=> bm!58102 m!1110793))

(assert (=> b!1204764 m!1110791))

(assert (=> b!1204764 m!1110791))

(declare-fun m!1110795 () Bool)

(assert (=> b!1204764 m!1110795))

(assert (=> b!1204766 m!1110791))

(assert (=> b!1204766 m!1110791))

(assert (=> b!1204766 m!1110795))

(assert (=> b!1204767 m!1110791))

(assert (=> b!1204767 m!1110791))

(declare-fun m!1110797 () Bool)

(assert (=> b!1204767 m!1110797))

(assert (=> bm!58089 d!132973))

(declare-fun d!132975 () Bool)

(declare-fun isEmpty!986 (Option!678) Bool)

(assert (=> d!132975 (= (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934)) (not (isEmpty!986 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))))

(declare-fun bs!34081 () Bool)

(assert (= bs!34081 d!132975))

(assert (=> bs!34081 m!1110703))

(declare-fun m!1110799 () Bool)

(assert (=> bs!34081 m!1110799))

(assert (=> b!1204712 d!132975))

(declare-fun b!1204779 () Bool)

(declare-fun e!684225 () Option!678)

(assert (=> b!1204779 (= e!684225 (getValueByKey!627 (t!39380 (toList!8854 (ite c!118180 lt!545866 call!58030))) k0!934))))

(declare-fun b!1204778 () Bool)

(declare-fun e!684224 () Option!678)

(assert (=> b!1204778 (= e!684224 e!684225)))

(declare-fun c!118251 () Bool)

(assert (=> b!1204778 (= c!118251 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 call!58030))) (not (= (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030)))) k0!934))))))

(declare-fun b!1204777 () Bool)

(assert (=> b!1204777 (= e!684224 (Some!677 (_2!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030))))))))

(declare-fun b!1204780 () Bool)

(assert (=> b!1204780 (= e!684225 None!676)))

(declare-fun d!132977 () Bool)

(declare-fun c!118250 () Bool)

(assert (=> d!132977 (= c!118250 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 call!58030))) (= (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030)))) k0!934)))))

(assert (=> d!132977 (= (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934) e!684224)))

(assert (= (and d!132977 c!118250) b!1204777))

(assert (= (and d!132977 (not c!118250)) b!1204778))

(assert (= (and b!1204778 c!118251) b!1204779))

(assert (= (and b!1204778 (not c!118251)) b!1204780))

(declare-fun m!1110801 () Bool)

(assert (=> b!1204779 m!1110801))

(assert (=> b!1204712 d!132977))

(declare-fun d!132979 () Bool)

(assert (=> d!132979 (= (isEmpty!984 lt!546040) (isEmpty!985 (toList!8854 lt!546040)))))

(declare-fun bs!34082 () Bool)

(assert (= bs!34082 d!132979))

(declare-fun m!1110803 () Bool)

(assert (=> bs!34082 m!1110803))

(assert (=> b!1204721 d!132979))

(declare-fun d!132981 () Bool)

(declare-fun e!684226 () Bool)

(assert (=> d!132981 e!684226))

(declare-fun res!801374 () Bool)

(assert (=> d!132981 (=> res!801374 e!684226)))

(declare-fun lt!546065 () Bool)

(assert (=> d!132981 (= res!801374 (not lt!546065))))

(declare-fun lt!546067 () Bool)

(assert (=> d!132981 (= lt!546065 lt!546067)))

(declare-fun lt!546064 () Unit!39848)

(declare-fun e!684227 () Unit!39848)

(assert (=> d!132981 (= lt!546064 e!684227)))

(declare-fun c!118252 () Bool)

(assert (=> d!132981 (= c!118252 lt!546067)))

(assert (=> d!132981 (= lt!546067 (containsKey!589 (toList!8854 lt!546047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132981 (= (contains!6929 lt!546047 #b0000000000000000000000000000000000000000000000000000000000000000) lt!546065)))

(declare-fun b!1204781 () Bool)

(declare-fun lt!546066 () Unit!39848)

(assert (=> b!1204781 (= e!684227 lt!546066)))

(assert (=> b!1204781 (= lt!546066 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1204781 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204782 () Bool)

(declare-fun Unit!39858 () Unit!39848)

(assert (=> b!1204782 (= e!684227 Unit!39858)))

(declare-fun b!1204783 () Bool)

(assert (=> b!1204783 (= e!684226 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132981 c!118252) b!1204781))

(assert (= (and d!132981 (not c!118252)) b!1204782))

(assert (= (and d!132981 (not res!801374)) b!1204783))

(declare-fun m!1110805 () Bool)

(assert (=> d!132981 m!1110805))

(declare-fun m!1110807 () Bool)

(assert (=> b!1204781 m!1110807))

(declare-fun m!1110809 () Bool)

(assert (=> b!1204781 m!1110809))

(assert (=> b!1204781 m!1110809))

(declare-fun m!1110811 () Bool)

(assert (=> b!1204781 m!1110811))

(assert (=> b!1204783 m!1110809))

(assert (=> b!1204783 m!1110809))

(assert (=> b!1204783 m!1110811))

(assert (=> d!132957 d!132981))

(assert (=> d!132957 d!132959))

(declare-fun d!132983 () Bool)

(declare-fun e!684228 () Bool)

(assert (=> d!132983 e!684228))

(declare-fun res!801375 () Bool)

(assert (=> d!132983 (=> res!801375 e!684228)))

(declare-fun lt!546069 () Bool)

(assert (=> d!132983 (= res!801375 (not lt!546069))))

(declare-fun lt!546071 () Bool)

(assert (=> d!132983 (= lt!546069 lt!546071)))

(declare-fun lt!546068 () Unit!39848)

(declare-fun e!684229 () Unit!39848)

(assert (=> d!132983 (= lt!546068 e!684229)))

(declare-fun c!118253 () Bool)

(assert (=> d!132983 (= c!118253 lt!546071)))

(assert (=> d!132983 (= lt!546071 (containsKey!589 (toList!8854 lt!545975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132983 (= (contains!6929 lt!545975 #b0000000000000000000000000000000000000000000000000000000000000000) lt!546069)))

(declare-fun b!1204784 () Bool)

(declare-fun lt!546070 () Unit!39848)

(assert (=> b!1204784 (= e!684229 lt!546070)))

(assert (=> b!1204784 (= lt!546070 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1204784 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204785 () Bool)

(declare-fun Unit!39859 () Unit!39848)

(assert (=> b!1204785 (= e!684229 Unit!39859)))

(declare-fun b!1204786 () Bool)

(assert (=> b!1204786 (= e!684228 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132983 c!118253) b!1204784))

(assert (= (and d!132983 (not c!118253)) b!1204785))

(assert (= (and d!132983 (not res!801375)) b!1204786))

(declare-fun m!1110813 () Bool)

(assert (=> d!132983 m!1110813))

(declare-fun m!1110815 () Bool)

(assert (=> b!1204784 m!1110815))

(declare-fun m!1110817 () Bool)

(assert (=> b!1204784 m!1110817))

(assert (=> b!1204784 m!1110817))

(declare-fun m!1110819 () Bool)

(assert (=> b!1204784 m!1110819))

(assert (=> b!1204786 m!1110817))

(assert (=> b!1204786 m!1110817))

(assert (=> b!1204786 m!1110819))

(assert (=> d!132927 d!132983))

(assert (=> d!132927 d!132959))

(declare-fun d!132985 () Bool)

(assert (=> d!132985 (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(declare-fun lt!546074 () Unit!39848)

(declare-fun choose!1792 (List!26511 (_ BitVec 64)) Unit!39848)

(assert (=> d!132985 (= lt!546074 (choose!1792 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(declare-fun e!684232 () Bool)

(assert (=> d!132985 e!684232))

(declare-fun res!801378 () Bool)

(assert (=> d!132985 (=> (not res!801378) (not e!684232))))

(declare-fun isStrictlySorted!716 (List!26511) Bool)

(assert (=> d!132985 (= res!801378 (isStrictlySorted!716 (toList!8854 (ite c!118180 lt!545866 call!58030))))))

(assert (=> d!132985 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934) lt!546074)))

(declare-fun b!1204789 () Bool)

(assert (=> b!1204789 (= e!684232 (containsKey!589 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934))))

(assert (= (and d!132985 res!801378) b!1204789))

(assert (=> d!132985 m!1110703))

(assert (=> d!132985 m!1110703))

(assert (=> d!132985 m!1110705))

(declare-fun m!1110821 () Bool)

(assert (=> d!132985 m!1110821))

(declare-fun m!1110823 () Bool)

(assert (=> d!132985 m!1110823))

(assert (=> b!1204789 m!1110699))

(assert (=> b!1204710 d!132985))

(assert (=> b!1204710 d!132975))

(assert (=> b!1204710 d!132977))

(declare-fun b!1204792 () Bool)

(declare-fun e!684234 () Option!678)

(assert (=> b!1204792 (= e!684234 (getValueByKey!627 (t!39380 (toList!8854 lt!546015)) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1204791 () Bool)

(declare-fun e!684233 () Option!678)

(assert (=> b!1204791 (= e!684233 e!684234)))

(declare-fun c!118255 () Bool)

(assert (=> b!1204791 (= c!118255 (and ((_ is Cons!26507) (toList!8854 lt!546015)) (not (= (_1!9861 (h!27725 (toList!8854 lt!546015))) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun b!1204790 () Bool)

(assert (=> b!1204790 (= e!684233 (Some!677 (_2!9861 (h!27725 (toList!8854 lt!546015)))))))

(declare-fun b!1204793 () Bool)

(assert (=> b!1204793 (= e!684234 None!676)))

(declare-fun d!132987 () Bool)

(declare-fun c!118254 () Bool)

(assert (=> d!132987 (= c!118254 (and ((_ is Cons!26507) (toList!8854 lt!546015)) (= (_1!9861 (h!27725 (toList!8854 lt!546015))) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132987 (= (getValueByKey!627 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!684233)))

(assert (= (and d!132987 c!118254) b!1204790))

(assert (= (and d!132987 (not c!118254)) b!1204791))

(assert (= (and b!1204791 c!118255) b!1204792))

(assert (= (and b!1204791 (not c!118255)) b!1204793))

(declare-fun m!1110825 () Bool)

(assert (=> b!1204792 m!1110825))

(assert (=> b!1204686 d!132987))

(declare-fun d!132989 () Bool)

(declare-fun e!684235 () Bool)

(assert (=> d!132989 e!684235))

(declare-fun res!801379 () Bool)

(assert (=> d!132989 (=> res!801379 e!684235)))

(declare-fun lt!546076 () Bool)

(assert (=> d!132989 (= res!801379 (not lt!546076))))

(declare-fun lt!546078 () Bool)

(assert (=> d!132989 (= lt!546076 lt!546078)))

(declare-fun lt!546075 () Unit!39848)

(declare-fun e!684236 () Unit!39848)

(assert (=> d!132989 (= lt!546075 e!684236)))

(declare-fun c!118256 () Bool)

(assert (=> d!132989 (= c!118256 lt!546078)))

(assert (=> d!132989 (= lt!546078 (containsKey!589 (toList!8854 lt!546035) k0!934))))

(assert (=> d!132989 (= (contains!6929 lt!546035 k0!934) lt!546076)))

(declare-fun b!1204794 () Bool)

(declare-fun lt!546077 () Unit!39848)

(assert (=> b!1204794 (= e!684236 lt!546077)))

(assert (=> b!1204794 (= lt!546077 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546035) k0!934))))

(assert (=> b!1204794 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546035) k0!934))))

(declare-fun b!1204795 () Bool)

(declare-fun Unit!39860 () Unit!39848)

(assert (=> b!1204795 (= e!684236 Unit!39860)))

(declare-fun b!1204796 () Bool)

(assert (=> b!1204796 (= e!684235 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546035) k0!934)))))

(assert (= (and d!132989 c!118256) b!1204794))

(assert (= (and d!132989 (not c!118256)) b!1204795))

(assert (= (and d!132989 (not res!801379)) b!1204796))

(declare-fun m!1110827 () Bool)

(assert (=> d!132989 m!1110827))

(declare-fun m!1110829 () Bool)

(assert (=> b!1204794 m!1110829))

(declare-fun m!1110831 () Bool)

(assert (=> b!1204794 m!1110831))

(assert (=> b!1204794 m!1110831))

(declare-fun m!1110833 () Bool)

(assert (=> b!1204794 m!1110833))

(assert (=> b!1204796 m!1110831))

(assert (=> b!1204796 m!1110831))

(assert (=> b!1204796 m!1110833))

(assert (=> d!132951 d!132989))

(declare-fun b!1204807 () Bool)

(declare-fun e!684245 () Bool)

(declare-fun lt!546081 () List!26511)

(assert (=> b!1204807 (= e!684245 (not (containsKey!589 lt!546081 k0!934)))))

(declare-fun b!1204808 () Bool)

(declare-fun e!684244 () List!26511)

(declare-fun e!684243 () List!26511)

(assert (=> b!1204808 (= e!684244 e!684243)))

(declare-fun c!118261 () Bool)

(assert (=> b!1204808 (= c!118261 (and ((_ is Cons!26507) (toList!8854 call!58032)) (not (= (_1!9861 (h!27725 (toList!8854 call!58032))) k0!934))))))

(declare-fun b!1204809 () Bool)

(declare-fun $colon$colon!610 (List!26511 tuple2!19700) List!26511)

(assert (=> b!1204809 (= e!684243 ($colon$colon!610 (removeStrictlySorted!92 (t!39380 (toList!8854 call!58032)) k0!934) (h!27725 (toList!8854 call!58032))))))

(declare-fun b!1204810 () Bool)

(assert (=> b!1204810 (= e!684243 Nil!26508)))

(declare-fun b!1204811 () Bool)

(assert (=> b!1204811 (= e!684244 (t!39380 (toList!8854 call!58032)))))

(declare-fun d!132991 () Bool)

(assert (=> d!132991 e!684245))

(declare-fun res!801382 () Bool)

(assert (=> d!132991 (=> (not res!801382) (not e!684245))))

(assert (=> d!132991 (= res!801382 (isStrictlySorted!716 lt!546081))))

(assert (=> d!132991 (= lt!546081 e!684244)))

(declare-fun c!118262 () Bool)

(assert (=> d!132991 (= c!118262 (and ((_ is Cons!26507) (toList!8854 call!58032)) (= (_1!9861 (h!27725 (toList!8854 call!58032))) k0!934)))))

(assert (=> d!132991 (isStrictlySorted!716 (toList!8854 call!58032))))

(assert (=> d!132991 (= (removeStrictlySorted!92 (toList!8854 call!58032) k0!934) lt!546081)))

(assert (= (and d!132991 c!118262) b!1204811))

(assert (= (and d!132991 (not c!118262)) b!1204808))

(assert (= (and b!1204808 c!118261) b!1204809))

(assert (= (and b!1204808 (not c!118261)) b!1204810))

(assert (= (and d!132991 res!801382) b!1204807))

(declare-fun m!1110835 () Bool)

(assert (=> b!1204807 m!1110835))

(declare-fun m!1110837 () Bool)

(assert (=> b!1204809 m!1110837))

(assert (=> b!1204809 m!1110837))

(declare-fun m!1110839 () Bool)

(assert (=> b!1204809 m!1110839))

(declare-fun m!1110841 () Bool)

(assert (=> d!132991 m!1110841))

(declare-fun m!1110843 () Bool)

(assert (=> d!132991 m!1110843))

(assert (=> d!132951 d!132991))

(declare-fun d!132993 () Bool)

(declare-fun e!684246 () Bool)

(assert (=> d!132993 e!684246))

(declare-fun res!801383 () Bool)

(assert (=> d!132993 (=> res!801383 e!684246)))

(declare-fun lt!546083 () Bool)

(assert (=> d!132993 (= res!801383 (not lt!546083))))

(declare-fun lt!546085 () Bool)

(assert (=> d!132993 (= lt!546083 lt!546085)))

(declare-fun lt!546082 () Unit!39848)

(declare-fun e!684247 () Unit!39848)

(assert (=> d!132993 (= lt!546082 e!684247)))

(declare-fun c!118263 () Bool)

(assert (=> d!132993 (= c!118263 lt!546085)))

(assert (=> d!132993 (= lt!546085 (containsKey!589 (toList!8854 lt!545975) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132993 (= (contains!6929 lt!545975 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))) lt!546083)))

(declare-fun b!1204812 () Bool)

(declare-fun lt!546084 () Unit!39848)

(assert (=> b!1204812 (= e!684247 lt!546084)))

(assert (=> b!1204812 (= lt!546084 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545975) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204812 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204813 () Bool)

(declare-fun Unit!39861 () Unit!39848)

(assert (=> b!1204813 (= e!684247 Unit!39861)))

(declare-fun b!1204814 () Bool)

(assert (=> b!1204814 (= e!684246 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132993 c!118263) b!1204812))

(assert (= (and d!132993 (not c!118263)) b!1204813))

(assert (= (and d!132993 (not res!801383)) b!1204814))

(assert (=> d!132993 m!1110583))

(declare-fun m!1110845 () Bool)

(assert (=> d!132993 m!1110845))

(assert (=> b!1204812 m!1110583))

(declare-fun m!1110847 () Bool)

(assert (=> b!1204812 m!1110847))

(assert (=> b!1204812 m!1110583))

(declare-fun m!1110849 () Bool)

(assert (=> b!1204812 m!1110849))

(assert (=> b!1204812 m!1110849))

(declare-fun m!1110851 () Bool)

(assert (=> b!1204812 m!1110851))

(assert (=> b!1204814 m!1110583))

(assert (=> b!1204814 m!1110849))

(assert (=> b!1204814 m!1110849))

(assert (=> b!1204814 m!1110851))

(assert (=> b!1204650 d!132993))

(declare-fun d!132995 () Bool)

(assert (=> d!132995 (arrayContainsKey!0 lt!545876 lt!546056 #b00000000000000000000000000000000)))

(declare-fun lt!546086 () Unit!39848)

(assert (=> d!132995 (= lt!546086 (choose!13 lt!545876 lt!546056 #b00000000000000000000000000000000))))

(assert (=> d!132995 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132995 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545876 lt!546056 #b00000000000000000000000000000000) lt!546086)))

(declare-fun bs!34083 () Bool)

(assert (= bs!34083 d!132995))

(assert (=> bs!34083 m!1110765))

(declare-fun m!1110853 () Bool)

(assert (=> bs!34083 m!1110853))

(assert (=> b!1204740 d!132995))

(declare-fun d!132997 () Bool)

(declare-fun res!801384 () Bool)

(declare-fun e!684248 () Bool)

(assert (=> d!132997 (=> res!801384 e!684248)))

(assert (=> d!132997 (= res!801384 (= (select (arr!37644 lt!545876) #b00000000000000000000000000000000) lt!546056))))

(assert (=> d!132997 (= (arrayContainsKey!0 lt!545876 lt!546056 #b00000000000000000000000000000000) e!684248)))

(declare-fun b!1204815 () Bool)

(declare-fun e!684249 () Bool)

(assert (=> b!1204815 (= e!684248 e!684249)))

(declare-fun res!801385 () Bool)

(assert (=> b!1204815 (=> (not res!801385) (not e!684249))))

(assert (=> b!1204815 (= res!801385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun b!1204816 () Bool)

(assert (=> b!1204816 (= e!684249 (arrayContainsKey!0 lt!545876 lt!546056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132997 (not res!801384)) b!1204815))

(assert (= (and b!1204815 res!801385) b!1204816))

(assert (=> d!132997 m!1110667))

(declare-fun m!1110855 () Bool)

(assert (=> b!1204816 m!1110855))

(assert (=> b!1204740 d!132997))

(declare-fun d!132999 () Bool)

(declare-fun lt!546094 () SeekEntryResult!9889)

(assert (=> d!132999 (and (or ((_ is Undefined!9889) lt!546094) (not ((_ is Found!9889) lt!546094)) (and (bvsge (index!41928 lt!546094) #b00000000000000000000000000000000) (bvslt (index!41928 lt!546094) (size!38181 lt!545876)))) (or ((_ is Undefined!9889) lt!546094) ((_ is Found!9889) lt!546094) (not ((_ is MissingZero!9889) lt!546094)) (and (bvsge (index!41927 lt!546094) #b00000000000000000000000000000000) (bvslt (index!41927 lt!546094) (size!38181 lt!545876)))) (or ((_ is Undefined!9889) lt!546094) ((_ is Found!9889) lt!546094) ((_ is MissingZero!9889) lt!546094) (not ((_ is MissingVacant!9889) lt!546094)) (and (bvsge (index!41930 lt!546094) #b00000000000000000000000000000000) (bvslt (index!41930 lt!546094) (size!38181 lt!545876)))) (or ((_ is Undefined!9889) lt!546094) (ite ((_ is Found!9889) lt!546094) (= (select (arr!37644 lt!545876) (index!41928 lt!546094)) (select (arr!37644 lt!545876) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9889) lt!546094) (= (select (arr!37644 lt!545876) (index!41927 lt!546094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9889) lt!546094) (= (select (arr!37644 lt!545876) (index!41930 lt!546094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!684258 () SeekEntryResult!9889)

(assert (=> d!132999 (= lt!546094 e!684258)))

(declare-fun c!118272 () Bool)

(declare-fun lt!546095 () SeekEntryResult!9889)

(assert (=> d!132999 (= c!118272 (and ((_ is Intermediate!9889) lt!546095) (undefined!10701 lt!546095)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78011 (_ BitVec 32)) SeekEntryResult!9889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!132999 (= lt!546095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) mask!1564) (select (arr!37644 lt!545876) #b00000000000000000000000000000000) lt!545876 mask!1564))))

(assert (=> d!132999 (validMask!0 mask!1564)))

(assert (=> d!132999 (= (seekEntryOrOpen!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000) lt!545876 mask!1564) lt!546094)))

(declare-fun b!1204829 () Bool)

(declare-fun e!684256 () SeekEntryResult!9889)

(assert (=> b!1204829 (= e!684256 (MissingZero!9889 (index!41929 lt!546095)))))

(declare-fun b!1204830 () Bool)

(assert (=> b!1204830 (= e!684258 Undefined!9889)))

(declare-fun b!1204831 () Bool)

(declare-fun c!118270 () Bool)

(declare-fun lt!546093 () (_ BitVec 64))

(assert (=> b!1204831 (= c!118270 (= lt!546093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!684257 () SeekEntryResult!9889)

(assert (=> b!1204831 (= e!684257 e!684256)))

(declare-fun b!1204832 () Bool)

(assert (=> b!1204832 (= e!684257 (Found!9889 (index!41929 lt!546095)))))

(declare-fun b!1204833 () Bool)

(assert (=> b!1204833 (= e!684258 e!684257)))

(assert (=> b!1204833 (= lt!546093 (select (arr!37644 lt!545876) (index!41929 lt!546095)))))

(declare-fun c!118271 () Bool)

(assert (=> b!1204833 (= c!118271 (= lt!546093 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun b!1204834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!78011 (_ BitVec 32)) SeekEntryResult!9889)

(assert (=> b!1204834 (= e!684256 (seekKeyOrZeroReturnVacant!0 (x!106340 lt!546095) (index!41929 lt!546095) (index!41929 lt!546095) (select (arr!37644 lt!545876) #b00000000000000000000000000000000) lt!545876 mask!1564))))

(assert (= (and d!132999 c!118272) b!1204830))

(assert (= (and d!132999 (not c!118272)) b!1204833))

(assert (= (and b!1204833 c!118271) b!1204832))

(assert (= (and b!1204833 (not c!118271)) b!1204831))

(assert (= (and b!1204831 c!118270) b!1204829))

(assert (= (and b!1204831 (not c!118270)) b!1204834))

(assert (=> d!132999 m!1110441))

(declare-fun m!1110857 () Bool)

(assert (=> d!132999 m!1110857))

(assert (=> d!132999 m!1110667))

(declare-fun m!1110859 () Bool)

(assert (=> d!132999 m!1110859))

(assert (=> d!132999 m!1110667))

(assert (=> d!132999 m!1110857))

(declare-fun m!1110861 () Bool)

(assert (=> d!132999 m!1110861))

(declare-fun m!1110863 () Bool)

(assert (=> d!132999 m!1110863))

(declare-fun m!1110865 () Bool)

(assert (=> d!132999 m!1110865))

(declare-fun m!1110867 () Bool)

(assert (=> b!1204833 m!1110867))

(assert (=> b!1204834 m!1110667))

(declare-fun m!1110869 () Bool)

(assert (=> b!1204834 m!1110869))

(assert (=> b!1204740 d!132999))

(declare-fun d!133001 () Bool)

(declare-fun get!19234 (Option!678) V!45929)

(assert (=> d!133001 (= (apply!969 lt!545982 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19234 (getValueByKey!627 (toList!8854 lt!545982) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34084 () Bool)

(assert (= bs!34084 d!133001))

(assert (=> bs!34084 m!1110611))

(declare-fun m!1110871 () Bool)

(assert (=> bs!34084 m!1110871))

(assert (=> bs!34084 m!1110871))

(declare-fun m!1110873 () Bool)

(assert (=> bs!34084 m!1110873))

(assert (=> b!1204671 d!133001))

(declare-fun d!133003 () Bool)

(declare-fun c!118275 () Bool)

(assert (=> d!133003 (= c!118275 ((_ is ValueCellFull!14591) (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!684261 () V!45929)

(assert (=> d!133003 (= (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!684261)))

(declare-fun b!1204839 () Bool)

(declare-fun get!19235 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1204839 (= e!684261 (get!19235 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204840 () Bool)

(declare-fun get!19236 (ValueCell!14591 V!45929) V!45929)

(assert (=> b!1204840 (= e!684261 (get!19236 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133003 c!118275) b!1204839))

(assert (= (and d!133003 (not c!118275)) b!1204840))

(assert (=> b!1204839 m!1110613))

(assert (=> b!1204839 m!1110405))

(declare-fun m!1110875 () Bool)

(assert (=> b!1204839 m!1110875))

(assert (=> b!1204840 m!1110613))

(assert (=> b!1204840 m!1110405))

(declare-fun m!1110877 () Bool)

(assert (=> b!1204840 m!1110877))

(assert (=> b!1204671 d!133003))

(declare-fun d!133005 () Bool)

(assert (=> d!133005 (= (validKeyInArray!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204707 d!133005))

(declare-fun d!133007 () Bool)

(assert (=> d!133007 (not (contains!6929 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980)) lt!545976))))

(declare-fun lt!546098 () Unit!39848)

(declare-fun choose!1793 (ListLongMap!17677 (_ BitVec 64) V!45929 (_ BitVec 64)) Unit!39848)

(assert (=> d!133007 (= lt!546098 (choose!1793 lt!545979 lt!545981 lt!545980 lt!545976))))

(declare-fun e!684264 () Bool)

(assert (=> d!133007 e!684264))

(declare-fun res!801388 () Bool)

(assert (=> d!133007 (=> (not res!801388) (not e!684264))))

(assert (=> d!133007 (= res!801388 (not (contains!6929 lt!545979 lt!545976)))))

(assert (=> d!133007 (= (addStillNotContains!290 lt!545979 lt!545981 lt!545980 lt!545976) lt!546098)))

(declare-fun b!1204844 () Bool)

(assert (=> b!1204844 (= e!684264 (not (= lt!545981 lt!545976)))))

(assert (= (and d!133007 res!801388) b!1204844))

(assert (=> d!133007 m!1110579))

(assert (=> d!133007 m!1110579))

(assert (=> d!133007 m!1110581))

(declare-fun m!1110879 () Bool)

(assert (=> d!133007 m!1110879))

(declare-fun m!1110881 () Bool)

(assert (=> d!133007 m!1110881))

(assert (=> b!1204648 d!133007))

(declare-fun d!133009 () Bool)

(declare-fun e!684265 () Bool)

(assert (=> d!133009 e!684265))

(declare-fun res!801389 () Bool)

(assert (=> d!133009 (=> res!801389 e!684265)))

(declare-fun lt!546100 () Bool)

(assert (=> d!133009 (= res!801389 (not lt!546100))))

(declare-fun lt!546102 () Bool)

(assert (=> d!133009 (= lt!546100 lt!546102)))

(declare-fun lt!546099 () Unit!39848)

(declare-fun e!684266 () Unit!39848)

(assert (=> d!133009 (= lt!546099 e!684266)))

(declare-fun c!118276 () Bool)

(assert (=> d!133009 (= c!118276 lt!546102)))

(assert (=> d!133009 (= lt!546102 (containsKey!589 (toList!8854 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980))) lt!545976))))

(assert (=> d!133009 (= (contains!6929 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980)) lt!545976) lt!546100)))

(declare-fun b!1204845 () Bool)

(declare-fun lt!546101 () Unit!39848)

(assert (=> b!1204845 (= e!684266 lt!546101)))

(assert (=> b!1204845 (= lt!546101 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980))) lt!545976))))

(assert (=> b!1204845 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980))) lt!545976))))

(declare-fun b!1204846 () Bool)

(declare-fun Unit!39862 () Unit!39848)

(assert (=> b!1204846 (= e!684266 Unit!39862)))

(declare-fun b!1204847 () Bool)

(assert (=> b!1204847 (= e!684265 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980))) lt!545976)))))

(assert (= (and d!133009 c!118276) b!1204845))

(assert (= (and d!133009 (not c!118276)) b!1204846))

(assert (= (and d!133009 (not res!801389)) b!1204847))

(declare-fun m!1110883 () Bool)

(assert (=> d!133009 m!1110883))

(declare-fun m!1110885 () Bool)

(assert (=> b!1204845 m!1110885))

(declare-fun m!1110887 () Bool)

(assert (=> b!1204845 m!1110887))

(assert (=> b!1204845 m!1110887))

(declare-fun m!1110889 () Bool)

(assert (=> b!1204845 m!1110889))

(assert (=> b!1204847 m!1110887))

(assert (=> b!1204847 m!1110887))

(assert (=> b!1204847 m!1110889))

(assert (=> b!1204648 d!133009))

(declare-fun d!133011 () Bool)

(declare-fun e!684267 () Bool)

(assert (=> d!133011 e!684267))

(declare-fun res!801390 () Bool)

(assert (=> d!133011 (=> (not res!801390) (not e!684267))))

(declare-fun lt!546106 () ListLongMap!17677)

(assert (=> d!133011 (= res!801390 (contains!6929 lt!546106 (_1!9861 (tuple2!19701 lt!545981 lt!545980))))))

(declare-fun lt!546104 () List!26511)

(assert (=> d!133011 (= lt!546106 (ListLongMap!17678 lt!546104))))

(declare-fun lt!546103 () Unit!39848)

(declare-fun lt!546105 () Unit!39848)

(assert (=> d!133011 (= lt!546103 lt!546105)))

(assert (=> d!133011 (= (getValueByKey!627 lt!546104 (_1!9861 (tuple2!19701 lt!545981 lt!545980))) (Some!677 (_2!9861 (tuple2!19701 lt!545981 lt!545980))))))

(assert (=> d!133011 (= lt!546105 (lemmaContainsTupThenGetReturnValue!309 lt!546104 (_1!9861 (tuple2!19701 lt!545981 lt!545980)) (_2!9861 (tuple2!19701 lt!545981 lt!545980))))))

(assert (=> d!133011 (= lt!546104 (insertStrictlySorted!402 (toList!8854 lt!545979) (_1!9861 (tuple2!19701 lt!545981 lt!545980)) (_2!9861 (tuple2!19701 lt!545981 lt!545980))))))

(assert (=> d!133011 (= (+!4021 lt!545979 (tuple2!19701 lt!545981 lt!545980)) lt!546106)))

(declare-fun b!1204848 () Bool)

(declare-fun res!801391 () Bool)

(assert (=> b!1204848 (=> (not res!801391) (not e!684267))))

(assert (=> b!1204848 (= res!801391 (= (getValueByKey!627 (toList!8854 lt!546106) (_1!9861 (tuple2!19701 lt!545981 lt!545980))) (Some!677 (_2!9861 (tuple2!19701 lt!545981 lt!545980)))))))

(declare-fun b!1204849 () Bool)

(assert (=> b!1204849 (= e!684267 (contains!6931 (toList!8854 lt!546106) (tuple2!19701 lt!545981 lt!545980)))))

(assert (= (and d!133011 res!801390) b!1204848))

(assert (= (and b!1204848 res!801391) b!1204849))

(declare-fun m!1110891 () Bool)

(assert (=> d!133011 m!1110891))

(declare-fun m!1110893 () Bool)

(assert (=> d!133011 m!1110893))

(declare-fun m!1110895 () Bool)

(assert (=> d!133011 m!1110895))

(declare-fun m!1110897 () Bool)

(assert (=> d!133011 m!1110897))

(declare-fun m!1110899 () Bool)

(assert (=> b!1204848 m!1110899))

(declare-fun m!1110901 () Bool)

(assert (=> b!1204849 m!1110901))

(assert (=> b!1204648 d!133011))

(declare-fun d!133013 () Bool)

(declare-fun c!118277 () Bool)

(assert (=> d!133013 (= c!118277 ((_ is ValueCellFull!14591) (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!684268 () V!45929)

(assert (=> d!133013 (= (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!684268)))

(declare-fun b!1204850 () Bool)

(assert (=> b!1204850 (= e!684268 (get!19235 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204851 () Bool)

(assert (=> b!1204851 (= e!684268 (get!19236 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133013 c!118277) b!1204850))

(assert (= (and d!133013 (not c!118277)) b!1204851))

(assert (=> b!1204850 m!1110585))

(assert (=> b!1204850 m!1110405))

(declare-fun m!1110903 () Bool)

(assert (=> b!1204850 m!1110903))

(assert (=> b!1204851 m!1110585))

(assert (=> b!1204851 m!1110405))

(declare-fun m!1110905 () Bool)

(assert (=> b!1204851 m!1110905))

(assert (=> b!1204648 d!133013))

(declare-fun d!133015 () Bool)

(declare-fun e!684269 () Bool)

(assert (=> d!133015 e!684269))

(declare-fun res!801392 () Bool)

(assert (=> d!133015 (=> (not res!801392) (not e!684269))))

(declare-fun lt!546110 () ListLongMap!17677)

(assert (=> d!133015 (= res!801392 (contains!6929 lt!546110 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!546108 () List!26511)

(assert (=> d!133015 (= lt!546110 (ListLongMap!17678 lt!546108))))

(declare-fun lt!546107 () Unit!39848)

(declare-fun lt!546109 () Unit!39848)

(assert (=> d!133015 (= lt!546107 lt!546109)))

(assert (=> d!133015 (= (getValueByKey!627 lt!546108 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133015 (= lt!546109 (lemmaContainsTupThenGetReturnValue!309 lt!546108 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133015 (= lt!546108 (insertStrictlySorted!402 (toList!8854 call!58090) (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133015 (= (+!4021 call!58090 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!546110)))

(declare-fun b!1204852 () Bool)

(declare-fun res!801393 () Bool)

(assert (=> b!1204852 (=> (not res!801393) (not e!684269))))

(assert (=> b!1204852 (= res!801393 (= (getValueByKey!627 (toList!8854 lt!546110) (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1204853 () Bool)

(assert (=> b!1204853 (= e!684269 (contains!6931 (toList!8854 lt!546110) (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133015 res!801392) b!1204852))

(assert (= (and b!1204852 res!801393) b!1204853))

(declare-fun m!1110907 () Bool)

(assert (=> d!133015 m!1110907))

(declare-fun m!1110909 () Bool)

(assert (=> d!133015 m!1110909))

(declare-fun m!1110911 () Bool)

(assert (=> d!133015 m!1110911))

(declare-fun m!1110913 () Bool)

(assert (=> d!133015 m!1110913))

(declare-fun m!1110915 () Bool)

(assert (=> b!1204852 m!1110915))

(declare-fun m!1110917 () Bool)

(assert (=> b!1204853 m!1110917))

(assert (=> b!1204648 d!133015))

(declare-fun b!1204854 () Bool)

(declare-fun lt!546113 () Unit!39848)

(declare-fun lt!546114 () Unit!39848)

(assert (=> b!1204854 (= lt!546113 lt!546114)))

(declare-fun lt!546117 () (_ BitVec 64))

(declare-fun lt!546115 () ListLongMap!17677)

(declare-fun lt!546112 () (_ BitVec 64))

(declare-fun lt!546116 () V!45929)

(assert (=> b!1204854 (not (contains!6929 (+!4021 lt!546115 (tuple2!19701 lt!546117 lt!546116)) lt!546112))))

(assert (=> b!1204854 (= lt!546114 (addStillNotContains!290 lt!546115 lt!546117 lt!546116 lt!546112))))

(assert (=> b!1204854 (= lt!546112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204854 (= lt!546116 (get!19233 (select (arr!37645 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204854 (= lt!546117 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58106 () ListLongMap!17677)

(assert (=> b!1204854 (= lt!546115 call!58106)))

(declare-fun e!684276 () ListLongMap!17677)

(assert (=> b!1204854 (= e!684276 (+!4021 call!58106 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19233 (select (arr!37645 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204855 () Bool)

(declare-fun e!684272 () ListLongMap!17677)

(assert (=> b!1204855 (= e!684272 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204856 () Bool)

(declare-fun e!684274 () Bool)

(declare-fun e!684275 () Bool)

(assert (=> b!1204856 (= e!684274 e!684275)))

(assert (=> b!1204856 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun res!801396 () Bool)

(declare-fun lt!546111 () ListLongMap!17677)

(assert (=> b!1204856 (= res!801396 (contains!6929 lt!546111 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1204856 (=> (not res!801396) (not e!684275))))

(declare-fun b!1204857 () Bool)

(declare-fun e!684273 () Bool)

(assert (=> b!1204857 (= e!684273 (= lt!546111 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204858 () Bool)

(assert (=> b!1204858 (= e!684276 call!58106)))

(declare-fun b!1204859 () Bool)

(declare-fun e!684270 () Bool)

(assert (=> b!1204859 (= e!684270 e!684274)))

(declare-fun c!118278 () Bool)

(declare-fun e!684271 () Bool)

(assert (=> b!1204859 (= c!118278 e!684271)))

(declare-fun res!801394 () Bool)

(assert (=> b!1204859 (=> (not res!801394) (not e!684271))))

(assert (=> b!1204859 (= res!801394 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun d!133017 () Bool)

(assert (=> d!133017 e!684270))

(declare-fun res!801395 () Bool)

(assert (=> d!133017 (=> (not res!801395) (not e!684270))))

(assert (=> d!133017 (= res!801395 (not (contains!6929 lt!546111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133017 (= lt!546111 e!684272)))

(declare-fun c!118280 () Bool)

(assert (=> d!133017 (= c!118280 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> d!133017 (validMask!0 mask!1564)))

(assert (=> d!133017 (= (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!546111)))

(declare-fun b!1204860 () Bool)

(assert (=> b!1204860 (= e!684274 e!684273)))

(declare-fun c!118279 () Bool)

(assert (=> b!1204860 (= c!118279 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun b!1204861 () Bool)

(assert (=> b!1204861 (= e!684272 e!684276)))

(declare-fun c!118281 () Bool)

(assert (=> b!1204861 (= c!118281 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1204862 () Bool)

(assert (=> b!1204862 (= e!684273 (isEmpty!984 lt!546111))))

(declare-fun b!1204863 () Bool)

(assert (=> b!1204863 (= e!684271 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1204863 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1204864 () Bool)

(declare-fun res!801397 () Bool)

(assert (=> b!1204864 (=> (not res!801397) (not e!684270))))

(assert (=> b!1204864 (= res!801397 (not (contains!6929 lt!546111 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58103 () Bool)

(assert (=> bm!58103 (= call!58106 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204865 () Bool)

(assert (=> b!1204865 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> b!1204865 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38182 _values!996)))))

(assert (=> b!1204865 (= e!684275 (= (apply!969 lt!546111 (select (arr!37644 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19233 (select (arr!37645 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133017 c!118280) b!1204855))

(assert (= (and d!133017 (not c!118280)) b!1204861))

(assert (= (and b!1204861 c!118281) b!1204854))

(assert (= (and b!1204861 (not c!118281)) b!1204858))

(assert (= (or b!1204854 b!1204858) bm!58103))

(assert (= (and d!133017 res!801395) b!1204864))

(assert (= (and b!1204864 res!801397) b!1204859))

(assert (= (and b!1204859 res!801394) b!1204863))

(assert (= (and b!1204859 c!118278) b!1204856))

(assert (= (and b!1204859 (not c!118278)) b!1204860))

(assert (= (and b!1204856 res!801396) b!1204865))

(assert (= (and b!1204860 c!118279) b!1204857))

(assert (= (and b!1204860 (not c!118279)) b!1204862))

(declare-fun b_lambda!21131 () Bool)

(assert (=> (not b_lambda!21131) (not b!1204854)))

(assert (=> b!1204854 t!39379))

(declare-fun b_and!42713 () Bool)

(assert (= b_and!42711 (and (=> t!39379 result!21963) b_and!42713)))

(declare-fun b_lambda!21133 () Bool)

(assert (=> (not b_lambda!21133) (not b!1204865)))

(assert (=> b!1204865 t!39379))

(declare-fun b_and!42715 () Bool)

(assert (= b_and!42713 (and (=> t!39379 result!21963) b_and!42715)))

(declare-fun m!1110919 () Bool)

(assert (=> b!1204854 m!1110919))

(assert (=> b!1204854 m!1110919))

(declare-fun m!1110921 () Bool)

(assert (=> b!1204854 m!1110921))

(declare-fun m!1110923 () Bool)

(assert (=> b!1204854 m!1110923))

(assert (=> b!1204854 m!1110405))

(declare-fun m!1110925 () Bool)

(assert (=> b!1204854 m!1110925))

(declare-fun m!1110927 () Bool)

(assert (=> b!1204854 m!1110927))

(assert (=> b!1204854 m!1110925))

(assert (=> b!1204854 m!1110405))

(declare-fun m!1110929 () Bool)

(assert (=> b!1204854 m!1110929))

(declare-fun m!1110931 () Bool)

(assert (=> b!1204854 m!1110931))

(assert (=> b!1204865 m!1110923))

(assert (=> b!1204865 m!1110405))

(assert (=> b!1204865 m!1110925))

(assert (=> b!1204865 m!1110925))

(assert (=> b!1204865 m!1110405))

(assert (=> b!1204865 m!1110929))

(assert (=> b!1204865 m!1110923))

(declare-fun m!1110933 () Bool)

(assert (=> b!1204865 m!1110933))

(declare-fun m!1110935 () Bool)

(assert (=> bm!58103 m!1110935))

(assert (=> b!1204861 m!1110923))

(assert (=> b!1204861 m!1110923))

(declare-fun m!1110937 () Bool)

(assert (=> b!1204861 m!1110937))

(declare-fun m!1110939 () Bool)

(assert (=> b!1204862 m!1110939))

(declare-fun m!1110941 () Bool)

(assert (=> d!133017 m!1110941))

(assert (=> d!133017 m!1110441))

(assert (=> b!1204856 m!1110923))

(assert (=> b!1204856 m!1110923))

(declare-fun m!1110943 () Bool)

(assert (=> b!1204856 m!1110943))

(assert (=> b!1204863 m!1110923))

(assert (=> b!1204863 m!1110923))

(assert (=> b!1204863 m!1110937))

(assert (=> b!1204857 m!1110935))

(declare-fun m!1110945 () Bool)

(assert (=> b!1204864 m!1110945))

(assert (=> b!1204728 d!133017))

(declare-fun d!133019 () Bool)

(declare-fun lt!546120 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!544 (List!26512) (InoxSet (_ BitVec 64)))

(assert (=> d!133019 (= lt!546120 (select (content!544 Nil!26509) (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun e!684282 () Bool)

(assert (=> d!133019 (= lt!546120 e!684282)))

(declare-fun res!801402 () Bool)

(assert (=> d!133019 (=> (not res!801402) (not e!684282))))

(assert (=> d!133019 (= res!801402 ((_ is Cons!26508) Nil!26509))))

(assert (=> d!133019 (= (contains!6930 Nil!26509 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)) lt!546120)))

(declare-fun b!1204870 () Bool)

(declare-fun e!684281 () Bool)

(assert (=> b!1204870 (= e!684282 e!684281)))

(declare-fun res!801403 () Bool)

(assert (=> b!1204870 (=> res!801403 e!684281)))

(assert (=> b!1204870 (= res!801403 (= (h!27726 Nil!26509) (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(declare-fun b!1204871 () Bool)

(assert (=> b!1204871 (= e!684281 (contains!6930 (t!39381 Nil!26509) (select (arr!37644 lt!545876) #b00000000000000000000000000000000)))))

(assert (= (and d!133019 res!801402) b!1204870))

(assert (= (and b!1204870 (not res!801403)) b!1204871))

(declare-fun m!1110947 () Bool)

(assert (=> d!133019 m!1110947))

(assert (=> d!133019 m!1110667))

(declare-fun m!1110949 () Bool)

(assert (=> d!133019 m!1110949))

(assert (=> b!1204871 m!1110667))

(declare-fun m!1110951 () Bool)

(assert (=> b!1204871 m!1110951))

(assert (=> b!1204694 d!133019))

(declare-fun d!133021 () Bool)

(assert (=> d!133021 (= (apply!969 lt!546040 (select (arr!37644 lt!545876) from!1455)) (get!19234 (getValueByKey!627 (toList!8854 lt!546040) (select (arr!37644 lt!545876) from!1455))))))

(declare-fun bs!34085 () Bool)

(assert (= bs!34085 d!133021))

(assert (=> bs!34085 m!1110711))

(declare-fun m!1110953 () Bool)

(assert (=> bs!34085 m!1110953))

(assert (=> bs!34085 m!1110953))

(declare-fun m!1110955 () Bool)

(assert (=> bs!34085 m!1110955))

(assert (=> b!1204724 d!133021))

(declare-fun d!133023 () Bool)

(declare-fun c!118282 () Bool)

(assert (=> d!133023 (= c!118282 ((_ is ValueCellFull!14591) (select (arr!37645 lt!545863) from!1455)))))

(declare-fun e!684283 () V!45929)

(assert (=> d!133023 (= (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!684283)))

(declare-fun b!1204872 () Bool)

(assert (=> b!1204872 (= e!684283 (get!19235 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204873 () Bool)

(assert (=> b!1204873 (= e!684283 (get!19236 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133023 c!118282) b!1204872))

(assert (= (and d!133023 (not c!118282)) b!1204873))

(assert (=> b!1204872 m!1110713))

(assert (=> b!1204872 m!1110405))

(declare-fun m!1110957 () Bool)

(assert (=> b!1204872 m!1110957))

(assert (=> b!1204873 m!1110713))

(assert (=> b!1204873 m!1110405))

(declare-fun m!1110959 () Bool)

(assert (=> b!1204873 m!1110959))

(assert (=> b!1204724 d!133023))

(declare-fun b!1204874 () Bool)

(declare-fun e!684285 () Bool)

(declare-fun call!58107 () Bool)

(assert (=> b!1204874 (= e!684285 call!58107)))

(declare-fun b!1204875 () Bool)

(declare-fun e!684286 () Bool)

(declare-fun e!684284 () Bool)

(assert (=> b!1204875 (= e!684286 e!684284)))

(declare-fun c!118283 () Bool)

(assert (=> b!1204875 (= c!118283 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!58104 () Bool)

(assert (=> bm!58104 (= call!58107 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!545876 mask!1564))))

(declare-fun b!1204876 () Bool)

(assert (=> b!1204876 (= e!684284 call!58107)))

(declare-fun b!1204877 () Bool)

(assert (=> b!1204877 (= e!684284 e!684285)))

(declare-fun lt!546123 () (_ BitVec 64))

(assert (=> b!1204877 (= lt!546123 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!546121 () Unit!39848)

(assert (=> b!1204877 (= lt!546121 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545876 lt!546123 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1204877 (arrayContainsKey!0 lt!545876 lt!546123 #b00000000000000000000000000000000)))

(declare-fun lt!546122 () Unit!39848)

(assert (=> b!1204877 (= lt!546122 lt!546121)))

(declare-fun res!801405 () Bool)

(assert (=> b!1204877 (= res!801405 (= (seekEntryOrOpen!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!545876 mask!1564) (Found!9889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1204877 (=> (not res!801405) (not e!684285))))

(declare-fun d!133025 () Bool)

(declare-fun res!801404 () Bool)

(assert (=> d!133025 (=> res!801404 e!684286)))

(assert (=> d!133025 (= res!801404 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> d!133025 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545876 mask!1564) e!684286)))

(assert (= (and d!133025 (not res!801404)) b!1204875))

(assert (= (and b!1204875 c!118283) b!1204877))

(assert (= (and b!1204875 (not c!118283)) b!1204876))

(assert (= (and b!1204877 res!801405) b!1204874))

(assert (= (or b!1204874 b!1204876) bm!58104))

(assert (=> b!1204875 m!1110791))

(assert (=> b!1204875 m!1110791))

(assert (=> b!1204875 m!1110795))

(declare-fun m!1110961 () Bool)

(assert (=> bm!58104 m!1110961))

(assert (=> b!1204877 m!1110791))

(declare-fun m!1110963 () Bool)

(assert (=> b!1204877 m!1110963))

(declare-fun m!1110965 () Bool)

(assert (=> b!1204877 m!1110965))

(assert (=> b!1204877 m!1110791))

(declare-fun m!1110967 () Bool)

(assert (=> b!1204877 m!1110967))

(assert (=> bm!58095 d!133025))

(declare-fun d!133027 () Bool)

(declare-fun e!684287 () Bool)

(assert (=> d!133027 e!684287))

(declare-fun res!801406 () Bool)

(assert (=> d!133027 (=> res!801406 e!684287)))

(declare-fun lt!546125 () Bool)

(assert (=> d!133027 (= res!801406 (not lt!546125))))

(declare-fun lt!546127 () Bool)

(assert (=> d!133027 (= lt!546125 lt!546127)))

(declare-fun lt!546124 () Unit!39848)

(declare-fun e!684288 () Unit!39848)

(assert (=> d!133027 (= lt!546124 e!684288)))

(declare-fun c!118284 () Bool)

(assert (=> d!133027 (= c!118284 lt!546127)))

(assert (=> d!133027 (= lt!546127 (containsKey!589 (toList!8854 lt!545982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133027 (= (contains!6929 lt!545982 #b1000000000000000000000000000000000000000000000000000000000000000) lt!546125)))

(declare-fun b!1204878 () Bool)

(declare-fun lt!546126 () Unit!39848)

(assert (=> b!1204878 (= e!684288 lt!546126)))

(assert (=> b!1204878 (= lt!546126 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1204878 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204879 () Bool)

(declare-fun Unit!39863 () Unit!39848)

(assert (=> b!1204879 (= e!684288 Unit!39863)))

(declare-fun b!1204880 () Bool)

(assert (=> b!1204880 (= e!684287 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133027 c!118284) b!1204878))

(assert (= (and d!133027 (not c!118284)) b!1204879))

(assert (= (and d!133027 (not res!801406)) b!1204880))

(declare-fun m!1110969 () Bool)

(assert (=> d!133027 m!1110969))

(declare-fun m!1110971 () Bool)

(assert (=> b!1204878 m!1110971))

(declare-fun m!1110973 () Bool)

(assert (=> b!1204878 m!1110973))

(assert (=> b!1204878 m!1110973))

(declare-fun m!1110975 () Bool)

(assert (=> b!1204878 m!1110975))

(assert (=> b!1204880 m!1110973))

(assert (=> b!1204880 m!1110973))

(assert (=> b!1204880 m!1110975))

(assert (=> b!1204670 d!133027))

(declare-fun e!684290 () Option!678)

(declare-fun b!1204883 () Bool)

(assert (=> b!1204883 (= e!684290 (getValueByKey!627 (t!39380 (toList!8854 lt!546023)) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204882 () Bool)

(declare-fun e!684289 () Option!678)

(assert (=> b!1204882 (= e!684289 e!684290)))

(declare-fun c!118286 () Bool)

(assert (=> b!1204882 (= c!118286 (and ((_ is Cons!26507) (toList!8854 lt!546023)) (not (= (_1!9861 (h!27725 (toList!8854 lt!546023))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun b!1204881 () Bool)

(assert (=> b!1204881 (= e!684289 (Some!677 (_2!9861 (h!27725 (toList!8854 lt!546023)))))))

(declare-fun b!1204884 () Bool)

(assert (=> b!1204884 (= e!684290 None!676)))

(declare-fun c!118285 () Bool)

(declare-fun d!133029 () Bool)

(assert (=> d!133029 (= c!118285 (and ((_ is Cons!26507) (toList!8854 lt!546023)) (= (_1!9861 (h!27725 (toList!8854 lt!546023))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!133029 (= (getValueByKey!627 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!684289)))

(assert (= (and d!133029 c!118285) b!1204881))

(assert (= (and d!133029 (not c!118285)) b!1204882))

(assert (= (and b!1204882 c!118286) b!1204883))

(assert (= (and b!1204882 (not c!118286)) b!1204884))

(declare-fun m!1110977 () Bool)

(assert (=> b!1204883 m!1110977))

(assert (=> b!1204696 d!133029))

(declare-fun d!133031 () Bool)

(declare-fun e!684291 () Bool)

(assert (=> d!133031 e!684291))

(declare-fun res!801407 () Bool)

(assert (=> d!133031 (=> res!801407 e!684291)))

(declare-fun lt!546129 () Bool)

(assert (=> d!133031 (= res!801407 (not lt!546129))))

(declare-fun lt!546131 () Bool)

(assert (=> d!133031 (= lt!546129 lt!546131)))

(declare-fun lt!546128 () Unit!39848)

(declare-fun e!684292 () Unit!39848)

(assert (=> d!133031 (= lt!546128 e!684292)))

(declare-fun c!118287 () Bool)

(assert (=> d!133031 (= c!118287 lt!546131)))

(assert (=> d!133031 (= lt!546131 (containsKey!589 (toList!8854 lt!546040) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133031 (= (contains!6929 lt!546040 #b1000000000000000000000000000000000000000000000000000000000000000) lt!546129)))

(declare-fun b!1204885 () Bool)

(declare-fun lt!546130 () Unit!39848)

(assert (=> b!1204885 (= e!684292 lt!546130)))

(assert (=> b!1204885 (= lt!546130 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546040) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1204885 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204886 () Bool)

(declare-fun Unit!39864 () Unit!39848)

(assert (=> b!1204886 (= e!684292 Unit!39864)))

(declare-fun b!1204887 () Bool)

(assert (=> b!1204887 (= e!684291 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133031 c!118287) b!1204885))

(assert (= (and d!133031 (not c!118287)) b!1204886))

(assert (= (and d!133031 (not res!801407)) b!1204887))

(declare-fun m!1110979 () Bool)

(assert (=> d!133031 m!1110979))

(declare-fun m!1110981 () Bool)

(assert (=> b!1204885 m!1110981))

(declare-fun m!1110983 () Bool)

(assert (=> b!1204885 m!1110983))

(assert (=> b!1204885 m!1110983))

(declare-fun m!1110985 () Bool)

(assert (=> b!1204885 m!1110985))

(assert (=> b!1204887 m!1110983))

(assert (=> b!1204887 m!1110983))

(assert (=> b!1204887 m!1110985))

(assert (=> b!1204723 d!133031))

(declare-fun d!133033 () Bool)

(declare-fun res!801412 () Bool)

(declare-fun e!684297 () Bool)

(assert (=> d!133033 (=> res!801412 e!684297)))

(assert (=> d!133033 (= res!801412 (and ((_ is Cons!26507) (toList!8854 call!58033)) (= (_1!9861 (h!27725 (toList!8854 call!58033))) k0!934)))))

(assert (=> d!133033 (= (containsKey!589 (toList!8854 call!58033) k0!934) e!684297)))

(declare-fun b!1204892 () Bool)

(declare-fun e!684298 () Bool)

(assert (=> b!1204892 (= e!684297 e!684298)))

(declare-fun res!801413 () Bool)

(assert (=> b!1204892 (=> (not res!801413) (not e!684298))))

(assert (=> b!1204892 (= res!801413 (and (or (not ((_ is Cons!26507) (toList!8854 call!58033))) (bvsle (_1!9861 (h!27725 (toList!8854 call!58033))) k0!934)) ((_ is Cons!26507) (toList!8854 call!58033)) (bvslt (_1!9861 (h!27725 (toList!8854 call!58033))) k0!934)))))

(declare-fun b!1204893 () Bool)

(assert (=> b!1204893 (= e!684298 (containsKey!589 (t!39380 (toList!8854 call!58033)) k0!934))))

(assert (= (and d!133033 (not res!801412)) b!1204892))

(assert (= (and b!1204892 res!801413) b!1204893))

(declare-fun m!1110987 () Bool)

(assert (=> b!1204893 m!1110987))

(assert (=> d!132941 d!133033))

(declare-fun d!133035 () Bool)

(assert (=> d!133035 (= (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204655 d!133035))

(declare-fun d!133037 () Bool)

(declare-fun e!684299 () Bool)

(assert (=> d!133037 e!684299))

(declare-fun res!801414 () Bool)

(assert (=> d!133037 (=> res!801414 e!684299)))

(declare-fun lt!546133 () Bool)

(assert (=> d!133037 (= res!801414 (not lt!546133))))

(declare-fun lt!546135 () Bool)

(assert (=> d!133037 (= lt!546133 lt!546135)))

(declare-fun lt!546132 () Unit!39848)

(declare-fun e!684300 () Unit!39848)

(assert (=> d!133037 (= lt!546132 e!684300)))

(declare-fun c!118288 () Bool)

(assert (=> d!133037 (= c!118288 lt!546135)))

(assert (=> d!133037 (= lt!546135 (containsKey!589 (toList!8854 lt!546047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133037 (= (contains!6929 lt!546047 #b1000000000000000000000000000000000000000000000000000000000000000) lt!546133)))

(declare-fun b!1204894 () Bool)

(declare-fun lt!546134 () Unit!39848)

(assert (=> b!1204894 (= e!684300 lt!546134)))

(assert (=> b!1204894 (= lt!546134 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1204894 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204895 () Bool)

(declare-fun Unit!39865 () Unit!39848)

(assert (=> b!1204895 (= e!684300 Unit!39865)))

(declare-fun b!1204896 () Bool)

(assert (=> b!1204896 (= e!684299 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133037 c!118288) b!1204894))

(assert (= (and d!133037 (not c!118288)) b!1204895))

(assert (= (and d!133037 (not res!801414)) b!1204896))

(declare-fun m!1110989 () Bool)

(assert (=> d!133037 m!1110989))

(declare-fun m!1110991 () Bool)

(assert (=> b!1204894 m!1110991))

(declare-fun m!1110993 () Bool)

(assert (=> b!1204894 m!1110993))

(assert (=> b!1204894 m!1110993))

(declare-fun m!1110995 () Bool)

(assert (=> b!1204894 m!1110995))

(assert (=> b!1204896 m!1110993))

(assert (=> b!1204896 m!1110993))

(assert (=> b!1204896 m!1110995))

(assert (=> b!1204735 d!133037))

(assert (=> bm!58101 d!132929))

(assert (=> b!1204621 d!133005))

(declare-fun d!133039 () Bool)

(assert (=> d!133039 (= (isEmpty!984 lt!546047) (isEmpty!985 (toList!8854 lt!546047)))))

(declare-fun bs!34086 () Bool)

(assert (= bs!34086 d!133039))

(declare-fun m!1110997 () Bool)

(assert (=> bs!34086 m!1110997))

(assert (=> b!1204733 d!133039))

(declare-fun d!133041 () Bool)

(declare-fun lt!546136 () ListLongMap!17677)

(assert (=> d!133041 (not (contains!6929 lt!546136 k0!934))))

(assert (=> d!133041 (= lt!546136 (ListLongMap!17678 (removeStrictlySorted!92 (toList!8854 call!58103) k0!934)))))

(assert (=> d!133041 (= (-!1801 call!58103 k0!934) lt!546136)))

(declare-fun bs!34087 () Bool)

(assert (= bs!34087 d!133041))

(declare-fun m!1110999 () Bool)

(assert (=> bs!34087 m!1110999))

(declare-fun m!1111001 () Bool)

(assert (=> bs!34087 m!1111001))

(assert (=> b!1204754 d!133041))

(declare-fun d!133043 () Bool)

(assert (=> d!133043 (arrayContainsKey!0 _keys!1208 lt!546032 #b00000000000000000000000000000000)))

(declare-fun lt!546137 () Unit!39848)

(assert (=> d!133043 (= lt!546137 (choose!13 _keys!1208 lt!546032 #b00000000000000000000000000000000))))

(assert (=> d!133043 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!133043 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546032 #b00000000000000000000000000000000) lt!546137)))

(declare-fun bs!34088 () Bool)

(assert (= bs!34088 d!133043))

(assert (=> bs!34088 m!1110691))

(declare-fun m!1111003 () Bool)

(assert (=> bs!34088 m!1111003))

(assert (=> b!1204709 d!133043))

(declare-fun d!133045 () Bool)

(declare-fun res!801415 () Bool)

(declare-fun e!684301 () Bool)

(assert (=> d!133045 (=> res!801415 e!684301)))

(assert (=> d!133045 (= res!801415 (= (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) lt!546032))))

(assert (=> d!133045 (= (arrayContainsKey!0 _keys!1208 lt!546032 #b00000000000000000000000000000000) e!684301)))

(declare-fun b!1204897 () Bool)

(declare-fun e!684302 () Bool)

(assert (=> b!1204897 (= e!684301 e!684302)))

(declare-fun res!801416 () Bool)

(assert (=> b!1204897 (=> (not res!801416) (not e!684302))))

(assert (=> b!1204897 (= res!801416 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun b!1204898 () Bool)

(assert (=> b!1204898 (= e!684302 (arrayContainsKey!0 _keys!1208 lt!546032 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133045 (not res!801415)) b!1204897))

(assert (= (and b!1204897 res!801416) b!1204898))

(assert (=> d!133045 m!1110571))

(declare-fun m!1111005 () Bool)

(assert (=> b!1204898 m!1111005))

(assert (=> b!1204709 d!133045))

(declare-fun d!133047 () Bool)

(declare-fun lt!546139 () SeekEntryResult!9889)

(assert (=> d!133047 (and (or ((_ is Undefined!9889) lt!546139) (not ((_ is Found!9889) lt!546139)) (and (bvsge (index!41928 lt!546139) #b00000000000000000000000000000000) (bvslt (index!41928 lt!546139) (size!38181 _keys!1208)))) (or ((_ is Undefined!9889) lt!546139) ((_ is Found!9889) lt!546139) (not ((_ is MissingZero!9889) lt!546139)) (and (bvsge (index!41927 lt!546139) #b00000000000000000000000000000000) (bvslt (index!41927 lt!546139) (size!38181 _keys!1208)))) (or ((_ is Undefined!9889) lt!546139) ((_ is Found!9889) lt!546139) ((_ is MissingZero!9889) lt!546139) (not ((_ is MissingVacant!9889) lt!546139)) (and (bvsge (index!41930 lt!546139) #b00000000000000000000000000000000) (bvslt (index!41930 lt!546139) (size!38181 _keys!1208)))) (or ((_ is Undefined!9889) lt!546139) (ite ((_ is Found!9889) lt!546139) (= (select (arr!37644 _keys!1208) (index!41928 lt!546139)) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9889) lt!546139) (= (select (arr!37644 _keys!1208) (index!41927 lt!546139)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9889) lt!546139) (= (select (arr!37644 _keys!1208) (index!41930 lt!546139)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!684305 () SeekEntryResult!9889)

(assert (=> d!133047 (= lt!546139 e!684305)))

(declare-fun c!118291 () Bool)

(declare-fun lt!546140 () SeekEntryResult!9889)

(assert (=> d!133047 (= c!118291 (and ((_ is Intermediate!9889) lt!546140) (undefined!10701 lt!546140)))))

(assert (=> d!133047 (= lt!546140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!133047 (validMask!0 mask!1564)))

(assert (=> d!133047 (= (seekEntryOrOpen!0 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!546139)))

(declare-fun b!1204899 () Bool)

(declare-fun e!684303 () SeekEntryResult!9889)

(assert (=> b!1204899 (= e!684303 (MissingZero!9889 (index!41929 lt!546140)))))

(declare-fun b!1204900 () Bool)

(assert (=> b!1204900 (= e!684305 Undefined!9889)))

(declare-fun b!1204901 () Bool)

(declare-fun c!118289 () Bool)

(declare-fun lt!546138 () (_ BitVec 64))

(assert (=> b!1204901 (= c!118289 (= lt!546138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!684304 () SeekEntryResult!9889)

(assert (=> b!1204901 (= e!684304 e!684303)))

(declare-fun b!1204902 () Bool)

(assert (=> b!1204902 (= e!684304 (Found!9889 (index!41929 lt!546140)))))

(declare-fun b!1204903 () Bool)

(assert (=> b!1204903 (= e!684305 e!684304)))

(assert (=> b!1204903 (= lt!546138 (select (arr!37644 _keys!1208) (index!41929 lt!546140)))))

(declare-fun c!118290 () Bool)

(assert (=> b!1204903 (= c!118290 (= lt!546138 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204904 () Bool)

(assert (=> b!1204904 (= e!684303 (seekKeyOrZeroReturnVacant!0 (x!106340 lt!546140) (index!41929 lt!546140) (index!41929 lt!546140) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (= (and d!133047 c!118291) b!1204900))

(assert (= (and d!133047 (not c!118291)) b!1204903))

(assert (= (and b!1204903 c!118290) b!1204902))

(assert (= (and b!1204903 (not c!118290)) b!1204901))

(assert (= (and b!1204901 c!118289) b!1204899))

(assert (= (and b!1204901 (not c!118289)) b!1204904))

(assert (=> d!133047 m!1110441))

(declare-fun m!1111007 () Bool)

(assert (=> d!133047 m!1111007))

(assert (=> d!133047 m!1110571))

(declare-fun m!1111009 () Bool)

(assert (=> d!133047 m!1111009))

(assert (=> d!133047 m!1110571))

(assert (=> d!133047 m!1111007))

(declare-fun m!1111011 () Bool)

(assert (=> d!133047 m!1111011))

(declare-fun m!1111013 () Bool)

(assert (=> d!133047 m!1111013))

(declare-fun m!1111015 () Bool)

(assert (=> d!133047 m!1111015))

(declare-fun m!1111017 () Bool)

(assert (=> b!1204903 m!1111017))

(assert (=> b!1204904 m!1110571))

(declare-fun m!1111019 () Bool)

(assert (=> b!1204904 m!1111019))

(assert (=> b!1204709 d!133047))

(declare-fun b!1204905 () Bool)

(declare-fun lt!546143 () Unit!39848)

(declare-fun lt!546144 () Unit!39848)

(assert (=> b!1204905 (= lt!546143 lt!546144)))

(declare-fun lt!546146 () V!45929)

(declare-fun lt!546147 () (_ BitVec 64))

(declare-fun lt!546142 () (_ BitVec 64))

(declare-fun lt!546145 () ListLongMap!17677)

(assert (=> b!1204905 (not (contains!6929 (+!4021 lt!546145 (tuple2!19701 lt!546147 lt!546146)) lt!546142))))

(assert (=> b!1204905 (= lt!546144 (addStillNotContains!290 lt!546145 lt!546147 lt!546146 lt!546142))))

(assert (=> b!1204905 (= lt!546142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204905 (= lt!546146 (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204905 (= lt!546147 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58108 () ListLongMap!17677)

(assert (=> b!1204905 (= lt!546145 call!58108)))

(declare-fun e!684312 () ListLongMap!17677)

(assert (=> b!1204905 (= e!684312 (+!4021 call!58108 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1204906 () Bool)

(declare-fun e!684308 () ListLongMap!17677)

(assert (=> b!1204906 (= e!684308 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1204907 () Bool)

(declare-fun e!684310 () Bool)

(declare-fun e!684311 () Bool)

(assert (=> b!1204907 (= e!684310 e!684311)))

(assert (=> b!1204907 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun lt!546141 () ListLongMap!17677)

(declare-fun res!801419 () Bool)

(assert (=> b!1204907 (= res!801419 (contains!6929 lt!546141 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1204907 (=> (not res!801419) (not e!684311))))

(declare-fun b!1204908 () Bool)

(declare-fun e!684309 () Bool)

(assert (=> b!1204908 (= e!684309 (= lt!546141 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1204909 () Bool)

(assert (=> b!1204909 (= e!684312 call!58108)))

(declare-fun b!1204910 () Bool)

(declare-fun e!684306 () Bool)

(assert (=> b!1204910 (= e!684306 e!684310)))

(declare-fun c!118292 () Bool)

(declare-fun e!684307 () Bool)

(assert (=> b!1204910 (= c!118292 e!684307)))

(declare-fun res!801417 () Bool)

(assert (=> b!1204910 (=> (not res!801417) (not e!684307))))

(assert (=> b!1204910 (= res!801417 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun d!133049 () Bool)

(assert (=> d!133049 e!684306))

(declare-fun res!801418 () Bool)

(assert (=> d!133049 (=> (not res!801418) (not e!684306))))

(assert (=> d!133049 (= res!801418 (not (contains!6929 lt!546141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133049 (= lt!546141 e!684308)))

(declare-fun c!118294 () Bool)

(assert (=> d!133049 (= c!118294 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> d!133049 (validMask!0 mask!1564)))

(assert (=> d!133049 (= (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!546141)))

(declare-fun b!1204911 () Bool)

(assert (=> b!1204911 (= e!684310 e!684309)))

(declare-fun c!118293 () Bool)

(assert (=> b!1204911 (= c!118293 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun b!1204912 () Bool)

(assert (=> b!1204912 (= e!684308 e!684312)))

(declare-fun c!118295 () Bool)

(assert (=> b!1204912 (= c!118295 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1204913 () Bool)

(assert (=> b!1204913 (= e!684309 (isEmpty!984 lt!546141))))

(declare-fun b!1204914 () Bool)

(assert (=> b!1204914 (= e!684307 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1204914 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1204915 () Bool)

(declare-fun res!801420 () Bool)

(assert (=> b!1204915 (=> (not res!801420) (not e!684306))))

(assert (=> b!1204915 (= res!801420 (not (contains!6929 lt!546141 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58105 () Bool)

(assert (=> bm!58105 (= call!58108 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204916 () Bool)

(assert (=> b!1204916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> b!1204916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38182 lt!545863)))))

(assert (=> b!1204916 (= e!684311 (= (apply!969 lt!546141 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19233 (select (arr!37645 lt!545863) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133049 c!118294) b!1204906))

(assert (= (and d!133049 (not c!118294)) b!1204912))

(assert (= (and b!1204912 c!118295) b!1204905))

(assert (= (and b!1204912 (not c!118295)) b!1204909))

(assert (= (or b!1204905 b!1204909) bm!58105))

(assert (= (and d!133049 res!801418) b!1204915))

(assert (= (and b!1204915 res!801420) b!1204910))

(assert (= (and b!1204910 res!801417) b!1204914))

(assert (= (and b!1204910 c!118292) b!1204907))

(assert (= (and b!1204910 (not c!118292)) b!1204911))

(assert (= (and b!1204907 res!801419) b!1204916))

(assert (= (and b!1204911 c!118293) b!1204908))

(assert (= (and b!1204911 (not c!118293)) b!1204913))

(declare-fun b_lambda!21135 () Bool)

(assert (=> (not b_lambda!21135) (not b!1204905)))

(assert (=> b!1204905 t!39379))

(declare-fun b_and!42717 () Bool)

(assert (= b_and!42715 (and (=> t!39379 result!21963) b_and!42717)))

(declare-fun b_lambda!21137 () Bool)

(assert (=> (not b_lambda!21137) (not b!1204916)))

(assert (=> b!1204916 t!39379))

(declare-fun b_and!42719 () Bool)

(assert (= b_and!42717 (and (=> t!39379 result!21963) b_and!42719)))

(declare-fun m!1111021 () Bool)

(assert (=> b!1204905 m!1111021))

(assert (=> b!1204905 m!1111021))

(declare-fun m!1111023 () Bool)

(assert (=> b!1204905 m!1111023))

(declare-fun m!1111025 () Bool)

(assert (=> b!1204905 m!1111025))

(assert (=> b!1204905 m!1110405))

(declare-fun m!1111027 () Bool)

(assert (=> b!1204905 m!1111027))

(declare-fun m!1111029 () Bool)

(assert (=> b!1204905 m!1111029))

(assert (=> b!1204905 m!1111027))

(assert (=> b!1204905 m!1110405))

(declare-fun m!1111031 () Bool)

(assert (=> b!1204905 m!1111031))

(declare-fun m!1111033 () Bool)

(assert (=> b!1204905 m!1111033))

(assert (=> b!1204916 m!1111025))

(assert (=> b!1204916 m!1110405))

(assert (=> b!1204916 m!1111027))

(assert (=> b!1204916 m!1111027))

(assert (=> b!1204916 m!1110405))

(assert (=> b!1204916 m!1111031))

(assert (=> b!1204916 m!1111025))

(declare-fun m!1111035 () Bool)

(assert (=> b!1204916 m!1111035))

(declare-fun m!1111037 () Bool)

(assert (=> bm!58105 m!1111037))

(assert (=> b!1204912 m!1111025))

(assert (=> b!1204912 m!1111025))

(declare-fun m!1111039 () Bool)

(assert (=> b!1204912 m!1111039))

(declare-fun m!1111041 () Bool)

(assert (=> b!1204913 m!1111041))

(declare-fun m!1111043 () Bool)

(assert (=> d!133049 m!1111043))

(assert (=> d!133049 m!1110441))

(assert (=> b!1204907 m!1111025))

(assert (=> b!1204907 m!1111025))

(declare-fun m!1111045 () Bool)

(assert (=> b!1204907 m!1111045))

(assert (=> b!1204914 m!1111025))

(assert (=> b!1204914 m!1111025))

(assert (=> b!1204914 m!1111039))

(assert (=> b!1204908 m!1111037))

(declare-fun m!1111047 () Bool)

(assert (=> b!1204915 m!1111047))

(assert (=> b!1204651 d!133049))

(declare-fun d!133051 () Bool)

(declare-fun e!684313 () Bool)

(assert (=> d!133051 e!684313))

(declare-fun res!801421 () Bool)

(assert (=> d!133051 (=> res!801421 e!684313)))

(declare-fun lt!546149 () Bool)

(assert (=> d!133051 (= res!801421 (not lt!546149))))

(declare-fun lt!546151 () Bool)

(assert (=> d!133051 (= lt!546149 lt!546151)))

(declare-fun lt!546148 () Unit!39848)

(declare-fun e!684314 () Unit!39848)

(assert (=> d!133051 (= lt!546148 e!684314)))

(declare-fun c!118296 () Bool)

(assert (=> d!133051 (= c!118296 lt!546151)))

(assert (=> d!133051 (= lt!546151 (containsKey!589 (toList!8854 lt!545982) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!133051 (= (contains!6929 lt!545982 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!546149)))

(declare-fun b!1204917 () Bool)

(declare-fun lt!546150 () Unit!39848)

(assert (=> b!1204917 (= e!684314 lt!546150)))

(assert (=> b!1204917 (= lt!546150 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545982) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204917 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204918 () Bool)

(declare-fun Unit!39866 () Unit!39848)

(assert (=> b!1204918 (= e!684314 Unit!39866)))

(declare-fun b!1204919 () Bool)

(assert (=> b!1204919 (= e!684313 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!133051 c!118296) b!1204917))

(assert (= (and d!133051 (not c!118296)) b!1204918))

(assert (= (and d!133051 (not res!801421)) b!1204919))

(assert (=> d!133051 m!1110611))

(declare-fun m!1111049 () Bool)

(assert (=> d!133051 m!1111049))

(assert (=> b!1204917 m!1110611))

(declare-fun m!1111051 () Bool)

(assert (=> b!1204917 m!1111051))

(assert (=> b!1204917 m!1110611))

(assert (=> b!1204917 m!1110871))

(assert (=> b!1204917 m!1110871))

(declare-fun m!1111053 () Bool)

(assert (=> b!1204917 m!1111053))

(assert (=> b!1204919 m!1110611))

(assert (=> b!1204919 m!1110871))

(assert (=> b!1204919 m!1110871))

(assert (=> b!1204919 m!1111053))

(assert (=> b!1204662 d!133051))

(assert (=> bm!58087 d!133049))

(declare-fun d!133053 () Bool)

(declare-fun e!684315 () Bool)

(assert (=> d!133053 e!684315))

(declare-fun res!801422 () Bool)

(assert (=> d!133053 (=> res!801422 e!684315)))

(declare-fun lt!546153 () Bool)

(assert (=> d!133053 (= res!801422 (not lt!546153))))

(declare-fun lt!546155 () Bool)

(assert (=> d!133053 (= lt!546153 lt!546155)))

(declare-fun lt!546152 () Unit!39848)

(declare-fun e!684316 () Unit!39848)

(assert (=> d!133053 (= lt!546152 e!684316)))

(declare-fun c!118297 () Bool)

(assert (=> d!133053 (= c!118297 lt!546155)))

(assert (=> d!133053 (= lt!546155 (containsKey!589 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133053 (= (contains!6929 lt!546023 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!546153)))

(declare-fun b!1204920 () Bool)

(declare-fun lt!546154 () Unit!39848)

(assert (=> b!1204920 (= e!684316 lt!546154)))

(assert (=> b!1204920 (= lt!546154 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> b!1204920 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204921 () Bool)

(declare-fun Unit!39867 () Unit!39848)

(assert (=> b!1204921 (= e!684316 Unit!39867)))

(declare-fun b!1204922 () Bool)

(assert (=> b!1204922 (= e!684315 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546023) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!133053 c!118297) b!1204920))

(assert (= (and d!133053 (not c!118297)) b!1204921))

(assert (= (and d!133053 (not res!801422)) b!1204922))

(declare-fun m!1111055 () Bool)

(assert (=> d!133053 m!1111055))

(declare-fun m!1111057 () Bool)

(assert (=> b!1204920 m!1111057))

(assert (=> b!1204920 m!1110683))

(assert (=> b!1204920 m!1110683))

(declare-fun m!1111059 () Bool)

(assert (=> b!1204920 m!1111059))

(assert (=> b!1204922 m!1110683))

(assert (=> b!1204922 m!1110683))

(assert (=> b!1204922 m!1111059))

(assert (=> d!132945 d!133053))

(declare-fun e!684318 () Option!678)

(declare-fun b!1204925 () Bool)

(assert (=> b!1204925 (= e!684318 (getValueByKey!627 (t!39380 lt!546021) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204924 () Bool)

(declare-fun e!684317 () Option!678)

(assert (=> b!1204924 (= e!684317 e!684318)))

(declare-fun c!118299 () Bool)

(assert (=> b!1204924 (= c!118299 (and ((_ is Cons!26507) lt!546021) (not (= (_1!9861 (h!27725 lt!546021)) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun b!1204923 () Bool)

(assert (=> b!1204923 (= e!684317 (Some!677 (_2!9861 (h!27725 lt!546021))))))

(declare-fun b!1204926 () Bool)

(assert (=> b!1204926 (= e!684318 None!676)))

(declare-fun c!118298 () Bool)

(declare-fun d!133055 () Bool)

(assert (=> d!133055 (= c!118298 (and ((_ is Cons!26507) lt!546021) (= (_1!9861 (h!27725 lt!546021)) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!133055 (= (getValueByKey!627 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!684317)))

(assert (= (and d!133055 c!118298) b!1204923))

(assert (= (and d!133055 (not c!118298)) b!1204924))

(assert (= (and b!1204924 c!118299) b!1204925))

(assert (= (and b!1204924 (not c!118299)) b!1204926))

(declare-fun m!1111061 () Bool)

(assert (=> b!1204925 m!1111061))

(assert (=> d!132945 d!133055))

(declare-fun d!133057 () Bool)

(assert (=> d!133057 (= (getValueByKey!627 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!677 (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!546158 () Unit!39848)

(declare-fun choose!1794 (List!26511 (_ BitVec 64) V!45929) Unit!39848)

(assert (=> d!133057 (= lt!546158 (choose!1794 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!684321 () Bool)

(assert (=> d!133057 e!684321))

(declare-fun res!801427 () Bool)

(assert (=> d!133057 (=> (not res!801427) (not e!684321))))

(assert (=> d!133057 (= res!801427 (isStrictlySorted!716 lt!546021))))

(assert (=> d!133057 (= (lemmaContainsTupThenGetReturnValue!309 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!546158)))

(declare-fun b!1204931 () Bool)

(declare-fun res!801428 () Bool)

(assert (=> b!1204931 (=> (not res!801428) (not e!684321))))

(assert (=> b!1204931 (= res!801428 (containsKey!589 lt!546021 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204932 () Bool)

(assert (=> b!1204932 (= e!684321 (contains!6931 lt!546021 (tuple2!19701 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!133057 res!801427) b!1204931))

(assert (= (and b!1204931 res!801428) b!1204932))

(assert (=> d!133057 m!1110677))

(declare-fun m!1111063 () Bool)

(assert (=> d!133057 m!1111063))

(declare-fun m!1111065 () Bool)

(assert (=> d!133057 m!1111065))

(declare-fun m!1111067 () Bool)

(assert (=> b!1204931 m!1111067))

(declare-fun m!1111069 () Bool)

(assert (=> b!1204932 m!1111069))

(assert (=> d!132945 d!133057))

(declare-fun bm!58112 () Bool)

(declare-fun call!58117 () List!26511)

(declare-fun call!58115 () List!26511)

(assert (=> bm!58112 (= call!58117 call!58115)))

(declare-fun b!1204953 () Bool)

(declare-fun e!684332 () List!26511)

(declare-fun call!58116 () List!26511)

(assert (=> b!1204953 (= e!684332 call!58116)))

(declare-fun bm!58113 () Bool)

(declare-fun c!118309 () Bool)

(declare-fun e!684335 () List!26511)

(assert (=> bm!58113 (= call!58116 ($colon$colon!610 e!684335 (ite c!118309 (h!27725 (toList!8854 (ite c!118180 lt!545866 lt!545865))) (tuple2!19701 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun c!118310 () Bool)

(assert (=> bm!58113 (= c!118310 c!118309)))

(declare-fun c!118311 () Bool)

(declare-fun b!1204954 () Bool)

(assert (=> b!1204954 (= c!118311 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 lt!545865))) (bvsgt (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 lt!545865)))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun e!684334 () List!26511)

(declare-fun e!684333 () List!26511)

(assert (=> b!1204954 (= e!684334 e!684333)))

(declare-fun e!684336 () Bool)

(declare-fun lt!546161 () List!26511)

(declare-fun b!1204955 () Bool)

(assert (=> b!1204955 (= e!684336 (contains!6931 lt!546161 (tuple2!19701 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun bm!58114 () Bool)

(assert (=> bm!58114 (= call!58115 call!58116)))

(declare-fun b!1204956 () Bool)

(assert (=> b!1204956 (= e!684334 call!58115)))

(declare-fun c!118308 () Bool)

(declare-fun b!1204957 () Bool)

(assert (=> b!1204957 (= e!684335 (ite c!118308 (t!39380 (toList!8854 (ite c!118180 lt!545866 lt!545865))) (ite c!118311 (Cons!26507 (h!27725 (toList!8854 (ite c!118180 lt!545866 lt!545865))) (t!39380 (toList!8854 (ite c!118180 lt!545866 lt!545865)))) Nil!26508)))))

(declare-fun b!1204958 () Bool)

(assert (=> b!1204958 (= e!684335 (insertStrictlySorted!402 (t!39380 (toList!8854 (ite c!118180 lt!545866 lt!545865))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204959 () Bool)

(assert (=> b!1204959 (= e!684333 call!58117)))

(declare-fun d!133059 () Bool)

(assert (=> d!133059 e!684336))

(declare-fun res!801434 () Bool)

(assert (=> d!133059 (=> (not res!801434) (not e!684336))))

(assert (=> d!133059 (= res!801434 (isStrictlySorted!716 lt!546161))))

(assert (=> d!133059 (= lt!546161 e!684332)))

(assert (=> d!133059 (= c!118309 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 lt!545865))) (bvslt (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 lt!545865)))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!133059 (isStrictlySorted!716 (toList!8854 (ite c!118180 lt!545866 lt!545865)))))

(assert (=> d!133059 (= (insertStrictlySorted!402 (toList!8854 (ite c!118180 lt!545866 lt!545865)) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!546161)))

(declare-fun b!1204960 () Bool)

(assert (=> b!1204960 (= e!684333 call!58117)))

(declare-fun b!1204961 () Bool)

(declare-fun res!801433 () Bool)

(assert (=> b!1204961 (=> (not res!801433) (not e!684336))))

(assert (=> b!1204961 (= res!801433 (containsKey!589 lt!546161 (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204962 () Bool)

(assert (=> b!1204962 (= e!684332 e!684334)))

(assert (=> b!1204962 (= c!118308 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 lt!545865))) (= (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 lt!545865)))) (_1!9861 (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!133059 c!118309) b!1204953))

(assert (= (and d!133059 (not c!118309)) b!1204962))

(assert (= (and b!1204962 c!118308) b!1204956))

(assert (= (and b!1204962 (not c!118308)) b!1204954))

(assert (= (and b!1204954 c!118311) b!1204959))

(assert (= (and b!1204954 (not c!118311)) b!1204960))

(assert (= (or b!1204959 b!1204960) bm!58112))

(assert (= (or b!1204956 bm!58112) bm!58114))

(assert (= (or b!1204953 bm!58114) bm!58113))

(assert (= (and bm!58113 c!118310) b!1204958))

(assert (= (and bm!58113 (not c!118310)) b!1204957))

(assert (= (and d!133059 res!801434) b!1204961))

(assert (= (and b!1204961 res!801433) b!1204955))

(declare-fun m!1111071 () Bool)

(assert (=> b!1204958 m!1111071))

(declare-fun m!1111073 () Bool)

(assert (=> b!1204961 m!1111073))

(declare-fun m!1111075 () Bool)

(assert (=> b!1204955 m!1111075))

(declare-fun m!1111077 () Bool)

(assert (=> d!133059 m!1111077))

(declare-fun m!1111079 () Bool)

(assert (=> d!133059 m!1111079))

(declare-fun m!1111081 () Bool)

(assert (=> bm!58113 m!1111081))

(assert (=> d!132945 d!133059))

(declare-fun d!133061 () Bool)

(declare-fun e!684337 () Bool)

(assert (=> d!133061 e!684337))

(declare-fun res!801435 () Bool)

(assert (=> d!133061 (=> res!801435 e!684337)))

(declare-fun lt!546163 () Bool)

(assert (=> d!133061 (= res!801435 (not lt!546163))))

(declare-fun lt!546165 () Bool)

(assert (=> d!133061 (= lt!546163 lt!546165)))

(declare-fun lt!546162 () Unit!39848)

(declare-fun e!684338 () Unit!39848)

(assert (=> d!133061 (= lt!546162 e!684338)))

(declare-fun c!118312 () Bool)

(assert (=> d!133061 (= c!118312 lt!546165)))

(assert (=> d!133061 (= lt!546165 (containsKey!589 (toList!8854 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> d!133061 (= (contains!6929 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934) lt!546163)))

(declare-fun b!1204963 () Bool)

(declare-fun lt!546164 () Unit!39848)

(assert (=> b!1204963 (= e!684338 lt!546164)))

(assert (=> b!1204963 (= lt!546164 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(assert (=> b!1204963 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934))))

(declare-fun b!1204964 () Bool)

(declare-fun Unit!39868 () Unit!39848)

(assert (=> b!1204964 (= e!684338 Unit!39868)))

(declare-fun b!1204965 () Bool)

(assert (=> b!1204965 (= e!684337 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) k0!934)))))

(assert (= (and d!133061 c!118312) b!1204963))

(assert (= (and d!133061 (not c!118312)) b!1204964))

(assert (= (and d!133061 (not res!801435)) b!1204965))

(declare-fun m!1111083 () Bool)

(assert (=> d!133061 m!1111083))

(declare-fun m!1111085 () Bool)

(assert (=> b!1204963 m!1111085))

(declare-fun m!1111087 () Bool)

(assert (=> b!1204963 m!1111087))

(assert (=> b!1204963 m!1111087))

(declare-fun m!1111089 () Bool)

(assert (=> b!1204963 m!1111089))

(assert (=> b!1204965 m!1111087))

(assert (=> b!1204965 m!1111087))

(assert (=> b!1204965 m!1111089))

(assert (=> d!132937 d!133061))

(assert (=> d!132937 d!132939))

(declare-fun d!133063 () Bool)

(assert (=> d!133063 (contains!6929 (+!4021 lt!545865 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(assert (=> d!133063 true))

(declare-fun _$35!455 () Unit!39848)

(assert (=> d!133063 (= (choose!1790 lt!545865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) _$35!455)))

(declare-fun bs!34089 () Bool)

(assert (= bs!34089 d!133063))

(assert (=> bs!34089 m!1110399))

(assert (=> bs!34089 m!1110399))

(assert (=> bs!34089 m!1110643))

(assert (=> d!132937 d!133063))

(assert (=> d!132937 d!132935))

(declare-fun d!133065 () Bool)

(declare-fun e!684339 () Bool)

(assert (=> d!133065 e!684339))

(declare-fun res!801436 () Bool)

(assert (=> d!133065 (=> res!801436 e!684339)))

(declare-fun lt!546167 () Bool)

(assert (=> d!133065 (= res!801436 (not lt!546167))))

(declare-fun lt!546169 () Bool)

(assert (=> d!133065 (= lt!546167 lt!546169)))

(declare-fun lt!546166 () Unit!39848)

(declare-fun e!684340 () Unit!39848)

(assert (=> d!133065 (= lt!546166 e!684340)))

(declare-fun c!118313 () Bool)

(assert (=> d!133065 (= c!118313 lt!546169)))

(assert (=> d!133065 (= lt!546169 (containsKey!589 (toList!8854 lt!546040) (select (arr!37644 lt!545876) from!1455)))))

(assert (=> d!133065 (= (contains!6929 lt!546040 (select (arr!37644 lt!545876) from!1455)) lt!546167)))

(declare-fun b!1204967 () Bool)

(declare-fun lt!546168 () Unit!39848)

(assert (=> b!1204967 (= e!684340 lt!546168)))

(assert (=> b!1204967 (= lt!546168 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546040) (select (arr!37644 lt!545876) from!1455)))))

(assert (=> b!1204967 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) (select (arr!37644 lt!545876) from!1455)))))

(declare-fun b!1204968 () Bool)

(declare-fun Unit!39869 () Unit!39848)

(assert (=> b!1204968 (= e!684340 Unit!39869)))

(declare-fun b!1204969 () Bool)

(assert (=> b!1204969 (= e!684339 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) (select (arr!37644 lt!545876) from!1455))))))

(assert (= (and d!133065 c!118313) b!1204967))

(assert (= (and d!133065 (not c!118313)) b!1204968))

(assert (= (and d!133065 (not res!801436)) b!1204969))

(assert (=> d!133065 m!1110711))

(declare-fun m!1111091 () Bool)

(assert (=> d!133065 m!1111091))

(assert (=> b!1204967 m!1110711))

(declare-fun m!1111093 () Bool)

(assert (=> b!1204967 m!1111093))

(assert (=> b!1204967 m!1110711))

(assert (=> b!1204967 m!1110953))

(assert (=> b!1204967 m!1110953))

(declare-fun m!1111095 () Bool)

(assert (=> b!1204967 m!1111095))

(assert (=> b!1204969 m!1110711))

(assert (=> b!1204969 m!1110953))

(assert (=> b!1204969 m!1110953))

(assert (=> b!1204969 m!1111095))

(assert (=> b!1204715 d!133065))

(declare-fun d!133067 () Bool)

(declare-fun e!684341 () Bool)

(assert (=> d!133067 e!684341))

(declare-fun res!801437 () Bool)

(assert (=> d!133067 (=> (not res!801437) (not e!684341))))

(declare-fun lt!546173 () ListLongMap!17677)

(assert (=> d!133067 (= res!801437 (contains!6929 lt!546173 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!546171 () List!26511)

(assert (=> d!133067 (= lt!546173 (ListLongMap!17678 lt!546171))))

(declare-fun lt!546170 () Unit!39848)

(declare-fun lt!546172 () Unit!39848)

(assert (=> d!133067 (= lt!546170 lt!546172)))

(assert (=> d!133067 (= (getValueByKey!627 lt!546171 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133067 (= lt!546172 (lemmaContainsTupThenGetReturnValue!309 lt!546171 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133067 (= lt!546171 (insertStrictlySorted!402 (toList!8854 call!58091) (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133067 (= (+!4021 call!58091 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!546173)))

(declare-fun b!1204970 () Bool)

(declare-fun res!801438 () Bool)

(assert (=> b!1204970 (=> (not res!801438) (not e!684341))))

(assert (=> b!1204970 (= res!801438 (= (getValueByKey!627 (toList!8854 lt!546173) (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1204971 () Bool)

(assert (=> b!1204971 (= e!684341 (contains!6931 (toList!8854 lt!546173) (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133067 res!801437) b!1204970))

(assert (= (and b!1204970 res!801438) b!1204971))

(declare-fun m!1111097 () Bool)

(assert (=> d!133067 m!1111097))

(declare-fun m!1111099 () Bool)

(assert (=> d!133067 m!1111099))

(declare-fun m!1111101 () Bool)

(assert (=> d!133067 m!1111101))

(declare-fun m!1111103 () Bool)

(assert (=> d!133067 m!1111103))

(declare-fun m!1111105 () Bool)

(assert (=> b!1204970 m!1111105))

(declare-fun m!1111107 () Bool)

(assert (=> b!1204971 m!1111107))

(assert (=> b!1204660 d!133067))

(assert (=> b!1204660 d!133003))

(declare-fun d!133069 () Bool)

(declare-fun e!684342 () Bool)

(assert (=> d!133069 e!684342))

(declare-fun res!801439 () Bool)

(assert (=> d!133069 (=> res!801439 e!684342)))

(declare-fun lt!546175 () Bool)

(assert (=> d!133069 (= res!801439 (not lt!546175))))

(declare-fun lt!546177 () Bool)

(assert (=> d!133069 (= lt!546175 lt!546177)))

(declare-fun lt!546174 () Unit!39848)

(declare-fun e!684343 () Unit!39848)

(assert (=> d!133069 (= lt!546174 e!684343)))

(declare-fun c!118314 () Bool)

(assert (=> d!133069 (= c!118314 lt!546177)))

(assert (=> d!133069 (= lt!546177 (containsKey!589 (toList!8854 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987))) lt!545983))))

(assert (=> d!133069 (= (contains!6929 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987)) lt!545983) lt!546175)))

(declare-fun b!1204972 () Bool)

(declare-fun lt!546176 () Unit!39848)

(assert (=> b!1204972 (= e!684343 lt!546176)))

(assert (=> b!1204972 (= lt!546176 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987))) lt!545983))))

(assert (=> b!1204972 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987))) lt!545983))))

(declare-fun b!1204973 () Bool)

(declare-fun Unit!39870 () Unit!39848)

(assert (=> b!1204973 (= e!684343 Unit!39870)))

(declare-fun b!1204974 () Bool)

(assert (=> b!1204974 (= e!684342 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987))) lt!545983)))))

(assert (= (and d!133069 c!118314) b!1204972))

(assert (= (and d!133069 (not c!118314)) b!1204973))

(assert (= (and d!133069 (not res!801439)) b!1204974))

(declare-fun m!1111109 () Bool)

(assert (=> d!133069 m!1111109))

(declare-fun m!1111111 () Bool)

(assert (=> b!1204972 m!1111111))

(declare-fun m!1111113 () Bool)

(assert (=> b!1204972 m!1111113))

(assert (=> b!1204972 m!1111113))

(declare-fun m!1111115 () Bool)

(assert (=> b!1204972 m!1111115))

(assert (=> b!1204974 m!1111113))

(assert (=> b!1204974 m!1111113))

(assert (=> b!1204974 m!1111115))

(assert (=> b!1204660 d!133069))

(declare-fun d!133071 () Bool)

(declare-fun e!684344 () Bool)

(assert (=> d!133071 e!684344))

(declare-fun res!801440 () Bool)

(assert (=> d!133071 (=> (not res!801440) (not e!684344))))

(declare-fun lt!546181 () ListLongMap!17677)

(assert (=> d!133071 (= res!801440 (contains!6929 lt!546181 (_1!9861 (tuple2!19701 lt!545988 lt!545987))))))

(declare-fun lt!546179 () List!26511)

(assert (=> d!133071 (= lt!546181 (ListLongMap!17678 lt!546179))))

(declare-fun lt!546178 () Unit!39848)

(declare-fun lt!546180 () Unit!39848)

(assert (=> d!133071 (= lt!546178 lt!546180)))

(assert (=> d!133071 (= (getValueByKey!627 lt!546179 (_1!9861 (tuple2!19701 lt!545988 lt!545987))) (Some!677 (_2!9861 (tuple2!19701 lt!545988 lt!545987))))))

(assert (=> d!133071 (= lt!546180 (lemmaContainsTupThenGetReturnValue!309 lt!546179 (_1!9861 (tuple2!19701 lt!545988 lt!545987)) (_2!9861 (tuple2!19701 lt!545988 lt!545987))))))

(assert (=> d!133071 (= lt!546179 (insertStrictlySorted!402 (toList!8854 lt!545986) (_1!9861 (tuple2!19701 lt!545988 lt!545987)) (_2!9861 (tuple2!19701 lt!545988 lt!545987))))))

(assert (=> d!133071 (= (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987)) lt!546181)))

(declare-fun b!1204975 () Bool)

(declare-fun res!801441 () Bool)

(assert (=> b!1204975 (=> (not res!801441) (not e!684344))))

(assert (=> b!1204975 (= res!801441 (= (getValueByKey!627 (toList!8854 lt!546181) (_1!9861 (tuple2!19701 lt!545988 lt!545987))) (Some!677 (_2!9861 (tuple2!19701 lt!545988 lt!545987)))))))

(declare-fun b!1204976 () Bool)

(assert (=> b!1204976 (= e!684344 (contains!6931 (toList!8854 lt!546181) (tuple2!19701 lt!545988 lt!545987)))))

(assert (= (and d!133071 res!801440) b!1204975))

(assert (= (and b!1204975 res!801441) b!1204976))

(declare-fun m!1111117 () Bool)

(assert (=> d!133071 m!1111117))

(declare-fun m!1111119 () Bool)

(assert (=> d!133071 m!1111119))

(declare-fun m!1111121 () Bool)

(assert (=> d!133071 m!1111121))

(declare-fun m!1111123 () Bool)

(assert (=> d!133071 m!1111123))

(declare-fun m!1111125 () Bool)

(assert (=> b!1204975 m!1111125))

(declare-fun m!1111127 () Bool)

(assert (=> b!1204976 m!1111127))

(assert (=> b!1204660 d!133071))

(declare-fun d!133073 () Bool)

(assert (=> d!133073 (not (contains!6929 (+!4021 lt!545986 (tuple2!19701 lt!545988 lt!545987)) lt!545983))))

(declare-fun lt!546182 () Unit!39848)

(assert (=> d!133073 (= lt!546182 (choose!1793 lt!545986 lt!545988 lt!545987 lt!545983))))

(declare-fun e!684345 () Bool)

(assert (=> d!133073 e!684345))

(declare-fun res!801442 () Bool)

(assert (=> d!133073 (=> (not res!801442) (not e!684345))))

(assert (=> d!133073 (= res!801442 (not (contains!6929 lt!545986 lt!545983)))))

(assert (=> d!133073 (= (addStillNotContains!290 lt!545986 lt!545988 lt!545987 lt!545983) lt!546182)))

(declare-fun b!1204977 () Bool)

(assert (=> b!1204977 (= e!684345 (not (= lt!545988 lt!545983)))))

(assert (= (and d!133073 res!801442) b!1204977))

(assert (=> d!133073 m!1110607))

(assert (=> d!133073 m!1110607))

(assert (=> d!133073 m!1110609))

(declare-fun m!1111129 () Bool)

(assert (=> d!133073 m!1111129))

(declare-fun m!1111131 () Bool)

(assert (=> d!133073 m!1111131))

(assert (=> b!1204660 d!133073))

(assert (=> b!1204657 d!133035))

(declare-fun d!133075 () Bool)

(assert (=> d!133075 (= (apply!969 lt!546047 (select (arr!37644 _keys!1208) from!1455)) (get!19234 (getValueByKey!627 (toList!8854 lt!546047) (select (arr!37644 _keys!1208) from!1455))))))

(declare-fun bs!34090 () Bool)

(assert (= bs!34090 d!133075))

(assert (=> bs!34090 m!1110447))

(declare-fun m!1111133 () Bool)

(assert (=> bs!34090 m!1111133))

(assert (=> bs!34090 m!1111133))

(declare-fun m!1111135 () Bool)

(assert (=> bs!34090 m!1111135))

(assert (=> b!1204736 d!133075))

(declare-fun d!133077 () Bool)

(declare-fun c!118315 () Bool)

(assert (=> d!133077 (= c!118315 ((_ is ValueCellFull!14591) (select (arr!37645 _values!996) from!1455)))))

(declare-fun e!684346 () V!45929)

(assert (=> d!133077 (= (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!684346)))

(declare-fun b!1204978 () Bool)

(assert (=> b!1204978 (= e!684346 (get!19235 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204979 () Bool)

(assert (=> b!1204979 (= e!684346 (get!19236 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133077 c!118315) b!1204978))

(assert (= (and d!133077 (not c!118315)) b!1204979))

(assert (=> b!1204978 m!1110739))

(assert (=> b!1204978 m!1110405))

(declare-fun m!1111137 () Bool)

(assert (=> b!1204978 m!1111137))

(assert (=> b!1204979 m!1110739))

(assert (=> b!1204979 m!1110405))

(declare-fun m!1111139 () Bool)

(assert (=> b!1204979 m!1111139))

(assert (=> b!1204736 d!133077))

(declare-fun d!133079 () Bool)

(declare-fun e!684347 () Bool)

(assert (=> d!133079 e!684347))

(declare-fun res!801443 () Bool)

(assert (=> d!133079 (=> (not res!801443) (not e!684347))))

(declare-fun lt!546186 () ListLongMap!17677)

(assert (=> d!133079 (= res!801443 (contains!6929 lt!546186 (_1!9861 (tuple2!19701 lt!546046 lt!546045))))))

(declare-fun lt!546184 () List!26511)

(assert (=> d!133079 (= lt!546186 (ListLongMap!17678 lt!546184))))

(declare-fun lt!546183 () Unit!39848)

(declare-fun lt!546185 () Unit!39848)

(assert (=> d!133079 (= lt!546183 lt!546185)))

(assert (=> d!133079 (= (getValueByKey!627 lt!546184 (_1!9861 (tuple2!19701 lt!546046 lt!546045))) (Some!677 (_2!9861 (tuple2!19701 lt!546046 lt!546045))))))

(assert (=> d!133079 (= lt!546185 (lemmaContainsTupThenGetReturnValue!309 lt!546184 (_1!9861 (tuple2!19701 lt!546046 lt!546045)) (_2!9861 (tuple2!19701 lt!546046 lt!546045))))))

(assert (=> d!133079 (= lt!546184 (insertStrictlySorted!402 (toList!8854 lt!546044) (_1!9861 (tuple2!19701 lt!546046 lt!546045)) (_2!9861 (tuple2!19701 lt!546046 lt!546045))))))

(assert (=> d!133079 (= (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045)) lt!546186)))

(declare-fun b!1204980 () Bool)

(declare-fun res!801444 () Bool)

(assert (=> b!1204980 (=> (not res!801444) (not e!684347))))

(assert (=> b!1204980 (= res!801444 (= (getValueByKey!627 (toList!8854 lt!546186) (_1!9861 (tuple2!19701 lt!546046 lt!546045))) (Some!677 (_2!9861 (tuple2!19701 lt!546046 lt!546045)))))))

(declare-fun b!1204981 () Bool)

(assert (=> b!1204981 (= e!684347 (contains!6931 (toList!8854 lt!546186) (tuple2!19701 lt!546046 lt!546045)))))

(assert (= (and d!133079 res!801443) b!1204980))

(assert (= (and b!1204980 res!801444) b!1204981))

(declare-fun m!1111141 () Bool)

(assert (=> d!133079 m!1111141))

(declare-fun m!1111143 () Bool)

(assert (=> d!133079 m!1111143))

(declare-fun m!1111145 () Bool)

(assert (=> d!133079 m!1111145))

(declare-fun m!1111147 () Bool)

(assert (=> d!133079 m!1111147))

(declare-fun m!1111149 () Bool)

(assert (=> b!1204980 m!1111149))

(declare-fun m!1111151 () Bool)

(assert (=> b!1204981 m!1111151))

(assert (=> b!1204713 d!133079))

(declare-fun d!133081 () Bool)

(declare-fun e!684348 () Bool)

(assert (=> d!133081 e!684348))

(declare-fun res!801445 () Bool)

(assert (=> d!133081 (=> res!801445 e!684348)))

(declare-fun lt!546188 () Bool)

(assert (=> d!133081 (= res!801445 (not lt!546188))))

(declare-fun lt!546190 () Bool)

(assert (=> d!133081 (= lt!546188 lt!546190)))

(declare-fun lt!546187 () Unit!39848)

(declare-fun e!684349 () Unit!39848)

(assert (=> d!133081 (= lt!546187 e!684349)))

(declare-fun c!118316 () Bool)

(assert (=> d!133081 (= c!118316 lt!546190)))

(assert (=> d!133081 (= lt!546190 (containsKey!589 (toList!8854 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045))) lt!546041))))

(assert (=> d!133081 (= (contains!6929 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045)) lt!546041) lt!546188)))

(declare-fun b!1204982 () Bool)

(declare-fun lt!546189 () Unit!39848)

(assert (=> b!1204982 (= e!684349 lt!546189)))

(assert (=> b!1204982 (= lt!546189 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045))) lt!546041))))

(assert (=> b!1204982 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045))) lt!546041))))

(declare-fun b!1204983 () Bool)

(declare-fun Unit!39871 () Unit!39848)

(assert (=> b!1204983 (= e!684349 Unit!39871)))

(declare-fun b!1204984 () Bool)

(assert (=> b!1204984 (= e!684348 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045))) lt!546041)))))

(assert (= (and d!133081 c!118316) b!1204982))

(assert (= (and d!133081 (not c!118316)) b!1204983))

(assert (= (and d!133081 (not res!801445)) b!1204984))

(declare-fun m!1111153 () Bool)

(assert (=> d!133081 m!1111153))

(declare-fun m!1111155 () Bool)

(assert (=> b!1204982 m!1111155))

(declare-fun m!1111157 () Bool)

(assert (=> b!1204982 m!1111157))

(assert (=> b!1204982 m!1111157))

(declare-fun m!1111159 () Bool)

(assert (=> b!1204982 m!1111159))

(assert (=> b!1204984 m!1111157))

(assert (=> b!1204984 m!1111157))

(assert (=> b!1204984 m!1111159))

(assert (=> b!1204713 d!133081))

(declare-fun d!133083 () Bool)

(assert (=> d!133083 (not (contains!6929 (+!4021 lt!546044 (tuple2!19701 lt!546046 lt!546045)) lt!546041))))

(declare-fun lt!546191 () Unit!39848)

(assert (=> d!133083 (= lt!546191 (choose!1793 lt!546044 lt!546046 lt!546045 lt!546041))))

(declare-fun e!684350 () Bool)

(assert (=> d!133083 e!684350))

(declare-fun res!801446 () Bool)

(assert (=> d!133083 (=> (not res!801446) (not e!684350))))

(assert (=> d!133083 (= res!801446 (not (contains!6929 lt!546044 lt!546041)))))

(assert (=> d!133083 (= (addStillNotContains!290 lt!546044 lt!546046 lt!546045 lt!546041) lt!546191)))

(declare-fun b!1204985 () Bool)

(assert (=> b!1204985 (= e!684350 (not (= lt!546046 lt!546041)))))

(assert (= (and d!133083 res!801446) b!1204985))

(assert (=> d!133083 m!1110707))

(assert (=> d!133083 m!1110707))

(assert (=> d!133083 m!1110709))

(declare-fun m!1111161 () Bool)

(assert (=> d!133083 m!1111161))

(declare-fun m!1111163 () Bool)

(assert (=> d!133083 m!1111163))

(assert (=> b!1204713 d!133083))

(declare-fun d!133085 () Bool)

(declare-fun e!684351 () Bool)

(assert (=> d!133085 e!684351))

(declare-fun res!801447 () Bool)

(assert (=> d!133085 (=> (not res!801447) (not e!684351))))

(declare-fun lt!546195 () ListLongMap!17677)

(assert (=> d!133085 (= res!801447 (contains!6929 lt!546195 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!546193 () List!26511)

(assert (=> d!133085 (= lt!546195 (ListLongMap!17678 lt!546193))))

(declare-fun lt!546192 () Unit!39848)

(declare-fun lt!546194 () Unit!39848)

(assert (=> d!133085 (= lt!546192 lt!546194)))

(assert (=> d!133085 (= (getValueByKey!627 lt!546193 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133085 (= lt!546194 (lemmaContainsTupThenGetReturnValue!309 lt!546193 (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133085 (= lt!546193 (insertStrictlySorted!402 (toList!8854 call!58096) (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133085 (= (+!4021 call!58096 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!546195)))

(declare-fun b!1204986 () Bool)

(declare-fun res!801448 () Bool)

(assert (=> b!1204986 (=> (not res!801448) (not e!684351))))

(assert (=> b!1204986 (= res!801448 (= (getValueByKey!627 (toList!8854 lt!546195) (_1!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1204987 () Bool)

(assert (=> b!1204987 (= e!684351 (contains!6931 (toList!8854 lt!546195) (tuple2!19701 (select (arr!37644 lt!545876) from!1455) (get!19233 (select (arr!37645 lt!545863) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133085 res!801447) b!1204986))

(assert (= (and b!1204986 res!801448) b!1204987))

(declare-fun m!1111165 () Bool)

(assert (=> d!133085 m!1111165))

(declare-fun m!1111167 () Bool)

(assert (=> d!133085 m!1111167))

(declare-fun m!1111169 () Bool)

(assert (=> d!133085 m!1111169))

(declare-fun m!1111171 () Bool)

(assert (=> d!133085 m!1111171))

(declare-fun m!1111173 () Bool)

(assert (=> b!1204986 m!1111173))

(declare-fun m!1111175 () Bool)

(assert (=> b!1204987 m!1111175))

(assert (=> b!1204713 d!133085))

(assert (=> b!1204713 d!133023))

(assert (=> b!1204619 d!133005))

(declare-fun d!133087 () Bool)

(assert (=> d!133087 (= (validKeyInArray!0 (select (arr!37644 lt!545876) #b00000000000000000000000000000000)) (and (not (= (select (arr!37644 lt!545876) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 lt!545876) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204691 d!133087))

(declare-fun d!133089 () Bool)

(assert (=> d!133089 (= (validKeyInArray!0 (select (arr!37644 lt!545876) from!1455)) (and (not (= (select (arr!37644 lt!545876) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 lt!545876) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204722 d!133089))

(declare-fun d!133091 () Bool)

(assert (=> d!133091 (= (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204667 d!133091))

(assert (=> d!132965 d!132963))

(declare-fun d!133093 () Bool)

(assert (=> d!133093 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!133093 true))

(declare-fun _$60!448 () Unit!39848)

(assert (=> d!133093 (= (choose!13 _keys!1208 k0!934 i!673) _$60!448)))

(declare-fun bs!34091 () Bool)

(assert (= bs!34091 d!133093))

(assert (=> bs!34091 m!1110425))

(assert (=> d!132965 d!133093))

(declare-fun d!133095 () Bool)

(assert (=> d!133095 (isDefined!455 (getValueByKey!627 (toList!8854 call!58033) k0!934))))

(declare-fun lt!546196 () Unit!39848)

(assert (=> d!133095 (= lt!546196 (choose!1792 (toList!8854 call!58033) k0!934))))

(declare-fun e!684352 () Bool)

(assert (=> d!133095 e!684352))

(declare-fun res!801449 () Bool)

(assert (=> d!133095 (=> (not res!801449) (not e!684352))))

(assert (=> d!133095 (= res!801449 (isStrictlySorted!716 (toList!8854 call!58033)))))

(assert (=> d!133095 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 call!58033) k0!934) lt!546196)))

(declare-fun b!1204988 () Bool)

(assert (=> b!1204988 (= e!684352 (containsKey!589 (toList!8854 call!58033) k0!934))))

(assert (= (and d!133095 res!801449) b!1204988))

(assert (=> d!133095 m!1110663))

(assert (=> d!133095 m!1110663))

(assert (=> d!133095 m!1110665))

(declare-fun m!1111177 () Bool)

(assert (=> d!133095 m!1111177))

(declare-fun m!1111179 () Bool)

(assert (=> d!133095 m!1111179))

(assert (=> b!1204988 m!1110659))

(assert (=> b!1204688 d!133095))

(declare-fun d!133097 () Bool)

(assert (=> d!133097 (= (isDefined!455 (getValueByKey!627 (toList!8854 call!58033) k0!934)) (not (isEmpty!986 (getValueByKey!627 (toList!8854 call!58033) k0!934))))))

(declare-fun bs!34092 () Bool)

(assert (= bs!34092 d!133097))

(assert (=> bs!34092 m!1110663))

(declare-fun m!1111181 () Bool)

(assert (=> bs!34092 m!1111181))

(assert (=> b!1204688 d!133097))

(declare-fun b!1204991 () Bool)

(declare-fun e!684354 () Option!678)

(assert (=> b!1204991 (= e!684354 (getValueByKey!627 (t!39380 (toList!8854 call!58033)) k0!934))))

(declare-fun b!1204990 () Bool)

(declare-fun e!684353 () Option!678)

(assert (=> b!1204990 (= e!684353 e!684354)))

(declare-fun c!118318 () Bool)

(assert (=> b!1204990 (= c!118318 (and ((_ is Cons!26507) (toList!8854 call!58033)) (not (= (_1!9861 (h!27725 (toList!8854 call!58033))) k0!934))))))

(declare-fun b!1204989 () Bool)

(assert (=> b!1204989 (= e!684353 (Some!677 (_2!9861 (h!27725 (toList!8854 call!58033)))))))

(declare-fun b!1204992 () Bool)

(assert (=> b!1204992 (= e!684354 None!676)))

(declare-fun d!133099 () Bool)

(declare-fun c!118317 () Bool)

(assert (=> d!133099 (= c!118317 (and ((_ is Cons!26507) (toList!8854 call!58033)) (= (_1!9861 (h!27725 (toList!8854 call!58033))) k0!934)))))

(assert (=> d!133099 (= (getValueByKey!627 (toList!8854 call!58033) k0!934) e!684353)))

(assert (= (and d!133099 c!118317) b!1204989))

(assert (= (and d!133099 (not c!118317)) b!1204990))

(assert (= (and b!1204990 c!118318) b!1204991))

(assert (= (and b!1204990 (not c!118318)) b!1204992))

(declare-fun m!1111183 () Bool)

(assert (=> b!1204991 m!1111183))

(assert (=> b!1204688 d!133099))

(assert (=> b!1204720 d!133089))

(declare-fun d!133101 () Bool)

(declare-fun lt!546199 () Bool)

(declare-fun content!545 (List!26511) (InoxSet tuple2!19700))

(assert (=> d!133101 (= lt!546199 (select (content!545 (toList!8854 lt!546015)) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun e!684360 () Bool)

(assert (=> d!133101 (= lt!546199 e!684360)))

(declare-fun res!801455 () Bool)

(assert (=> d!133101 (=> (not res!801455) (not e!684360))))

(assert (=> d!133101 (= res!801455 ((_ is Cons!26507) (toList!8854 lt!546015)))))

(assert (=> d!133101 (= (contains!6931 (toList!8854 lt!546015) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!546199)))

(declare-fun b!1204997 () Bool)

(declare-fun e!684359 () Bool)

(assert (=> b!1204997 (= e!684360 e!684359)))

(declare-fun res!801454 () Bool)

(assert (=> b!1204997 (=> res!801454 e!684359)))

(assert (=> b!1204997 (= res!801454 (= (h!27725 (toList!8854 lt!546015)) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun b!1204998 () Bool)

(assert (=> b!1204998 (= e!684359 (contains!6931 (t!39380 (toList!8854 lt!546015)) (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133101 res!801455) b!1204997))

(assert (= (and b!1204997 (not res!801454)) b!1204998))

(declare-fun m!1111185 () Bool)

(assert (=> d!133101 m!1111185))

(declare-fun m!1111187 () Bool)

(assert (=> d!133101 m!1111187))

(declare-fun m!1111189 () Bool)

(assert (=> b!1204998 m!1111189))

(assert (=> b!1204687 d!133101))

(declare-fun b!1204999 () Bool)

(declare-fun lt!546202 () Unit!39848)

(declare-fun lt!546203 () Unit!39848)

(assert (=> b!1204999 (= lt!546202 lt!546203)))

(declare-fun lt!546205 () V!45929)

(declare-fun lt!546204 () ListLongMap!17677)

(declare-fun lt!546206 () (_ BitVec 64))

(declare-fun lt!546201 () (_ BitVec 64))

(assert (=> b!1204999 (not (contains!6929 (+!4021 lt!546204 (tuple2!19701 lt!546206 lt!546205)) lt!546201))))

(assert (=> b!1204999 (= lt!546203 (addStillNotContains!290 lt!546204 lt!546206 lt!546205 lt!546201))))

(assert (=> b!1204999 (= lt!546201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204999 (= lt!546205 (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204999 (= lt!546206 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58118 () ListLongMap!17677)

(assert (=> b!1204999 (= lt!546204 call!58118)))

(declare-fun e!684367 () ListLongMap!17677)

(assert (=> b!1204999 (= e!684367 (+!4021 call!58118 (tuple2!19701 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205000 () Bool)

(declare-fun e!684363 () ListLongMap!17677)

(assert (=> b!1205000 (= e!684363 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1205001 () Bool)

(declare-fun e!684365 () Bool)

(declare-fun e!684366 () Bool)

(assert (=> b!1205001 (= e!684365 e!684366)))

(assert (=> b!1205001 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun res!801458 () Bool)

(declare-fun lt!546200 () ListLongMap!17677)

(assert (=> b!1205001 (= res!801458 (contains!6929 lt!546200 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1205001 (=> (not res!801458) (not e!684366))))

(declare-fun b!1205002 () Bool)

(declare-fun e!684364 () Bool)

(assert (=> b!1205002 (= e!684364 (= lt!546200 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205003 () Bool)

(assert (=> b!1205003 (= e!684367 call!58118)))

(declare-fun b!1205004 () Bool)

(declare-fun e!684361 () Bool)

(assert (=> b!1205004 (= e!684361 e!684365)))

(declare-fun c!118319 () Bool)

(declare-fun e!684362 () Bool)

(assert (=> b!1205004 (= c!118319 e!684362)))

(declare-fun res!801456 () Bool)

(assert (=> b!1205004 (=> (not res!801456) (not e!684362))))

(assert (=> b!1205004 (= res!801456 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun d!133103 () Bool)

(assert (=> d!133103 e!684361))

(declare-fun res!801457 () Bool)

(assert (=> d!133103 (=> (not res!801457) (not e!684361))))

(assert (=> d!133103 (= res!801457 (not (contains!6929 lt!546200 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133103 (= lt!546200 e!684363)))

(declare-fun c!118321 () Bool)

(assert (=> d!133103 (= c!118321 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> d!133103 (validMask!0 mask!1564)))

(assert (=> d!133103 (= (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!546200)))

(declare-fun b!1205005 () Bool)

(assert (=> b!1205005 (= e!684365 e!684364)))

(declare-fun c!118320 () Bool)

(assert (=> b!1205005 (= c!118320 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun b!1205006 () Bool)

(assert (=> b!1205006 (= e!684363 e!684367)))

(declare-fun c!118322 () Bool)

(assert (=> b!1205006 (= c!118322 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1205007 () Bool)

(assert (=> b!1205007 (= e!684364 (isEmpty!984 lt!546200))))

(declare-fun b!1205008 () Bool)

(assert (=> b!1205008 (= e!684362 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1205008 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1205009 () Bool)

(declare-fun res!801459 () Bool)

(assert (=> b!1205009 (=> (not res!801459) (not e!684361))))

(assert (=> b!1205009 (= res!801459 (not (contains!6929 lt!546200 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58115 () Bool)

(assert (=> bm!58115 (= call!58118 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205010 () Bool)

(assert (=> b!1205010 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> b!1205010 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38182 _values!996)))))

(assert (=> b!1205010 (= e!684366 (= (apply!969 lt!546200 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19233 (select (arr!37645 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133103 c!118321) b!1205000))

(assert (= (and d!133103 (not c!118321)) b!1205006))

(assert (= (and b!1205006 c!118322) b!1204999))

(assert (= (and b!1205006 (not c!118322)) b!1205003))

(assert (= (or b!1204999 b!1205003) bm!58115))

(assert (= (and d!133103 res!801457) b!1205009))

(assert (= (and b!1205009 res!801459) b!1205004))

(assert (= (and b!1205004 res!801456) b!1205008))

(assert (= (and b!1205004 c!118319) b!1205001))

(assert (= (and b!1205004 (not c!118319)) b!1205005))

(assert (= (and b!1205001 res!801458) b!1205010))

(assert (= (and b!1205005 c!118320) b!1205002))

(assert (= (and b!1205005 (not c!118320)) b!1205007))

(declare-fun b_lambda!21139 () Bool)

(assert (=> (not b_lambda!21139) (not b!1204999)))

(assert (=> b!1204999 t!39379))

(declare-fun b_and!42721 () Bool)

(assert (= b_and!42719 (and (=> t!39379 result!21963) b_and!42721)))

(declare-fun b_lambda!21141 () Bool)

(assert (=> (not b_lambda!21141) (not b!1205010)))

(assert (=> b!1205010 t!39379))

(declare-fun b_and!42723 () Bool)

(assert (= b_and!42721 (and (=> t!39379 result!21963) b_and!42723)))

(declare-fun m!1111191 () Bool)

(assert (=> b!1204999 m!1111191))

(assert (=> b!1204999 m!1111191))

(declare-fun m!1111193 () Bool)

(assert (=> b!1204999 m!1111193))

(declare-fun m!1111195 () Bool)

(assert (=> b!1204999 m!1111195))

(assert (=> b!1204999 m!1110405))

(declare-fun m!1111197 () Bool)

(assert (=> b!1204999 m!1111197))

(declare-fun m!1111199 () Bool)

(assert (=> b!1204999 m!1111199))

(assert (=> b!1204999 m!1111197))

(assert (=> b!1204999 m!1110405))

(declare-fun m!1111201 () Bool)

(assert (=> b!1204999 m!1111201))

(declare-fun m!1111203 () Bool)

(assert (=> b!1204999 m!1111203))

(assert (=> b!1205010 m!1111195))

(assert (=> b!1205010 m!1110405))

(assert (=> b!1205010 m!1111197))

(assert (=> b!1205010 m!1111197))

(assert (=> b!1205010 m!1110405))

(assert (=> b!1205010 m!1111201))

(assert (=> b!1205010 m!1111195))

(declare-fun m!1111205 () Bool)

(assert (=> b!1205010 m!1111205))

(declare-fun m!1111207 () Bool)

(assert (=> bm!58115 m!1111207))

(assert (=> b!1205006 m!1111195))

(assert (=> b!1205006 m!1111195))

(declare-fun m!1111209 () Bool)

(assert (=> b!1205006 m!1111209))

(declare-fun m!1111211 () Bool)

(assert (=> b!1205007 m!1111211))

(declare-fun m!1111213 () Bool)

(assert (=> d!133103 m!1111213))

(assert (=> d!133103 m!1110441))

(assert (=> b!1205001 m!1111195))

(assert (=> b!1205001 m!1111195))

(declare-fun m!1111215 () Bool)

(assert (=> b!1205001 m!1111215))

(assert (=> b!1205008 m!1111195))

(assert (=> b!1205008 m!1111195))

(assert (=> b!1205008 m!1111209))

(assert (=> b!1205002 m!1111207))

(declare-fun m!1111217 () Bool)

(assert (=> b!1205009 m!1111217))

(assert (=> b!1204663 d!133103))

(declare-fun b!1205011 () Bool)

(declare-fun e!684369 () Bool)

(declare-fun call!58119 () Bool)

(assert (=> b!1205011 (= e!684369 call!58119)))

(declare-fun b!1205012 () Bool)

(declare-fun e!684370 () Bool)

(declare-fun e!684368 () Bool)

(assert (=> b!1205012 (= e!684370 e!684368)))

(declare-fun c!118323 () Bool)

(assert (=> b!1205012 (= c!118323 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!58116 () Bool)

(assert (=> bm!58116 (= call!58119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1205013 () Bool)

(assert (=> b!1205013 (= e!684368 call!58119)))

(declare-fun b!1205014 () Bool)

(assert (=> b!1205014 (= e!684368 e!684369)))

(declare-fun lt!546209 () (_ BitVec 64))

(assert (=> b!1205014 (= lt!546209 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!546207 () Unit!39848)

(assert (=> b!1205014 (= lt!546207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1205014 (arrayContainsKey!0 _keys!1208 lt!546209 #b00000000000000000000000000000000)))

(declare-fun lt!546208 () Unit!39848)

(assert (=> b!1205014 (= lt!546208 lt!546207)))

(declare-fun res!801461 () Bool)

(assert (=> b!1205014 (= res!801461 (= (seekEntryOrOpen!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1205014 (=> (not res!801461) (not e!684369))))

(declare-fun d!133105 () Bool)

(declare-fun res!801460 () Bool)

(assert (=> d!133105 (=> res!801460 e!684370)))

(assert (=> d!133105 (= res!801460 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> d!133105 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!684370)))

(assert (= (and d!133105 (not res!801460)) b!1205012))

(assert (= (and b!1205012 c!118323) b!1205014))

(assert (= (and b!1205012 (not c!118323)) b!1205013))

(assert (= (and b!1205014 res!801461) b!1205011))

(assert (= (or b!1205011 b!1205013) bm!58116))

(declare-fun m!1111219 () Bool)

(assert (=> b!1205012 m!1111219))

(assert (=> b!1205012 m!1111219))

(declare-fun m!1111221 () Bool)

(assert (=> b!1205012 m!1111221))

(declare-fun m!1111223 () Bool)

(assert (=> bm!58116 m!1111223))

(assert (=> b!1205014 m!1111219))

(declare-fun m!1111225 () Bool)

(assert (=> b!1205014 m!1111225))

(declare-fun m!1111227 () Bool)

(assert (=> b!1205014 m!1111227))

(assert (=> b!1205014 m!1111219))

(declare-fun m!1111229 () Bool)

(assert (=> b!1205014 m!1111229))

(assert (=> bm!58092 d!133105))

(declare-fun d!133107 () Bool)

(assert (=> d!133107 (= (isDefined!455 (getValueByKey!627 (toList!8854 lt!545865) k0!934)) (not (isEmpty!986 (getValueByKey!627 (toList!8854 lt!545865) k0!934))))))

(declare-fun bs!34093 () Bool)

(assert (= bs!34093 d!133107))

(assert (=> bs!34093 m!1110639))

(declare-fun m!1111231 () Bool)

(assert (=> bs!34093 m!1111231))

(assert (=> b!1204680 d!133107))

(declare-fun b!1205017 () Bool)

(declare-fun e!684372 () Option!678)

(assert (=> b!1205017 (= e!684372 (getValueByKey!627 (t!39380 (toList!8854 lt!545865)) k0!934))))

(declare-fun b!1205016 () Bool)

(declare-fun e!684371 () Option!678)

(assert (=> b!1205016 (= e!684371 e!684372)))

(declare-fun c!118325 () Bool)

(assert (=> b!1205016 (= c!118325 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (not (= (_1!9861 (h!27725 (toList!8854 lt!545865))) k0!934))))))

(declare-fun b!1205015 () Bool)

(assert (=> b!1205015 (= e!684371 (Some!677 (_2!9861 (h!27725 (toList!8854 lt!545865)))))))

(declare-fun b!1205018 () Bool)

(assert (=> b!1205018 (= e!684372 None!676)))

(declare-fun d!133109 () Bool)

(declare-fun c!118324 () Bool)

(assert (=> d!133109 (= c!118324 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (= (_1!9861 (h!27725 (toList!8854 lt!545865))) k0!934)))))

(assert (=> d!133109 (= (getValueByKey!627 (toList!8854 lt!545865) k0!934) e!684371)))

(assert (= (and d!133109 c!118324) b!1205015))

(assert (= (and d!133109 (not c!118324)) b!1205016))

(assert (= (and b!1205016 c!118325) b!1205017))

(assert (= (and b!1205016 (not c!118325)) b!1205018))

(declare-fun m!1111233 () Bool)

(assert (=> b!1205017 m!1111233))

(assert (=> b!1204680 d!133109))

(assert (=> bm!58088 d!133103))

(declare-fun d!133111 () Bool)

(declare-fun e!684373 () Bool)

(assert (=> d!133111 e!684373))

(declare-fun res!801462 () Bool)

(assert (=> d!133111 (=> res!801462 e!684373)))

(declare-fun lt!546211 () Bool)

(assert (=> d!133111 (= res!801462 (not lt!546211))))

(declare-fun lt!546213 () Bool)

(assert (=> d!133111 (= lt!546211 lt!546213)))

(declare-fun lt!546210 () Unit!39848)

(declare-fun e!684374 () Unit!39848)

(assert (=> d!133111 (= lt!546210 e!684374)))

(declare-fun c!118326 () Bool)

(assert (=> d!133111 (= c!118326 lt!546213)))

(assert (=> d!133111 (= lt!546213 (containsKey!589 (toList!8854 lt!546047) (select (arr!37644 _keys!1208) from!1455)))))

(assert (=> d!133111 (= (contains!6929 lt!546047 (select (arr!37644 _keys!1208) from!1455)) lt!546211)))

(declare-fun b!1205019 () Bool)

(declare-fun lt!546212 () Unit!39848)

(assert (=> b!1205019 (= e!684374 lt!546212)))

(assert (=> b!1205019 (= lt!546212 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546047) (select (arr!37644 _keys!1208) from!1455)))))

(assert (=> b!1205019 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) (select (arr!37644 _keys!1208) from!1455)))))

(declare-fun b!1205020 () Bool)

(declare-fun Unit!39872 () Unit!39848)

(assert (=> b!1205020 (= e!684374 Unit!39872)))

(declare-fun b!1205021 () Bool)

(assert (=> b!1205021 (= e!684373 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546047) (select (arr!37644 _keys!1208) from!1455))))))

(assert (= (and d!133111 c!118326) b!1205019))

(assert (= (and d!133111 (not c!118326)) b!1205020))

(assert (= (and d!133111 (not res!801462)) b!1205021))

(assert (=> d!133111 m!1110447))

(declare-fun m!1111235 () Bool)

(assert (=> d!133111 m!1111235))

(assert (=> b!1205019 m!1110447))

(declare-fun m!1111237 () Bool)

(assert (=> b!1205019 m!1111237))

(assert (=> b!1205019 m!1110447))

(assert (=> b!1205019 m!1111133))

(assert (=> b!1205019 m!1111133))

(declare-fun m!1111239 () Bool)

(assert (=> b!1205019 m!1111239))

(assert (=> b!1205021 m!1110447))

(assert (=> b!1205021 m!1111133))

(assert (=> b!1205021 m!1111133))

(assert (=> b!1205021 m!1111239))

(assert (=> b!1204727 d!133111))

(declare-fun call!58124 () ListLongMap!17677)

(declare-fun b!1205026 () Bool)

(declare-fun call!58125 () ListLongMap!17677)

(declare-fun e!684377 () Bool)

(assert (=> b!1205026 (= e!684377 (= call!58125 (-!1801 call!58124 k0!934)))))

(declare-fun bm!58122 () Bool)

(assert (=> bm!58122 (= call!58125 (getCurrentListMapNoExtraKeys!5321 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)) (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205027 () Bool)

(assert (=> b!1205027 (= e!684377 (= call!58125 call!58124))))

(declare-fun d!133113 () Bool)

(assert (=> d!133113 e!684377))

(declare-fun c!118329 () Bool)

(assert (=> d!133113 (= c!118329 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!133113 true))

(declare-fun _$12!465 () Unit!39848)

(assert (=> d!133113 (= (choose!1791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!465)))

(declare-fun bm!58121 () Bool)

(assert (=> bm!58121 (= call!58124 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133113 c!118329) b!1205026))

(assert (= (and d!133113 (not c!118329)) b!1205027))

(assert (= (or b!1205026 b!1205027) bm!58121))

(assert (= (or b!1205026 b!1205027) bm!58122))

(declare-fun b_lambda!21143 () Bool)

(assert (=> (not b_lambda!21143) (not bm!58122)))

(assert (=> bm!58122 t!39379))

(declare-fun b_and!42725 () Bool)

(assert (= b_and!42723 (and (=> t!39379 result!21963) b_and!42725)))

(declare-fun m!1111241 () Bool)

(assert (=> b!1205026 m!1111241))

(assert (=> bm!58122 m!1110445))

(assert (=> bm!58122 m!1110405))

(assert (=> bm!58122 m!1110407))

(assert (=> bm!58122 m!1110781))

(assert (=> bm!58121 m!1110417))

(assert (=> d!132969 d!133113))

(assert (=> b!1204693 d!133087))

(declare-fun d!133115 () Bool)

(assert (=> d!133115 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545865) k0!934))))

(declare-fun lt!546214 () Unit!39848)

(assert (=> d!133115 (= lt!546214 (choose!1792 (toList!8854 lt!545865) k0!934))))

(declare-fun e!684378 () Bool)

(assert (=> d!133115 e!684378))

(declare-fun res!801463 () Bool)

(assert (=> d!133115 (=> (not res!801463) (not e!684378))))

(assert (=> d!133115 (= res!801463 (isStrictlySorted!716 (toList!8854 lt!545865)))))

(assert (=> d!133115 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545865) k0!934) lt!546214)))

(declare-fun b!1205028 () Bool)

(assert (=> b!1205028 (= e!684378 (containsKey!589 (toList!8854 lt!545865) k0!934))))

(assert (= (and d!133115 res!801463) b!1205028))

(assert (=> d!133115 m!1110639))

(assert (=> d!133115 m!1110639))

(assert (=> d!133115 m!1110641))

(declare-fun m!1111243 () Bool)

(assert (=> d!133115 m!1111243))

(declare-fun m!1111245 () Bool)

(assert (=> d!133115 m!1111245))

(assert (=> b!1205028 m!1110635))

(assert (=> b!1204678 d!133115))

(assert (=> b!1204678 d!133107))

(assert (=> b!1204678 d!133109))

(declare-fun d!133117 () Bool)

(declare-fun lt!546215 () Bool)

(assert (=> d!133117 (= lt!546215 (select (content!545 (toList!8854 lt!546023)) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!684380 () Bool)

(assert (=> d!133117 (= lt!546215 e!684380)))

(declare-fun res!801465 () Bool)

(assert (=> d!133117 (=> (not res!801465) (not e!684380))))

(assert (=> d!133117 (= res!801465 ((_ is Cons!26507) (toList!8854 lt!546023)))))

(assert (=> d!133117 (= (contains!6931 (toList!8854 lt!546023) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!546215)))

(declare-fun b!1205029 () Bool)

(declare-fun e!684379 () Bool)

(assert (=> b!1205029 (= e!684380 e!684379)))

(declare-fun res!801464 () Bool)

(assert (=> b!1205029 (=> res!801464 e!684379)))

(assert (=> b!1205029 (= res!801464 (= (h!27725 (toList!8854 lt!546023)) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205030 () Bool)

(assert (=> b!1205030 (= e!684379 (contains!6931 (t!39380 (toList!8854 lt!546023)) (ite c!118180 (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118179 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133117 res!801465) b!1205029))

(assert (= (and b!1205029 (not res!801464)) b!1205030))

(declare-fun m!1111247 () Bool)

(assert (=> d!133117 m!1111247))

(declare-fun m!1111249 () Bool)

(assert (=> d!133117 m!1111249))

(declare-fun m!1111251 () Bool)

(assert (=> b!1205030 m!1111251))

(assert (=> b!1204697 d!133117))

(declare-fun b!1205031 () Bool)

(declare-fun lt!546218 () Unit!39848)

(declare-fun lt!546219 () Unit!39848)

(assert (=> b!1205031 (= lt!546218 lt!546219)))

(declare-fun lt!546217 () (_ BitVec 64))

(declare-fun lt!546220 () ListLongMap!17677)

(declare-fun lt!546221 () V!45929)

(declare-fun lt!546222 () (_ BitVec 64))

(assert (=> b!1205031 (not (contains!6929 (+!4021 lt!546220 (tuple2!19701 lt!546222 lt!546221)) lt!546217))))

(assert (=> b!1205031 (= lt!546219 (addStillNotContains!290 lt!546220 lt!546222 lt!546221 lt!546217))))

(assert (=> b!1205031 (= lt!546217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205031 (= lt!546221 (get!19233 (select (arr!37645 lt!545863) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205031 (= lt!546222 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001)))))

(declare-fun call!58126 () ListLongMap!17677)

(assert (=> b!1205031 (= lt!546220 call!58126)))

(declare-fun e!684387 () ListLongMap!17677)

(assert (=> b!1205031 (= e!684387 (+!4021 call!58126 (tuple2!19701 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19233 (select (arr!37645 lt!545863) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205032 () Bool)

(declare-fun e!684383 () ListLongMap!17677)

(assert (=> b!1205032 (= e!684383 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1205033 () Bool)

(declare-fun e!684385 () Bool)

(declare-fun e!684386 () Bool)

(assert (=> b!1205033 (= e!684385 e!684386)))

(assert (=> b!1205033 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun res!801468 () Bool)

(declare-fun lt!546216 () ListLongMap!17677)

(assert (=> b!1205033 (= res!801468 (contains!6929 lt!546216 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1205033 (=> (not res!801468) (not e!684386))))

(declare-fun e!684384 () Bool)

(declare-fun b!1205034 () Bool)

(assert (=> b!1205034 (= e!684384 (= lt!546216 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205035 () Bool)

(assert (=> b!1205035 (= e!684387 call!58126)))

(declare-fun b!1205036 () Bool)

(declare-fun e!684381 () Bool)

(assert (=> b!1205036 (= e!684381 e!684385)))

(declare-fun c!118330 () Bool)

(declare-fun e!684382 () Bool)

(assert (=> b!1205036 (= c!118330 e!684382)))

(declare-fun res!801466 () Bool)

(assert (=> b!1205036 (=> (not res!801466) (not e!684382))))

(assert (=> b!1205036 (= res!801466 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun d!133119 () Bool)

(assert (=> d!133119 e!684381))

(declare-fun res!801467 () Bool)

(assert (=> d!133119 (=> (not res!801467) (not e!684381))))

(assert (=> d!133119 (= res!801467 (not (contains!6929 lt!546216 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133119 (= lt!546216 e!684383)))

(declare-fun c!118332 () Bool)

(assert (=> d!133119 (= c!118332 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> d!133119 (validMask!0 mask!1564)))

(assert (=> d!133119 (= (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!546216)))

(declare-fun b!1205037 () Bool)

(assert (=> b!1205037 (= e!684385 e!684384)))

(declare-fun c!118331 () Bool)

(assert (=> b!1205037 (= c!118331 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(declare-fun b!1205038 () Bool)

(assert (=> b!1205038 (= e!684383 e!684387)))

(declare-fun c!118333 () Bool)

(assert (=> b!1205038 (= c!118333 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1205039 () Bool)

(assert (=> b!1205039 (= e!684384 (isEmpty!984 lt!546216))))

(declare-fun b!1205040 () Bool)

(assert (=> b!1205040 (= e!684382 (validKeyInArray!0 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1205040 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1205041 () Bool)

(declare-fun res!801469 () Bool)

(assert (=> b!1205041 (=> (not res!801469) (not e!684381))))

(assert (=> b!1205041 (= res!801469 (not (contains!6929 lt!546216 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58123 () Bool)

(assert (=> bm!58123 (= call!58126 (getCurrentListMapNoExtraKeys!5321 lt!545876 lt!545863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205042 () Bool)

(assert (=> b!1205042 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38181 lt!545876)))))

(assert (=> b!1205042 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38182 lt!545863)))))

(assert (=> b!1205042 (= e!684386 (= (apply!969 lt!546216 (select (arr!37644 lt!545876) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19233 (select (arr!37645 lt!545863) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133119 c!118332) b!1205032))

(assert (= (and d!133119 (not c!118332)) b!1205038))

(assert (= (and b!1205038 c!118333) b!1205031))

(assert (= (and b!1205038 (not c!118333)) b!1205035))

(assert (= (or b!1205031 b!1205035) bm!58123))

(assert (= (and d!133119 res!801467) b!1205041))

(assert (= (and b!1205041 res!801469) b!1205036))

(assert (= (and b!1205036 res!801466) b!1205040))

(assert (= (and b!1205036 c!118330) b!1205033))

(assert (= (and b!1205036 (not c!118330)) b!1205037))

(assert (= (and b!1205033 res!801468) b!1205042))

(assert (= (and b!1205037 c!118331) b!1205034))

(assert (= (and b!1205037 (not c!118331)) b!1205039))

(declare-fun b_lambda!21145 () Bool)

(assert (=> (not b_lambda!21145) (not b!1205031)))

(assert (=> b!1205031 t!39379))

(declare-fun b_and!42727 () Bool)

(assert (= b_and!42725 (and (=> t!39379 result!21963) b_and!42727)))

(declare-fun b_lambda!21147 () Bool)

(assert (=> (not b_lambda!21147) (not b!1205042)))

(assert (=> b!1205042 t!39379))

(declare-fun b_and!42729 () Bool)

(assert (= b_and!42727 (and (=> t!39379 result!21963) b_and!42729)))

(declare-fun m!1111253 () Bool)

(assert (=> b!1205031 m!1111253))

(assert (=> b!1205031 m!1111253))

(declare-fun m!1111255 () Bool)

(assert (=> b!1205031 m!1111255))

(declare-fun m!1111257 () Bool)

(assert (=> b!1205031 m!1111257))

(assert (=> b!1205031 m!1110405))

(declare-fun m!1111259 () Bool)

(assert (=> b!1205031 m!1111259))

(declare-fun m!1111261 () Bool)

(assert (=> b!1205031 m!1111261))

(assert (=> b!1205031 m!1111259))

(assert (=> b!1205031 m!1110405))

(declare-fun m!1111263 () Bool)

(assert (=> b!1205031 m!1111263))

(declare-fun m!1111265 () Bool)

(assert (=> b!1205031 m!1111265))

(assert (=> b!1205042 m!1111257))

(assert (=> b!1205042 m!1110405))

(assert (=> b!1205042 m!1111259))

(assert (=> b!1205042 m!1111259))

(assert (=> b!1205042 m!1110405))

(assert (=> b!1205042 m!1111263))

(assert (=> b!1205042 m!1111257))

(declare-fun m!1111267 () Bool)

(assert (=> b!1205042 m!1111267))

(declare-fun m!1111269 () Bool)

(assert (=> bm!58123 m!1111269))

(assert (=> b!1205038 m!1111257))

(assert (=> b!1205038 m!1111257))

(declare-fun m!1111271 () Bool)

(assert (=> b!1205038 m!1111271))

(declare-fun m!1111273 () Bool)

(assert (=> b!1205039 m!1111273))

(declare-fun m!1111275 () Bool)

(assert (=> d!133119 m!1111275))

(assert (=> d!133119 m!1110441))

(assert (=> b!1205033 m!1111257))

(assert (=> b!1205033 m!1111257))

(declare-fun m!1111277 () Bool)

(assert (=> b!1205033 m!1111277))

(assert (=> b!1205040 m!1111257))

(assert (=> b!1205040 m!1111257))

(assert (=> b!1205040 m!1111271))

(assert (=> b!1205034 m!1111269))

(declare-fun m!1111279 () Bool)

(assert (=> b!1205041 m!1111279))

(assert (=> bm!58093 d!133119))

(assert (=> b!1204738 d!133087))

(assert (=> b!1204669 d!133091))

(assert (=> b!1204690 d!133097))

(assert (=> b!1204690 d!133099))

(declare-fun d!133121 () Bool)

(assert (=> d!133121 (not (contains!6929 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052)) lt!546048))))

(declare-fun lt!546223 () Unit!39848)

(assert (=> d!133121 (= lt!546223 (choose!1793 lt!546051 lt!546053 lt!546052 lt!546048))))

(declare-fun e!684388 () Bool)

(assert (=> d!133121 e!684388))

(declare-fun res!801470 () Bool)

(assert (=> d!133121 (=> (not res!801470) (not e!684388))))

(assert (=> d!133121 (= res!801470 (not (contains!6929 lt!546051 lt!546048)))))

(assert (=> d!133121 (= (addStillNotContains!290 lt!546051 lt!546053 lt!546052 lt!546048) lt!546223)))

(declare-fun b!1205043 () Bool)

(assert (=> b!1205043 (= e!684388 (not (= lt!546053 lt!546048)))))

(assert (= (and d!133121 res!801470) b!1205043))

(assert (=> d!133121 m!1110735))

(assert (=> d!133121 m!1110735))

(assert (=> d!133121 m!1110737))

(declare-fun m!1111281 () Bool)

(assert (=> d!133121 m!1111281))

(declare-fun m!1111283 () Bool)

(assert (=> d!133121 m!1111283))

(assert (=> b!1204725 d!133121))

(assert (=> b!1204725 d!133077))

(declare-fun d!133123 () Bool)

(declare-fun e!684389 () Bool)

(assert (=> d!133123 e!684389))

(declare-fun res!801471 () Bool)

(assert (=> d!133123 (=> (not res!801471) (not e!684389))))

(declare-fun lt!546227 () ListLongMap!17677)

(assert (=> d!133123 (= res!801471 (contains!6929 lt!546227 (_1!9861 (tuple2!19701 lt!546053 lt!546052))))))

(declare-fun lt!546225 () List!26511)

(assert (=> d!133123 (= lt!546227 (ListLongMap!17678 lt!546225))))

(declare-fun lt!546224 () Unit!39848)

(declare-fun lt!546226 () Unit!39848)

(assert (=> d!133123 (= lt!546224 lt!546226)))

(assert (=> d!133123 (= (getValueByKey!627 lt!546225 (_1!9861 (tuple2!19701 lt!546053 lt!546052))) (Some!677 (_2!9861 (tuple2!19701 lt!546053 lt!546052))))))

(assert (=> d!133123 (= lt!546226 (lemmaContainsTupThenGetReturnValue!309 lt!546225 (_1!9861 (tuple2!19701 lt!546053 lt!546052)) (_2!9861 (tuple2!19701 lt!546053 lt!546052))))))

(assert (=> d!133123 (= lt!546225 (insertStrictlySorted!402 (toList!8854 lt!546051) (_1!9861 (tuple2!19701 lt!546053 lt!546052)) (_2!9861 (tuple2!19701 lt!546053 lt!546052))))))

(assert (=> d!133123 (= (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052)) lt!546227)))

(declare-fun b!1205044 () Bool)

(declare-fun res!801472 () Bool)

(assert (=> b!1205044 (=> (not res!801472) (not e!684389))))

(assert (=> b!1205044 (= res!801472 (= (getValueByKey!627 (toList!8854 lt!546227) (_1!9861 (tuple2!19701 lt!546053 lt!546052))) (Some!677 (_2!9861 (tuple2!19701 lt!546053 lt!546052)))))))

(declare-fun b!1205045 () Bool)

(assert (=> b!1205045 (= e!684389 (contains!6931 (toList!8854 lt!546227) (tuple2!19701 lt!546053 lt!546052)))))

(assert (= (and d!133123 res!801471) b!1205044))

(assert (= (and b!1205044 res!801472) b!1205045))

(declare-fun m!1111285 () Bool)

(assert (=> d!133123 m!1111285))

(declare-fun m!1111287 () Bool)

(assert (=> d!133123 m!1111287))

(declare-fun m!1111289 () Bool)

(assert (=> d!133123 m!1111289))

(declare-fun m!1111291 () Bool)

(assert (=> d!133123 m!1111291))

(declare-fun m!1111293 () Bool)

(assert (=> b!1205044 m!1111293))

(declare-fun m!1111295 () Bool)

(assert (=> b!1205045 m!1111295))

(assert (=> b!1204725 d!133123))

(declare-fun d!133125 () Bool)

(declare-fun e!684390 () Bool)

(assert (=> d!133125 e!684390))

(declare-fun res!801473 () Bool)

(assert (=> d!133125 (=> (not res!801473) (not e!684390))))

(declare-fun lt!546231 () ListLongMap!17677)

(assert (=> d!133125 (= res!801473 (contains!6929 lt!546231 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!546229 () List!26511)

(assert (=> d!133125 (= lt!546231 (ListLongMap!17678 lt!546229))))

(declare-fun lt!546228 () Unit!39848)

(declare-fun lt!546230 () Unit!39848)

(assert (=> d!133125 (= lt!546228 lt!546230)))

(assert (=> d!133125 (= (getValueByKey!627 lt!546229 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133125 (= lt!546230 (lemmaContainsTupThenGetReturnValue!309 lt!546229 (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133125 (= lt!546229 (insertStrictlySorted!402 (toList!8854 call!58097) (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!133125 (= (+!4021 call!58097 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!546231)))

(declare-fun b!1205046 () Bool)

(declare-fun res!801474 () Bool)

(assert (=> b!1205046 (=> (not res!801474) (not e!684390))))

(assert (=> b!1205046 (= res!801474 (= (getValueByKey!627 (toList!8854 lt!546231) (_1!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!677 (_2!9861 (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1205047 () Bool)

(assert (=> b!1205047 (= e!684390 (contains!6931 (toList!8854 lt!546231) (tuple2!19701 (select (arr!37644 _keys!1208) from!1455) (get!19233 (select (arr!37645 _values!996) from!1455) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133125 res!801473) b!1205046))

(assert (= (and b!1205046 res!801474) b!1205047))

(declare-fun m!1111297 () Bool)

(assert (=> d!133125 m!1111297))

(declare-fun m!1111299 () Bool)

(assert (=> d!133125 m!1111299))

(declare-fun m!1111301 () Bool)

(assert (=> d!133125 m!1111301))

(declare-fun m!1111303 () Bool)

(assert (=> d!133125 m!1111303))

(declare-fun m!1111305 () Bool)

(assert (=> b!1205046 m!1111305))

(declare-fun m!1111307 () Bool)

(assert (=> b!1205047 m!1111307))

(assert (=> b!1204725 d!133125))

(declare-fun d!133127 () Bool)

(declare-fun e!684391 () Bool)

(assert (=> d!133127 e!684391))

(declare-fun res!801475 () Bool)

(assert (=> d!133127 (=> res!801475 e!684391)))

(declare-fun lt!546233 () Bool)

(assert (=> d!133127 (= res!801475 (not lt!546233))))

(declare-fun lt!546235 () Bool)

(assert (=> d!133127 (= lt!546233 lt!546235)))

(declare-fun lt!546232 () Unit!39848)

(declare-fun e!684392 () Unit!39848)

(assert (=> d!133127 (= lt!546232 e!684392)))

(declare-fun c!118334 () Bool)

(assert (=> d!133127 (= c!118334 lt!546235)))

(assert (=> d!133127 (= lt!546235 (containsKey!589 (toList!8854 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052))) lt!546048))))

(assert (=> d!133127 (= (contains!6929 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052)) lt!546048) lt!546233)))

(declare-fun b!1205048 () Bool)

(declare-fun lt!546234 () Unit!39848)

(assert (=> b!1205048 (= e!684392 lt!546234)))

(assert (=> b!1205048 (= lt!546234 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052))) lt!546048))))

(assert (=> b!1205048 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052))) lt!546048))))

(declare-fun b!1205049 () Bool)

(declare-fun Unit!39873 () Unit!39848)

(assert (=> b!1205049 (= e!684392 Unit!39873)))

(declare-fun b!1205050 () Bool)

(assert (=> b!1205050 (= e!684391 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 lt!546051 (tuple2!19701 lt!546053 lt!546052))) lt!546048)))))

(assert (= (and d!133127 c!118334) b!1205048))

(assert (= (and d!133127 (not c!118334)) b!1205049))

(assert (= (and d!133127 (not res!801475)) b!1205050))

(declare-fun m!1111309 () Bool)

(assert (=> d!133127 m!1111309))

(declare-fun m!1111311 () Bool)

(assert (=> b!1205048 m!1111311))

(declare-fun m!1111313 () Bool)

(assert (=> b!1205048 m!1111313))

(assert (=> b!1205048 m!1111313))

(declare-fun m!1111315 () Bool)

(assert (=> b!1205048 m!1111315))

(assert (=> b!1205050 m!1111313))

(assert (=> b!1205050 m!1111313))

(assert (=> b!1205050 m!1111315))

(assert (=> b!1204725 d!133127))

(declare-fun d!133129 () Bool)

(declare-fun e!684393 () Bool)

(assert (=> d!133129 e!684393))

(declare-fun res!801476 () Bool)

(assert (=> d!133129 (=> res!801476 e!684393)))

(declare-fun lt!546237 () Bool)

(assert (=> d!133129 (= res!801476 (not lt!546237))))

(declare-fun lt!546239 () Bool)

(assert (=> d!133129 (= lt!546237 lt!546239)))

(declare-fun lt!546236 () Unit!39848)

(declare-fun e!684394 () Unit!39848)

(assert (=> d!133129 (= lt!546236 e!684394)))

(declare-fun c!118335 () Bool)

(assert (=> d!133129 (= c!118335 lt!546239)))

(assert (=> d!133129 (= lt!546239 (containsKey!589 (toList!8854 lt!545982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133129 (= (contains!6929 lt!545982 #b0000000000000000000000000000000000000000000000000000000000000000) lt!546237)))

(declare-fun b!1205051 () Bool)

(declare-fun lt!546238 () Unit!39848)

(assert (=> b!1205051 (= e!684394 lt!546238)))

(assert (=> b!1205051 (= lt!546238 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1205051 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1205052 () Bool)

(declare-fun Unit!39874 () Unit!39848)

(assert (=> b!1205052 (= e!684394 Unit!39874)))

(declare-fun b!1205053 () Bool)

(assert (=> b!1205053 (= e!684393 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133129 c!118335) b!1205051))

(assert (= (and d!133129 (not c!118335)) b!1205052))

(assert (= (and d!133129 (not res!801476)) b!1205053))

(declare-fun m!1111317 () Bool)

(assert (=> d!133129 m!1111317))

(declare-fun m!1111319 () Bool)

(assert (=> b!1205051 m!1111319))

(declare-fun m!1111321 () Bool)

(assert (=> b!1205051 m!1111321))

(assert (=> b!1205051 m!1111321))

(declare-fun m!1111323 () Bool)

(assert (=> b!1205051 m!1111323))

(assert (=> b!1205053 m!1111321))

(assert (=> b!1205053 m!1111321))

(assert (=> b!1205053 m!1111323))

(assert (=> d!132929 d!133129))

(assert (=> d!132929 d!132959))

(declare-fun d!133131 () Bool)

(declare-fun res!801477 () Bool)

(declare-fun e!684395 () Bool)

(assert (=> d!133131 (=> res!801477 e!684395)))

(assert (=> d!133131 (= res!801477 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (= (_1!9861 (h!27725 (toList!8854 lt!545865))) k0!934)))))

(assert (=> d!133131 (= (containsKey!589 (toList!8854 lt!545865) k0!934) e!684395)))

(declare-fun b!1205054 () Bool)

(declare-fun e!684396 () Bool)

(assert (=> b!1205054 (= e!684395 e!684396)))

(declare-fun res!801478 () Bool)

(assert (=> b!1205054 (=> (not res!801478) (not e!684396))))

(assert (=> b!1205054 (= res!801478 (and (or (not ((_ is Cons!26507) (toList!8854 lt!545865))) (bvsle (_1!9861 (h!27725 (toList!8854 lt!545865))) k0!934)) ((_ is Cons!26507) (toList!8854 lt!545865)) (bvslt (_1!9861 (h!27725 (toList!8854 lt!545865))) k0!934)))))

(declare-fun b!1205055 () Bool)

(assert (=> b!1205055 (= e!684396 (containsKey!589 (t!39380 (toList!8854 lt!545865)) k0!934))))

(assert (= (and d!133131 (not res!801477)) b!1205054))

(assert (= (and b!1205054 res!801478) b!1205055))

(declare-fun m!1111325 () Bool)

(assert (=> b!1205055 m!1111325))

(assert (=> d!132935 d!133131))

(declare-fun d!133133 () Bool)

(declare-fun res!801479 () Bool)

(declare-fun e!684397 () Bool)

(assert (=> d!133133 (=> res!801479 e!684397)))

(assert (=> d!133133 (= res!801479 (and ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 call!58030))) (= (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030)))) k0!934)))))

(assert (=> d!133133 (= (containsKey!589 (toList!8854 (ite c!118180 lt!545866 call!58030)) k0!934) e!684397)))

(declare-fun b!1205056 () Bool)

(declare-fun e!684398 () Bool)

(assert (=> b!1205056 (= e!684397 e!684398)))

(declare-fun res!801480 () Bool)

(assert (=> b!1205056 (=> (not res!801480) (not e!684398))))

(assert (=> b!1205056 (= res!801480 (and (or (not ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 call!58030)))) (bvsle (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030)))) k0!934)) ((_ is Cons!26507) (toList!8854 (ite c!118180 lt!545866 call!58030))) (bvslt (_1!9861 (h!27725 (toList!8854 (ite c!118180 lt!545866 call!58030)))) k0!934)))))

(declare-fun b!1205057 () Bool)

(assert (=> b!1205057 (= e!684398 (containsKey!589 (t!39380 (toList!8854 (ite c!118180 lt!545866 call!58030))) k0!934))))

(assert (= (and d!133133 (not res!801479)) b!1205056))

(assert (= (and b!1205056 res!801480) b!1205057))

(declare-fun m!1111327 () Bool)

(assert (=> b!1205057 m!1111327))

(assert (=> d!132953 d!133133))

(declare-fun d!133135 () Bool)

(assert (=> d!133135 (= (validKeyInArray!0 (select (arr!37644 _keys!1208) from!1455)) (and (not (= (select (arr!37644 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37644 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204734 d!133135))

(declare-fun d!133137 () Bool)

(declare-fun e!684399 () Bool)

(assert (=> d!133137 e!684399))

(declare-fun res!801481 () Bool)

(assert (=> d!133137 (=> res!801481 e!684399)))

(declare-fun lt!546241 () Bool)

(assert (=> d!133137 (= res!801481 (not lt!546241))))

(declare-fun lt!546243 () Bool)

(assert (=> d!133137 (= lt!546241 lt!546243)))

(declare-fun lt!546240 () Unit!39848)

(declare-fun e!684400 () Unit!39848)

(assert (=> d!133137 (= lt!546240 e!684400)))

(declare-fun c!118336 () Bool)

(assert (=> d!133137 (= c!118336 lt!546243)))

(assert (=> d!133137 (= lt!546243 (containsKey!589 (toList!8854 lt!546040) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133137 (= (contains!6929 lt!546040 #b0000000000000000000000000000000000000000000000000000000000000000) lt!546241)))

(declare-fun b!1205058 () Bool)

(declare-fun lt!546242 () Unit!39848)

(assert (=> b!1205058 (= e!684400 lt!546242)))

(assert (=> b!1205058 (= lt!546242 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546040) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1205058 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1205059 () Bool)

(declare-fun Unit!39875 () Unit!39848)

(assert (=> b!1205059 (= e!684400 Unit!39875)))

(declare-fun b!1205060 () Bool)

(assert (=> b!1205060 (= e!684399 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133137 c!118336) b!1205058))

(assert (= (and d!133137 (not c!118336)) b!1205059))

(assert (= (and d!133137 (not res!801481)) b!1205060))

(declare-fun m!1111329 () Bool)

(assert (=> d!133137 m!1111329))

(declare-fun m!1111331 () Bool)

(assert (=> b!1205058 m!1111331))

(declare-fun m!1111333 () Bool)

(assert (=> b!1205058 m!1111333))

(assert (=> b!1205058 m!1111333))

(declare-fun m!1111335 () Bool)

(assert (=> b!1205058 m!1111335))

(assert (=> b!1205060 m!1111333))

(assert (=> b!1205060 m!1111333))

(assert (=> b!1205060 m!1111335))

(assert (=> d!132955 d!133137))

(assert (=> d!132955 d!132959))

(declare-fun d!133139 () Bool)

(declare-fun lt!546244 () Bool)

(assert (=> d!133139 (= lt!546244 (select (content!544 Nil!26509) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!684402 () Bool)

(assert (=> d!133139 (= lt!546244 e!684402)))

(declare-fun res!801482 () Bool)

(assert (=> d!133139 (=> (not res!801482) (not e!684402))))

(assert (=> d!133139 (= res!801482 ((_ is Cons!26508) Nil!26509))))

(assert (=> d!133139 (= (contains!6930 Nil!26509 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)) lt!546244)))

(declare-fun b!1205061 () Bool)

(declare-fun e!684401 () Bool)

(assert (=> b!1205061 (= e!684402 e!684401)))

(declare-fun res!801483 () Bool)

(assert (=> b!1205061 (=> res!801483 e!684401)))

(assert (=> b!1205061 (= res!801483 (= (h!27726 Nil!26509) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1205062 () Bool)

(assert (=> b!1205062 (= e!684401 (contains!6930 (t!39381 Nil!26509) (select (arr!37644 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133139 res!801482) b!1205061))

(assert (= (and b!1205061 (not res!801483)) b!1205062))

(assert (=> d!133139 m!1110947))

(assert (=> d!133139 m!1110571))

(declare-fun m!1111337 () Bool)

(assert (=> d!133139 m!1111337))

(assert (=> b!1205062 m!1110571))

(declare-fun m!1111339 () Bool)

(assert (=> b!1205062 m!1111339))

(assert (=> b!1204622 d!133139))

(declare-fun d!133141 () Bool)

(declare-fun e!684403 () Bool)

(assert (=> d!133141 e!684403))

(declare-fun res!801484 () Bool)

(assert (=> d!133141 (=> res!801484 e!684403)))

(declare-fun lt!546246 () Bool)

(assert (=> d!133141 (= res!801484 (not lt!546246))))

(declare-fun lt!546248 () Bool)

(assert (=> d!133141 (= lt!546246 lt!546248)))

(declare-fun lt!546245 () Unit!39848)

(declare-fun e!684404 () Unit!39848)

(assert (=> d!133141 (= lt!546245 e!684404)))

(declare-fun c!118337 () Bool)

(assert (=> d!133141 (= c!118337 lt!546248)))

(assert (=> d!133141 (= lt!546248 (containsKey!589 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133141 (= (contains!6929 lt!546015 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!546246)))

(declare-fun b!1205063 () Bool)

(declare-fun lt!546247 () Unit!39848)

(assert (=> b!1205063 (= e!684404 lt!546247)))

(assert (=> b!1205063 (= lt!546247 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> b!1205063 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1205064 () Bool)

(declare-fun Unit!39876 () Unit!39848)

(assert (=> b!1205064 (= e!684404 Unit!39876)))

(declare-fun b!1205065 () Bool)

(assert (=> b!1205065 (= e!684403 (isDefined!455 (getValueByKey!627 (toList!8854 lt!546015) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!133141 c!118337) b!1205063))

(assert (= (and d!133141 (not c!118337)) b!1205064))

(assert (= (and d!133141 (not res!801484)) b!1205065))

(declare-fun m!1111341 () Bool)

(assert (=> d!133141 m!1111341))

(declare-fun m!1111343 () Bool)

(assert (=> b!1205063 m!1111343))

(assert (=> b!1205063 m!1110655))

(assert (=> b!1205063 m!1110655))

(declare-fun m!1111345 () Bool)

(assert (=> b!1205063 m!1111345))

(assert (=> b!1205065 m!1110655))

(assert (=> b!1205065 m!1110655))

(assert (=> b!1205065 m!1111345))

(assert (=> d!132939 d!133141))

(declare-fun b!1205068 () Bool)

(declare-fun e!684406 () Option!678)

(assert (=> b!1205068 (= e!684406 (getValueByKey!627 (t!39380 lt!546013) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1205067 () Bool)

(declare-fun e!684405 () Option!678)

(assert (=> b!1205067 (= e!684405 e!684406)))

(declare-fun c!118339 () Bool)

(assert (=> b!1205067 (= c!118339 (and ((_ is Cons!26507) lt!546013) (not (= (_1!9861 (h!27725 lt!546013)) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun b!1205066 () Bool)

(assert (=> b!1205066 (= e!684405 (Some!677 (_2!9861 (h!27725 lt!546013))))))

(declare-fun b!1205069 () Bool)

(assert (=> b!1205069 (= e!684406 None!676)))

(declare-fun d!133143 () Bool)

(declare-fun c!118338 () Bool)

(assert (=> d!133143 (= c!118338 (and ((_ is Cons!26507) lt!546013) (= (_1!9861 (h!27725 lt!546013)) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!133143 (= (getValueByKey!627 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!684405)))

(assert (= (and d!133143 c!118338) b!1205066))

(assert (= (and d!133143 (not c!118338)) b!1205067))

(assert (= (and b!1205067 c!118339) b!1205068))

(assert (= (and b!1205067 (not c!118339)) b!1205069))

(declare-fun m!1111347 () Bool)

(assert (=> b!1205068 m!1111347))

(assert (=> d!132939 d!133143))

(declare-fun d!133145 () Bool)

(assert (=> d!133145 (= (getValueByKey!627 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!677 (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!546249 () Unit!39848)

(assert (=> d!133145 (= lt!546249 (choose!1794 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun e!684407 () Bool)

(assert (=> d!133145 e!684407))

(declare-fun res!801485 () Bool)

(assert (=> d!133145 (=> (not res!801485) (not e!684407))))

(assert (=> d!133145 (= res!801485 (isStrictlySorted!716 lt!546013))))

(assert (=> d!133145 (= (lemmaContainsTupThenGetReturnValue!309 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!546249)))

(declare-fun b!1205070 () Bool)

(declare-fun res!801486 () Bool)

(assert (=> b!1205070 (=> (not res!801486) (not e!684407))))

(assert (=> b!1205070 (= res!801486 (containsKey!589 lt!546013 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1205071 () Bool)

(assert (=> b!1205071 (= e!684407 (contains!6931 lt!546013 (tuple2!19701 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!133145 res!801485) b!1205070))

(assert (= (and b!1205070 res!801486) b!1205071))

(assert (=> d!133145 m!1110649))

(declare-fun m!1111349 () Bool)

(assert (=> d!133145 m!1111349))

(declare-fun m!1111351 () Bool)

(assert (=> d!133145 m!1111351))

(declare-fun m!1111353 () Bool)

(assert (=> b!1205070 m!1111353))

(declare-fun m!1111355 () Bool)

(assert (=> b!1205071 m!1111355))

(assert (=> d!132939 d!133145))

(declare-fun bm!58124 () Bool)

(declare-fun call!58129 () List!26511)

(declare-fun call!58127 () List!26511)

(assert (=> bm!58124 (= call!58129 call!58127)))

(declare-fun b!1205072 () Bool)

(declare-fun e!684408 () List!26511)

(declare-fun call!58128 () List!26511)

(assert (=> b!1205072 (= e!684408 call!58128)))

(declare-fun bm!58125 () Bool)

(declare-fun e!684411 () List!26511)

(declare-fun c!118341 () Bool)

(assert (=> bm!58125 (= call!58128 ($colon$colon!610 e!684411 (ite c!118341 (h!27725 (toList!8854 lt!545865)) (tuple2!19701 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun c!118342 () Bool)

(assert (=> bm!58125 (= c!118342 c!118341)))

(declare-fun b!1205073 () Bool)

(declare-fun c!118343 () Bool)

(assert (=> b!1205073 (= c!118343 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (bvsgt (_1!9861 (h!27725 (toList!8854 lt!545865))) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun e!684410 () List!26511)

(declare-fun e!684409 () List!26511)

(assert (=> b!1205073 (= e!684410 e!684409)))

(declare-fun b!1205074 () Bool)

(declare-fun e!684412 () Bool)

(declare-fun lt!546250 () List!26511)

(assert (=> b!1205074 (= e!684412 (contains!6931 lt!546250 (tuple2!19701 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun bm!58126 () Bool)

(assert (=> bm!58126 (= call!58127 call!58128)))

(declare-fun b!1205075 () Bool)

(assert (=> b!1205075 (= e!684410 call!58127)))

(declare-fun c!118340 () Bool)

(declare-fun b!1205076 () Bool)

(assert (=> b!1205076 (= e!684411 (ite c!118340 (t!39380 (toList!8854 lt!545865)) (ite c!118343 (Cons!26507 (h!27725 (toList!8854 lt!545865)) (t!39380 (toList!8854 lt!545865))) Nil!26508)))))

(declare-fun b!1205077 () Bool)

(assert (=> b!1205077 (= e!684411 (insertStrictlySorted!402 (t!39380 (toList!8854 lt!545865)) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1205078 () Bool)

(assert (=> b!1205078 (= e!684409 call!58129)))

(declare-fun d!133147 () Bool)

(assert (=> d!133147 e!684412))

(declare-fun res!801488 () Bool)

(assert (=> d!133147 (=> (not res!801488) (not e!684412))))

(assert (=> d!133147 (= res!801488 (isStrictlySorted!716 lt!546250))))

(assert (=> d!133147 (= lt!546250 e!684408)))

(assert (=> d!133147 (= c!118341 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (bvslt (_1!9861 (h!27725 (toList!8854 lt!545865))) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!133147 (isStrictlySorted!716 (toList!8854 lt!545865))))

(assert (=> d!133147 (= (insertStrictlySorted!402 (toList!8854 lt!545865) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!546250)))

(declare-fun b!1205079 () Bool)

(assert (=> b!1205079 (= e!684409 call!58129)))

(declare-fun b!1205080 () Bool)

(declare-fun res!801487 () Bool)

(assert (=> b!1205080 (=> (not res!801487) (not e!684412))))

(assert (=> b!1205080 (= res!801487 (containsKey!589 lt!546250 (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1205081 () Bool)

(assert (=> b!1205081 (= e!684408 e!684410)))

(assert (=> b!1205081 (= c!118340 (and ((_ is Cons!26507) (toList!8854 lt!545865)) (= (_1!9861 (h!27725 (toList!8854 lt!545865))) (_1!9861 (tuple2!19701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!133147 c!118341) b!1205072))

(assert (= (and d!133147 (not c!118341)) b!1205081))

(assert (= (and b!1205081 c!118340) b!1205075))

(assert (= (and b!1205081 (not c!118340)) b!1205073))

(assert (= (and b!1205073 c!118343) b!1205078))

(assert (= (and b!1205073 (not c!118343)) b!1205079))

(assert (= (or b!1205078 b!1205079) bm!58124))

(assert (= (or b!1205075 bm!58124) bm!58126))

(assert (= (or b!1205072 bm!58126) bm!58125))

(assert (= (and bm!58125 c!118342) b!1205077))

(assert (= (and bm!58125 (not c!118342)) b!1205076))

(assert (= (and d!133147 res!801488) b!1205080))

(assert (= (and b!1205080 res!801487) b!1205074))

(declare-fun m!1111357 () Bool)

(assert (=> b!1205077 m!1111357))

(declare-fun m!1111359 () Bool)

(assert (=> b!1205080 m!1111359))

(declare-fun m!1111361 () Bool)

(assert (=> b!1205074 m!1111361))

(declare-fun m!1111363 () Bool)

(assert (=> d!133147 m!1111363))

(assert (=> d!133147 m!1111245))

(declare-fun m!1111365 () Bool)

(assert (=> bm!58125 m!1111365))

(assert (=> d!132939 d!133147))

(assert (=> b!1204732 d!133135))

(declare-fun b!1205082 () Bool)

(declare-fun lt!546253 () Unit!39848)

(declare-fun lt!546254 () Unit!39848)

(assert (=> b!1205082 (= lt!546253 lt!546254)))

(declare-fun lt!546257 () (_ BitVec 64))

(declare-fun lt!546255 () ListLongMap!17677)

(declare-fun lt!546256 () V!45929)

(declare-fun lt!546252 () (_ BitVec 64))

(assert (=> b!1205082 (not (contains!6929 (+!4021 lt!546255 (tuple2!19701 lt!546257 lt!546256)) lt!546252))))

(assert (=> b!1205082 (= lt!546254 (addStillNotContains!290 lt!546255 lt!546257 lt!546256 lt!546252))))

(assert (=> b!1205082 (= lt!546252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1205082 (= lt!546256 (get!19233 (select (arr!37645 (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1205082 (= lt!546257 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58130 () ListLongMap!17677)

(assert (=> b!1205082 (= lt!546255 call!58130)))

(declare-fun e!684419 () ListLongMap!17677)

(assert (=> b!1205082 (= e!684419 (+!4021 call!58130 (tuple2!19701 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19233 (select (arr!37645 (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1205083 () Bool)

(declare-fun e!684415 () ListLongMap!17677)

(assert (=> b!1205083 (= e!684415 (ListLongMap!17678 Nil!26508))))

(declare-fun b!1205084 () Bool)

(declare-fun e!684417 () Bool)

(declare-fun e!684418 () Bool)

(assert (=> b!1205084 (= e!684417 e!684418)))

(assert (=> b!1205084 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))))

(declare-fun res!801491 () Bool)

(declare-fun lt!546251 () ListLongMap!17677)

(assert (=> b!1205084 (= res!801491 (contains!6929 lt!546251 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205084 (=> (not res!801491) (not e!684418))))

(declare-fun e!684416 () Bool)

(declare-fun b!1205085 () Bool)

(assert (=> b!1205085 (= e!684416 (= lt!546251 (getCurrentListMapNoExtraKeys!5321 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)) (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1205086 () Bool)

(assert (=> b!1205086 (= e!684419 call!58130)))

(declare-fun b!1205087 () Bool)

(declare-fun e!684413 () Bool)

(assert (=> b!1205087 (= e!684413 e!684417)))

(declare-fun c!118344 () Bool)

(declare-fun e!684414 () Bool)

(assert (=> b!1205087 (= c!118344 e!684414)))

(declare-fun res!801489 () Bool)

(assert (=> b!1205087 (=> (not res!801489) (not e!684414))))

(assert (=> b!1205087 (= res!801489 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))))

(declare-fun d!133149 () Bool)

(assert (=> d!133149 e!684413))

(declare-fun res!801490 () Bool)

(assert (=> d!133149 (=> (not res!801490) (not e!684413))))

(assert (=> d!133149 (= res!801490 (not (contains!6929 lt!546251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133149 (= lt!546251 e!684415)))

(declare-fun c!118346 () Bool)

(assert (=> d!133149 (= c!118346 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))))

(assert (=> d!133149 (validMask!0 mask!1564)))

(assert (=> d!133149 (= (getCurrentListMapNoExtraKeys!5321 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)) (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546251)))

(declare-fun b!1205088 () Bool)

(assert (=> b!1205088 (= e!684417 e!684416)))

(declare-fun c!118345 () Bool)

(assert (=> b!1205088 (= c!118345 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))))

(declare-fun b!1205089 () Bool)

(assert (=> b!1205089 (= e!684415 e!684419)))

(declare-fun c!118347 () Bool)

(assert (=> b!1205089 (= c!118347 (validKeyInArray!0 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1205090 () Bool)

(assert (=> b!1205090 (= e!684416 (isEmpty!984 lt!546251))))

(declare-fun b!1205091 () Bool)

(assert (=> b!1205091 (= e!684414 (validKeyInArray!0 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1205091 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1205092 () Bool)

(declare-fun res!801492 () Bool)

(assert (=> b!1205092 (=> (not res!801492) (not e!684413))))

(assert (=> b!1205092 (= res!801492 (not (contains!6929 lt!546251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58127 () Bool)

(assert (=> bm!58127 (= call!58130 (getCurrentListMapNoExtraKeys!5321 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)) (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1205093 () Bool)

(assert (=> b!1205093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38181 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))))

(assert (=> b!1205093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38182 (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)))))))

(assert (=> b!1205093 (= e!684418 (= (apply!969 lt!546251 (select (arr!37644 (array!78012 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19233 (select (arr!37645 (array!78014 (store (arr!37645 _values!996) i!673 (ValueCellFull!14591 (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3249 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133149 c!118346) b!1205083))

(assert (= (and d!133149 (not c!118346)) b!1205089))

(assert (= (and b!1205089 c!118347) b!1205082))

(assert (= (and b!1205089 (not c!118347)) b!1205086))

(assert (= (or b!1205082 b!1205086) bm!58127))

(assert (= (and d!133149 res!801490) b!1205092))

(assert (= (and b!1205092 res!801492) b!1205087))

(assert (= (and b!1205087 res!801489) b!1205091))

(assert (= (and b!1205087 c!118344) b!1205084))

(assert (= (and b!1205087 (not c!118344)) b!1205088))

(assert (= (and b!1205084 res!801491) b!1205093))

(assert (= (and b!1205088 c!118345) b!1205085))

(assert (= (and b!1205088 (not c!118345)) b!1205090))

(declare-fun b_lambda!21149 () Bool)

(assert (=> (not b_lambda!21149) (not b!1205082)))

(assert (=> b!1205082 t!39379))

(declare-fun b_and!42731 () Bool)

(assert (= b_and!42729 (and (=> t!39379 result!21963) b_and!42731)))

(declare-fun b_lambda!21151 () Bool)

(assert (=> (not b_lambda!21151) (not b!1205093)))

(assert (=> b!1205093 t!39379))

(declare-fun b_and!42733 () Bool)

(assert (= b_and!42731 (and (=> t!39379 result!21963) b_and!42733)))

(declare-fun m!1111367 () Bool)

(assert (=> b!1205082 m!1111367))

(assert (=> b!1205082 m!1111367))

(declare-fun m!1111369 () Bool)

(assert (=> b!1205082 m!1111369))

(declare-fun m!1111371 () Bool)

(assert (=> b!1205082 m!1111371))

(assert (=> b!1205082 m!1110405))

(declare-fun m!1111373 () Bool)

(assert (=> b!1205082 m!1111373))

(declare-fun m!1111375 () Bool)

(assert (=> b!1205082 m!1111375))

(assert (=> b!1205082 m!1111373))

(assert (=> b!1205082 m!1110405))

(declare-fun m!1111377 () Bool)

(assert (=> b!1205082 m!1111377))

(declare-fun m!1111379 () Bool)

(assert (=> b!1205082 m!1111379))

(assert (=> b!1205093 m!1111371))

(assert (=> b!1205093 m!1110405))

(assert (=> b!1205093 m!1111373))

(assert (=> b!1205093 m!1111373))

(assert (=> b!1205093 m!1110405))

(assert (=> b!1205093 m!1111377))

(assert (=> b!1205093 m!1111371))

(declare-fun m!1111381 () Bool)

(assert (=> b!1205093 m!1111381))

(declare-fun m!1111383 () Bool)

(assert (=> bm!58127 m!1111383))

(assert (=> b!1205089 m!1111371))

(assert (=> b!1205089 m!1111371))

(declare-fun m!1111385 () Bool)

(assert (=> b!1205089 m!1111385))

(declare-fun m!1111387 () Bool)

(assert (=> b!1205090 m!1111387))

(declare-fun m!1111389 () Bool)

(assert (=> d!133149 m!1111389))

(assert (=> d!133149 m!1110441))

(assert (=> b!1205084 m!1111371))

(assert (=> b!1205084 m!1111371))

(declare-fun m!1111391 () Bool)

(assert (=> b!1205084 m!1111391))

(assert (=> b!1205091 m!1111371))

(assert (=> b!1205091 m!1111371))

(assert (=> b!1205091 m!1111385))

(assert (=> b!1205085 m!1111383))

(declare-fun m!1111393 () Bool)

(assert (=> b!1205092 m!1111393))

(assert (=> bm!58100 d!133149))

(declare-fun d!133151 () Bool)

(declare-fun res!801493 () Bool)

(declare-fun e!684420 () Bool)

(assert (=> d!133151 (=> res!801493 e!684420)))

(assert (=> d!133151 (= res!801493 (= (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!133151 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!684420)))

(declare-fun b!1205094 () Bool)

(declare-fun e!684421 () Bool)

(assert (=> b!1205094 (= e!684420 e!684421)))

(declare-fun res!801494 () Bool)

(assert (=> b!1205094 (=> (not res!801494) (not e!684421))))

(assert (=> b!1205094 (= res!801494 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(declare-fun b!1205095 () Bool)

(assert (=> b!1205095 (= e!684421 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!133151 (not res!801493)) b!1205094))

(assert (= (and b!1205094 res!801494) b!1205095))

(assert (=> d!133151 m!1111219))

(declare-fun m!1111395 () Bool)

(assert (=> b!1205095 m!1111395))

(assert (=> b!1204746 d!133151))

(declare-fun d!133153 () Bool)

(assert (=> d!133153 (= (apply!969 lt!545975 (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19234 (getValueByKey!627 (toList!8854 lt!545975) (select (arr!37644 lt!545876) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34094 () Bool)

(assert (= bs!34094 d!133153))

(assert (=> bs!34094 m!1110583))

(assert (=> bs!34094 m!1110849))

(assert (=> bs!34094 m!1110849))

(declare-fun m!1111397 () Bool)

(assert (=> bs!34094 m!1111397))

(assert (=> b!1204659 d!133153))

(assert (=> b!1204659 d!133013))

(assert (=> b!1204716 d!133119))

(declare-fun d!133155 () Bool)

(declare-fun e!684422 () Bool)

(assert (=> d!133155 e!684422))

(declare-fun res!801495 () Bool)

(assert (=> d!133155 (=> res!801495 e!684422)))

(declare-fun lt!546259 () Bool)

(assert (=> d!133155 (= res!801495 (not lt!546259))))

(declare-fun lt!546261 () Bool)

(assert (=> d!133155 (= lt!546259 lt!546261)))

(declare-fun lt!546258 () Unit!39848)

(declare-fun e!684423 () Unit!39848)

(assert (=> d!133155 (= lt!546258 e!684423)))

(declare-fun c!118348 () Bool)

(assert (=> d!133155 (= c!118348 lt!546261)))

(assert (=> d!133155 (= lt!546261 (containsKey!589 (toList!8854 lt!545975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!133155 (= (contains!6929 lt!545975 #b1000000000000000000000000000000000000000000000000000000000000000) lt!546259)))

(declare-fun b!1205096 () Bool)

(declare-fun lt!546260 () Unit!39848)

(assert (=> b!1205096 (= e!684423 lt!546260)))

(assert (=> b!1205096 (= lt!546260 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 lt!545975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1205096 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1205097 () Bool)

(declare-fun Unit!39877 () Unit!39848)

(assert (=> b!1205097 (= e!684423 Unit!39877)))

(declare-fun b!1205098 () Bool)

(assert (=> b!1205098 (= e!684422 (isDefined!455 (getValueByKey!627 (toList!8854 lt!545975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!133155 c!118348) b!1205096))

(assert (= (and d!133155 (not c!118348)) b!1205097))

(assert (= (and d!133155 (not res!801495)) b!1205098))

(declare-fun m!1111399 () Bool)

(assert (=> d!133155 m!1111399))

(declare-fun m!1111401 () Bool)

(assert (=> b!1205096 m!1111401))

(declare-fun m!1111403 () Bool)

(assert (=> b!1205096 m!1111403))

(assert (=> b!1205096 m!1111403))

(declare-fun m!1111405 () Bool)

(assert (=> b!1205096 m!1111405))

(assert (=> b!1205098 m!1111403))

(assert (=> b!1205098 m!1111403))

(assert (=> b!1205098 m!1111405))

(assert (=> b!1204658 d!133155))

(declare-fun d!133157 () Bool)

(declare-fun res!801498 () Bool)

(declare-fun e!684424 () Bool)

(assert (=> d!133157 (=> res!801498 e!684424)))

(assert (=> d!133157 (= res!801498 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38181 _keys!1208)))))

(assert (=> d!133157 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118207 (Cons!26508 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) Nil!26509) Nil!26509)) e!684424)))

(declare-fun call!58131 () Bool)

(declare-fun c!118349 () Bool)

(declare-fun bm!58128 () Bool)

(assert (=> bm!58128 (= call!58131 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!118349 (Cons!26508 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!118207 (Cons!26508 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) Nil!26509) Nil!26509)) (ite c!118207 (Cons!26508 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) Nil!26509) Nil!26509))))))

(declare-fun b!1205099 () Bool)

(declare-fun e!684427 () Bool)

(declare-fun e!684425 () Bool)

(assert (=> b!1205099 (= e!684427 e!684425)))

(assert (=> b!1205099 (= c!118349 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1205100 () Bool)

(assert (=> b!1205100 (= e!684425 call!58131)))

(declare-fun b!1205101 () Bool)

(assert (=> b!1205101 (= e!684424 e!684427)))

(declare-fun res!801497 () Bool)

(assert (=> b!1205101 (=> (not res!801497) (not e!684427))))

(declare-fun e!684426 () Bool)

(assert (=> b!1205101 (= res!801497 (not e!684426))))

(declare-fun res!801496 () Bool)

(assert (=> b!1205101 (=> (not res!801496) (not e!684426))))

(assert (=> b!1205101 (= res!801496 (validKeyInArray!0 (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1205102 () Bool)

(assert (=> b!1205102 (= e!684426 (contains!6930 (ite c!118207 (Cons!26508 (select (arr!37644 _keys!1208) #b00000000000000000000000000000000) Nil!26509) Nil!26509) (select (arr!37644 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1205103 () Bool)

(assert (=> b!1205103 (= e!684425 call!58131)))

(assert (= (and d!133157 (not res!801498)) b!1205101))

(assert (= (and b!1205101 res!801496) b!1205102))

(assert (= (and b!1205101 res!801497) b!1205099))

(assert (= (and b!1205099 c!118349) b!1205103))

(assert (= (and b!1205099 (not c!118349)) b!1205100))

(assert (= (or b!1205103 b!1205100) bm!58128))

(assert (=> bm!58128 m!1111219))

(declare-fun m!1111407 () Bool)

(assert (=> bm!58128 m!1111407))

(assert (=> b!1205099 m!1111219))

(assert (=> b!1205099 m!1111219))

(assert (=> b!1205099 m!1111221))

(assert (=> b!1205101 m!1111219))

(assert (=> b!1205101 m!1111219))

(assert (=> b!1205101 m!1111221))

(assert (=> b!1205102 m!1111219))

(assert (=> b!1205102 m!1111219))

(declare-fun m!1111409 () Bool)

(assert (=> b!1205102 m!1111409))

(assert (=> bm!58084 d!133157))

(declare-fun d!133159 () Bool)

(declare-fun e!684428 () Bool)

(assert (=> d!133159 e!684428))

(declare-fun res!801499 () Bool)

(assert (=> d!133159 (=> res!801499 e!684428)))

(declare-fun lt!546263 () Bool)

(assert (=> d!133159 (= res!801499 (not lt!546263))))

(declare-fun lt!546265 () Bool)

(assert (=> d!133159 (= lt!546263 lt!546265)))

(declare-fun lt!546262 () Unit!39848)

(declare-fun e!684429 () Unit!39848)

(assert (=> d!133159 (= lt!546262 e!684429)))

(declare-fun c!118350 () Bool)

(assert (=> d!133159 (= c!118350 lt!546265)))

(assert (=> d!133159 (= lt!546265 (containsKey!589 (toList!8854 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> d!133159 (= (contains!6929 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) k0!934) lt!546263)))

(declare-fun b!1205104 () Bool)

(declare-fun lt!546264 () Unit!39848)

(assert (=> b!1205104 (= e!684429 lt!546264)))

(assert (=> b!1205104 (= lt!546264 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) k0!934))))

(assert (=> b!1205104 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) k0!934))))

(declare-fun b!1205105 () Bool)

(declare-fun Unit!39878 () Unit!39848)

(assert (=> b!1205105 (= e!684429 Unit!39878)))

(declare-fun b!1205106 () Bool)

(assert (=> b!1205106 (= e!684428 (isDefined!455 (getValueByKey!627 (toList!8854 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) k0!934)))))

(assert (= (and d!133159 c!118350) b!1205104))

(assert (= (and d!133159 (not c!118350)) b!1205105))

(assert (= (and d!133159 (not res!801499)) b!1205106))

(declare-fun m!1111411 () Bool)

(assert (=> d!133159 m!1111411))

(declare-fun m!1111413 () Bool)

(assert (=> b!1205104 m!1111413))

(declare-fun m!1111415 () Bool)

(assert (=> b!1205104 m!1111415))

(assert (=> b!1205104 m!1111415))

(declare-fun m!1111417 () Bool)

(assert (=> b!1205104 m!1111417))

(assert (=> b!1205106 m!1111415))

(assert (=> b!1205106 m!1111415))

(assert (=> b!1205106 m!1111417))

(assert (=> d!132967 d!133159))

(declare-fun d!133161 () Bool)

(declare-fun e!684430 () Bool)

(assert (=> d!133161 e!684430))

(declare-fun res!801500 () Bool)

(assert (=> d!133161 (=> (not res!801500) (not e!684430))))

(declare-fun lt!546269 () ListLongMap!17677)

(assert (=> d!133161 (= res!801500 (contains!6929 lt!546269 (_1!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))))))

(declare-fun lt!546267 () List!26511)

(assert (=> d!133161 (= lt!546269 (ListLongMap!17678 lt!546267))))

(declare-fun lt!546266 () Unit!39848)

(declare-fun lt!546268 () Unit!39848)

(assert (=> d!133161 (= lt!546266 lt!546268)))

(assert (=> d!133161 (= (getValueByKey!627 lt!546267 (_1!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) (Some!677 (_2!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))))))

(assert (=> d!133161 (= lt!546268 (lemmaContainsTupThenGetReturnValue!309 lt!546267 (_1!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) (_2!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))))))

(assert (=> d!133161 (= lt!546267 (insertStrictlySorted!402 (toList!8854 (ite c!118180 lt!545866 lt!545865)) (_1!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) (_2!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))))))

(assert (=> d!133161 (= (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) lt!546269)))

(declare-fun b!1205107 () Bool)

(declare-fun res!801501 () Bool)

(assert (=> b!1205107 (=> (not res!801501) (not e!684430))))

(assert (=> b!1205107 (= res!801501 (= (getValueByKey!627 (toList!8854 lt!546269) (_1!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944))))) (Some!677 (_2!9861 (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))))))))

(declare-fun b!1205108 () Bool)

(assert (=> b!1205108 (= e!684430 (contains!6931 (toList!8854 lt!546269) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))))))

(assert (= (and d!133161 res!801500) b!1205107))

(assert (= (and b!1205107 res!801501) b!1205108))

(declare-fun m!1111419 () Bool)

(assert (=> d!133161 m!1111419))

(declare-fun m!1111421 () Bool)

(assert (=> d!133161 m!1111421))

(declare-fun m!1111423 () Bool)

(assert (=> d!133161 m!1111423))

(declare-fun m!1111425 () Bool)

(assert (=> d!133161 m!1111425))

(declare-fun m!1111427 () Bool)

(assert (=> b!1205107 m!1111427))

(declare-fun m!1111429 () Bool)

(assert (=> b!1205108 m!1111429))

(assert (=> d!132967 d!133161))

(declare-fun d!133163 () Bool)

(assert (=> d!133163 (contains!6929 (+!4021 (ite c!118180 lt!545866 lt!545865) (tuple2!19701 (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)))) k0!934)))

(assert (=> d!133163 true))

(declare-fun _$35!456 () Unit!39848)

(assert (=> d!133163 (= (choose!1790 (ite c!118180 lt!545866 lt!545865) (ite c!118180 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118179 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118180 minValue!944 (ite c!118179 zeroValue!944 minValue!944)) k0!934) _$35!456)))

(declare-fun bs!34095 () Bool)

(assert (= bs!34095 d!133163))

(assert (=> bs!34095 m!1110773))

(assert (=> bs!34095 m!1110773))

(assert (=> bs!34095 m!1110775))

(assert (=> d!132967 d!133163))

(declare-fun d!133165 () Bool)

(declare-fun e!684431 () Bool)

(assert (=> d!133165 e!684431))

(declare-fun res!801502 () Bool)

(assert (=> d!133165 (=> res!801502 e!684431)))

(declare-fun lt!546271 () Bool)

(assert (=> d!133165 (= res!801502 (not lt!546271))))

(declare-fun lt!546273 () Bool)

(assert (=> d!133165 (= lt!546271 lt!546273)))

(declare-fun lt!546270 () Unit!39848)

(declare-fun e!684432 () Unit!39848)

(assert (=> d!133165 (= lt!546270 e!684432)))

(declare-fun c!118351 () Bool)

(assert (=> d!133165 (= c!118351 lt!546273)))

(assert (=> d!133165 (= lt!546273 (containsKey!589 (toList!8854 (ite c!118180 lt!545866 lt!545865)) k0!934))))

(assert (=> d!133165 (= (contains!6929 (ite c!118180 lt!545866 lt!545865) k0!934) lt!546271)))

(declare-fun b!1205109 () Bool)

(declare-fun lt!546272 () Unit!39848)

(assert (=> b!1205109 (= e!684432 lt!546272)))

(assert (=> b!1205109 (= lt!546272 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8854 (ite c!118180 lt!545866 lt!545865)) k0!934))))

(assert (=> b!1205109 (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 lt!545865)) k0!934))))

(declare-fun b!1205110 () Bool)

(declare-fun Unit!39879 () Unit!39848)

(assert (=> b!1205110 (= e!684432 Unit!39879)))

(declare-fun b!1205111 () Bool)

(assert (=> b!1205111 (= e!684431 (isDefined!455 (getValueByKey!627 (toList!8854 (ite c!118180 lt!545866 lt!545865)) k0!934)))))

(assert (= (and d!133165 c!118351) b!1205109))

(assert (= (and d!133165 (not c!118351)) b!1205110))

(assert (= (and d!133165 (not res!801502)) b!1205111))

(declare-fun m!1111431 () Bool)

(assert (=> d!133165 m!1111431))

(declare-fun m!1111433 () Bool)

(assert (=> b!1205109 m!1111433))

(declare-fun m!1111435 () Bool)

(assert (=> b!1205109 m!1111435))

(assert (=> b!1205109 m!1111435))

(declare-fun m!1111437 () Bool)

(assert (=> b!1205109 m!1111437))

(assert (=> b!1205111 m!1111435))

(assert (=> b!1205111 m!1111435))

(assert (=> b!1205111 m!1111437))

(assert (=> d!132967 d!133165))

(declare-fun d!133167 () Bool)

(assert (=> d!133167 (= (isEmpty!984 lt!545975) (isEmpty!985 (toList!8854 lt!545975)))))

(declare-fun bs!34096 () Bool)

(assert (= bs!34096 d!133167))

(declare-fun m!1111439 () Bool)

(assert (=> bs!34096 m!1111439))

(assert (=> b!1204656 d!133167))

(assert (=> bm!58094 d!133017))

(declare-fun b!1205112 () Bool)

(declare-fun e!684433 () Bool)

(assert (=> b!1205112 (= e!684433 tp_is_empty!30601)))

(declare-fun b!1205113 () Bool)

(declare-fun e!684434 () Bool)

(assert (=> b!1205113 (= e!684434 tp_is_empty!30601)))

(declare-fun mapIsEmpty!47754 () Bool)

(declare-fun mapRes!47754 () Bool)

(assert (=> mapIsEmpty!47754 mapRes!47754))

(declare-fun condMapEmpty!47754 () Bool)

(declare-fun mapDefault!47754 () ValueCell!14591)

(assert (=> mapNonEmpty!47753 (= condMapEmpty!47754 (= mapRest!47753 ((as const (Array (_ BitVec 32) ValueCell!14591)) mapDefault!47754)))))

(assert (=> mapNonEmpty!47753 (= tp!90696 (and e!684434 mapRes!47754))))

(declare-fun mapNonEmpty!47754 () Bool)

(declare-fun tp!90697 () Bool)

(assert (=> mapNonEmpty!47754 (= mapRes!47754 (and tp!90697 e!684433))))

(declare-fun mapKey!47754 () (_ BitVec 32))

(declare-fun mapValue!47754 () ValueCell!14591)

(declare-fun mapRest!47754 () (Array (_ BitVec 32) ValueCell!14591))

(assert (=> mapNonEmpty!47754 (= mapRest!47753 (store mapRest!47754 mapKey!47754 mapValue!47754))))

(assert (= (and mapNonEmpty!47753 condMapEmpty!47754) mapIsEmpty!47754))

(assert (= (and mapNonEmpty!47753 (not condMapEmpty!47754)) mapNonEmpty!47754))

(assert (= (and mapNonEmpty!47754 ((_ is ValueCellFull!14591) mapValue!47754)) b!1205112))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14591) mapDefault!47754)) b!1205113))

(declare-fun m!1111441 () Bool)

(assert (=> mapNonEmpty!47754 m!1111441))

(declare-fun b_lambda!21153 () Bool)

(assert (= b_lambda!21149 (or (and start!100810 b_free!25897) b_lambda!21153)))

(declare-fun b_lambda!21155 () Bool)

(assert (= b_lambda!21143 (or (and start!100810 b_free!25897) b_lambda!21155)))

(declare-fun b_lambda!21157 () Bool)

(assert (= b_lambda!21139 (or (and start!100810 b_free!25897) b_lambda!21157)))

(declare-fun b_lambda!21159 () Bool)

(assert (= b_lambda!21133 (or (and start!100810 b_free!25897) b_lambda!21159)))

(declare-fun b_lambda!21161 () Bool)

(assert (= b_lambda!21131 (or (and start!100810 b_free!25897) b_lambda!21161)))

(declare-fun b_lambda!21163 () Bool)

(assert (= b_lambda!21151 (or (and start!100810 b_free!25897) b_lambda!21163)))

(declare-fun b_lambda!21165 () Bool)

(assert (= b_lambda!21137 (or (and start!100810 b_free!25897) b_lambda!21165)))

(declare-fun b_lambda!21167 () Bool)

(assert (= b_lambda!21135 (or (and start!100810 b_free!25897) b_lambda!21167)))

(declare-fun b_lambda!21169 () Bool)

(assert (= b_lambda!21145 (or (and start!100810 b_free!25897) b_lambda!21169)))

(declare-fun b_lambda!21171 () Bool)

(assert (= b_lambda!21147 (or (and start!100810 b_free!25897) b_lambda!21171)))

(declare-fun b_lambda!21173 () Bool)

(assert (= b_lambda!21141 (or (and start!100810 b_free!25897) b_lambda!21173)))

(check-sat (not b!1204961) (not b!1205098) (not b_lambda!21117) (not b!1204786) (not d!133069) (not d!133165) (not b!1205107) (not b!1205068) (not b_lambda!21125) (not b!1205006) (not b_lambda!21167) (not b!1205026) (not b!1205047) (not b!1204854) (not b!1204880) (not b_lambda!21157) (not b!1205046) (not d!133147) (not bm!58123) (not d!133067) (not b!1205041) (not b!1204877) (not b!1204865) (not b!1205065) (not b!1205001) b_and!42733 (not b!1205060) (not d!133027) (not b!1204984) (not b!1204875) (not d!132989) (not b!1204847) (not d!133019) (not b_next!25897) (not b!1204792) (not bm!58105) (not b!1204807) (not d!133129) (not b!1205092) (not d!133001) (not d!132981) (not d!133123) (not d!133007) (not b!1204764) (not b!1204974) (not b!1204925) (not b!1204970) (not d!133153) (not b_lambda!21123) (not b!1204916) (not b!1204857) (not d!133167) (not b!1204931) (not b!1205108) (not b!1205062) (not d!133057) (not d!133095) (not b!1204932) (not bm!58116) (not mapNonEmpty!47754) (not b!1205051) (not b!1204887) (not d!133081) (not b!1205017) (not b!1205050) (not b!1204967) (not b!1205074) (not d!133125) (not b!1205008) (not b!1205042) (not d!132975) (not d!133097) (not b_lambda!21165) (not d!132999) (not b!1204987) (not b!1204969) (not b!1205109) (not b!1205091) (not d!133051) (not b!1205077) (not b!1204898) (not b!1205102) (not b!1204848) (not b!1205080) (not b!1205048) (not b!1204814) (not b_lambda!21169) (not b!1205044) (not b!1204845) (not b!1204988) (not d!133039) (not d!133121) (not b!1205084) (not b!1204907) (not b!1205082) (not b!1204789) (not b!1205010) (not b!1204767) (not b_lambda!21163) (not b!1204976) (not d!133145) (not b!1204850) (not d!132995) (not d!132979) (not d!133161) (not b_lambda!21155) (not b!1205012) (not b!1204991) (not d!133117) (not d!133159) (not d!133155) (not b!1204816) (not d!133053) (not d!133059) (not bm!58127) (not b!1204885) (not b!1204975) (not d!133103) (not b!1204862) (not b!1204963) (not d!133139) (not b!1205053) (not d!133137) (not d!133017) (not b_lambda!21161) (not b!1204958) (not b!1205055) (not bm!58122) (not b!1205099) (not d!132983) (not b!1204852) (not b!1204894) (not b!1205030) (not d!133085) (not d!133021) (not b!1204863) (not b!1205007) (not d!133115) (not d!132971) tp_is_empty!30601 (not b!1204999) (not d!133141) (not b!1205089) (not b!1205071) (not b!1205045) (not b!1205095) (not d!133107) (not b!1205002) (not b!1204766) (not b!1205104) (not b!1204784) (not b!1204873) (not b!1205009) (not bm!58113) (not b!1205028) (not b!1204861) (not b!1204796) (not b!1204986) (not b!1204972) (not d!132985) (not bm!58103) (not b!1204783) (not d!133071) (not b!1204871) (not b!1204971) (not b_lambda!21093) (not bm!58121) (not b!1204878) (not b!1204853) (not b_lambda!21159) (not b!1205039) (not d!133101) (not b!1204904) (not b_lambda!21113) (not d!133163) (not b!1204779) (not b!1205057) (not b!1205040) (not d!133065) (not bm!58125) (not d!133149) (not b!1204893) (not bm!58115) (not d!133011) (not b!1204914) (not d!133043) (not b!1204913) (not b_lambda!21171) (not d!133119) (not b!1204864) (not b!1204979) (not b!1205111) (not b_lambda!21153) (not d!133063) (not b!1204839) (not d!133127) (not b!1204849) (not d!133079) (not b_lambda!21115) (not d!133049) (not b!1205034) (not b!1205031) (not b!1204812) (not d!133093) (not b!1204920) (not b!1204794) (not d!132991) (not b!1204856) (not b!1205093) (not d!133083) (not d!133073) (not b!1204896) (not d!133041) (not d!133111) (not bm!58128) (not b!1204980) (not b!1204965) (not d!133075) (not b!1204851) (not b!1205033) (not b!1205090) (not b!1204955) (not b!1204908) (not b!1204922) (not b!1205101) (not b_lambda!21119) (not b_lambda!21129) (not b!1204982) (not b!1204905) (not d!133031) (not b!1204912) (not b!1205096) (not b!1204998) (not b!1205085) (not b_lambda!21121) (not d!133061) (not b!1204883) (not bm!58104) (not b_lambda!21173) (not b!1204978) (not b!1205014) (not b!1204781) (not b!1205058) (not d!132993) (not b!1204915) (not b!1205106) (not d!133047) (not b!1204809) (not d!133015) (not bm!58102) (not b!1205063) (not b!1204840) (not d!133009) (not b!1205019) (not b!1204917) (not b!1204872) (not b!1204981) (not d!133037) (not b_lambda!21127) (not b!1205070) (not b!1204834) (not b!1205021) (not b!1204919) (not b!1205038))
(check-sat b_and!42733 (not b_next!25897))
