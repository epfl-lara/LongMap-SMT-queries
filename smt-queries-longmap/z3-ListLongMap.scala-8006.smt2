; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99112 () Bool)

(assert start!99112)

(declare-fun b_free!24481 () Bool)

(declare-fun b_next!24481 () Bool)

(assert (=> start!99112 (= b_free!24481 (not b_next!24481))))

(declare-fun tp!86154 () Bool)

(declare-fun b_and!39813 () Bool)

(assert (=> start!99112 (= tp!86154 b_and!39813)))

(declare-fun b!1158427 () Bool)

(declare-fun e!658895 () Bool)

(declare-fun e!658888 () Bool)

(assert (=> b!1158427 (= e!658895 e!658888)))

(declare-fun res!769007 () Bool)

(assert (=> b!1158427 (=> res!769007 e!658888)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158427 (= res!769007 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43809 0))(
  ( (V!43810 (val!14562 Int)) )
))
(declare-fun zeroValue!944 () V!43809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!74913 0))(
  ( (array!74914 (arr!36101 (Array (_ BitVec 32) (_ BitVec 64))) (size!36638 (_ BitVec 32))) )
))
(declare-fun lt!520096 () array!74913)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13796 0))(
  ( (ValueCellFull!13796 (v!17195 V!43809)) (EmptyCell!13796) )
))
(declare-datatypes ((array!74915 0))(
  ( (array!74916 (arr!36102 (Array (_ BitVec 32) ValueCell!13796)) (size!36639 (_ BitVec 32))) )
))
(declare-fun lt!520104 () array!74915)

(declare-fun minValue!944 () V!43809)

(declare-datatypes ((tuple2!18550 0))(
  ( (tuple2!18551 (_1!9286 (_ BitVec 64)) (_2!9286 V!43809)) )
))
(declare-datatypes ((List!25292 0))(
  ( (Nil!25289) (Cons!25288 (h!26506 tuple2!18550) (t!36757 List!25292)) )
))
(declare-datatypes ((ListLongMap!16527 0))(
  ( (ListLongMap!16528 (toList!8279 List!25292)) )
))
(declare-fun lt!520098 () ListLongMap!16527)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4772 (array!74913 array!74915 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 32) Int) ListLongMap!16527)

(assert (=> b!1158427 (= lt!520098 (getCurrentListMapNoExtraKeys!4772 lt!520096 lt!520104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74915)

(declare-fun lt!520100 () V!43809)

(assert (=> b!1158427 (= lt!520104 (array!74916 (store (arr!36102 _values!996) i!673 (ValueCellFull!13796 lt!520100)) (size!36639 _values!996)))))

(declare-fun dynLambda!2785 (Int (_ BitVec 64)) V!43809)

(assert (=> b!1158427 (= lt!520100 (dynLambda!2785 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74913)

(declare-fun lt!520111 () ListLongMap!16527)

(assert (=> b!1158427 (= lt!520111 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158428 () Bool)

(declare-fun res!769005 () Bool)

(declare-fun e!658882 () Bool)

(assert (=> b!1158428 (=> (not res!769005) (not e!658882))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1158428 (= res!769005 (= (select (arr!36101 _keys!1208) i!673) k0!934))))

(declare-fun c!115589 () Bool)

(declare-fun c!115588 () Bool)

(declare-fun call!55384 () ListLongMap!16527)

(declare-fun lt!520092 () ListLongMap!16527)

(declare-fun bm!55376 () Bool)

(declare-fun +!3701 (ListLongMap!16527 tuple2!18550) ListLongMap!16527)

(assert (=> bm!55376 (= call!55384 (+!3701 lt!520092 (ite (or c!115589 c!115588) (tuple2!18551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!658890 () Bool)

(declare-fun lt!520101 () ListLongMap!16527)

(declare-fun b!1158430 () Bool)

(assert (=> b!1158430 (= e!658890 (= lt!520101 (getCurrentListMapNoExtraKeys!4772 lt!520096 lt!520104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158431 () Bool)

(declare-fun lt!520108 () Bool)

(assert (=> b!1158431 (= c!115588 (and (not lt!520108) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38101 0))(
  ( (Unit!38102) )
))
(declare-fun e!658883 () Unit!38101)

(declare-fun e!658886 () Unit!38101)

(assert (=> b!1158431 (= e!658883 e!658886)))

(declare-fun b!1158432 () Bool)

(declare-fun e!658893 () Bool)

(assert (=> b!1158432 (= e!658893 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520108) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158433 () Bool)

(declare-fun call!55383 () Bool)

(assert (=> b!1158433 call!55383))

(declare-fun lt!520105 () Unit!38101)

(declare-fun call!55386 () Unit!38101)

(assert (=> b!1158433 (= lt!520105 call!55386)))

(declare-fun e!658892 () Unit!38101)

(assert (=> b!1158433 (= e!658892 lt!520105)))

(declare-fun b!1158434 () Bool)

(declare-fun lt!520095 () ListLongMap!16527)

(declare-fun contains!6802 (ListLongMap!16527 (_ BitVec 64)) Bool)

(assert (=> b!1158434 (contains!6802 (+!3701 lt!520095 (tuple2!18551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!520110 () Unit!38101)

(declare-fun call!55385 () Unit!38101)

(assert (=> b!1158434 (= lt!520110 call!55385)))

(declare-fun call!55382 () Bool)

(assert (=> b!1158434 call!55382))

(assert (=> b!1158434 (= lt!520095 call!55384)))

(declare-fun lt!520103 () Unit!38101)

(declare-fun addStillContains!923 (ListLongMap!16527 (_ BitVec 64) V!43809 (_ BitVec 64)) Unit!38101)

(assert (=> b!1158434 (= lt!520103 (addStillContains!923 lt!520092 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1158434 (= e!658883 lt!520110)))

(declare-fun b!1158435 () Bool)

(declare-fun e!658891 () Bool)

(declare-fun call!55381 () ListLongMap!16527)

(declare-fun call!55380 () ListLongMap!16527)

(assert (=> b!1158435 (= e!658891 (= call!55381 call!55380))))

(declare-fun bm!55377 () Bool)

(assert (=> bm!55377 (= call!55381 (getCurrentListMapNoExtraKeys!4772 lt!520096 lt!520104 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55378 () Bool)

(declare-fun call!55379 () ListLongMap!16527)

(assert (=> bm!55378 (= call!55379 call!55384)))

(declare-fun b!1158436 () Bool)

(declare-fun res!768997 () Bool)

(assert (=> b!1158436 (=> (not res!768997) (not e!658882))))

(assert (=> b!1158436 (= res!768997 (and (= (size!36639 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36638 _keys!1208) (size!36639 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45341 () Bool)

(declare-fun mapRes!45341 () Bool)

(assert (=> mapIsEmpty!45341 mapRes!45341))

(declare-fun bm!55379 () Bool)

(assert (=> bm!55379 (= call!55380 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55380 () Bool)

(assert (=> bm!55380 (= call!55383 call!55382)))

(declare-fun b!1158437 () Bool)

(declare-fun e!658889 () Bool)

(assert (=> b!1158437 (= e!658889 true)))

(assert (=> b!1158437 e!658890))

(declare-fun res!769006 () Bool)

(assert (=> b!1158437 (=> (not res!769006) (not e!658890))))

(assert (=> b!1158437 (= res!769006 (= lt!520101 lt!520092))))

(declare-fun -!1381 (ListLongMap!16527 (_ BitVec 64)) ListLongMap!16527)

(assert (=> b!1158437 (= lt!520101 (-!1381 lt!520111 k0!934))))

(declare-fun lt!520097 () V!43809)

(assert (=> b!1158437 (= (-!1381 (+!3701 lt!520092 (tuple2!18551 (select (arr!36101 _keys!1208) from!1455) lt!520097)) (select (arr!36101 _keys!1208) from!1455)) lt!520092)))

(declare-fun lt!520091 () Unit!38101)

(declare-fun addThenRemoveForNewKeyIsSame!217 (ListLongMap!16527 (_ BitVec 64) V!43809) Unit!38101)

(assert (=> b!1158437 (= lt!520091 (addThenRemoveForNewKeyIsSame!217 lt!520092 (select (arr!36101 _keys!1208) from!1455) lt!520097))))

(declare-fun get!18422 (ValueCell!13796 V!43809) V!43809)

(assert (=> b!1158437 (= lt!520097 (get!18422 (select (arr!36102 _values!996) from!1455) lt!520100))))

(declare-fun lt!520109 () Unit!38101)

(declare-fun e!658897 () Unit!38101)

(assert (=> b!1158437 (= lt!520109 e!658897)))

(declare-fun c!115587 () Bool)

(assert (=> b!1158437 (= c!115587 (contains!6802 lt!520092 k0!934))))

(assert (=> b!1158437 (= lt!520092 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158438 () Bool)

(declare-fun res!769010 () Bool)

(assert (=> b!1158438 (=> (not res!769010) (not e!658882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158438 (= res!769010 (validMask!0 mask!1564))))

(declare-fun b!1158439 () Bool)

(declare-fun res!768999 () Bool)

(assert (=> b!1158439 (=> (not res!768999) (not e!658882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158439 (= res!768999 (validKeyInArray!0 k0!934))))

(declare-fun b!1158440 () Bool)

(declare-fun lt!520107 () Unit!38101)

(assert (=> b!1158440 (= e!658886 lt!520107)))

(assert (=> b!1158440 (= lt!520107 call!55386)))

(assert (=> b!1158440 call!55383))

(declare-fun b!1158441 () Bool)

(declare-fun e!658885 () Bool)

(declare-fun arrayContainsKey!0 (array!74913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158441 (= e!658885 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55381 () Bool)

(assert (=> bm!55381 (= call!55382 (contains!6802 (ite c!115589 lt!520095 call!55379) k0!934))))

(declare-fun b!1158442 () Bool)

(declare-fun e!658887 () Bool)

(assert (=> b!1158442 (= e!658887 (not e!658895))))

(declare-fun res!769003 () Bool)

(assert (=> b!1158442 (=> res!769003 e!658895)))

(assert (=> b!1158442 (= res!769003 (bvsgt from!1455 i!673))))

(assert (=> b!1158442 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520099 () Unit!38101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74913 (_ BitVec 64) (_ BitVec 32)) Unit!38101)

(assert (=> b!1158442 (= lt!520099 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45341 () Bool)

(declare-fun tp!86153 () Bool)

(declare-fun e!658896 () Bool)

(assert (=> mapNonEmpty!45341 (= mapRes!45341 (and tp!86153 e!658896))))

(declare-fun mapKey!45341 () (_ BitVec 32))

(declare-fun mapValue!45341 () ValueCell!13796)

(declare-fun mapRest!45341 () (Array (_ BitVec 32) ValueCell!13796))

(assert (=> mapNonEmpty!45341 (= (arr!36102 _values!996) (store mapRest!45341 mapKey!45341 mapValue!45341))))

(declare-fun b!1158443 () Bool)

(assert (=> b!1158443 (= e!658886 e!658892)))

(declare-fun c!115585 () Bool)

(assert (=> b!1158443 (= c!115585 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520108))))

(declare-fun b!1158429 () Bool)

(assert (=> b!1158429 (= e!658888 e!658889)))

(declare-fun res!769002 () Bool)

(assert (=> b!1158429 (=> res!769002 e!658889)))

(assert (=> b!1158429 (= res!769002 (not (= (select (arr!36101 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158429 e!658891))

(declare-fun c!115586 () Bool)

(assert (=> b!1158429 (= c!115586 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520106 () Unit!38101)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!622 (array!74913 array!74915 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38101)

(assert (=> b!1158429 (= lt!520106 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!769004 () Bool)

(assert (=> start!99112 (=> (not res!769004) (not e!658882))))

(assert (=> start!99112 (= res!769004 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36638 _keys!1208))))))

(assert (=> start!99112 e!658882))

(declare-fun tp_is_empty!29011 () Bool)

(assert (=> start!99112 tp_is_empty!29011))

(declare-fun array_inv!27692 (array!74913) Bool)

(assert (=> start!99112 (array_inv!27692 _keys!1208)))

(assert (=> start!99112 true))

(assert (=> start!99112 tp!86154))

(declare-fun e!658894 () Bool)

(declare-fun array_inv!27693 (array!74915) Bool)

(assert (=> start!99112 (and (array_inv!27693 _values!996) e!658894)))

(declare-fun b!1158444 () Bool)

(assert (=> b!1158444 (= e!658896 tp_is_empty!29011)))

(declare-fun b!1158445 () Bool)

(declare-fun Unit!38103 () Unit!38101)

(assert (=> b!1158445 (= e!658897 Unit!38103)))

(declare-fun b!1158446 () Bool)

(assert (=> b!1158446 (= e!658893 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158447 () Bool)

(declare-fun res!769008 () Bool)

(assert (=> b!1158447 (=> (not res!769008) (not e!658882))))

(declare-datatypes ((List!25293 0))(
  ( (Nil!25290) (Cons!25289 (h!26507 (_ BitVec 64)) (t!36758 List!25293)) )
))
(declare-fun arrayNoDuplicates!0 (array!74913 (_ BitVec 32) List!25293) Bool)

(assert (=> b!1158447 (= res!769008 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25290))))

(declare-fun bm!55382 () Bool)

(assert (=> bm!55382 (= call!55386 call!55385)))

(declare-fun bm!55383 () Bool)

(assert (=> bm!55383 (= call!55385 (addStillContains!923 (ite c!115589 lt!520095 lt!520092) (ite c!115589 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115588 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115589 minValue!944 (ite c!115588 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158448 () Bool)

(assert (=> b!1158448 (= e!658891 (= call!55381 (-!1381 call!55380 k0!934)))))

(declare-fun b!1158449 () Bool)

(assert (=> b!1158449 (= e!658882 e!658887)))

(declare-fun res!769009 () Bool)

(assert (=> b!1158449 (=> (not res!769009) (not e!658887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74913 (_ BitVec 32)) Bool)

(assert (=> b!1158449 (= res!769009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520096 mask!1564))))

(assert (=> b!1158449 (= lt!520096 (array!74914 (store (arr!36101 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36638 _keys!1208)))))

(declare-fun b!1158450 () Bool)

(declare-fun res!768998 () Bool)

(assert (=> b!1158450 (=> (not res!768998) (not e!658882))))

(assert (=> b!1158450 (= res!768998 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36638 _keys!1208))))))

(declare-fun b!1158451 () Bool)

(declare-fun e!658881 () Bool)

(assert (=> b!1158451 (= e!658881 tp_is_empty!29011)))

(declare-fun b!1158452 () Bool)

(declare-fun res!769000 () Bool)

(assert (=> b!1158452 (=> (not res!769000) (not e!658887))))

(assert (=> b!1158452 (= res!769000 (arrayNoDuplicates!0 lt!520096 #b00000000000000000000000000000000 Nil!25290))))

(declare-fun b!1158453 () Bool)

(assert (=> b!1158453 (= e!658894 (and e!658881 mapRes!45341))))

(declare-fun condMapEmpty!45341 () Bool)

(declare-fun mapDefault!45341 () ValueCell!13796)

(assert (=> b!1158453 (= condMapEmpty!45341 (= (arr!36102 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13796)) mapDefault!45341)))))

(declare-fun b!1158454 () Bool)

(declare-fun Unit!38104 () Unit!38101)

(assert (=> b!1158454 (= e!658897 Unit!38104)))

(assert (=> b!1158454 (= lt!520108 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158454 (= c!115589 (and (not lt!520108) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520090 () Unit!38101)

(assert (=> b!1158454 (= lt!520090 e!658883)))

(declare-fun lt!520094 () Unit!38101)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!511 (array!74913 array!74915 (_ BitVec 32) (_ BitVec 32) V!43809 V!43809 (_ BitVec 64) (_ BitVec 32) Int) Unit!38101)

(assert (=> b!1158454 (= lt!520094 (lemmaListMapContainsThenArrayContainsFrom!511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115590 () Bool)

(assert (=> b!1158454 (= c!115590 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769011 () Bool)

(assert (=> b!1158454 (= res!769011 e!658893)))

(assert (=> b!1158454 (=> (not res!769011) (not e!658885))))

(assert (=> b!1158454 e!658885))

(declare-fun lt!520093 () Unit!38101)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74913 (_ BitVec 32) (_ BitVec 32)) Unit!38101)

(assert (=> b!1158454 (= lt!520093 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158454 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25290)))

(declare-fun lt!520102 () Unit!38101)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74913 (_ BitVec 64) (_ BitVec 32) List!25293) Unit!38101)

(assert (=> b!1158454 (= lt!520102 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25290))))

(assert (=> b!1158454 false))

(declare-fun b!1158455 () Bool)

(declare-fun Unit!38105 () Unit!38101)

(assert (=> b!1158455 (= e!658892 Unit!38105)))

(declare-fun b!1158456 () Bool)

(declare-fun res!769001 () Bool)

(assert (=> b!1158456 (=> (not res!769001) (not e!658882))))

(assert (=> b!1158456 (= res!769001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99112 res!769004) b!1158438))

(assert (= (and b!1158438 res!769010) b!1158436))

(assert (= (and b!1158436 res!768997) b!1158456))

(assert (= (and b!1158456 res!769001) b!1158447))

(assert (= (and b!1158447 res!769008) b!1158450))

(assert (= (and b!1158450 res!768998) b!1158439))

(assert (= (and b!1158439 res!768999) b!1158428))

(assert (= (and b!1158428 res!769005) b!1158449))

(assert (= (and b!1158449 res!769009) b!1158452))

(assert (= (and b!1158452 res!769000) b!1158442))

(assert (= (and b!1158442 (not res!769003)) b!1158427))

(assert (= (and b!1158427 (not res!769007)) b!1158429))

(assert (= (and b!1158429 c!115586) b!1158448))

(assert (= (and b!1158429 (not c!115586)) b!1158435))

(assert (= (or b!1158448 b!1158435) bm!55377))

(assert (= (or b!1158448 b!1158435) bm!55379))

(assert (= (and b!1158429 (not res!769002)) b!1158437))

(assert (= (and b!1158437 c!115587) b!1158454))

(assert (= (and b!1158437 (not c!115587)) b!1158445))

(assert (= (and b!1158454 c!115589) b!1158434))

(assert (= (and b!1158454 (not c!115589)) b!1158431))

(assert (= (and b!1158431 c!115588) b!1158440))

(assert (= (and b!1158431 (not c!115588)) b!1158443))

(assert (= (and b!1158443 c!115585) b!1158433))

(assert (= (and b!1158443 (not c!115585)) b!1158455))

(assert (= (or b!1158440 b!1158433) bm!55382))

(assert (= (or b!1158440 b!1158433) bm!55378))

(assert (= (or b!1158440 b!1158433) bm!55380))

(assert (= (or b!1158434 bm!55380) bm!55381))

(assert (= (or b!1158434 bm!55382) bm!55383))

(assert (= (or b!1158434 bm!55378) bm!55376))

(assert (= (and b!1158454 c!115590) b!1158446))

(assert (= (and b!1158454 (not c!115590)) b!1158432))

(assert (= (and b!1158454 res!769011) b!1158441))

(assert (= (and b!1158437 res!769006) b!1158430))

(assert (= (and b!1158453 condMapEmpty!45341) mapIsEmpty!45341))

(assert (= (and b!1158453 (not condMapEmpty!45341)) mapNonEmpty!45341))

(get-info :version)

(assert (= (and mapNonEmpty!45341 ((_ is ValueCellFull!13796) mapValue!45341)) b!1158444))

(assert (= (and b!1158453 ((_ is ValueCellFull!13796) mapDefault!45341)) b!1158451))

(assert (= start!99112 b!1158453))

(declare-fun b_lambda!19581 () Bool)

(assert (=> (not b_lambda!19581) (not b!1158427)))

(declare-fun t!36756 () Bool)

(declare-fun tb!9285 () Bool)

(assert (=> (and start!99112 (= defaultEntry!1004 defaultEntry!1004) t!36756) tb!9285))

(declare-fun result!19143 () Bool)

(assert (=> tb!9285 (= result!19143 tp_is_empty!29011)))

(assert (=> b!1158427 t!36756))

(declare-fun b_and!39815 () Bool)

(assert (= b_and!39813 (and (=> t!36756 result!19143) b_and!39815)))

(declare-fun m!1068077 () Bool)

(assert (=> b!1158456 m!1068077))

(declare-fun m!1068079 () Bool)

(assert (=> b!1158439 m!1068079))

(declare-fun m!1068081 () Bool)

(assert (=> b!1158442 m!1068081))

(declare-fun m!1068083 () Bool)

(assert (=> b!1158442 m!1068083))

(declare-fun m!1068085 () Bool)

(assert (=> b!1158428 m!1068085))

(declare-fun m!1068087 () Bool)

(assert (=> b!1158449 m!1068087))

(declare-fun m!1068089 () Bool)

(assert (=> b!1158449 m!1068089))

(declare-fun m!1068091 () Bool)

(assert (=> start!99112 m!1068091))

(declare-fun m!1068093 () Bool)

(assert (=> start!99112 m!1068093))

(declare-fun m!1068095 () Bool)

(assert (=> b!1158427 m!1068095))

(declare-fun m!1068097 () Bool)

(assert (=> b!1158427 m!1068097))

(declare-fun m!1068099 () Bool)

(assert (=> b!1158427 m!1068099))

(declare-fun m!1068101 () Bool)

(assert (=> b!1158427 m!1068101))

(declare-fun m!1068103 () Bool)

(assert (=> bm!55381 m!1068103))

(declare-fun m!1068105 () Bool)

(assert (=> b!1158430 m!1068105))

(declare-fun m!1068107 () Bool)

(assert (=> b!1158448 m!1068107))

(declare-fun m!1068109 () Bool)

(assert (=> bm!55379 m!1068109))

(declare-fun m!1068111 () Bool)

(assert (=> b!1158446 m!1068111))

(declare-fun m!1068113 () Bool)

(assert (=> b!1158434 m!1068113))

(assert (=> b!1158434 m!1068113))

(declare-fun m!1068115 () Bool)

(assert (=> b!1158434 m!1068115))

(declare-fun m!1068117 () Bool)

(assert (=> b!1158434 m!1068117))

(assert (=> bm!55377 m!1068105))

(declare-fun m!1068119 () Bool)

(assert (=> mapNonEmpty!45341 m!1068119))

(assert (=> b!1158441 m!1068111))

(declare-fun m!1068121 () Bool)

(assert (=> bm!55383 m!1068121))

(declare-fun m!1068123 () Bool)

(assert (=> b!1158429 m!1068123))

(declare-fun m!1068125 () Bool)

(assert (=> b!1158429 m!1068125))

(declare-fun m!1068127 () Bool)

(assert (=> b!1158454 m!1068127))

(declare-fun m!1068129 () Bool)

(assert (=> b!1158454 m!1068129))

(declare-fun m!1068131 () Bool)

(assert (=> b!1158454 m!1068131))

(declare-fun m!1068133 () Bool)

(assert (=> b!1158454 m!1068133))

(declare-fun m!1068135 () Bool)

(assert (=> b!1158438 m!1068135))

(declare-fun m!1068137 () Bool)

(assert (=> b!1158447 m!1068137))

(declare-fun m!1068139 () Bool)

(assert (=> b!1158452 m!1068139))

(assert (=> b!1158437 m!1068109))

(declare-fun m!1068141 () Bool)

(assert (=> b!1158437 m!1068141))

(assert (=> b!1158437 m!1068123))

(declare-fun m!1068143 () Bool)

(assert (=> b!1158437 m!1068143))

(declare-fun m!1068145 () Bool)

(assert (=> b!1158437 m!1068145))

(declare-fun m!1068147 () Bool)

(assert (=> b!1158437 m!1068147))

(declare-fun m!1068149 () Bool)

(assert (=> b!1158437 m!1068149))

(assert (=> b!1158437 m!1068123))

(declare-fun m!1068151 () Bool)

(assert (=> b!1158437 m!1068151))

(declare-fun m!1068153 () Bool)

(assert (=> b!1158437 m!1068153))

(assert (=> b!1158437 m!1068123))

(assert (=> b!1158437 m!1068145))

(assert (=> b!1158437 m!1068141))

(declare-fun m!1068155 () Bool)

(assert (=> bm!55376 m!1068155))

(check-sat (not b!1158456) (not start!99112) (not b!1158452) (not bm!55383) (not bm!55376) (not b!1158434) (not b!1158446) (not b!1158442) (not b!1158429) (not b!1158439) (not b!1158437) (not b!1158430) (not b!1158448) (not mapNonEmpty!45341) (not bm!55381) (not b!1158449) (not bm!55379) (not b_next!24481) (not b!1158441) (not b_lambda!19581) b_and!39815 (not b!1158438) (not b!1158454) (not b!1158427) (not b!1158447) tp_is_empty!29011 (not bm!55377))
(check-sat b_and!39815 (not b_next!24481))
