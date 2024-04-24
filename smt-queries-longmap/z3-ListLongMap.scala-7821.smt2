; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97906 () Bool)

(assert start!97906)

(declare-fun b!1117630 () Bool)

(declare-fun res!745858 () Bool)

(declare-fun e!636883 () Bool)

(assert (=> b!1117630 (=> (not res!745858) (not e!636883))))

(declare-datatypes ((array!72741 0))(
  ( (array!72742 (arr!35017 (Array (_ BitVec 32) (_ BitVec 64))) (size!35554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72741)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117630 (= res!745858 (= (select (arr!35017 _keys!1208) i!673) k0!934))))

(declare-fun b!1117631 () Bool)

(declare-fun res!745860 () Bool)

(assert (=> b!1117631 (=> (not res!745860) (not e!636883))))

(declare-datatypes ((List!24386 0))(
  ( (Nil!24383) (Cons!24382 (h!25600 (_ BitVec 64)) (t!34859 List!24386)) )
))
(declare-fun arrayNoDuplicates!0 (array!72741 (_ BitVec 32) List!24386) Bool)

(assert (=> b!1117631 (= res!745860 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24383))))

(declare-fun b!1117632 () Bool)

(declare-fun e!636886 () Bool)

(declare-fun e!636887 () Bool)

(declare-fun mapRes!43669 () Bool)

(assert (=> b!1117632 (= e!636886 (and e!636887 mapRes!43669))))

(declare-fun condMapEmpty!43669 () Bool)

(declare-datatypes ((V!42329 0))(
  ( (V!42330 (val!14007 Int)) )
))
(declare-datatypes ((ValueCell!13241 0))(
  ( (ValueCellFull!13241 (v!16636 V!42329)) (EmptyCell!13241) )
))
(declare-datatypes ((array!72743 0))(
  ( (array!72744 (arr!35018 (Array (_ BitVec 32) ValueCell!13241)) (size!35555 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72743)

(declare-fun mapDefault!43669 () ValueCell!13241)

(assert (=> b!1117632 (= condMapEmpty!43669 (= (arr!35018 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13241)) mapDefault!43669)))))

(declare-fun b!1117633 () Bool)

(declare-fun res!745861 () Bool)

(assert (=> b!1117633 (=> (not res!745861) (not e!636883))))

(assert (=> b!1117633 (= res!745861 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35554 _keys!1208))))))

(declare-fun mapNonEmpty!43669 () Bool)

(declare-fun tp!82913 () Bool)

(declare-fun e!636885 () Bool)

(assert (=> mapNonEmpty!43669 (= mapRes!43669 (and tp!82913 e!636885))))

(declare-fun mapKey!43669 () (_ BitVec 32))

(declare-fun mapValue!43669 () ValueCell!13241)

(declare-fun mapRest!43669 () (Array (_ BitVec 32) ValueCell!13241))

(assert (=> mapNonEmpty!43669 (= (arr!35018 _values!996) (store mapRest!43669 mapKey!43669 mapValue!43669))))

(declare-fun res!745864 () Bool)

(assert (=> start!97906 (=> (not res!745864) (not e!636883))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97906 (= res!745864 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35554 _keys!1208))))))

(assert (=> start!97906 e!636883))

(declare-fun array_inv!26978 (array!72741) Bool)

(assert (=> start!97906 (array_inv!26978 _keys!1208)))

(assert (=> start!97906 true))

(declare-fun array_inv!26979 (array!72743) Bool)

(assert (=> start!97906 (and (array_inv!26979 _values!996) e!636886)))

(declare-fun b!1117634 () Bool)

(declare-fun res!745856 () Bool)

(declare-fun e!636884 () Bool)

(assert (=> b!1117634 (=> (not res!745856) (not e!636884))))

(declare-fun lt!497629 () array!72741)

(assert (=> b!1117634 (= res!745856 (arrayNoDuplicates!0 lt!497629 #b00000000000000000000000000000000 Nil!24383))))

(declare-fun mapIsEmpty!43669 () Bool)

(assert (=> mapIsEmpty!43669 mapRes!43669))

(declare-fun b!1117635 () Bool)

(declare-fun tp_is_empty!27901 () Bool)

(assert (=> b!1117635 (= e!636887 tp_is_empty!27901)))

(declare-fun b!1117636 () Bool)

(declare-fun res!745859 () Bool)

(assert (=> b!1117636 (=> (not res!745859) (not e!636883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117636 (= res!745859 (validKeyInArray!0 k0!934))))

(declare-fun b!1117637 () Bool)

(declare-fun res!745857 () Bool)

(assert (=> b!1117637 (=> (not res!745857) (not e!636883))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1117637 (= res!745857 (and (= (size!35555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35554 _keys!1208) (size!35555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117638 () Bool)

(assert (=> b!1117638 (= e!636885 tp_is_empty!27901)))

(declare-fun b!1117639 () Bool)

(declare-fun res!745863 () Bool)

(assert (=> b!1117639 (=> (not res!745863) (not e!636883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72741 (_ BitVec 32)) Bool)

(assert (=> b!1117639 (= res!745863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117640 () Bool)

(assert (=> b!1117640 (= e!636884 (not true))))

(declare-fun arrayContainsKey!0 (array!72741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117640 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36605 0))(
  ( (Unit!36606) )
))
(declare-fun lt!497628 () Unit!36605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72741 (_ BitVec 64) (_ BitVec 32)) Unit!36605)

(assert (=> b!1117640 (= lt!497628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117641 () Bool)

(assert (=> b!1117641 (= e!636883 e!636884)))

(declare-fun res!745862 () Bool)

(assert (=> b!1117641 (=> (not res!745862) (not e!636884))))

(assert (=> b!1117641 (= res!745862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497629 mask!1564))))

(assert (=> b!1117641 (= lt!497629 (array!72742 (store (arr!35017 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35554 _keys!1208)))))

(declare-fun b!1117642 () Bool)

(declare-fun res!745855 () Bool)

(assert (=> b!1117642 (=> (not res!745855) (not e!636883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117642 (= res!745855 (validMask!0 mask!1564))))

(assert (= (and start!97906 res!745864) b!1117642))

(assert (= (and b!1117642 res!745855) b!1117637))

(assert (= (and b!1117637 res!745857) b!1117639))

(assert (= (and b!1117639 res!745863) b!1117631))

(assert (= (and b!1117631 res!745860) b!1117633))

(assert (= (and b!1117633 res!745861) b!1117636))

(assert (= (and b!1117636 res!745859) b!1117630))

(assert (= (and b!1117630 res!745858) b!1117641))

(assert (= (and b!1117641 res!745862) b!1117634))

(assert (= (and b!1117634 res!745856) b!1117640))

(assert (= (and b!1117632 condMapEmpty!43669) mapIsEmpty!43669))

(assert (= (and b!1117632 (not condMapEmpty!43669)) mapNonEmpty!43669))

(get-info :version)

(assert (= (and mapNonEmpty!43669 ((_ is ValueCellFull!13241) mapValue!43669)) b!1117638))

(assert (= (and b!1117632 ((_ is ValueCellFull!13241) mapDefault!43669)) b!1117635))

(assert (= start!97906 b!1117632))

(declare-fun m!1034229 () Bool)

(assert (=> b!1117630 m!1034229))

(declare-fun m!1034231 () Bool)

(assert (=> start!97906 m!1034231))

(declare-fun m!1034233 () Bool)

(assert (=> start!97906 m!1034233))

(declare-fun m!1034235 () Bool)

(assert (=> b!1117634 m!1034235))

(declare-fun m!1034237 () Bool)

(assert (=> mapNonEmpty!43669 m!1034237))

(declare-fun m!1034239 () Bool)

(assert (=> b!1117640 m!1034239))

(declare-fun m!1034241 () Bool)

(assert (=> b!1117640 m!1034241))

(declare-fun m!1034243 () Bool)

(assert (=> b!1117639 m!1034243))

(declare-fun m!1034245 () Bool)

(assert (=> b!1117641 m!1034245))

(declare-fun m!1034247 () Bool)

(assert (=> b!1117641 m!1034247))

(declare-fun m!1034249 () Bool)

(assert (=> b!1117631 m!1034249))

(declare-fun m!1034251 () Bool)

(assert (=> b!1117642 m!1034251))

(declare-fun m!1034253 () Bool)

(assert (=> b!1117636 m!1034253))

(check-sat (not mapNonEmpty!43669) (not b!1117634) (not b!1117639) (not b!1117631) (not b!1117641) (not b!1117642) tp_is_empty!27901 (not b!1117636) (not b!1117640) (not start!97906))
(check-sat)
