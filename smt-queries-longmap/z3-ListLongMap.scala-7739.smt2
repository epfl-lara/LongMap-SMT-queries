; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97180 () Bool)

(assert start!97180)

(declare-fun b!1105524 () Bool)

(declare-fun e!630955 () Bool)

(declare-fun tp_is_empty!27411 () Bool)

(assert (=> b!1105524 (= e!630955 tp_is_empty!27411)))

(declare-fun b!1105525 () Bool)

(declare-fun res!737664 () Bool)

(declare-fun e!630954 () Bool)

(assert (=> b!1105525 (=> (not res!737664) (not e!630954))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105525 (= res!737664 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!42934 () Bool)

(declare-fun mapRes!42934 () Bool)

(assert (=> mapIsEmpty!42934 mapRes!42934))

(declare-fun b!1105526 () Bool)

(declare-fun res!737668 () Bool)

(assert (=> b!1105526 (=> (not res!737668) (not e!630954))))

(declare-datatypes ((array!71743 0))(
  ( (array!71744 (arr!34524 (Array (_ BitVec 32) (_ BitVec 64))) (size!35060 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71743)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105526 (= res!737668 (= (select (arr!34524 _keys!1208) i!673) k0!934))))

(declare-fun b!1105527 () Bool)

(declare-fun e!630956 () Bool)

(assert (=> b!1105527 (= e!630956 tp_is_empty!27411)))

(declare-fun b!1105528 () Bool)

(declare-fun e!630953 () Bool)

(assert (=> b!1105528 (= e!630954 e!630953)))

(declare-fun res!737659 () Bool)

(assert (=> b!1105528 (=> (not res!737659) (not e!630953))))

(declare-fun lt!495319 () array!71743)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71743 (_ BitVec 32)) Bool)

(assert (=> b!1105528 (= res!737659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495319 mask!1564))))

(assert (=> b!1105528 (= lt!495319 (array!71744 (store (arr!34524 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35060 _keys!1208)))))

(declare-fun res!737661 () Bool)

(assert (=> start!97180 (=> (not res!737661) (not e!630954))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97180 (= res!737661 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35060 _keys!1208))))))

(assert (=> start!97180 e!630954))

(declare-fun array_inv!26576 (array!71743) Bool)

(assert (=> start!97180 (array_inv!26576 _keys!1208)))

(assert (=> start!97180 true))

(declare-datatypes ((V!41675 0))(
  ( (V!41676 (val!13762 Int)) )
))
(declare-datatypes ((ValueCell!12996 0))(
  ( (ValueCellFull!12996 (v!16395 V!41675)) (EmptyCell!12996) )
))
(declare-datatypes ((array!71745 0))(
  ( (array!71746 (arr!34525 (Array (_ BitVec 32) ValueCell!12996)) (size!35061 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71745)

(declare-fun e!630957 () Bool)

(declare-fun array_inv!26577 (array!71745) Bool)

(assert (=> start!97180 (and (array_inv!26577 _values!996) e!630957)))

(declare-fun b!1105529 () Bool)

(assert (=> b!1105529 (= e!630953 (not true))))

(declare-fun arrayContainsKey!0 (array!71743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105529 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36276 0))(
  ( (Unit!36277) )
))
(declare-fun lt!495320 () Unit!36276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71743 (_ BitVec 64) (_ BitVec 32)) Unit!36276)

(assert (=> b!1105529 (= lt!495320 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105530 () Bool)

(declare-fun res!737660 () Bool)

(assert (=> b!1105530 (=> (not res!737660) (not e!630954))))

(declare-datatypes ((List!24076 0))(
  ( (Nil!24073) (Cons!24072 (h!25281 (_ BitVec 64)) (t!34341 List!24076)) )
))
(declare-fun arrayNoDuplicates!0 (array!71743 (_ BitVec 32) List!24076) Bool)

(assert (=> b!1105530 (= res!737660 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24073))))

(declare-fun b!1105531 () Bool)

(assert (=> b!1105531 (= e!630957 (and e!630955 mapRes!42934))))

(declare-fun condMapEmpty!42934 () Bool)

(declare-fun mapDefault!42934 () ValueCell!12996)

(assert (=> b!1105531 (= condMapEmpty!42934 (= (arr!34525 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12996)) mapDefault!42934)))))

(declare-fun b!1105532 () Bool)

(declare-fun res!737663 () Bool)

(assert (=> b!1105532 (=> (not res!737663) (not e!630954))))

(assert (=> b!1105532 (= res!737663 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35060 _keys!1208))))))

(declare-fun b!1105533 () Bool)

(declare-fun res!737662 () Bool)

(assert (=> b!1105533 (=> (not res!737662) (not e!630954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105533 (= res!737662 (validMask!0 mask!1564))))

(declare-fun b!1105534 () Bool)

(declare-fun res!737666 () Bool)

(assert (=> b!1105534 (=> (not res!737666) (not e!630954))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105534 (= res!737666 (and (= (size!35061 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35060 _keys!1208) (size!35061 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42934 () Bool)

(declare-fun tp!81854 () Bool)

(assert (=> mapNonEmpty!42934 (= mapRes!42934 (and tp!81854 e!630956))))

(declare-fun mapRest!42934 () (Array (_ BitVec 32) ValueCell!12996))

(declare-fun mapKey!42934 () (_ BitVec 32))

(declare-fun mapValue!42934 () ValueCell!12996)

(assert (=> mapNonEmpty!42934 (= (arr!34525 _values!996) (store mapRest!42934 mapKey!42934 mapValue!42934))))

(declare-fun b!1105535 () Bool)

(declare-fun res!737667 () Bool)

(assert (=> b!1105535 (=> (not res!737667) (not e!630953))))

(assert (=> b!1105535 (= res!737667 (arrayNoDuplicates!0 lt!495319 #b00000000000000000000000000000000 Nil!24073))))

(declare-fun b!1105536 () Bool)

(declare-fun res!737665 () Bool)

(assert (=> b!1105536 (=> (not res!737665) (not e!630954))))

(assert (=> b!1105536 (= res!737665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97180 res!737661) b!1105533))

(assert (= (and b!1105533 res!737662) b!1105534))

(assert (= (and b!1105534 res!737666) b!1105536))

(assert (= (and b!1105536 res!737665) b!1105530))

(assert (= (and b!1105530 res!737660) b!1105532))

(assert (= (and b!1105532 res!737663) b!1105525))

(assert (= (and b!1105525 res!737664) b!1105526))

(assert (= (and b!1105526 res!737668) b!1105528))

(assert (= (and b!1105528 res!737659) b!1105535))

(assert (= (and b!1105535 res!737667) b!1105529))

(assert (= (and b!1105531 condMapEmpty!42934) mapIsEmpty!42934))

(assert (= (and b!1105531 (not condMapEmpty!42934)) mapNonEmpty!42934))

(get-info :version)

(assert (= (and mapNonEmpty!42934 ((_ is ValueCellFull!12996) mapValue!42934)) b!1105527))

(assert (= (and b!1105531 ((_ is ValueCellFull!12996) mapDefault!42934)) b!1105524))

(assert (= start!97180 b!1105531))

(declare-fun m!1024891 () Bool)

(assert (=> b!1105528 m!1024891))

(declare-fun m!1024893 () Bool)

(assert (=> b!1105528 m!1024893))

(declare-fun m!1024895 () Bool)

(assert (=> start!97180 m!1024895))

(declare-fun m!1024897 () Bool)

(assert (=> start!97180 m!1024897))

(declare-fun m!1024899 () Bool)

(assert (=> b!1105533 m!1024899))

(declare-fun m!1024901 () Bool)

(assert (=> b!1105526 m!1024901))

(declare-fun m!1024903 () Bool)

(assert (=> mapNonEmpty!42934 m!1024903))

(declare-fun m!1024905 () Bool)

(assert (=> b!1105536 m!1024905))

(declare-fun m!1024907 () Bool)

(assert (=> b!1105525 m!1024907))

(declare-fun m!1024909 () Bool)

(assert (=> b!1105529 m!1024909))

(declare-fun m!1024911 () Bool)

(assert (=> b!1105529 m!1024911))

(declare-fun m!1024913 () Bool)

(assert (=> b!1105530 m!1024913))

(declare-fun m!1024915 () Bool)

(assert (=> b!1105535 m!1024915))

(check-sat (not b!1105533) (not b!1105536) (not b!1105535) (not b!1105528) (not b!1105529) (not b!1105530) (not start!97180) (not b!1105525) tp_is_empty!27411 (not mapNonEmpty!42934))
(check-sat)
