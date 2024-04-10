; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97828 () Bool)

(assert start!97828)

(declare-fun b_free!23529 () Bool)

(declare-fun b_next!23529 () Bool)

(assert (=> start!97828 (= b_free!23529 (not b_next!23529))))

(declare-fun tp!83291 () Bool)

(declare-fun b_and!37841 () Bool)

(assert (=> start!97828 (= tp!83291 b_and!37841)))

(declare-fun b!1119562 () Bool)

(declare-fun e!637595 () Bool)

(declare-fun tp_is_empty!28059 () Bool)

(assert (=> b!1119562 (= e!637595 tp_is_empty!28059)))

(declare-fun res!747848 () Bool)

(declare-fun e!637593 () Bool)

(assert (=> start!97828 (=> (not res!747848) (not e!637593))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73003 0))(
  ( (array!73004 (arr!35154 (Array (_ BitVec 32) (_ BitVec 64))) (size!35690 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73003)

(assert (=> start!97828 (= res!747848 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35690 _keys!1208))))))

(assert (=> start!97828 e!637593))

(assert (=> start!97828 tp_is_empty!28059))

(declare-fun array_inv!27008 (array!73003) Bool)

(assert (=> start!97828 (array_inv!27008 _keys!1208)))

(assert (=> start!97828 true))

(assert (=> start!97828 tp!83291))

(declare-datatypes ((V!42539 0))(
  ( (V!42540 (val!14086 Int)) )
))
(declare-datatypes ((ValueCell!13320 0))(
  ( (ValueCellFull!13320 (v!16719 V!42539)) (EmptyCell!13320) )
))
(declare-datatypes ((array!73005 0))(
  ( (array!73006 (arr!35155 (Array (_ BitVec 32) ValueCell!13320)) (size!35691 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73005)

(declare-fun e!637592 () Bool)

(declare-fun array_inv!27009 (array!73005) Bool)

(assert (=> start!97828 (and (array_inv!27009 _values!996) e!637592)))

(declare-fun b!1119563 () Bool)

(declare-fun e!637596 () Bool)

(assert (=> b!1119563 (= e!637596 tp_is_empty!28059)))

(declare-fun b!1119564 () Bool)

(declare-fun res!747846 () Bool)

(assert (=> b!1119564 (=> (not res!747846) (not e!637593))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119564 (= res!747846 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35690 _keys!1208))))))

(declare-fun b!1119565 () Bool)

(declare-fun res!747853 () Bool)

(assert (=> b!1119565 (=> (not res!747853) (not e!637593))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1119565 (= res!747853 (and (= (size!35691 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35690 _keys!1208) (size!35691 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119566 () Bool)

(declare-fun e!637591 () Bool)

(assert (=> b!1119566 (= e!637591 true)))

(declare-fun zeroValue!944 () V!42539)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!497787 () array!73003)

(declare-datatypes ((tuple2!17674 0))(
  ( (tuple2!17675 (_1!8848 (_ BitVec 64)) (_2!8848 V!42539)) )
))
(declare-datatypes ((List!24458 0))(
  ( (Nil!24455) (Cons!24454 (h!25663 tuple2!17674) (t!34979 List!24458)) )
))
(declare-datatypes ((ListLongMap!15643 0))(
  ( (ListLongMap!15644 (toList!7837 List!24458)) )
))
(declare-fun lt!497789 () ListLongMap!15643)

(declare-fun minValue!944 () V!42539)

(declare-fun getCurrentListMapNoExtraKeys!4327 (array!73003 array!73005 (_ BitVec 32) (_ BitVec 32) V!42539 V!42539 (_ BitVec 32) Int) ListLongMap!15643)

(declare-fun dynLambda!2431 (Int (_ BitVec 64)) V!42539)

(assert (=> b!1119566 (= lt!497789 (getCurrentListMapNoExtraKeys!4327 lt!497787 (array!73006 (store (arr!35155 _values!996) i!673 (ValueCellFull!13320 (dynLambda!2431 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35691 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497786 () ListLongMap!15643)

(assert (=> b!1119566 (= lt!497786 (getCurrentListMapNoExtraKeys!4327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119567 () Bool)

(declare-fun res!747843 () Bool)

(assert (=> b!1119567 (=> (not res!747843) (not e!637593))))

(declare-datatypes ((List!24459 0))(
  ( (Nil!24456) (Cons!24455 (h!25664 (_ BitVec 64)) (t!34980 List!24459)) )
))
(declare-fun arrayNoDuplicates!0 (array!73003 (_ BitVec 32) List!24459) Bool)

(assert (=> b!1119567 (= res!747843 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24456))))

(declare-fun b!1119568 () Bool)

(declare-fun res!747850 () Bool)

(assert (=> b!1119568 (=> (not res!747850) (not e!637593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119568 (= res!747850 (validMask!0 mask!1564))))

(declare-fun b!1119569 () Bool)

(declare-fun res!747844 () Bool)

(assert (=> b!1119569 (=> (not res!747844) (not e!637593))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119569 (= res!747844 (validKeyInArray!0 k0!934))))

(declare-fun b!1119570 () Bool)

(declare-fun e!637594 () Bool)

(assert (=> b!1119570 (= e!637594 (not e!637591))))

(declare-fun res!747849 () Bool)

(assert (=> b!1119570 (=> res!747849 e!637591)))

(assert (=> b!1119570 (= res!747849 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119570 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36742 0))(
  ( (Unit!36743) )
))
(declare-fun lt!497788 () Unit!36742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73003 (_ BitVec 64) (_ BitVec 32)) Unit!36742)

(assert (=> b!1119570 (= lt!497788 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119571 () Bool)

(declare-fun res!747851 () Bool)

(assert (=> b!1119571 (=> (not res!747851) (not e!637594))))

(assert (=> b!1119571 (= res!747851 (arrayNoDuplicates!0 lt!497787 #b00000000000000000000000000000000 Nil!24456))))

(declare-fun b!1119572 () Bool)

(declare-fun res!747847 () Bool)

(assert (=> b!1119572 (=> (not res!747847) (not e!637593))))

(assert (=> b!1119572 (= res!747847 (= (select (arr!35154 _keys!1208) i!673) k0!934))))

(declare-fun b!1119573 () Bool)

(declare-fun mapRes!43906 () Bool)

(assert (=> b!1119573 (= e!637592 (and e!637595 mapRes!43906))))

(declare-fun condMapEmpty!43906 () Bool)

(declare-fun mapDefault!43906 () ValueCell!13320)

(assert (=> b!1119573 (= condMapEmpty!43906 (= (arr!35155 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13320)) mapDefault!43906)))))

(declare-fun mapNonEmpty!43906 () Bool)

(declare-fun tp!83290 () Bool)

(assert (=> mapNonEmpty!43906 (= mapRes!43906 (and tp!83290 e!637596))))

(declare-fun mapValue!43906 () ValueCell!13320)

(declare-fun mapRest!43906 () (Array (_ BitVec 32) ValueCell!13320))

(declare-fun mapKey!43906 () (_ BitVec 32))

(assert (=> mapNonEmpty!43906 (= (arr!35155 _values!996) (store mapRest!43906 mapKey!43906 mapValue!43906))))

(declare-fun mapIsEmpty!43906 () Bool)

(assert (=> mapIsEmpty!43906 mapRes!43906))

(declare-fun b!1119574 () Bool)

(assert (=> b!1119574 (= e!637593 e!637594)))

(declare-fun res!747845 () Bool)

(assert (=> b!1119574 (=> (not res!747845) (not e!637594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73003 (_ BitVec 32)) Bool)

(assert (=> b!1119574 (= res!747845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497787 mask!1564))))

(assert (=> b!1119574 (= lt!497787 (array!73004 (store (arr!35154 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35690 _keys!1208)))))

(declare-fun b!1119575 () Bool)

(declare-fun res!747852 () Bool)

(assert (=> b!1119575 (=> (not res!747852) (not e!637593))))

(assert (=> b!1119575 (= res!747852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97828 res!747848) b!1119568))

(assert (= (and b!1119568 res!747850) b!1119565))

(assert (= (and b!1119565 res!747853) b!1119575))

(assert (= (and b!1119575 res!747852) b!1119567))

(assert (= (and b!1119567 res!747843) b!1119564))

(assert (= (and b!1119564 res!747846) b!1119569))

(assert (= (and b!1119569 res!747844) b!1119572))

(assert (= (and b!1119572 res!747847) b!1119574))

(assert (= (and b!1119574 res!747845) b!1119571))

(assert (= (and b!1119571 res!747851) b!1119570))

(assert (= (and b!1119570 (not res!747849)) b!1119566))

(assert (= (and b!1119573 condMapEmpty!43906) mapIsEmpty!43906))

(assert (= (and b!1119573 (not condMapEmpty!43906)) mapNonEmpty!43906))

(get-info :version)

(assert (= (and mapNonEmpty!43906 ((_ is ValueCellFull!13320) mapValue!43906)) b!1119563))

(assert (= (and b!1119573 ((_ is ValueCellFull!13320) mapDefault!43906)) b!1119562))

(assert (= start!97828 b!1119573))

(declare-fun b_lambda!18499 () Bool)

(assert (=> (not b_lambda!18499) (not b!1119566)))

(declare-fun t!34978 () Bool)

(declare-fun tb!8341 () Bool)

(assert (=> (and start!97828 (= defaultEntry!1004 defaultEntry!1004) t!34978) tb!8341))

(declare-fun result!17243 () Bool)

(assert (=> tb!8341 (= result!17243 tp_is_empty!28059)))

(assert (=> b!1119566 t!34978))

(declare-fun b_and!37843 () Bool)

(assert (= b_and!37841 (and (=> t!34978 result!17243) b_and!37843)))

(declare-fun m!1034817 () Bool)

(assert (=> b!1119567 m!1034817))

(declare-fun m!1034819 () Bool)

(assert (=> b!1119570 m!1034819))

(declare-fun m!1034821 () Bool)

(assert (=> b!1119570 m!1034821))

(declare-fun m!1034823 () Bool)

(assert (=> b!1119568 m!1034823))

(declare-fun m!1034825 () Bool)

(assert (=> b!1119571 m!1034825))

(declare-fun m!1034827 () Bool)

(assert (=> b!1119575 m!1034827))

(declare-fun m!1034829 () Bool)

(assert (=> b!1119572 m!1034829))

(declare-fun m!1034831 () Bool)

(assert (=> b!1119569 m!1034831))

(declare-fun m!1034833 () Bool)

(assert (=> b!1119574 m!1034833))

(declare-fun m!1034835 () Bool)

(assert (=> b!1119574 m!1034835))

(declare-fun m!1034837 () Bool)

(assert (=> b!1119566 m!1034837))

(declare-fun m!1034839 () Bool)

(assert (=> b!1119566 m!1034839))

(declare-fun m!1034841 () Bool)

(assert (=> b!1119566 m!1034841))

(declare-fun m!1034843 () Bool)

(assert (=> b!1119566 m!1034843))

(declare-fun m!1034845 () Bool)

(assert (=> mapNonEmpty!43906 m!1034845))

(declare-fun m!1034847 () Bool)

(assert (=> start!97828 m!1034847))

(declare-fun m!1034849 () Bool)

(assert (=> start!97828 m!1034849))

(check-sat (not b!1119567) (not b!1119569) (not start!97828) (not b!1119575) (not b!1119570) b_and!37843 (not b!1119574) (not b!1119568) (not b_next!23529) (not mapNonEmpty!43906) (not b!1119566) (not b_lambda!18499) tp_is_empty!28059 (not b!1119571))
(check-sat b_and!37843 (not b_next!23529))
