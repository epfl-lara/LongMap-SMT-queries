; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97846 () Bool)

(assert start!97846)

(declare-fun b_free!23547 () Bool)

(declare-fun b_next!23547 () Bool)

(assert (=> start!97846 (= b_free!23547 (not b_next!23547))))

(declare-fun tp!83345 () Bool)

(declare-fun b_and!37877 () Bool)

(assert (=> start!97846 (= tp!83345 b_and!37877)))

(declare-fun b!1119958 () Bool)

(declare-fun res!748145 () Bool)

(declare-fun e!637779 () Bool)

(assert (=> b!1119958 (=> (not res!748145) (not e!637779))))

(declare-datatypes ((array!73037 0))(
  ( (array!73038 (arr!35171 (Array (_ BitVec 32) (_ BitVec 64))) (size!35707 (_ BitVec 32))) )
))
(declare-fun lt!497895 () array!73037)

(declare-datatypes ((List!24469 0))(
  ( (Nil!24466) (Cons!24465 (h!25674 (_ BitVec 64)) (t!35008 List!24469)) )
))
(declare-fun arrayNoDuplicates!0 (array!73037 (_ BitVec 32) List!24469) Bool)

(assert (=> b!1119958 (= res!748145 (arrayNoDuplicates!0 lt!497895 #b00000000000000000000000000000000 Nil!24466))))

(declare-fun b!1119959 () Bool)

(declare-fun res!748144 () Bool)

(declare-fun e!637784 () Bool)

(assert (=> b!1119959 (=> (not res!748144) (not e!637784))))

(declare-fun _keys!1208 () array!73037)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119959 (= res!748144 (= (select (arr!35171 _keys!1208) i!673) k0!934))))

(declare-fun b!1119960 () Bool)

(declare-fun e!637782 () Bool)

(declare-fun e!637781 () Bool)

(declare-fun mapRes!43933 () Bool)

(assert (=> b!1119960 (= e!637782 (and e!637781 mapRes!43933))))

(declare-fun condMapEmpty!43933 () Bool)

(declare-datatypes ((V!42563 0))(
  ( (V!42564 (val!14095 Int)) )
))
(declare-datatypes ((ValueCell!13329 0))(
  ( (ValueCellFull!13329 (v!16728 V!42563)) (EmptyCell!13329) )
))
(declare-datatypes ((array!73039 0))(
  ( (array!73040 (arr!35172 (Array (_ BitVec 32) ValueCell!13329)) (size!35708 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73039)

(declare-fun mapDefault!43933 () ValueCell!13329)

(assert (=> b!1119960 (= condMapEmpty!43933 (= (arr!35172 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13329)) mapDefault!43933)))))

(declare-fun b!1119961 () Bool)

(declare-fun res!748143 () Bool)

(assert (=> b!1119961 (=> (not res!748143) (not e!637784))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73037 (_ BitVec 32)) Bool)

(assert (=> b!1119961 (= res!748143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119962 () Bool)

(declare-fun res!748140 () Bool)

(assert (=> b!1119962 (=> (not res!748140) (not e!637784))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119962 (= res!748140 (and (= (size!35708 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35707 _keys!1208) (size!35708 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119963 () Bool)

(declare-fun res!748146 () Bool)

(assert (=> b!1119963 (=> (not res!748146) (not e!637784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119963 (= res!748146 (validMask!0 mask!1564))))

(declare-fun b!1119964 () Bool)

(declare-fun res!748150 () Bool)

(assert (=> b!1119964 (=> (not res!748150) (not e!637784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119964 (= res!748150 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43933 () Bool)

(declare-fun tp!83344 () Bool)

(declare-fun e!637780 () Bool)

(assert (=> mapNonEmpty!43933 (= mapRes!43933 (and tp!83344 e!637780))))

(declare-fun mapKey!43933 () (_ BitVec 32))

(declare-fun mapValue!43933 () ValueCell!13329)

(declare-fun mapRest!43933 () (Array (_ BitVec 32) ValueCell!13329))

(assert (=> mapNonEmpty!43933 (= (arr!35172 _values!996) (store mapRest!43933 mapKey!43933 mapValue!43933))))

(declare-fun b!1119965 () Bool)

(declare-fun tp_is_empty!28077 () Bool)

(assert (=> b!1119965 (= e!637780 tp_is_empty!28077)))

(declare-fun b!1119966 () Bool)

(declare-fun e!637785 () Bool)

(assert (=> b!1119966 (= e!637779 (not e!637785))))

(declare-fun res!748142 () Bool)

(assert (=> b!1119966 (=> res!748142 e!637785)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119966 (= res!748142 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119966 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36752 0))(
  ( (Unit!36753) )
))
(declare-fun lt!497896 () Unit!36752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73037 (_ BitVec 64) (_ BitVec 32)) Unit!36752)

(assert (=> b!1119966 (= lt!497896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!748148 () Bool)

(assert (=> start!97846 (=> (not res!748148) (not e!637784))))

(assert (=> start!97846 (= res!748148 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35707 _keys!1208))))))

(assert (=> start!97846 e!637784))

(assert (=> start!97846 tp_is_empty!28077))

(declare-fun array_inv!27016 (array!73037) Bool)

(assert (=> start!97846 (array_inv!27016 _keys!1208)))

(assert (=> start!97846 true))

(assert (=> start!97846 tp!83345))

(declare-fun array_inv!27017 (array!73039) Bool)

(assert (=> start!97846 (and (array_inv!27017 _values!996) e!637782)))

(declare-fun b!1119967 () Bool)

(assert (=> b!1119967 (= e!637784 e!637779)))

(declare-fun res!748147 () Bool)

(assert (=> b!1119967 (=> (not res!748147) (not e!637779))))

(assert (=> b!1119967 (= res!748147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497895 mask!1564))))

(assert (=> b!1119967 (= lt!497895 (array!73038 (store (arr!35171 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35707 _keys!1208)))))

(declare-fun b!1119968 () Bool)

(assert (=> b!1119968 (= e!637785 true)))

(declare-fun zeroValue!944 () V!42563)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17684 0))(
  ( (tuple2!17685 (_1!8853 (_ BitVec 64)) (_2!8853 V!42563)) )
))
(declare-datatypes ((List!24470 0))(
  ( (Nil!24467) (Cons!24466 (h!25675 tuple2!17684) (t!35009 List!24470)) )
))
(declare-datatypes ((ListLongMap!15653 0))(
  ( (ListLongMap!15654 (toList!7842 List!24470)) )
))
(declare-fun lt!497897 () ListLongMap!15653)

(declare-fun minValue!944 () V!42563)

(declare-fun getCurrentListMapNoExtraKeys!4332 (array!73037 array!73039 (_ BitVec 32) (_ BitVec 32) V!42563 V!42563 (_ BitVec 32) Int) ListLongMap!15653)

(declare-fun dynLambda!2436 (Int (_ BitVec 64)) V!42563)

(assert (=> b!1119968 (= lt!497897 (getCurrentListMapNoExtraKeys!4332 lt!497895 (array!73040 (store (arr!35172 _values!996) i!673 (ValueCellFull!13329 (dynLambda!2436 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35708 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497894 () ListLongMap!15653)

(assert (=> b!1119968 (= lt!497894 (getCurrentListMapNoExtraKeys!4332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43933 () Bool)

(assert (=> mapIsEmpty!43933 mapRes!43933))

(declare-fun b!1119969 () Bool)

(declare-fun res!748149 () Bool)

(assert (=> b!1119969 (=> (not res!748149) (not e!637784))))

(assert (=> b!1119969 (= res!748149 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35707 _keys!1208))))))

(declare-fun b!1119970 () Bool)

(declare-fun res!748141 () Bool)

(assert (=> b!1119970 (=> (not res!748141) (not e!637784))))

(assert (=> b!1119970 (= res!748141 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24466))))

(declare-fun b!1119971 () Bool)

(assert (=> b!1119971 (= e!637781 tp_is_empty!28077)))

(assert (= (and start!97846 res!748148) b!1119963))

(assert (= (and b!1119963 res!748146) b!1119962))

(assert (= (and b!1119962 res!748140) b!1119961))

(assert (= (and b!1119961 res!748143) b!1119970))

(assert (= (and b!1119970 res!748141) b!1119969))

(assert (= (and b!1119969 res!748149) b!1119964))

(assert (= (and b!1119964 res!748150) b!1119959))

(assert (= (and b!1119959 res!748144) b!1119967))

(assert (= (and b!1119967 res!748147) b!1119958))

(assert (= (and b!1119958 res!748145) b!1119966))

(assert (= (and b!1119966 (not res!748142)) b!1119968))

(assert (= (and b!1119960 condMapEmpty!43933) mapIsEmpty!43933))

(assert (= (and b!1119960 (not condMapEmpty!43933)) mapNonEmpty!43933))

(get-info :version)

(assert (= (and mapNonEmpty!43933 ((_ is ValueCellFull!13329) mapValue!43933)) b!1119965))

(assert (= (and b!1119960 ((_ is ValueCellFull!13329) mapDefault!43933)) b!1119971))

(assert (= start!97846 b!1119960))

(declare-fun b_lambda!18517 () Bool)

(assert (=> (not b_lambda!18517) (not b!1119968)))

(declare-fun t!35007 () Bool)

(declare-fun tb!8359 () Bool)

(assert (=> (and start!97846 (= defaultEntry!1004 defaultEntry!1004) t!35007) tb!8359))

(declare-fun result!17279 () Bool)

(assert (=> tb!8359 (= result!17279 tp_is_empty!28077)))

(assert (=> b!1119968 t!35007))

(declare-fun b_and!37879 () Bool)

(assert (= b_and!37877 (and (=> t!35007 result!17279) b_and!37879)))

(declare-fun m!1035123 () Bool)

(assert (=> start!97846 m!1035123))

(declare-fun m!1035125 () Bool)

(assert (=> start!97846 m!1035125))

(declare-fun m!1035127 () Bool)

(assert (=> b!1119970 m!1035127))

(declare-fun m!1035129 () Bool)

(assert (=> mapNonEmpty!43933 m!1035129))

(declare-fun m!1035131 () Bool)

(assert (=> b!1119959 m!1035131))

(declare-fun m!1035133 () Bool)

(assert (=> b!1119968 m!1035133))

(declare-fun m!1035135 () Bool)

(assert (=> b!1119968 m!1035135))

(declare-fun m!1035137 () Bool)

(assert (=> b!1119968 m!1035137))

(declare-fun m!1035139 () Bool)

(assert (=> b!1119968 m!1035139))

(declare-fun m!1035141 () Bool)

(assert (=> b!1119963 m!1035141))

(declare-fun m!1035143 () Bool)

(assert (=> b!1119964 m!1035143))

(declare-fun m!1035145 () Bool)

(assert (=> b!1119958 m!1035145))

(declare-fun m!1035147 () Bool)

(assert (=> b!1119961 m!1035147))

(declare-fun m!1035149 () Bool)

(assert (=> b!1119966 m!1035149))

(declare-fun m!1035151 () Bool)

(assert (=> b!1119966 m!1035151))

(declare-fun m!1035153 () Bool)

(assert (=> b!1119967 m!1035153))

(declare-fun m!1035155 () Bool)

(assert (=> b!1119967 m!1035155))

(check-sat (not b_next!23547) (not b!1119961) (not b!1119958) (not b!1119963) (not b!1119968) (not b!1119967) b_and!37879 tp_is_empty!28077 (not start!97846) (not mapNonEmpty!43933) (not b!1119966) (not b_lambda!18517) (not b!1119964) (not b!1119970))
(check-sat b_and!37879 (not b_next!23547))
