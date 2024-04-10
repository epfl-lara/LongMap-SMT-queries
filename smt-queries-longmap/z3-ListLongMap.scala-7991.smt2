; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98788 () Bool)

(assert start!98788)

(declare-fun b_free!24393 () Bool)

(declare-fun b_next!24393 () Bool)

(assert (=> start!98788 (= b_free!24393 (not b_next!24393))))

(declare-fun tp!85889 () Bool)

(declare-fun b_and!39635 () Bool)

(assert (=> start!98788 (= tp!85889 b_and!39635)))

(declare-fun b!1153090 () Bool)

(declare-datatypes ((V!43691 0))(
  ( (V!43692 (val!14518 Int)) )
))
(declare-datatypes ((tuple2!18444 0))(
  ( (tuple2!18445 (_1!9233 (_ BitVec 64)) (_2!9233 V!43691)) )
))
(declare-datatypes ((List!25191 0))(
  ( (Nil!25188) (Cons!25187 (h!26396 tuple2!18444) (t!36576 List!25191)) )
))
(declare-datatypes ((ListLongMap!16413 0))(
  ( (ListLongMap!16414 (toList!8222 List!25191)) )
))
(declare-fun call!54261 () ListLongMap!16413)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6739 (ListLongMap!16413 (_ BitVec 64)) Bool)

(assert (=> b!1153090 (contains!6739 call!54261 k0!934)))

(declare-datatypes ((Unit!37949 0))(
  ( (Unit!37950) )
))
(declare-fun lt!516706 () Unit!37949)

(declare-fun minValue!944 () V!43691)

(declare-fun lt!516716 () ListLongMap!16413)

(declare-fun addStillContains!884 (ListLongMap!16413 (_ BitVec 64) V!43691 (_ BitVec 64)) Unit!37949)

(assert (=> b!1153090 (= lt!516706 (addStillContains!884 lt!516716 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!54259 () Bool)

(assert (=> b!1153090 call!54259))

(declare-fun lt!516703 () ListLongMap!16413)

(declare-fun zeroValue!944 () V!43691)

(declare-fun +!3638 (ListLongMap!16413 tuple2!18444) ListLongMap!16413)

(assert (=> b!1153090 (= lt!516716 (+!3638 lt!516703 (tuple2!18445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516723 () Unit!37949)

(declare-fun call!54260 () Unit!37949)

(assert (=> b!1153090 (= lt!516723 call!54260)))

(declare-fun e!655817 () Unit!37949)

(assert (=> b!1153090 (= e!655817 lt!516706)))

(declare-fun b!1153091 () Bool)

(declare-fun res!766510 () Bool)

(declare-fun e!655816 () Bool)

(assert (=> b!1153091 (=> (not res!766510) (not e!655816))))

(declare-datatypes ((array!74693 0))(
  ( (array!74694 (arr!35997 (Array (_ BitVec 32) (_ BitVec 64))) (size!36533 (_ BitVec 32))) )
))
(declare-fun lt!516720 () array!74693)

(declare-datatypes ((List!25192 0))(
  ( (Nil!25189) (Cons!25188 (h!26397 (_ BitVec 64)) (t!36577 List!25192)) )
))
(declare-fun arrayNoDuplicates!0 (array!74693 (_ BitVec 32) List!25192) Bool)

(assert (=> b!1153091 (= res!766510 (arrayNoDuplicates!0 lt!516720 #b00000000000000000000000000000000 Nil!25189))))

(declare-fun mapNonEmpty!45209 () Bool)

(declare-fun mapRes!45209 () Bool)

(declare-fun tp!85890 () Bool)

(declare-fun e!655805 () Bool)

(assert (=> mapNonEmpty!45209 (= mapRes!45209 (and tp!85890 e!655805))))

(declare-fun mapKey!45209 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13752 0))(
  ( (ValueCellFull!13752 (v!17155 V!43691)) (EmptyCell!13752) )
))
(declare-fun mapRest!45209 () (Array (_ BitVec 32) ValueCell!13752))

(declare-fun mapValue!45209 () ValueCell!13752)

(declare-datatypes ((array!74695 0))(
  ( (array!74696 (arr!35998 (Array (_ BitVec 32) ValueCell!13752)) (size!36534 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74695)

(assert (=> mapNonEmpty!45209 (= (arr!35998 _values!996) (store mapRest!45209 mapKey!45209 mapValue!45209))))

(declare-fun b!1153092 () Bool)

(declare-fun e!655818 () Unit!37949)

(declare-fun lt!516717 () Unit!37949)

(assert (=> b!1153092 (= e!655818 lt!516717)))

(declare-fun call!54265 () Unit!37949)

(assert (=> b!1153092 (= lt!516717 call!54265)))

(declare-fun call!54264 () Bool)

(assert (=> b!1153092 call!54264))

(declare-fun b!1153093 () Bool)

(declare-fun e!655807 () Bool)

(assert (=> b!1153093 (= e!655807 true)))

(declare-fun e!655813 () Bool)

(assert (=> b!1153093 e!655813))

(declare-fun res!766514 () Bool)

(assert (=> b!1153093 (=> (not res!766514) (not e!655813))))

(declare-fun lt!516707 () ListLongMap!16413)

(assert (=> b!1153093 (= res!766514 (= lt!516707 lt!516703))))

(declare-fun lt!516714 () ListLongMap!16413)

(declare-fun -!1348 (ListLongMap!16413 (_ BitVec 64)) ListLongMap!16413)

(assert (=> b!1153093 (= lt!516707 (-!1348 lt!516714 k0!934))))

(declare-fun lt!516705 () V!43691)

(declare-fun _keys!1208 () array!74693)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1153093 (= (-!1348 (+!3638 lt!516703 (tuple2!18445 (select (arr!35997 _keys!1208) from!1455) lt!516705)) (select (arr!35997 _keys!1208) from!1455)) lt!516703)))

(declare-fun lt!516718 () Unit!37949)

(declare-fun addThenRemoveForNewKeyIsSame!189 (ListLongMap!16413 (_ BitVec 64) V!43691) Unit!37949)

(assert (=> b!1153093 (= lt!516718 (addThenRemoveForNewKeyIsSame!189 lt!516703 (select (arr!35997 _keys!1208) from!1455) lt!516705))))

(declare-fun lt!516721 () V!43691)

(declare-fun get!18333 (ValueCell!13752 V!43691) V!43691)

(assert (=> b!1153093 (= lt!516705 (get!18333 (select (arr!35998 _values!996) from!1455) lt!516721))))

(declare-fun lt!516715 () Unit!37949)

(declare-fun e!655810 () Unit!37949)

(assert (=> b!1153093 (= lt!516715 e!655810)))

(declare-fun c!114398 () Bool)

(assert (=> b!1153093 (= c!114398 (contains!6739 lt!516703 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4692 (array!74693 array!74695 (_ BitVec 32) (_ BitVec 32) V!43691 V!43691 (_ BitVec 32) Int) ListLongMap!16413)

(assert (=> b!1153093 (= lt!516703 (getCurrentListMapNoExtraKeys!4692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54255 () Bool)

(declare-fun call!54258 () ListLongMap!16413)

(declare-fun lt!516722 () array!74695)

(assert (=> bm!54255 (= call!54258 (getCurrentListMapNoExtraKeys!4692 lt!516720 lt!516722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153094 () Bool)

(declare-fun e!655808 () Bool)

(declare-fun arrayContainsKey!0 (array!74693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153094 (= e!655808 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!655821 () Bool)

(declare-fun lt!516704 () Bool)

(declare-fun b!1153095 () Bool)

(assert (=> b!1153095 (= e!655821 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516704) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1153096 () Bool)

(declare-fun c!114397 () Bool)

(assert (=> b!1153096 (= c!114397 (and (not lt!516704) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153096 (= e!655817 e!655818)))

(declare-fun bm!54256 () Bool)

(declare-fun c!114396 () Bool)

(assert (=> bm!54256 (= call!54260 (addStillContains!884 lt!516703 (ite (or c!114396 c!114397) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114396 c!114397) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1153097 () Bool)

(declare-fun res!766519 () Bool)

(declare-fun e!655820 () Bool)

(assert (=> b!1153097 (=> (not res!766519) (not e!655820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153097 (= res!766519 (validMask!0 mask!1564))))

(declare-fun b!1153098 () Bool)

(declare-fun e!655809 () Bool)

(declare-fun e!655812 () Bool)

(assert (=> b!1153098 (= e!655809 e!655812)))

(declare-fun res!766522 () Bool)

(assert (=> b!1153098 (=> res!766522 e!655812)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153098 (= res!766522 (not (= from!1455 i!673)))))

(declare-fun lt!516711 () ListLongMap!16413)

(assert (=> b!1153098 (= lt!516711 (getCurrentListMapNoExtraKeys!4692 lt!516720 lt!516722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153098 (= lt!516722 (array!74696 (store (arr!35998 _values!996) i!673 (ValueCellFull!13752 lt!516721)) (size!36534 _values!996)))))

(declare-fun dynLambda!2711 (Int (_ BitVec 64)) V!43691)

(assert (=> b!1153098 (= lt!516721 (dynLambda!2711 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153098 (= lt!516714 (getCurrentListMapNoExtraKeys!4692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!766523 () Bool)

(assert (=> start!98788 (=> (not res!766523) (not e!655820))))

(assert (=> start!98788 (= res!766523 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36533 _keys!1208))))))

(assert (=> start!98788 e!655820))

(declare-fun tp_is_empty!28923 () Bool)

(assert (=> start!98788 tp_is_empty!28923))

(declare-fun array_inv!27562 (array!74693) Bool)

(assert (=> start!98788 (array_inv!27562 _keys!1208)))

(assert (=> start!98788 true))

(assert (=> start!98788 tp!85889))

(declare-fun e!655811 () Bool)

(declare-fun array_inv!27563 (array!74695) Bool)

(assert (=> start!98788 (and (array_inv!27563 _values!996) e!655811)))

(declare-fun b!1153099 () Bool)

(declare-fun res!766516 () Bool)

(assert (=> b!1153099 (=> (not res!766516) (not e!655820))))

(assert (=> b!1153099 (= res!766516 (and (= (size!36534 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36533 _keys!1208) (size!36534 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153100 () Bool)

(declare-fun Unit!37951 () Unit!37949)

(assert (=> b!1153100 (= e!655810 Unit!37951)))

(assert (=> b!1153100 (= lt!516704 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153100 (= c!114396 (and (not lt!516704) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516702 () Unit!37949)

(assert (=> b!1153100 (= lt!516702 e!655817)))

(declare-fun lt!516709 () Unit!37949)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!478 (array!74693 array!74695 (_ BitVec 32) (_ BitVec 32) V!43691 V!43691 (_ BitVec 64) (_ BitVec 32) Int) Unit!37949)

(assert (=> b!1153100 (= lt!516709 (lemmaListMapContainsThenArrayContainsFrom!478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114400 () Bool)

(assert (=> b!1153100 (= c!114400 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766511 () Bool)

(assert (=> b!1153100 (= res!766511 e!655821)))

(assert (=> b!1153100 (=> (not res!766511) (not e!655808))))

(assert (=> b!1153100 e!655808))

(declare-fun lt!516712 () Unit!37949)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74693 (_ BitVec 32) (_ BitVec 32)) Unit!37949)

(assert (=> b!1153100 (= lt!516712 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153100 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25189)))

(declare-fun lt!516708 () Unit!37949)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74693 (_ BitVec 64) (_ BitVec 32) List!25192) Unit!37949)

(assert (=> b!1153100 (= lt!516708 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25189))))

(assert (=> b!1153100 false))

(declare-fun bm!54257 () Bool)

(assert (=> bm!54257 (= call!54261 (+!3638 (ite c!114396 lt!516716 lt!516703) (ite c!114396 (tuple2!18445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114397 (tuple2!18445 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153101 () Bool)

(declare-fun e!655815 () Bool)

(declare-fun call!54263 () ListLongMap!16413)

(assert (=> b!1153101 (= e!655815 (= call!54258 (-!1348 call!54263 k0!934)))))

(declare-fun b!1153102 () Bool)

(assert (=> b!1153102 (= e!655815 (= call!54258 call!54263))))

(declare-fun b!1153103 () Bool)

(declare-fun res!766515 () Bool)

(assert (=> b!1153103 (=> (not res!766515) (not e!655820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74693 (_ BitVec 32)) Bool)

(assert (=> b!1153103 (= res!766515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153104 () Bool)

(declare-fun Unit!37952 () Unit!37949)

(assert (=> b!1153104 (= e!655810 Unit!37952)))

(declare-fun b!1153105 () Bool)

(declare-fun e!655819 () Bool)

(assert (=> b!1153105 (= e!655811 (and e!655819 mapRes!45209))))

(declare-fun condMapEmpty!45209 () Bool)

(declare-fun mapDefault!45209 () ValueCell!13752)

(assert (=> b!1153105 (= condMapEmpty!45209 (= (arr!35998 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13752)) mapDefault!45209)))))

(declare-fun b!1153106 () Bool)

(assert (=> b!1153106 (= e!655805 tp_is_empty!28923)))

(declare-fun b!1153107 () Bool)

(declare-fun res!766520 () Bool)

(assert (=> b!1153107 (=> (not res!766520) (not e!655820))))

(assert (=> b!1153107 (= res!766520 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25189))))

(declare-fun bm!54258 () Bool)

(assert (=> bm!54258 (= call!54265 call!54260)))

(declare-fun b!1153108 () Bool)

(declare-fun res!766518 () Bool)

(assert (=> b!1153108 (=> (not res!766518) (not e!655820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153108 (= res!766518 (validKeyInArray!0 k0!934))))

(declare-fun call!54262 () ListLongMap!16413)

(declare-fun bm!54259 () Bool)

(assert (=> bm!54259 (= call!54259 (contains!6739 (ite c!114396 lt!516716 call!54262) k0!934))))

(declare-fun b!1153109 () Bool)

(declare-fun res!766513 () Bool)

(assert (=> b!1153109 (=> (not res!766513) (not e!655820))))

(assert (=> b!1153109 (= res!766513 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36533 _keys!1208))))))

(declare-fun b!1153110 () Bool)

(declare-fun res!766512 () Bool)

(assert (=> b!1153110 (=> (not res!766512) (not e!655820))))

(assert (=> b!1153110 (= res!766512 (= (select (arr!35997 _keys!1208) i!673) k0!934))))

(declare-fun b!1153111 () Bool)

(assert (=> b!1153111 (= e!655819 tp_is_empty!28923)))

(declare-fun b!1153112 () Bool)

(assert (=> b!1153112 call!54264))

(declare-fun lt!516710 () Unit!37949)

(assert (=> b!1153112 (= lt!516710 call!54265)))

(declare-fun e!655814 () Unit!37949)

(assert (=> b!1153112 (= e!655814 lt!516710)))

(declare-fun bm!54260 () Bool)

(assert (=> bm!54260 (= call!54263 (getCurrentListMapNoExtraKeys!4692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153113 () Bool)

(assert (=> b!1153113 (= e!655816 (not e!655809))))

(declare-fun res!766517 () Bool)

(assert (=> b!1153113 (=> res!766517 e!655809)))

(assert (=> b!1153113 (= res!766517 (bvsgt from!1455 i!673))))

(assert (=> b!1153113 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516719 () Unit!37949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74693 (_ BitVec 64) (_ BitVec 32)) Unit!37949)

(assert (=> b!1153113 (= lt!516719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153114 () Bool)

(declare-fun Unit!37953 () Unit!37949)

(assert (=> b!1153114 (= e!655814 Unit!37953)))

(declare-fun b!1153115 () Bool)

(assert (=> b!1153115 (= e!655821 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153116 () Bool)

(assert (=> b!1153116 (= e!655812 e!655807)))

(declare-fun res!766509 () Bool)

(assert (=> b!1153116 (=> res!766509 e!655807)))

(assert (=> b!1153116 (= res!766509 (not (= (select (arr!35997 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153116 e!655815))

(declare-fun c!114399 () Bool)

(assert (=> b!1153116 (= c!114399 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516713 () Unit!37949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 (array!74693 array!74695 (_ BitVec 32) (_ BitVec 32) V!43691 V!43691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37949)

(assert (=> b!1153116 (= lt!516713 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45209 () Bool)

(assert (=> mapIsEmpty!45209 mapRes!45209))

(declare-fun bm!54261 () Bool)

(assert (=> bm!54261 (= call!54262 call!54261)))

(declare-fun b!1153117 () Bool)

(assert (=> b!1153117 (= e!655818 e!655814)))

(declare-fun c!114395 () Bool)

(assert (=> b!1153117 (= c!114395 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516704))))

(declare-fun bm!54262 () Bool)

(assert (=> bm!54262 (= call!54264 call!54259)))

(declare-fun b!1153118 () Bool)

(assert (=> b!1153118 (= e!655820 e!655816)))

(declare-fun res!766521 () Bool)

(assert (=> b!1153118 (=> (not res!766521) (not e!655816))))

(assert (=> b!1153118 (= res!766521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516720 mask!1564))))

(assert (=> b!1153118 (= lt!516720 (array!74694 (store (arr!35997 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36533 _keys!1208)))))

(declare-fun b!1153119 () Bool)

(assert (=> b!1153119 (= e!655813 (= lt!516707 (getCurrentListMapNoExtraKeys!4692 lt!516720 lt!516722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!98788 res!766523) b!1153097))

(assert (= (and b!1153097 res!766519) b!1153099))

(assert (= (and b!1153099 res!766516) b!1153103))

(assert (= (and b!1153103 res!766515) b!1153107))

(assert (= (and b!1153107 res!766520) b!1153109))

(assert (= (and b!1153109 res!766513) b!1153108))

(assert (= (and b!1153108 res!766518) b!1153110))

(assert (= (and b!1153110 res!766512) b!1153118))

(assert (= (and b!1153118 res!766521) b!1153091))

(assert (= (and b!1153091 res!766510) b!1153113))

(assert (= (and b!1153113 (not res!766517)) b!1153098))

(assert (= (and b!1153098 (not res!766522)) b!1153116))

(assert (= (and b!1153116 c!114399) b!1153101))

(assert (= (and b!1153116 (not c!114399)) b!1153102))

(assert (= (or b!1153101 b!1153102) bm!54255))

(assert (= (or b!1153101 b!1153102) bm!54260))

(assert (= (and b!1153116 (not res!766509)) b!1153093))

(assert (= (and b!1153093 c!114398) b!1153100))

(assert (= (and b!1153093 (not c!114398)) b!1153104))

(assert (= (and b!1153100 c!114396) b!1153090))

(assert (= (and b!1153100 (not c!114396)) b!1153096))

(assert (= (and b!1153096 c!114397) b!1153092))

(assert (= (and b!1153096 (not c!114397)) b!1153117))

(assert (= (and b!1153117 c!114395) b!1153112))

(assert (= (and b!1153117 (not c!114395)) b!1153114))

(assert (= (or b!1153092 b!1153112) bm!54258))

(assert (= (or b!1153092 b!1153112) bm!54261))

(assert (= (or b!1153092 b!1153112) bm!54262))

(assert (= (or b!1153090 bm!54262) bm!54259))

(assert (= (or b!1153090 bm!54258) bm!54256))

(assert (= (or b!1153090 bm!54261) bm!54257))

(assert (= (and b!1153100 c!114400) b!1153115))

(assert (= (and b!1153100 (not c!114400)) b!1153095))

(assert (= (and b!1153100 res!766511) b!1153094))

(assert (= (and b!1153093 res!766514) b!1153119))

(assert (= (and b!1153105 condMapEmpty!45209) mapIsEmpty!45209))

(assert (= (and b!1153105 (not condMapEmpty!45209)) mapNonEmpty!45209))

(get-info :version)

(assert (= (and mapNonEmpty!45209 ((_ is ValueCellFull!13752) mapValue!45209)) b!1153106))

(assert (= (and b!1153105 ((_ is ValueCellFull!13752) mapDefault!45209)) b!1153111))

(assert (= start!98788 b!1153105))

(declare-fun b_lambda!19499 () Bool)

(assert (=> (not b_lambda!19499) (not b!1153098)))

(declare-fun t!36575 () Bool)

(declare-fun tb!9205 () Bool)

(assert (=> (and start!98788 (= defaultEntry!1004 defaultEntry!1004) t!36575) tb!9205))

(declare-fun result!18975 () Bool)

(assert (=> tb!9205 (= result!18975 tp_is_empty!28923)))

(assert (=> b!1153098 t!36575))

(declare-fun b_and!39637 () Bool)

(assert (= b_and!39635 (and (=> t!36575 result!18975) b_and!39637)))

(declare-fun m!1062985 () Bool)

(assert (=> bm!54257 m!1062985))

(declare-fun m!1062987 () Bool)

(assert (=> b!1153115 m!1062987))

(declare-fun m!1062989 () Bool)

(assert (=> b!1153098 m!1062989))

(declare-fun m!1062991 () Bool)

(assert (=> b!1153098 m!1062991))

(declare-fun m!1062993 () Bool)

(assert (=> b!1153098 m!1062993))

(declare-fun m!1062995 () Bool)

(assert (=> b!1153098 m!1062995))

(declare-fun m!1062997 () Bool)

(assert (=> bm!54255 m!1062997))

(declare-fun m!1062999 () Bool)

(assert (=> b!1153101 m!1062999))

(assert (=> b!1153094 m!1062987))

(declare-fun m!1063001 () Bool)

(assert (=> b!1153116 m!1063001))

(declare-fun m!1063003 () Bool)

(assert (=> b!1153116 m!1063003))

(declare-fun m!1063005 () Bool)

(assert (=> b!1153090 m!1063005))

(declare-fun m!1063007 () Bool)

(assert (=> b!1153090 m!1063007))

(declare-fun m!1063009 () Bool)

(assert (=> b!1153090 m!1063009))

(declare-fun m!1063011 () Bool)

(assert (=> b!1153091 m!1063011))

(declare-fun m!1063013 () Bool)

(assert (=> bm!54259 m!1063013))

(declare-fun m!1063015 () Bool)

(assert (=> b!1153107 m!1063015))

(declare-fun m!1063017 () Bool)

(assert (=> b!1153113 m!1063017))

(declare-fun m!1063019 () Bool)

(assert (=> b!1153113 m!1063019))

(declare-fun m!1063021 () Bool)

(assert (=> b!1153100 m!1063021))

(declare-fun m!1063023 () Bool)

(assert (=> b!1153100 m!1063023))

(declare-fun m!1063025 () Bool)

(assert (=> b!1153100 m!1063025))

(declare-fun m!1063027 () Bool)

(assert (=> b!1153100 m!1063027))

(declare-fun m!1063029 () Bool)

(assert (=> bm!54256 m!1063029))

(declare-fun m!1063031 () Bool)

(assert (=> bm!54260 m!1063031))

(assert (=> b!1153119 m!1062997))

(declare-fun m!1063033 () Bool)

(assert (=> start!98788 m!1063033))

(declare-fun m!1063035 () Bool)

(assert (=> start!98788 m!1063035))

(declare-fun m!1063037 () Bool)

(assert (=> b!1153118 m!1063037))

(declare-fun m!1063039 () Bool)

(assert (=> b!1153118 m!1063039))

(declare-fun m!1063041 () Bool)

(assert (=> b!1153108 m!1063041))

(declare-fun m!1063043 () Bool)

(assert (=> b!1153097 m!1063043))

(declare-fun m!1063045 () Bool)

(assert (=> b!1153110 m!1063045))

(assert (=> b!1153093 m!1063031))

(declare-fun m!1063047 () Bool)

(assert (=> b!1153093 m!1063047))

(declare-fun m!1063049 () Bool)

(assert (=> b!1153093 m!1063049))

(assert (=> b!1153093 m!1063001))

(declare-fun m!1063051 () Bool)

(assert (=> b!1153093 m!1063051))

(assert (=> b!1153093 m!1063049))

(declare-fun m!1063053 () Bool)

(assert (=> b!1153093 m!1063053))

(assert (=> b!1153093 m!1063001))

(declare-fun m!1063055 () Bool)

(assert (=> b!1153093 m!1063055))

(assert (=> b!1153093 m!1063047))

(declare-fun m!1063057 () Bool)

(assert (=> b!1153093 m!1063057))

(declare-fun m!1063059 () Bool)

(assert (=> b!1153093 m!1063059))

(assert (=> b!1153093 m!1063001))

(declare-fun m!1063061 () Bool)

(assert (=> b!1153103 m!1063061))

(declare-fun m!1063063 () Bool)

(assert (=> mapNonEmpty!45209 m!1063063))

(check-sat (not b_next!24393) (not b!1153119) b_and!39637 (not b!1153094) (not bm!54259) (not bm!54255) (not b!1153103) (not b!1153108) tp_is_empty!28923 (not bm!54260) (not b_lambda!19499) (not b!1153098) (not b!1153101) (not b!1153097) (not bm!54256) (not b!1153107) (not b!1153091) (not b!1153116) (not b!1153090) (not mapNonEmpty!45209) (not b!1153118) (not b!1153100) (not b!1153113) (not b!1153115) (not b!1153093) (not bm!54257) (not start!98788))
(check-sat b_and!39637 (not b_next!24393))
