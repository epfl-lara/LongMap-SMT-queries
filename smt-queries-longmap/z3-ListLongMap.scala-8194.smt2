; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100024 () Bool)

(assert start!100024)

(declare-fun b_free!25609 () Bool)

(declare-fun b_next!25609 () Bool)

(assert (=> start!100024 (= b_free!25609 (not b_next!25609))))

(declare-fun tp!89541 () Bool)

(declare-fun b_and!42063 () Bool)

(assert (=> start!100024 (= tp!89541 b_and!42063)))

(declare-fun b!1191861 () Bool)

(declare-fun e!677474 () Bool)

(declare-fun e!677475 () Bool)

(assert (=> b!1191861 (= e!677474 e!677475)))

(declare-fun res!792839 () Bool)

(assert (=> b!1191861 (=> res!792839 e!677475)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191861 (= res!792839 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45313 0))(
  ( (V!45314 (val!15126 Int)) )
))
(declare-fun zeroValue!944 () V!45313)

(declare-datatypes ((tuple2!19552 0))(
  ( (tuple2!19553 (_1!9787 (_ BitVec 64)) (_2!9787 V!45313)) )
))
(declare-datatypes ((List!26265 0))(
  ( (Nil!26262) (Cons!26261 (h!27470 tuple2!19552) (t!38857 List!26265)) )
))
(declare-datatypes ((ListLongMap!17521 0))(
  ( (ListLongMap!17522 (toList!8776 List!26265)) )
))
(declare-fun lt!541849 () ListLongMap!17521)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!45313)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14360 0))(
  ( (ValueCellFull!14360 (v!17763 V!45313)) (EmptyCell!14360) )
))
(declare-datatypes ((array!76998 0))(
  ( (array!76999 (arr!37149 (Array (_ BitVec 32) ValueCell!14360)) (size!37687 (_ BitVec 32))) )
))
(declare-fun lt!541853 () array!76998)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!77000 0))(
  ( (array!77001 (arr!37150 (Array (_ BitVec 32) (_ BitVec 64))) (size!37688 (_ BitVec 32))) )
))
(declare-fun lt!541851 () array!77000)

(declare-fun getCurrentListMapNoExtraKeys!5226 (array!77000 array!76998 (_ BitVec 32) (_ BitVec 32) V!45313 V!45313 (_ BitVec 32) Int) ListLongMap!17521)

(assert (=> b!1191861 (= lt!541849 (getCurrentListMapNoExtraKeys!5226 lt!541851 lt!541853 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76998)

(declare-fun dynLambda!3113 (Int (_ BitVec 64)) V!45313)

(assert (=> b!1191861 (= lt!541853 (array!76999 (store (arr!37149 _values!996) i!673 (ValueCellFull!14360 (dynLambda!3113 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37687 _values!996)))))

(declare-fun _keys!1208 () array!77000)

(declare-fun lt!541850 () ListLongMap!17521)

(assert (=> b!1191861 (= lt!541850 (getCurrentListMapNoExtraKeys!5226 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191862 () Bool)

(declare-fun res!792841 () Bool)

(declare-fun e!677471 () Bool)

(assert (=> b!1191862 (=> (not res!792841) (not e!677471))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191862 (= res!792841 (= (select (arr!37150 _keys!1208) i!673) k0!934))))

(declare-fun b!1191863 () Bool)

(declare-fun res!792840 () Bool)

(assert (=> b!1191863 (=> (not res!792840) (not e!677471))))

(assert (=> b!1191863 (= res!792840 (and (= (size!37687 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37688 _keys!1208) (size!37687 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191864 () Bool)

(declare-fun res!792834 () Bool)

(declare-fun e!677469 () Bool)

(assert (=> b!1191864 (=> (not res!792834) (not e!677469))))

(declare-datatypes ((List!26266 0))(
  ( (Nil!26263) (Cons!26262 (h!27471 (_ BitVec 64)) (t!38858 List!26266)) )
))
(declare-fun arrayNoDuplicates!0 (array!77000 (_ BitVec 32) List!26266) Bool)

(assert (=> b!1191864 (= res!792834 (arrayNoDuplicates!0 lt!541851 #b00000000000000000000000000000000 Nil!26263))))

(declare-fun b!1191865 () Bool)

(assert (=> b!1191865 (= e!677471 e!677469)))

(declare-fun res!792837 () Bool)

(assert (=> b!1191865 (=> (not res!792837) (not e!677469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77000 (_ BitVec 32)) Bool)

(assert (=> b!1191865 (= res!792837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541851 mask!1564))))

(assert (=> b!1191865 (= lt!541851 (array!77001 (store (arr!37150 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37688 _keys!1208)))))

(declare-fun mapNonEmpty!47036 () Bool)

(declare-fun mapRes!47036 () Bool)

(declare-fun tp!89540 () Bool)

(declare-fun e!677476 () Bool)

(assert (=> mapNonEmpty!47036 (= mapRes!47036 (and tp!89540 e!677476))))

(declare-fun mapKey!47036 () (_ BitVec 32))

(declare-fun mapValue!47036 () ValueCell!14360)

(declare-fun mapRest!47036 () (Array (_ BitVec 32) ValueCell!14360))

(assert (=> mapNonEmpty!47036 (= (arr!37149 _values!996) (store mapRest!47036 mapKey!47036 mapValue!47036))))

(declare-fun b!1191866 () Bool)

(declare-fun tp_is_empty!30139 () Bool)

(assert (=> b!1191866 (= e!677476 tp_is_empty!30139)))

(declare-fun b!1191867 () Bool)

(declare-fun res!792835 () Bool)

(assert (=> b!1191867 (=> (not res!792835) (not e!677471))))

(assert (=> b!1191867 (= res!792835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26263))))

(declare-fun b!1191868 () Bool)

(assert (=> b!1191868 (= e!677469 (not e!677474))))

(declare-fun res!792831 () Bool)

(assert (=> b!1191868 (=> res!792831 e!677474)))

(assert (=> b!1191868 (= res!792831 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191868 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39419 0))(
  ( (Unit!39420) )
))
(declare-fun lt!541854 () Unit!39419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77000 (_ BitVec 64) (_ BitVec 32)) Unit!39419)

(assert (=> b!1191868 (= lt!541854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191869 () Bool)

(declare-fun res!792838 () Bool)

(assert (=> b!1191869 (=> (not res!792838) (not e!677471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191869 (= res!792838 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47036 () Bool)

(assert (=> mapIsEmpty!47036 mapRes!47036))

(declare-fun res!792836 () Bool)

(assert (=> start!100024 (=> (not res!792836) (not e!677471))))

(assert (=> start!100024 (= res!792836 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37688 _keys!1208))))))

(assert (=> start!100024 e!677471))

(assert (=> start!100024 tp_is_empty!30139))

(declare-fun array_inv!28450 (array!77000) Bool)

(assert (=> start!100024 (array_inv!28450 _keys!1208)))

(assert (=> start!100024 true))

(assert (=> start!100024 tp!89541))

(declare-fun e!677472 () Bool)

(declare-fun array_inv!28451 (array!76998) Bool)

(assert (=> start!100024 (and (array_inv!28451 _values!996) e!677472)))

(declare-fun b!1191870 () Bool)

(assert (=> b!1191870 (= e!677475 true)))

(declare-fun -!1718 (ListLongMap!17521 (_ BitVec 64)) ListLongMap!17521)

(assert (=> b!1191870 (= (getCurrentListMapNoExtraKeys!5226 lt!541851 lt!541853 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1718 (getCurrentListMapNoExtraKeys!5226 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541852 () Unit!39419)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!968 (array!77000 array!76998 (_ BitVec 32) (_ BitVec 32) V!45313 V!45313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39419)

(assert (=> b!1191870 (= lt!541852 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!968 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191871 () Bool)

(declare-fun res!792832 () Bool)

(assert (=> b!1191871 (=> (not res!792832) (not e!677471))))

(assert (=> b!1191871 (= res!792832 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37688 _keys!1208))))))

(declare-fun b!1191872 () Bool)

(declare-fun res!792833 () Bool)

(assert (=> b!1191872 (=> (not res!792833) (not e!677471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191872 (= res!792833 (validKeyInArray!0 k0!934))))

(declare-fun b!1191873 () Bool)

(declare-fun e!677473 () Bool)

(assert (=> b!1191873 (= e!677472 (and e!677473 mapRes!47036))))

(declare-fun condMapEmpty!47036 () Bool)

(declare-fun mapDefault!47036 () ValueCell!14360)

(assert (=> b!1191873 (= condMapEmpty!47036 (= (arr!37149 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14360)) mapDefault!47036)))))

(declare-fun b!1191874 () Bool)

(declare-fun res!792830 () Bool)

(assert (=> b!1191874 (=> (not res!792830) (not e!677471))))

(assert (=> b!1191874 (= res!792830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191875 () Bool)

(assert (=> b!1191875 (= e!677473 tp_is_empty!30139)))

(assert (= (and start!100024 res!792836) b!1191869))

(assert (= (and b!1191869 res!792838) b!1191863))

(assert (= (and b!1191863 res!792840) b!1191874))

(assert (= (and b!1191874 res!792830) b!1191867))

(assert (= (and b!1191867 res!792835) b!1191871))

(assert (= (and b!1191871 res!792832) b!1191872))

(assert (= (and b!1191872 res!792833) b!1191862))

(assert (= (and b!1191862 res!792841) b!1191865))

(assert (= (and b!1191865 res!792837) b!1191864))

(assert (= (and b!1191864 res!792834) b!1191868))

(assert (= (and b!1191868 (not res!792831)) b!1191861))

(assert (= (and b!1191861 (not res!792839)) b!1191870))

(assert (= (and b!1191873 condMapEmpty!47036) mapIsEmpty!47036))

(assert (= (and b!1191873 (not condMapEmpty!47036)) mapNonEmpty!47036))

(get-info :version)

(assert (= (and mapNonEmpty!47036 ((_ is ValueCellFull!14360) mapValue!47036)) b!1191866))

(assert (= (and b!1191873 ((_ is ValueCellFull!14360) mapDefault!47036)) b!1191875))

(assert (= start!100024 b!1191873))

(declare-fun b_lambda!20735 () Bool)

(assert (=> (not b_lambda!20735) (not b!1191861)))

(declare-fun t!38856 () Bool)

(declare-fun tb!10413 () Bool)

(assert (=> (and start!100024 (= defaultEntry!1004 defaultEntry!1004) t!38856) tb!10413))

(declare-fun result!21401 () Bool)

(assert (=> tb!10413 (= result!21401 tp_is_empty!30139)))

(assert (=> b!1191861 t!38856))

(declare-fun b_and!42065 () Bool)

(assert (= b_and!42063 (and (=> t!38856 result!21401) b_and!42065)))

(declare-fun m!1099781 () Bool)

(assert (=> b!1191867 m!1099781))

(declare-fun m!1099783 () Bool)

(assert (=> b!1191868 m!1099783))

(declare-fun m!1099785 () Bool)

(assert (=> b!1191868 m!1099785))

(declare-fun m!1099787 () Bool)

(assert (=> mapNonEmpty!47036 m!1099787))

(declare-fun m!1099789 () Bool)

(assert (=> b!1191865 m!1099789))

(declare-fun m!1099791 () Bool)

(assert (=> b!1191865 m!1099791))

(declare-fun m!1099793 () Bool)

(assert (=> start!100024 m!1099793))

(declare-fun m!1099795 () Bool)

(assert (=> start!100024 m!1099795))

(declare-fun m!1099797 () Bool)

(assert (=> b!1191874 m!1099797))

(declare-fun m!1099799 () Bool)

(assert (=> b!1191869 m!1099799))

(declare-fun m!1099801 () Bool)

(assert (=> b!1191872 m!1099801))

(declare-fun m!1099803 () Bool)

(assert (=> b!1191870 m!1099803))

(declare-fun m!1099805 () Bool)

(assert (=> b!1191870 m!1099805))

(assert (=> b!1191870 m!1099805))

(declare-fun m!1099807 () Bool)

(assert (=> b!1191870 m!1099807))

(declare-fun m!1099809 () Bool)

(assert (=> b!1191870 m!1099809))

(declare-fun m!1099811 () Bool)

(assert (=> b!1191862 m!1099811))

(declare-fun m!1099813 () Bool)

(assert (=> b!1191864 m!1099813))

(declare-fun m!1099815 () Bool)

(assert (=> b!1191861 m!1099815))

(declare-fun m!1099817 () Bool)

(assert (=> b!1191861 m!1099817))

(declare-fun m!1099819 () Bool)

(assert (=> b!1191861 m!1099819))

(declare-fun m!1099821 () Bool)

(assert (=> b!1191861 m!1099821))

(check-sat (not b!1191870) (not b!1191868) (not b!1191867) (not b!1191869) (not b!1191861) tp_is_empty!30139 (not start!100024) (not b!1191872) (not b_next!25609) (not b!1191865) b_and!42065 (not mapNonEmpty!47036) (not b_lambda!20735) (not b!1191874) (not b!1191864))
(check-sat b_and!42065 (not b_next!25609))
