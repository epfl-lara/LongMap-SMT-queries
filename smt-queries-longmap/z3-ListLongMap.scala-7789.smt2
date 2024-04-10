; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97480 () Bool)

(assert start!97480)

(declare-fun b!1112598 () Bool)

(declare-fun res!742486 () Bool)

(declare-fun e!634322 () Bool)

(assert (=> b!1112598 (=> (not res!742486) (not e!634322))))

(declare-datatypes ((array!72335 0))(
  ( (array!72336 (arr!34820 (Array (_ BitVec 32) (_ BitVec 64))) (size!35356 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72335)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72335 (_ BitVec 32)) Bool)

(assert (=> b!1112598 (= res!742486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112599 () Bool)

(declare-fun res!742488 () Bool)

(assert (=> b!1112599 (=> (not res!742488) (not e!634322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112599 (= res!742488 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43384 () Bool)

(declare-fun mapRes!43384 () Bool)

(assert (=> mapIsEmpty!43384 mapRes!43384))

(declare-fun b!1112600 () Bool)

(declare-fun res!742491 () Bool)

(assert (=> b!1112600 (=> (not res!742491) (not e!634322))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112600 (= res!742491 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35356 _keys!1208))))))

(declare-fun b!1112601 () Bool)

(declare-fun e!634321 () Bool)

(assert (=> b!1112601 (= e!634322 e!634321)))

(declare-fun res!742484 () Bool)

(assert (=> b!1112601 (=> (not res!742484) (not e!634321))))

(declare-fun lt!496544 () array!72335)

(assert (=> b!1112601 (= res!742484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496544 mask!1564))))

(assert (=> b!1112601 (= lt!496544 (array!72336 (store (arr!34820 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35356 _keys!1208)))))

(declare-fun b!1112603 () Bool)

(declare-fun res!742492 () Bool)

(assert (=> b!1112603 (=> (not res!742492) (not e!634322))))

(declare-datatypes ((List!24294 0))(
  ( (Nil!24291) (Cons!24290 (h!25499 (_ BitVec 64)) (t!34775 List!24294)) )
))
(declare-fun arrayNoDuplicates!0 (array!72335 (_ BitVec 32) List!24294) Bool)

(assert (=> b!1112603 (= res!742492 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24291))))

(declare-fun b!1112604 () Bool)

(declare-fun e!634323 () Bool)

(declare-fun tp_is_empty!27711 () Bool)

(assert (=> b!1112604 (= e!634323 tp_is_empty!27711)))

(declare-fun mapNonEmpty!43384 () Bool)

(declare-fun tp!82628 () Bool)

(declare-fun e!634319 () Bool)

(assert (=> mapNonEmpty!43384 (= mapRes!43384 (and tp!82628 e!634319))))

(declare-datatypes ((V!42075 0))(
  ( (V!42076 (val!13912 Int)) )
))
(declare-datatypes ((ValueCell!13146 0))(
  ( (ValueCellFull!13146 (v!16545 V!42075)) (EmptyCell!13146) )
))
(declare-fun mapRest!43384 () (Array (_ BitVec 32) ValueCell!13146))

(declare-fun mapValue!43384 () ValueCell!13146)

(declare-fun mapKey!43384 () (_ BitVec 32))

(declare-datatypes ((array!72337 0))(
  ( (array!72338 (arr!34821 (Array (_ BitVec 32) ValueCell!13146)) (size!35357 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72337)

(assert (=> mapNonEmpty!43384 (= (arr!34821 _values!996) (store mapRest!43384 mapKey!43384 mapValue!43384))))

(declare-fun b!1112605 () Bool)

(declare-fun res!742489 () Bool)

(assert (=> b!1112605 (=> (not res!742489) (not e!634322))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112605 (= res!742489 (and (= (size!35357 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35356 _keys!1208) (size!35357 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112606 () Bool)

(declare-fun e!634318 () Bool)

(assert (=> b!1112606 (= e!634318 (and e!634323 mapRes!43384))))

(declare-fun condMapEmpty!43384 () Bool)

(declare-fun mapDefault!43384 () ValueCell!13146)

(assert (=> b!1112606 (= condMapEmpty!43384 (= (arr!34821 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13146)) mapDefault!43384)))))

(declare-fun b!1112607 () Bool)

(declare-fun res!742487 () Bool)

(assert (=> b!1112607 (=> (not res!742487) (not e!634322))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112607 (= res!742487 (validKeyInArray!0 k0!934))))

(declare-fun b!1112608 () Bool)

(declare-fun res!742483 () Bool)

(assert (=> b!1112608 (=> (not res!742483) (not e!634321))))

(assert (=> b!1112608 (= res!742483 (arrayNoDuplicates!0 lt!496544 #b00000000000000000000000000000000 Nil!24291))))

(declare-fun b!1112609 () Bool)

(assert (=> b!1112609 (= e!634319 tp_is_empty!27711)))

(declare-fun b!1112610 () Bool)

(declare-fun res!742485 () Bool)

(assert (=> b!1112610 (=> (not res!742485) (not e!634322))))

(assert (=> b!1112610 (= res!742485 (= (select (arr!34820 _keys!1208) i!673) k0!934))))

(declare-fun b!1112602 () Bool)

(assert (=> b!1112602 (= e!634321 (not true))))

(declare-fun arrayContainsKey!0 (array!72335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112602 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36510 0))(
  ( (Unit!36511) )
))
(declare-fun lt!496543 () Unit!36510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72335 (_ BitVec 64) (_ BitVec 32)) Unit!36510)

(assert (=> b!1112602 (= lt!496543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!742490 () Bool)

(assert (=> start!97480 (=> (not res!742490) (not e!634322))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97480 (= res!742490 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35356 _keys!1208))))))

(assert (=> start!97480 e!634322))

(declare-fun array_inv!26778 (array!72335) Bool)

(assert (=> start!97480 (array_inv!26778 _keys!1208)))

(assert (=> start!97480 true))

(declare-fun array_inv!26779 (array!72337) Bool)

(assert (=> start!97480 (and (array_inv!26779 _values!996) e!634318)))

(assert (= (and start!97480 res!742490) b!1112599))

(assert (= (and b!1112599 res!742488) b!1112605))

(assert (= (and b!1112605 res!742489) b!1112598))

(assert (= (and b!1112598 res!742486) b!1112603))

(assert (= (and b!1112603 res!742492) b!1112600))

(assert (= (and b!1112600 res!742491) b!1112607))

(assert (= (and b!1112607 res!742487) b!1112610))

(assert (= (and b!1112610 res!742485) b!1112601))

(assert (= (and b!1112601 res!742484) b!1112608))

(assert (= (and b!1112608 res!742483) b!1112602))

(assert (= (and b!1112606 condMapEmpty!43384) mapIsEmpty!43384))

(assert (= (and b!1112606 (not condMapEmpty!43384)) mapNonEmpty!43384))

(get-info :version)

(assert (= (and mapNonEmpty!43384 ((_ is ValueCellFull!13146) mapValue!43384)) b!1112609))

(assert (= (and b!1112606 ((_ is ValueCellFull!13146) mapDefault!43384)) b!1112604))

(assert (= start!97480 b!1112606))

(declare-fun m!1030087 () Bool)

(assert (=> b!1112599 m!1030087))

(declare-fun m!1030089 () Bool)

(assert (=> b!1112602 m!1030089))

(declare-fun m!1030091 () Bool)

(assert (=> b!1112602 m!1030091))

(declare-fun m!1030093 () Bool)

(assert (=> start!97480 m!1030093))

(declare-fun m!1030095 () Bool)

(assert (=> start!97480 m!1030095))

(declare-fun m!1030097 () Bool)

(assert (=> b!1112601 m!1030097))

(declare-fun m!1030099 () Bool)

(assert (=> b!1112601 m!1030099))

(declare-fun m!1030101 () Bool)

(assert (=> b!1112598 m!1030101))

(declare-fun m!1030103 () Bool)

(assert (=> b!1112608 m!1030103))

(declare-fun m!1030105 () Bool)

(assert (=> b!1112610 m!1030105))

(declare-fun m!1030107 () Bool)

(assert (=> b!1112603 m!1030107))

(declare-fun m!1030109 () Bool)

(assert (=> b!1112607 m!1030109))

(declare-fun m!1030111 () Bool)

(assert (=> mapNonEmpty!43384 m!1030111))

(check-sat (not b!1112602) (not b!1112599) tp_is_empty!27711 (not b!1112608) (not b!1112601) (not b!1112607) (not b!1112603) (not start!97480) (not b!1112598) (not mapNonEmpty!43384))
(check-sat)
