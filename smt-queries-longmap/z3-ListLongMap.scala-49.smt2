; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!808 () Bool)

(assert start!808)

(declare-fun b_free!201 () Bool)

(declare-fun b_next!201 () Bool)

(assert (=> start!808 (= b_free!201 (not b_next!201))))

(declare-fun tp!832 () Bool)

(declare-fun b_and!347 () Bool)

(assert (=> start!808 (= tp!832 b_and!347)))

(declare-fun b!6084 () Bool)

(declare-fun res!6603 () Bool)

(declare-fun e!3326 () Bool)

(assert (=> b!6084 (=> (not res!6603) (not e!3326))))

(declare-datatypes ((array!491 0))(
  ( (array!492 (arr!234 (Array (_ BitVec 32) (_ BitVec 64))) (size!296 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!491)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!491 (_ BitVec 32)) Bool)

(assert (=> b!6084 (= res!6603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6085 () Bool)

(declare-fun res!6601 () Bool)

(assert (=> b!6085 (=> (not res!6601) (not e!3326))))

(declare-datatypes ((List!156 0))(
  ( (Nil!153) (Cons!152 (h!718 (_ BitVec 64)) (t!2291 List!156)) )
))
(declare-fun arrayNoDuplicates!0 (array!491 (_ BitVec 32) List!156) Bool)

(assert (=> b!6085 (= res!6601 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!153))))

(declare-fun mapNonEmpty!389 () Bool)

(declare-fun mapRes!389 () Bool)

(declare-fun tp!833 () Bool)

(declare-fun e!3325 () Bool)

(assert (=> mapNonEmpty!389 (= mapRes!389 (and tp!833 e!3325))))

(declare-datatypes ((V!549 0))(
  ( (V!550 (val!145 Int)) )
))
(declare-datatypes ((ValueCell!123 0))(
  ( (ValueCellFull!123 (v!1236 V!549)) (EmptyCell!123) )
))
(declare-fun mapRest!389 () (Array (_ BitVec 32) ValueCell!123))

(declare-datatypes ((array!493 0))(
  ( (array!494 (arr!235 (Array (_ BitVec 32) ValueCell!123)) (size!297 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!493)

(declare-fun mapValue!389 () ValueCell!123)

(declare-fun mapKey!389 () (_ BitVec 32))

(assert (=> mapNonEmpty!389 (= (arr!235 _values!1492) (store mapRest!389 mapKey!389 mapValue!389))))

(declare-fun b!6086 () Bool)

(declare-fun res!6605 () Bool)

(assert (=> b!6086 (=> (not res!6605) (not e!3326))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!549)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!549)

(declare-datatypes ((tuple2!146 0))(
  ( (tuple2!147 (_1!73 (_ BitVec 64)) (_2!73 V!549)) )
))
(declare-datatypes ((List!157 0))(
  ( (Nil!154) (Cons!153 (h!719 tuple2!146) (t!2292 List!157)) )
))
(declare-datatypes ((ListLongMap!151 0))(
  ( (ListLongMap!152 (toList!91 List!157)) )
))
(declare-fun contains!65 (ListLongMap!151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!50 (array!491 array!493 (_ BitVec 32) (_ BitVec 32) V!549 V!549 (_ BitVec 32) Int) ListLongMap!151)

(assert (=> b!6086 (= res!6605 (contains!65 (getCurrentListMap!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!6606 () Bool)

(assert (=> start!808 (=> (not res!6606) (not e!3326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!808 (= res!6606 (validMask!0 mask!2250))))

(assert (=> start!808 e!3326))

(assert (=> start!808 tp!832))

(assert (=> start!808 true))

(declare-fun e!3322 () Bool)

(declare-fun array_inv!169 (array!493) Bool)

(assert (=> start!808 (and (array_inv!169 _values!1492) e!3322)))

(declare-fun tp_is_empty!279 () Bool)

(assert (=> start!808 tp_is_empty!279))

(declare-fun array_inv!170 (array!491) Bool)

(assert (=> start!808 (array_inv!170 _keys!1806)))

(declare-fun b!6087 () Bool)

(declare-fun res!6602 () Bool)

(assert (=> b!6087 (=> (not res!6602) (not e!3326))))

(assert (=> b!6087 (= res!6602 (and (= (size!297 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!296 _keys!1806) (size!297 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6088 () Bool)

(assert (=> b!6088 (= e!3325 tp_is_empty!279)))

(declare-fun b!6089 () Bool)

(declare-fun e!3321 () Bool)

(assert (=> b!6089 (= e!3322 (and e!3321 mapRes!389))))

(declare-fun condMapEmpty!389 () Bool)

(declare-fun mapDefault!389 () ValueCell!123)

(assert (=> b!6089 (= condMapEmpty!389 (= (arr!235 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!123)) mapDefault!389)))))

(declare-fun mapIsEmpty!389 () Bool)

(assert (=> mapIsEmpty!389 mapRes!389))

(declare-fun b!6090 () Bool)

(declare-fun e!3323 () Bool)

(assert (=> b!6090 (= e!3326 (not e!3323))))

(declare-fun res!6604 () Bool)

(assert (=> b!6090 (=> res!6604 e!3323)))

(declare-fun arrayContainsKey!0 (array!491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6090 (= res!6604 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3324 () Bool)

(assert (=> b!6090 e!3324))

(declare-fun c!434 () Bool)

(assert (=> b!6090 (= c!434 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!93 0))(
  ( (Unit!94) )
))
(declare-fun lt!1104 () Unit!93)

(declare-fun lemmaKeyInListMapIsInArray!32 (array!491 array!493 (_ BitVec 32) (_ BitVec 32) V!549 V!549 (_ BitVec 64) Int) Unit!93)

(assert (=> b!6090 (= lt!1104 (lemmaKeyInListMapIsInArray!32 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6091 () Bool)

(declare-fun res!6607 () Bool)

(assert (=> b!6091 (=> (not res!6607) (not e!3326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6091 (= res!6607 (validKeyInArray!0 k0!1278))))

(declare-fun b!6092 () Bool)

(assert (=> b!6092 (= e!3321 tp_is_empty!279)))

(declare-fun b!6093 () Bool)

(assert (=> b!6093 (= e!3324 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6094 () Bool)

(assert (=> b!6094 (= e!3323 true)))

(declare-fun lt!1103 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!491 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6094 (= lt!1103 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6095 () Bool)

(assert (=> b!6095 (= e!3324 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!808 res!6606) b!6087))

(assert (= (and b!6087 res!6602) b!6084))

(assert (= (and b!6084 res!6603) b!6085))

(assert (= (and b!6085 res!6601) b!6086))

(assert (= (and b!6086 res!6605) b!6091))

(assert (= (and b!6091 res!6607) b!6090))

(assert (= (and b!6090 c!434) b!6095))

(assert (= (and b!6090 (not c!434)) b!6093))

(assert (= (and b!6090 (not res!6604)) b!6094))

(assert (= (and b!6089 condMapEmpty!389) mapIsEmpty!389))

(assert (= (and b!6089 (not condMapEmpty!389)) mapNonEmpty!389))

(get-info :version)

(assert (= (and mapNonEmpty!389 ((_ is ValueCellFull!123) mapValue!389)) b!6088))

(assert (= (and b!6089 ((_ is ValueCellFull!123) mapDefault!389)) b!6092))

(assert (= start!808 b!6089))

(declare-fun m!3449 () Bool)

(assert (=> b!6085 m!3449))

(declare-fun m!3451 () Bool)

(assert (=> b!6084 m!3451))

(declare-fun m!3453 () Bool)

(assert (=> b!6095 m!3453))

(declare-fun m!3455 () Bool)

(assert (=> start!808 m!3455))

(declare-fun m!3457 () Bool)

(assert (=> start!808 m!3457))

(declare-fun m!3459 () Bool)

(assert (=> start!808 m!3459))

(declare-fun m!3461 () Bool)

(assert (=> b!6094 m!3461))

(declare-fun m!3463 () Bool)

(assert (=> b!6086 m!3463))

(assert (=> b!6086 m!3463))

(declare-fun m!3465 () Bool)

(assert (=> b!6086 m!3465))

(assert (=> b!6090 m!3453))

(declare-fun m!3467 () Bool)

(assert (=> b!6090 m!3467))

(declare-fun m!3469 () Bool)

(assert (=> mapNonEmpty!389 m!3469))

(declare-fun m!3471 () Bool)

(assert (=> b!6091 m!3471))

(check-sat (not b!6090) (not b!6084) (not mapNonEmpty!389) (not b!6091) (not b_next!201) (not b!6094) (not b!6095) tp_is_empty!279 b_and!347 (not b!6085) (not start!808) (not b!6086))
(check-sat b_and!347 (not b_next!201))
