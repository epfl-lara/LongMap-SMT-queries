; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98896 () Bool)

(assert start!98896)

(declare-fun b_free!24501 () Bool)

(declare-fun b_next!24501 () Bool)

(assert (=> start!98896 (= b_free!24501 (not b_next!24501))))

(declare-fun tp!86213 () Bool)

(declare-fun b_and!39851 () Bool)

(assert (=> start!98896 (= tp!86213 b_and!39851)))

(declare-fun b!1158058 () Bool)

(declare-fun res!768952 () Bool)

(declare-fun e!658574 () Bool)

(assert (=> b!1158058 (=> (not res!768952) (not e!658574))))

(declare-datatypes ((array!74905 0))(
  ( (array!74906 (arr!36103 (Array (_ BitVec 32) (_ BitVec 64))) (size!36639 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74905)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1158058 (= res!768952 (= (select (arr!36103 _keys!1208) i!673) k0!934))))

(declare-fun b!1158059 () Bool)

(declare-fun e!658564 () Bool)

(declare-fun tp_is_empty!29031 () Bool)

(assert (=> b!1158059 (= e!658564 tp_is_empty!29031)))

(declare-fun res!768950 () Bool)

(assert (=> start!98896 (=> (not res!768950) (not e!658574))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98896 (= res!768950 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36639 _keys!1208))))))

(assert (=> start!98896 e!658574))

(assert (=> start!98896 tp_is_empty!29031))

(declare-fun array_inv!27628 (array!74905) Bool)

(assert (=> start!98896 (array_inv!27628 _keys!1208)))

(assert (=> start!98896 true))

(assert (=> start!98896 tp!86213))

(declare-datatypes ((V!43835 0))(
  ( (V!43836 (val!14572 Int)) )
))
(declare-datatypes ((ValueCell!13806 0))(
  ( (ValueCellFull!13806 (v!17209 V!43835)) (EmptyCell!13806) )
))
(declare-datatypes ((array!74907 0))(
  ( (array!74908 (arr!36104 (Array (_ BitVec 32) ValueCell!13806)) (size!36640 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74907)

(declare-fun e!658562 () Bool)

(declare-fun array_inv!27629 (array!74907) Bool)

(assert (=> start!98896 (and (array_inv!27629 _values!996) e!658562)))

(declare-fun call!55557 () Bool)

(declare-datatypes ((tuple2!18546 0))(
  ( (tuple2!18547 (_1!9284 (_ BitVec 64)) (_2!9284 V!43835)) )
))
(declare-datatypes ((List!25286 0))(
  ( (Nil!25283) (Cons!25282 (h!26491 tuple2!18546) (t!36779 List!25286)) )
))
(declare-datatypes ((ListLongMap!16515 0))(
  ( (ListLongMap!16516 (toList!8273 List!25286)) )
))
(declare-fun lt!520275 () ListLongMap!16515)

(declare-fun call!55559 () ListLongMap!16515)

(declare-fun bm!55551 () Bool)

(declare-fun c!115369 () Bool)

(declare-fun contains!6784 (ListLongMap!16515 (_ BitVec 64)) Bool)

(assert (=> bm!55551 (= call!55557 (contains!6784 (ite c!115369 lt!520275 call!55559) k0!934))))

(declare-fun zeroValue!944 () V!43835)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!55552 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!520281 () array!74907)

(declare-fun call!55560 () ListLongMap!16515)

(declare-fun minValue!944 () V!43835)

(declare-fun lt!520273 () array!74905)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4739 (array!74905 array!74907 (_ BitVec 32) (_ BitVec 32) V!43835 V!43835 (_ BitVec 32) Int) ListLongMap!16515)

(assert (=> bm!55552 (= call!55560 (getCurrentListMapNoExtraKeys!4739 lt!520273 lt!520281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55553 () Bool)

(declare-datatypes ((Unit!38157 0))(
  ( (Unit!38158) )
))
(declare-fun call!55555 () Unit!38157)

(declare-fun call!55561 () Unit!38157)

(assert (=> bm!55553 (= call!55555 call!55561)))

(declare-fun b!1158060 () Bool)

(declare-fun res!768944 () Bool)

(assert (=> b!1158060 (=> (not res!768944) (not e!658574))))

(assert (=> b!1158060 (= res!768944 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36639 _keys!1208))))))

(declare-fun b!1158061 () Bool)

(declare-fun e!658573 () Bool)

(declare-fun call!55556 () ListLongMap!16515)

(assert (=> b!1158061 (= e!658573 (= call!55560 call!55556))))

(declare-fun b!1158062 () Bool)

(declare-fun +!3683 (ListLongMap!16515 tuple2!18546) ListLongMap!16515)

(assert (=> b!1158062 (contains!6784 (+!3683 lt!520275 (tuple2!18547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!520269 () Unit!38157)

(declare-fun addStillContains!925 (ListLongMap!16515 (_ BitVec 64) V!43835 (_ BitVec 64)) Unit!38157)

(assert (=> b!1158062 (= lt!520269 (addStillContains!925 lt!520275 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1158062 call!55557))

(declare-fun call!55554 () ListLongMap!16515)

(assert (=> b!1158062 (= lt!520275 call!55554)))

(declare-fun lt!520277 () Unit!38157)

(assert (=> b!1158062 (= lt!520277 call!55561)))

(declare-fun e!658570 () Unit!38157)

(assert (=> b!1158062 (= e!658570 lt!520269)))

(declare-fun b!1158063 () Bool)

(declare-fun res!768949 () Bool)

(declare-fun e!658565 () Bool)

(assert (=> b!1158063 (=> (not res!768949) (not e!658565))))

(declare-datatypes ((List!25287 0))(
  ( (Nil!25284) (Cons!25283 (h!26492 (_ BitVec 64)) (t!36780 List!25287)) )
))
(declare-fun arrayNoDuplicates!0 (array!74905 (_ BitVec 32) List!25287) Bool)

(assert (=> b!1158063 (= res!768949 (arrayNoDuplicates!0 lt!520273 #b00000000000000000000000000000000 Nil!25284))))

(declare-fun b!1158064 () Bool)

(declare-fun call!55558 () Bool)

(assert (=> b!1158064 call!55558))

(declare-fun lt!520266 () Unit!38157)

(assert (=> b!1158064 (= lt!520266 call!55555)))

(declare-fun e!658575 () Unit!38157)

(assert (=> b!1158064 (= e!658575 lt!520266)))

(declare-fun b!1158065 () Bool)

(declare-fun e!658567 () Bool)

(assert (=> b!1158065 (= e!658567 tp_is_empty!29031)))

(declare-fun b!1158066 () Bool)

(declare-fun -!1387 (ListLongMap!16515 (_ BitVec 64)) ListLongMap!16515)

(assert (=> b!1158066 (= e!658573 (= call!55560 (-!1387 call!55556 k0!934)))))

(declare-fun b!1158067 () Bool)

(declare-fun Unit!38159 () Unit!38157)

(assert (=> b!1158067 (= e!658575 Unit!38159)))

(declare-fun b!1158068 () Bool)

(declare-fun res!768951 () Bool)

(assert (=> b!1158068 (=> (not res!768951) (not e!658574))))

(assert (=> b!1158068 (= res!768951 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25284))))

(declare-fun b!1158069 () Bool)

(declare-fun e!658559 () Unit!38157)

(declare-fun Unit!38160 () Unit!38157)

(assert (=> b!1158069 (= e!658559 Unit!38160)))

(declare-fun bm!55554 () Bool)

(assert (=> bm!55554 (= call!55559 call!55554)))

(declare-fun b!1158070 () Bool)

(declare-fun e!658571 () Unit!38157)

(declare-fun lt!520283 () Unit!38157)

(assert (=> b!1158070 (= e!658571 lt!520283)))

(assert (=> b!1158070 (= lt!520283 call!55555)))

(assert (=> b!1158070 call!55558))

(declare-fun b!1158071 () Bool)

(assert (=> b!1158071 (= e!658574 e!658565)))

(declare-fun res!768953 () Bool)

(assert (=> b!1158071 (=> (not res!768953) (not e!658565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74905 (_ BitVec 32)) Bool)

(assert (=> b!1158071 (= res!768953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520273 mask!1564))))

(assert (=> b!1158071 (= lt!520273 (array!74906 (store (arr!36103 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36639 _keys!1208)))))

(declare-fun mapIsEmpty!45371 () Bool)

(declare-fun mapRes!45371 () Bool)

(assert (=> mapIsEmpty!45371 mapRes!45371))

(declare-fun e!658560 () Bool)

(declare-fun b!1158072 () Bool)

(declare-fun arrayContainsKey!0 (array!74905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158072 (= e!658560 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158073 () Bool)

(declare-fun Unit!38161 () Unit!38157)

(assert (=> b!1158073 (= e!658559 Unit!38161)))

(declare-fun lt!520285 () Bool)

(assert (=> b!1158073 (= lt!520285 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158073 (= c!115369 (and (not lt!520285) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520272 () Unit!38157)

(assert (=> b!1158073 (= lt!520272 e!658570)))

(declare-fun lt!520286 () Unit!38157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!511 (array!74905 array!74907 (_ BitVec 32) (_ BitVec 32) V!43835 V!43835 (_ BitVec 64) (_ BitVec 32) Int) Unit!38157)

(assert (=> b!1158073 (= lt!520286 (lemmaListMapContainsThenArrayContainsFrom!511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115368 () Bool)

(assert (=> b!1158073 (= c!115368 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768948 () Bool)

(declare-fun e!658566 () Bool)

(assert (=> b!1158073 (= res!768948 e!658566)))

(assert (=> b!1158073 (=> (not res!768948) (not e!658560))))

(assert (=> b!1158073 e!658560))

(declare-fun lt!520284 () Unit!38157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74905 (_ BitVec 32) (_ BitVec 32)) Unit!38157)

(assert (=> b!1158073 (= lt!520284 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158073 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25284)))

(declare-fun lt!520278 () Unit!38157)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74905 (_ BitVec 64) (_ BitVec 32) List!25287) Unit!38157)

(assert (=> b!1158073 (= lt!520278 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25284))))

(assert (=> b!1158073 false))

(declare-fun b!1158074 () Bool)

(declare-fun e!658561 () Bool)

(declare-fun e!658572 () Bool)

(assert (=> b!1158074 (= e!658561 e!658572)))

(declare-fun res!768947 () Bool)

(assert (=> b!1158074 (=> res!768947 e!658572)))

(assert (=> b!1158074 (= res!768947 (not (= from!1455 i!673)))))

(declare-fun lt!520282 () ListLongMap!16515)

(assert (=> b!1158074 (= lt!520282 (getCurrentListMapNoExtraKeys!4739 lt!520273 lt!520281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520267 () V!43835)

(assert (=> b!1158074 (= lt!520281 (array!74908 (store (arr!36104 _values!996) i!673 (ValueCellFull!13806 lt!520267)) (size!36640 _values!996)))))

(declare-fun dynLambda!2745 (Int (_ BitVec 64)) V!43835)

(assert (=> b!1158074 (= lt!520267 (dynLambda!2745 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520268 () ListLongMap!16515)

(assert (=> b!1158074 (= lt!520268 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!115370 () Bool)

(declare-fun bm!55555 () Bool)

(declare-fun lt!520276 () ListLongMap!16515)

(assert (=> bm!55555 (= call!55561 (addStillContains!925 lt!520276 (ite (or c!115369 c!115370) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115369 c!115370) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!55556 () Bool)

(assert (=> bm!55556 (= call!55556 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158075 () Bool)

(assert (=> b!1158075 (= c!115370 (and (not lt!520285) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158075 (= e!658570 e!658571)))

(declare-fun b!1158076 () Bool)

(declare-fun res!768939 () Bool)

(assert (=> b!1158076 (=> (not res!768939) (not e!658574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158076 (= res!768939 (validMask!0 mask!1564))))

(declare-fun bm!55557 () Bool)

(assert (=> bm!55557 (= call!55558 call!55557)))

(declare-fun b!1158077 () Bool)

(declare-fun e!658569 () Bool)

(assert (=> b!1158077 (= e!658572 e!658569)))

(declare-fun res!768940 () Bool)

(assert (=> b!1158077 (=> res!768940 e!658569)))

(assert (=> b!1158077 (= res!768940 (not (= (select (arr!36103 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158077 e!658573))

(declare-fun c!115367 () Bool)

(assert (=> b!1158077 (= c!115367 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520271 () Unit!38157)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!619 (array!74905 array!74907 (_ BitVec 32) (_ BitVec 32) V!43835 V!43835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38157)

(assert (=> b!1158077 (= lt!520271 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158078 () Bool)

(assert (=> b!1158078 (= e!658565 (not e!658561))))

(declare-fun res!768941 () Bool)

(assert (=> b!1158078 (=> res!768941 e!658561)))

(assert (=> b!1158078 (= res!768941 (bvsgt from!1455 i!673))))

(assert (=> b!1158078 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520279 () Unit!38157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74905 (_ BitVec 64) (_ BitVec 32)) Unit!38157)

(assert (=> b!1158078 (= lt!520279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1158079 () Bool)

(assert (=> b!1158079 (= e!658562 (and e!658567 mapRes!45371))))

(declare-fun condMapEmpty!45371 () Bool)

(declare-fun mapDefault!45371 () ValueCell!13806)

(assert (=> b!1158079 (= condMapEmpty!45371 (= (arr!36104 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13806)) mapDefault!45371)))))

(declare-fun bm!55558 () Bool)

(assert (=> bm!55558 (= call!55554 (+!3683 lt!520276 (ite (or c!115369 c!115370) (tuple2!18547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1158080 () Bool)

(assert (=> b!1158080 (= e!658571 e!658575)))

(declare-fun c!115371 () Bool)

(assert (=> b!1158080 (= c!115371 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520285))))

(declare-fun mapNonEmpty!45371 () Bool)

(declare-fun tp!86214 () Bool)

(assert (=> mapNonEmpty!45371 (= mapRes!45371 (and tp!86214 e!658564))))

(declare-fun mapValue!45371 () ValueCell!13806)

(declare-fun mapRest!45371 () (Array (_ BitVec 32) ValueCell!13806))

(declare-fun mapKey!45371 () (_ BitVec 32))

(assert (=> mapNonEmpty!45371 (= (arr!36104 _values!996) (store mapRest!45371 mapKey!45371 mapValue!45371))))

(declare-fun b!1158081 () Bool)

(declare-fun res!768942 () Bool)

(assert (=> b!1158081 (=> (not res!768942) (not e!658574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158081 (= res!768942 (validKeyInArray!0 k0!934))))

(declare-fun b!1158082 () Bool)

(assert (=> b!1158082 (= e!658566 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520285) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158083 () Bool)

(assert (=> b!1158083 (= e!658566 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!658563 () Bool)

(declare-fun lt!520274 () ListLongMap!16515)

(declare-fun b!1158084 () Bool)

(assert (=> b!1158084 (= e!658563 (= lt!520274 (getCurrentListMapNoExtraKeys!4739 lt!520273 lt!520281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158085 () Bool)

(declare-fun res!768946 () Bool)

(assert (=> b!1158085 (=> (not res!768946) (not e!658574))))

(assert (=> b!1158085 (= res!768946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158086 () Bool)

(assert (=> b!1158086 (= e!658569 true)))

(assert (=> b!1158086 e!658563))

(declare-fun res!768943 () Bool)

(assert (=> b!1158086 (=> (not res!768943) (not e!658563))))

(assert (=> b!1158086 (= res!768943 (= lt!520274 lt!520276))))

(assert (=> b!1158086 (= lt!520274 (-!1387 lt!520268 k0!934))))

(declare-fun lt!520280 () V!43835)

(assert (=> b!1158086 (= (-!1387 (+!3683 lt!520276 (tuple2!18547 (select (arr!36103 _keys!1208) from!1455) lt!520280)) (select (arr!36103 _keys!1208) from!1455)) lt!520276)))

(declare-fun lt!520287 () Unit!38157)

(declare-fun addThenRemoveForNewKeyIsSame!224 (ListLongMap!16515 (_ BitVec 64) V!43835) Unit!38157)

(assert (=> b!1158086 (= lt!520287 (addThenRemoveForNewKeyIsSame!224 lt!520276 (select (arr!36103 _keys!1208) from!1455) lt!520280))))

(declare-fun get!18404 (ValueCell!13806 V!43835) V!43835)

(assert (=> b!1158086 (= lt!520280 (get!18404 (select (arr!36104 _values!996) from!1455) lt!520267))))

(declare-fun lt!520270 () Unit!38157)

(assert (=> b!1158086 (= lt!520270 e!658559)))

(declare-fun c!115372 () Bool)

(assert (=> b!1158086 (= c!115372 (contains!6784 lt!520276 k0!934))))

(assert (=> b!1158086 (= lt!520276 (getCurrentListMapNoExtraKeys!4739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158087 () Bool)

(declare-fun res!768945 () Bool)

(assert (=> b!1158087 (=> (not res!768945) (not e!658574))))

(assert (=> b!1158087 (= res!768945 (and (= (size!36640 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36639 _keys!1208) (size!36640 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98896 res!768950) b!1158076))

(assert (= (and b!1158076 res!768939) b!1158087))

(assert (= (and b!1158087 res!768945) b!1158085))

(assert (= (and b!1158085 res!768946) b!1158068))

(assert (= (and b!1158068 res!768951) b!1158060))

(assert (= (and b!1158060 res!768944) b!1158081))

(assert (= (and b!1158081 res!768942) b!1158058))

(assert (= (and b!1158058 res!768952) b!1158071))

(assert (= (and b!1158071 res!768953) b!1158063))

(assert (= (and b!1158063 res!768949) b!1158078))

(assert (= (and b!1158078 (not res!768941)) b!1158074))

(assert (= (and b!1158074 (not res!768947)) b!1158077))

(assert (= (and b!1158077 c!115367) b!1158066))

(assert (= (and b!1158077 (not c!115367)) b!1158061))

(assert (= (or b!1158066 b!1158061) bm!55552))

(assert (= (or b!1158066 b!1158061) bm!55556))

(assert (= (and b!1158077 (not res!768940)) b!1158086))

(assert (= (and b!1158086 c!115372) b!1158073))

(assert (= (and b!1158086 (not c!115372)) b!1158069))

(assert (= (and b!1158073 c!115369) b!1158062))

(assert (= (and b!1158073 (not c!115369)) b!1158075))

(assert (= (and b!1158075 c!115370) b!1158070))

(assert (= (and b!1158075 (not c!115370)) b!1158080))

(assert (= (and b!1158080 c!115371) b!1158064))

(assert (= (and b!1158080 (not c!115371)) b!1158067))

(assert (= (or b!1158070 b!1158064) bm!55553))

(assert (= (or b!1158070 b!1158064) bm!55554))

(assert (= (or b!1158070 b!1158064) bm!55557))

(assert (= (or b!1158062 bm!55557) bm!55551))

(assert (= (or b!1158062 bm!55553) bm!55555))

(assert (= (or b!1158062 bm!55554) bm!55558))

(assert (= (and b!1158073 c!115368) b!1158083))

(assert (= (and b!1158073 (not c!115368)) b!1158082))

(assert (= (and b!1158073 res!768948) b!1158072))

(assert (= (and b!1158086 res!768943) b!1158084))

(assert (= (and b!1158079 condMapEmpty!45371) mapIsEmpty!45371))

(assert (= (and b!1158079 (not condMapEmpty!45371)) mapNonEmpty!45371))

(get-info :version)

(assert (= (and mapNonEmpty!45371 ((_ is ValueCellFull!13806) mapValue!45371)) b!1158059))

(assert (= (and b!1158079 ((_ is ValueCellFull!13806) mapDefault!45371)) b!1158065))

(assert (= start!98896 b!1158079))

(declare-fun b_lambda!19607 () Bool)

(assert (=> (not b_lambda!19607) (not b!1158074)))

(declare-fun t!36778 () Bool)

(declare-fun tb!9313 () Bool)

(assert (=> (and start!98896 (= defaultEntry!1004 defaultEntry!1004) t!36778) tb!9313))

(declare-fun result!19191 () Bool)

(assert (=> tb!9313 (= result!19191 tp_is_empty!29031)))

(assert (=> b!1158074 t!36778))

(declare-fun b_and!39853 () Bool)

(assert (= b_and!39851 (and (=> t!36778 result!19191) b_and!39853)))

(declare-fun m!1067309 () Bool)

(assert (=> b!1158077 m!1067309))

(declare-fun m!1067311 () Bool)

(assert (=> b!1158077 m!1067311))

(declare-fun m!1067313 () Bool)

(assert (=> b!1158083 m!1067313))

(declare-fun m!1067315 () Bool)

(assert (=> b!1158081 m!1067315))

(declare-fun m!1067317 () Bool)

(assert (=> b!1158084 m!1067317))

(declare-fun m!1067319 () Bool)

(assert (=> bm!55551 m!1067319))

(declare-fun m!1067321 () Bool)

(assert (=> b!1158086 m!1067321))

(assert (=> b!1158086 m!1067309))

(declare-fun m!1067323 () Bool)

(assert (=> b!1158086 m!1067323))

(declare-fun m!1067325 () Bool)

(assert (=> b!1158086 m!1067325))

(declare-fun m!1067327 () Bool)

(assert (=> b!1158086 m!1067327))

(declare-fun m!1067329 () Bool)

(assert (=> b!1158086 m!1067329))

(assert (=> b!1158086 m!1067327))

(assert (=> b!1158086 m!1067309))

(declare-fun m!1067331 () Bool)

(assert (=> b!1158086 m!1067331))

(assert (=> b!1158086 m!1067329))

(declare-fun m!1067333 () Bool)

(assert (=> b!1158086 m!1067333))

(assert (=> b!1158086 m!1067309))

(declare-fun m!1067335 () Bool)

(assert (=> b!1158086 m!1067335))

(declare-fun m!1067337 () Bool)

(assert (=> b!1158078 m!1067337))

(declare-fun m!1067339 () Bool)

(assert (=> b!1158078 m!1067339))

(declare-fun m!1067341 () Bool)

(assert (=> bm!55558 m!1067341))

(assert (=> b!1158072 m!1067313))

(declare-fun m!1067343 () Bool)

(assert (=> b!1158076 m!1067343))

(declare-fun m!1067345 () Bool)

(assert (=> b!1158063 m!1067345))

(declare-fun m!1067347 () Bool)

(assert (=> b!1158073 m!1067347))

(declare-fun m!1067349 () Bool)

(assert (=> b!1158073 m!1067349))

(declare-fun m!1067351 () Bool)

(assert (=> b!1158073 m!1067351))

(declare-fun m!1067353 () Bool)

(assert (=> b!1158073 m!1067353))

(declare-fun m!1067355 () Bool)

(assert (=> b!1158085 m!1067355))

(assert (=> bm!55552 m!1067317))

(declare-fun m!1067357 () Bool)

(assert (=> b!1158062 m!1067357))

(assert (=> b!1158062 m!1067357))

(declare-fun m!1067359 () Bool)

(assert (=> b!1158062 m!1067359))

(declare-fun m!1067361 () Bool)

(assert (=> b!1158062 m!1067361))

(declare-fun m!1067363 () Bool)

(assert (=> b!1158058 m!1067363))

(declare-fun m!1067365 () Bool)

(assert (=> b!1158071 m!1067365))

(declare-fun m!1067367 () Bool)

(assert (=> b!1158071 m!1067367))

(declare-fun m!1067369 () Bool)

(assert (=> b!1158068 m!1067369))

(declare-fun m!1067371 () Bool)

(assert (=> b!1158074 m!1067371))

(declare-fun m!1067373 () Bool)

(assert (=> b!1158074 m!1067373))

(declare-fun m!1067375 () Bool)

(assert (=> b!1158074 m!1067375))

(declare-fun m!1067377 () Bool)

(assert (=> b!1158074 m!1067377))

(declare-fun m!1067379 () Bool)

(assert (=> mapNonEmpty!45371 m!1067379))

(declare-fun m!1067381 () Bool)

(assert (=> start!98896 m!1067381))

(declare-fun m!1067383 () Bool)

(assert (=> start!98896 m!1067383))

(assert (=> bm!55556 m!1067321))

(declare-fun m!1067385 () Bool)

(assert (=> b!1158066 m!1067385))

(declare-fun m!1067387 () Bool)

(assert (=> bm!55555 m!1067387))

(check-sat (not b!1158076) (not b!1158063) (not b!1158068) (not b!1158077) (not b!1158084) (not b_next!24501) (not b!1158071) (not b!1158074) (not bm!55558) (not b!1158072) (not bm!55556) b_and!39853 (not b!1158066) (not b!1158085) (not mapNonEmpty!45371) (not b!1158073) (not bm!55552) (not b!1158081) (not start!98896) (not b!1158086) (not b!1158078) (not b!1158062) (not b!1158083) (not b_lambda!19607) (not bm!55551) (not bm!55555) tp_is_empty!29031)
(check-sat b_and!39853 (not b_next!24501))
