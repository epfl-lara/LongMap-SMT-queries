; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101614 () Bool)

(assert start!101614)

(declare-fun b_free!26341 () Bool)

(declare-fun b_next!26341 () Bool)

(assert (=> start!101614 (= b_free!26341 (not b_next!26341))))

(declare-fun tp!92065 () Bool)

(declare-fun b_and!43907 () Bool)

(assert (=> start!101614 (= tp!92065 b_and!43907)))

(declare-datatypes ((array!78794 0))(
  ( (array!78795 (arr!38025 (Array (_ BitVec 32) (_ BitVec 64))) (size!38563 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78794)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!693784 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1221666 () Bool)

(declare-fun arrayContainsKey!0 (array!78794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221666 (= e!693784 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221667 () Bool)

(declare-fun e!693785 () Bool)

(assert (=> b!1221667 (= e!693785 e!693784)))

(declare-fun res!811617 () Bool)

(assert (=> b!1221667 (=> res!811617 e!693784)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221667 (= res!811617 (not (= (select (arr!38025 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!48463 () Bool)

(declare-fun mapRes!48463 () Bool)

(declare-fun tp!92066 () Bool)

(declare-fun e!693792 () Bool)

(assert (=> mapNonEmpty!48463 (= mapRes!48463 (and tp!92066 e!693792))))

(declare-datatypes ((V!46521 0))(
  ( (V!46522 (val!15579 Int)) )
))
(declare-datatypes ((ValueCell!14813 0))(
  ( (ValueCellFull!14813 (v!18239 V!46521)) (EmptyCell!14813) )
))
(declare-fun mapRest!48463 () (Array (_ BitVec 32) ValueCell!14813))

(declare-fun mapKey!48463 () (_ BitVec 32))

(declare-datatypes ((array!78796 0))(
  ( (array!78797 (arr!38026 (Array (_ BitVec 32) ValueCell!14813)) (size!38564 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78796)

(declare-fun mapValue!48463 () ValueCell!14813)

(assert (=> mapNonEmpty!48463 (= (arr!38026 _values!996) (store mapRest!48463 mapKey!48463 mapValue!48463))))

(declare-fun b!1221668 () Bool)

(declare-fun e!693787 () Bool)

(assert (=> b!1221668 (= e!693787 true)))

(declare-fun lt!555580 () Bool)

(declare-datatypes ((List!26921 0))(
  ( (Nil!26918) (Cons!26917 (h!28126 (_ BitVec 64)) (t!40233 List!26921)) )
))
(declare-fun contains!7002 (List!26921 (_ BitVec 64)) Bool)

(assert (=> b!1221668 (= lt!555580 (contains!7002 Nil!26918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!48463 () Bool)

(assert (=> mapIsEmpty!48463 mapRes!48463))

(declare-fun b!1221669 () Bool)

(declare-fun res!811614 () Bool)

(declare-fun e!693789 () Bool)

(assert (=> b!1221669 (=> (not res!811614) (not e!693789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221669 (= res!811614 (validKeyInArray!0 k0!934))))

(declare-fun b!1221670 () Bool)

(declare-fun res!811601 () Bool)

(declare-fun e!693786 () Bool)

(assert (=> b!1221670 (=> (not res!811601) (not e!693786))))

(declare-fun lt!555587 () array!78794)

(declare-fun arrayNoDuplicates!0 (array!78794 (_ BitVec 32) List!26921) Bool)

(assert (=> b!1221670 (= res!811601 (arrayNoDuplicates!0 lt!555587 #b00000000000000000000000000000000 Nil!26918))))

(declare-fun b!1221671 () Bool)

(declare-fun e!693795 () Bool)

(assert (=> b!1221671 (= e!693795 e!693787)))

(declare-fun res!811602 () Bool)

(assert (=> b!1221671 (=> res!811602 e!693787)))

(assert (=> b!1221671 (= res!811602 (or (bvsge (size!38563 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38563 _keys!1208)) (bvsge from!1455 (size!38563 _keys!1208))))))

(assert (=> b!1221671 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26918)))

(declare-datatypes ((Unit!40313 0))(
  ( (Unit!40314) )
))
(declare-fun lt!555579 () Unit!40313)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78794 (_ BitVec 32) (_ BitVec 32)) Unit!40313)

(assert (=> b!1221671 (= lt!555579 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1221671 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555584 () Unit!40313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78794 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40313)

(assert (=> b!1221671 (= lt!555584 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221672 () Bool)

(declare-fun e!693791 () Bool)

(declare-fun e!693788 () Bool)

(assert (=> b!1221672 (= e!693791 (and e!693788 mapRes!48463))))

(declare-fun condMapEmpty!48463 () Bool)

(declare-fun mapDefault!48463 () ValueCell!14813)

(assert (=> b!1221672 (= condMapEmpty!48463 (= (arr!38026 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14813)) mapDefault!48463)))))

(declare-fun b!1221673 () Bool)

(declare-fun e!693793 () Bool)

(assert (=> b!1221673 (= e!693793 e!693795)))

(declare-fun res!811605 () Bool)

(assert (=> b!1221673 (=> res!811605 e!693795)))

(assert (=> b!1221673 (= res!811605 (not (= (select (arr!38025 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221673 e!693785))

(declare-fun res!811612 () Bool)

(assert (=> b!1221673 (=> (not res!811612) (not e!693785))))

(declare-datatypes ((tuple2!20142 0))(
  ( (tuple2!20143 (_1!10082 (_ BitVec 64)) (_2!10082 V!46521)) )
))
(declare-datatypes ((List!26922 0))(
  ( (Nil!26919) (Cons!26918 (h!28127 tuple2!20142) (t!40234 List!26922)) )
))
(declare-datatypes ((ListLongMap!18111 0))(
  ( (ListLongMap!18112 (toList!9071 List!26922)) )
))
(declare-fun lt!555589 () ListLongMap!18111)

(declare-fun lt!555583 () V!46521)

(declare-fun lt!555588 () ListLongMap!18111)

(declare-fun +!4134 (ListLongMap!18111 tuple2!20142) ListLongMap!18111)

(declare-fun get!19421 (ValueCell!14813 V!46521) V!46521)

(assert (=> b!1221673 (= res!811612 (= lt!555588 (+!4134 lt!555589 (tuple2!20143 (select (arr!38025 _keys!1208) from!1455) (get!19421 (select (arr!38026 _values!996) from!1455) lt!555583)))))))

(declare-fun b!1221674 () Bool)

(declare-fun e!693790 () Bool)

(assert (=> b!1221674 (= e!693786 (not e!693790))))

(declare-fun res!811608 () Bool)

(assert (=> b!1221674 (=> res!811608 e!693790)))

(assert (=> b!1221674 (= res!811608 (bvsgt from!1455 i!673))))

(assert (=> b!1221674 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555585 () Unit!40313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78794 (_ BitVec 64) (_ BitVec 32)) Unit!40313)

(assert (=> b!1221674 (= lt!555585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221676 () Bool)

(declare-fun tp_is_empty!31045 () Bool)

(assert (=> b!1221676 (= e!693792 tp_is_empty!31045)))

(declare-fun b!1221677 () Bool)

(declare-fun res!811600 () Bool)

(assert (=> b!1221677 (=> (not res!811600) (not e!693789))))

(assert (=> b!1221677 (= res!811600 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38563 _keys!1208))))))

(declare-fun b!1221678 () Bool)

(declare-fun e!693794 () Bool)

(assert (=> b!1221678 (= e!693790 e!693794)))

(declare-fun res!811613 () Bool)

(assert (=> b!1221678 (=> res!811613 e!693794)))

(assert (=> b!1221678 (= res!811613 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555582 () array!78796)

(declare-fun minValue!944 () V!46521)

(declare-fun getCurrentListMapNoExtraKeys!5506 (array!78794 array!78796 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) Int) ListLongMap!18111)

(assert (=> b!1221678 (= lt!555588 (getCurrentListMapNoExtraKeys!5506 lt!555587 lt!555582 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221678 (= lt!555582 (array!78797 (store (arr!38026 _values!996) i!673 (ValueCellFull!14813 lt!555583)) (size!38564 _values!996)))))

(declare-fun dynLambda!3354 (Int (_ BitVec 64)) V!46521)

(assert (=> b!1221678 (= lt!555583 (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555581 () ListLongMap!18111)

(assert (=> b!1221678 (= lt!555581 (getCurrentListMapNoExtraKeys!5506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221679 () Bool)

(assert (=> b!1221679 (= e!693794 e!693793)))

(declare-fun res!811606 () Bool)

(assert (=> b!1221679 (=> res!811606 e!693793)))

(assert (=> b!1221679 (= res!811606 (not (validKeyInArray!0 (select (arr!38025 _keys!1208) from!1455))))))

(declare-fun lt!555591 () ListLongMap!18111)

(assert (=> b!1221679 (= lt!555591 lt!555589)))

(declare-fun lt!555586 () ListLongMap!18111)

(declare-fun -!1898 (ListLongMap!18111 (_ BitVec 64)) ListLongMap!18111)

(assert (=> b!1221679 (= lt!555589 (-!1898 lt!555586 k0!934))))

(assert (=> b!1221679 (= lt!555591 (getCurrentListMapNoExtraKeys!5506 lt!555587 lt!555582 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221679 (= lt!555586 (getCurrentListMapNoExtraKeys!5506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555590 () Unit!40313)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 (array!78794 array!78796 (_ BitVec 32) (_ BitVec 32) V!46521 V!46521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40313)

(assert (=> b!1221679 (= lt!555590 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1133 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221680 () Bool)

(declare-fun res!811609 () Bool)

(assert (=> b!1221680 (=> (not res!811609) (not e!693789))))

(assert (=> b!1221680 (= res!811609 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26918))))

(declare-fun b!1221681 () Bool)

(declare-fun res!811615 () Bool)

(assert (=> b!1221681 (=> res!811615 e!693787)))

(assert (=> b!1221681 (= res!811615 (contains!7002 Nil!26918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221682 () Bool)

(declare-fun res!811618 () Bool)

(assert (=> b!1221682 (=> (not res!811618) (not e!693789))))

(assert (=> b!1221682 (= res!811618 (= (select (arr!38025 _keys!1208) i!673) k0!934))))

(declare-fun b!1221683 () Bool)

(declare-fun res!811610 () Bool)

(assert (=> b!1221683 (=> res!811610 e!693787)))

(declare-fun noDuplicate!1649 (List!26921) Bool)

(assert (=> b!1221683 (= res!811610 (not (noDuplicate!1649 Nil!26918)))))

(declare-fun b!1221684 () Bool)

(declare-fun res!811607 () Bool)

(assert (=> b!1221684 (=> (not res!811607) (not e!693789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221684 (= res!811607 (validMask!0 mask!1564))))

(declare-fun b!1221685 () Bool)

(assert (=> b!1221685 (= e!693788 tp_is_empty!31045)))

(declare-fun b!1221686 () Bool)

(declare-fun res!811611 () Bool)

(assert (=> b!1221686 (=> (not res!811611) (not e!693789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78794 (_ BitVec 32)) Bool)

(assert (=> b!1221686 (= res!811611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221687 () Bool)

(assert (=> b!1221687 (= e!693789 e!693786)))

(declare-fun res!811604 () Bool)

(assert (=> b!1221687 (=> (not res!811604) (not e!693786))))

(assert (=> b!1221687 (= res!811604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555587 mask!1564))))

(assert (=> b!1221687 (= lt!555587 (array!78795 (store (arr!38025 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38563 _keys!1208)))))

(declare-fun res!811616 () Bool)

(assert (=> start!101614 (=> (not res!811616) (not e!693789))))

(assert (=> start!101614 (= res!811616 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38563 _keys!1208))))))

(assert (=> start!101614 e!693789))

(assert (=> start!101614 tp_is_empty!31045))

(declare-fun array_inv!29060 (array!78794) Bool)

(assert (=> start!101614 (array_inv!29060 _keys!1208)))

(assert (=> start!101614 true))

(assert (=> start!101614 tp!92065))

(declare-fun array_inv!29061 (array!78796) Bool)

(assert (=> start!101614 (and (array_inv!29061 _values!996) e!693791)))

(declare-fun b!1221675 () Bool)

(declare-fun res!811603 () Bool)

(assert (=> b!1221675 (=> (not res!811603) (not e!693789))))

(assert (=> b!1221675 (= res!811603 (and (= (size!38564 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38563 _keys!1208) (size!38564 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101614 res!811616) b!1221684))

(assert (= (and b!1221684 res!811607) b!1221675))

(assert (= (and b!1221675 res!811603) b!1221686))

(assert (= (and b!1221686 res!811611) b!1221680))

(assert (= (and b!1221680 res!811609) b!1221677))

(assert (= (and b!1221677 res!811600) b!1221669))

(assert (= (and b!1221669 res!811614) b!1221682))

(assert (= (and b!1221682 res!811618) b!1221687))

(assert (= (and b!1221687 res!811604) b!1221670))

(assert (= (and b!1221670 res!811601) b!1221674))

(assert (= (and b!1221674 (not res!811608)) b!1221678))

(assert (= (and b!1221678 (not res!811613)) b!1221679))

(assert (= (and b!1221679 (not res!811606)) b!1221673))

(assert (= (and b!1221673 res!811612) b!1221667))

(assert (= (and b!1221667 (not res!811617)) b!1221666))

(assert (= (and b!1221673 (not res!811605)) b!1221671))

(assert (= (and b!1221671 (not res!811602)) b!1221683))

(assert (= (and b!1221683 (not res!811610)) b!1221681))

(assert (= (and b!1221681 (not res!811615)) b!1221668))

(assert (= (and b!1221672 condMapEmpty!48463) mapIsEmpty!48463))

(assert (= (and b!1221672 (not condMapEmpty!48463)) mapNonEmpty!48463))

(get-info :version)

(assert (= (and mapNonEmpty!48463 ((_ is ValueCellFull!14813) mapValue!48463)) b!1221676))

(assert (= (and b!1221672 ((_ is ValueCellFull!14813) mapDefault!48463)) b!1221685))

(assert (= start!101614 b!1221672))

(declare-fun b_lambda!22273 () Bool)

(assert (=> (not b_lambda!22273) (not b!1221678)))

(declare-fun t!40232 () Bool)

(declare-fun tb!11133 () Bool)

(assert (=> (and start!101614 (= defaultEntry!1004 defaultEntry!1004) t!40232) tb!11133))

(declare-fun result!22885 () Bool)

(assert (=> tb!11133 (= result!22885 tp_is_empty!31045)))

(assert (=> b!1221678 t!40232))

(declare-fun b_and!43909 () Bool)

(assert (= b_and!43907 (and (=> t!40232 result!22885) b_and!43909)))

(declare-fun m!1126121 () Bool)

(assert (=> b!1221680 m!1126121))

(declare-fun m!1126123 () Bool)

(assert (=> b!1221682 m!1126123))

(declare-fun m!1126125 () Bool)

(assert (=> b!1221673 m!1126125))

(declare-fun m!1126127 () Bool)

(assert (=> b!1221673 m!1126127))

(assert (=> b!1221673 m!1126127))

(declare-fun m!1126129 () Bool)

(assert (=> b!1221673 m!1126129))

(declare-fun m!1126131 () Bool)

(assert (=> b!1221673 m!1126131))

(declare-fun m!1126133 () Bool)

(assert (=> b!1221666 m!1126133))

(declare-fun m!1126135 () Bool)

(assert (=> b!1221683 m!1126135))

(declare-fun m!1126137 () Bool)

(assert (=> start!101614 m!1126137))

(declare-fun m!1126139 () Bool)

(assert (=> start!101614 m!1126139))

(declare-fun m!1126141 () Bool)

(assert (=> b!1221670 m!1126141))

(declare-fun m!1126143 () Bool)

(assert (=> b!1221678 m!1126143))

(declare-fun m!1126145 () Bool)

(assert (=> b!1221678 m!1126145))

(declare-fun m!1126147 () Bool)

(assert (=> b!1221678 m!1126147))

(declare-fun m!1126149 () Bool)

(assert (=> b!1221678 m!1126149))

(declare-fun m!1126151 () Bool)

(assert (=> b!1221674 m!1126151))

(declare-fun m!1126153 () Bool)

(assert (=> b!1221674 m!1126153))

(declare-fun m!1126155 () Bool)

(assert (=> b!1221669 m!1126155))

(declare-fun m!1126157 () Bool)

(assert (=> mapNonEmpty!48463 m!1126157))

(declare-fun m!1126159 () Bool)

(assert (=> b!1221671 m!1126159))

(declare-fun m!1126161 () Bool)

(assert (=> b!1221671 m!1126161))

(declare-fun m!1126163 () Bool)

(assert (=> b!1221671 m!1126163))

(declare-fun m!1126165 () Bool)

(assert (=> b!1221671 m!1126165))

(declare-fun m!1126167 () Bool)

(assert (=> b!1221686 m!1126167))

(declare-fun m!1126169 () Bool)

(assert (=> b!1221687 m!1126169))

(declare-fun m!1126171 () Bool)

(assert (=> b!1221687 m!1126171))

(declare-fun m!1126173 () Bool)

(assert (=> b!1221679 m!1126173))

(declare-fun m!1126175 () Bool)

(assert (=> b!1221679 m!1126175))

(declare-fun m!1126177 () Bool)

(assert (=> b!1221679 m!1126177))

(declare-fun m!1126179 () Bool)

(assert (=> b!1221679 m!1126179))

(assert (=> b!1221679 m!1126125))

(declare-fun m!1126181 () Bool)

(assert (=> b!1221679 m!1126181))

(assert (=> b!1221679 m!1126125))

(declare-fun m!1126183 () Bool)

(assert (=> b!1221684 m!1126183))

(declare-fun m!1126185 () Bool)

(assert (=> b!1221681 m!1126185))

(assert (=> b!1221667 m!1126125))

(declare-fun m!1126187 () Bool)

(assert (=> b!1221668 m!1126187))

(check-sat (not mapNonEmpty!48463) (not b!1221679) (not b!1221670) (not b!1221671) (not b!1221668) (not b!1221680) (not b!1221669) (not b!1221674) (not b!1221681) (not b_next!26341) (not b!1221687) (not b!1221666) (not b!1221673) b_and!43909 (not b_lambda!22273) tp_is_empty!31045 (not start!101614) (not b!1221678) (not b!1221683) (not b!1221684) (not b!1221686))
(check-sat b_and!43909 (not b_next!26341))
