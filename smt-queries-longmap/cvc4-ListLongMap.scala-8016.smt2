; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98940 () Bool)

(assert start!98940)

(declare-fun b_free!24545 () Bool)

(declare-fun b_next!24545 () Bool)

(assert (=> start!98940 (= b_free!24545 (not b_next!24545))))

(declare-fun tp!86346 () Bool)

(declare-fun b_and!39939 () Bool)

(assert (=> start!98940 (= tp!86346 b_and!39939)))

(declare-datatypes ((array!74991 0))(
  ( (array!74992 (arr!36146 (Array (_ BitVec 32) (_ BitVec 64))) (size!36682 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74991)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1160082 () Bool)

(declare-fun e!659685 () Bool)

(declare-fun arrayContainsKey!0 (array!74991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160082 (= e!659685 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160083 () Bool)

(declare-fun e!659695 () Bool)

(declare-datatypes ((V!43893 0))(
  ( (V!43894 (val!14594 Int)) )
))
(declare-datatypes ((tuple2!18586 0))(
  ( (tuple2!18587 (_1!9304 (_ BitVec 64)) (_2!9304 V!43893)) )
))
(declare-datatypes ((List!25323 0))(
  ( (Nil!25320) (Cons!25319 (h!26528 tuple2!18586) (t!36860 List!25323)) )
))
(declare-datatypes ((ListLongMap!16555 0))(
  ( (ListLongMap!16556 (toList!8293 List!25323)) )
))
(declare-fun call!56086 () ListLongMap!16555)

(declare-fun call!56084 () ListLongMap!16555)

(assert (=> b!1160083 (= e!659695 (= call!56086 call!56084))))

(declare-fun b!1160084 () Bool)

(declare-fun -!1402 (ListLongMap!16555 (_ BitVec 64)) ListLongMap!16555)

(assert (=> b!1160084 (= e!659695 (= call!56086 (-!1402 call!56084 k!934)))))

(declare-fun b!1160085 () Bool)

(declare-fun e!659691 () Bool)

(declare-fun e!659687 () Bool)

(assert (=> b!1160085 (= e!659691 (not e!659687))))

(declare-fun res!769934 () Bool)

(assert (=> b!1160085 (=> res!769934 e!659687)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160085 (= res!769934 (bvsgt from!1455 i!673))))

(assert (=> b!1160085 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38240 0))(
  ( (Unit!38241) )
))
(declare-fun lt!521735 () Unit!38240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74991 (_ BitVec 64) (_ BitVec 32)) Unit!38240)

(assert (=> b!1160085 (= lt!521735 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1160086 () Bool)

(declare-fun lt!521736 () ListLongMap!16555)

(declare-fun minValue!944 () V!43893)

(declare-fun contains!6799 (ListLongMap!16555 (_ BitVec 64)) Bool)

(declare-fun +!3698 (ListLongMap!16555 tuple2!18586) ListLongMap!16555)

(assert (=> b!1160086 (contains!6799 (+!3698 lt!521736 (tuple2!18587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!521721 () Unit!38240)

(declare-fun addStillContains!940 (ListLongMap!16555 (_ BitVec 64) V!43893 (_ BitVec 64)) Unit!38240)

(assert (=> b!1160086 (= lt!521721 (addStillContains!940 lt!521736 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!56085 () Bool)

(assert (=> b!1160086 call!56085))

(declare-fun call!56089 () ListLongMap!16555)

(assert (=> b!1160086 (= lt!521736 call!56089)))

(declare-fun lt!521733 () Unit!38240)

(declare-fun call!56088 () Unit!38240)

(assert (=> b!1160086 (= lt!521733 call!56088)))

(declare-fun e!659683 () Unit!38240)

(assert (=> b!1160086 (= e!659683 lt!521721)))

(declare-fun b!1160087 () Bool)

(declare-fun e!659692 () Unit!38240)

(declare-fun lt!521732 () Unit!38240)

(assert (=> b!1160087 (= e!659692 lt!521732)))

(declare-fun call!56082 () Unit!38240)

(assert (=> b!1160087 (= lt!521732 call!56082)))

(declare-fun call!56083 () Bool)

(assert (=> b!1160087 call!56083))

(declare-fun bm!56079 () Bool)

(assert (=> bm!56079 (= call!56082 call!56088)))

(declare-fun call!56087 () ListLongMap!16555)

(declare-fun bm!56080 () Bool)

(declare-fun c!115765 () Bool)

(assert (=> bm!56080 (= call!56085 (contains!6799 (ite c!115765 lt!521736 call!56087) k!934))))

(declare-fun zeroValue!944 () V!43893)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13828 0))(
  ( (ValueCellFull!13828 (v!17231 V!43893)) (EmptyCell!13828) )
))
(declare-datatypes ((array!74993 0))(
  ( (array!74994 (arr!36147 (Array (_ BitVec 32) ValueCell!13828)) (size!36683 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!56081 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4757 (array!74991 array!74993 (_ BitVec 32) (_ BitVec 32) V!43893 V!43893 (_ BitVec 32) Int) ListLongMap!16555)

(assert (=> bm!56081 (= call!56084 (getCurrentListMapNoExtraKeys!4757 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160088 () Bool)

(declare-fun res!769936 () Bool)

(assert (=> b!1160088 (=> (not res!769936) (not e!659691))))

(declare-fun lt!521720 () array!74991)

(declare-datatypes ((List!25324 0))(
  ( (Nil!25321) (Cons!25320 (h!26529 (_ BitVec 64)) (t!36861 List!25324)) )
))
(declare-fun arrayNoDuplicates!0 (array!74991 (_ BitVec 32) List!25324) Bool)

(assert (=> b!1160088 (= res!769936 (arrayNoDuplicates!0 lt!521720 #b00000000000000000000000000000000 Nil!25321))))

(declare-fun b!1160089 () Bool)

(declare-fun e!659696 () Unit!38240)

(declare-fun Unit!38242 () Unit!38240)

(assert (=> b!1160089 (= e!659696 Unit!38242)))

(declare-fun lt!521737 () Bool)

(assert (=> b!1160089 (= lt!521737 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160089 (= c!115765 (and (not lt!521737) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521723 () Unit!38240)

(assert (=> b!1160089 (= lt!521723 e!659683)))

(declare-fun lt!521731 () Unit!38240)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!527 (array!74991 array!74993 (_ BitVec 32) (_ BitVec 32) V!43893 V!43893 (_ BitVec 64) (_ BitVec 32) Int) Unit!38240)

(assert (=> b!1160089 (= lt!521731 (lemmaListMapContainsThenArrayContainsFrom!527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115766 () Bool)

(assert (=> b!1160089 (= c!115766 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769939 () Bool)

(assert (=> b!1160089 (= res!769939 e!659685)))

(declare-fun e!659693 () Bool)

(assert (=> b!1160089 (=> (not res!769939) (not e!659693))))

(assert (=> b!1160089 e!659693))

(declare-fun lt!521730 () Unit!38240)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74991 (_ BitVec 32) (_ BitVec 32)) Unit!38240)

(assert (=> b!1160089 (= lt!521730 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160089 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25321)))

(declare-fun lt!521725 () Unit!38240)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74991 (_ BitVec 64) (_ BitVec 32) List!25324) Unit!38240)

(assert (=> b!1160089 (= lt!521725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25321))))

(assert (=> b!1160089 false))

(declare-fun b!1160090 () Bool)

(declare-fun res!769932 () Bool)

(declare-fun e!659697 () Bool)

(assert (=> b!1160090 (=> (not res!769932) (not e!659697))))

(assert (=> b!1160090 (= res!769932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25321))))

(declare-fun b!1160091 () Bool)

(declare-fun e!659684 () Bool)

(assert (=> b!1160091 (= e!659687 e!659684)))

(declare-fun res!769941 () Bool)

(assert (=> b!1160091 (=> res!769941 e!659684)))

(assert (=> b!1160091 (= res!769941 (not (= from!1455 i!673)))))

(declare-fun lt!521727 () ListLongMap!16555)

(declare-fun lt!521724 () array!74993)

(assert (=> b!1160091 (= lt!521727 (getCurrentListMapNoExtraKeys!4757 lt!521720 lt!521724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521739 () V!43893)

(assert (=> b!1160091 (= lt!521724 (array!74994 (store (arr!36147 _values!996) i!673 (ValueCellFull!13828 lt!521739)) (size!36683 _values!996)))))

(declare-fun dynLambda!2757 (Int (_ BitVec 64)) V!43893)

(assert (=> b!1160091 (= lt!521739 (dynLambda!2757 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521719 () ListLongMap!16555)

(assert (=> b!1160091 (= lt!521719 (getCurrentListMapNoExtraKeys!4757 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160092 () Bool)

(assert (=> b!1160092 (= e!659697 e!659691)))

(declare-fun res!769933 () Bool)

(assert (=> b!1160092 (=> (not res!769933) (not e!659691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74991 (_ BitVec 32)) Bool)

(assert (=> b!1160092 (= res!769933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521720 mask!1564))))

(assert (=> b!1160092 (= lt!521720 (array!74992 (store (arr!36146 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36682 _keys!1208)))))

(declare-fun b!1160093 () Bool)

(declare-fun res!769937 () Bool)

(assert (=> b!1160093 (=> (not res!769937) (not e!659697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160093 (= res!769937 (validMask!0 mask!1564))))

(declare-fun b!1160094 () Bool)

(assert (=> b!1160094 (= e!659693 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160095 () Bool)

(declare-fun res!769935 () Bool)

(assert (=> b!1160095 (=> (not res!769935) (not e!659697))))

(assert (=> b!1160095 (= res!769935 (and (= (size!36683 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36682 _keys!1208) (size!36683 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56082 () Bool)

(assert (=> bm!56082 (= call!56083 call!56085)))

(declare-fun b!1160096 () Bool)

(declare-fun e!659694 () Unit!38240)

(declare-fun Unit!38243 () Unit!38240)

(assert (=> b!1160096 (= e!659694 Unit!38243)))

(declare-fun b!1160097 () Bool)

(assert (=> b!1160097 (= e!659685 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521737) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160098 () Bool)

(declare-fun res!769929 () Bool)

(assert (=> b!1160098 (=> (not res!769929) (not e!659697))))

(assert (=> b!1160098 (= res!769929 (= (select (arr!36146 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45437 () Bool)

(declare-fun mapRes!45437 () Bool)

(declare-fun tp!86345 () Bool)

(declare-fun e!659690 () Bool)

(assert (=> mapNonEmpty!45437 (= mapRes!45437 (and tp!86345 e!659690))))

(declare-fun mapRest!45437 () (Array (_ BitVec 32) ValueCell!13828))

(declare-fun mapValue!45437 () ValueCell!13828)

(declare-fun mapKey!45437 () (_ BitVec 32))

(assert (=> mapNonEmpty!45437 (= (arr!36147 _values!996) (store mapRest!45437 mapKey!45437 mapValue!45437))))

(declare-fun lt!521718 () ListLongMap!16555)

(declare-fun e!659686 () Bool)

(declare-fun b!1160099 () Bool)

(assert (=> b!1160099 (= e!659686 (= lt!521718 (getCurrentListMapNoExtraKeys!4757 lt!521720 lt!521724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160100 () Bool)

(assert (=> b!1160100 (= e!659692 e!659694)))

(declare-fun c!115763 () Bool)

(assert (=> b!1160100 (= c!115763 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521737))))

(declare-fun b!1160101 () Bool)

(declare-fun tp_is_empty!29075 () Bool)

(assert (=> b!1160101 (= e!659690 tp_is_empty!29075)))

(declare-fun b!1160102 () Bool)

(declare-fun e!659689 () Bool)

(assert (=> b!1160102 (= e!659689 true)))

(assert (=> b!1160102 e!659686))

(declare-fun res!769942 () Bool)

(assert (=> b!1160102 (=> (not res!769942) (not e!659686))))

(declare-fun lt!521722 () ListLongMap!16555)

(assert (=> b!1160102 (= res!769942 (= lt!521718 lt!521722))))

(assert (=> b!1160102 (= lt!521718 (-!1402 lt!521719 k!934))))

(declare-fun lt!521738 () V!43893)

(assert (=> b!1160102 (= (-!1402 (+!3698 lt!521722 (tuple2!18587 (select (arr!36146 _keys!1208) from!1455) lt!521738)) (select (arr!36146 _keys!1208) from!1455)) lt!521722)))

(declare-fun lt!521726 () Unit!38240)

(declare-fun addThenRemoveForNewKeyIsSame!237 (ListLongMap!16555 (_ BitVec 64) V!43893) Unit!38240)

(assert (=> b!1160102 (= lt!521726 (addThenRemoveForNewKeyIsSame!237 lt!521722 (select (arr!36146 _keys!1208) from!1455) lt!521738))))

(declare-fun get!18431 (ValueCell!13828 V!43893) V!43893)

(assert (=> b!1160102 (= lt!521738 (get!18431 (select (arr!36147 _values!996) from!1455) lt!521739))))

(declare-fun lt!521729 () Unit!38240)

(assert (=> b!1160102 (= lt!521729 e!659696)))

(declare-fun c!115764 () Bool)

(assert (=> b!1160102 (= c!115764 (contains!6799 lt!521722 k!934))))

(assert (=> b!1160102 (= lt!521722 (getCurrentListMapNoExtraKeys!4757 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160103 () Bool)

(declare-fun res!769943 () Bool)

(assert (=> b!1160103 (=> (not res!769943) (not e!659697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160103 (= res!769943 (validKeyInArray!0 k!934))))

(declare-fun b!1160104 () Bool)

(declare-fun res!769931 () Bool)

(assert (=> b!1160104 (=> (not res!769931) (not e!659697))))

(assert (=> b!1160104 (= res!769931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160105 () Bool)

(declare-fun Unit!38244 () Unit!38240)

(assert (=> b!1160105 (= e!659696 Unit!38244)))

(declare-fun bm!56083 () Bool)

(declare-fun c!115767 () Bool)

(assert (=> bm!56083 (= call!56089 (+!3698 lt!521722 (ite (or c!115765 c!115767) (tuple2!18587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!56084 () Bool)

(assert (=> bm!56084 (= call!56088 (addStillContains!940 lt!521722 (ite (or c!115765 c!115767) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115765 c!115767) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1160106 () Bool)

(declare-fun res!769938 () Bool)

(assert (=> b!1160106 (=> (not res!769938) (not e!659697))))

(assert (=> b!1160106 (= res!769938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36682 _keys!1208))))))

(declare-fun b!1160107 () Bool)

(assert (=> b!1160107 call!56083))

(declare-fun lt!521734 () Unit!38240)

(assert (=> b!1160107 (= lt!521734 call!56082)))

(assert (=> b!1160107 (= e!659694 lt!521734)))

(declare-fun b!1160108 () Bool)

(assert (=> b!1160108 (= c!115767 (and (not lt!521737) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160108 (= e!659683 e!659692)))

(declare-fun b!1160109 () Bool)

(assert (=> b!1160109 (= e!659684 e!659689)))

(declare-fun res!769930 () Bool)

(assert (=> b!1160109 (=> res!769930 e!659689)))

(assert (=> b!1160109 (= res!769930 (not (= (select (arr!36146 _keys!1208) from!1455) k!934)))))

(assert (=> b!1160109 e!659695))

(declare-fun c!115768 () Bool)

(assert (=> b!1160109 (= c!115768 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521728 () Unit!38240)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 (array!74991 array!74993 (_ BitVec 32) (_ BitVec 32) V!43893 V!43893 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38240)

(assert (=> b!1160109 (= lt!521728 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45437 () Bool)

(assert (=> mapIsEmpty!45437 mapRes!45437))

(declare-fun res!769940 () Bool)

(assert (=> start!98940 (=> (not res!769940) (not e!659697))))

(assert (=> start!98940 (= res!769940 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36682 _keys!1208))))))

(assert (=> start!98940 e!659697))

(assert (=> start!98940 tp_is_empty!29075))

(declare-fun array_inv!27658 (array!74991) Bool)

(assert (=> start!98940 (array_inv!27658 _keys!1208)))

(assert (=> start!98940 true))

(assert (=> start!98940 tp!86346))

(declare-fun e!659682 () Bool)

(declare-fun array_inv!27659 (array!74993) Bool)

(assert (=> start!98940 (and (array_inv!27659 _values!996) e!659682)))

(declare-fun bm!56085 () Bool)

(assert (=> bm!56085 (= call!56086 (getCurrentListMapNoExtraKeys!4757 lt!521720 lt!521724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160110 () Bool)

(declare-fun e!659681 () Bool)

(assert (=> b!1160110 (= e!659682 (and e!659681 mapRes!45437))))

(declare-fun condMapEmpty!45437 () Bool)

(declare-fun mapDefault!45437 () ValueCell!13828)

