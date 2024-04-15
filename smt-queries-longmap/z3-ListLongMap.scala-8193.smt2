; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100018 () Bool)

(assert start!100018)

(declare-fun b_free!25603 () Bool)

(declare-fun b_next!25603 () Bool)

(assert (=> start!100018 (= b_free!25603 (not b_next!25603))))

(declare-fun tp!89523 () Bool)

(declare-fun b_and!42051 () Bool)

(assert (=> start!100018 (= tp!89523 b_and!42051)))

(declare-fun b!1191720 () Bool)

(declare-fun e!677401 () Bool)

(declare-fun e!677399 () Bool)

(assert (=> b!1191720 (= e!677401 (not e!677399))))

(declare-fun res!792723 () Bool)

(assert (=> b!1191720 (=> res!792723 e!677399)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191720 (= res!792723 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76986 0))(
  ( (array!76987 (arr!37143 (Array (_ BitVec 32) (_ BitVec 64))) (size!37681 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76986)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191720 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39413 0))(
  ( (Unit!39414) )
))
(declare-fun lt!541799 () Unit!39413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76986 (_ BitVec 64) (_ BitVec 32)) Unit!39413)

(assert (=> b!1191720 (= lt!541799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191721 () Bool)

(declare-fun res!792733 () Bool)

(declare-fun e!677397 () Bool)

(assert (=> b!1191721 (=> (not res!792733) (not e!677397))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45305 0))(
  ( (V!45306 (val!15123 Int)) )
))
(declare-datatypes ((ValueCell!14357 0))(
  ( (ValueCellFull!14357 (v!17760 V!45305)) (EmptyCell!14357) )
))
(declare-datatypes ((array!76988 0))(
  ( (array!76989 (arr!37144 (Array (_ BitVec 32) ValueCell!14357)) (size!37682 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76988)

(assert (=> b!1191721 (= res!792733 (and (= (size!37682 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37681 _keys!1208) (size!37682 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191722 () Bool)

(declare-fun e!677398 () Bool)

(assert (=> b!1191722 (= e!677398 true)))

(declare-fun zeroValue!944 () V!45305)

(declare-fun lt!541798 () array!76986)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541800 () array!76988)

(declare-fun minValue!944 () V!45305)

(declare-datatypes ((tuple2!19548 0))(
  ( (tuple2!19549 (_1!9785 (_ BitVec 64)) (_2!9785 V!45305)) )
))
(declare-datatypes ((List!26261 0))(
  ( (Nil!26258) (Cons!26257 (h!27466 tuple2!19548) (t!38847 List!26261)) )
))
(declare-datatypes ((ListLongMap!17517 0))(
  ( (ListLongMap!17518 (toList!8774 List!26261)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5224 (array!76986 array!76988 (_ BitVec 32) (_ BitVec 32) V!45305 V!45305 (_ BitVec 32) Int) ListLongMap!17517)

(declare-fun -!1716 (ListLongMap!17517 (_ BitVec 64)) ListLongMap!17517)

(assert (=> b!1191722 (= (getCurrentListMapNoExtraKeys!5224 lt!541798 lt!541800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1716 (getCurrentListMapNoExtraKeys!5224 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541797 () Unit!39413)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 (array!76986 array!76988 (_ BitVec 32) (_ BitVec 32) V!45305 V!45305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39413)

(assert (=> b!1191722 (= lt!541797 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191723 () Bool)

(declare-fun res!792724 () Bool)

(assert (=> b!1191723 (=> (not res!792724) (not e!677397))))

(assert (=> b!1191723 (= res!792724 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37681 _keys!1208))))))

(declare-fun b!1191724 () Bool)

(declare-fun res!792727 () Bool)

(assert (=> b!1191724 (=> (not res!792727) (not e!677397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76986 (_ BitVec 32)) Bool)

(assert (=> b!1191724 (= res!792727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191725 () Bool)

(assert (=> b!1191725 (= e!677397 e!677401)))

(declare-fun res!792722 () Bool)

(assert (=> b!1191725 (=> (not res!792722) (not e!677401))))

(assert (=> b!1191725 (= res!792722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541798 mask!1564))))

(assert (=> b!1191725 (= lt!541798 (array!76987 (store (arr!37143 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37681 _keys!1208)))))

(declare-fun b!1191726 () Bool)

(declare-fun res!792728 () Bool)

(assert (=> b!1191726 (=> (not res!792728) (not e!677397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191726 (= res!792728 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47027 () Bool)

(declare-fun mapRes!47027 () Bool)

(assert (=> mapIsEmpty!47027 mapRes!47027))

(declare-fun b!1191728 () Bool)

(declare-fun res!792729 () Bool)

(assert (=> b!1191728 (=> (not res!792729) (not e!677397))))

(declare-datatypes ((List!26262 0))(
  ( (Nil!26259) (Cons!26258 (h!27467 (_ BitVec 64)) (t!38848 List!26262)) )
))
(declare-fun arrayNoDuplicates!0 (array!76986 (_ BitVec 32) List!26262) Bool)

(assert (=> b!1191728 (= res!792729 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26259))))

(declare-fun b!1191729 () Bool)

(declare-fun e!677403 () Bool)

(declare-fun tp_is_empty!30133 () Bool)

(assert (=> b!1191729 (= e!677403 tp_is_empty!30133)))

(declare-fun b!1191730 () Bool)

(declare-fun res!792731 () Bool)

(assert (=> b!1191730 (=> (not res!792731) (not e!677397))))

(assert (=> b!1191730 (= res!792731 (= (select (arr!37143 _keys!1208) i!673) k0!934))))

(declare-fun b!1191731 () Bool)

(declare-fun e!677400 () Bool)

(declare-fun e!677402 () Bool)

(assert (=> b!1191731 (= e!677400 (and e!677402 mapRes!47027))))

(declare-fun condMapEmpty!47027 () Bool)

(declare-fun mapDefault!47027 () ValueCell!14357)

(assert (=> b!1191731 (= condMapEmpty!47027 (= (arr!37144 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14357)) mapDefault!47027)))))

(declare-fun mapNonEmpty!47027 () Bool)

(declare-fun tp!89522 () Bool)

(assert (=> mapNonEmpty!47027 (= mapRes!47027 (and tp!89522 e!677403))))

(declare-fun mapRest!47027 () (Array (_ BitVec 32) ValueCell!14357))

(declare-fun mapValue!47027 () ValueCell!14357)

(declare-fun mapKey!47027 () (_ BitVec 32))

(assert (=> mapNonEmpty!47027 (= (arr!37144 _values!996) (store mapRest!47027 mapKey!47027 mapValue!47027))))

(declare-fun b!1191732 () Bool)

(declare-fun res!792730 () Bool)

(assert (=> b!1191732 (=> (not res!792730) (not e!677397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191732 (= res!792730 (validKeyInArray!0 k0!934))))

(declare-fun b!1191733 () Bool)

(declare-fun res!792732 () Bool)

(assert (=> b!1191733 (=> (not res!792732) (not e!677401))))

(assert (=> b!1191733 (= res!792732 (arrayNoDuplicates!0 lt!541798 #b00000000000000000000000000000000 Nil!26259))))

(declare-fun b!1191734 () Bool)

(assert (=> b!1191734 (= e!677402 tp_is_empty!30133)))

(declare-fun res!792726 () Bool)

(assert (=> start!100018 (=> (not res!792726) (not e!677397))))

(assert (=> start!100018 (= res!792726 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37681 _keys!1208))))))

(assert (=> start!100018 e!677397))

(assert (=> start!100018 tp_is_empty!30133))

(declare-fun array_inv!28448 (array!76986) Bool)

(assert (=> start!100018 (array_inv!28448 _keys!1208)))

(assert (=> start!100018 true))

(assert (=> start!100018 tp!89523))

(declare-fun array_inv!28449 (array!76988) Bool)

(assert (=> start!100018 (and (array_inv!28449 _values!996) e!677400)))

(declare-fun b!1191727 () Bool)

(assert (=> b!1191727 (= e!677399 e!677398)))

(declare-fun res!792725 () Bool)

(assert (=> b!1191727 (=> res!792725 e!677398)))

(assert (=> b!1191727 (= res!792725 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541796 () ListLongMap!17517)

(assert (=> b!1191727 (= lt!541796 (getCurrentListMapNoExtraKeys!5224 lt!541798 lt!541800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3112 (Int (_ BitVec 64)) V!45305)

(assert (=> b!1191727 (= lt!541800 (array!76989 (store (arr!37144 _values!996) i!673 (ValueCellFull!14357 (dynLambda!3112 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37682 _values!996)))))

(declare-fun lt!541795 () ListLongMap!17517)

(assert (=> b!1191727 (= lt!541795 (getCurrentListMapNoExtraKeys!5224 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100018 res!792726) b!1191726))

(assert (= (and b!1191726 res!792728) b!1191721))

(assert (= (and b!1191721 res!792733) b!1191724))

(assert (= (and b!1191724 res!792727) b!1191728))

(assert (= (and b!1191728 res!792729) b!1191723))

(assert (= (and b!1191723 res!792724) b!1191732))

(assert (= (and b!1191732 res!792730) b!1191730))

(assert (= (and b!1191730 res!792731) b!1191725))

(assert (= (and b!1191725 res!792722) b!1191733))

(assert (= (and b!1191733 res!792732) b!1191720))

(assert (= (and b!1191720 (not res!792723)) b!1191727))

(assert (= (and b!1191727 (not res!792725)) b!1191722))

(assert (= (and b!1191731 condMapEmpty!47027) mapIsEmpty!47027))

(assert (= (and b!1191731 (not condMapEmpty!47027)) mapNonEmpty!47027))

(get-info :version)

(assert (= (and mapNonEmpty!47027 ((_ is ValueCellFull!14357) mapValue!47027)) b!1191729))

(assert (= (and b!1191731 ((_ is ValueCellFull!14357) mapDefault!47027)) b!1191734))

(assert (= start!100018 b!1191731))

(declare-fun b_lambda!20729 () Bool)

(assert (=> (not b_lambda!20729) (not b!1191727)))

(declare-fun t!38846 () Bool)

(declare-fun tb!10407 () Bool)

(assert (=> (and start!100018 (= defaultEntry!1004 defaultEntry!1004) t!38846) tb!10407))

(declare-fun result!21389 () Bool)

(assert (=> tb!10407 (= result!21389 tp_is_empty!30133)))

(assert (=> b!1191727 t!38846))

(declare-fun b_and!42053 () Bool)

(assert (= b_and!42051 (and (=> t!38846 result!21389) b_and!42053)))

(declare-fun m!1099655 () Bool)

(assert (=> b!1191727 m!1099655))

(declare-fun m!1099657 () Bool)

(assert (=> b!1191727 m!1099657))

(declare-fun m!1099659 () Bool)

(assert (=> b!1191727 m!1099659))

(declare-fun m!1099661 () Bool)

(assert (=> b!1191727 m!1099661))

(declare-fun m!1099663 () Bool)

(assert (=> mapNonEmpty!47027 m!1099663))

(declare-fun m!1099665 () Bool)

(assert (=> b!1191730 m!1099665))

(declare-fun m!1099667 () Bool)

(assert (=> b!1191728 m!1099667))

(declare-fun m!1099669 () Bool)

(assert (=> b!1191720 m!1099669))

(declare-fun m!1099671 () Bool)

(assert (=> b!1191720 m!1099671))

(declare-fun m!1099673 () Bool)

(assert (=> b!1191724 m!1099673))

(declare-fun m!1099675 () Bool)

(assert (=> b!1191733 m!1099675))

(declare-fun m!1099677 () Bool)

(assert (=> start!100018 m!1099677))

(declare-fun m!1099679 () Bool)

(assert (=> start!100018 m!1099679))

(declare-fun m!1099681 () Bool)

(assert (=> b!1191726 m!1099681))

(declare-fun m!1099683 () Bool)

(assert (=> b!1191725 m!1099683))

(declare-fun m!1099685 () Bool)

(assert (=> b!1191725 m!1099685))

(declare-fun m!1099687 () Bool)

(assert (=> b!1191732 m!1099687))

(declare-fun m!1099689 () Bool)

(assert (=> b!1191722 m!1099689))

(declare-fun m!1099691 () Bool)

(assert (=> b!1191722 m!1099691))

(assert (=> b!1191722 m!1099691))

(declare-fun m!1099693 () Bool)

(assert (=> b!1191722 m!1099693))

(declare-fun m!1099695 () Bool)

(assert (=> b!1191722 m!1099695))

(check-sat (not start!100018) tp_is_empty!30133 (not mapNonEmpty!47027) (not b!1191727) (not b!1191722) (not b!1191728) (not b!1191720) (not b!1191725) (not b_lambda!20729) (not b!1191724) (not b!1191732) (not b!1191733) b_and!42053 (not b_next!25603) (not b!1191726))
(check-sat b_and!42053 (not b_next!25603))
