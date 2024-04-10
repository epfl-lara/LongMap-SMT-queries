; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98634 () Bool)

(assert start!98634)

(declare-fun b_free!24239 () Bool)

(declare-fun b_next!24239 () Bool)

(assert (=> start!98634 (= b_free!24239 (not b_next!24239))))

(declare-fun tp!85427 () Bool)

(declare-fun b_and!39327 () Bool)

(assert (=> start!98634 (= tp!85427 b_and!39327)))

(declare-fun e!651883 () Bool)

(declare-datatypes ((V!43485 0))(
  ( (V!43486 (val!14441 Int)) )
))
(declare-datatypes ((tuple2!18294 0))(
  ( (tuple2!18295 (_1!9158 (_ BitVec 64)) (_2!9158 V!43485)) )
))
(declare-datatypes ((List!25047 0))(
  ( (Nil!25044) (Cons!25043 (h!26252 tuple2!18294) (t!36278 List!25047)) )
))
(declare-datatypes ((ListLongMap!16263 0))(
  ( (ListLongMap!16264 (toList!8147 List!25047)) )
))
(declare-fun lt!511737 () ListLongMap!16263)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1146006 () Bool)

(declare-fun lt!511723 () ListLongMap!16263)

(declare-fun -!1286 (ListLongMap!16263 (_ BitVec 64)) ListLongMap!16263)

(assert (=> b!1146006 (= e!651883 (= (-!1286 lt!511737 k!934) lt!511723))))

(declare-fun b!1146007 () Bool)

(declare-fun e!651878 () Bool)

(declare-fun tp_is_empty!28769 () Bool)

(assert (=> b!1146007 (= e!651878 tp_is_empty!28769)))

(declare-fun bm!52407 () Bool)

(declare-fun call!52413 () Bool)

(declare-fun call!52412 () Bool)

(assert (=> bm!52407 (= call!52413 call!52412)))

(declare-fun mapNonEmpty!44978 () Bool)

(declare-fun mapRes!44978 () Bool)

(declare-fun tp!85428 () Bool)

(declare-fun e!651890 () Bool)

(assert (=> mapNonEmpty!44978 (= mapRes!44978 (and tp!85428 e!651890))))

(declare-datatypes ((ValueCell!13675 0))(
  ( (ValueCellFull!13675 (v!17078 V!43485)) (EmptyCell!13675) )
))
(declare-fun mapValue!44978 () ValueCell!13675)

(declare-fun mapRest!44978 () (Array (_ BitVec 32) ValueCell!13675))

(declare-fun mapKey!44978 () (_ BitVec 32))

(declare-datatypes ((array!74387 0))(
  ( (array!74388 (arr!35844 (Array (_ BitVec 32) ValueCell!13675)) (size!36380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74387)

(assert (=> mapNonEmpty!44978 (= (arr!35844 _values!996) (store mapRest!44978 mapKey!44978 mapValue!44978))))

(declare-fun b!1146008 () Bool)

(declare-fun call!52414 () ListLongMap!16263)

(declare-fun contains!6674 (ListLongMap!16263 (_ BitVec 64)) Bool)

(assert (=> b!1146008 (contains!6674 call!52414 k!934)))

(declare-datatypes ((Unit!37628 0))(
  ( (Unit!37629) )
))
(declare-fun lt!511739 () Unit!37628)

(declare-fun lt!511740 () ListLongMap!16263)

(declare-fun minValue!944 () V!43485)

(declare-fun addStillContains!826 (ListLongMap!16263 (_ BitVec 64) V!43485 (_ BitVec 64)) Unit!37628)

(assert (=> b!1146008 (= lt!511739 (addStillContains!826 lt!511740 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1146008 call!52412))

(declare-fun zeroValue!944 () V!43485)

(declare-fun +!3572 (ListLongMap!16263 tuple2!18294) ListLongMap!16263)

(assert (=> b!1146008 (= lt!511740 (+!3572 lt!511723 (tuple2!18295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511736 () Unit!37628)

(declare-fun call!52415 () Unit!37628)

(assert (=> b!1146008 (= lt!511736 call!52415)))

(declare-fun e!651893 () Unit!37628)

(assert (=> b!1146008 (= e!651893 lt!511739)))

(declare-fun e!651892 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!511731 () Bool)

(declare-fun b!1146009 () Bool)

(assert (=> b!1146009 (= e!651892 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511731) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!763058 () Bool)

(declare-fun e!651889 () Bool)

(assert (=> start!98634 (=> (not res!763058) (not e!651889))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74389 0))(
  ( (array!74390 (arr!35845 (Array (_ BitVec 32) (_ BitVec 64))) (size!36381 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74389)

(assert (=> start!98634 (= res!763058 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36381 _keys!1208))))))

(assert (=> start!98634 e!651889))

(assert (=> start!98634 tp_is_empty!28769))

(declare-fun array_inv!27460 (array!74389) Bool)

(assert (=> start!98634 (array_inv!27460 _keys!1208)))

(assert (=> start!98634 true))

(assert (=> start!98634 tp!85427))

(declare-fun e!651887 () Bool)

(declare-fun array_inv!27461 (array!74387) Bool)

(assert (=> start!98634 (and (array_inv!27461 _values!996) e!651887)))

(declare-fun b!1146010 () Bool)

(declare-fun arrayContainsKey!0 (array!74389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146010 (= e!651892 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52408 () Bool)

(declare-fun call!52411 () Unit!37628)

(assert (=> bm!52408 (= call!52411 call!52415)))

(declare-fun bm!52409 () Bool)

(declare-fun c!113014 () Bool)

(declare-fun call!52410 () ListLongMap!16263)

(assert (=> bm!52409 (= call!52412 (contains!6674 (ite c!113014 lt!511740 call!52410) k!934))))

(declare-fun b!1146011 () Bool)

(assert (=> b!1146011 call!52413))

(declare-fun lt!511724 () Unit!37628)

(assert (=> b!1146011 (= lt!511724 call!52411)))

(declare-fun e!651886 () Unit!37628)

(assert (=> b!1146011 (= e!651886 lt!511724)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!52410 () Bool)

(declare-fun call!52417 () ListLongMap!16263)

(declare-fun getCurrentListMapNoExtraKeys!4623 (array!74389 array!74387 (_ BitVec 32) (_ BitVec 32) V!43485 V!43485 (_ BitVec 32) Int) ListLongMap!16263)

(assert (=> bm!52410 (= call!52417 (getCurrentListMapNoExtraKeys!4623 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52411 () Bool)

(declare-fun c!113009 () Bool)

(assert (=> bm!52411 (= call!52415 (addStillContains!826 lt!511723 (ite (or c!113014 c!113009) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113014 c!113009) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1146012 () Bool)

(declare-fun e!651882 () Bool)

(declare-fun e!651884 () Bool)

(assert (=> b!1146012 (= e!651882 (not e!651884))))

(declare-fun res!763057 () Bool)

(assert (=> b!1146012 (=> res!763057 e!651884)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146012 (= res!763057 (bvsgt from!1455 i!673))))

(assert (=> b!1146012 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!511732 () Unit!37628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74389 (_ BitVec 64) (_ BitVec 32)) Unit!37628)

(assert (=> b!1146012 (= lt!511732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!52412 () Bool)

(assert (=> bm!52412 (= call!52410 call!52414)))

(declare-fun b!1146013 () Bool)

(assert (=> b!1146013 (= e!651890 tp_is_empty!28769)))

(declare-fun b!1146014 () Bool)

(assert (=> b!1146014 (= e!651889 e!651882)))

(declare-fun res!763050 () Bool)

(assert (=> b!1146014 (=> (not res!763050) (not e!651882))))

(declare-fun lt!511733 () array!74389)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74389 (_ BitVec 32)) Bool)

(assert (=> b!1146014 (= res!763050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511733 mask!1564))))

(assert (=> b!1146014 (= lt!511733 (array!74390 (store (arr!35845 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36381 _keys!1208)))))

(declare-fun mapIsEmpty!44978 () Bool)

(assert (=> mapIsEmpty!44978 mapRes!44978))

(declare-fun b!1146015 () Bool)

(declare-fun res!763044 () Bool)

(assert (=> b!1146015 (=> (not res!763044) (not e!651889))))

(assert (=> b!1146015 (= res!763044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146016 () Bool)

(declare-fun e!651885 () Bool)

(declare-fun e!651888 () Bool)

(assert (=> b!1146016 (= e!651885 e!651888)))

(declare-fun res!763048 () Bool)

(assert (=> b!1146016 (=> res!763048 e!651888)))

(assert (=> b!1146016 (= res!763048 (not (= (select (arr!35845 _keys!1208) from!1455) k!934)))))

(declare-fun e!651879 () Bool)

(assert (=> b!1146016 e!651879))

(declare-fun c!113010 () Bool)

(assert (=> b!1146016 (= c!113010 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511738 () Unit!37628)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!526 (array!74389 array!74387 (_ BitVec 32) (_ BitVec 32) V!43485 V!43485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37628)

(assert (=> b!1146016 (= lt!511738 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146017 () Bool)

(assert (=> b!1146017 (= c!113009 (and (not lt!511731) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651880 () Unit!37628)

(assert (=> b!1146017 (= e!651893 e!651880)))

(declare-fun b!1146018 () Bool)

(declare-fun Unit!37630 () Unit!37628)

(assert (=> b!1146018 (= e!651886 Unit!37630)))

(declare-fun b!1146019 () Bool)

(declare-fun res!763053 () Bool)

(assert (=> b!1146019 (=> (not res!763053) (not e!651882))))

(declare-datatypes ((List!25048 0))(
  ( (Nil!25045) (Cons!25044 (h!26253 (_ BitVec 64)) (t!36279 List!25048)) )
))
(declare-fun arrayNoDuplicates!0 (array!74389 (_ BitVec 32) List!25048) Bool)

(assert (=> b!1146019 (= res!763053 (arrayNoDuplicates!0 lt!511733 #b00000000000000000000000000000000 Nil!25045))))

(declare-fun b!1146020 () Bool)

(declare-fun call!52416 () ListLongMap!16263)

(assert (=> b!1146020 (= e!651879 (= call!52416 call!52417))))

(declare-fun b!1146021 () Bool)

(declare-fun lt!511730 () Unit!37628)

(assert (=> b!1146021 (= e!651880 lt!511730)))

(assert (=> b!1146021 (= lt!511730 call!52411)))

(assert (=> b!1146021 call!52413))

(declare-fun b!1146022 () Bool)

(assert (=> b!1146022 (= e!651884 e!651885)))

(declare-fun res!763047 () Bool)

(assert (=> b!1146022 (=> res!763047 e!651885)))

(assert (=> b!1146022 (= res!763047 (not (= from!1455 i!673)))))

(declare-fun lt!511721 () array!74387)

(declare-fun lt!511735 () ListLongMap!16263)

(assert (=> b!1146022 (= lt!511735 (getCurrentListMapNoExtraKeys!4623 lt!511733 lt!511721 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511729 () V!43485)

(assert (=> b!1146022 (= lt!511721 (array!74388 (store (arr!35844 _values!996) i!673 (ValueCellFull!13675 lt!511729)) (size!36380 _values!996)))))

(declare-fun dynLambda!2657 (Int (_ BitVec 64)) V!43485)

(assert (=> b!1146022 (= lt!511729 (dynLambda!2657 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1146022 (= lt!511737 (getCurrentListMapNoExtraKeys!4623 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146023 () Bool)

(declare-fun res!763046 () Bool)

(assert (=> b!1146023 (=> (not res!763046) (not e!651889))))

(assert (=> b!1146023 (= res!763046 (and (= (size!36380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36381 _keys!1208) (size!36380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146024 () Bool)

(assert (=> b!1146024 (= e!651879 (= call!52416 (-!1286 call!52417 k!934)))))

(declare-fun b!1146025 () Bool)

(declare-fun res!763056 () Bool)

(assert (=> b!1146025 (=> (not res!763056) (not e!651889))))

(assert (=> b!1146025 (= res!763056 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36381 _keys!1208))))))

(declare-fun b!1146026 () Bool)

(assert (=> b!1146026 (= e!651887 (and e!651878 mapRes!44978))))

(declare-fun condMapEmpty!44978 () Bool)

(declare-fun mapDefault!44978 () ValueCell!13675)

