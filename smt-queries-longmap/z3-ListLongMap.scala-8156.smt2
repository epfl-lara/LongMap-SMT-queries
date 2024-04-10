; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99804 () Bool)

(assert start!99804)

(declare-fun b_free!25383 () Bool)

(declare-fun b_next!25383 () Bool)

(assert (=> start!99804 (= b_free!25383 (not b_next!25383))))

(declare-fun tp!88862 () Bool)

(declare-fun b_and!41633 () Bool)

(assert (=> start!99804 (= tp!88862 b_and!41633)))

(declare-fun b!1186159 () Bool)

(declare-fun e!674425 () Bool)

(declare-fun e!674424 () Bool)

(assert (=> b!1186159 (= e!674425 e!674424)))

(declare-fun res!788519 () Bool)

(assert (=> b!1186159 (=> res!788519 e!674424)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186159 (= res!788519 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45011 0))(
  ( (V!45012 (val!15013 Int)) )
))
(declare-fun zeroValue!944 () V!45011)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14247 0))(
  ( (ValueCellFull!14247 (v!17651 V!45011)) (EmptyCell!14247) )
))
(declare-datatypes ((array!76623 0))(
  ( (array!76624 (arr!36961 (Array (_ BitVec 32) ValueCell!14247)) (size!37497 (_ BitVec 32))) )
))
(declare-fun lt!538683 () array!76623)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!76625 0))(
  ( (array!76626 (arr!36962 (Array (_ BitVec 32) (_ BitVec 64))) (size!37498 (_ BitVec 32))) )
))
(declare-fun lt!538685 () array!76625)

(declare-fun minValue!944 () V!45011)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19264 0))(
  ( (tuple2!19265 (_1!9643 (_ BitVec 64)) (_2!9643 V!45011)) )
))
(declare-datatypes ((List!26005 0))(
  ( (Nil!26002) (Cons!26001 (h!27210 tuple2!19264) (t!38380 List!26005)) )
))
(declare-datatypes ((ListLongMap!17233 0))(
  ( (ListLongMap!17234 (toList!8632 List!26005)) )
))
(declare-fun lt!538676 () ListLongMap!17233)

(declare-fun getCurrentListMapNoExtraKeys!5077 (array!76625 array!76623 (_ BitVec 32) (_ BitVec 32) V!45011 V!45011 (_ BitVec 32) Int) ListLongMap!17233)

(assert (=> b!1186159 (= lt!538676 (getCurrentListMapNoExtraKeys!5077 lt!538685 lt!538683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538677 () V!45011)

(declare-fun _values!996 () array!76623)

(assert (=> b!1186159 (= lt!538683 (array!76624 (store (arr!36961 _values!996) i!673 (ValueCellFull!14247 lt!538677)) (size!37497 _values!996)))))

(declare-fun dynLambda!3026 (Int (_ BitVec 64)) V!45011)

(assert (=> b!1186159 (= lt!538677 (dynLambda!3026 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76625)

(declare-fun lt!538668 () ListLongMap!17233)

(assert (=> b!1186159 (= lt!538668 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186160 () Bool)

(declare-fun e!674430 () Bool)

(declare-fun e!674428 () Bool)

(assert (=> b!1186160 (= e!674430 e!674428)))

(declare-fun res!788521 () Bool)

(assert (=> b!1186160 (=> res!788521 e!674428)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186160 (= res!788521 (not (= (select (arr!36962 _keys!1208) from!1455) k0!934)))))

(declare-fun res!788529 () Bool)

(declare-fun e!674431 () Bool)

(assert (=> start!99804 (=> (not res!788529) (not e!674431))))

(assert (=> start!99804 (= res!788529 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37498 _keys!1208))))))

(assert (=> start!99804 e!674431))

(declare-fun tp_is_empty!29913 () Bool)

(assert (=> start!99804 tp_is_empty!29913))

(declare-fun array_inv!28208 (array!76625) Bool)

(assert (=> start!99804 (array_inv!28208 _keys!1208)))

(assert (=> start!99804 true))

(assert (=> start!99804 tp!88862))

(declare-fun e!674423 () Bool)

(declare-fun array_inv!28209 (array!76623) Bool)

(assert (=> start!99804 (and (array_inv!28209 _values!996) e!674423)))

(declare-fun b!1186161 () Bool)

(declare-datatypes ((Unit!39314 0))(
  ( (Unit!39315) )
))
(declare-fun e!674429 () Unit!39314)

(declare-fun Unit!39316 () Unit!39314)

(assert (=> b!1186161 (= e!674429 Unit!39316)))

(declare-fun lt!538669 () Unit!39314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39314)

(assert (=> b!1186161 (= lt!538669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186161 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538678 () Unit!39314)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76625 (_ BitVec 32) (_ BitVec 32)) Unit!39314)

(assert (=> b!1186161 (= lt!538678 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26006 0))(
  ( (Nil!26003) (Cons!26002 (h!27211 (_ BitVec 64)) (t!38381 List!26006)) )
))
(declare-fun arrayNoDuplicates!0 (array!76625 (_ BitVec 32) List!26006) Bool)

(assert (=> b!1186161 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26003)))

(declare-fun lt!538679 () Unit!39314)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76625 (_ BitVec 64) (_ BitVec 32) List!26006) Unit!39314)

(assert (=> b!1186161 (= lt!538679 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26003))))

(assert (=> b!1186161 false))

(declare-fun b!1186162 () Bool)

(declare-fun res!788532 () Bool)

(assert (=> b!1186162 (=> (not res!788532) (not e!674431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186162 (= res!788532 (validMask!0 mask!1564))))

(declare-fun b!1186163 () Bool)

(declare-fun e!674433 () Bool)

(assert (=> b!1186163 (= e!674433 (not e!674425))))

(declare-fun res!788528 () Bool)

(assert (=> b!1186163 (=> res!788528 e!674425)))

(assert (=> b!1186163 (= res!788528 (bvsgt from!1455 i!673))))

(assert (=> b!1186163 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538684 () Unit!39314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76625 (_ BitVec 64) (_ BitVec 32)) Unit!39314)

(assert (=> b!1186163 (= lt!538684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186164 () Bool)

(declare-fun res!788527 () Bool)

(assert (=> b!1186164 (=> (not res!788527) (not e!674431))))

(assert (=> b!1186164 (= res!788527 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26003))))

(declare-fun b!1186165 () Bool)

(assert (=> b!1186165 (= e!674428 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186166 () Bool)

(declare-fun res!788524 () Bool)

(assert (=> b!1186166 (=> (not res!788524) (not e!674431))))

(assert (=> b!1186166 (= res!788524 (= (select (arr!36962 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46697 () Bool)

(declare-fun mapRes!46697 () Bool)

(declare-fun tp!88863 () Bool)

(declare-fun e!674432 () Bool)

(assert (=> mapNonEmpty!46697 (= mapRes!46697 (and tp!88863 e!674432))))

(declare-fun mapValue!46697 () ValueCell!14247)

(declare-fun mapKey!46697 () (_ BitVec 32))

(declare-fun mapRest!46697 () (Array (_ BitVec 32) ValueCell!14247))

(assert (=> mapNonEmpty!46697 (= (arr!36961 _values!996) (store mapRest!46697 mapKey!46697 mapValue!46697))))

(declare-fun b!1186167 () Bool)

(declare-fun res!788533 () Bool)

(assert (=> b!1186167 (=> (not res!788533) (not e!674431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76625 (_ BitVec 32)) Bool)

(assert (=> b!1186167 (= res!788533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186168 () Bool)

(declare-fun res!788530 () Bool)

(assert (=> b!1186168 (=> (not res!788530) (not e!674431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186168 (= res!788530 (validKeyInArray!0 k0!934))))

(declare-fun b!1186169 () Bool)

(declare-fun e!674434 () Bool)

(assert (=> b!1186169 (= e!674424 e!674434)))

(declare-fun res!788526 () Bool)

(assert (=> b!1186169 (=> res!788526 e!674434)))

(assert (=> b!1186169 (= res!788526 (not (validKeyInArray!0 (select (arr!36962 _keys!1208) from!1455))))))

(declare-fun lt!538681 () ListLongMap!17233)

(declare-fun lt!538673 () ListLongMap!17233)

(assert (=> b!1186169 (= lt!538681 lt!538673)))

(declare-fun lt!538674 () ListLongMap!17233)

(declare-fun -!1664 (ListLongMap!17233 (_ BitVec 64)) ListLongMap!17233)

(assert (=> b!1186169 (= lt!538673 (-!1664 lt!538674 k0!934))))

(assert (=> b!1186169 (= lt!538681 (getCurrentListMapNoExtraKeys!5077 lt!538685 lt!538683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186169 (= lt!538674 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538671 () Unit!39314)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 (array!76625 array!76623 (_ BitVec 32) (_ BitVec 32) V!45011 V!45011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39314)

(assert (=> b!1186169 (= lt!538671 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186170 () Bool)

(declare-fun res!788522 () Bool)

(assert (=> b!1186170 (=> (not res!788522) (not e!674433))))

(assert (=> b!1186170 (= res!788522 (arrayNoDuplicates!0 lt!538685 #b00000000000000000000000000000000 Nil!26003))))

(declare-fun mapIsEmpty!46697 () Bool)

(assert (=> mapIsEmpty!46697 mapRes!46697))

(declare-fun b!1186171 () Bool)

(declare-fun res!788523 () Bool)

(assert (=> b!1186171 (=> (not res!788523) (not e!674431))))

(assert (=> b!1186171 (= res!788523 (and (= (size!37497 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37498 _keys!1208) (size!37497 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186172 () Bool)

(declare-fun e!674427 () Bool)

(assert (=> b!1186172 (= e!674427 tp_is_empty!29913)))

(declare-fun b!1186173 () Bool)

(assert (=> b!1186173 (= e!674431 e!674433)))

(declare-fun res!788520 () Bool)

(assert (=> b!1186173 (=> (not res!788520) (not e!674433))))

(assert (=> b!1186173 (= res!788520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538685 mask!1564))))

(assert (=> b!1186173 (= lt!538685 (array!76626 (store (arr!36962 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37498 _keys!1208)))))

(declare-fun b!1186174 () Bool)

(declare-fun Unit!39317 () Unit!39314)

(assert (=> b!1186174 (= e!674429 Unit!39317)))

(declare-fun b!1186175 () Bool)

(assert (=> b!1186175 (= e!674423 (and e!674427 mapRes!46697))))

(declare-fun condMapEmpty!46697 () Bool)

(declare-fun mapDefault!46697 () ValueCell!14247)

(assert (=> b!1186175 (= condMapEmpty!46697 (= (arr!36961 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14247)) mapDefault!46697)))))

(declare-fun b!1186176 () Bool)

(assert (=> b!1186176 (= e!674434 true)))

(declare-fun lt!538670 () ListLongMap!17233)

(declare-fun lt!538675 () ListLongMap!17233)

(assert (=> b!1186176 (= (-!1664 lt!538670 k0!934) lt!538675)))

(declare-fun lt!538672 () V!45011)

(declare-fun lt!538680 () Unit!39314)

(declare-fun addRemoveCommutativeForDiffKeys!189 (ListLongMap!17233 (_ BitVec 64) V!45011 (_ BitVec 64)) Unit!39314)

(assert (=> b!1186176 (= lt!538680 (addRemoveCommutativeForDiffKeys!189 lt!538674 (select (arr!36962 _keys!1208) from!1455) lt!538672 k0!934))))

(assert (=> b!1186176 (and (= lt!538668 lt!538670) (= lt!538673 lt!538681))))

(declare-fun lt!538682 () tuple2!19264)

(declare-fun +!3926 (ListLongMap!17233 tuple2!19264) ListLongMap!17233)

(assert (=> b!1186176 (= lt!538670 (+!3926 lt!538674 lt!538682))))

(assert (=> b!1186176 (not (= (select (arr!36962 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538686 () Unit!39314)

(assert (=> b!1186176 (= lt!538686 e!674429)))

(declare-fun c!117198 () Bool)

(assert (=> b!1186176 (= c!117198 (= (select (arr!36962 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186176 e!674430))

(declare-fun res!788531 () Bool)

(assert (=> b!1186176 (=> (not res!788531) (not e!674430))))

(assert (=> b!1186176 (= res!788531 (= lt!538676 lt!538675))))

(assert (=> b!1186176 (= lt!538675 (+!3926 lt!538673 lt!538682))))

(assert (=> b!1186176 (= lt!538682 (tuple2!19265 (select (arr!36962 _keys!1208) from!1455) lt!538672))))

(declare-fun get!18927 (ValueCell!14247 V!45011) V!45011)

(assert (=> b!1186176 (= lt!538672 (get!18927 (select (arr!36961 _values!996) from!1455) lt!538677))))

(declare-fun b!1186177 () Bool)

(assert (=> b!1186177 (= e!674432 tp_is_empty!29913)))

(declare-fun b!1186178 () Bool)

(declare-fun res!788525 () Bool)

(assert (=> b!1186178 (=> (not res!788525) (not e!674431))))

(assert (=> b!1186178 (= res!788525 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37498 _keys!1208))))))

(assert (= (and start!99804 res!788529) b!1186162))

(assert (= (and b!1186162 res!788532) b!1186171))

(assert (= (and b!1186171 res!788523) b!1186167))

(assert (= (and b!1186167 res!788533) b!1186164))

(assert (= (and b!1186164 res!788527) b!1186178))

(assert (= (and b!1186178 res!788525) b!1186168))

(assert (= (and b!1186168 res!788530) b!1186166))

(assert (= (and b!1186166 res!788524) b!1186173))

(assert (= (and b!1186173 res!788520) b!1186170))

(assert (= (and b!1186170 res!788522) b!1186163))

(assert (= (and b!1186163 (not res!788528)) b!1186159))

(assert (= (and b!1186159 (not res!788519)) b!1186169))

(assert (= (and b!1186169 (not res!788526)) b!1186176))

(assert (= (and b!1186176 res!788531) b!1186160))

(assert (= (and b!1186160 (not res!788521)) b!1186165))

(assert (= (and b!1186176 c!117198) b!1186161))

(assert (= (and b!1186176 (not c!117198)) b!1186174))

(assert (= (and b!1186175 condMapEmpty!46697) mapIsEmpty!46697))

(assert (= (and b!1186175 (not condMapEmpty!46697)) mapNonEmpty!46697))

(get-info :version)

(assert (= (and mapNonEmpty!46697 ((_ is ValueCellFull!14247) mapValue!46697)) b!1186177))

(assert (= (and b!1186175 ((_ is ValueCellFull!14247) mapDefault!46697)) b!1186172))

(assert (= start!99804 b!1186175))

(declare-fun b_lambda!20527 () Bool)

(assert (=> (not b_lambda!20527) (not b!1186159)))

(declare-fun t!38379 () Bool)

(declare-fun tb!10195 () Bool)

(assert (=> (and start!99804 (= defaultEntry!1004 defaultEntry!1004) t!38379) tb!10195))

(declare-fun result!20957 () Bool)

(assert (=> tb!10195 (= result!20957 tp_is_empty!29913)))

(assert (=> b!1186159 t!38379))

(declare-fun b_and!41635 () Bool)

(assert (= b_and!41633 (and (=> t!38379 result!20957) b_and!41635)))

(declare-fun m!1094665 () Bool)

(assert (=> b!1186173 m!1094665))

(declare-fun m!1094667 () Bool)

(assert (=> b!1186173 m!1094667))

(declare-fun m!1094669 () Bool)

(assert (=> b!1186169 m!1094669))

(declare-fun m!1094671 () Bool)

(assert (=> b!1186169 m!1094671))

(declare-fun m!1094673 () Bool)

(assert (=> b!1186169 m!1094673))

(declare-fun m!1094675 () Bool)

(assert (=> b!1186169 m!1094675))

(declare-fun m!1094677 () Bool)

(assert (=> b!1186169 m!1094677))

(declare-fun m!1094679 () Bool)

(assert (=> b!1186169 m!1094679))

(assert (=> b!1186169 m!1094677))

(declare-fun m!1094681 () Bool)

(assert (=> b!1186165 m!1094681))

(declare-fun m!1094683 () Bool)

(assert (=> b!1186167 m!1094683))

(declare-fun m!1094685 () Bool)

(assert (=> b!1186162 m!1094685))

(declare-fun m!1094687 () Bool)

(assert (=> b!1186166 m!1094687))

(declare-fun m!1094689 () Bool)

(assert (=> b!1186164 m!1094689))

(declare-fun m!1094691 () Bool)

(assert (=> b!1186176 m!1094691))

(assert (=> b!1186176 m!1094691))

(declare-fun m!1094693 () Bool)

(assert (=> b!1186176 m!1094693))

(declare-fun m!1094695 () Bool)

(assert (=> b!1186176 m!1094695))

(declare-fun m!1094697 () Bool)

(assert (=> b!1186176 m!1094697))

(assert (=> b!1186176 m!1094677))

(assert (=> b!1186176 m!1094677))

(declare-fun m!1094699 () Bool)

(assert (=> b!1186176 m!1094699))

(declare-fun m!1094701 () Bool)

(assert (=> b!1186176 m!1094701))

(declare-fun m!1094703 () Bool)

(assert (=> b!1186161 m!1094703))

(declare-fun m!1094705 () Bool)

(assert (=> b!1186161 m!1094705))

(declare-fun m!1094707 () Bool)

(assert (=> b!1186161 m!1094707))

(declare-fun m!1094709 () Bool)

(assert (=> b!1186161 m!1094709))

(declare-fun m!1094711 () Bool)

(assert (=> b!1186161 m!1094711))

(declare-fun m!1094713 () Bool)

(assert (=> b!1186159 m!1094713))

(declare-fun m!1094715 () Bool)

(assert (=> b!1186159 m!1094715))

(declare-fun m!1094717 () Bool)

(assert (=> b!1186159 m!1094717))

(declare-fun m!1094719 () Bool)

(assert (=> b!1186159 m!1094719))

(declare-fun m!1094721 () Bool)

(assert (=> b!1186170 m!1094721))

(assert (=> b!1186160 m!1094677))

(declare-fun m!1094723 () Bool)

(assert (=> mapNonEmpty!46697 m!1094723))

(declare-fun m!1094725 () Bool)

(assert (=> b!1186168 m!1094725))

(declare-fun m!1094727 () Bool)

(assert (=> start!99804 m!1094727))

(declare-fun m!1094729 () Bool)

(assert (=> start!99804 m!1094729))

(declare-fun m!1094731 () Bool)

(assert (=> b!1186163 m!1094731))

(declare-fun m!1094733 () Bool)

(assert (=> b!1186163 m!1094733))

(check-sat b_and!41635 (not b!1186161) (not b!1186167) (not mapNonEmpty!46697) (not b!1186168) tp_is_empty!29913 (not b!1186162) (not start!99804) (not b!1186170) (not b!1186164) (not b!1186176) (not b!1186163) (not b!1186165) (not b_lambda!20527) (not b!1186169) (not b_next!25383) (not b!1186159) (not b!1186173))
(check-sat b_and!41635 (not b_next!25383))
