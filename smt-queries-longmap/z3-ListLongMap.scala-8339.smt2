; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101754 () Bool)

(assert start!101754)

(declare-fun b_free!26305 () Bool)

(declare-fun b_next!26305 () Bool)

(assert (=> start!101754 (= b_free!26305 (not b_next!26305))))

(declare-fun tp!91951 () Bool)

(declare-fun b_and!43819 () Bool)

(assert (=> start!101754 (= tp!91951 b_and!43819)))

(declare-fun b!1221634 () Bool)

(declare-fun res!811117 () Bool)

(declare-fun e!693790 () Bool)

(assert (=> b!1221634 (=> (not res!811117) (not e!693790))))

(declare-datatypes ((array!78837 0))(
  ( (array!78838 (arr!38042 (Array (_ BitVec 32) (_ BitVec 64))) (size!38579 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78837)

(declare-datatypes ((List!26854 0))(
  ( (Nil!26851) (Cons!26850 (h!28068 (_ BitVec 64)) (t!40131 List!26854)) )
))
(declare-fun arrayNoDuplicates!0 (array!78837 (_ BitVec 32) List!26854) Bool)

(assert (=> b!1221634 (= res!811117 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26851))))

(declare-fun b!1221635 () Bool)

(declare-fun e!693782 () Bool)

(declare-fun e!693789 () Bool)

(assert (=> b!1221635 (= e!693782 (not e!693789))))

(declare-fun res!811118 () Bool)

(assert (=> b!1221635 (=> res!811118 e!693789)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221635 (= res!811118 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221635 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40410 0))(
  ( (Unit!40411) )
))
(declare-fun lt!555427 () Unit!40410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78837 (_ BitVec 64) (_ BitVec 32)) Unit!40410)

(assert (=> b!1221635 (= lt!555427 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221636 () Bool)

(declare-fun res!811114 () Bool)

(assert (=> b!1221636 (=> (not res!811114) (not e!693790))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78837 (_ BitVec 32)) Bool)

(assert (=> b!1221636 (= res!811114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221637 () Bool)

(declare-fun e!693786 () Bool)

(assert (=> b!1221637 (= e!693789 e!693786)))

(declare-fun res!811122 () Bool)

(assert (=> b!1221637 (=> res!811122 e!693786)))

(assert (=> b!1221637 (= res!811122 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46473 0))(
  ( (V!46474 (val!15561 Int)) )
))
(declare-fun zeroValue!944 () V!46473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14795 0))(
  ( (ValueCellFull!14795 (v!18215 V!46473)) (EmptyCell!14795) )
))
(declare-datatypes ((array!78839 0))(
  ( (array!78840 (arr!38043 (Array (_ BitVec 32) ValueCell!14795)) (size!38580 (_ BitVec 32))) )
))
(declare-fun lt!555431 () array!78839)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20044 0))(
  ( (tuple2!20045 (_1!10033 (_ BitVec 64)) (_2!10033 V!46473)) )
))
(declare-datatypes ((List!26855 0))(
  ( (Nil!26852) (Cons!26851 (h!28069 tuple2!20044) (t!40132 List!26855)) )
))
(declare-datatypes ((ListLongMap!18021 0))(
  ( (ListLongMap!18022 (toList!9026 List!26855)) )
))
(declare-fun lt!555428 () ListLongMap!18021)

(declare-fun minValue!944 () V!46473)

(declare-fun lt!555432 () array!78837)

(declare-fun getCurrentListMapNoExtraKeys!5481 (array!78837 array!78839 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) Int) ListLongMap!18021)

(assert (=> b!1221637 (= lt!555428 (getCurrentListMapNoExtraKeys!5481 lt!555432 lt!555431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555424 () V!46473)

(declare-fun _values!996 () array!78839)

(assert (=> b!1221637 (= lt!555431 (array!78840 (store (arr!38043 _values!996) i!673 (ValueCellFull!14795 lt!555424)) (size!38580 _values!996)))))

(declare-fun dynLambda!3382 (Int (_ BitVec 64)) V!46473)

(assert (=> b!1221637 (= lt!555424 (dynLambda!3382 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555430 () ListLongMap!18021)

(assert (=> b!1221637 (= lt!555430 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221638 () Bool)

(declare-fun res!811112 () Bool)

(assert (=> b!1221638 (=> (not res!811112) (not e!693790))))

(assert (=> b!1221638 (= res!811112 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38579 _keys!1208))))))

(declare-fun mapIsEmpty!48403 () Bool)

(declare-fun mapRes!48403 () Bool)

(assert (=> mapIsEmpty!48403 mapRes!48403))

(declare-fun b!1221639 () Bool)

(declare-fun e!693787 () Bool)

(declare-fun e!693791 () Bool)

(assert (=> b!1221639 (= e!693787 e!693791)))

(declare-fun res!811123 () Bool)

(assert (=> b!1221639 (=> res!811123 e!693791)))

(assert (=> b!1221639 (= res!811123 (not (= (select (arr!38042 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221640 () Bool)

(declare-fun e!693792 () Bool)

(declare-fun e!693783 () Bool)

(assert (=> b!1221640 (= e!693792 (and e!693783 mapRes!48403))))

(declare-fun condMapEmpty!48403 () Bool)

(declare-fun mapDefault!48403 () ValueCell!14795)

(assert (=> b!1221640 (= condMapEmpty!48403 (= (arr!38043 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14795)) mapDefault!48403)))))

(declare-fun res!811109 () Bool)

(assert (=> start!101754 (=> (not res!811109) (not e!693790))))

(assert (=> start!101754 (= res!811109 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38579 _keys!1208))))))

(assert (=> start!101754 e!693790))

(declare-fun tp_is_empty!31009 () Bool)

(assert (=> start!101754 tp_is_empty!31009))

(declare-fun array_inv!29024 (array!78837) Bool)

(assert (=> start!101754 (array_inv!29024 _keys!1208)))

(assert (=> start!101754 true))

(assert (=> start!101754 tp!91951))

(declare-fun array_inv!29025 (array!78839) Bool)

(assert (=> start!101754 (and (array_inv!29025 _values!996) e!693792)))

(declare-fun mapNonEmpty!48403 () Bool)

(declare-fun tp!91952 () Bool)

(declare-fun e!693785 () Bool)

(assert (=> mapNonEmpty!48403 (= mapRes!48403 (and tp!91952 e!693785))))

(declare-fun mapRest!48403 () (Array (_ BitVec 32) ValueCell!14795))

(declare-fun mapValue!48403 () ValueCell!14795)

(declare-fun mapKey!48403 () (_ BitVec 32))

(assert (=> mapNonEmpty!48403 (= (arr!38043 _values!996) (store mapRest!48403 mapKey!48403 mapValue!48403))))

(declare-fun b!1221641 () Bool)

(declare-fun e!693784 () Bool)

(declare-fun e!693793 () Bool)

(assert (=> b!1221641 (= e!693784 e!693793)))

(declare-fun res!811110 () Bool)

(assert (=> b!1221641 (=> res!811110 e!693793)))

(assert (=> b!1221641 (= res!811110 (not (= (select (arr!38042 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221641 e!693787))

(declare-fun res!811113 () Bool)

(assert (=> b!1221641 (=> (not res!811113) (not e!693787))))

(declare-fun lt!555426 () ListLongMap!18021)

(declare-fun +!4133 (ListLongMap!18021 tuple2!20044) ListLongMap!18021)

(declare-fun get!19449 (ValueCell!14795 V!46473) V!46473)

(assert (=> b!1221641 (= res!811113 (= lt!555428 (+!4133 lt!555426 (tuple2!20045 (select (arr!38042 _keys!1208) from!1455) (get!19449 (select (arr!38043 _values!996) from!1455) lt!555424)))))))

(declare-fun b!1221642 () Bool)

(assert (=> b!1221642 (= e!693786 e!693784)))

(declare-fun res!811115 () Bool)

(assert (=> b!1221642 (=> res!811115 e!693784)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221642 (= res!811115 (not (validKeyInArray!0 (select (arr!38042 _keys!1208) from!1455))))))

(declare-fun lt!555435 () ListLongMap!18021)

(assert (=> b!1221642 (= lt!555435 lt!555426)))

(declare-fun lt!555429 () ListLongMap!18021)

(declare-fun -!1911 (ListLongMap!18021 (_ BitVec 64)) ListLongMap!18021)

(assert (=> b!1221642 (= lt!555426 (-!1911 lt!555429 k0!934))))

(assert (=> b!1221642 (= lt!555435 (getCurrentListMapNoExtraKeys!5481 lt!555432 lt!555431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221642 (= lt!555429 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555433 () Unit!40410)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1126 (array!78837 array!78839 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40410)

(assert (=> b!1221642 (= lt!555433 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1126 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221643 () Bool)

(assert (=> b!1221643 (= e!693791 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221644 () Bool)

(declare-fun res!811116 () Bool)

(assert (=> b!1221644 (=> (not res!811116) (not e!693790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221644 (= res!811116 (validMask!0 mask!1564))))

(declare-fun b!1221645 () Bool)

(assert (=> b!1221645 (= e!693793 true)))

(assert (=> b!1221645 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26851)))

(declare-fun lt!555434 () Unit!40410)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78837 (_ BitVec 32) (_ BitVec 32)) Unit!40410)

(assert (=> b!1221645 (= lt!555434 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1221645 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555425 () Unit!40410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78837 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40410)

(assert (=> b!1221645 (= lt!555425 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221646 () Bool)

(declare-fun res!811121 () Bool)

(assert (=> b!1221646 (=> (not res!811121) (not e!693790))))

(assert (=> b!1221646 (= res!811121 (validKeyInArray!0 k0!934))))

(declare-fun b!1221647 () Bool)

(declare-fun res!811119 () Bool)

(assert (=> b!1221647 (=> (not res!811119) (not e!693790))))

(assert (=> b!1221647 (= res!811119 (and (= (size!38580 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38579 _keys!1208) (size!38580 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221648 () Bool)

(assert (=> b!1221648 (= e!693783 tp_is_empty!31009)))

(declare-fun b!1221649 () Bool)

(declare-fun res!811111 () Bool)

(assert (=> b!1221649 (=> (not res!811111) (not e!693782))))

(assert (=> b!1221649 (= res!811111 (arrayNoDuplicates!0 lt!555432 #b00000000000000000000000000000000 Nil!26851))))

(declare-fun b!1221650 () Bool)

(assert (=> b!1221650 (= e!693790 e!693782)))

(declare-fun res!811124 () Bool)

(assert (=> b!1221650 (=> (not res!811124) (not e!693782))))

(assert (=> b!1221650 (= res!811124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555432 mask!1564))))

(assert (=> b!1221650 (= lt!555432 (array!78838 (store (arr!38042 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38579 _keys!1208)))))

(declare-fun b!1221651 () Bool)

(assert (=> b!1221651 (= e!693785 tp_is_empty!31009)))

(declare-fun b!1221652 () Bool)

(declare-fun res!811120 () Bool)

(assert (=> b!1221652 (=> (not res!811120) (not e!693790))))

(assert (=> b!1221652 (= res!811120 (= (select (arr!38042 _keys!1208) i!673) k0!934))))

(assert (= (and start!101754 res!811109) b!1221644))

(assert (= (and b!1221644 res!811116) b!1221647))

(assert (= (and b!1221647 res!811119) b!1221636))

(assert (= (and b!1221636 res!811114) b!1221634))

(assert (= (and b!1221634 res!811117) b!1221638))

(assert (= (and b!1221638 res!811112) b!1221646))

(assert (= (and b!1221646 res!811121) b!1221652))

(assert (= (and b!1221652 res!811120) b!1221650))

(assert (= (and b!1221650 res!811124) b!1221649))

(assert (= (and b!1221649 res!811111) b!1221635))

(assert (= (and b!1221635 (not res!811118)) b!1221637))

(assert (= (and b!1221637 (not res!811122)) b!1221642))

(assert (= (and b!1221642 (not res!811115)) b!1221641))

(assert (= (and b!1221641 res!811113) b!1221639))

(assert (= (and b!1221639 (not res!811123)) b!1221643))

(assert (= (and b!1221641 (not res!811110)) b!1221645))

(assert (= (and b!1221640 condMapEmpty!48403) mapIsEmpty!48403))

(assert (= (and b!1221640 (not condMapEmpty!48403)) mapNonEmpty!48403))

(get-info :version)

(assert (= (and mapNonEmpty!48403 ((_ is ValueCellFull!14795) mapValue!48403)) b!1221651))

(assert (= (and b!1221640 ((_ is ValueCellFull!14795) mapDefault!48403)) b!1221648))

(assert (= start!101754 b!1221640))

(declare-fun b_lambda!22165 () Bool)

(assert (=> (not b_lambda!22165) (not b!1221637)))

(declare-fun t!40130 () Bool)

(declare-fun tb!11097 () Bool)

(assert (=> (and start!101754 (= defaultEntry!1004 defaultEntry!1004) t!40130) tb!11097))

(declare-fun result!22809 () Bool)

(assert (=> tb!11097 (= result!22809 tp_is_empty!31009)))

(assert (=> b!1221637 t!40130))

(declare-fun b_and!43821 () Bool)

(assert (= b_and!43819 (and (=> t!40130 result!22809) b_and!43821)))

(declare-fun m!1126749 () Bool)

(assert (=> b!1221644 m!1126749))

(declare-fun m!1126751 () Bool)

(assert (=> b!1221639 m!1126751))

(declare-fun m!1126753 () Bool)

(assert (=> b!1221635 m!1126753))

(declare-fun m!1126755 () Bool)

(assert (=> b!1221635 m!1126755))

(declare-fun m!1126757 () Bool)

(assert (=> b!1221642 m!1126757))

(declare-fun m!1126759 () Bool)

(assert (=> b!1221642 m!1126759))

(declare-fun m!1126761 () Bool)

(assert (=> b!1221642 m!1126761))

(assert (=> b!1221642 m!1126751))

(declare-fun m!1126763 () Bool)

(assert (=> b!1221642 m!1126763))

(declare-fun m!1126765 () Bool)

(assert (=> b!1221642 m!1126765))

(assert (=> b!1221642 m!1126751))

(declare-fun m!1126767 () Bool)

(assert (=> b!1221646 m!1126767))

(declare-fun m!1126769 () Bool)

(assert (=> b!1221645 m!1126769))

(declare-fun m!1126771 () Bool)

(assert (=> b!1221645 m!1126771))

(declare-fun m!1126773 () Bool)

(assert (=> b!1221645 m!1126773))

(declare-fun m!1126775 () Bool)

(assert (=> b!1221645 m!1126775))

(declare-fun m!1126777 () Bool)

(assert (=> b!1221643 m!1126777))

(assert (=> b!1221641 m!1126751))

(declare-fun m!1126779 () Bool)

(assert (=> b!1221641 m!1126779))

(assert (=> b!1221641 m!1126779))

(declare-fun m!1126781 () Bool)

(assert (=> b!1221641 m!1126781))

(declare-fun m!1126783 () Bool)

(assert (=> b!1221641 m!1126783))

(declare-fun m!1126785 () Bool)

(assert (=> b!1221652 m!1126785))

(declare-fun m!1126787 () Bool)

(assert (=> mapNonEmpty!48403 m!1126787))

(declare-fun m!1126789 () Bool)

(assert (=> b!1221636 m!1126789))

(declare-fun m!1126791 () Bool)

(assert (=> b!1221634 m!1126791))

(declare-fun m!1126793 () Bool)

(assert (=> start!101754 m!1126793))

(declare-fun m!1126795 () Bool)

(assert (=> start!101754 m!1126795))

(declare-fun m!1126797 () Bool)

(assert (=> b!1221650 m!1126797))

(declare-fun m!1126799 () Bool)

(assert (=> b!1221650 m!1126799))

(declare-fun m!1126801 () Bool)

(assert (=> b!1221649 m!1126801))

(declare-fun m!1126803 () Bool)

(assert (=> b!1221637 m!1126803))

(declare-fun m!1126805 () Bool)

(assert (=> b!1221637 m!1126805))

(declare-fun m!1126807 () Bool)

(assert (=> b!1221637 m!1126807))

(declare-fun m!1126809 () Bool)

(assert (=> b!1221637 m!1126809))

(check-sat (not b!1221649) (not start!101754) (not b!1221637) b_and!43821 (not b_lambda!22165) (not b!1221641) (not b!1221643) (not b!1221645) (not b!1221642) (not b_next!26305) (not b!1221650) (not b!1221635) tp_is_empty!31009 (not b!1221634) (not b!1221636) (not mapNonEmpty!48403) (not b!1221644) (not b!1221646))
(check-sat b_and!43821 (not b_next!26305))
