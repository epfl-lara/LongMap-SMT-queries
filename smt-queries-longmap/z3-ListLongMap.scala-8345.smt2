; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101622 () Bool)

(assert start!101622)

(declare-fun b_free!26343 () Bool)

(declare-fun b_next!26343 () Bool)

(assert (=> start!101622 (= b_free!26343 (not b_next!26343))))

(declare-fun tp!92071 () Bool)

(declare-fun b_and!43929 () Bool)

(assert (=> start!101622 (= tp!92071 b_and!43929)))

(declare-fun b!1221843 () Bool)

(declare-fun res!811732 () Bool)

(declare-fun e!693891 () Bool)

(assert (=> b!1221843 (=> (not res!811732) (not e!693891))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221843 (= res!811732 (validKeyInArray!0 k0!934))))

(declare-fun b!1221844 () Bool)

(declare-fun e!693903 () Bool)

(declare-fun e!693899 () Bool)

(assert (=> b!1221844 (= e!693903 e!693899)))

(declare-fun res!811736 () Bool)

(assert (=> b!1221844 (=> res!811736 e!693899)))

(declare-datatypes ((array!78877 0))(
  ( (array!78878 (arr!38066 (Array (_ BitVec 32) (_ BitVec 64))) (size!38602 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78877)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221844 (= res!811736 (not (validKeyInArray!0 (select (arr!38066 _keys!1208) from!1455))))))

(declare-datatypes ((V!46523 0))(
  ( (V!46524 (val!15580 Int)) )
))
(declare-datatypes ((tuple2!20064 0))(
  ( (tuple2!20065 (_1!10043 (_ BitVec 64)) (_2!10043 V!46523)) )
))
(declare-datatypes ((List!26864 0))(
  ( (Nil!26861) (Cons!26860 (h!28069 tuple2!20064) (t!40187 List!26864)) )
))
(declare-datatypes ((ListLongMap!18033 0))(
  ( (ListLongMap!18034 (toList!9032 List!26864)) )
))
(declare-fun lt!555800 () ListLongMap!18033)

(declare-fun lt!555801 () ListLongMap!18033)

(assert (=> b!1221844 (= lt!555800 lt!555801)))

(declare-fun lt!555807 () ListLongMap!18033)

(declare-fun -!1937 (ListLongMap!18033 (_ BitVec 64)) ListLongMap!18033)

(assert (=> b!1221844 (= lt!555801 (-!1937 lt!555807 k0!934))))

(declare-fun zeroValue!944 () V!46523)

(declare-datatypes ((ValueCell!14814 0))(
  ( (ValueCellFull!14814 (v!18241 V!46523)) (EmptyCell!14814) )
))
(declare-datatypes ((array!78879 0))(
  ( (array!78880 (arr!38067 (Array (_ BitVec 32) ValueCell!14814)) (size!38603 (_ BitVec 32))) )
))
(declare-fun lt!555804 () array!78879)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46523)

(declare-fun lt!555811 () array!78877)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5454 (array!78877 array!78879 (_ BitVec 32) (_ BitVec 32) V!46523 V!46523 (_ BitVec 32) Int) ListLongMap!18033)

(assert (=> b!1221844 (= lt!555800 (getCurrentListMapNoExtraKeys!5454 lt!555811 lt!555804 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78879)

(assert (=> b!1221844 (= lt!555807 (getCurrentListMapNoExtraKeys!5454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40468 0))(
  ( (Unit!40469) )
))
(declare-fun lt!555806 () Unit!40468)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1144 (array!78877 array!78879 (_ BitVec 32) (_ BitVec 32) V!46523 V!46523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40468)

(assert (=> b!1221844 (= lt!555806 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221845 () Bool)

(declare-fun res!811721 () Bool)

(assert (=> b!1221845 (=> (not res!811721) (not e!693891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221845 (= res!811721 (validMask!0 mask!1564))))

(declare-fun b!1221846 () Bool)

(declare-fun e!693897 () Bool)

(declare-fun tp_is_empty!31047 () Bool)

(assert (=> b!1221846 (= e!693897 tp_is_empty!31047)))

(declare-fun b!1221847 () Bool)

(declare-fun res!811722 () Bool)

(assert (=> b!1221847 (=> (not res!811722) (not e!693891))))

(assert (=> b!1221847 (= res!811722 (= (select (arr!38066 _keys!1208) i!673) k0!934))))

(declare-fun b!1221848 () Bool)

(declare-fun e!693898 () Bool)

(declare-fun e!693902 () Bool)

(assert (=> b!1221848 (= e!693898 e!693902)))

(declare-fun res!811725 () Bool)

(assert (=> b!1221848 (=> res!811725 e!693902)))

(assert (=> b!1221848 (= res!811725 (not (= (select (arr!38066 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221849 () Bool)

(declare-fun res!811731 () Bool)

(declare-fun e!693892 () Bool)

(assert (=> b!1221849 (=> res!811731 e!693892)))

(declare-datatypes ((List!26865 0))(
  ( (Nil!26862) (Cons!26861 (h!28070 (_ BitVec 64)) (t!40188 List!26865)) )
))
(declare-fun contains!7029 (List!26865 (_ BitVec 64)) Bool)

(assert (=> b!1221849 (= res!811731 (contains!7029 Nil!26862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221850 () Bool)

(declare-fun res!811724 () Bool)

(declare-fun e!693896 () Bool)

(assert (=> b!1221850 (=> (not res!811724) (not e!693896))))

(declare-fun arrayNoDuplicates!0 (array!78877 (_ BitVec 32) List!26865) Bool)

(assert (=> b!1221850 (= res!811724 (arrayNoDuplicates!0 lt!555811 #b00000000000000000000000000000000 Nil!26862))))

(declare-fun b!1221851 () Bool)

(declare-fun res!811734 () Bool)

(assert (=> b!1221851 (=> (not res!811734) (not e!693891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78877 (_ BitVec 32)) Bool)

(assert (=> b!1221851 (= res!811734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221852 () Bool)

(declare-fun res!811727 () Bool)

(assert (=> b!1221852 (=> (not res!811727) (not e!693891))))

(assert (=> b!1221852 (= res!811727 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26862))))

(declare-fun b!1221853 () Bool)

(declare-fun e!693900 () Bool)

(declare-fun e!693894 () Bool)

(declare-fun mapRes!48466 () Bool)

(assert (=> b!1221853 (= e!693900 (and e!693894 mapRes!48466))))

(declare-fun condMapEmpty!48466 () Bool)

(declare-fun mapDefault!48466 () ValueCell!14814)

(assert (=> b!1221853 (= condMapEmpty!48466 (= (arr!38067 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14814)) mapDefault!48466)))))

(declare-fun mapIsEmpty!48466 () Bool)

(assert (=> mapIsEmpty!48466 mapRes!48466))

(declare-fun b!1221854 () Bool)

(declare-fun e!693901 () Bool)

(assert (=> b!1221854 (= e!693896 (not e!693901))))

(declare-fun res!811728 () Bool)

(assert (=> b!1221854 (=> res!811728 e!693901)))

(assert (=> b!1221854 (= res!811728 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221854 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555803 () Unit!40468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78877 (_ BitVec 64) (_ BitVec 32)) Unit!40468)

(assert (=> b!1221854 (= lt!555803 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221855 () Bool)

(declare-fun res!811733 () Bool)

(assert (=> b!1221855 (=> (not res!811733) (not e!693891))))

(assert (=> b!1221855 (= res!811733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38602 _keys!1208))))))

(declare-fun res!811718 () Bool)

(assert (=> start!101622 (=> (not res!811718) (not e!693891))))

(assert (=> start!101622 (= res!811718 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38602 _keys!1208))))))

(assert (=> start!101622 e!693891))

(assert (=> start!101622 tp_is_empty!31047))

(declare-fun array_inv!28962 (array!78877) Bool)

(assert (=> start!101622 (array_inv!28962 _keys!1208)))

(assert (=> start!101622 true))

(assert (=> start!101622 tp!92071))

(declare-fun array_inv!28963 (array!78879) Bool)

(assert (=> start!101622 (and (array_inv!28963 _values!996) e!693900)))

(declare-fun b!1221856 () Bool)

(assert (=> b!1221856 (= e!693901 e!693903)))

(declare-fun res!811719 () Bool)

(assert (=> b!1221856 (=> res!811719 e!693903)))

(assert (=> b!1221856 (= res!811719 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!555802 () ListLongMap!18033)

(assert (=> b!1221856 (= lt!555802 (getCurrentListMapNoExtraKeys!5454 lt!555811 lt!555804 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555810 () V!46523)

(assert (=> b!1221856 (= lt!555804 (array!78880 (store (arr!38067 _values!996) i!673 (ValueCellFull!14814 lt!555810)) (size!38603 _values!996)))))

(declare-fun dynLambda!3333 (Int (_ BitVec 64)) V!46523)

(assert (=> b!1221856 (= lt!555810 (dynLambda!3333 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555808 () ListLongMap!18033)

(assert (=> b!1221856 (= lt!555808 (getCurrentListMapNoExtraKeys!5454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221857 () Bool)

(assert (=> b!1221857 (= e!693891 e!693896)))

(declare-fun res!811729 () Bool)

(assert (=> b!1221857 (=> (not res!811729) (not e!693896))))

(assert (=> b!1221857 (= res!811729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555811 mask!1564))))

(assert (=> b!1221857 (= lt!555811 (array!78878 (store (arr!38066 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38602 _keys!1208)))))

(declare-fun b!1221858 () Bool)

(declare-fun res!811726 () Bool)

(assert (=> b!1221858 (=> res!811726 e!693892)))

(declare-fun noDuplicate!1633 (List!26865) Bool)

(assert (=> b!1221858 (= res!811726 (not (noDuplicate!1633 Nil!26862)))))

(declare-fun b!1221859 () Bool)

(declare-fun e!693895 () Bool)

(assert (=> b!1221859 (= e!693899 e!693895)))

(declare-fun res!811723 () Bool)

(assert (=> b!1221859 (=> res!811723 e!693895)))

(assert (=> b!1221859 (= res!811723 (not (= (select (arr!38066 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221859 e!693898))

(declare-fun res!811735 () Bool)

(assert (=> b!1221859 (=> (not res!811735) (not e!693898))))

(declare-fun +!4095 (ListLongMap!18033 tuple2!20064) ListLongMap!18033)

(declare-fun get!19430 (ValueCell!14814 V!46523) V!46523)

(assert (=> b!1221859 (= res!811735 (= lt!555802 (+!4095 lt!555801 (tuple2!20065 (select (arr!38066 _keys!1208) from!1455) (get!19430 (select (arr!38067 _values!996) from!1455) lt!555810)))))))

(declare-fun b!1221860 () Bool)

(assert (=> b!1221860 (= e!693892 true)))

(declare-fun lt!555799 () Bool)

(assert (=> b!1221860 (= lt!555799 (contains!7029 Nil!26862 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221861 () Bool)

(assert (=> b!1221861 (= e!693902 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48466 () Bool)

(declare-fun tp!92072 () Bool)

(assert (=> mapNonEmpty!48466 (= mapRes!48466 (and tp!92072 e!693897))))

(declare-fun mapRest!48466 () (Array (_ BitVec 32) ValueCell!14814))

(declare-fun mapValue!48466 () ValueCell!14814)

(declare-fun mapKey!48466 () (_ BitVec 32))

(assert (=> mapNonEmpty!48466 (= (arr!38067 _values!996) (store mapRest!48466 mapKey!48466 mapValue!48466))))

(declare-fun b!1221862 () Bool)

(declare-fun res!811720 () Bool)

(assert (=> b!1221862 (=> (not res!811720) (not e!693891))))

(assert (=> b!1221862 (= res!811720 (and (= (size!38603 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38602 _keys!1208) (size!38603 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221863 () Bool)

(assert (=> b!1221863 (= e!693895 e!693892)))

(declare-fun res!811730 () Bool)

(assert (=> b!1221863 (=> res!811730 e!693892)))

(assert (=> b!1221863 (= res!811730 (or (bvsge (size!38602 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)) (bvsge from!1455 (size!38602 _keys!1208))))))

(assert (=> b!1221863 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26862)))

(declare-fun lt!555805 () Unit!40468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78877 (_ BitVec 32) (_ BitVec 32)) Unit!40468)

(assert (=> b!1221863 (= lt!555805 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1221863 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555809 () Unit!40468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78877 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40468)

(assert (=> b!1221863 (= lt!555809 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221864 () Bool)

(assert (=> b!1221864 (= e!693894 tp_is_empty!31047)))

(assert (= (and start!101622 res!811718) b!1221845))

(assert (= (and b!1221845 res!811721) b!1221862))

(assert (= (and b!1221862 res!811720) b!1221851))

(assert (= (and b!1221851 res!811734) b!1221852))

(assert (= (and b!1221852 res!811727) b!1221855))

(assert (= (and b!1221855 res!811733) b!1221843))

(assert (= (and b!1221843 res!811732) b!1221847))

(assert (= (and b!1221847 res!811722) b!1221857))

(assert (= (and b!1221857 res!811729) b!1221850))

(assert (= (and b!1221850 res!811724) b!1221854))

(assert (= (and b!1221854 (not res!811728)) b!1221856))

(assert (= (and b!1221856 (not res!811719)) b!1221844))

(assert (= (and b!1221844 (not res!811736)) b!1221859))

(assert (= (and b!1221859 res!811735) b!1221848))

(assert (= (and b!1221848 (not res!811725)) b!1221861))

(assert (= (and b!1221859 (not res!811723)) b!1221863))

(assert (= (and b!1221863 (not res!811730)) b!1221858))

(assert (= (and b!1221858 (not res!811726)) b!1221849))

(assert (= (and b!1221849 (not res!811731)) b!1221860))

(assert (= (and b!1221853 condMapEmpty!48466) mapIsEmpty!48466))

(assert (= (and b!1221853 (not condMapEmpty!48466)) mapNonEmpty!48466))

(get-info :version)

(assert (= (and mapNonEmpty!48466 ((_ is ValueCellFull!14814) mapValue!48466)) b!1221846))

(assert (= (and b!1221853 ((_ is ValueCellFull!14814) mapDefault!48466)) b!1221864))

(assert (= start!101622 b!1221853))

(declare-fun b_lambda!22285 () Bool)

(assert (=> (not b_lambda!22285) (not b!1221856)))

(declare-fun t!40186 () Bool)

(declare-fun tb!11143 () Bool)

(assert (=> (and start!101622 (= defaultEntry!1004 defaultEntry!1004) t!40186) tb!11143))

(declare-fun result!22897 () Bool)

(assert (=> tb!11143 (= result!22897 tp_is_empty!31047)))

(assert (=> b!1221856 t!40186))

(declare-fun b_and!43931 () Bool)

(assert (= b_and!43929 (and (=> t!40186 result!22897) b_and!43931)))

(declare-fun m!1126753 () Bool)

(assert (=> b!1221860 m!1126753))

(declare-fun m!1126755 () Bool)

(assert (=> b!1221844 m!1126755))

(declare-fun m!1126757 () Bool)

(assert (=> b!1221844 m!1126757))

(declare-fun m!1126759 () Bool)

(assert (=> b!1221844 m!1126759))

(declare-fun m!1126761 () Bool)

(assert (=> b!1221844 m!1126761))

(declare-fun m!1126763 () Bool)

(assert (=> b!1221844 m!1126763))

(declare-fun m!1126765 () Bool)

(assert (=> b!1221844 m!1126765))

(assert (=> b!1221844 m!1126757))

(declare-fun m!1126767 () Bool)

(assert (=> b!1221847 m!1126767))

(declare-fun m!1126769 () Bool)

(assert (=> b!1221854 m!1126769))

(declare-fun m!1126771 () Bool)

(assert (=> b!1221854 m!1126771))

(declare-fun m!1126773 () Bool)

(assert (=> b!1221863 m!1126773))

(declare-fun m!1126775 () Bool)

(assert (=> b!1221863 m!1126775))

(declare-fun m!1126777 () Bool)

(assert (=> b!1221863 m!1126777))

(declare-fun m!1126779 () Bool)

(assert (=> b!1221863 m!1126779))

(declare-fun m!1126781 () Bool)

(assert (=> b!1221849 m!1126781))

(declare-fun m!1126783 () Bool)

(assert (=> b!1221845 m!1126783))

(declare-fun m!1126785 () Bool)

(assert (=> b!1221857 m!1126785))

(declare-fun m!1126787 () Bool)

(assert (=> b!1221857 m!1126787))

(assert (=> b!1221859 m!1126757))

(declare-fun m!1126789 () Bool)

(assert (=> b!1221859 m!1126789))

(assert (=> b!1221859 m!1126789))

(declare-fun m!1126791 () Bool)

(assert (=> b!1221859 m!1126791))

(declare-fun m!1126793 () Bool)

(assert (=> b!1221859 m!1126793))

(declare-fun m!1126795 () Bool)

(assert (=> b!1221850 m!1126795))

(declare-fun m!1126797 () Bool)

(assert (=> mapNonEmpty!48466 m!1126797))

(assert (=> b!1221848 m!1126757))

(declare-fun m!1126799 () Bool)

(assert (=> b!1221843 m!1126799))

(declare-fun m!1126801 () Bool)

(assert (=> b!1221861 m!1126801))

(declare-fun m!1126803 () Bool)

(assert (=> b!1221858 m!1126803))

(declare-fun m!1126805 () Bool)

(assert (=> b!1221851 m!1126805))

(declare-fun m!1126807 () Bool)

(assert (=> b!1221856 m!1126807))

(declare-fun m!1126809 () Bool)

(assert (=> b!1221856 m!1126809))

(declare-fun m!1126811 () Bool)

(assert (=> b!1221856 m!1126811))

(declare-fun m!1126813 () Bool)

(assert (=> b!1221856 m!1126813))

(declare-fun m!1126815 () Bool)

(assert (=> start!101622 m!1126815))

(declare-fun m!1126817 () Bool)

(assert (=> start!101622 m!1126817))

(declare-fun m!1126819 () Bool)

(assert (=> b!1221852 m!1126819))

(check-sat (not mapNonEmpty!48466) (not b!1221863) (not b!1221860) (not b!1221861) (not b!1221843) (not b!1221859) (not b!1221849) (not b!1221852) tp_is_empty!31047 (not b!1221856) (not b!1221845) (not b!1221857) b_and!43931 (not b!1221858) (not start!101622) (not b_lambda!22285) (not b!1221854) (not b!1221850) (not b_next!26343) (not b!1221851) (not b!1221844))
(check-sat b_and!43931 (not b_next!26343))
