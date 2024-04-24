; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100260 () Bool)

(assert start!100260)

(declare-fun b_free!25603 () Bool)

(declare-fun b_next!25603 () Bool)

(assert (=> start!100260 (= b_free!25603 (not b_next!25603))))

(declare-fun tp!89522 () Bool)

(declare-fun b_and!42075 () Bool)

(assert (=> start!100260 (= tp!89522 b_and!42075)))

(declare-fun b!1193133 () Bool)

(declare-fun res!793305 () Bool)

(declare-fun e!678307 () Bool)

(assert (=> b!1193133 (=> (not res!793305) (not e!678307))))

(declare-datatypes ((array!77097 0))(
  ( (array!77098 (arr!37192 (Array (_ BitVec 32) (_ BitVec 64))) (size!37729 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77097)

(declare-datatypes ((List!26214 0))(
  ( (Nil!26211) (Cons!26210 (h!27428 (_ BitVec 64)) (t!38801 List!26214)) )
))
(declare-fun arrayNoDuplicates!0 (array!77097 (_ BitVec 32) List!26214) Bool)

(assert (=> b!1193133 (= res!793305 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26211))))

(declare-fun b!1193134 () Bool)

(declare-fun res!793299 () Bool)

(assert (=> b!1193134 (=> (not res!793299) (not e!678307))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77097 (_ BitVec 32)) Bool)

(assert (=> b!1193134 (= res!793299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193135 () Bool)

(declare-fun e!678312 () Bool)

(assert (=> b!1193135 (= e!678307 e!678312)))

(declare-fun res!793304 () Bool)

(assert (=> b!1193135 (=> (not res!793304) (not e!678312))))

(declare-fun lt!542472 () array!77097)

(assert (=> b!1193135 (= res!793304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542472 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193135 (= lt!542472 (array!77098 (store (arr!37192 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37729 _keys!1208)))))

(declare-fun b!1193136 () Bool)

(declare-fun res!793300 () Bool)

(assert (=> b!1193136 (=> (not res!793300) (not e!678307))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45305 0))(
  ( (V!45306 (val!15123 Int)) )
))
(declare-datatypes ((ValueCell!14357 0))(
  ( (ValueCellFull!14357 (v!17757 V!45305)) (EmptyCell!14357) )
))
(declare-datatypes ((array!77099 0))(
  ( (array!77100 (arr!37193 (Array (_ BitVec 32) ValueCell!14357)) (size!37730 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77099)

(assert (=> b!1193136 (= res!793300 (and (= (size!37730 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37729 _keys!1208) (size!37730 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!793301 () Bool)

(assert (=> start!100260 (=> (not res!793301) (not e!678307))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100260 (= res!793301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37729 _keys!1208))))))

(assert (=> start!100260 e!678307))

(declare-fun tp_is_empty!30133 () Bool)

(assert (=> start!100260 tp_is_empty!30133))

(declare-fun array_inv!28422 (array!77097) Bool)

(assert (=> start!100260 (array_inv!28422 _keys!1208)))

(assert (=> start!100260 true))

(assert (=> start!100260 tp!89522))

(declare-fun e!678314 () Bool)

(declare-fun array_inv!28423 (array!77099) Bool)

(assert (=> start!100260 (and (array_inv!28423 _values!996) e!678314)))

(declare-fun b!1193137 () Bool)

(declare-fun res!793298 () Bool)

(assert (=> b!1193137 (=> (not res!793298) (not e!678307))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1193137 (= res!793298 (= (select (arr!37192 _keys!1208) i!673) k0!934))))

(declare-fun b!1193138 () Bool)

(declare-fun res!793302 () Bool)

(assert (=> b!1193138 (=> (not res!793302) (not e!678312))))

(assert (=> b!1193138 (= res!793302 (arrayNoDuplicates!0 lt!542472 #b00000000000000000000000000000000 Nil!26211))))

(declare-fun b!1193139 () Bool)

(declare-fun e!678310 () Bool)

(assert (=> b!1193139 (= e!678312 (not e!678310))))

(declare-fun res!793297 () Bool)

(assert (=> b!1193139 (=> res!793297 e!678310)))

(assert (=> b!1193139 (= res!793297 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193139 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39519 0))(
  ( (Unit!39520) )
))
(declare-fun lt!542475 () Unit!39519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77097 (_ BitVec 64) (_ BitVec 32)) Unit!39519)

(assert (=> b!1193139 (= lt!542475 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193140 () Bool)

(declare-fun e!678308 () Bool)

(assert (=> b!1193140 (= e!678308 true)))

(declare-fun zeroValue!944 () V!45305)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542474 () array!77099)

(declare-fun minValue!944 () V!45305)

(declare-datatypes ((tuple2!19470 0))(
  ( (tuple2!19471 (_1!9746 (_ BitVec 64)) (_2!9746 V!45305)) )
))
(declare-datatypes ((List!26215 0))(
  ( (Nil!26212) (Cons!26211 (h!27429 tuple2!19470) (t!38802 List!26215)) )
))
(declare-datatypes ((ListLongMap!17447 0))(
  ( (ListLongMap!17448 (toList!8739 List!26215)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5207 (array!77097 array!77099 (_ BitVec 32) (_ BitVec 32) V!45305 V!45305 (_ BitVec 32) Int) ListLongMap!17447)

(declare-fun -!1746 (ListLongMap!17447 (_ BitVec 64)) ListLongMap!17447)

(assert (=> b!1193140 (= (getCurrentListMapNoExtraKeys!5207 lt!542472 lt!542474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1746 (getCurrentListMapNoExtraKeys!5207 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542471 () Unit!39519)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!961 (array!77097 array!77099 (_ BitVec 32) (_ BitVec 32) V!45305 V!45305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39519)

(assert (=> b!1193140 (= lt!542471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!961 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193141 () Bool)

(assert (=> b!1193141 (= e!678310 e!678308)))

(declare-fun res!793306 () Bool)

(assert (=> b!1193141 (=> res!793306 e!678308)))

(assert (=> b!1193141 (= res!793306 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542476 () ListLongMap!17447)

(assert (=> b!1193141 (= lt!542476 (getCurrentListMapNoExtraKeys!5207 lt!542472 lt!542474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3159 (Int (_ BitVec 64)) V!45305)

(assert (=> b!1193141 (= lt!542474 (array!77100 (store (arr!37193 _values!996) i!673 (ValueCellFull!14357 (dynLambda!3159 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37730 _values!996)))))

(declare-fun lt!542473 () ListLongMap!17447)

(assert (=> b!1193141 (= lt!542473 (getCurrentListMapNoExtraKeys!5207 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193142 () Bool)

(declare-fun res!793307 () Bool)

(assert (=> b!1193142 (=> (not res!793307) (not e!678307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193142 (= res!793307 (validKeyInArray!0 k0!934))))

(declare-fun b!1193143 () Bool)

(declare-fun e!678309 () Bool)

(assert (=> b!1193143 (= e!678309 tp_is_empty!30133)))

(declare-fun mapNonEmpty!47027 () Bool)

(declare-fun mapRes!47027 () Bool)

(declare-fun tp!89523 () Bool)

(assert (=> mapNonEmpty!47027 (= mapRes!47027 (and tp!89523 e!678309))))

(declare-fun mapRest!47027 () (Array (_ BitVec 32) ValueCell!14357))

(declare-fun mapKey!47027 () (_ BitVec 32))

(declare-fun mapValue!47027 () ValueCell!14357)

(assert (=> mapNonEmpty!47027 (= (arr!37193 _values!996) (store mapRest!47027 mapKey!47027 mapValue!47027))))

(declare-fun b!1193144 () Bool)

(declare-fun e!678313 () Bool)

(assert (=> b!1193144 (= e!678313 tp_is_empty!30133)))

(declare-fun b!1193145 () Bool)

(assert (=> b!1193145 (= e!678314 (and e!678313 mapRes!47027))))

(declare-fun condMapEmpty!47027 () Bool)

(declare-fun mapDefault!47027 () ValueCell!14357)

(assert (=> b!1193145 (= condMapEmpty!47027 (= (arr!37193 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14357)) mapDefault!47027)))))

(declare-fun b!1193146 () Bool)

(declare-fun res!793303 () Bool)

(assert (=> b!1193146 (=> (not res!793303) (not e!678307))))

(assert (=> b!1193146 (= res!793303 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37729 _keys!1208))))))

(declare-fun b!1193147 () Bool)

(declare-fun res!793296 () Bool)

(assert (=> b!1193147 (=> (not res!793296) (not e!678307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193147 (= res!793296 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47027 () Bool)

(assert (=> mapIsEmpty!47027 mapRes!47027))

(assert (= (and start!100260 res!793301) b!1193147))

(assert (= (and b!1193147 res!793296) b!1193136))

(assert (= (and b!1193136 res!793300) b!1193134))

(assert (= (and b!1193134 res!793299) b!1193133))

(assert (= (and b!1193133 res!793305) b!1193146))

(assert (= (and b!1193146 res!793303) b!1193142))

(assert (= (and b!1193142 res!793307) b!1193137))

(assert (= (and b!1193137 res!793298) b!1193135))

(assert (= (and b!1193135 res!793304) b!1193138))

(assert (= (and b!1193138 res!793302) b!1193139))

(assert (= (and b!1193139 (not res!793297)) b!1193141))

(assert (= (and b!1193141 (not res!793306)) b!1193140))

(assert (= (and b!1193145 condMapEmpty!47027) mapIsEmpty!47027))

(assert (= (and b!1193145 (not condMapEmpty!47027)) mapNonEmpty!47027))

(get-info :version)

(assert (= (and mapNonEmpty!47027 ((_ is ValueCellFull!14357) mapValue!47027)) b!1193143))

(assert (= (and b!1193145 ((_ is ValueCellFull!14357) mapDefault!47027)) b!1193144))

(assert (= start!100260 b!1193145))

(declare-fun b_lambda!20741 () Bool)

(assert (=> (not b_lambda!20741) (not b!1193141)))

(declare-fun t!38800 () Bool)

(declare-fun tb!10407 () Bool)

(assert (=> (and start!100260 (= defaultEntry!1004 defaultEntry!1004) t!38800) tb!10407))

(declare-fun result!21389 () Bool)

(assert (=> tb!10407 (= result!21389 tp_is_empty!30133)))

(assert (=> b!1193141 t!38800))

(declare-fun b_and!42077 () Bool)

(assert (= b_and!42075 (and (=> t!38800 result!21389) b_and!42077)))

(declare-fun m!1101837 () Bool)

(assert (=> b!1193141 m!1101837))

(declare-fun m!1101839 () Bool)

(assert (=> b!1193141 m!1101839))

(declare-fun m!1101841 () Bool)

(assert (=> b!1193141 m!1101841))

(declare-fun m!1101843 () Bool)

(assert (=> b!1193141 m!1101843))

(declare-fun m!1101845 () Bool)

(assert (=> b!1193137 m!1101845))

(declare-fun m!1101847 () Bool)

(assert (=> b!1193135 m!1101847))

(declare-fun m!1101849 () Bool)

(assert (=> b!1193135 m!1101849))

(declare-fun m!1101851 () Bool)

(assert (=> b!1193133 m!1101851))

(declare-fun m!1101853 () Bool)

(assert (=> b!1193140 m!1101853))

(declare-fun m!1101855 () Bool)

(assert (=> b!1193140 m!1101855))

(assert (=> b!1193140 m!1101855))

(declare-fun m!1101857 () Bool)

(assert (=> b!1193140 m!1101857))

(declare-fun m!1101859 () Bool)

(assert (=> b!1193140 m!1101859))

(declare-fun m!1101861 () Bool)

(assert (=> b!1193138 m!1101861))

(declare-fun m!1101863 () Bool)

(assert (=> b!1193134 m!1101863))

(declare-fun m!1101865 () Bool)

(assert (=> b!1193147 m!1101865))

(declare-fun m!1101867 () Bool)

(assert (=> start!100260 m!1101867))

(declare-fun m!1101869 () Bool)

(assert (=> start!100260 m!1101869))

(declare-fun m!1101871 () Bool)

(assert (=> b!1193139 m!1101871))

(declare-fun m!1101873 () Bool)

(assert (=> b!1193139 m!1101873))

(declare-fun m!1101875 () Bool)

(assert (=> mapNonEmpty!47027 m!1101875))

(declare-fun m!1101877 () Bool)

(assert (=> b!1193142 m!1101877))

(check-sat (not b_next!25603) (not b!1193140) (not b!1193134) (not start!100260) (not b_lambda!20741) (not b!1193147) (not b!1193138) tp_is_empty!30133 b_and!42077 (not b!1193133) (not b!1193142) (not mapNonEmpty!47027) (not b!1193139) (not b!1193135) (not b!1193141))
(check-sat b_and!42077 (not b_next!25603))
