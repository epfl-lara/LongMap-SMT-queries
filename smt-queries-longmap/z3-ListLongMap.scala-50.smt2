; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!812 () Bool)

(assert start!812)

(declare-fun b_free!205 () Bool)

(declare-fun b_next!205 () Bool)

(assert (=> start!812 (= b_free!205 (not b_next!205))))

(declare-fun tp!845 () Bool)

(declare-fun b_and!351 () Bool)

(assert (=> start!812 (= tp!845 b_and!351)))

(declare-fun res!6649 () Bool)

(declare-fun e!3364 () Bool)

(assert (=> start!812 (=> (not res!6649) (not e!3364))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!812 (= res!6649 (validMask!0 mask!2250))))

(assert (=> start!812 e!3364))

(assert (=> start!812 tp!845))

(assert (=> start!812 true))

(declare-datatypes ((V!555 0))(
  ( (V!556 (val!147 Int)) )
))
(declare-datatypes ((ValueCell!125 0))(
  ( (ValueCellFull!125 (v!1238 V!555)) (EmptyCell!125) )
))
(declare-datatypes ((array!491 0))(
  ( (array!492 (arr!234 (Array (_ BitVec 32) ValueCell!125)) (size!296 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!491)

(declare-fun e!3368 () Bool)

(declare-fun array_inv!165 (array!491) Bool)

(assert (=> start!812 (and (array_inv!165 _values!1492) e!3368)))

(declare-fun tp_is_empty!283 () Bool)

(assert (=> start!812 tp_is_empty!283))

(declare-datatypes ((array!493 0))(
  ( (array!494 (arr!235 (Array (_ BitVec 32) (_ BitVec 64))) (size!297 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!493)

(declare-fun array_inv!166 (array!493) Bool)

(assert (=> start!812 (array_inv!166 _keys!1806)))

(declare-fun b!6158 () Bool)

(declare-fun e!3369 () Bool)

(assert (=> b!6158 (= e!3364 (not e!3369))))

(declare-fun res!6652 () Bool)

(assert (=> b!6158 (=> res!6652 e!3369)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6158 (= res!6652 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3370 () Bool)

(assert (=> b!6158 e!3370))

(declare-fun c!440 () Bool)

(assert (=> b!6158 (= c!440 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!555)

(declare-datatypes ((Unit!95 0))(
  ( (Unit!96) )
))
(declare-fun lt!1120 () Unit!95)

(declare-fun zeroValue!1434 () V!555)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lemmaKeyInListMapIsInArray!33 (array!493 array!491 (_ BitVec 32) (_ BitVec 32) V!555 V!555 (_ BitVec 64) Int) Unit!95)

(assert (=> b!6158 (= lt!1120 (lemmaKeyInListMapIsInArray!33 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6159 () Bool)

(declare-fun e!3371 () Bool)

(assert (=> b!6159 (= e!3371 tp_is_empty!283)))

(declare-fun b!6160 () Bool)

(declare-fun res!6650 () Bool)

(assert (=> b!6160 (=> (not res!6650) (not e!3364))))

(declare-datatypes ((tuple2!146 0))(
  ( (tuple2!147 (_1!73 (_ BitVec 64)) (_2!73 V!555)) )
))
(declare-datatypes ((List!155 0))(
  ( (Nil!152) (Cons!151 (h!717 tuple2!146) (t!2290 List!155)) )
))
(declare-datatypes ((ListLongMap!151 0))(
  ( (ListLongMap!152 (toList!91 List!155)) )
))
(declare-fun contains!65 (ListLongMap!151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!50 (array!493 array!491 (_ BitVec 32) (_ BitVec 32) V!555 V!555 (_ BitVec 32) Int) ListLongMap!151)

(assert (=> b!6160 (= res!6650 (contains!65 (getCurrentListMap!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6161 () Bool)

(declare-fun e!3367 () Bool)

(assert (=> b!6161 (= e!3367 true)))

(declare-datatypes ((SeekEntryResult!14 0))(
  ( (MissingZero!14 (index!2175 (_ BitVec 32))) (Found!14 (index!2176 (_ BitVec 32))) (Intermediate!14 (undefined!826 Bool) (index!2177 (_ BitVec 32)) (x!2504 (_ BitVec 32))) (Undefined!14) (MissingVacant!14 (index!2178 (_ BitVec 32))) )
))
(declare-fun lt!1122 () SeekEntryResult!14)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!493 (_ BitVec 32)) SeekEntryResult!14)

(assert (=> b!6161 (= lt!1122 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6162 () Bool)

(declare-fun res!6646 () Bool)

(assert (=> b!6162 (=> (not res!6646) (not e!3364))))

(declare-datatypes ((List!156 0))(
  ( (Nil!153) (Cons!152 (h!718 (_ BitVec 64)) (t!2291 List!156)) )
))
(declare-fun arrayNoDuplicates!0 (array!493 (_ BitVec 32) List!156) Bool)

(assert (=> b!6162 (= res!6646 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!153))))

(declare-fun b!6163 () Bool)

(declare-fun res!6651 () Bool)

(assert (=> b!6163 (=> (not res!6651) (not e!3364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6163 (= res!6651 (validKeyInArray!0 k0!1278))))

(declare-fun b!6164 () Bool)

(assert (=> b!6164 (= e!3370 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6165 () Bool)

(assert (=> b!6165 (= e!3370 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6166 () Bool)

(declare-fun res!6645 () Bool)

(assert (=> b!6166 (=> (not res!6645) (not e!3364))))

(assert (=> b!6166 (= res!6645 (and (= (size!296 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!297 _keys!1806) (size!296 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6167 () Bool)

(declare-fun e!3365 () Bool)

(assert (=> b!6167 (= e!3365 tp_is_empty!283)))

(declare-fun b!6168 () Bool)

(declare-fun mapRes!395 () Bool)

(assert (=> b!6168 (= e!3368 (and e!3371 mapRes!395))))

(declare-fun condMapEmpty!395 () Bool)

(declare-fun mapDefault!395 () ValueCell!125)

(assert (=> b!6168 (= condMapEmpty!395 (= (arr!234 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!125)) mapDefault!395)))))

(declare-fun mapIsEmpty!395 () Bool)

(assert (=> mapIsEmpty!395 mapRes!395))

(declare-fun mapNonEmpty!395 () Bool)

(declare-fun tp!844 () Bool)

(assert (=> mapNonEmpty!395 (= mapRes!395 (and tp!844 e!3365))))

(declare-fun mapValue!395 () ValueCell!125)

(declare-fun mapRest!395 () (Array (_ BitVec 32) ValueCell!125))

(declare-fun mapKey!395 () (_ BitVec 32))

(assert (=> mapNonEmpty!395 (= (arr!234 _values!1492) (store mapRest!395 mapKey!395 mapValue!395))))

(declare-fun b!6169 () Bool)

(declare-fun res!6648 () Bool)

(assert (=> b!6169 (=> (not res!6648) (not e!3364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!493 (_ BitVec 32)) Bool)

(assert (=> b!6169 (= res!6648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6170 () Bool)

(assert (=> b!6170 (= e!3369 e!3367)))

(declare-fun res!6647 () Bool)

(assert (=> b!6170 (=> res!6647 e!3367)))

(assert (=> b!6170 (= res!6647 (not (= (size!297 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1121 () (_ BitVec 32))

(assert (=> b!6170 (arrayForallSeekEntryOrOpenFound!0 lt!1121 _keys!1806 mask!2250)))

(declare-fun lt!1119 () Unit!95)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!95)

(assert (=> b!6170 (= lt!1119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1121))))

(declare-fun arrayScanForKey!0 (array!493 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6170 (= lt!1121 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!812 res!6649) b!6166))

(assert (= (and b!6166 res!6645) b!6169))

(assert (= (and b!6169 res!6648) b!6162))

(assert (= (and b!6162 res!6646) b!6160))

(assert (= (and b!6160 res!6650) b!6163))

(assert (= (and b!6163 res!6651) b!6158))

(assert (= (and b!6158 c!440) b!6165))

(assert (= (and b!6158 (not c!440)) b!6164))

(assert (= (and b!6158 (not res!6652)) b!6170))

(assert (= (and b!6170 (not res!6647)) b!6161))

(assert (= (and b!6168 condMapEmpty!395) mapIsEmpty!395))

(assert (= (and b!6168 (not condMapEmpty!395)) mapNonEmpty!395))

(get-info :version)

(assert (= (and mapNonEmpty!395 ((_ is ValueCellFull!125) mapValue!395)) b!6167))

(assert (= (and b!6168 ((_ is ValueCellFull!125) mapDefault!395)) b!6159))

(assert (= start!812 b!6168))

(declare-fun m!3497 () Bool)

(assert (=> b!6161 m!3497))

(declare-fun m!3499 () Bool)

(assert (=> b!6162 m!3499))

(declare-fun m!3501 () Bool)

(assert (=> start!812 m!3501))

(declare-fun m!3503 () Bool)

(assert (=> start!812 m!3503))

(declare-fun m!3505 () Bool)

(assert (=> start!812 m!3505))

(declare-fun m!3507 () Bool)

(assert (=> b!6160 m!3507))

(assert (=> b!6160 m!3507))

(declare-fun m!3509 () Bool)

(assert (=> b!6160 m!3509))

(declare-fun m!3511 () Bool)

(assert (=> b!6170 m!3511))

(declare-fun m!3513 () Bool)

(assert (=> b!6170 m!3513))

(declare-fun m!3515 () Bool)

(assert (=> b!6170 m!3515))

(declare-fun m!3517 () Bool)

(assert (=> b!6158 m!3517))

(declare-fun m!3519 () Bool)

(assert (=> b!6158 m!3519))

(declare-fun m!3521 () Bool)

(assert (=> b!6169 m!3521))

(declare-fun m!3523 () Bool)

(assert (=> mapNonEmpty!395 m!3523))

(assert (=> b!6165 m!3517))

(declare-fun m!3525 () Bool)

(assert (=> b!6163 m!3525))

(check-sat (not b!6169) (not b!6163) (not b!6162) (not b!6160) (not b_next!205) tp_is_empty!283 (not b!6161) (not b!6170) (not b!6165) (not b!6158) (not start!812) b_and!351 (not mapNonEmpty!395))
(check-sat b_and!351 (not b_next!205))
