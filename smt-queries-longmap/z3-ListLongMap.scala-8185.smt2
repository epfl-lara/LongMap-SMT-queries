; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99970 () Bool)

(assert start!99970)

(declare-fun b_free!25555 () Bool)

(declare-fun b_next!25555 () Bool)

(assert (=> start!99970 (= b_free!25555 (not b_next!25555))))

(declare-fun tp!89379 () Bool)

(declare-fun b_and!41955 () Bool)

(assert (=> start!99970 (= tp!89379 b_and!41955)))

(declare-fun b!1190592 () Bool)

(declare-fun e!676828 () Bool)

(assert (=> b!1190592 (= e!676828 true)))

(declare-datatypes ((V!45241 0))(
  ( (V!45242 (val!15099 Int)) )
))
(declare-fun zeroValue!944 () V!45241)

(declare-datatypes ((array!76894 0))(
  ( (array!76895 (arr!37097 (Array (_ BitVec 32) (_ BitVec 64))) (size!37635 (_ BitVec 32))) )
))
(declare-fun lt!541366 () array!76894)

(declare-fun _keys!1208 () array!76894)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14333 0))(
  ( (ValueCellFull!14333 (v!17736 V!45241)) (EmptyCell!14333) )
))
(declare-datatypes ((array!76896 0))(
  ( (array!76897 (arr!37098 (Array (_ BitVec 32) ValueCell!14333)) (size!37636 (_ BitVec 32))) )
))
(declare-fun lt!541364 () array!76896)

(declare-fun _values!996 () array!76896)

(declare-fun minValue!944 () V!45241)

(declare-datatypes ((tuple2!19512 0))(
  ( (tuple2!19513 (_1!9767 (_ BitVec 64)) (_2!9767 V!45241)) )
))
(declare-datatypes ((List!26226 0))(
  ( (Nil!26223) (Cons!26222 (h!27431 tuple2!19512) (t!38764 List!26226)) )
))
(declare-datatypes ((ListLongMap!17481 0))(
  ( (ListLongMap!17482 (toList!8756 List!26226)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5206 (array!76894 array!76896 (_ BitVec 32) (_ BitVec 32) V!45241 V!45241 (_ BitVec 32) Int) ListLongMap!17481)

(declare-fun -!1701 (ListLongMap!17481 (_ BitVec 64)) ListLongMap!17481)

(assert (=> b!1190592 (= (getCurrentListMapNoExtraKeys!5206 lt!541366 lt!541364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1701 (getCurrentListMapNoExtraKeys!5206 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39375 0))(
  ( (Unit!39376) )
))
(declare-fun lt!541363 () Unit!39375)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 (array!76894 array!76896 (_ BitVec 32) (_ BitVec 32) V!45241 V!45241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39375)

(assert (=> b!1190592 (= lt!541363 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190593 () Bool)

(declare-fun res!791869 () Bool)

(declare-fun e!676825 () Bool)

(assert (=> b!1190593 (=> (not res!791869) (not e!676825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76894 (_ BitVec 32)) Bool)

(assert (=> b!1190593 (= res!791869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46955 () Bool)

(declare-fun mapRes!46955 () Bool)

(declare-fun tp!89378 () Bool)

(declare-fun e!676821 () Bool)

(assert (=> mapNonEmpty!46955 (= mapRes!46955 (and tp!89378 e!676821))))

(declare-fun mapValue!46955 () ValueCell!14333)

(declare-fun mapRest!46955 () (Array (_ BitVec 32) ValueCell!14333))

(declare-fun mapKey!46955 () (_ BitVec 32))

(assert (=> mapNonEmpty!46955 (= (arr!37098 _values!996) (store mapRest!46955 mapKey!46955 mapValue!46955))))

(declare-fun b!1190594 () Bool)

(declare-fun res!791866 () Bool)

(assert (=> b!1190594 (=> (not res!791866) (not e!676825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190594 (= res!791866 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46955 () Bool)

(assert (=> mapIsEmpty!46955 mapRes!46955))

(declare-fun b!1190595 () Bool)

(declare-fun tp_is_empty!30085 () Bool)

(assert (=> b!1190595 (= e!676821 tp_is_empty!30085)))

(declare-fun b!1190596 () Bool)

(declare-fun res!791862 () Bool)

(assert (=> b!1190596 (=> (not res!791862) (not e!676825))))

(declare-datatypes ((List!26227 0))(
  ( (Nil!26224) (Cons!26223 (h!27432 (_ BitVec 64)) (t!38765 List!26227)) )
))
(declare-fun arrayNoDuplicates!0 (array!76894 (_ BitVec 32) List!26227) Bool)

(assert (=> b!1190596 (= res!791862 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26224))))

(declare-fun b!1190597 () Bool)

(declare-fun e!676826 () Bool)

(declare-fun e!676827 () Bool)

(assert (=> b!1190597 (= e!676826 (not e!676827))))

(declare-fun res!791861 () Bool)

(assert (=> b!1190597 (=> res!791861 e!676827)))

(assert (=> b!1190597 (= res!791861 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190597 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541368 () Unit!39375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76894 (_ BitVec 64) (_ BitVec 32)) Unit!39375)

(assert (=> b!1190597 (= lt!541368 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190598 () Bool)

(declare-fun res!791865 () Bool)

(assert (=> b!1190598 (=> (not res!791865) (not e!676826))))

(assert (=> b!1190598 (= res!791865 (arrayNoDuplicates!0 lt!541366 #b00000000000000000000000000000000 Nil!26224))))

(declare-fun b!1190599 () Bool)

(assert (=> b!1190599 (= e!676825 e!676826)))

(declare-fun res!791864 () Bool)

(assert (=> b!1190599 (=> (not res!791864) (not e!676826))))

(assert (=> b!1190599 (= res!791864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541366 mask!1564))))

(assert (=> b!1190599 (= lt!541366 (array!76895 (store (arr!37097 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37635 _keys!1208)))))

(declare-fun b!1190600 () Bool)

(declare-fun res!791863 () Bool)

(assert (=> b!1190600 (=> (not res!791863) (not e!676825))))

(assert (=> b!1190600 (= res!791863 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37635 _keys!1208))))))

(declare-fun res!791860 () Bool)

(assert (=> start!99970 (=> (not res!791860) (not e!676825))))

(assert (=> start!99970 (= res!791860 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37635 _keys!1208))))))

(assert (=> start!99970 e!676825))

(assert (=> start!99970 tp_is_empty!30085))

(declare-fun array_inv!28416 (array!76894) Bool)

(assert (=> start!99970 (array_inv!28416 _keys!1208)))

(assert (=> start!99970 true))

(assert (=> start!99970 tp!89379))

(declare-fun e!676824 () Bool)

(declare-fun array_inv!28417 (array!76896) Bool)

(assert (=> start!99970 (and (array_inv!28417 _values!996) e!676824)))

(declare-fun b!1190601 () Bool)

(declare-fun e!676822 () Bool)

(assert (=> b!1190601 (= e!676824 (and e!676822 mapRes!46955))))

(declare-fun condMapEmpty!46955 () Bool)

(declare-fun mapDefault!46955 () ValueCell!14333)

(assert (=> b!1190601 (= condMapEmpty!46955 (= (arr!37098 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14333)) mapDefault!46955)))))

(declare-fun b!1190602 () Bool)

(assert (=> b!1190602 (= e!676827 e!676828)))

(declare-fun res!791868 () Bool)

(assert (=> b!1190602 (=> res!791868 e!676828)))

(assert (=> b!1190602 (= res!791868 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541365 () ListLongMap!17481)

(assert (=> b!1190602 (= lt!541365 (getCurrentListMapNoExtraKeys!5206 lt!541366 lt!541364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3097 (Int (_ BitVec 64)) V!45241)

(assert (=> b!1190602 (= lt!541364 (array!76897 (store (arr!37098 _values!996) i!673 (ValueCellFull!14333 (dynLambda!3097 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37636 _values!996)))))

(declare-fun lt!541367 () ListLongMap!17481)

(assert (=> b!1190602 (= lt!541367 (getCurrentListMapNoExtraKeys!5206 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190603 () Bool)

(declare-fun res!791859 () Bool)

(assert (=> b!1190603 (=> (not res!791859) (not e!676825))))

(assert (=> b!1190603 (= res!791859 (and (= (size!37636 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37635 _keys!1208) (size!37636 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190604 () Bool)

(declare-fun res!791858 () Bool)

(assert (=> b!1190604 (=> (not res!791858) (not e!676825))))

(assert (=> b!1190604 (= res!791858 (= (select (arr!37097 _keys!1208) i!673) k0!934))))

(declare-fun b!1190605 () Bool)

(declare-fun res!791867 () Bool)

(assert (=> b!1190605 (=> (not res!791867) (not e!676825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190605 (= res!791867 (validKeyInArray!0 k0!934))))

(declare-fun b!1190606 () Bool)

(assert (=> b!1190606 (= e!676822 tp_is_empty!30085)))

(assert (= (and start!99970 res!791860) b!1190594))

(assert (= (and b!1190594 res!791866) b!1190603))

(assert (= (and b!1190603 res!791859) b!1190593))

(assert (= (and b!1190593 res!791869) b!1190596))

(assert (= (and b!1190596 res!791862) b!1190600))

(assert (= (and b!1190600 res!791863) b!1190605))

(assert (= (and b!1190605 res!791867) b!1190604))

(assert (= (and b!1190604 res!791858) b!1190599))

(assert (= (and b!1190599 res!791864) b!1190598))

(assert (= (and b!1190598 res!791865) b!1190597))

(assert (= (and b!1190597 (not res!791861)) b!1190602))

(assert (= (and b!1190602 (not res!791868)) b!1190592))

(assert (= (and b!1190601 condMapEmpty!46955) mapIsEmpty!46955))

(assert (= (and b!1190601 (not condMapEmpty!46955)) mapNonEmpty!46955))

(get-info :version)

(assert (= (and mapNonEmpty!46955 ((_ is ValueCellFull!14333) mapValue!46955)) b!1190595))

(assert (= (and b!1190601 ((_ is ValueCellFull!14333) mapDefault!46955)) b!1190606))

(assert (= start!99970 b!1190601))

(declare-fun b_lambda!20681 () Bool)

(assert (=> (not b_lambda!20681) (not b!1190602)))

(declare-fun t!38763 () Bool)

(declare-fun tb!10359 () Bool)

(assert (=> (and start!99970 (= defaultEntry!1004 defaultEntry!1004) t!38763) tb!10359))

(declare-fun result!21293 () Bool)

(assert (=> tb!10359 (= result!21293 tp_is_empty!30085)))

(assert (=> b!1190602 t!38763))

(declare-fun b_and!41957 () Bool)

(assert (= b_and!41955 (and (=> t!38763 result!21293) b_and!41957)))

(declare-fun m!1098647 () Bool)

(assert (=> b!1190592 m!1098647))

(declare-fun m!1098649 () Bool)

(assert (=> b!1190592 m!1098649))

(assert (=> b!1190592 m!1098649))

(declare-fun m!1098651 () Bool)

(assert (=> b!1190592 m!1098651))

(declare-fun m!1098653 () Bool)

(assert (=> b!1190592 m!1098653))

(declare-fun m!1098655 () Bool)

(assert (=> b!1190604 m!1098655))

(declare-fun m!1098657 () Bool)

(assert (=> b!1190602 m!1098657))

(declare-fun m!1098659 () Bool)

(assert (=> b!1190602 m!1098659))

(declare-fun m!1098661 () Bool)

(assert (=> b!1190602 m!1098661))

(declare-fun m!1098663 () Bool)

(assert (=> b!1190602 m!1098663))

(declare-fun m!1098665 () Bool)

(assert (=> b!1190596 m!1098665))

(declare-fun m!1098667 () Bool)

(assert (=> b!1190599 m!1098667))

(declare-fun m!1098669 () Bool)

(assert (=> b!1190599 m!1098669))

(declare-fun m!1098671 () Bool)

(assert (=> mapNonEmpty!46955 m!1098671))

(declare-fun m!1098673 () Bool)

(assert (=> b!1190597 m!1098673))

(declare-fun m!1098675 () Bool)

(assert (=> b!1190597 m!1098675))

(declare-fun m!1098677 () Bool)

(assert (=> start!99970 m!1098677))

(declare-fun m!1098679 () Bool)

(assert (=> start!99970 m!1098679))

(declare-fun m!1098681 () Bool)

(assert (=> b!1190605 m!1098681))

(declare-fun m!1098683 () Bool)

(assert (=> b!1190598 m!1098683))

(declare-fun m!1098685 () Bool)

(assert (=> b!1190593 m!1098685))

(declare-fun m!1098687 () Bool)

(assert (=> b!1190594 m!1098687))

(check-sat b_and!41957 (not b_next!25555) (not mapNonEmpty!46955) (not b!1190599) tp_is_empty!30085 (not b!1190592) (not b_lambda!20681) (not start!99970) (not b!1190596) (not b!1190594) (not b!1190602) (not b!1190598) (not b!1190593) (not b!1190597) (not b!1190605))
(check-sat b_and!41957 (not b_next!25555))
