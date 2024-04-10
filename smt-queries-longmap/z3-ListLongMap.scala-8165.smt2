; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99858 () Bool)

(assert start!99858)

(declare-fun b_free!25437 () Bool)

(declare-fun b_next!25437 () Bool)

(assert (=> start!99858 (= b_free!25437 (not b_next!25437))))

(declare-fun tp!89025 () Bool)

(declare-fun b_and!41741 () Bool)

(assert (=> start!99858 (= tp!89025 b_and!41741)))

(declare-fun b!1187833 () Bool)

(declare-fun res!789738 () Bool)

(declare-fun e!675400 () Bool)

(assert (=> b!1187833 (=> (not res!789738) (not e!675400))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187833 (= res!789738 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46778 () Bool)

(declare-fun mapRes!46778 () Bool)

(declare-fun tp!89024 () Bool)

(declare-fun e!675395 () Bool)

(assert (=> mapNonEmpty!46778 (= mapRes!46778 (and tp!89024 e!675395))))

(declare-fun mapKey!46778 () (_ BitVec 32))

(declare-datatypes ((V!45083 0))(
  ( (V!45084 (val!15040 Int)) )
))
(declare-datatypes ((ValueCell!14274 0))(
  ( (ValueCellFull!14274 (v!17678 V!45083)) (EmptyCell!14274) )
))
(declare-fun mapRest!46778 () (Array (_ BitVec 32) ValueCell!14274))

(declare-datatypes ((array!76729 0))(
  ( (array!76730 (arr!37014 (Array (_ BitVec 32) ValueCell!14274)) (size!37550 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76729)

(declare-fun mapValue!46778 () ValueCell!14274)

(assert (=> mapNonEmpty!46778 (= (arr!37014 _values!996) (store mapRest!46778 mapKey!46778 mapValue!46778))))

(declare-fun mapIsEmpty!46778 () Bool)

(assert (=> mapIsEmpty!46778 mapRes!46778))

(declare-fun b!1187834 () Bool)

(declare-fun res!789740 () Bool)

(assert (=> b!1187834 (=> (not res!789740) (not e!675400))))

(declare-datatypes ((array!76731 0))(
  ( (array!76732 (arr!37015 (Array (_ BitVec 32) (_ BitVec 64))) (size!37551 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76731)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1187834 (= res!789740 (and (= (size!37550 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37551 _keys!1208) (size!37550 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187835 () Bool)

(declare-fun res!789735 () Bool)

(declare-fun e!675405 () Bool)

(assert (=> b!1187835 (=> (not res!789735) (not e!675405))))

(declare-fun lt!540212 () array!76731)

(declare-datatypes ((List!26050 0))(
  ( (Nil!26047) (Cons!26046 (h!27255 (_ BitVec 64)) (t!38479 List!26050)) )
))
(declare-fun arrayNoDuplicates!0 (array!76731 (_ BitVec 32) List!26050) Bool)

(assert (=> b!1187835 (= res!789735 (arrayNoDuplicates!0 lt!540212 #b00000000000000000000000000000000 Nil!26047))))

(declare-fun b!1187836 () Bool)

(declare-fun e!675396 () Bool)

(declare-fun e!675397 () Bool)

(assert (=> b!1187836 (= e!675396 e!675397)))

(declare-fun res!789737 () Bool)

(assert (=> b!1187836 (=> res!789737 e!675397)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1187836 (= res!789737 (not (validKeyInArray!0 (select (arr!37015 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19310 0))(
  ( (tuple2!19311 (_1!9666 (_ BitVec 64)) (_2!9666 V!45083)) )
))
(declare-datatypes ((List!26051 0))(
  ( (Nil!26048) (Cons!26047 (h!27256 tuple2!19310) (t!38480 List!26051)) )
))
(declare-datatypes ((ListLongMap!17279 0))(
  ( (ListLongMap!17280 (toList!8655 List!26051)) )
))
(declare-fun lt!540224 () ListLongMap!17279)

(declare-fun lt!540210 () ListLongMap!17279)

(assert (=> b!1187836 (= lt!540224 lt!540210)))

(declare-fun lt!540207 () ListLongMap!17279)

(declare-fun -!1686 (ListLongMap!17279 (_ BitVec 64)) ListLongMap!17279)

(assert (=> b!1187836 (= lt!540210 (-!1686 lt!540207 k0!934))))

(declare-fun zeroValue!944 () V!45083)

(declare-fun lt!540223 () array!76729)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45083)

(declare-fun getCurrentListMapNoExtraKeys!5096 (array!76731 array!76729 (_ BitVec 32) (_ BitVec 32) V!45083 V!45083 (_ BitVec 32) Int) ListLongMap!17279)

(assert (=> b!1187836 (= lt!540224 (getCurrentListMapNoExtraKeys!5096 lt!540212 lt!540223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187836 (= lt!540207 (getCurrentListMapNoExtraKeys!5096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39398 0))(
  ( (Unit!39399) )
))
(declare-fun lt!540214 () Unit!39398)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!896 (array!76731 array!76729 (_ BitVec 32) (_ BitVec 32) V!45083 V!45083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39398)

(assert (=> b!1187836 (= lt!540214 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187837 () Bool)

(declare-fun e!675401 () Bool)

(assert (=> b!1187837 (= e!675405 (not e!675401))))

(declare-fun res!789734 () Bool)

(assert (=> b!1187837 (=> res!789734 e!675401)))

(assert (=> b!1187837 (= res!789734 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187837 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540209 () Unit!39398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76731 (_ BitVec 64) (_ BitVec 32)) Unit!39398)

(assert (=> b!1187837 (= lt!540209 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187838 () Bool)

(declare-fun res!789739 () Bool)

(assert (=> b!1187838 (=> (not res!789739) (not e!675400))))

(assert (=> b!1187838 (= res!789739 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37551 _keys!1208))))))

(declare-fun b!1187839 () Bool)

(declare-fun res!789747 () Bool)

(assert (=> b!1187839 (=> (not res!789747) (not e!675400))))

(assert (=> b!1187839 (= res!789747 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26047))))

(declare-fun b!1187840 () Bool)

(declare-fun res!789744 () Bool)

(assert (=> b!1187840 (=> (not res!789744) (not e!675400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76731 (_ BitVec 32)) Bool)

(assert (=> b!1187840 (= res!789744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!675404 () Bool)

(declare-fun b!1187841 () Bool)

(assert (=> b!1187841 (= e!675404 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187842 () Bool)

(assert (=> b!1187842 (= e!675401 e!675396)))

(declare-fun res!789745 () Bool)

(assert (=> b!1187842 (=> res!789745 e!675396)))

(assert (=> b!1187842 (= res!789745 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540215 () ListLongMap!17279)

(assert (=> b!1187842 (= lt!540215 (getCurrentListMapNoExtraKeys!5096 lt!540212 lt!540223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540213 () V!45083)

(assert (=> b!1187842 (= lt!540223 (array!76730 (store (arr!37014 _values!996) i!673 (ValueCellFull!14274 lt!540213)) (size!37550 _values!996)))))

(declare-fun dynLambda!3042 (Int (_ BitVec 64)) V!45083)

(assert (=> b!1187842 (= lt!540213 (dynLambda!3042 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540225 () ListLongMap!17279)

(assert (=> b!1187842 (= lt!540225 (getCurrentListMapNoExtraKeys!5096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187844 () Bool)

(declare-fun e!675403 () Bool)

(declare-fun tp_is_empty!29967 () Bool)

(assert (=> b!1187844 (= e!675403 tp_is_empty!29967)))

(declare-fun b!1187845 () Bool)

(assert (=> b!1187845 (= e!675395 tp_is_empty!29967)))

(declare-fun b!1187846 () Bool)

(declare-fun e!675406 () Unit!39398)

(declare-fun Unit!39400 () Unit!39398)

(assert (=> b!1187846 (= e!675406 Unit!39400)))

(declare-fun b!1187847 () Bool)

(declare-fun Unit!39401 () Unit!39398)

(assert (=> b!1187847 (= e!675406 Unit!39401)))

(declare-fun lt!540221 () Unit!39398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76731 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39398)

(assert (=> b!1187847 (= lt!540221 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187847 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540211 () Unit!39398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76731 (_ BitVec 32) (_ BitVec 32)) Unit!39398)

(assert (=> b!1187847 (= lt!540211 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187847 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26047)))

(declare-fun lt!540208 () Unit!39398)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76731 (_ BitVec 64) (_ BitVec 32) List!26050) Unit!39398)

(assert (=> b!1187847 (= lt!540208 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26047))))

(assert (=> b!1187847 false))

(declare-fun b!1187848 () Bool)

(assert (=> b!1187848 (= e!675397 true)))

(declare-fun lt!540219 () ListLongMap!17279)

(declare-fun lt!540222 () ListLongMap!17279)

(assert (=> b!1187848 (= (-!1686 lt!540219 k0!934) lt!540222)))

(declare-fun lt!540216 () Unit!39398)

(declare-fun lt!540218 () V!45083)

(declare-fun addRemoveCommutativeForDiffKeys!205 (ListLongMap!17279 (_ BitVec 64) V!45083 (_ BitVec 64)) Unit!39398)

(assert (=> b!1187848 (= lt!540216 (addRemoveCommutativeForDiffKeys!205 lt!540207 (select (arr!37015 _keys!1208) from!1455) lt!540218 k0!934))))

(assert (=> b!1187848 (and (= lt!540225 lt!540219) (= lt!540210 lt!540224))))

(declare-fun lt!540217 () tuple2!19310)

(declare-fun +!3942 (ListLongMap!17279 tuple2!19310) ListLongMap!17279)

(assert (=> b!1187848 (= lt!540219 (+!3942 lt!540207 lt!540217))))

(assert (=> b!1187848 (not (= (select (arr!37015 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540220 () Unit!39398)

(assert (=> b!1187848 (= lt!540220 e!675406)))

(declare-fun c!117279 () Bool)

(assert (=> b!1187848 (= c!117279 (= (select (arr!37015 _keys!1208) from!1455) k0!934))))

(declare-fun e!675398 () Bool)

(assert (=> b!1187848 e!675398))

(declare-fun res!789748 () Bool)

(assert (=> b!1187848 (=> (not res!789748) (not e!675398))))

(assert (=> b!1187848 (= res!789748 (= lt!540215 lt!540222))))

(assert (=> b!1187848 (= lt!540222 (+!3942 lt!540210 lt!540217))))

(assert (=> b!1187848 (= lt!540217 (tuple2!19311 (select (arr!37015 _keys!1208) from!1455) lt!540218))))

(declare-fun get!18961 (ValueCell!14274 V!45083) V!45083)

(assert (=> b!1187848 (= lt!540218 (get!18961 (select (arr!37014 _values!996) from!1455) lt!540213))))

(declare-fun b!1187849 () Bool)

(assert (=> b!1187849 (= e!675400 e!675405)))

(declare-fun res!789736 () Bool)

(assert (=> b!1187849 (=> (not res!789736) (not e!675405))))

(assert (=> b!1187849 (= res!789736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540212 mask!1564))))

(assert (=> b!1187849 (= lt!540212 (array!76732 (store (arr!37015 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37551 _keys!1208)))))

(declare-fun b!1187850 () Bool)

(declare-fun res!789741 () Bool)

(assert (=> b!1187850 (=> (not res!789741) (not e!675400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187850 (= res!789741 (validMask!0 mask!1564))))

(declare-fun b!1187851 () Bool)

(declare-fun e!675399 () Bool)

(assert (=> b!1187851 (= e!675399 (and e!675403 mapRes!46778))))

(declare-fun condMapEmpty!46778 () Bool)

(declare-fun mapDefault!46778 () ValueCell!14274)

(assert (=> b!1187851 (= condMapEmpty!46778 (= (arr!37014 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14274)) mapDefault!46778)))))

(declare-fun b!1187852 () Bool)

(declare-fun res!789742 () Bool)

(assert (=> b!1187852 (=> (not res!789742) (not e!675400))))

(assert (=> b!1187852 (= res!789742 (= (select (arr!37015 _keys!1208) i!673) k0!934))))

(declare-fun b!1187843 () Bool)

(assert (=> b!1187843 (= e!675398 e!675404)))

(declare-fun res!789746 () Bool)

(assert (=> b!1187843 (=> res!789746 e!675404)))

(assert (=> b!1187843 (= res!789746 (not (= (select (arr!37015 _keys!1208) from!1455) k0!934)))))

(declare-fun res!789743 () Bool)

(assert (=> start!99858 (=> (not res!789743) (not e!675400))))

(assert (=> start!99858 (= res!789743 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37551 _keys!1208))))))

(assert (=> start!99858 e!675400))

(assert (=> start!99858 tp_is_empty!29967))

(declare-fun array_inv!28238 (array!76731) Bool)

(assert (=> start!99858 (array_inv!28238 _keys!1208)))

(assert (=> start!99858 true))

(assert (=> start!99858 tp!89025))

(declare-fun array_inv!28239 (array!76729) Bool)

(assert (=> start!99858 (and (array_inv!28239 _values!996) e!675399)))

(assert (= (and start!99858 res!789743) b!1187850))

(assert (= (and b!1187850 res!789741) b!1187834))

(assert (= (and b!1187834 res!789740) b!1187840))

(assert (= (and b!1187840 res!789744) b!1187839))

(assert (= (and b!1187839 res!789747) b!1187838))

(assert (= (and b!1187838 res!789739) b!1187833))

(assert (= (and b!1187833 res!789738) b!1187852))

(assert (= (and b!1187852 res!789742) b!1187849))

(assert (= (and b!1187849 res!789736) b!1187835))

(assert (= (and b!1187835 res!789735) b!1187837))

(assert (= (and b!1187837 (not res!789734)) b!1187842))

(assert (= (and b!1187842 (not res!789745)) b!1187836))

(assert (= (and b!1187836 (not res!789737)) b!1187848))

(assert (= (and b!1187848 res!789748) b!1187843))

(assert (= (and b!1187843 (not res!789746)) b!1187841))

(assert (= (and b!1187848 c!117279) b!1187847))

(assert (= (and b!1187848 (not c!117279)) b!1187846))

(assert (= (and b!1187851 condMapEmpty!46778) mapIsEmpty!46778))

(assert (= (and b!1187851 (not condMapEmpty!46778)) mapNonEmpty!46778))

(get-info :version)

(assert (= (and mapNonEmpty!46778 ((_ is ValueCellFull!14274) mapValue!46778)) b!1187845))

(assert (= (and b!1187851 ((_ is ValueCellFull!14274) mapDefault!46778)) b!1187844))

(assert (= start!99858 b!1187851))

(declare-fun b_lambda!20581 () Bool)

(assert (=> (not b_lambda!20581) (not b!1187842)))

(declare-fun t!38478 () Bool)

(declare-fun tb!10249 () Bool)

(assert (=> (and start!99858 (= defaultEntry!1004 defaultEntry!1004) t!38478) tb!10249))

(declare-fun result!21065 () Bool)

(assert (=> tb!10249 (= result!21065 tp_is_empty!29967)))

(assert (=> b!1187842 t!38478))

(declare-fun b_and!41743 () Bool)

(assert (= b_and!41741 (and (=> t!38478 result!21065) b_and!41743)))

(declare-fun m!1096555 () Bool)

(assert (=> b!1187852 m!1096555))

(declare-fun m!1096557 () Bool)

(assert (=> b!1187836 m!1096557))

(declare-fun m!1096559 () Bool)

(assert (=> b!1187836 m!1096559))

(declare-fun m!1096561 () Bool)

(assert (=> b!1187836 m!1096561))

(declare-fun m!1096563 () Bool)

(assert (=> b!1187836 m!1096563))

(declare-fun m!1096565 () Bool)

(assert (=> b!1187836 m!1096565))

(assert (=> b!1187836 m!1096563))

(declare-fun m!1096567 () Bool)

(assert (=> b!1187836 m!1096567))

(declare-fun m!1096569 () Bool)

(assert (=> b!1187850 m!1096569))

(declare-fun m!1096571 () Bool)

(assert (=> start!99858 m!1096571))

(declare-fun m!1096573 () Bool)

(assert (=> start!99858 m!1096573))

(declare-fun m!1096575 () Bool)

(assert (=> b!1187841 m!1096575))

(declare-fun m!1096577 () Bool)

(assert (=> b!1187839 m!1096577))

(assert (=> b!1187848 m!1096563))

(declare-fun m!1096579 () Bool)

(assert (=> b!1187848 m!1096579))

(declare-fun m!1096581 () Bool)

(assert (=> b!1187848 m!1096581))

(assert (=> b!1187848 m!1096581))

(declare-fun m!1096583 () Bool)

(assert (=> b!1187848 m!1096583))

(declare-fun m!1096585 () Bool)

(assert (=> b!1187848 m!1096585))

(declare-fun m!1096587 () Bool)

(assert (=> b!1187848 m!1096587))

(declare-fun m!1096589 () Bool)

(assert (=> b!1187848 m!1096589))

(assert (=> b!1187848 m!1096563))

(declare-fun m!1096591 () Bool)

(assert (=> b!1187837 m!1096591))

(declare-fun m!1096593 () Bool)

(assert (=> b!1187837 m!1096593))

(declare-fun m!1096595 () Bool)

(assert (=> b!1187833 m!1096595))

(declare-fun m!1096597 () Bool)

(assert (=> b!1187835 m!1096597))

(declare-fun m!1096599 () Bool)

(assert (=> b!1187840 m!1096599))

(declare-fun m!1096601 () Bool)

(assert (=> b!1187842 m!1096601))

(declare-fun m!1096603 () Bool)

(assert (=> b!1187842 m!1096603))

(declare-fun m!1096605 () Bool)

(assert (=> b!1187842 m!1096605))

(declare-fun m!1096607 () Bool)

(assert (=> b!1187842 m!1096607))

(declare-fun m!1096609 () Bool)

(assert (=> mapNonEmpty!46778 m!1096609))

(declare-fun m!1096611 () Bool)

(assert (=> b!1187847 m!1096611))

(declare-fun m!1096613 () Bool)

(assert (=> b!1187847 m!1096613))

(declare-fun m!1096615 () Bool)

(assert (=> b!1187847 m!1096615))

(declare-fun m!1096617 () Bool)

(assert (=> b!1187847 m!1096617))

(declare-fun m!1096619 () Bool)

(assert (=> b!1187847 m!1096619))

(declare-fun m!1096621 () Bool)

(assert (=> b!1187849 m!1096621))

(declare-fun m!1096623 () Bool)

(assert (=> b!1187849 m!1096623))

(assert (=> b!1187843 m!1096563))

(check-sat (not b!1187839) (not mapNonEmpty!46778) (not b!1187840) (not b!1187836) (not b_next!25437) (not b!1187850) (not b_lambda!20581) (not start!99858) (not b!1187833) (not b!1187848) (not b!1187847) b_and!41743 (not b!1187837) (not b!1187841) tp_is_empty!29967 (not b!1187849) (not b!1187842) (not b!1187835))
(check-sat b_and!41743 (not b_next!25437))
