; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97942 () Bool)

(assert start!97942)

(declare-fun mapIsEmpty!43723 () Bool)

(declare-fun mapRes!43723 () Bool)

(assert (=> mapIsEmpty!43723 mapRes!43723))

(declare-fun b!1118332 () Bool)

(declare-fun res!746395 () Bool)

(declare-fun e!637212 () Bool)

(assert (=> b!1118332 (=> (not res!746395) (not e!637212))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118332 (= res!746395 (validMask!0 mask!1564))))

(declare-fun b!1118333 () Bool)

(declare-fun res!746397 () Bool)

(assert (=> b!1118333 (=> (not res!746397) (not e!637212))))

(declare-datatypes ((array!72811 0))(
  ( (array!72812 (arr!35052 (Array (_ BitVec 32) (_ BitVec 64))) (size!35589 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72811)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118333 (= res!746397 (= (select (arr!35052 _keys!1208) i!673) k0!934))))

(declare-fun b!1118334 () Bool)

(declare-fun e!637208 () Bool)

(assert (=> b!1118334 (= e!637208 (not true))))

(declare-fun arrayContainsKey!0 (array!72811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118334 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36635 0))(
  ( (Unit!36636) )
))
(declare-fun lt!497736 () Unit!36635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72811 (_ BitVec 64) (_ BitVec 32)) Unit!36635)

(assert (=> b!1118334 (= lt!497736 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118335 () Bool)

(declare-fun e!637210 () Bool)

(declare-fun e!637211 () Bool)

(assert (=> b!1118335 (= e!637210 (and e!637211 mapRes!43723))))

(declare-fun condMapEmpty!43723 () Bool)

(declare-datatypes ((V!42377 0))(
  ( (V!42378 (val!14025 Int)) )
))
(declare-datatypes ((ValueCell!13259 0))(
  ( (ValueCellFull!13259 (v!16654 V!42377)) (EmptyCell!13259) )
))
(declare-datatypes ((array!72813 0))(
  ( (array!72814 (arr!35053 (Array (_ BitVec 32) ValueCell!13259)) (size!35590 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72813)

(declare-fun mapDefault!43723 () ValueCell!13259)

(assert (=> b!1118335 (= condMapEmpty!43723 (= (arr!35053 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13259)) mapDefault!43723)))))

(declare-fun b!1118336 () Bool)

(declare-fun res!746400 () Bool)

(assert (=> b!1118336 (=> (not res!746400) (not e!637212))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118336 (= res!746400 (and (= (size!35590 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35589 _keys!1208) (size!35590 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118337 () Bool)

(declare-fun res!746403 () Bool)

(assert (=> b!1118337 (=> (not res!746403) (not e!637212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72811 (_ BitVec 32)) Bool)

(assert (=> b!1118337 (= res!746403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118338 () Bool)

(declare-fun res!746402 () Bool)

(assert (=> b!1118338 (=> (not res!746402) (not e!637208))))

(declare-fun lt!497737 () array!72811)

(declare-datatypes ((List!24402 0))(
  ( (Nil!24399) (Cons!24398 (h!25616 (_ BitVec 64)) (t!34875 List!24402)) )
))
(declare-fun arrayNoDuplicates!0 (array!72811 (_ BitVec 32) List!24402) Bool)

(assert (=> b!1118338 (= res!746402 (arrayNoDuplicates!0 lt!497737 #b00000000000000000000000000000000 Nil!24399))))

(declare-fun b!1118339 () Bool)

(declare-fun res!746398 () Bool)

(assert (=> b!1118339 (=> (not res!746398) (not e!637212))))

(assert (=> b!1118339 (= res!746398 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24399))))

(declare-fun b!1118341 () Bool)

(declare-fun res!746396 () Bool)

(assert (=> b!1118341 (=> (not res!746396) (not e!637212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118341 (= res!746396 (validKeyInArray!0 k0!934))))

(declare-fun b!1118342 () Bool)

(declare-fun e!637207 () Bool)

(declare-fun tp_is_empty!27937 () Bool)

(assert (=> b!1118342 (= e!637207 tp_is_empty!27937)))

(declare-fun mapNonEmpty!43723 () Bool)

(declare-fun tp!82967 () Bool)

(assert (=> mapNonEmpty!43723 (= mapRes!43723 (and tp!82967 e!637207))))

(declare-fun mapValue!43723 () ValueCell!13259)

(declare-fun mapRest!43723 () (Array (_ BitVec 32) ValueCell!13259))

(declare-fun mapKey!43723 () (_ BitVec 32))

(assert (=> mapNonEmpty!43723 (= (arr!35053 _values!996) (store mapRest!43723 mapKey!43723 mapValue!43723))))

(declare-fun b!1118343 () Bool)

(declare-fun res!746399 () Bool)

(assert (=> b!1118343 (=> (not res!746399) (not e!637212))))

(assert (=> b!1118343 (= res!746399 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35589 _keys!1208))))))

(declare-fun b!1118344 () Bool)

(assert (=> b!1118344 (= e!637211 tp_is_empty!27937)))

(declare-fun res!746404 () Bool)

(assert (=> start!97942 (=> (not res!746404) (not e!637212))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97942 (= res!746404 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35589 _keys!1208))))))

(assert (=> start!97942 e!637212))

(declare-fun array_inv!27004 (array!72811) Bool)

(assert (=> start!97942 (array_inv!27004 _keys!1208)))

(assert (=> start!97942 true))

(declare-fun array_inv!27005 (array!72813) Bool)

(assert (=> start!97942 (and (array_inv!27005 _values!996) e!637210)))

(declare-fun b!1118340 () Bool)

(assert (=> b!1118340 (= e!637212 e!637208)))

(declare-fun res!746401 () Bool)

(assert (=> b!1118340 (=> (not res!746401) (not e!637208))))

(assert (=> b!1118340 (= res!746401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497737 mask!1564))))

(assert (=> b!1118340 (= lt!497737 (array!72812 (store (arr!35052 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35589 _keys!1208)))))

(assert (= (and start!97942 res!746404) b!1118332))

(assert (= (and b!1118332 res!746395) b!1118336))

(assert (= (and b!1118336 res!746400) b!1118337))

(assert (= (and b!1118337 res!746403) b!1118339))

(assert (= (and b!1118339 res!746398) b!1118343))

(assert (= (and b!1118343 res!746399) b!1118341))

(assert (= (and b!1118341 res!746396) b!1118333))

(assert (= (and b!1118333 res!746397) b!1118340))

(assert (= (and b!1118340 res!746401) b!1118338))

(assert (= (and b!1118338 res!746402) b!1118334))

(assert (= (and b!1118335 condMapEmpty!43723) mapIsEmpty!43723))

(assert (= (and b!1118335 (not condMapEmpty!43723)) mapNonEmpty!43723))

(get-info :version)

(assert (= (and mapNonEmpty!43723 ((_ is ValueCellFull!13259) mapValue!43723)) b!1118342))

(assert (= (and b!1118335 ((_ is ValueCellFull!13259) mapDefault!43723)) b!1118344))

(assert (= start!97942 b!1118335))

(declare-fun m!1034697 () Bool)

(assert (=> b!1118341 m!1034697))

(declare-fun m!1034699 () Bool)

(assert (=> b!1118337 m!1034699))

(declare-fun m!1034701 () Bool)

(assert (=> mapNonEmpty!43723 m!1034701))

(declare-fun m!1034703 () Bool)

(assert (=> start!97942 m!1034703))

(declare-fun m!1034705 () Bool)

(assert (=> start!97942 m!1034705))

(declare-fun m!1034707 () Bool)

(assert (=> b!1118332 m!1034707))

(declare-fun m!1034709 () Bool)

(assert (=> b!1118338 m!1034709))

(declare-fun m!1034711 () Bool)

(assert (=> b!1118334 m!1034711))

(declare-fun m!1034713 () Bool)

(assert (=> b!1118334 m!1034713))

(declare-fun m!1034715 () Bool)

(assert (=> b!1118333 m!1034715))

(declare-fun m!1034717 () Bool)

(assert (=> b!1118339 m!1034717))

(declare-fun m!1034719 () Bool)

(assert (=> b!1118340 m!1034719))

(declare-fun m!1034721 () Bool)

(assert (=> b!1118340 m!1034721))

(check-sat (not b!1118338) (not b!1118340) (not mapNonEmpty!43723) tp_is_empty!27937 (not b!1118334) (not b!1118337) (not b!1118339) (not b!1118341) (not start!97942) (not b!1118332))
(check-sat)
