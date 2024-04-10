; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97840 () Bool)

(assert start!97840)

(declare-fun b_free!23541 () Bool)

(declare-fun b_next!23541 () Bool)

(assert (=> start!97840 (= b_free!23541 (not b_next!23541))))

(declare-fun tp!83327 () Bool)

(declare-fun b_and!37865 () Bool)

(assert (=> start!97840 (= tp!83327 b_and!37865)))

(declare-fun res!748049 () Bool)

(declare-fun e!637719 () Bool)

(assert (=> start!97840 (=> (not res!748049) (not e!637719))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73025 0))(
  ( (array!73026 (arr!35165 (Array (_ BitVec 32) (_ BitVec 64))) (size!35701 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73025)

(assert (=> start!97840 (= res!748049 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35701 _keys!1208))))))

(assert (=> start!97840 e!637719))

(declare-fun tp_is_empty!28071 () Bool)

(assert (=> start!97840 tp_is_empty!28071))

(declare-fun array_inv!27014 (array!73025) Bool)

(assert (=> start!97840 (array_inv!27014 _keys!1208)))

(assert (=> start!97840 true))

(assert (=> start!97840 tp!83327))

(declare-datatypes ((V!42555 0))(
  ( (V!42556 (val!14092 Int)) )
))
(declare-datatypes ((ValueCell!13326 0))(
  ( (ValueCellFull!13326 (v!16725 V!42555)) (EmptyCell!13326) )
))
(declare-datatypes ((array!73027 0))(
  ( (array!73028 (arr!35166 (Array (_ BitVec 32) ValueCell!13326)) (size!35702 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73027)

(declare-fun e!637716 () Bool)

(declare-fun array_inv!27015 (array!73027) Bool)

(assert (=> start!97840 (and (array_inv!27015 _values!996) e!637716)))

(declare-fun b!1119826 () Bool)

(declare-fun res!748045 () Bool)

(assert (=> b!1119826 (=> (not res!748045) (not e!637719))))

(declare-datatypes ((List!24466 0))(
  ( (Nil!24463) (Cons!24462 (h!25671 (_ BitVec 64)) (t!34999 List!24466)) )
))
(declare-fun arrayNoDuplicates!0 (array!73025 (_ BitVec 32) List!24466) Bool)

(assert (=> b!1119826 (= res!748045 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24463))))

(declare-fun b!1119827 () Bool)

(declare-fun res!748048 () Bool)

(assert (=> b!1119827 (=> (not res!748048) (not e!637719))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119827 (= res!748048 (validKeyInArray!0 k0!934))))

(declare-fun b!1119828 () Bool)

(declare-fun res!748046 () Bool)

(assert (=> b!1119828 (=> (not res!748046) (not e!637719))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119828 (= res!748046 (= (select (arr!35165 _keys!1208) i!673) k0!934))))

(declare-fun b!1119829 () Bool)

(declare-fun e!637718 () Bool)

(declare-fun mapRes!43924 () Bool)

(assert (=> b!1119829 (= e!637716 (and e!637718 mapRes!43924))))

(declare-fun condMapEmpty!43924 () Bool)

(declare-fun mapDefault!43924 () ValueCell!13326)

(assert (=> b!1119829 (= condMapEmpty!43924 (= (arr!35166 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13326)) mapDefault!43924)))))

(declare-fun b!1119830 () Bool)

(assert (=> b!1119830 (= e!637718 tp_is_empty!28071)))

(declare-fun b!1119831 () Bool)

(declare-fun e!637717 () Bool)

(assert (=> b!1119831 (= e!637719 e!637717)))

(declare-fun res!748044 () Bool)

(assert (=> b!1119831 (=> (not res!748044) (not e!637717))))

(declare-fun lt!497858 () array!73025)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73025 (_ BitVec 32)) Bool)

(assert (=> b!1119831 (= res!748044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497858 mask!1564))))

(assert (=> b!1119831 (= lt!497858 (array!73026 (store (arr!35165 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35701 _keys!1208)))))

(declare-fun b!1119832 () Bool)

(declare-fun res!748051 () Bool)

(assert (=> b!1119832 (=> (not res!748051) (not e!637719))))

(assert (=> b!1119832 (= res!748051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119833 () Bool)

(declare-fun e!637721 () Bool)

(assert (=> b!1119833 (= e!637721 true)))

(declare-fun zeroValue!944 () V!42555)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17680 0))(
  ( (tuple2!17681 (_1!8851 (_ BitVec 64)) (_2!8851 V!42555)) )
))
(declare-datatypes ((List!24467 0))(
  ( (Nil!24464) (Cons!24463 (h!25672 tuple2!17680) (t!35000 List!24467)) )
))
(declare-datatypes ((ListLongMap!15649 0))(
  ( (ListLongMap!15650 (toList!7840 List!24467)) )
))
(declare-fun lt!497860 () ListLongMap!15649)

(declare-fun minValue!944 () V!42555)

(declare-fun getCurrentListMapNoExtraKeys!4330 (array!73025 array!73027 (_ BitVec 32) (_ BitVec 32) V!42555 V!42555 (_ BitVec 32) Int) ListLongMap!15649)

(declare-fun dynLambda!2434 (Int (_ BitVec 64)) V!42555)

(assert (=> b!1119833 (= lt!497860 (getCurrentListMapNoExtraKeys!4330 lt!497858 (array!73028 (store (arr!35166 _values!996) i!673 (ValueCellFull!13326 (dynLambda!2434 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35702 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497861 () ListLongMap!15649)

(assert (=> b!1119833 (= lt!497861 (getCurrentListMapNoExtraKeys!4330 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119834 () Bool)

(declare-fun res!748041 () Bool)

(assert (=> b!1119834 (=> (not res!748041) (not e!637719))))

(assert (=> b!1119834 (= res!748041 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35701 _keys!1208))))))

(declare-fun mapIsEmpty!43924 () Bool)

(assert (=> mapIsEmpty!43924 mapRes!43924))

(declare-fun b!1119835 () Bool)

(declare-fun res!748042 () Bool)

(assert (=> b!1119835 (=> (not res!748042) (not e!637717))))

(assert (=> b!1119835 (= res!748042 (arrayNoDuplicates!0 lt!497858 #b00000000000000000000000000000000 Nil!24463))))

(declare-fun b!1119836 () Bool)

(declare-fun e!637722 () Bool)

(assert (=> b!1119836 (= e!637722 tp_is_empty!28071)))

(declare-fun b!1119837 () Bool)

(declare-fun res!748043 () Bool)

(assert (=> b!1119837 (=> (not res!748043) (not e!637719))))

(assert (=> b!1119837 (= res!748043 (and (= (size!35702 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35701 _keys!1208) (size!35702 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119838 () Bool)

(assert (=> b!1119838 (= e!637717 (not e!637721))))

(declare-fun res!748050 () Bool)

(assert (=> b!1119838 (=> res!748050 e!637721)))

(assert (=> b!1119838 (= res!748050 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119838 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36748 0))(
  ( (Unit!36749) )
))
(declare-fun lt!497859 () Unit!36748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73025 (_ BitVec 64) (_ BitVec 32)) Unit!36748)

(assert (=> b!1119838 (= lt!497859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119839 () Bool)

(declare-fun res!748047 () Bool)

(assert (=> b!1119839 (=> (not res!748047) (not e!637719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119839 (= res!748047 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43924 () Bool)

(declare-fun tp!83326 () Bool)

(assert (=> mapNonEmpty!43924 (= mapRes!43924 (and tp!83326 e!637722))))

(declare-fun mapValue!43924 () ValueCell!13326)

(declare-fun mapRest!43924 () (Array (_ BitVec 32) ValueCell!13326))

(declare-fun mapKey!43924 () (_ BitVec 32))

(assert (=> mapNonEmpty!43924 (= (arr!35166 _values!996) (store mapRest!43924 mapKey!43924 mapValue!43924))))

(assert (= (and start!97840 res!748049) b!1119839))

(assert (= (and b!1119839 res!748047) b!1119837))

(assert (= (and b!1119837 res!748043) b!1119832))

(assert (= (and b!1119832 res!748051) b!1119826))

(assert (= (and b!1119826 res!748045) b!1119834))

(assert (= (and b!1119834 res!748041) b!1119827))

(assert (= (and b!1119827 res!748048) b!1119828))

(assert (= (and b!1119828 res!748046) b!1119831))

(assert (= (and b!1119831 res!748044) b!1119835))

(assert (= (and b!1119835 res!748042) b!1119838))

(assert (= (and b!1119838 (not res!748050)) b!1119833))

(assert (= (and b!1119829 condMapEmpty!43924) mapIsEmpty!43924))

(assert (= (and b!1119829 (not condMapEmpty!43924)) mapNonEmpty!43924))

(get-info :version)

(assert (= (and mapNonEmpty!43924 ((_ is ValueCellFull!13326) mapValue!43924)) b!1119836))

(assert (= (and b!1119829 ((_ is ValueCellFull!13326) mapDefault!43924)) b!1119830))

(assert (= start!97840 b!1119829))

(declare-fun b_lambda!18511 () Bool)

(assert (=> (not b_lambda!18511) (not b!1119833)))

(declare-fun t!34998 () Bool)

(declare-fun tb!8353 () Bool)

(assert (=> (and start!97840 (= defaultEntry!1004 defaultEntry!1004) t!34998) tb!8353))

(declare-fun result!17267 () Bool)

(assert (=> tb!8353 (= result!17267 tp_is_empty!28071)))

(assert (=> b!1119833 t!34998))

(declare-fun b_and!37867 () Bool)

(assert (= b_and!37865 (and (=> t!34998 result!17267) b_and!37867)))

(declare-fun m!1035021 () Bool)

(assert (=> b!1119832 m!1035021))

(declare-fun m!1035023 () Bool)

(assert (=> b!1119839 m!1035023))

(declare-fun m!1035025 () Bool)

(assert (=> start!97840 m!1035025))

(declare-fun m!1035027 () Bool)

(assert (=> start!97840 m!1035027))

(declare-fun m!1035029 () Bool)

(assert (=> b!1119833 m!1035029))

(declare-fun m!1035031 () Bool)

(assert (=> b!1119833 m!1035031))

(declare-fun m!1035033 () Bool)

(assert (=> b!1119833 m!1035033))

(declare-fun m!1035035 () Bool)

(assert (=> b!1119833 m!1035035))

(declare-fun m!1035037 () Bool)

(assert (=> b!1119838 m!1035037))

(declare-fun m!1035039 () Bool)

(assert (=> b!1119838 m!1035039))

(declare-fun m!1035041 () Bool)

(assert (=> b!1119835 m!1035041))

(declare-fun m!1035043 () Bool)

(assert (=> b!1119827 m!1035043))

(declare-fun m!1035045 () Bool)

(assert (=> b!1119831 m!1035045))

(declare-fun m!1035047 () Bool)

(assert (=> b!1119831 m!1035047))

(declare-fun m!1035049 () Bool)

(assert (=> mapNonEmpty!43924 m!1035049))

(declare-fun m!1035051 () Bool)

(assert (=> b!1119826 m!1035051))

(declare-fun m!1035053 () Bool)

(assert (=> b!1119828 m!1035053))

(check-sat (not b_lambda!18511) (not b!1119833) (not start!97840) (not b_next!23541) b_and!37867 (not b!1119826) (not b!1119831) (not mapNonEmpty!43924) (not b!1119827) (not b!1119832) (not b!1119839) (not b!1119835) tp_is_empty!28071 (not b!1119838))
(check-sat b_and!37867 (not b_next!23541))
