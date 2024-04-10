; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97756 () Bool)

(assert start!97756)

(declare-fun b_free!23457 () Bool)

(declare-fun b_next!23457 () Bool)

(assert (=> start!97756 (= b_free!23457 (not b_next!23457))))

(declare-fun tp!83075 () Bool)

(declare-fun b_and!37731 () Bool)

(assert (=> start!97756 (= tp!83075 b_and!37731)))

(declare-fun mapNonEmpty!43798 () Bool)

(declare-fun mapRes!43798 () Bool)

(declare-fun tp!83074 () Bool)

(declare-fun e!636835 () Bool)

(assert (=> mapNonEmpty!43798 (= mapRes!43798 (and tp!83074 e!636835))))

(declare-fun mapKey!43798 () (_ BitVec 32))

(declare-datatypes ((V!42443 0))(
  ( (V!42444 (val!14050 Int)) )
))
(declare-datatypes ((ValueCell!13284 0))(
  ( (ValueCellFull!13284 (v!16683 V!42443)) (EmptyCell!13284) )
))
(declare-fun mapRest!43798 () (Array (_ BitVec 32) ValueCell!13284))

(declare-fun mapValue!43798 () ValueCell!13284)

(declare-datatypes ((array!72865 0))(
  ( (array!72866 (arr!35085 (Array (_ BitVec 32) ValueCell!13284)) (size!35621 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72865)

(assert (=> mapNonEmpty!43798 (= (arr!35085 _values!996) (store mapRest!43798 mapKey!43798 mapValue!43798))))

(declare-fun b!1118012 () Bool)

(declare-fun e!636838 () Bool)

(declare-fun tp_is_empty!27987 () Bool)

(assert (=> b!1118012 (= e!636838 tp_is_empty!27987)))

(declare-fun b!1118013 () Bool)

(assert (=> b!1118013 (= e!636835 tp_is_empty!27987)))

(declare-fun b!1118014 () Bool)

(declare-fun res!746665 () Bool)

(declare-fun e!636837 () Bool)

(assert (=> b!1118014 (=> (not res!746665) (not e!636837))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118014 (= res!746665 (validKeyInArray!0 k0!934))))

(declare-fun b!1118015 () Bool)

(declare-fun res!746661 () Bool)

(assert (=> b!1118015 (=> (not res!746661) (not e!636837))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118015 (= res!746661 (validMask!0 mask!1564))))

(declare-fun b!1118017 () Bool)

(declare-fun e!636839 () Bool)

(assert (=> b!1118017 (= e!636837 e!636839)))

(declare-fun res!746658 () Bool)

(assert (=> b!1118017 (=> (not res!746658) (not e!636839))))

(declare-datatypes ((array!72867 0))(
  ( (array!72868 (arr!35086 (Array (_ BitVec 32) (_ BitVec 64))) (size!35622 (_ BitVec 32))) )
))
(declare-fun lt!497403 () array!72867)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72867 (_ BitVec 32)) Bool)

(assert (=> b!1118017 (= res!746658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497403 mask!1564))))

(declare-fun _keys!1208 () array!72867)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118017 (= lt!497403 (array!72868 (store (arr!35086 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35622 _keys!1208)))))

(declare-fun b!1118018 () Bool)

(declare-fun res!746663 () Bool)

(assert (=> b!1118018 (=> (not res!746663) (not e!636837))))

(assert (=> b!1118018 (= res!746663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118019 () Bool)

(declare-fun res!746659 () Bool)

(assert (=> b!1118019 (=> (not res!746659) (not e!636837))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118019 (= res!746659 (and (= (size!35621 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35622 _keys!1208) (size!35621 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118020 () Bool)

(declare-fun res!746655 () Bool)

(assert (=> b!1118020 (=> (not res!746655) (not e!636839))))

(declare-datatypes ((List!24404 0))(
  ( (Nil!24401) (Cons!24400 (h!25609 (_ BitVec 64)) (t!34885 List!24404)) )
))
(declare-fun arrayNoDuplicates!0 (array!72867 (_ BitVec 32) List!24404) Bool)

(assert (=> b!1118020 (= res!746655 (arrayNoDuplicates!0 lt!497403 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun mapIsEmpty!43798 () Bool)

(assert (=> mapIsEmpty!43798 mapRes!43798))

(declare-fun b!1118021 () Bool)

(declare-fun e!636840 () Bool)

(assert (=> b!1118021 (= e!636839 (not e!636840))))

(declare-fun res!746660 () Bool)

(assert (=> b!1118021 (=> res!746660 e!636840)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1118021 (= res!746660 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118021 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36690 0))(
  ( (Unit!36691) )
))
(declare-fun lt!497405 () Unit!36690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72867 (_ BitVec 64) (_ BitVec 32)) Unit!36690)

(assert (=> b!1118021 (= lt!497405 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118022 () Bool)

(declare-fun e!636834 () Bool)

(assert (=> b!1118022 (= e!636834 (and e!636838 mapRes!43798))))

(declare-fun condMapEmpty!43798 () Bool)

(declare-fun mapDefault!43798 () ValueCell!13284)

(assert (=> b!1118022 (= condMapEmpty!43798 (= (arr!35085 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13284)) mapDefault!43798)))))

(declare-fun b!1118023 () Bool)

(declare-fun res!746662 () Bool)

(assert (=> b!1118023 (=> (not res!746662) (not e!636837))))

(assert (=> b!1118023 (= res!746662 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24401))))

(declare-fun res!746656 () Bool)

(assert (=> start!97756 (=> (not res!746656) (not e!636837))))

(assert (=> start!97756 (= res!746656 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35622 _keys!1208))))))

(assert (=> start!97756 e!636837))

(assert (=> start!97756 tp_is_empty!27987))

(declare-fun array_inv!26954 (array!72867) Bool)

(assert (=> start!97756 (array_inv!26954 _keys!1208)))

(assert (=> start!97756 true))

(assert (=> start!97756 tp!83075))

(declare-fun array_inv!26955 (array!72865) Bool)

(assert (=> start!97756 (and (array_inv!26955 _values!996) e!636834)))

(declare-fun b!1118016 () Bool)

(declare-fun res!746664 () Bool)

(assert (=> b!1118016 (=> (not res!746664) (not e!636837))))

(assert (=> b!1118016 (= res!746664 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35622 _keys!1208))))))

(declare-fun b!1118024 () Bool)

(assert (=> b!1118024 (= e!636840 true)))

(declare-fun zeroValue!944 () V!42443)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42443)

(declare-datatypes ((tuple2!17618 0))(
  ( (tuple2!17619 (_1!8820 (_ BitVec 64)) (_2!8820 V!42443)) )
))
(declare-datatypes ((List!24405 0))(
  ( (Nil!24402) (Cons!24401 (h!25610 tuple2!17618) (t!34886 List!24405)) )
))
(declare-datatypes ((ListLongMap!15587 0))(
  ( (ListLongMap!15588 (toList!7809 List!24405)) )
))
(declare-fun lt!497404 () ListLongMap!15587)

(declare-fun getCurrentListMapNoExtraKeys!4299 (array!72867 array!72865 (_ BitVec 32) (_ BitVec 32) V!42443 V!42443 (_ BitVec 32) Int) ListLongMap!15587)

(assert (=> b!1118024 (= lt!497404 (getCurrentListMapNoExtraKeys!4299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118025 () Bool)

(declare-fun res!746657 () Bool)

(assert (=> b!1118025 (=> (not res!746657) (not e!636837))))

(assert (=> b!1118025 (= res!746657 (= (select (arr!35086 _keys!1208) i!673) k0!934))))

(assert (= (and start!97756 res!746656) b!1118015))

(assert (= (and b!1118015 res!746661) b!1118019))

(assert (= (and b!1118019 res!746659) b!1118018))

(assert (= (and b!1118018 res!746663) b!1118023))

(assert (= (and b!1118023 res!746662) b!1118016))

(assert (= (and b!1118016 res!746664) b!1118014))

(assert (= (and b!1118014 res!746665) b!1118025))

(assert (= (and b!1118025 res!746657) b!1118017))

(assert (= (and b!1118017 res!746658) b!1118020))

(assert (= (and b!1118020 res!746655) b!1118021))

(assert (= (and b!1118021 (not res!746660)) b!1118024))

(assert (= (and b!1118022 condMapEmpty!43798) mapIsEmpty!43798))

(assert (= (and b!1118022 (not condMapEmpty!43798)) mapNonEmpty!43798))

(get-info :version)

(assert (= (and mapNonEmpty!43798 ((_ is ValueCellFull!13284) mapValue!43798)) b!1118013))

(assert (= (and b!1118022 ((_ is ValueCellFull!13284) mapDefault!43798)) b!1118012))

(assert (= start!97756 b!1118022))

(declare-fun m!1033695 () Bool)

(assert (=> b!1118024 m!1033695))

(declare-fun m!1033697 () Bool)

(assert (=> b!1118014 m!1033697))

(declare-fun m!1033699 () Bool)

(assert (=> mapNonEmpty!43798 m!1033699))

(declare-fun m!1033701 () Bool)

(assert (=> b!1118023 m!1033701))

(declare-fun m!1033703 () Bool)

(assert (=> b!1118015 m!1033703))

(declare-fun m!1033705 () Bool)

(assert (=> start!97756 m!1033705))

(declare-fun m!1033707 () Bool)

(assert (=> start!97756 m!1033707))

(declare-fun m!1033709 () Bool)

(assert (=> b!1118025 m!1033709))

(declare-fun m!1033711 () Bool)

(assert (=> b!1118018 m!1033711))

(declare-fun m!1033713 () Bool)

(assert (=> b!1118020 m!1033713))

(declare-fun m!1033715 () Bool)

(assert (=> b!1118021 m!1033715))

(declare-fun m!1033717 () Bool)

(assert (=> b!1118021 m!1033717))

(declare-fun m!1033719 () Bool)

(assert (=> b!1118017 m!1033719))

(declare-fun m!1033721 () Bool)

(assert (=> b!1118017 m!1033721))

(check-sat (not start!97756) (not b_next!23457) (not mapNonEmpty!43798) (not b!1118014) (not b!1118015) (not b!1118018) (not b!1118017) (not b!1118020) (not b!1118021) tp_is_empty!27987 b_and!37731 (not b!1118023) (not b!1118024))
(check-sat b_and!37731 (not b_next!23457))
