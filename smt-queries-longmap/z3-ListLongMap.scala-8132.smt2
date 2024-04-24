; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99894 () Bool)

(assert start!99894)

(declare-fun b_free!25237 () Bool)

(declare-fun b_next!25237 () Bool)

(assert (=> start!99894 (= b_free!25237 (not b_next!25237))))

(declare-fun tp!88424 () Bool)

(declare-fun b_and!41343 () Bool)

(assert (=> start!99894 (= tp!88424 b_and!41343)))

(declare-fun b!1182922 () Bool)

(declare-datatypes ((Unit!39072 0))(
  ( (Unit!39073) )
))
(declare-fun e!672635 () Unit!39072)

(declare-fun Unit!39074 () Unit!39072)

(assert (=> b!1182922 (= e!672635 Unit!39074)))

(declare-fun b!1182923 () Bool)

(declare-fun res!785745 () Bool)

(declare-fun e!672629 () Bool)

(assert (=> b!1182923 (=> (not res!785745) (not e!672629))))

(declare-datatypes ((array!76385 0))(
  ( (array!76386 (arr!36836 (Array (_ BitVec 32) (_ BitVec 64))) (size!37373 (_ BitVec 32))) )
))
(declare-fun lt!535006 () array!76385)

(declare-datatypes ((List!25915 0))(
  ( (Nil!25912) (Cons!25911 (h!27129 (_ BitVec 64)) (t!38136 List!25915)) )
))
(declare-fun arrayNoDuplicates!0 (array!76385 (_ BitVec 32) List!25915) Bool)

(assert (=> b!1182923 (= res!785745 (arrayNoDuplicates!0 lt!535006 #b00000000000000000000000000000000 Nil!25912))))

(declare-fun b!1182924 () Bool)

(declare-fun e!672632 () Bool)

(declare-fun e!672631 () Bool)

(assert (=> b!1182924 (= e!672632 e!672631)))

(declare-fun res!785742 () Bool)

(assert (=> b!1182924 (=> res!785742 e!672631)))

(declare-fun _keys!1208 () array!76385)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182924 (= res!785742 (not (= (select (arr!36836 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46478 () Bool)

(declare-fun mapRes!46478 () Bool)

(assert (=> mapIsEmpty!46478 mapRes!46478))

(declare-fun b!1182925 () Bool)

(declare-fun res!785748 () Bool)

(declare-fun e!672636 () Bool)

(assert (=> b!1182925 (=> (not res!785748) (not e!672636))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182925 (= res!785748 (= (select (arr!36836 _keys!1208) i!673) k0!934))))

(declare-fun b!1182926 () Bool)

(declare-fun e!672627 () Bool)

(declare-fun tp_is_empty!29767 () Bool)

(assert (=> b!1182926 (= e!672627 tp_is_empty!29767)))

(declare-fun mapNonEmpty!46478 () Bool)

(declare-fun tp!88425 () Bool)

(declare-fun e!672638 () Bool)

(assert (=> mapNonEmpty!46478 (= mapRes!46478 (and tp!88425 e!672638))))

(declare-datatypes ((V!44817 0))(
  ( (V!44818 (val!14940 Int)) )
))
(declare-datatypes ((ValueCell!14174 0))(
  ( (ValueCellFull!14174 (v!17574 V!44817)) (EmptyCell!14174) )
))
(declare-fun mapValue!46478 () ValueCell!14174)

(declare-fun mapRest!46478 () (Array (_ BitVec 32) ValueCell!14174))

(declare-datatypes ((array!76387 0))(
  ( (array!76388 (arr!36837 (Array (_ BitVec 32) ValueCell!14174)) (size!37374 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76387)

(declare-fun mapKey!46478 () (_ BitVec 32))

(assert (=> mapNonEmpty!46478 (= (arr!36837 _values!996) (store mapRest!46478 mapKey!46478 mapValue!46478))))

(declare-fun b!1182927 () Bool)

(declare-fun e!672637 () Bool)

(assert (=> b!1182927 (= e!672637 (and e!672627 mapRes!46478))))

(declare-fun condMapEmpty!46478 () Bool)

(declare-fun mapDefault!46478 () ValueCell!14174)

(assert (=> b!1182927 (= condMapEmpty!46478 (= (arr!36837 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14174)) mapDefault!46478)))))

(declare-fun b!1182928 () Bool)

(declare-fun Unit!39075 () Unit!39072)

(assert (=> b!1182928 (= e!672635 Unit!39075)))

(declare-fun lt!534992 () Unit!39072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39072)

(assert (=> b!1182928 (= lt!534992 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182928 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534993 () Unit!39072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76385 (_ BitVec 32) (_ BitVec 32)) Unit!39072)

(assert (=> b!1182928 (= lt!534993 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182928 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25912)))

(declare-fun lt!535001 () Unit!39072)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76385 (_ BitVec 64) (_ BitVec 32) List!25915) Unit!39072)

(assert (=> b!1182928 (= lt!535001 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25912))))

(assert (=> b!1182928 false))

(declare-fun b!1182929 () Bool)

(assert (=> b!1182929 (= e!672636 e!672629)))

(declare-fun res!785751 () Bool)

(assert (=> b!1182929 (=> (not res!785751) (not e!672629))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76385 (_ BitVec 32)) Bool)

(assert (=> b!1182929 (= res!785751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535006 mask!1564))))

(assert (=> b!1182929 (= lt!535006 (array!76386 (store (arr!36836 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37373 _keys!1208)))))

(declare-fun b!1182930 () Bool)

(declare-fun res!785756 () Bool)

(assert (=> b!1182930 (=> (not res!785756) (not e!672636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182930 (= res!785756 (validKeyInArray!0 k0!934))))

(declare-fun res!785750 () Bool)

(assert (=> start!99894 (=> (not res!785750) (not e!672636))))

(assert (=> start!99894 (= res!785750 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37373 _keys!1208))))))

(assert (=> start!99894 e!672636))

(assert (=> start!99894 tp_is_empty!29767))

(declare-fun array_inv!28196 (array!76385) Bool)

(assert (=> start!99894 (array_inv!28196 _keys!1208)))

(assert (=> start!99894 true))

(assert (=> start!99894 tp!88424))

(declare-fun array_inv!28197 (array!76387) Bool)

(assert (=> start!99894 (and (array_inv!28197 _values!996) e!672637)))

(declare-fun b!1182931 () Bool)

(assert (=> b!1182931 (= e!672638 tp_is_empty!29767)))

(declare-fun b!1182932 () Bool)

(declare-fun e!672628 () Bool)

(assert (=> b!1182932 (= e!672628 true)))

(declare-datatypes ((tuple2!19186 0))(
  ( (tuple2!19187 (_1!9604 (_ BitVec 64)) (_2!9604 V!44817)) )
))
(declare-datatypes ((List!25916 0))(
  ( (Nil!25913) (Cons!25912 (h!27130 tuple2!19186) (t!38137 List!25916)) )
))
(declare-datatypes ((ListLongMap!17163 0))(
  ( (ListLongMap!17164 (toList!8597 List!25916)) )
))
(declare-fun lt!534995 () ListLongMap!17163)

(declare-fun lt!535008 () ListLongMap!17163)

(declare-fun -!1620 (ListLongMap!17163 (_ BitVec 64)) ListLongMap!17163)

(assert (=> b!1182932 (= (-!1620 lt!534995 k0!934) lt!535008)))

(declare-fun lt!534998 () Unit!39072)

(declare-fun lt!535005 () V!44817)

(declare-fun lt!535007 () ListLongMap!17163)

(declare-fun addRemoveCommutativeForDiffKeys!136 (ListLongMap!17163 (_ BitVec 64) V!44817 (_ BitVec 64)) Unit!39072)

(assert (=> b!1182932 (= lt!534998 (addRemoveCommutativeForDiffKeys!136 lt!535007 (select (arr!36836 _keys!1208) from!1455) lt!535005 k0!934))))

(declare-fun lt!535002 () ListLongMap!17163)

(declare-fun lt!535004 () ListLongMap!17163)

(declare-fun lt!534997 () ListLongMap!17163)

(assert (=> b!1182932 (and (= lt!534997 lt!534995) (= lt!535004 lt!535002))))

(declare-fun lt!534996 () tuple2!19186)

(declare-fun +!3920 (ListLongMap!17163 tuple2!19186) ListLongMap!17163)

(assert (=> b!1182932 (= lt!534995 (+!3920 lt!535007 lt!534996))))

(assert (=> b!1182932 (not (= (select (arr!36836 _keys!1208) from!1455) k0!934))))

(declare-fun lt!534994 () Unit!39072)

(assert (=> b!1182932 (= lt!534994 e!672635)))

(declare-fun c!117377 () Bool)

(assert (=> b!1182932 (= c!117377 (= (select (arr!36836 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182932 e!672632))

(declare-fun res!785743 () Bool)

(assert (=> b!1182932 (=> (not res!785743) (not e!672632))))

(declare-fun lt!535003 () ListLongMap!17163)

(assert (=> b!1182932 (= res!785743 (= lt!535003 lt!535008))))

(assert (=> b!1182932 (= lt!535008 (+!3920 lt!535004 lt!534996))))

(assert (=> b!1182932 (= lt!534996 (tuple2!19187 (select (arr!36836 _keys!1208) from!1455) lt!535005))))

(declare-fun lt!534991 () V!44817)

(declare-fun get!18877 (ValueCell!14174 V!44817) V!44817)

(assert (=> b!1182932 (= lt!535005 (get!18877 (select (arr!36837 _values!996) from!1455) lt!534991))))

(declare-fun b!1182933 () Bool)

(declare-fun e!672633 () Bool)

(assert (=> b!1182933 (= e!672629 (not e!672633))))

(declare-fun res!785744 () Bool)

(assert (=> b!1182933 (=> res!785744 e!672633)))

(assert (=> b!1182933 (= res!785744 (bvsgt from!1455 i!673))))

(assert (=> b!1182933 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535000 () Unit!39072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76385 (_ BitVec 64) (_ BitVec 32)) Unit!39072)

(assert (=> b!1182933 (= lt!535000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182934 () Bool)

(declare-fun res!785747 () Bool)

(assert (=> b!1182934 (=> (not res!785747) (not e!672636))))

(assert (=> b!1182934 (= res!785747 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37373 _keys!1208))))))

(declare-fun b!1182935 () Bool)

(assert (=> b!1182935 (= e!672631 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182936 () Bool)

(declare-fun res!785755 () Bool)

(assert (=> b!1182936 (=> (not res!785755) (not e!672636))))

(assert (=> b!1182936 (= res!785755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182937 () Bool)

(declare-fun res!785749 () Bool)

(assert (=> b!1182937 (=> (not res!785749) (not e!672636))))

(assert (=> b!1182937 (= res!785749 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25912))))

(declare-fun b!1182938 () Bool)

(declare-fun res!785754 () Bool)

(assert (=> b!1182938 (=> (not res!785754) (not e!672636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182938 (= res!785754 (validMask!0 mask!1564))))

(declare-fun b!1182939 () Bool)

(declare-fun res!785746 () Bool)

(assert (=> b!1182939 (=> (not res!785746) (not e!672636))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1182939 (= res!785746 (and (= (size!37374 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37373 _keys!1208) (size!37374 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182940 () Bool)

(declare-fun e!672634 () Bool)

(assert (=> b!1182940 (= e!672634 e!672628)))

(declare-fun res!785752 () Bool)

(assert (=> b!1182940 (=> res!785752 e!672628)))

(assert (=> b!1182940 (= res!785752 (not (validKeyInArray!0 (select (arr!36836 _keys!1208) from!1455))))))

(assert (=> b!1182940 (= lt!535002 lt!535004)))

(assert (=> b!1182940 (= lt!535004 (-!1620 lt!535007 k0!934))))

(declare-fun zeroValue!944 () V!44817)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44817)

(declare-fun lt!534999 () array!76387)

(declare-fun getCurrentListMapNoExtraKeys!5070 (array!76385 array!76387 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) Int) ListLongMap!17163)

(assert (=> b!1182940 (= lt!535002 (getCurrentListMapNoExtraKeys!5070 lt!535006 lt!534999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182940 (= lt!535007 (getCurrentListMapNoExtraKeys!5070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535009 () Unit!39072)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 (array!76385 array!76387 (_ BitVec 32) (_ BitVec 32) V!44817 V!44817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39072)

(assert (=> b!1182940 (= lt!535009 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182941 () Bool)

(assert (=> b!1182941 (= e!672633 e!672634)))

(declare-fun res!785753 () Bool)

(assert (=> b!1182941 (=> res!785753 e!672634)))

(assert (=> b!1182941 (= res!785753 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1182941 (= lt!535003 (getCurrentListMapNoExtraKeys!5070 lt!535006 lt!534999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182941 (= lt!534999 (array!76388 (store (arr!36837 _values!996) i!673 (ValueCellFull!14174 lt!534991)) (size!37374 _values!996)))))

(declare-fun dynLambda!3036 (Int (_ BitVec 64)) V!44817)

(assert (=> b!1182941 (= lt!534991 (dynLambda!3036 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182941 (= lt!534997 (getCurrentListMapNoExtraKeys!5070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99894 res!785750) b!1182938))

(assert (= (and b!1182938 res!785754) b!1182939))

(assert (= (and b!1182939 res!785746) b!1182936))

(assert (= (and b!1182936 res!785755) b!1182937))

(assert (= (and b!1182937 res!785749) b!1182934))

(assert (= (and b!1182934 res!785747) b!1182930))

(assert (= (and b!1182930 res!785756) b!1182925))

(assert (= (and b!1182925 res!785748) b!1182929))

(assert (= (and b!1182929 res!785751) b!1182923))

(assert (= (and b!1182923 res!785745) b!1182933))

(assert (= (and b!1182933 (not res!785744)) b!1182941))

(assert (= (and b!1182941 (not res!785753)) b!1182940))

(assert (= (and b!1182940 (not res!785752)) b!1182932))

(assert (= (and b!1182932 res!785743) b!1182924))

(assert (= (and b!1182924 (not res!785742)) b!1182935))

(assert (= (and b!1182932 c!117377) b!1182928))

(assert (= (and b!1182932 (not c!117377)) b!1182922))

(assert (= (and b!1182927 condMapEmpty!46478) mapIsEmpty!46478))

(assert (= (and b!1182927 (not condMapEmpty!46478)) mapNonEmpty!46478))

(get-info :version)

(assert (= (and mapNonEmpty!46478 ((_ is ValueCellFull!14174) mapValue!46478)) b!1182931))

(assert (= (and b!1182927 ((_ is ValueCellFull!14174) mapDefault!46478)) b!1182926))

(assert (= start!99894 b!1182927))

(declare-fun b_lambda!20375 () Bool)

(assert (=> (not b_lambda!20375) (not b!1182941)))

(declare-fun t!38135 () Bool)

(declare-fun tb!10041 () Bool)

(assert (=> (and start!99894 (= defaultEntry!1004 defaultEntry!1004) t!38135) tb!10041))

(declare-fun result!20657 () Bool)

(assert (=> tb!10041 (= result!20657 tp_is_empty!29767)))

(assert (=> b!1182941 t!38135))

(declare-fun b_and!41345 () Bool)

(assert (= b_and!41343 (and (=> t!38135 result!20657) b_and!41345)))

(declare-fun m!1091127 () Bool)

(assert (=> b!1182940 m!1091127))

(declare-fun m!1091129 () Bool)

(assert (=> b!1182940 m!1091129))

(declare-fun m!1091131 () Bool)

(assert (=> b!1182940 m!1091131))

(declare-fun m!1091133 () Bool)

(assert (=> b!1182940 m!1091133))

(assert (=> b!1182940 m!1091129))

(declare-fun m!1091135 () Bool)

(assert (=> b!1182940 m!1091135))

(declare-fun m!1091137 () Bool)

(assert (=> b!1182940 m!1091137))

(declare-fun m!1091139 () Bool)

(assert (=> b!1182933 m!1091139))

(declare-fun m!1091141 () Bool)

(assert (=> b!1182933 m!1091141))

(declare-fun m!1091143 () Bool)

(assert (=> b!1182937 m!1091143))

(declare-fun m!1091145 () Bool)

(assert (=> b!1182925 m!1091145))

(assert (=> b!1182932 m!1091129))

(declare-fun m!1091147 () Bool)

(assert (=> b!1182932 m!1091147))

(declare-fun m!1091149 () Bool)

(assert (=> b!1182932 m!1091149))

(declare-fun m!1091151 () Bool)

(assert (=> b!1182932 m!1091151))

(assert (=> b!1182932 m!1091151))

(declare-fun m!1091153 () Bool)

(assert (=> b!1182932 m!1091153))

(declare-fun m!1091155 () Bool)

(assert (=> b!1182932 m!1091155))

(declare-fun m!1091157 () Bool)

(assert (=> b!1182932 m!1091157))

(assert (=> b!1182932 m!1091129))

(declare-fun m!1091159 () Bool)

(assert (=> mapNonEmpty!46478 m!1091159))

(declare-fun m!1091161 () Bool)

(assert (=> b!1182941 m!1091161))

(declare-fun m!1091163 () Bool)

(assert (=> b!1182941 m!1091163))

(declare-fun m!1091165 () Bool)

(assert (=> b!1182941 m!1091165))

(declare-fun m!1091167 () Bool)

(assert (=> b!1182941 m!1091167))

(declare-fun m!1091169 () Bool)

(assert (=> b!1182929 m!1091169))

(declare-fun m!1091171 () Bool)

(assert (=> b!1182929 m!1091171))

(declare-fun m!1091173 () Bool)

(assert (=> start!99894 m!1091173))

(declare-fun m!1091175 () Bool)

(assert (=> start!99894 m!1091175))

(declare-fun m!1091177 () Bool)

(assert (=> b!1182923 m!1091177))

(declare-fun m!1091179 () Bool)

(assert (=> b!1182938 m!1091179))

(assert (=> b!1182924 m!1091129))

(declare-fun m!1091181 () Bool)

(assert (=> b!1182935 m!1091181))

(declare-fun m!1091183 () Bool)

(assert (=> b!1182930 m!1091183))

(declare-fun m!1091185 () Bool)

(assert (=> b!1182928 m!1091185))

(declare-fun m!1091187 () Bool)

(assert (=> b!1182928 m!1091187))

(declare-fun m!1091189 () Bool)

(assert (=> b!1182928 m!1091189))

(declare-fun m!1091191 () Bool)

(assert (=> b!1182928 m!1091191))

(declare-fun m!1091193 () Bool)

(assert (=> b!1182928 m!1091193))

(declare-fun m!1091195 () Bool)

(assert (=> b!1182936 m!1091195))

(check-sat (not b!1182938) (not b!1182930) (not mapNonEmpty!46478) (not b!1182941) tp_is_empty!29767 (not b!1182928) (not start!99894) (not b!1182936) (not b!1182933) (not b!1182940) (not b_next!25237) (not b_lambda!20375) (not b!1182932) (not b!1182935) b_and!41345 (not b!1182929) (not b!1182923) (not b!1182937))
(check-sat b_and!41345 (not b_next!25237))
