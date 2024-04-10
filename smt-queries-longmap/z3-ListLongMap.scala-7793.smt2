; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97504 () Bool)

(assert start!97504)

(declare-fun b!1113066 () Bool)

(declare-fun res!742844 () Bool)

(declare-fun e!634535 () Bool)

(assert (=> b!1113066 (=> (not res!742844) (not e!634535))))

(declare-datatypes ((array!72379 0))(
  ( (array!72380 (arr!34842 (Array (_ BitVec 32) (_ BitVec 64))) (size!35378 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72379)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72379 (_ BitVec 32)) Bool)

(assert (=> b!1113066 (= res!742844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113067 () Bool)

(declare-fun e!634539 () Bool)

(declare-fun tp_is_empty!27735 () Bool)

(assert (=> b!1113067 (= e!634539 tp_is_empty!27735)))

(declare-fun b!1113068 () Bool)

(declare-fun res!742843 () Bool)

(assert (=> b!1113068 (=> (not res!742843) (not e!634535))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113068 (= res!742843 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35378 _keys!1208))))))

(declare-fun mapIsEmpty!43420 () Bool)

(declare-fun mapRes!43420 () Bool)

(assert (=> mapIsEmpty!43420 mapRes!43420))

(declare-fun b!1113069 () Bool)

(declare-fun e!634537 () Bool)

(assert (=> b!1113069 (= e!634537 (and e!634539 mapRes!43420))))

(declare-fun condMapEmpty!43420 () Bool)

(declare-datatypes ((V!42107 0))(
  ( (V!42108 (val!13924 Int)) )
))
(declare-datatypes ((ValueCell!13158 0))(
  ( (ValueCellFull!13158 (v!16557 V!42107)) (EmptyCell!13158) )
))
(declare-datatypes ((array!72381 0))(
  ( (array!72382 (arr!34843 (Array (_ BitVec 32) ValueCell!13158)) (size!35379 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72381)

(declare-fun mapDefault!43420 () ValueCell!13158)

(assert (=> b!1113069 (= condMapEmpty!43420 (= (arr!34843 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13158)) mapDefault!43420)))))

(declare-fun b!1113070 () Bool)

(declare-fun res!742847 () Bool)

(assert (=> b!1113070 (=> (not res!742847) (not e!634535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113070 (= res!742847 (validMask!0 mask!1564))))

(declare-fun res!742849 () Bool)

(assert (=> start!97504 (=> (not res!742849) (not e!634535))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97504 (= res!742849 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35378 _keys!1208))))))

(assert (=> start!97504 e!634535))

(declare-fun array_inv!26792 (array!72379) Bool)

(assert (=> start!97504 (array_inv!26792 _keys!1208)))

(assert (=> start!97504 true))

(declare-fun array_inv!26793 (array!72381) Bool)

(assert (=> start!97504 (and (array_inv!26793 _values!996) e!634537)))

(declare-fun mapNonEmpty!43420 () Bool)

(declare-fun tp!82664 () Bool)

(declare-fun e!634536 () Bool)

(assert (=> mapNonEmpty!43420 (= mapRes!43420 (and tp!82664 e!634536))))

(declare-fun mapKey!43420 () (_ BitVec 32))

(declare-fun mapRest!43420 () (Array (_ BitVec 32) ValueCell!13158))

(declare-fun mapValue!43420 () ValueCell!13158)

(assert (=> mapNonEmpty!43420 (= (arr!34843 _values!996) (store mapRest!43420 mapKey!43420 mapValue!43420))))

(declare-fun b!1113071 () Bool)

(assert (=> b!1113071 (= e!634536 tp_is_empty!27735)))

(declare-fun b!1113072 () Bool)

(declare-fun res!742852 () Bool)

(declare-fun e!634534 () Bool)

(assert (=> b!1113072 (=> (not res!742852) (not e!634534))))

(declare-fun lt!496615 () array!72379)

(declare-datatypes ((List!24304 0))(
  ( (Nil!24301) (Cons!24300 (h!25509 (_ BitVec 64)) (t!34785 List!24304)) )
))
(declare-fun arrayNoDuplicates!0 (array!72379 (_ BitVec 32) List!24304) Bool)

(assert (=> b!1113072 (= res!742852 (arrayNoDuplicates!0 lt!496615 #b00000000000000000000000000000000 Nil!24301))))

(declare-fun b!1113073 () Bool)

(declare-fun res!742846 () Bool)

(assert (=> b!1113073 (=> (not res!742846) (not e!634535))))

(assert (=> b!1113073 (= res!742846 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24301))))

(declare-fun b!1113074 () Bool)

(declare-fun res!742845 () Bool)

(assert (=> b!1113074 (=> (not res!742845) (not e!634535))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113074 (= res!742845 (validKeyInArray!0 k0!934))))

(declare-fun b!1113075 () Bool)

(declare-fun res!742851 () Bool)

(assert (=> b!1113075 (=> (not res!742851) (not e!634535))))

(assert (=> b!1113075 (= res!742851 (= (select (arr!34842 _keys!1208) i!673) k0!934))))

(declare-fun b!1113076 () Bool)

(declare-fun res!742850 () Bool)

(assert (=> b!1113076 (=> (not res!742850) (not e!634535))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113076 (= res!742850 (and (= (size!35379 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35378 _keys!1208) (size!35379 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113077 () Bool)

(assert (=> b!1113077 (= e!634534 (not true))))

(declare-fun arrayContainsKey!0 (array!72379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113077 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36522 0))(
  ( (Unit!36523) )
))
(declare-fun lt!496616 () Unit!36522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72379 (_ BitVec 64) (_ BitVec 32)) Unit!36522)

(assert (=> b!1113077 (= lt!496616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113078 () Bool)

(assert (=> b!1113078 (= e!634535 e!634534)))

(declare-fun res!742848 () Bool)

(assert (=> b!1113078 (=> (not res!742848) (not e!634534))))

(assert (=> b!1113078 (= res!742848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496615 mask!1564))))

(assert (=> b!1113078 (= lt!496615 (array!72380 (store (arr!34842 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35378 _keys!1208)))))

(assert (= (and start!97504 res!742849) b!1113070))

(assert (= (and b!1113070 res!742847) b!1113076))

(assert (= (and b!1113076 res!742850) b!1113066))

(assert (= (and b!1113066 res!742844) b!1113073))

(assert (= (and b!1113073 res!742846) b!1113068))

(assert (= (and b!1113068 res!742843) b!1113074))

(assert (= (and b!1113074 res!742845) b!1113075))

(assert (= (and b!1113075 res!742851) b!1113078))

(assert (= (and b!1113078 res!742848) b!1113072))

(assert (= (and b!1113072 res!742852) b!1113077))

(assert (= (and b!1113069 condMapEmpty!43420) mapIsEmpty!43420))

(assert (= (and b!1113069 (not condMapEmpty!43420)) mapNonEmpty!43420))

(get-info :version)

(assert (= (and mapNonEmpty!43420 ((_ is ValueCellFull!13158) mapValue!43420)) b!1113071))

(assert (= (and b!1113069 ((_ is ValueCellFull!13158) mapDefault!43420)) b!1113067))

(assert (= start!97504 b!1113069))

(declare-fun m!1030399 () Bool)

(assert (=> b!1113074 m!1030399))

(declare-fun m!1030401 () Bool)

(assert (=> b!1113070 m!1030401))

(declare-fun m!1030403 () Bool)

(assert (=> start!97504 m!1030403))

(declare-fun m!1030405 () Bool)

(assert (=> start!97504 m!1030405))

(declare-fun m!1030407 () Bool)

(assert (=> b!1113066 m!1030407))

(declare-fun m!1030409 () Bool)

(assert (=> mapNonEmpty!43420 m!1030409))

(declare-fun m!1030411 () Bool)

(assert (=> b!1113073 m!1030411))

(declare-fun m!1030413 () Bool)

(assert (=> b!1113072 m!1030413))

(declare-fun m!1030415 () Bool)

(assert (=> b!1113077 m!1030415))

(declare-fun m!1030417 () Bool)

(assert (=> b!1113077 m!1030417))

(declare-fun m!1030419 () Bool)

(assert (=> b!1113078 m!1030419))

(declare-fun m!1030421 () Bool)

(assert (=> b!1113078 m!1030421))

(declare-fun m!1030423 () Bool)

(assert (=> b!1113075 m!1030423))

(check-sat (not b!1113074) (not mapNonEmpty!43420) (not b!1113066) tp_is_empty!27735 (not b!1113077) (not start!97504) (not b!1113070) (not b!1113078) (not b!1113073) (not b!1113072))
(check-sat)
