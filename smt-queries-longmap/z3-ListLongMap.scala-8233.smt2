; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100542 () Bool)

(assert start!100542)

(declare-fun b_free!25693 () Bool)

(declare-fun b_next!25693 () Bool)

(assert (=> start!100542 (= b_free!25693 (not b_next!25693))))

(declare-fun tp!90026 () Bool)

(declare-fun b_and!42255 () Bool)

(assert (=> start!100542 (= tp!90026 b_and!42255)))

(declare-fun b!1198202 () Bool)

(declare-fun e!680826 () Bool)

(declare-fun tp_is_empty!30373 () Bool)

(assert (=> b!1198202 (= e!680826 tp_is_empty!30373)))

(declare-fun b!1198203 () Bool)

(declare-fun e!680828 () Bool)

(assert (=> b!1198203 (= e!680828 tp_is_empty!30373)))

(declare-datatypes ((V!45625 0))(
  ( (V!45626 (val!15243 Int)) )
))
(declare-fun zeroValue!944 () V!45625)

(declare-datatypes ((array!77563 0))(
  ( (array!77564 (arr!37422 (Array (_ BitVec 32) (_ BitVec 64))) (size!37959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77563)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!57262 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19544 0))(
  ( (tuple2!19545 (_1!9783 (_ BitVec 64)) (_2!9783 V!45625)) )
))
(declare-datatypes ((List!26344 0))(
  ( (Nil!26341) (Cons!26340 (h!27558 tuple2!19544) (t!39021 List!26344)) )
))
(declare-datatypes ((ListLongMap!17521 0))(
  ( (ListLongMap!17522 (toList!8776 List!26344)) )
))
(declare-fun call!57265 () ListLongMap!17521)

(declare-datatypes ((ValueCell!14477 0))(
  ( (ValueCellFull!14477 (v!17877 V!45625)) (EmptyCell!14477) )
))
(declare-datatypes ((array!77565 0))(
  ( (array!77566 (arr!37423 (Array (_ BitVec 32) ValueCell!14477)) (size!37960 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77565)

(declare-fun minValue!944 () V!45625)

(declare-fun getCurrentListMapNoExtraKeys!5243 (array!77563 array!77565 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) Int) ListLongMap!17521)

(assert (=> bm!57262 (= call!57265 (getCurrentListMapNoExtraKeys!5243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198204 () Bool)

(declare-fun res!797067 () Bool)

(declare-fun e!680831 () Bool)

(assert (=> b!1198204 (=> (not res!797067) (not e!680831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198204 (= res!797067 (validMask!0 mask!1564))))

(declare-fun b!1198205 () Bool)

(declare-fun res!797071 () Bool)

(assert (=> b!1198205 (=> (not res!797071) (not e!680831))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198205 (= res!797071 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37959 _keys!1208))))))

(declare-fun b!1198206 () Bool)

(declare-fun e!680824 () Bool)

(assert (=> b!1198206 (= e!680831 e!680824)))

(declare-fun res!797068 () Bool)

(assert (=> b!1198206 (=> (not res!797068) (not e!680824))))

(declare-fun lt!543648 () array!77563)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77563 (_ BitVec 32)) Bool)

(assert (=> b!1198206 (= res!797068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543648 mask!1564))))

(assert (=> b!1198206 (= lt!543648 (array!77564 (store (arr!37422 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37959 _keys!1208)))))

(declare-fun b!1198207 () Bool)

(declare-fun res!797065 () Bool)

(assert (=> b!1198207 (=> (not res!797065) (not e!680831))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198207 (= res!797065 (= (select (arr!37422 _keys!1208) i!673) k0!934))))

(declare-fun b!1198208 () Bool)

(declare-fun res!797074 () Bool)

(assert (=> b!1198208 (=> (not res!797074) (not e!680824))))

(declare-datatypes ((List!26345 0))(
  ( (Nil!26342) (Cons!26341 (h!27559 (_ BitVec 64)) (t!39022 List!26345)) )
))
(declare-fun arrayNoDuplicates!0 (array!77563 (_ BitVec 32) List!26345) Bool)

(assert (=> b!1198208 (= res!797074 (arrayNoDuplicates!0 lt!543648 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun b!1198209 () Bool)

(declare-fun e!680829 () Bool)

(declare-fun mapRes!47396 () Bool)

(assert (=> b!1198209 (= e!680829 (and e!680828 mapRes!47396))))

(declare-fun condMapEmpty!47396 () Bool)

(declare-fun mapDefault!47396 () ValueCell!14477)

(assert (=> b!1198209 (= condMapEmpty!47396 (= (arr!37423 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14477)) mapDefault!47396)))))

(declare-fun res!797070 () Bool)

(assert (=> start!100542 (=> (not res!797070) (not e!680831))))

(assert (=> start!100542 (= res!797070 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37959 _keys!1208))))))

(assert (=> start!100542 e!680831))

(assert (=> start!100542 tp_is_empty!30373))

(declare-fun array_inv!28592 (array!77563) Bool)

(assert (=> start!100542 (array_inv!28592 _keys!1208)))

(assert (=> start!100542 true))

(assert (=> start!100542 tp!90026))

(declare-fun array_inv!28593 (array!77565) Bool)

(assert (=> start!100542 (and (array_inv!28593 _values!996) e!680829)))

(declare-fun call!57266 () ListLongMap!17521)

(declare-fun bm!57263 () Bool)

(declare-fun dynLambda!3191 (Int (_ BitVec 64)) V!45625)

(assert (=> bm!57263 (= call!57266 (getCurrentListMapNoExtraKeys!5243 lt!543648 (array!77566 (store (arr!37423 _values!996) i!673 (ValueCellFull!14477 (dynLambda!3191 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!680825 () Bool)

(declare-fun b!1198210 () Bool)

(declare-fun -!1776 (ListLongMap!17521 (_ BitVec 64)) ListLongMap!17521)

(assert (=> b!1198210 (= e!680825 (= call!57266 (-!1776 call!57265 k0!934)))))

(declare-fun b!1198211 () Bool)

(declare-fun e!680827 () Bool)

(assert (=> b!1198211 (= e!680827 true)))

(assert (=> b!1198211 e!680825))

(declare-fun c!117752 () Bool)

(assert (=> b!1198211 (= c!117752 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39659 0))(
  ( (Unit!39660) )
))
(declare-fun lt!543649 () Unit!39659)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!991 (array!77563 array!77565 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39659)

(assert (=> b!1198211 (= lt!543649 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198212 () Bool)

(assert (=> b!1198212 (= e!680825 (= call!57266 call!57265))))

(declare-fun b!1198213 () Bool)

(declare-fun res!797066 () Bool)

(assert (=> b!1198213 (=> (not res!797066) (not e!680831))))

(assert (=> b!1198213 (= res!797066 (and (= (size!37960 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37959 _keys!1208) (size!37960 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198214 () Bool)

(declare-fun res!797073 () Bool)

(assert (=> b!1198214 (=> (not res!797073) (not e!680831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198214 (= res!797073 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47396 () Bool)

(assert (=> mapIsEmpty!47396 mapRes!47396))

(declare-fun mapNonEmpty!47396 () Bool)

(declare-fun tp!90027 () Bool)

(assert (=> mapNonEmpty!47396 (= mapRes!47396 (and tp!90027 e!680826))))

(declare-fun mapValue!47396 () ValueCell!14477)

(declare-fun mapRest!47396 () (Array (_ BitVec 32) ValueCell!14477))

(declare-fun mapKey!47396 () (_ BitVec 32))

(assert (=> mapNonEmpty!47396 (= (arr!37423 _values!996) (store mapRest!47396 mapKey!47396 mapValue!47396))))

(declare-fun b!1198215 () Bool)

(declare-fun res!797075 () Bool)

(assert (=> b!1198215 (=> (not res!797075) (not e!680831))))

(assert (=> b!1198215 (= res!797075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198216 () Bool)

(declare-fun res!797069 () Bool)

(assert (=> b!1198216 (=> (not res!797069) (not e!680831))))

(assert (=> b!1198216 (= res!797069 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun b!1198217 () Bool)

(assert (=> b!1198217 (= e!680824 (not e!680827))))

(declare-fun res!797072 () Bool)

(assert (=> b!1198217 (=> res!797072 e!680827)))

(assert (=> b!1198217 (= res!797072 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198217 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543647 () Unit!39659)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77563 (_ BitVec 64) (_ BitVec 32)) Unit!39659)

(assert (=> b!1198217 (= lt!543647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100542 res!797070) b!1198204))

(assert (= (and b!1198204 res!797067) b!1198213))

(assert (= (and b!1198213 res!797066) b!1198215))

(assert (= (and b!1198215 res!797075) b!1198216))

(assert (= (and b!1198216 res!797069) b!1198205))

(assert (= (and b!1198205 res!797071) b!1198214))

(assert (= (and b!1198214 res!797073) b!1198207))

(assert (= (and b!1198207 res!797065) b!1198206))

(assert (= (and b!1198206 res!797068) b!1198208))

(assert (= (and b!1198208 res!797074) b!1198217))

(assert (= (and b!1198217 (not res!797072)) b!1198211))

(assert (= (and b!1198211 c!117752) b!1198210))

(assert (= (and b!1198211 (not c!117752)) b!1198212))

(assert (= (or b!1198210 b!1198212) bm!57263))

(assert (= (or b!1198210 b!1198212) bm!57262))

(assert (= (and b!1198209 condMapEmpty!47396) mapIsEmpty!47396))

(assert (= (and b!1198209 (not condMapEmpty!47396)) mapNonEmpty!47396))

(get-info :version)

(assert (= (and mapNonEmpty!47396 ((_ is ValueCellFull!14477) mapValue!47396)) b!1198202))

(assert (= (and b!1198209 ((_ is ValueCellFull!14477) mapDefault!47396)) b!1198203))

(assert (= start!100542 b!1198209))

(declare-fun b_lambda!20831 () Bool)

(assert (=> (not b_lambda!20831) (not bm!57263)))

(declare-fun t!39020 () Bool)

(declare-fun tb!10497 () Bool)

(assert (=> (and start!100542 (= defaultEntry!1004 defaultEntry!1004) t!39020) tb!10497))

(declare-fun result!21575 () Bool)

(assert (=> tb!10497 (= result!21575 tp_is_empty!30373)))

(assert (=> bm!57263 t!39020))

(declare-fun b_and!42257 () Bool)

(assert (= b_and!42255 (and (=> t!39020 result!21575) b_and!42257)))

(declare-fun m!1105587 () Bool)

(assert (=> b!1198214 m!1105587))

(declare-fun m!1105589 () Bool)

(assert (=> b!1198216 m!1105589))

(declare-fun m!1105591 () Bool)

(assert (=> mapNonEmpty!47396 m!1105591))

(declare-fun m!1105593 () Bool)

(assert (=> b!1198204 m!1105593))

(declare-fun m!1105595 () Bool)

(assert (=> b!1198215 m!1105595))

(declare-fun m!1105597 () Bool)

(assert (=> b!1198217 m!1105597))

(declare-fun m!1105599 () Bool)

(assert (=> b!1198217 m!1105599))

(declare-fun m!1105601 () Bool)

(assert (=> b!1198210 m!1105601))

(declare-fun m!1105603 () Bool)

(assert (=> b!1198208 m!1105603))

(declare-fun m!1105605 () Bool)

(assert (=> bm!57262 m!1105605))

(declare-fun m!1105607 () Bool)

(assert (=> b!1198211 m!1105607))

(declare-fun m!1105609 () Bool)

(assert (=> b!1198206 m!1105609))

(declare-fun m!1105611 () Bool)

(assert (=> b!1198206 m!1105611))

(declare-fun m!1105613 () Bool)

(assert (=> b!1198207 m!1105613))

(declare-fun m!1105615 () Bool)

(assert (=> start!100542 m!1105615))

(declare-fun m!1105617 () Bool)

(assert (=> start!100542 m!1105617))

(declare-fun m!1105619 () Bool)

(assert (=> bm!57263 m!1105619))

(declare-fun m!1105621 () Bool)

(assert (=> bm!57263 m!1105621))

(declare-fun m!1105623 () Bool)

(assert (=> bm!57263 m!1105623))

(check-sat (not b!1198211) (not b!1198204) (not b!1198208) b_and!42257 (not start!100542) (not b!1198214) (not b!1198215) (not b_next!25693) (not b!1198206) tp_is_empty!30373 (not bm!57263) (not mapNonEmpty!47396) (not bm!57262) (not b!1198217) (not b!1198216) (not b_lambda!20831) (not b!1198210))
(check-sat b_and!42257 (not b_next!25693))
