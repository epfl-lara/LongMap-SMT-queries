; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98104 () Bool)

(assert start!98104)

(declare-fun b_free!23569 () Bool)

(declare-fun b_next!23569 () Bool)

(assert (=> start!98104 (= b_free!23569 (not b_next!23569))))

(declare-fun tp!83411 () Bool)

(declare-fun b_and!37931 () Bool)

(assert (=> start!98104 (= tp!83411 b_and!37931)))

(declare-fun b!1121769 () Bool)

(declare-fun res!749030 () Bool)

(declare-fun e!638867 () Bool)

(assert (=> b!1121769 (=> (not res!749030) (not e!638867))))

(declare-datatypes ((array!73127 0))(
  ( (array!73128 (arr!35210 (Array (_ BitVec 32) (_ BitVec 64))) (size!35747 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73127)

(declare-datatypes ((List!24505 0))(
  ( (Nil!24502) (Cons!24501 (h!25719 (_ BitVec 64)) (t!35058 List!24505)) )
))
(declare-fun arrayNoDuplicates!0 (array!73127 (_ BitVec 32) List!24505) Bool)

(assert (=> b!1121769 (= res!749030 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24502))))

(declare-fun res!749027 () Bool)

(assert (=> start!98104 (=> (not res!749027) (not e!638867))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98104 (= res!749027 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35747 _keys!1208))))))

(assert (=> start!98104 e!638867))

(declare-fun tp_is_empty!28099 () Bool)

(assert (=> start!98104 tp_is_empty!28099))

(declare-fun array_inv!27106 (array!73127) Bool)

(assert (=> start!98104 (array_inv!27106 _keys!1208)))

(assert (=> start!98104 true))

(assert (=> start!98104 tp!83411))

(declare-datatypes ((V!42593 0))(
  ( (V!42594 (val!14106 Int)) )
))
(declare-datatypes ((ValueCell!13340 0))(
  ( (ValueCellFull!13340 (v!16735 V!42593)) (EmptyCell!13340) )
))
(declare-datatypes ((array!73129 0))(
  ( (array!73130 (arr!35211 (Array (_ BitVec 32) ValueCell!13340)) (size!35748 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73129)

(declare-fun e!638870 () Bool)

(declare-fun array_inv!27107 (array!73129) Bool)

(assert (=> start!98104 (and (array_inv!27107 _values!996) e!638870)))

(declare-fun b!1121770 () Bool)

(declare-fun res!749026 () Bool)

(assert (=> b!1121770 (=> (not res!749026) (not e!638867))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121770 (= res!749026 (= (select (arr!35210 _keys!1208) i!673) k0!934))))

(declare-fun b!1121771 () Bool)

(declare-fun e!638871 () Bool)

(assert (=> b!1121771 (= e!638871 true)))

(declare-fun zeroValue!944 () V!42593)

(declare-fun lt!498544 () array!73127)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17708 0))(
  ( (tuple2!17709 (_1!8865 (_ BitVec 64)) (_2!8865 V!42593)) )
))
(declare-datatypes ((List!24506 0))(
  ( (Nil!24503) (Cons!24502 (h!25720 tuple2!17708) (t!35059 List!24506)) )
))
(declare-datatypes ((ListLongMap!15685 0))(
  ( (ListLongMap!15686 (toList!7858 List!24506)) )
))
(declare-fun lt!498543 () ListLongMap!15685)

(declare-fun minValue!944 () V!42593)

(declare-fun getCurrentListMapNoExtraKeys!4388 (array!73127 array!73129 (_ BitVec 32) (_ BitVec 32) V!42593 V!42593 (_ BitVec 32) Int) ListLongMap!15685)

(declare-fun dynLambda!2477 (Int (_ BitVec 64)) V!42593)

(assert (=> b!1121771 (= lt!498543 (getCurrentListMapNoExtraKeys!4388 lt!498544 (array!73130 (store (arr!35211 _values!996) i!673 (ValueCellFull!13340 (dynLambda!2477 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35748 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498542 () ListLongMap!15685)

(assert (=> b!1121771 (= lt!498542 (getCurrentListMapNoExtraKeys!4388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121772 () Bool)

(declare-fun e!638866 () Bool)

(assert (=> b!1121772 (= e!638866 (not e!638871))))

(declare-fun res!749032 () Bool)

(assert (=> b!1121772 (=> res!749032 e!638871)))

(assert (=> b!1121772 (= res!749032 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121772 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36751 0))(
  ( (Unit!36752) )
))
(declare-fun lt!498541 () Unit!36751)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73127 (_ BitVec 64) (_ BitVec 32)) Unit!36751)

(assert (=> b!1121772 (= lt!498541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121773 () Bool)

(declare-fun res!749028 () Bool)

(assert (=> b!1121773 (=> (not res!749028) (not e!638867))))

(assert (=> b!1121773 (= res!749028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35747 _keys!1208))))))

(declare-fun b!1121774 () Bool)

(declare-fun e!638865 () Bool)

(declare-fun mapRes!43966 () Bool)

(assert (=> b!1121774 (= e!638870 (and e!638865 mapRes!43966))))

(declare-fun condMapEmpty!43966 () Bool)

(declare-fun mapDefault!43966 () ValueCell!13340)

(assert (=> b!1121774 (= condMapEmpty!43966 (= (arr!35211 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13340)) mapDefault!43966)))))

(declare-fun b!1121775 () Bool)

(declare-fun res!749035 () Bool)

(assert (=> b!1121775 (=> (not res!749035) (not e!638867))))

(assert (=> b!1121775 (= res!749035 (and (= (size!35748 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35747 _keys!1208) (size!35748 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121776 () Bool)

(declare-fun e!638868 () Bool)

(assert (=> b!1121776 (= e!638868 tp_is_empty!28099)))

(declare-fun b!1121777 () Bool)

(declare-fun res!749033 () Bool)

(assert (=> b!1121777 (=> (not res!749033) (not e!638866))))

(assert (=> b!1121777 (= res!749033 (arrayNoDuplicates!0 lt!498544 #b00000000000000000000000000000000 Nil!24502))))

(declare-fun mapIsEmpty!43966 () Bool)

(assert (=> mapIsEmpty!43966 mapRes!43966))

(declare-fun b!1121778 () Bool)

(assert (=> b!1121778 (= e!638865 tp_is_empty!28099)))

(declare-fun b!1121779 () Bool)

(declare-fun res!749029 () Bool)

(assert (=> b!1121779 (=> (not res!749029) (not e!638867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121779 (= res!749029 (validMask!0 mask!1564))))

(declare-fun b!1121780 () Bool)

(assert (=> b!1121780 (= e!638867 e!638866)))

(declare-fun res!749034 () Bool)

(assert (=> b!1121780 (=> (not res!749034) (not e!638866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73127 (_ BitVec 32)) Bool)

(assert (=> b!1121780 (= res!749034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498544 mask!1564))))

(assert (=> b!1121780 (= lt!498544 (array!73128 (store (arr!35210 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35747 _keys!1208)))))

(declare-fun mapNonEmpty!43966 () Bool)

(declare-fun tp!83410 () Bool)

(assert (=> mapNonEmpty!43966 (= mapRes!43966 (and tp!83410 e!638868))))

(declare-fun mapValue!43966 () ValueCell!13340)

(declare-fun mapKey!43966 () (_ BitVec 32))

(declare-fun mapRest!43966 () (Array (_ BitVec 32) ValueCell!13340))

(assert (=> mapNonEmpty!43966 (= (arr!35211 _values!996) (store mapRest!43966 mapKey!43966 mapValue!43966))))

(declare-fun b!1121781 () Bool)

(declare-fun res!749025 () Bool)

(assert (=> b!1121781 (=> (not res!749025) (not e!638867))))

(assert (=> b!1121781 (= res!749025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121782 () Bool)

(declare-fun res!749031 () Bool)

(assert (=> b!1121782 (=> (not res!749031) (not e!638867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121782 (= res!749031 (validKeyInArray!0 k0!934))))

(assert (= (and start!98104 res!749027) b!1121779))

(assert (= (and b!1121779 res!749029) b!1121775))

(assert (= (and b!1121775 res!749035) b!1121781))

(assert (= (and b!1121781 res!749025) b!1121769))

(assert (= (and b!1121769 res!749030) b!1121773))

(assert (= (and b!1121773 res!749028) b!1121782))

(assert (= (and b!1121782 res!749031) b!1121770))

(assert (= (and b!1121770 res!749026) b!1121780))

(assert (= (and b!1121780 res!749034) b!1121777))

(assert (= (and b!1121777 res!749033) b!1121772))

(assert (= (and b!1121772 (not res!749032)) b!1121771))

(assert (= (and b!1121774 condMapEmpty!43966) mapIsEmpty!43966))

(assert (= (and b!1121774 (not condMapEmpty!43966)) mapNonEmpty!43966))

(get-info :version)

(assert (= (and mapNonEmpty!43966 ((_ is ValueCellFull!13340) mapValue!43966)) b!1121776))

(assert (= (and b!1121774 ((_ is ValueCellFull!13340) mapDefault!43966)) b!1121778))

(assert (= start!98104 b!1121774))

(declare-fun b_lambda!18549 () Bool)

(assert (=> (not b_lambda!18549) (not b!1121771)))

(declare-fun t!35057 () Bool)

(declare-fun tb!8373 () Bool)

(assert (=> (and start!98104 (= defaultEntry!1004 defaultEntry!1004) t!35057) tb!8373))

(declare-fun result!17315 () Bool)

(assert (=> tb!8373 (= result!17315 tp_is_empty!28099)))

(assert (=> b!1121771 t!35057))

(declare-fun b_and!37933 () Bool)

(assert (= b_and!37931 (and (=> t!35057 result!17315) b_and!37933)))

(declare-fun m!1037169 () Bool)

(assert (=> b!1121780 m!1037169))

(declare-fun m!1037171 () Bool)

(assert (=> b!1121780 m!1037171))

(declare-fun m!1037173 () Bool)

(assert (=> start!98104 m!1037173))

(declare-fun m!1037175 () Bool)

(assert (=> start!98104 m!1037175))

(declare-fun m!1037177 () Bool)

(assert (=> mapNonEmpty!43966 m!1037177))

(declare-fun m!1037179 () Bool)

(assert (=> b!1121771 m!1037179))

(declare-fun m!1037181 () Bool)

(assert (=> b!1121771 m!1037181))

(declare-fun m!1037183 () Bool)

(assert (=> b!1121771 m!1037183))

(declare-fun m!1037185 () Bool)

(assert (=> b!1121771 m!1037185))

(declare-fun m!1037187 () Bool)

(assert (=> b!1121772 m!1037187))

(declare-fun m!1037189 () Bool)

(assert (=> b!1121772 m!1037189))

(declare-fun m!1037191 () Bool)

(assert (=> b!1121781 m!1037191))

(declare-fun m!1037193 () Bool)

(assert (=> b!1121779 m!1037193))

(declare-fun m!1037195 () Bool)

(assert (=> b!1121769 m!1037195))

(declare-fun m!1037197 () Bool)

(assert (=> b!1121782 m!1037197))

(declare-fun m!1037199 () Bool)

(assert (=> b!1121777 m!1037199))

(declare-fun m!1037201 () Bool)

(assert (=> b!1121770 m!1037201))

(check-sat tp_is_empty!28099 b_and!37933 (not start!98104) (not b!1121782) (not b_next!23569) (not mapNonEmpty!43966) (not b!1121772) (not b!1121779) (not b!1121780) (not b!1121771) (not b_lambda!18549) (not b!1121781) (not b!1121769) (not b!1121777))
(check-sat b_and!37933 (not b_next!23569))
