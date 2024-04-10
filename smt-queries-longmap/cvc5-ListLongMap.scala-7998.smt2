; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98828 () Bool)

(assert start!98828)

(declare-fun b_free!24433 () Bool)

(declare-fun b_next!24433 () Bool)

(assert (=> start!98828 (= b_free!24433 (not b_next!24433))))

(declare-fun tp!86010 () Bool)

(declare-fun b_and!39715 () Bool)

(assert (=> start!98828 (= tp!86010 b_and!39715)))

(declare-fun res!767419 () Bool)

(declare-fun e!656826 () Bool)

(assert (=> start!98828 (=> (not res!767419) (not e!656826))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74773 0))(
  ( (array!74774 (arr!36037 (Array (_ BitVec 32) (_ BitVec 64))) (size!36573 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74773)

(assert (=> start!98828 (= res!767419 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36573 _keys!1208))))))

(assert (=> start!98828 e!656826))

(declare-fun tp_is_empty!28963 () Bool)

(assert (=> start!98828 tp_is_empty!28963))

(declare-fun array_inv!27580 (array!74773) Bool)

(assert (=> start!98828 (array_inv!27580 _keys!1208)))

(assert (=> start!98828 true))

(assert (=> start!98828 tp!86010))

(declare-datatypes ((V!43745 0))(
  ( (V!43746 (val!14538 Int)) )
))
(declare-datatypes ((ValueCell!13772 0))(
  ( (ValueCellFull!13772 (v!17175 V!43745)) (EmptyCell!13772) )
))
(declare-datatypes ((array!74775 0))(
  ( (array!74776 (arr!36038 (Array (_ BitVec 32) ValueCell!13772)) (size!36574 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74775)

(declare-fun e!656837 () Bool)

(declare-fun array_inv!27581 (array!74775) Bool)

(assert (=> start!98828 (and (array_inv!27581 _values!996) e!656837)))

(declare-fun mapIsEmpty!45269 () Bool)

(declare-fun mapRes!45269 () Bool)

(assert (=> mapIsEmpty!45269 mapRes!45269))

(declare-fun b!1154930 () Bool)

(declare-fun e!656841 () Bool)

(assert (=> b!1154930 (= e!656841 true)))

(declare-fun e!656835 () Bool)

(assert (=> b!1154930 e!656835))

(declare-fun res!767417 () Bool)

(assert (=> b!1154930 (=> (not res!767417) (not e!656835))))

(declare-datatypes ((tuple2!18484 0))(
  ( (tuple2!18485 (_1!9253 (_ BitVec 64)) (_2!9253 V!43745)) )
))
(declare-datatypes ((List!25228 0))(
  ( (Nil!25225) (Cons!25224 (h!26433 tuple2!18484) (t!36653 List!25228)) )
))
(declare-datatypes ((ListLongMap!16453 0))(
  ( (ListLongMap!16454 (toList!8242 List!25228)) )
))
(declare-fun lt!518037 () ListLongMap!16453)

(declare-fun lt!518032 () ListLongMap!16453)

(assert (=> b!1154930 (= res!767417 (= lt!518037 lt!518032))))

(declare-fun lt!518039 () ListLongMap!16453)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1362 (ListLongMap!16453 (_ BitVec 64)) ListLongMap!16453)

(assert (=> b!1154930 (= lt!518037 (-!1362 lt!518039 k!934))))

(declare-fun lt!518030 () V!43745)

(declare-fun +!3655 (ListLongMap!16453 tuple2!18484) ListLongMap!16453)

(assert (=> b!1154930 (= (-!1362 (+!3655 lt!518032 (tuple2!18485 (select (arr!36037 _keys!1208) from!1455) lt!518030)) (select (arr!36037 _keys!1208) from!1455)) lt!518032)))

(declare-datatypes ((Unit!38025 0))(
  ( (Unit!38026) )
))
(declare-fun lt!518034 () Unit!38025)

(declare-fun addThenRemoveForNewKeyIsSame!202 (ListLongMap!16453 (_ BitVec 64) V!43745) Unit!38025)

(assert (=> b!1154930 (= lt!518034 (addThenRemoveForNewKeyIsSame!202 lt!518032 (select (arr!36037 _keys!1208) from!1455) lt!518030))))

(declare-fun lt!518028 () V!43745)

(declare-fun get!18360 (ValueCell!13772 V!43745) V!43745)

(assert (=> b!1154930 (= lt!518030 (get!18360 (select (arr!36038 _values!996) from!1455) lt!518028))))

(declare-fun lt!518024 () Unit!38025)

(declare-fun e!656825 () Unit!38025)

(assert (=> b!1154930 (= lt!518024 e!656825)))

(declare-fun c!114759 () Bool)

(declare-fun contains!6755 (ListLongMap!16453 (_ BitVec 64)) Bool)

(assert (=> b!1154930 (= c!114759 (contains!6755 lt!518032 k!934))))

(declare-fun zeroValue!944 () V!43745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43745)

(declare-fun getCurrentListMapNoExtraKeys!4711 (array!74773 array!74775 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) Int) ListLongMap!16453)

(assert (=> b!1154930 (= lt!518032 (getCurrentListMapNoExtraKeys!4711 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154931 () Bool)

(declare-fun res!767414 () Bool)

(assert (=> b!1154931 (=> (not res!767414) (not e!656826))))

(assert (=> b!1154931 (= res!767414 (and (= (size!36574 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36573 _keys!1208) (size!36574 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154932 () Bool)

(declare-fun e!656834 () Bool)

(declare-fun e!656832 () Bool)

(assert (=> b!1154932 (= e!656834 e!656832)))

(declare-fun res!767416 () Bool)

(assert (=> b!1154932 (=> res!767416 e!656832)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154932 (= res!767416 (not (= from!1455 i!673)))))

(declare-fun lt!518041 () array!74775)

(declare-fun lt!518036 () ListLongMap!16453)

(declare-fun lt!518022 () array!74773)

(assert (=> b!1154932 (= lt!518036 (getCurrentListMapNoExtraKeys!4711 lt!518022 lt!518041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1154932 (= lt!518041 (array!74776 (store (arr!36038 _values!996) i!673 (ValueCellFull!13772 lt!518028)) (size!36574 _values!996)))))

(declare-fun dynLambda!2722 (Int (_ BitVec 64)) V!43745)

(assert (=> b!1154932 (= lt!518028 (dynLambda!2722 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1154932 (= lt!518039 (getCurrentListMapNoExtraKeys!4711 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154933 () Bool)

(declare-fun e!656831 () Bool)

(declare-fun call!54745 () ListLongMap!16453)

(declare-fun call!54738 () ListLongMap!16453)

(assert (=> b!1154933 (= e!656831 (= call!54745 call!54738))))

(declare-fun b!1154934 () Bool)

(declare-fun res!767421 () Bool)

(assert (=> b!1154934 (=> (not res!767421) (not e!656826))))

(declare-datatypes ((List!25229 0))(
  ( (Nil!25226) (Cons!25225 (h!26434 (_ BitVec 64)) (t!36654 List!25229)) )
))
(declare-fun arrayNoDuplicates!0 (array!74773 (_ BitVec 32) List!25229) Bool)

(assert (=> b!1154934 (= res!767421 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25226))))

(declare-fun mapNonEmpty!45269 () Bool)

(declare-fun tp!86009 () Bool)

(declare-fun e!656840 () Bool)

(assert (=> mapNonEmpty!45269 (= mapRes!45269 (and tp!86009 e!656840))))

(declare-fun mapRest!45269 () (Array (_ BitVec 32) ValueCell!13772))

(declare-fun mapKey!45269 () (_ BitVec 32))

(declare-fun mapValue!45269 () ValueCell!13772)

(assert (=> mapNonEmpty!45269 (= (arr!36038 _values!996) (store mapRest!45269 mapKey!45269 mapValue!45269))))

(declare-fun b!1154935 () Bool)

(declare-fun Unit!38027 () Unit!38025)

(assert (=> b!1154935 (= e!656825 Unit!38027)))

(declare-fun bm!54735 () Bool)

(declare-fun c!114756 () Bool)

(declare-fun call!54743 () ListLongMap!16453)

(declare-fun lt!518033 () ListLongMap!16453)

(declare-fun call!54742 () Bool)

(assert (=> bm!54735 (= call!54742 (contains!6755 (ite c!114756 lt!518033 call!54743) k!934))))

(declare-fun b!1154936 () Bool)

(declare-fun e!656833 () Unit!38025)

(declare-fun Unit!38028 () Unit!38025)

(assert (=> b!1154936 (= e!656833 Unit!38028)))

(declare-fun b!1154937 () Bool)

(assert (=> b!1154937 (= e!656831 (= call!54745 (-!1362 call!54738 k!934)))))

(declare-fun b!1154938 () Bool)

(assert (=> b!1154938 (= e!656835 (= lt!518037 (getCurrentListMapNoExtraKeys!4711 lt!518022 lt!518041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154939 () Bool)

(declare-fun res!767411 () Bool)

(assert (=> b!1154939 (=> (not res!767411) (not e!656826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154939 (= res!767411 (validKeyInArray!0 k!934))))

(declare-fun b!1154940 () Bool)

(declare-fun e!656829 () Bool)

(assert (=> b!1154940 (= e!656826 e!656829)))

(declare-fun res!767422 () Bool)

(assert (=> b!1154940 (=> (not res!767422) (not e!656829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74773 (_ BitVec 32)) Bool)

(assert (=> b!1154940 (= res!767422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518022 mask!1564))))

(assert (=> b!1154940 (= lt!518022 (array!74774 (store (arr!36037 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36573 _keys!1208)))))

(declare-fun b!1154941 () Bool)

(declare-fun e!656839 () Unit!38025)

(declare-fun lt!518025 () Unit!38025)

(assert (=> b!1154941 (= e!656839 lt!518025)))

(declare-fun call!54739 () Unit!38025)

(assert (=> b!1154941 (= lt!518025 call!54739)))

(declare-fun call!54741 () Bool)

(assert (=> b!1154941 call!54741))

(declare-fun b!1154942 () Bool)

(declare-fun Unit!38029 () Unit!38025)

(assert (=> b!1154942 (= e!656825 Unit!38029)))

(declare-fun lt!518026 () Bool)

(assert (=> b!1154942 (= lt!518026 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154942 (= c!114756 (and (not lt!518026) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518043 () Unit!38025)

(declare-fun e!656827 () Unit!38025)

(assert (=> b!1154942 (= lt!518043 e!656827)))

(declare-fun lt!518029 () Unit!38025)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!490 (array!74773 array!74775 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 64) (_ BitVec 32) Int) Unit!38025)

(assert (=> b!1154942 (= lt!518029 (lemmaListMapContainsThenArrayContainsFrom!490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114755 () Bool)

(assert (=> b!1154942 (= c!114755 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767412 () Bool)

(declare-fun e!656830 () Bool)

(assert (=> b!1154942 (= res!767412 e!656830)))

(declare-fun e!656836 () Bool)

(assert (=> b!1154942 (=> (not res!767412) (not e!656836))))

(assert (=> b!1154942 e!656836))

(declare-fun lt!518023 () Unit!38025)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74773 (_ BitVec 32) (_ BitVec 32)) Unit!38025)

(assert (=> b!1154942 (= lt!518023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154942 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25226)))

(declare-fun lt!518035 () Unit!38025)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74773 (_ BitVec 64) (_ BitVec 32) List!25229) Unit!38025)

(assert (=> b!1154942 (= lt!518035 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25226))))

(assert (=> b!1154942 false))

(declare-fun bm!54736 () Bool)

(assert (=> bm!54736 (= call!54738 (getCurrentListMapNoExtraKeys!4711 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154943 () Bool)

(assert (=> b!1154943 (= e!656830 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518026) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154944 () Bool)

(declare-fun c!114760 () Bool)

(assert (=> b!1154944 (= c!114760 (and (not lt!518026) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154944 (= e!656827 e!656839)))

(declare-fun b!1154945 () Bool)

(declare-fun res!767409 () Bool)

(assert (=> b!1154945 (=> (not res!767409) (not e!656826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154945 (= res!767409 (validMask!0 mask!1564))))

(declare-fun bm!54737 () Bool)

(declare-fun call!54740 () Unit!38025)

(assert (=> bm!54737 (= call!54739 call!54740)))

(declare-fun b!1154946 () Bool)

(declare-fun res!767413 () Bool)

(assert (=> b!1154946 (=> (not res!767413) (not e!656826))))

(assert (=> b!1154946 (= res!767413 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36573 _keys!1208))))))

(declare-fun b!1154947 () Bool)

(assert (=> b!1154947 (= e!656832 e!656841)))

(declare-fun res!767410 () Bool)

(assert (=> b!1154947 (=> res!767410 e!656841)))

(assert (=> b!1154947 (= res!767410 (not (= (select (arr!36037 _keys!1208) from!1455) k!934)))))

(assert (=> b!1154947 e!656831))

(declare-fun c!114757 () Bool)

(assert (=> b!1154947 (= c!114757 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518031 () Unit!38025)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 (array!74773 array!74775 (_ BitVec 32) (_ BitVec 32) V!43745 V!43745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38025)

(assert (=> b!1154947 (= lt!518031 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154948 () Bool)

(declare-fun call!54744 () ListLongMap!16453)

(assert (=> b!1154948 (contains!6755 call!54744 k!934)))

(declare-fun lt!518038 () Unit!38025)

(declare-fun addStillContains!900 (ListLongMap!16453 (_ BitVec 64) V!43745 (_ BitVec 64)) Unit!38025)

(assert (=> b!1154948 (= lt!518038 (addStillContains!900 lt!518033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1154948 call!54742))

(assert (=> b!1154948 (= lt!518033 (+!3655 lt!518032 (tuple2!18485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518027 () Unit!38025)

(assert (=> b!1154948 (= lt!518027 call!54740)))

(assert (=> b!1154948 (= e!656827 lt!518038)))

(declare-fun b!1154949 () Bool)

(declare-fun e!656828 () Bool)

(assert (=> b!1154949 (= e!656837 (and e!656828 mapRes!45269))))

(declare-fun condMapEmpty!45269 () Bool)

(declare-fun mapDefault!45269 () ValueCell!13772)

