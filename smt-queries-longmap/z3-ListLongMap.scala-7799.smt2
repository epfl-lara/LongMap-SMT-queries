; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97774 () Bool)

(assert start!97774)

(declare-fun b!1115056 () Bool)

(declare-fun res!743878 () Bool)

(declare-fun e!635700 () Bool)

(assert (=> b!1115056 (=> (not res!743878) (not e!635700))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115056 (= res!743878 (validMask!0 mask!1564))))

(declare-fun b!1115057 () Bool)

(declare-fun e!635698 () Bool)

(assert (=> b!1115057 (= e!635698 (not true))))

(declare-datatypes ((array!72481 0))(
  ( (array!72482 (arr!34887 (Array (_ BitVec 32) (_ BitVec 64))) (size!35424 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72481)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115057 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36525 0))(
  ( (Unit!36526) )
))
(declare-fun lt!497233 () Unit!36525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72481 (_ BitVec 64) (_ BitVec 32)) Unit!36525)

(assert (=> b!1115057 (= lt!497233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115058 () Bool)

(declare-fun res!743879 () Bool)

(assert (=> b!1115058 (=> (not res!743879) (not e!635700))))

(assert (=> b!1115058 (= res!743879 (= (select (arr!34887 _keys!1208) i!673) k0!934))))

(declare-fun b!1115059 () Bool)

(declare-fun e!635696 () Bool)

(declare-fun e!635699 () Bool)

(declare-fun mapRes!43471 () Bool)

(assert (=> b!1115059 (= e!635696 (and e!635699 mapRes!43471))))

(declare-fun condMapEmpty!43471 () Bool)

(declare-datatypes ((V!42153 0))(
  ( (V!42154 (val!13941 Int)) )
))
(declare-datatypes ((ValueCell!13175 0))(
  ( (ValueCellFull!13175 (v!16570 V!42153)) (EmptyCell!13175) )
))
(declare-datatypes ((array!72483 0))(
  ( (array!72484 (arr!34888 (Array (_ BitVec 32) ValueCell!13175)) (size!35425 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72483)

(declare-fun mapDefault!43471 () ValueCell!13175)

(assert (=> b!1115059 (= condMapEmpty!43471 (= (arr!34888 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13175)) mapDefault!43471)))))

(declare-fun b!1115060 () Bool)

(declare-fun res!743877 () Bool)

(assert (=> b!1115060 (=> (not res!743877) (not e!635700))))

(assert (=> b!1115060 (= res!743877 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35424 _keys!1208))))))

(declare-fun mapNonEmpty!43471 () Bool)

(declare-fun tp!82715 () Bool)

(declare-fun e!635695 () Bool)

(assert (=> mapNonEmpty!43471 (= mapRes!43471 (and tp!82715 e!635695))))

(declare-fun mapValue!43471 () ValueCell!13175)

(declare-fun mapKey!43471 () (_ BitVec 32))

(declare-fun mapRest!43471 () (Array (_ BitVec 32) ValueCell!13175))

(assert (=> mapNonEmpty!43471 (= (arr!34888 _values!996) (store mapRest!43471 mapKey!43471 mapValue!43471))))

(declare-fun b!1115061 () Bool)

(declare-fun res!743883 () Bool)

(assert (=> b!1115061 (=> (not res!743883) (not e!635700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115061 (= res!743883 (validKeyInArray!0 k0!934))))

(declare-fun b!1115062 () Bool)

(declare-fun res!743876 () Bool)

(assert (=> b!1115062 (=> (not res!743876) (not e!635700))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115062 (= res!743876 (and (= (size!35425 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35424 _keys!1208) (size!35425 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!743880 () Bool)

(assert (=> start!97774 (=> (not res!743880) (not e!635700))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97774 (= res!743880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35424 _keys!1208))))))

(assert (=> start!97774 e!635700))

(declare-fun array_inv!26882 (array!72481) Bool)

(assert (=> start!97774 (array_inv!26882 _keys!1208)))

(assert (=> start!97774 true))

(declare-fun array_inv!26883 (array!72483) Bool)

(assert (=> start!97774 (and (array_inv!26883 _values!996) e!635696)))

(declare-fun mapIsEmpty!43471 () Bool)

(assert (=> mapIsEmpty!43471 mapRes!43471))

(declare-fun b!1115063 () Bool)

(assert (=> b!1115063 (= e!635700 e!635698)))

(declare-fun res!743875 () Bool)

(assert (=> b!1115063 (=> (not res!743875) (not e!635698))))

(declare-fun lt!497232 () array!72481)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72481 (_ BitVec 32)) Bool)

(assert (=> b!1115063 (= res!743875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497232 mask!1564))))

(assert (=> b!1115063 (= lt!497232 (array!72482 (store (arr!34887 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35424 _keys!1208)))))

(declare-fun b!1115064 () Bool)

(declare-fun res!743881 () Bool)

(assert (=> b!1115064 (=> (not res!743881) (not e!635700))))

(assert (=> b!1115064 (= res!743881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115065 () Bool)

(declare-fun res!743884 () Bool)

(assert (=> b!1115065 (=> (not res!743884) (not e!635698))))

(declare-datatypes ((List!24333 0))(
  ( (Nil!24330) (Cons!24329 (h!25547 (_ BitVec 64)) (t!34806 List!24333)) )
))
(declare-fun arrayNoDuplicates!0 (array!72481 (_ BitVec 32) List!24333) Bool)

(assert (=> b!1115065 (= res!743884 (arrayNoDuplicates!0 lt!497232 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun b!1115066 () Bool)

(declare-fun tp_is_empty!27769 () Bool)

(assert (=> b!1115066 (= e!635699 tp_is_empty!27769)))

(declare-fun b!1115067 () Bool)

(declare-fun res!743882 () Bool)

(assert (=> b!1115067 (=> (not res!743882) (not e!635700))))

(assert (=> b!1115067 (= res!743882 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun b!1115068 () Bool)

(assert (=> b!1115068 (= e!635695 tp_is_empty!27769)))

(assert (= (and start!97774 res!743880) b!1115056))

(assert (= (and b!1115056 res!743878) b!1115062))

(assert (= (and b!1115062 res!743876) b!1115064))

(assert (= (and b!1115064 res!743881) b!1115067))

(assert (= (and b!1115067 res!743882) b!1115060))

(assert (= (and b!1115060 res!743877) b!1115061))

(assert (= (and b!1115061 res!743883) b!1115058))

(assert (= (and b!1115058 res!743879) b!1115063))

(assert (= (and b!1115063 res!743875) b!1115065))

(assert (= (and b!1115065 res!743884) b!1115057))

(assert (= (and b!1115059 condMapEmpty!43471) mapIsEmpty!43471))

(assert (= (and b!1115059 (not condMapEmpty!43471)) mapNonEmpty!43471))

(get-info :version)

(assert (= (and mapNonEmpty!43471 ((_ is ValueCellFull!13175) mapValue!43471)) b!1115068))

(assert (= (and b!1115059 ((_ is ValueCellFull!13175) mapDefault!43471)) b!1115066))

(assert (= start!97774 b!1115059))

(declare-fun m!1032513 () Bool)

(assert (=> b!1115067 m!1032513))

(declare-fun m!1032515 () Bool)

(assert (=> mapNonEmpty!43471 m!1032515))

(declare-fun m!1032517 () Bool)

(assert (=> b!1115061 m!1032517))

(declare-fun m!1032519 () Bool)

(assert (=> b!1115065 m!1032519))

(declare-fun m!1032521 () Bool)

(assert (=> b!1115058 m!1032521))

(declare-fun m!1032523 () Bool)

(assert (=> b!1115056 m!1032523))

(declare-fun m!1032525 () Bool)

(assert (=> start!97774 m!1032525))

(declare-fun m!1032527 () Bool)

(assert (=> start!97774 m!1032527))

(declare-fun m!1032529 () Bool)

(assert (=> b!1115057 m!1032529))

(declare-fun m!1032531 () Bool)

(assert (=> b!1115057 m!1032531))

(declare-fun m!1032533 () Bool)

(assert (=> b!1115064 m!1032533))

(declare-fun m!1032535 () Bool)

(assert (=> b!1115063 m!1032535))

(declare-fun m!1032537 () Bool)

(assert (=> b!1115063 m!1032537))

(check-sat (not b!1115056) (not b!1115057) (not b!1115065) (not b!1115061) (not b!1115064) tp_is_empty!27769 (not b!1115063) (not b!1115067) (not start!97774) (not mapNonEmpty!43471))
(check-sat)
