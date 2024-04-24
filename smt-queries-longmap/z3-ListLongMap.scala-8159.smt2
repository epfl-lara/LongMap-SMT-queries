; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100056 () Bool)

(assert start!100056)

(declare-fun b_free!25399 () Bool)

(declare-fun b_next!25399 () Bool)

(assert (=> start!100056 (= b_free!25399 (not b_next!25399))))

(declare-fun tp!88910 () Bool)

(declare-fun b_and!41667 () Bool)

(assert (=> start!100056 (= tp!88910 b_and!41667)))

(declare-fun b!1187944 () Bool)

(declare-fun res!789388 () Bool)

(declare-fun e!675546 () Bool)

(assert (=> b!1187944 (=> (not res!789388) (not e!675546))))

(declare-datatypes ((array!76699 0))(
  ( (array!76700 (arr!36993 (Array (_ BitVec 32) (_ BitVec 64))) (size!37530 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76699)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76699 (_ BitVec 32)) Bool)

(assert (=> b!1187944 (= res!789388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187945 () Bool)

(declare-fun e!675554 () Bool)

(assert (=> b!1187945 (= e!675554 true)))

(declare-datatypes ((V!45033 0))(
  ( (V!45034 (val!15021 Int)) )
))
(declare-datatypes ((tuple2!19320 0))(
  ( (tuple2!19321 (_1!9671 (_ BitVec 64)) (_2!9671 V!45033)) )
))
(declare-datatypes ((List!26055 0))(
  ( (Nil!26052) (Cons!26051 (h!27269 tuple2!19320) (t!38438 List!26055)) )
))
(declare-datatypes ((ListLongMap!17297 0))(
  ( (ListLongMap!17298 (toList!8664 List!26055)) )
))
(declare-fun lt!539616 () ListLongMap!17297)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!539610 () ListLongMap!17297)

(declare-fun -!1684 (ListLongMap!17297 (_ BitVec 64)) ListLongMap!17297)

(assert (=> b!1187945 (= (-!1684 lt!539616 k0!934) lt!539610)))

(declare-fun lt!539620 () V!45033)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539613 () ListLongMap!17297)

(declare-datatypes ((Unit!39332 0))(
  ( (Unit!39333) )
))
(declare-fun lt!539612 () Unit!39332)

(declare-fun addRemoveCommutativeForDiffKeys!197 (ListLongMap!17297 (_ BitVec 64) V!45033 (_ BitVec 64)) Unit!39332)

(assert (=> b!1187945 (= lt!539612 (addRemoveCommutativeForDiffKeys!197 lt!539613 (select (arr!36993 _keys!1208) from!1455) lt!539620 k0!934))))

(declare-fun lt!539608 () ListLongMap!17297)

(declare-fun lt!539618 () ListLongMap!17297)

(declare-fun lt!539614 () ListLongMap!17297)

(assert (=> b!1187945 (and (= lt!539608 lt!539616) (= lt!539618 lt!539614))))

(declare-fun lt!539621 () tuple2!19320)

(declare-fun +!3981 (ListLongMap!17297 tuple2!19320) ListLongMap!17297)

(assert (=> b!1187945 (= lt!539616 (+!3981 lt!539613 lt!539621))))

(assert (=> b!1187945 (not (= (select (arr!36993 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539615 () Unit!39332)

(declare-fun e!675544 () Unit!39332)

(assert (=> b!1187945 (= lt!539615 e!675544)))

(declare-fun c!117620 () Bool)

(assert (=> b!1187945 (= c!117620 (= (select (arr!36993 _keys!1208) from!1455) k0!934))))

(declare-fun e!675543 () Bool)

(assert (=> b!1187945 e!675543))

(declare-fun res!789401 () Bool)

(assert (=> b!1187945 (=> (not res!789401) (not e!675543))))

(declare-fun lt!539617 () ListLongMap!17297)

(assert (=> b!1187945 (= res!789401 (= lt!539617 lt!539610))))

(assert (=> b!1187945 (= lt!539610 (+!3981 lt!539618 lt!539621))))

(assert (=> b!1187945 (= lt!539621 (tuple2!19321 (select (arr!36993 _keys!1208) from!1455) lt!539620))))

(declare-fun lt!539623 () V!45033)

(declare-datatypes ((ValueCell!14255 0))(
  ( (ValueCellFull!14255 (v!17655 V!45033)) (EmptyCell!14255) )
))
(declare-datatypes ((array!76701 0))(
  ( (array!76702 (arr!36994 (Array (_ BitVec 32) ValueCell!14255)) (size!37531 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76701)

(declare-fun get!18992 (ValueCell!14255 V!45033) V!45033)

(assert (=> b!1187945 (= lt!539620 (get!18992 (select (arr!36994 _values!996) from!1455) lt!539623))))

(declare-fun b!1187946 () Bool)

(declare-fun e!675550 () Bool)

(declare-fun e!675548 () Bool)

(assert (=> b!1187946 (= e!675550 (not e!675548))))

(declare-fun res!789392 () Bool)

(assert (=> b!1187946 (=> res!789392 e!675548)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187946 (= res!789392 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187946 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539622 () Unit!39332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76699 (_ BitVec 64) (_ BitVec 32)) Unit!39332)

(assert (=> b!1187946 (= lt!539622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187947 () Bool)

(declare-fun res!789393 () Bool)

(assert (=> b!1187947 (=> (not res!789393) (not e!675546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187947 (= res!789393 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46721 () Bool)

(declare-fun mapRes!46721 () Bool)

(assert (=> mapIsEmpty!46721 mapRes!46721))

(declare-fun b!1187949 () Bool)

(declare-fun res!789395 () Bool)

(assert (=> b!1187949 (=> (not res!789395) (not e!675546))))

(assert (=> b!1187949 (= res!789395 (= (select (arr!36993 _keys!1208) i!673) k0!934))))

(declare-fun b!1187950 () Bool)

(declare-fun e!675551 () Bool)

(declare-fun tp_is_empty!29929 () Bool)

(assert (=> b!1187950 (= e!675551 tp_is_empty!29929)))

(declare-fun b!1187951 () Bool)

(declare-fun e!675549 () Bool)

(assert (=> b!1187951 (= e!675549 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187952 () Bool)

(declare-fun res!789394 () Bool)

(assert (=> b!1187952 (=> (not res!789394) (not e!675546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187952 (= res!789394 (validMask!0 mask!1564))))

(declare-fun b!1187953 () Bool)

(declare-fun res!789390 () Bool)

(assert (=> b!1187953 (=> (not res!789390) (not e!675546))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1187953 (= res!789390 (and (= (size!37531 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37530 _keys!1208) (size!37531 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187954 () Bool)

(declare-fun e!675547 () Bool)

(declare-fun e!675545 () Bool)

(assert (=> b!1187954 (= e!675547 (and e!675545 mapRes!46721))))

(declare-fun condMapEmpty!46721 () Bool)

(declare-fun mapDefault!46721 () ValueCell!14255)

(assert (=> b!1187954 (= condMapEmpty!46721 (= (arr!36994 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14255)) mapDefault!46721)))))

(declare-fun b!1187955 () Bool)

(declare-fun e!675553 () Bool)

(assert (=> b!1187955 (= e!675548 e!675553)))

(declare-fun res!789391 () Bool)

(assert (=> b!1187955 (=> res!789391 e!675553)))

(assert (=> b!1187955 (= res!789391 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45033)

(declare-fun lt!539619 () array!76701)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539624 () array!76699)

(declare-fun minValue!944 () V!45033)

(declare-fun getCurrentListMapNoExtraKeys!5133 (array!76699 array!76701 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) Int) ListLongMap!17297)

(assert (=> b!1187955 (= lt!539617 (getCurrentListMapNoExtraKeys!5133 lt!539624 lt!539619 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187955 (= lt!539619 (array!76702 (store (arr!36994 _values!996) i!673 (ValueCellFull!14255 lt!539623)) (size!37531 _values!996)))))

(declare-fun dynLambda!3092 (Int (_ BitVec 64)) V!45033)

(assert (=> b!1187955 (= lt!539623 (dynLambda!3092 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187955 (= lt!539608 (getCurrentListMapNoExtraKeys!5133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187956 () Bool)

(assert (=> b!1187956 (= e!675546 e!675550)))

(declare-fun res!789389 () Bool)

(assert (=> b!1187956 (=> (not res!789389) (not e!675550))))

(assert (=> b!1187956 (= res!789389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539624 mask!1564))))

(assert (=> b!1187956 (= lt!539624 (array!76700 (store (arr!36993 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37530 _keys!1208)))))

(declare-fun b!1187957 () Bool)

(assert (=> b!1187957 (= e!675545 tp_is_empty!29929)))

(declare-fun b!1187958 () Bool)

(declare-fun Unit!39334 () Unit!39332)

(assert (=> b!1187958 (= e!675544 Unit!39334)))

(declare-fun lt!539611 () Unit!39332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76699 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39332)

(assert (=> b!1187958 (= lt!539611 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187958 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539609 () Unit!39332)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76699 (_ BitVec 32) (_ BitVec 32)) Unit!39332)

(assert (=> b!1187958 (= lt!539609 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26056 0))(
  ( (Nil!26053) (Cons!26052 (h!27270 (_ BitVec 64)) (t!38439 List!26056)) )
))
(declare-fun arrayNoDuplicates!0 (array!76699 (_ BitVec 32) List!26056) Bool)

(assert (=> b!1187958 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26053)))

(declare-fun lt!539626 () Unit!39332)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76699 (_ BitVec 64) (_ BitVec 32) List!26056) Unit!39332)

(assert (=> b!1187958 (= lt!539626 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26053))))

(assert (=> b!1187958 false))

(declare-fun b!1187959 () Bool)

(assert (=> b!1187959 (= e!675553 e!675554)))

(declare-fun res!789400 () Bool)

(assert (=> b!1187959 (=> res!789400 e!675554)))

(assert (=> b!1187959 (= res!789400 (not (validKeyInArray!0 (select (arr!36993 _keys!1208) from!1455))))))

(assert (=> b!1187959 (= lt!539614 lt!539618)))

(assert (=> b!1187959 (= lt!539618 (-!1684 lt!539613 k0!934))))

(assert (=> b!1187959 (= lt!539614 (getCurrentListMapNoExtraKeys!5133 lt!539624 lt!539619 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187959 (= lt!539613 (getCurrentListMapNoExtraKeys!5133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539625 () Unit!39332)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 (array!76699 array!76701 (_ BitVec 32) (_ BitVec 32) V!45033 V!45033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39332)

(assert (=> b!1187959 (= lt!539625 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187960 () Bool)

(declare-fun res!789387 () Bool)

(assert (=> b!1187960 (=> (not res!789387) (not e!675550))))

(assert (=> b!1187960 (= res!789387 (arrayNoDuplicates!0 lt!539624 #b00000000000000000000000000000000 Nil!26053))))

(declare-fun res!789398 () Bool)

(assert (=> start!100056 (=> (not res!789398) (not e!675546))))

(assert (=> start!100056 (= res!789398 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37530 _keys!1208))))))

(assert (=> start!100056 e!675546))

(assert (=> start!100056 tp_is_empty!29929))

(declare-fun array_inv!28302 (array!76699) Bool)

(assert (=> start!100056 (array_inv!28302 _keys!1208)))

(assert (=> start!100056 true))

(assert (=> start!100056 tp!88910))

(declare-fun array_inv!28303 (array!76701) Bool)

(assert (=> start!100056 (and (array_inv!28303 _values!996) e!675547)))

(declare-fun b!1187948 () Bool)

(declare-fun res!789396 () Bool)

(assert (=> b!1187948 (=> (not res!789396) (not e!675546))))

(assert (=> b!1187948 (= res!789396 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26053))))

(declare-fun b!1187961 () Bool)

(declare-fun res!789399 () Bool)

(assert (=> b!1187961 (=> (not res!789399) (not e!675546))))

(assert (=> b!1187961 (= res!789399 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37530 _keys!1208))))))

(declare-fun mapNonEmpty!46721 () Bool)

(declare-fun tp!88911 () Bool)

(assert (=> mapNonEmpty!46721 (= mapRes!46721 (and tp!88911 e!675551))))

(declare-fun mapValue!46721 () ValueCell!14255)

(declare-fun mapKey!46721 () (_ BitVec 32))

(declare-fun mapRest!46721 () (Array (_ BitVec 32) ValueCell!14255))

(assert (=> mapNonEmpty!46721 (= (arr!36994 _values!996) (store mapRest!46721 mapKey!46721 mapValue!46721))))

(declare-fun b!1187962 () Bool)

(declare-fun Unit!39335 () Unit!39332)

(assert (=> b!1187962 (= e!675544 Unit!39335)))

(declare-fun b!1187963 () Bool)

(assert (=> b!1187963 (= e!675543 e!675549)))

(declare-fun res!789397 () Bool)

(assert (=> b!1187963 (=> res!789397 e!675549)))

(assert (=> b!1187963 (= res!789397 (not (= (select (arr!36993 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!100056 res!789398) b!1187952))

(assert (= (and b!1187952 res!789394) b!1187953))

(assert (= (and b!1187953 res!789390) b!1187944))

(assert (= (and b!1187944 res!789388) b!1187948))

(assert (= (and b!1187948 res!789396) b!1187961))

(assert (= (and b!1187961 res!789399) b!1187947))

(assert (= (and b!1187947 res!789393) b!1187949))

(assert (= (and b!1187949 res!789395) b!1187956))

(assert (= (and b!1187956 res!789389) b!1187960))

(assert (= (and b!1187960 res!789387) b!1187946))

(assert (= (and b!1187946 (not res!789392)) b!1187955))

(assert (= (and b!1187955 (not res!789391)) b!1187959))

(assert (= (and b!1187959 (not res!789400)) b!1187945))

(assert (= (and b!1187945 res!789401) b!1187963))

(assert (= (and b!1187963 (not res!789397)) b!1187951))

(assert (= (and b!1187945 c!117620) b!1187958))

(assert (= (and b!1187945 (not c!117620)) b!1187962))

(assert (= (and b!1187954 condMapEmpty!46721) mapIsEmpty!46721))

(assert (= (and b!1187954 (not condMapEmpty!46721)) mapNonEmpty!46721))

(get-info :version)

(assert (= (and mapNonEmpty!46721 ((_ is ValueCellFull!14255) mapValue!46721)) b!1187950))

(assert (= (and b!1187954 ((_ is ValueCellFull!14255) mapDefault!46721)) b!1187957))

(assert (= start!100056 b!1187954))

(declare-fun b_lambda!20537 () Bool)

(assert (=> (not b_lambda!20537) (not b!1187955)))

(declare-fun t!38437 () Bool)

(declare-fun tb!10203 () Bool)

(assert (=> (and start!100056 (= defaultEntry!1004 defaultEntry!1004) t!38437) tb!10203))

(declare-fun result!20981 () Bool)

(assert (=> tb!10203 (= result!20981 tp_is_empty!29929)))

(assert (=> b!1187955 t!38437))

(declare-fun b_and!41669 () Bool)

(assert (= b_and!41667 (and (=> t!38437 result!20981) b_and!41669)))

(declare-fun m!1096797 () Bool)

(assert (=> b!1187944 m!1096797))

(declare-fun m!1096799 () Bool)

(assert (=> b!1187949 m!1096799))

(declare-fun m!1096801 () Bool)

(assert (=> b!1187947 m!1096801))

(declare-fun m!1096803 () Bool)

(assert (=> b!1187959 m!1096803))

(declare-fun m!1096805 () Bool)

(assert (=> b!1187959 m!1096805))

(declare-fun m!1096807 () Bool)

(assert (=> b!1187959 m!1096807))

(declare-fun m!1096809 () Bool)

(assert (=> b!1187959 m!1096809))

(declare-fun m!1096811 () Bool)

(assert (=> b!1187959 m!1096811))

(declare-fun m!1096813 () Bool)

(assert (=> b!1187959 m!1096813))

(assert (=> b!1187959 m!1096807))

(declare-fun m!1096815 () Bool)

(assert (=> b!1187956 m!1096815))

(declare-fun m!1096817 () Bool)

(assert (=> b!1187956 m!1096817))

(declare-fun m!1096819 () Bool)

(assert (=> mapNonEmpty!46721 m!1096819))

(declare-fun m!1096821 () Bool)

(assert (=> b!1187948 m!1096821))

(assert (=> b!1187945 m!1096807))

(declare-fun m!1096823 () Bool)

(assert (=> b!1187945 m!1096823))

(declare-fun m!1096825 () Bool)

(assert (=> b!1187945 m!1096825))

(declare-fun m!1096827 () Bool)

(assert (=> b!1187945 m!1096827))

(declare-fun m!1096829 () Bool)

(assert (=> b!1187945 m!1096829))

(assert (=> b!1187945 m!1096825))

(declare-fun m!1096831 () Bool)

(assert (=> b!1187945 m!1096831))

(assert (=> b!1187945 m!1096807))

(declare-fun m!1096833 () Bool)

(assert (=> b!1187945 m!1096833))

(assert (=> b!1187963 m!1096807))

(declare-fun m!1096835 () Bool)

(assert (=> b!1187955 m!1096835))

(declare-fun m!1096837 () Bool)

(assert (=> b!1187955 m!1096837))

(declare-fun m!1096839 () Bool)

(assert (=> b!1187955 m!1096839))

(declare-fun m!1096841 () Bool)

(assert (=> b!1187955 m!1096841))

(declare-fun m!1096843 () Bool)

(assert (=> b!1187960 m!1096843))

(declare-fun m!1096845 () Bool)

(assert (=> b!1187951 m!1096845))

(declare-fun m!1096847 () Bool)

(assert (=> b!1187958 m!1096847))

(declare-fun m!1096849 () Bool)

(assert (=> b!1187958 m!1096849))

(declare-fun m!1096851 () Bool)

(assert (=> b!1187958 m!1096851))

(declare-fun m!1096853 () Bool)

(assert (=> b!1187958 m!1096853))

(declare-fun m!1096855 () Bool)

(assert (=> b!1187958 m!1096855))

(declare-fun m!1096857 () Bool)

(assert (=> start!100056 m!1096857))

(declare-fun m!1096859 () Bool)

(assert (=> start!100056 m!1096859))

(declare-fun m!1096861 () Bool)

(assert (=> b!1187946 m!1096861))

(declare-fun m!1096863 () Bool)

(assert (=> b!1187946 m!1096863))

(declare-fun m!1096865 () Bool)

(assert (=> b!1187952 m!1096865))

(check-sat (not b!1187944) (not b!1187951) tp_is_empty!29929 (not b!1187958) (not b_lambda!20537) (not start!100056) b_and!41669 (not b!1187955) (not b!1187956) (not b!1187952) (not b!1187948) (not b!1187960) (not b!1187947) (not b!1187946) (not mapNonEmpty!46721) (not b_next!25399) (not b!1187959) (not b!1187945))
(check-sat b_and!41669 (not b_next!25399))
