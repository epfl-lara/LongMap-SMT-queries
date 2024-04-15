; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97126 () Bool)

(assert start!97126)

(declare-fun b!1104697 () Bool)

(declare-fun e!630536 () Bool)

(declare-fun tp_is_empty!27379 () Bool)

(assert (=> b!1104697 (= e!630536 tp_is_empty!27379)))

(declare-fun b!1104698 () Bool)

(declare-fun res!737092 () Bool)

(declare-fun e!630534 () Bool)

(assert (=> b!1104698 (=> (not res!737092) (not e!630534))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71592 0))(
  ( (array!71593 (arr!34450 (Array (_ BitVec 32) (_ BitVec 64))) (size!34988 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71592)

(assert (=> b!1104698 (= res!737092 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34988 _keys!1208))))))

(declare-fun b!1104699 () Bool)

(declare-fun res!737088 () Bool)

(assert (=> b!1104699 (=> (not res!737088) (not e!630534))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71592 (_ BitVec 32)) Bool)

(assert (=> b!1104699 (= res!737088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104700 () Bool)

(declare-fun res!737085 () Bool)

(assert (=> b!1104700 (=> (not res!737085) (not e!630534))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41633 0))(
  ( (V!41634 (val!13746 Int)) )
))
(declare-datatypes ((ValueCell!12980 0))(
  ( (ValueCellFull!12980 (v!16378 V!41633)) (EmptyCell!12980) )
))
(declare-datatypes ((array!71594 0))(
  ( (array!71595 (arr!34451 (Array (_ BitVec 32) ValueCell!12980)) (size!34989 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71594)

(assert (=> b!1104700 (= res!737085 (and (= (size!34989 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34988 _keys!1208) (size!34989 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104701 () Bool)

(declare-fun e!630535 () Bool)

(assert (=> b!1104701 (= e!630535 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104701 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36073 0))(
  ( (Unit!36074) )
))
(declare-fun lt!495009 () Unit!36073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71592 (_ BitVec 64) (_ BitVec 32)) Unit!36073)

(assert (=> b!1104701 (= lt!495009 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!737093 () Bool)

(assert (=> start!97126 (=> (not res!737093) (not e!630534))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97126 (= res!737093 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34988 _keys!1208))))))

(assert (=> start!97126 e!630534))

(declare-fun array_inv!26564 (array!71592) Bool)

(assert (=> start!97126 (array_inv!26564 _keys!1208)))

(assert (=> start!97126 true))

(declare-fun e!630532 () Bool)

(declare-fun array_inv!26565 (array!71594) Bool)

(assert (=> start!97126 (and (array_inv!26565 _values!996) e!630532)))

(declare-fun b!1104702 () Bool)

(declare-fun e!630531 () Bool)

(declare-fun mapRes!42883 () Bool)

(assert (=> b!1104702 (= e!630532 (and e!630531 mapRes!42883))))

(declare-fun condMapEmpty!42883 () Bool)

(declare-fun mapDefault!42883 () ValueCell!12980)

(assert (=> b!1104702 (= condMapEmpty!42883 (= (arr!34451 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12980)) mapDefault!42883)))))

(declare-fun b!1104703 () Bool)

(declare-fun res!737086 () Bool)

(assert (=> b!1104703 (=> (not res!737086) (not e!630534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104703 (= res!737086 (validKeyInArray!0 k0!934))))

(declare-fun b!1104704 () Bool)

(assert (=> b!1104704 (= e!630534 e!630535)))

(declare-fun res!737091 () Bool)

(assert (=> b!1104704 (=> (not res!737091) (not e!630535))))

(declare-fun lt!495008 () array!71592)

(assert (=> b!1104704 (= res!737091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495008 mask!1564))))

(assert (=> b!1104704 (= lt!495008 (array!71593 (store (arr!34450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34988 _keys!1208)))))

(declare-fun b!1104705 () Bool)

(declare-fun res!737087 () Bool)

(assert (=> b!1104705 (=> (not res!737087) (not e!630535))))

(declare-datatypes ((List!24097 0))(
  ( (Nil!24094) (Cons!24093 (h!25302 (_ BitVec 64)) (t!34353 List!24097)) )
))
(declare-fun arrayNoDuplicates!0 (array!71592 (_ BitVec 32) List!24097) Bool)

(assert (=> b!1104705 (= res!737087 (arrayNoDuplicates!0 lt!495008 #b00000000000000000000000000000000 Nil!24094))))

(declare-fun b!1104706 () Bool)

(declare-fun res!737090 () Bool)

(assert (=> b!1104706 (=> (not res!737090) (not e!630534))))

(assert (=> b!1104706 (= res!737090 (= (select (arr!34450 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!42883 () Bool)

(assert (=> mapIsEmpty!42883 mapRes!42883))

(declare-fun b!1104707 () Bool)

(declare-fun res!737089 () Bool)

(assert (=> b!1104707 (=> (not res!737089) (not e!630534))))

(assert (=> b!1104707 (= res!737089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24094))))

(declare-fun b!1104708 () Bool)

(assert (=> b!1104708 (= e!630531 tp_is_empty!27379)))

(declare-fun b!1104709 () Bool)

(declare-fun res!737084 () Bool)

(assert (=> b!1104709 (=> (not res!737084) (not e!630534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104709 (= res!737084 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42883 () Bool)

(declare-fun tp!81803 () Bool)

(assert (=> mapNonEmpty!42883 (= mapRes!42883 (and tp!81803 e!630536))))

(declare-fun mapRest!42883 () (Array (_ BitVec 32) ValueCell!12980))

(declare-fun mapKey!42883 () (_ BitVec 32))

(declare-fun mapValue!42883 () ValueCell!12980)

(assert (=> mapNonEmpty!42883 (= (arr!34451 _values!996) (store mapRest!42883 mapKey!42883 mapValue!42883))))

(assert (= (and start!97126 res!737093) b!1104709))

(assert (= (and b!1104709 res!737084) b!1104700))

(assert (= (and b!1104700 res!737085) b!1104699))

(assert (= (and b!1104699 res!737088) b!1104707))

(assert (= (and b!1104707 res!737089) b!1104698))

(assert (= (and b!1104698 res!737092) b!1104703))

(assert (= (and b!1104703 res!737086) b!1104706))

(assert (= (and b!1104706 res!737090) b!1104704))

(assert (= (and b!1104704 res!737091) b!1104705))

(assert (= (and b!1104705 res!737087) b!1104701))

(assert (= (and b!1104702 condMapEmpty!42883) mapIsEmpty!42883))

(assert (= (and b!1104702 (not condMapEmpty!42883)) mapNonEmpty!42883))

(get-info :version)

(assert (= (and mapNonEmpty!42883 ((_ is ValueCellFull!12980) mapValue!42883)) b!1104697))

(assert (= (and b!1104702 ((_ is ValueCellFull!12980) mapDefault!42883)) b!1104708))

(assert (= start!97126 b!1104702))

(declare-fun m!1023811 () Bool)

(assert (=> b!1104701 m!1023811))

(declare-fun m!1023813 () Bool)

(assert (=> b!1104701 m!1023813))

(declare-fun m!1023815 () Bool)

(assert (=> b!1104703 m!1023815))

(declare-fun m!1023817 () Bool)

(assert (=> b!1104707 m!1023817))

(declare-fun m!1023819 () Bool)

(assert (=> b!1104704 m!1023819))

(declare-fun m!1023821 () Bool)

(assert (=> b!1104704 m!1023821))

(declare-fun m!1023823 () Bool)

(assert (=> start!97126 m!1023823))

(declare-fun m!1023825 () Bool)

(assert (=> start!97126 m!1023825))

(declare-fun m!1023827 () Bool)

(assert (=> b!1104706 m!1023827))

(declare-fun m!1023829 () Bool)

(assert (=> b!1104709 m!1023829))

(declare-fun m!1023831 () Bool)

(assert (=> b!1104705 m!1023831))

(declare-fun m!1023833 () Bool)

(assert (=> mapNonEmpty!42883 m!1023833))

(declare-fun m!1023835 () Bool)

(assert (=> b!1104699 m!1023835))

(check-sat (not b!1104701) (not b!1104704) (not b!1104705) (not mapNonEmpty!42883) tp_is_empty!27379 (not b!1104707) (not b!1104709) (not b!1104703) (not start!97126) (not b!1104699))
(check-sat)
