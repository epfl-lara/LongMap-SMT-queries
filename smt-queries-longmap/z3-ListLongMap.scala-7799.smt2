; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97532 () Bool)

(assert start!97532)

(declare-fun b!1113601 () Bool)

(declare-fun res!743293 () Bool)

(declare-fun e!634759 () Bool)

(assert (=> b!1113601 (=> (not res!743293) (not e!634759))))

(declare-datatypes ((array!72344 0))(
  ( (array!72345 (arr!34825 (Array (_ BitVec 32) (_ BitVec 64))) (size!35363 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72344)

(declare-datatypes ((List!24347 0))(
  ( (Nil!24344) (Cons!24343 (h!25552 (_ BitVec 64)) (t!34819 List!24347)) )
))
(declare-fun arrayNoDuplicates!0 (array!72344 (_ BitVec 32) List!24347) Bool)

(assert (=> b!1113601 (= res!743293 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24344))))

(declare-fun b!1113602 () Bool)

(declare-fun res!743292 () Bool)

(assert (=> b!1113602 (=> (not res!743292) (not e!634759))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1113602 (= res!743292 (= (select (arr!34825 _keys!1208) i!673) k0!934))))

(declare-fun b!1113603 () Bool)

(declare-fun e!634761 () Bool)

(declare-fun tp_is_empty!27769 () Bool)

(assert (=> b!1113603 (= e!634761 tp_is_empty!27769)))

(declare-fun mapNonEmpty!43471 () Bool)

(declare-fun mapRes!43471 () Bool)

(declare-fun tp!82715 () Bool)

(declare-fun e!634763 () Bool)

(assert (=> mapNonEmpty!43471 (= mapRes!43471 (and tp!82715 e!634763))))

(declare-datatypes ((V!42153 0))(
  ( (V!42154 (val!13941 Int)) )
))
(declare-datatypes ((ValueCell!13175 0))(
  ( (ValueCellFull!13175 (v!16573 V!42153)) (EmptyCell!13175) )
))
(declare-fun mapValue!43471 () ValueCell!13175)

(declare-fun mapRest!43471 () (Array (_ BitVec 32) ValueCell!13175))

(declare-datatypes ((array!72346 0))(
  ( (array!72347 (arr!34826 (Array (_ BitVec 32) ValueCell!13175)) (size!35364 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72346)

(declare-fun mapKey!43471 () (_ BitVec 32))

(assert (=> mapNonEmpty!43471 (= (arr!34826 _values!996) (store mapRest!43471 mapKey!43471 mapValue!43471))))

(declare-fun b!1113604 () Bool)

(assert (=> b!1113604 (= e!634763 tp_is_empty!27769)))

(declare-fun b!1113605 () Bool)

(declare-fun res!743287 () Bool)

(assert (=> b!1113605 (=> (not res!743287) (not e!634759))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113605 (= res!743287 (and (= (size!35364 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35363 _keys!1208) (size!35364 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113606 () Bool)

(declare-fun e!634764 () Bool)

(assert (=> b!1113606 (= e!634764 (and e!634761 mapRes!43471))))

(declare-fun condMapEmpty!43471 () Bool)

(declare-fun mapDefault!43471 () ValueCell!13175)

(assert (=> b!1113606 (= condMapEmpty!43471 (= (arr!34826 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13175)) mapDefault!43471)))))

(declare-fun b!1113607 () Bool)

(declare-fun res!743286 () Bool)

(assert (=> b!1113607 (=> (not res!743286) (not e!634759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113607 (= res!743286 (validKeyInArray!0 k0!934))))

(declare-fun b!1113608 () Bool)

(declare-fun res!743284 () Bool)

(assert (=> b!1113608 (=> (not res!743284) (not e!634759))))

(assert (=> b!1113608 (= res!743284 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35363 _keys!1208))))))

(declare-fun b!1113609 () Bool)

(declare-fun e!634762 () Bool)

(assert (=> b!1113609 (= e!634759 e!634762)))

(declare-fun res!743288 () Bool)

(assert (=> b!1113609 (=> (not res!743288) (not e!634762))))

(declare-fun lt!496518 () array!72344)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72344 (_ BitVec 32)) Bool)

(assert (=> b!1113609 (= res!743288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496518 mask!1564))))

(assert (=> b!1113609 (= lt!496518 (array!72345 (store (arr!34825 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35363 _keys!1208)))))

(declare-fun res!743285 () Bool)

(assert (=> start!97532 (=> (not res!743285) (not e!634759))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97532 (= res!743285 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35363 _keys!1208))))))

(assert (=> start!97532 e!634759))

(declare-fun array_inv!26848 (array!72344) Bool)

(assert (=> start!97532 (array_inv!26848 _keys!1208)))

(assert (=> start!97532 true))

(declare-fun array_inv!26849 (array!72346) Bool)

(assert (=> start!97532 (and (array_inv!26849 _values!996) e!634764)))

(declare-fun b!1113600 () Bool)

(declare-fun res!743290 () Bool)

(assert (=> b!1113600 (=> (not res!743290) (not e!634762))))

(assert (=> b!1113600 (= res!743290 (arrayNoDuplicates!0 lt!496518 #b00000000000000000000000000000000 Nil!24344))))

(declare-fun mapIsEmpty!43471 () Bool)

(assert (=> mapIsEmpty!43471 mapRes!43471))

(declare-fun b!1113610 () Bool)

(declare-fun res!743289 () Bool)

(assert (=> b!1113610 (=> (not res!743289) (not e!634759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113610 (= res!743289 (validMask!0 mask!1564))))

(declare-fun b!1113611 () Bool)

(declare-fun res!743291 () Bool)

(assert (=> b!1113611 (=> (not res!743291) (not e!634759))))

(assert (=> b!1113611 (= res!743291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113612 () Bool)

(assert (=> b!1113612 (= e!634762 (not true))))

(declare-fun arrayContainsKey!0 (array!72344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113612 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36369 0))(
  ( (Unit!36370) )
))
(declare-fun lt!496517 () Unit!36369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72344 (_ BitVec 64) (_ BitVec 32)) Unit!36369)

(assert (=> b!1113612 (= lt!496517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97532 res!743285) b!1113610))

(assert (= (and b!1113610 res!743289) b!1113605))

(assert (= (and b!1113605 res!743287) b!1113611))

(assert (= (and b!1113611 res!743291) b!1113601))

(assert (= (and b!1113601 res!743293) b!1113608))

(assert (= (and b!1113608 res!743284) b!1113607))

(assert (= (and b!1113607 res!743286) b!1113602))

(assert (= (and b!1113602 res!743292) b!1113609))

(assert (= (and b!1113609 res!743288) b!1113600))

(assert (= (and b!1113600 res!743290) b!1113612))

(assert (= (and b!1113606 condMapEmpty!43471) mapIsEmpty!43471))

(assert (= (and b!1113606 (not condMapEmpty!43471)) mapNonEmpty!43471))

(get-info :version)

(assert (= (and mapNonEmpty!43471 ((_ is ValueCellFull!13175) mapValue!43471)) b!1113604))

(assert (= (and b!1113606 ((_ is ValueCellFull!13175) mapDefault!43471)) b!1113603))

(assert (= start!97532 b!1113606))

(declare-fun m!1030215 () Bool)

(assert (=> b!1113609 m!1030215))

(declare-fun m!1030217 () Bool)

(assert (=> b!1113609 m!1030217))

(declare-fun m!1030219 () Bool)

(assert (=> start!97532 m!1030219))

(declare-fun m!1030221 () Bool)

(assert (=> start!97532 m!1030221))

(declare-fun m!1030223 () Bool)

(assert (=> b!1113611 m!1030223))

(declare-fun m!1030225 () Bool)

(assert (=> b!1113601 m!1030225))

(declare-fun m!1030227 () Bool)

(assert (=> b!1113610 m!1030227))

(declare-fun m!1030229 () Bool)

(assert (=> b!1113600 m!1030229))

(declare-fun m!1030231 () Bool)

(assert (=> b!1113612 m!1030231))

(declare-fun m!1030233 () Bool)

(assert (=> b!1113612 m!1030233))

(declare-fun m!1030235 () Bool)

(assert (=> b!1113602 m!1030235))

(declare-fun m!1030237 () Bool)

(assert (=> mapNonEmpty!43471 m!1030237))

(declare-fun m!1030239 () Bool)

(assert (=> b!1113607 m!1030239))

(check-sat (not start!97532) (not mapNonEmpty!43471) (not b!1113609) (not b!1113612) (not b!1113610) (not b!1113601) (not b!1113607) tp_is_empty!27769 (not b!1113611) (not b!1113600))
(check-sat)
