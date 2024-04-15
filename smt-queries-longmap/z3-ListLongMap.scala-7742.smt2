; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97190 () Bool)

(assert start!97190)

(declare-fun b!1105683 () Bool)

(declare-fun e!631005 () Bool)

(declare-fun e!631004 () Bool)

(declare-fun mapRes!42958 () Bool)

(assert (=> b!1105683 (= e!631005 (and e!631004 mapRes!42958))))

(declare-fun condMapEmpty!42958 () Bool)

(declare-datatypes ((V!41697 0))(
  ( (V!41698 (val!13770 Int)) )
))
(declare-datatypes ((ValueCell!13004 0))(
  ( (ValueCellFull!13004 (v!16402 V!41697)) (EmptyCell!13004) )
))
(declare-datatypes ((array!71686 0))(
  ( (array!71687 (arr!34496 (Array (_ BitVec 32) ValueCell!13004)) (size!35034 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71686)

(declare-fun mapDefault!42958 () ValueCell!13004)

(assert (=> b!1105683 (= condMapEmpty!42958 (= (arr!34496 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13004)) mapDefault!42958)))))

(declare-fun b!1105684 () Bool)

(declare-fun res!737836 () Bool)

(declare-fun e!631006 () Bool)

(assert (=> b!1105684 (=> (not res!737836) (not e!631006))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71688 0))(
  ( (array!71689 (arr!34497 (Array (_ BitVec 32) (_ BitVec 64))) (size!35035 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71688)

(assert (=> b!1105684 (= res!737836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35035 _keys!1208))))))

(declare-fun b!1105685 () Bool)

(declare-fun e!631008 () Bool)

(declare-fun tp_is_empty!27427 () Bool)

(assert (=> b!1105685 (= e!631008 tp_is_empty!27427)))

(declare-fun b!1105687 () Bool)

(declare-fun res!737830 () Bool)

(assert (=> b!1105687 (=> (not res!737830) (not e!631006))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105687 (= res!737830 (validMask!0 mask!1564))))

(declare-fun b!1105688 () Bool)

(declare-fun res!737832 () Bool)

(assert (=> b!1105688 (=> (not res!737832) (not e!631006))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105688 (= res!737832 (and (= (size!35034 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35035 _keys!1208) (size!35034 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105689 () Bool)

(declare-fun e!631007 () Bool)

(assert (=> b!1105689 (= e!631006 e!631007)))

(declare-fun res!737833 () Bool)

(assert (=> b!1105689 (=> (not res!737833) (not e!631007))))

(declare-fun lt!495167 () array!71688)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71688 (_ BitVec 32)) Bool)

(assert (=> b!1105689 (= res!737833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495167 mask!1564))))

(assert (=> b!1105689 (= lt!495167 (array!71689 (store (arr!34497 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35035 _keys!1208)))))

(declare-fun b!1105690 () Bool)

(assert (=> b!1105690 (= e!631004 tp_is_empty!27427)))

(declare-fun b!1105691 () Bool)

(declare-fun res!737838 () Bool)

(assert (=> b!1105691 (=> (not res!737838) (not e!631006))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105691 (= res!737838 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42958 () Bool)

(declare-fun tp!81878 () Bool)

(assert (=> mapNonEmpty!42958 (= mapRes!42958 (and tp!81878 e!631008))))

(declare-fun mapValue!42958 () ValueCell!13004)

(declare-fun mapKey!42958 () (_ BitVec 32))

(declare-fun mapRest!42958 () (Array (_ BitVec 32) ValueCell!13004))

(assert (=> mapNonEmpty!42958 (= (arr!34496 _values!996) (store mapRest!42958 mapKey!42958 mapValue!42958))))

(declare-fun b!1105692 () Bool)

(declare-fun res!737839 () Bool)

(assert (=> b!1105692 (=> (not res!737839) (not e!631006))))

(declare-datatypes ((List!24116 0))(
  ( (Nil!24113) (Cons!24112 (h!25321 (_ BitVec 64)) (t!34372 List!24116)) )
))
(declare-fun arrayNoDuplicates!0 (array!71688 (_ BitVec 32) List!24116) Bool)

(assert (=> b!1105692 (= res!737839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24113))))

(declare-fun res!737831 () Bool)

(assert (=> start!97190 (=> (not res!737831) (not e!631006))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97190 (= res!737831 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35035 _keys!1208))))))

(assert (=> start!97190 e!631006))

(declare-fun array_inv!26604 (array!71688) Bool)

(assert (=> start!97190 (array_inv!26604 _keys!1208)))

(assert (=> start!97190 true))

(declare-fun array_inv!26605 (array!71686) Bool)

(assert (=> start!97190 (and (array_inv!26605 _values!996) e!631005)))

(declare-fun b!1105686 () Bool)

(declare-fun res!737835 () Bool)

(assert (=> b!1105686 (=> (not res!737835) (not e!631006))))

(assert (=> b!1105686 (= res!737835 (= (select (arr!34497 _keys!1208) i!673) k0!934))))

(declare-fun b!1105693 () Bool)

(assert (=> b!1105693 (= e!631007 (not true))))

(declare-fun arrayContainsKey!0 (array!71688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105693 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36107 0))(
  ( (Unit!36108) )
))
(declare-fun lt!495168 () Unit!36107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71688 (_ BitVec 64) (_ BitVec 32)) Unit!36107)

(assert (=> b!1105693 (= lt!495168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105694 () Bool)

(declare-fun res!737837 () Bool)

(assert (=> b!1105694 (=> (not res!737837) (not e!631007))))

(assert (=> b!1105694 (= res!737837 (arrayNoDuplicates!0 lt!495167 #b00000000000000000000000000000000 Nil!24113))))

(declare-fun b!1105695 () Bool)

(declare-fun res!737834 () Bool)

(assert (=> b!1105695 (=> (not res!737834) (not e!631006))))

(assert (=> b!1105695 (= res!737834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42958 () Bool)

(assert (=> mapIsEmpty!42958 mapRes!42958))

(assert (= (and start!97190 res!737831) b!1105687))

(assert (= (and b!1105687 res!737830) b!1105688))

(assert (= (and b!1105688 res!737832) b!1105695))

(assert (= (and b!1105695 res!737834) b!1105692))

(assert (= (and b!1105692 res!737839) b!1105684))

(assert (= (and b!1105684 res!737836) b!1105691))

(assert (= (and b!1105691 res!737838) b!1105686))

(assert (= (and b!1105686 res!737835) b!1105689))

(assert (= (and b!1105689 res!737833) b!1105694))

(assert (= (and b!1105694 res!737837) b!1105693))

(assert (= (and b!1105683 condMapEmpty!42958) mapIsEmpty!42958))

(assert (= (and b!1105683 (not condMapEmpty!42958)) mapNonEmpty!42958))

(get-info :version)

(assert (= (and mapNonEmpty!42958 ((_ is ValueCellFull!13004) mapValue!42958)) b!1105685))

(assert (= (and b!1105683 ((_ is ValueCellFull!13004) mapDefault!42958)) b!1105690))

(assert (= start!97190 b!1105683))

(declare-fun m!1024473 () Bool)

(assert (=> b!1105692 m!1024473))

(declare-fun m!1024475 () Bool)

(assert (=> b!1105691 m!1024475))

(declare-fun m!1024477 () Bool)

(assert (=> b!1105686 m!1024477))

(declare-fun m!1024479 () Bool)

(assert (=> b!1105687 m!1024479))

(declare-fun m!1024481 () Bool)

(assert (=> b!1105689 m!1024481))

(declare-fun m!1024483 () Bool)

(assert (=> b!1105689 m!1024483))

(declare-fun m!1024485 () Bool)

(assert (=> b!1105693 m!1024485))

(declare-fun m!1024487 () Bool)

(assert (=> b!1105693 m!1024487))

(declare-fun m!1024489 () Bool)

(assert (=> b!1105695 m!1024489))

(declare-fun m!1024491 () Bool)

(assert (=> b!1105694 m!1024491))

(declare-fun m!1024493 () Bool)

(assert (=> start!97190 m!1024493))

(declare-fun m!1024495 () Bool)

(assert (=> start!97190 m!1024495))

(declare-fun m!1024497 () Bool)

(assert (=> mapNonEmpty!42958 m!1024497))

(check-sat (not b!1105695) (not b!1105692) (not b!1105691) (not start!97190) (not b!1105694) (not mapNonEmpty!42958) tp_is_empty!27427 (not b!1105689) (not b!1105687) (not b!1105693))
(check-sat)
