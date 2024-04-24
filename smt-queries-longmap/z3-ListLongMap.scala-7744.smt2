; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97444 () Bool)

(assert start!97444)

(declare-fun b!1107397 () Bool)

(declare-fun res!738606 () Bool)

(declare-fun e!632061 () Bool)

(assert (=> b!1107397 (=> (not res!738606) (not e!632061))))

(declare-datatypes ((array!71831 0))(
  ( (array!71832 (arr!34562 (Array (_ BitVec 32) (_ BitVec 64))) (size!35099 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71831)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41713 0))(
  ( (V!41714 (val!13776 Int)) )
))
(declare-datatypes ((ValueCell!13010 0))(
  ( (ValueCellFull!13010 (v!16405 V!41713)) (EmptyCell!13010) )
))
(declare-datatypes ((array!71833 0))(
  ( (array!71834 (arr!34563 (Array (_ BitVec 32) ValueCell!13010)) (size!35100 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71833)

(assert (=> b!1107397 (= res!738606 (and (= (size!35100 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35099 _keys!1208) (size!35100 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107398 () Bool)

(declare-fun e!632063 () Bool)

(declare-fun e!632062 () Bool)

(declare-fun mapRes!42976 () Bool)

(assert (=> b!1107398 (= e!632063 (and e!632062 mapRes!42976))))

(declare-fun condMapEmpty!42976 () Bool)

(declare-fun mapDefault!42976 () ValueCell!13010)

(assert (=> b!1107398 (= condMapEmpty!42976 (= (arr!34563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13010)) mapDefault!42976)))))

(declare-fun b!1107399 () Bool)

(declare-fun res!738603 () Bool)

(assert (=> b!1107399 (=> (not res!738603) (not e!632061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107399 (= res!738603 (validMask!0 mask!1564))))

(declare-fun b!1107400 () Bool)

(declare-fun e!632060 () Bool)

(assert (=> b!1107400 (= e!632061 e!632060)))

(declare-fun res!738605 () Bool)

(assert (=> b!1107400 (=> (not res!738605) (not e!632060))))

(declare-fun lt!495918 () array!71831)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71831 (_ BitVec 32)) Bool)

(assert (=> b!1107400 (= res!738605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495918 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107400 (= lt!495918 (array!71832 (store (arr!34562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35099 _keys!1208)))))

(declare-fun mapNonEmpty!42976 () Bool)

(declare-fun tp!81896 () Bool)

(declare-fun e!632064 () Bool)

(assert (=> mapNonEmpty!42976 (= mapRes!42976 (and tp!81896 e!632064))))

(declare-fun mapValue!42976 () ValueCell!13010)

(declare-fun mapRest!42976 () (Array (_ BitVec 32) ValueCell!13010))

(declare-fun mapKey!42976 () (_ BitVec 32))

(assert (=> mapNonEmpty!42976 (= (arr!34563 _values!996) (store mapRest!42976 mapKey!42976 mapValue!42976))))

(declare-fun b!1107401 () Bool)

(declare-fun res!738608 () Bool)

(assert (=> b!1107401 (=> (not res!738608) (not e!632061))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107401 (= res!738608 (validKeyInArray!0 k0!934))))

(declare-fun b!1107402 () Bool)

(declare-fun tp_is_empty!27439 () Bool)

(assert (=> b!1107402 (= e!632062 tp_is_empty!27439)))

(declare-fun mapIsEmpty!42976 () Bool)

(assert (=> mapIsEmpty!42976 mapRes!42976))

(declare-fun b!1107403 () Bool)

(declare-fun res!738607 () Bool)

(assert (=> b!1107403 (=> (not res!738607) (not e!632061))))

(assert (=> b!1107403 (= res!738607 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35099 _keys!1208))))))

(declare-fun b!1107404 () Bool)

(declare-fun res!738609 () Bool)

(assert (=> b!1107404 (=> (not res!738609) (not e!632061))))

(declare-datatypes ((List!24109 0))(
  ( (Nil!24106) (Cons!24105 (h!25323 (_ BitVec 64)) (t!34366 List!24109)) )
))
(declare-fun arrayNoDuplicates!0 (array!71831 (_ BitVec 32) List!24109) Bool)

(assert (=> b!1107404 (= res!738609 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24106))))

(declare-fun b!1107405 () Bool)

(declare-fun res!738602 () Bool)

(assert (=> b!1107405 (=> (not res!738602) (not e!632060))))

(assert (=> b!1107405 (= res!738602 (arrayNoDuplicates!0 lt!495918 #b00000000000000000000000000000000 Nil!24106))))

(declare-fun b!1107406 () Bool)

(assert (=> b!1107406 (= e!632060 (not true))))

(declare-fun arrayContainsKey!0 (array!71831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107406 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36289 0))(
  ( (Unit!36290) )
))
(declare-fun lt!495919 () Unit!36289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71831 (_ BitVec 64) (_ BitVec 32)) Unit!36289)

(assert (=> b!1107406 (= lt!495919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107407 () Bool)

(assert (=> b!1107407 (= e!632064 tp_is_empty!27439)))

(declare-fun res!738604 () Bool)

(assert (=> start!97444 (=> (not res!738604) (not e!632061))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97444 (= res!738604 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35099 _keys!1208))))))

(assert (=> start!97444 e!632061))

(declare-fun array_inv!26636 (array!71831) Bool)

(assert (=> start!97444 (array_inv!26636 _keys!1208)))

(assert (=> start!97444 true))

(declare-fun array_inv!26637 (array!71833) Bool)

(assert (=> start!97444 (and (array_inv!26637 _values!996) e!632063)))

(declare-fun b!1107408 () Bool)

(declare-fun res!738601 () Bool)

(assert (=> b!1107408 (=> (not res!738601) (not e!632061))))

(assert (=> b!1107408 (= res!738601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107409 () Bool)

(declare-fun res!738610 () Bool)

(assert (=> b!1107409 (=> (not res!738610) (not e!632061))))

(assert (=> b!1107409 (= res!738610 (= (select (arr!34562 _keys!1208) i!673) k0!934))))

(assert (= (and start!97444 res!738604) b!1107399))

(assert (= (and b!1107399 res!738603) b!1107397))

(assert (= (and b!1107397 res!738606) b!1107408))

(assert (= (and b!1107408 res!738601) b!1107404))

(assert (= (and b!1107404 res!738609) b!1107403))

(assert (= (and b!1107403 res!738607) b!1107401))

(assert (= (and b!1107401 res!738608) b!1107409))

(assert (= (and b!1107409 res!738610) b!1107400))

(assert (= (and b!1107400 res!738605) b!1107405))

(assert (= (and b!1107405 res!738602) b!1107406))

(assert (= (and b!1107398 condMapEmpty!42976) mapIsEmpty!42976))

(assert (= (and b!1107398 (not condMapEmpty!42976)) mapNonEmpty!42976))

(get-info :version)

(assert (= (and mapNonEmpty!42976 ((_ is ValueCellFull!13010) mapValue!42976)) b!1107407))

(assert (= (and b!1107398 ((_ is ValueCellFull!13010) mapDefault!42976)) b!1107402))

(assert (= start!97444 b!1107398))

(declare-fun m!1026927 () Bool)

(assert (=> mapNonEmpty!42976 m!1026927))

(declare-fun m!1026929 () Bool)

(assert (=> b!1107401 m!1026929))

(declare-fun m!1026931 () Bool)

(assert (=> b!1107409 m!1026931))

(declare-fun m!1026933 () Bool)

(assert (=> b!1107404 m!1026933))

(declare-fun m!1026935 () Bool)

(assert (=> b!1107399 m!1026935))

(declare-fun m!1026937 () Bool)

(assert (=> start!97444 m!1026937))

(declare-fun m!1026939 () Bool)

(assert (=> start!97444 m!1026939))

(declare-fun m!1026941 () Bool)

(assert (=> b!1107400 m!1026941))

(declare-fun m!1026943 () Bool)

(assert (=> b!1107400 m!1026943))

(declare-fun m!1026945 () Bool)

(assert (=> b!1107405 m!1026945))

(declare-fun m!1026947 () Bool)

(assert (=> b!1107408 m!1026947))

(declare-fun m!1026949 () Bool)

(assert (=> b!1107406 m!1026949))

(declare-fun m!1026951 () Bool)

(assert (=> b!1107406 m!1026951))

(check-sat tp_is_empty!27439 (not b!1107400) (not b!1107404) (not b!1107406) (not mapNonEmpty!42976) (not b!1107408) (not b!1107399) (not b!1107405) (not b!1107401) (not start!97444))
(check-sat)
