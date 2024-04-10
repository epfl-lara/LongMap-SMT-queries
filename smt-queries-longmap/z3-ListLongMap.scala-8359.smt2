; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101738 () Bool)

(assert start!101738)

(declare-fun b_free!26427 () Bool)

(declare-fun b_next!26427 () Bool)

(assert (=> start!101738 (= b_free!26427 (not b_next!26427))))

(declare-fun tp!92326 () Bool)

(declare-fun b_and!44115 () Bool)

(assert (=> start!101738 (= tp!92326 b_and!44115)))

(declare-fun b!1224699 () Bool)

(declare-fun e!695580 () Bool)

(declare-fun e!695577 () Bool)

(assert (=> b!1224699 (= e!695580 e!695577)))

(declare-fun res!813820 () Bool)

(assert (=> b!1224699 (=> (not res!813820) (not e!695577))))

(declare-datatypes ((array!79045 0))(
  ( (array!79046 (arr!38149 (Array (_ BitVec 32) (_ BitVec 64))) (size!38685 (_ BitVec 32))) )
))
(declare-fun lt!557720 () array!79045)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79045 (_ BitVec 32)) Bool)

(assert (=> b!1224699 (= res!813820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557720 mask!1564))))

(declare-fun _keys!1208 () array!79045)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224699 (= lt!557720 (array!79046 (store (arr!38149 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38685 _keys!1208)))))

(declare-fun b!1224700 () Bool)

(declare-fun res!813832 () Bool)

(assert (=> b!1224700 (=> (not res!813832) (not e!695580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224700 (= res!813832 (validMask!0 mask!1564))))

(declare-fun b!1224701 () Bool)

(declare-fun res!813818 () Bool)

(assert (=> b!1224701 (=> (not res!813818) (not e!695580))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224701 (= res!813818 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48595 () Bool)

(declare-fun mapRes!48595 () Bool)

(assert (=> mapIsEmpty!48595 mapRes!48595))

(declare-fun b!1224702 () Bool)

(declare-fun e!695582 () Bool)

(declare-fun tp_is_empty!31131 () Bool)

(assert (=> b!1224702 (= e!695582 tp_is_empty!31131)))

(declare-fun e!695576 () Bool)

(declare-fun b!1224703 () Bool)

(declare-fun arrayContainsKey!0 (array!79045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224703 (= e!695576 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224704 () Bool)

(declare-fun e!695583 () Bool)

(assert (=> b!1224704 (= e!695583 (and e!695582 mapRes!48595))))

(declare-fun condMapEmpty!48595 () Bool)

(declare-datatypes ((V!46635 0))(
  ( (V!46636 (val!15622 Int)) )
))
(declare-datatypes ((ValueCell!14856 0))(
  ( (ValueCellFull!14856 (v!18284 V!46635)) (EmptyCell!14856) )
))
(declare-datatypes ((array!79047 0))(
  ( (array!79048 (arr!38150 (Array (_ BitVec 32) ValueCell!14856)) (size!38686 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79047)

(declare-fun mapDefault!48595 () ValueCell!14856)

(assert (=> b!1224704 (= condMapEmpty!48595 (= (arr!38150 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14856)) mapDefault!48595)))))

(declare-fun b!1224705 () Bool)

(declare-fun e!695581 () Bool)

(declare-fun e!695573 () Bool)

(assert (=> b!1224705 (= e!695581 e!695573)))

(declare-fun res!813829 () Bool)

(assert (=> b!1224705 (=> res!813829 e!695573)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224705 (= res!813829 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46635)

(declare-datatypes ((tuple2!20132 0))(
  ( (tuple2!20133 (_1!10077 (_ BitVec 64)) (_2!10077 V!46635)) )
))
(declare-datatypes ((List!26932 0))(
  ( (Nil!26929) (Cons!26928 (h!28137 tuple2!20132) (t!40339 List!26932)) )
))
(declare-datatypes ((ListLongMap!18101 0))(
  ( (ListLongMap!18102 (toList!9066 List!26932)) )
))
(declare-fun lt!557735 () ListLongMap!18101)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557724 () array!79047)

(declare-fun minValue!944 () V!46635)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5486 (array!79045 array!79047 (_ BitVec 32) (_ BitVec 32) V!46635 V!46635 (_ BitVec 32) Int) ListLongMap!18101)

(assert (=> b!1224705 (= lt!557735 (getCurrentListMapNoExtraKeys!5486 lt!557720 lt!557724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557734 () V!46635)

(assert (=> b!1224705 (= lt!557724 (array!79048 (store (arr!38150 _values!996) i!673 (ValueCellFull!14856 lt!557734)) (size!38686 _values!996)))))

(declare-fun dynLambda!3359 (Int (_ BitVec 64)) V!46635)

(assert (=> b!1224705 (= lt!557734 (dynLambda!3359 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557726 () ListLongMap!18101)

(assert (=> b!1224705 (= lt!557726 (getCurrentListMapNoExtraKeys!5486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48595 () Bool)

(declare-fun tp!92327 () Bool)

(declare-fun e!695579 () Bool)

(assert (=> mapNonEmpty!48595 (= mapRes!48595 (and tp!92327 e!695579))))

(declare-fun mapValue!48595 () ValueCell!14856)

(declare-fun mapRest!48595 () (Array (_ BitVec 32) ValueCell!14856))

(declare-fun mapKey!48595 () (_ BitVec 32))

(assert (=> mapNonEmpty!48595 (= (arr!38150 _values!996) (store mapRest!48595 mapKey!48595 mapValue!48595))))

(declare-fun b!1224706 () Bool)

(declare-fun e!695584 () Bool)

(assert (=> b!1224706 (= e!695573 e!695584)))

(declare-fun res!813830 () Bool)

(assert (=> b!1224706 (=> res!813830 e!695584)))

(assert (=> b!1224706 (= res!813830 (not (validKeyInArray!0 (select (arr!38149 _keys!1208) from!1455))))))

(declare-fun lt!557731 () ListLongMap!18101)

(declare-fun lt!557721 () ListLongMap!18101)

(assert (=> b!1224706 (= lt!557731 lt!557721)))

(declare-fun lt!557723 () ListLongMap!18101)

(declare-fun -!1966 (ListLongMap!18101 (_ BitVec 64)) ListLongMap!18101)

(assert (=> b!1224706 (= lt!557721 (-!1966 lt!557723 k0!934))))

(assert (=> b!1224706 (= lt!557731 (getCurrentListMapNoExtraKeys!5486 lt!557720 lt!557724 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224706 (= lt!557723 (getCurrentListMapNoExtraKeys!5486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40582 0))(
  ( (Unit!40583) )
))
(declare-fun lt!557719 () Unit!40582)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1173 (array!79045 array!79047 (_ BitVec 32) (_ BitVec 32) V!46635 V!46635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40582)

(assert (=> b!1224706 (= lt!557719 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224707 () Bool)

(declare-fun e!695575 () Unit!40582)

(declare-fun Unit!40584 () Unit!40582)

(assert (=> b!1224707 (= e!695575 Unit!40584)))

(declare-fun b!1224708 () Bool)

(assert (=> b!1224708 (= e!695584 true)))

(declare-fun lt!557730 () ListLongMap!18101)

(declare-fun lt!557727 () ListLongMap!18101)

(assert (=> b!1224708 (= (-!1966 lt!557730 k0!934) lt!557727)))

(declare-fun lt!557733 () V!46635)

(declare-fun lt!557729 () Unit!40582)

(declare-fun addRemoveCommutativeForDiffKeys!210 (ListLongMap!18101 (_ BitVec 64) V!46635 (_ BitVec 64)) Unit!40582)

(assert (=> b!1224708 (= lt!557729 (addRemoveCommutativeForDiffKeys!210 lt!557723 (select (arr!38149 _keys!1208) from!1455) lt!557733 k0!934))))

(assert (=> b!1224708 (and (= lt!557726 lt!557730) (= lt!557721 lt!557731))))

(declare-fun lt!557718 () tuple2!20132)

(declare-fun +!4123 (ListLongMap!18101 tuple2!20132) ListLongMap!18101)

(assert (=> b!1224708 (= lt!557730 (+!4123 lt!557723 lt!557718))))

(assert (=> b!1224708 (not (= (select (arr!38149 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557722 () Unit!40582)

(assert (=> b!1224708 (= lt!557722 e!695575)))

(declare-fun c!120461 () Bool)

(assert (=> b!1224708 (= c!120461 (= (select (arr!38149 _keys!1208) from!1455) k0!934))))

(declare-fun e!695574 () Bool)

(assert (=> b!1224708 e!695574))

(declare-fun res!813828 () Bool)

(assert (=> b!1224708 (=> (not res!813828) (not e!695574))))

(assert (=> b!1224708 (= res!813828 (= lt!557735 lt!557727))))

(assert (=> b!1224708 (= lt!557727 (+!4123 lt!557721 lt!557718))))

(assert (=> b!1224708 (= lt!557718 (tuple2!20133 (select (arr!38149 _keys!1208) from!1455) lt!557733))))

(declare-fun get!19485 (ValueCell!14856 V!46635) V!46635)

(assert (=> b!1224708 (= lt!557733 (get!19485 (select (arr!38150 _values!996) from!1455) lt!557734))))

(declare-fun b!1224709 () Bool)

(declare-fun res!813822 () Bool)

(assert (=> b!1224709 (=> (not res!813822) (not e!695580))))

(assert (=> b!1224709 (= res!813822 (and (= (size!38686 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38685 _keys!1208) (size!38686 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224710 () Bool)

(declare-fun res!813827 () Bool)

(assert (=> b!1224710 (=> (not res!813827) (not e!695577))))

(declare-datatypes ((List!26933 0))(
  ( (Nil!26930) (Cons!26929 (h!28138 (_ BitVec 64)) (t!40340 List!26933)) )
))
(declare-fun arrayNoDuplicates!0 (array!79045 (_ BitVec 32) List!26933) Bool)

(assert (=> b!1224710 (= res!813827 (arrayNoDuplicates!0 lt!557720 #b00000000000000000000000000000000 Nil!26930))))

(declare-fun res!813831 () Bool)

(assert (=> start!101738 (=> (not res!813831) (not e!695580))))

(assert (=> start!101738 (= res!813831 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38685 _keys!1208))))))

(assert (=> start!101738 e!695580))

(assert (=> start!101738 tp_is_empty!31131))

(declare-fun array_inv!29020 (array!79045) Bool)

(assert (=> start!101738 (array_inv!29020 _keys!1208)))

(assert (=> start!101738 true))

(assert (=> start!101738 tp!92326))

(declare-fun array_inv!29021 (array!79047) Bool)

(assert (=> start!101738 (and (array_inv!29021 _values!996) e!695583)))

(declare-fun b!1224711 () Bool)

(assert (=> b!1224711 (= e!695577 (not e!695581))))

(declare-fun res!813821 () Bool)

(assert (=> b!1224711 (=> res!813821 e!695581)))

(assert (=> b!1224711 (= res!813821 (bvsgt from!1455 i!673))))

(assert (=> b!1224711 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557717 () Unit!40582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79045 (_ BitVec 64) (_ BitVec 32)) Unit!40582)

(assert (=> b!1224711 (= lt!557717 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224712 () Bool)

(assert (=> b!1224712 (= e!695574 e!695576)))

(declare-fun res!813823 () Bool)

(assert (=> b!1224712 (=> res!813823 e!695576)))

(assert (=> b!1224712 (= res!813823 (not (= (select (arr!38149 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224713 () Bool)

(declare-fun Unit!40585 () Unit!40582)

(assert (=> b!1224713 (= e!695575 Unit!40585)))

(declare-fun lt!557728 () Unit!40582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79045 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40582)

(assert (=> b!1224713 (= lt!557728 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224713 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557725 () Unit!40582)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79045 (_ BitVec 32) (_ BitVec 32)) Unit!40582)

(assert (=> b!1224713 (= lt!557725 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224713 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26930)))

(declare-fun lt!557732 () Unit!40582)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79045 (_ BitVec 64) (_ BitVec 32) List!26933) Unit!40582)

(assert (=> b!1224713 (= lt!557732 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26930))))

(assert (=> b!1224713 false))

(declare-fun b!1224714 () Bool)

(declare-fun res!813819 () Bool)

(assert (=> b!1224714 (=> (not res!813819) (not e!695580))))

(assert (=> b!1224714 (= res!813819 (= (select (arr!38149 _keys!1208) i!673) k0!934))))

(declare-fun b!1224715 () Bool)

(declare-fun res!813825 () Bool)

(assert (=> b!1224715 (=> (not res!813825) (not e!695580))))

(assert (=> b!1224715 (= res!813825 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38685 _keys!1208))))))

(declare-fun b!1224716 () Bool)

(assert (=> b!1224716 (= e!695579 tp_is_empty!31131)))

(declare-fun b!1224717 () Bool)

(declare-fun res!813826 () Bool)

(assert (=> b!1224717 (=> (not res!813826) (not e!695580))))

(assert (=> b!1224717 (= res!813826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224718 () Bool)

(declare-fun res!813824 () Bool)

(assert (=> b!1224718 (=> (not res!813824) (not e!695580))))

(assert (=> b!1224718 (= res!813824 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26930))))

(assert (= (and start!101738 res!813831) b!1224700))

(assert (= (and b!1224700 res!813832) b!1224709))

(assert (= (and b!1224709 res!813822) b!1224717))

(assert (= (and b!1224717 res!813826) b!1224718))

(assert (= (and b!1224718 res!813824) b!1224715))

(assert (= (and b!1224715 res!813825) b!1224701))

(assert (= (and b!1224701 res!813818) b!1224714))

(assert (= (and b!1224714 res!813819) b!1224699))

(assert (= (and b!1224699 res!813820) b!1224710))

(assert (= (and b!1224710 res!813827) b!1224711))

(assert (= (and b!1224711 (not res!813821)) b!1224705))

(assert (= (and b!1224705 (not res!813829)) b!1224706))

(assert (= (and b!1224706 (not res!813830)) b!1224708))

(assert (= (and b!1224708 res!813828) b!1224712))

(assert (= (and b!1224712 (not res!813823)) b!1224703))

(assert (= (and b!1224708 c!120461) b!1224713))

(assert (= (and b!1224708 (not c!120461)) b!1224707))

(assert (= (and b!1224704 condMapEmpty!48595) mapIsEmpty!48595))

(assert (= (and b!1224704 (not condMapEmpty!48595)) mapNonEmpty!48595))

(get-info :version)

(assert (= (and mapNonEmpty!48595 ((_ is ValueCellFull!14856) mapValue!48595)) b!1224716))

(assert (= (and b!1224704 ((_ is ValueCellFull!14856) mapDefault!48595)) b!1224702))

(assert (= start!101738 b!1224704))

(declare-fun b_lambda!22407 () Bool)

(assert (=> (not b_lambda!22407) (not b!1224705)))

(declare-fun t!40338 () Bool)

(declare-fun tb!11227 () Bool)

(assert (=> (and start!101738 (= defaultEntry!1004 defaultEntry!1004) t!40338) tb!11227))

(declare-fun result!23067 () Bool)

(assert (=> tb!11227 (= result!23067 tp_is_empty!31131)))

(assert (=> b!1224705 t!40338))

(declare-fun b_and!44117 () Bool)

(assert (= b_and!44115 (and (=> t!40338 result!23067) b_and!44117)))

(declare-fun m!1129707 () Bool)

(assert (=> b!1224711 m!1129707))

(declare-fun m!1129709 () Bool)

(assert (=> b!1224711 m!1129709))

(declare-fun m!1129711 () Bool)

(assert (=> start!101738 m!1129711))

(declare-fun m!1129713 () Bool)

(assert (=> start!101738 m!1129713))

(declare-fun m!1129715 () Bool)

(assert (=> mapNonEmpty!48595 m!1129715))

(declare-fun m!1129717 () Bool)

(assert (=> b!1224703 m!1129717))

(declare-fun m!1129719 () Bool)

(assert (=> b!1224714 m!1129719))

(declare-fun m!1129721 () Bool)

(assert (=> b!1224701 m!1129721))

(declare-fun m!1129723 () Bool)

(assert (=> b!1224708 m!1129723))

(declare-fun m!1129725 () Bool)

(assert (=> b!1224708 m!1129725))

(declare-fun m!1129727 () Bool)

(assert (=> b!1224708 m!1129727))

(declare-fun m!1129729 () Bool)

(assert (=> b!1224708 m!1129729))

(declare-fun m!1129731 () Bool)

(assert (=> b!1224708 m!1129731))

(declare-fun m!1129733 () Bool)

(assert (=> b!1224708 m!1129733))

(assert (=> b!1224708 m!1129725))

(assert (=> b!1224708 m!1129723))

(declare-fun m!1129735 () Bool)

(assert (=> b!1224708 m!1129735))

(declare-fun m!1129737 () Bool)

(assert (=> b!1224713 m!1129737))

(declare-fun m!1129739 () Bool)

(assert (=> b!1224713 m!1129739))

(declare-fun m!1129741 () Bool)

(assert (=> b!1224713 m!1129741))

(declare-fun m!1129743 () Bool)

(assert (=> b!1224713 m!1129743))

(declare-fun m!1129745 () Bool)

(assert (=> b!1224713 m!1129745))

(declare-fun m!1129747 () Bool)

(assert (=> b!1224699 m!1129747))

(declare-fun m!1129749 () Bool)

(assert (=> b!1224699 m!1129749))

(declare-fun m!1129751 () Bool)

(assert (=> b!1224705 m!1129751))

(declare-fun m!1129753 () Bool)

(assert (=> b!1224705 m!1129753))

(declare-fun m!1129755 () Bool)

(assert (=> b!1224705 m!1129755))

(declare-fun m!1129757 () Bool)

(assert (=> b!1224705 m!1129757))

(declare-fun m!1129759 () Bool)

(assert (=> b!1224718 m!1129759))

(declare-fun m!1129761 () Bool)

(assert (=> b!1224710 m!1129761))

(declare-fun m!1129763 () Bool)

(assert (=> b!1224700 m!1129763))

(declare-fun m!1129765 () Bool)

(assert (=> b!1224706 m!1129765))

(declare-fun m!1129767 () Bool)

(assert (=> b!1224706 m!1129767))

(declare-fun m!1129769 () Bool)

(assert (=> b!1224706 m!1129769))

(declare-fun m!1129771 () Bool)

(assert (=> b!1224706 m!1129771))

(assert (=> b!1224706 m!1129725))

(declare-fun m!1129773 () Bool)

(assert (=> b!1224706 m!1129773))

(assert (=> b!1224706 m!1129725))

(assert (=> b!1224712 m!1129725))

(declare-fun m!1129775 () Bool)

(assert (=> b!1224717 m!1129775))

(check-sat (not b!1224706) (not b!1224717) (not b!1224718) (not b_next!26427) (not b!1224699) (not start!101738) (not b!1224705) (not b!1224701) (not b!1224710) (not b!1224703) tp_is_empty!31131 (not b!1224708) (not b!1224713) (not b_lambda!22407) b_and!44117 (not mapNonEmpty!48595) (not b!1224700) (not b!1224711))
(check-sat b_and!44117 (not b_next!26427))
