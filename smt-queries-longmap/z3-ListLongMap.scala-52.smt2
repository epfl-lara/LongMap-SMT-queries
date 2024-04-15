; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!824 () Bool)

(assert start!824)

(declare-fun b_free!217 () Bool)

(declare-fun b_next!217 () Bool)

(assert (=> start!824 (= b_free!217 (not b_next!217))))

(declare-fun tp!880 () Bool)

(declare-fun b_and!363 () Bool)

(assert (=> start!824 (= tp!880 b_and!363)))

(declare-fun res!6793 () Bool)

(declare-fun e!3508 () Bool)

(assert (=> start!824 (=> (not res!6793) (not e!3508))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!824 (= res!6793 (validMask!0 mask!2250))))

(assert (=> start!824 e!3508))

(assert (=> start!824 tp!880))

(assert (=> start!824 true))

(declare-datatypes ((V!571 0))(
  ( (V!572 (val!153 Int)) )
))
(declare-datatypes ((ValueCell!131 0))(
  ( (ValueCellFull!131 (v!1244 V!571)) (EmptyCell!131) )
))
(declare-datatypes ((array!515 0))(
  ( (array!516 (arr!246 (Array (_ BitVec 32) ValueCell!131)) (size!308 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!515)

(declare-fun e!3510 () Bool)

(declare-fun array_inv!177 (array!515) Bool)

(assert (=> start!824 (and (array_inv!177 _values!1492) e!3510)))

(declare-fun tp_is_empty!295 () Bool)

(assert (=> start!824 tp_is_empty!295))

(declare-datatypes ((array!517 0))(
  ( (array!518 (arr!247 (Array (_ BitVec 32) (_ BitVec 64))) (size!309 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!517)

(declare-fun array_inv!178 (array!517) Bool)

(assert (=> start!824 (array_inv!178 _keys!1806)))

(declare-fun mapNonEmpty!413 () Bool)

(declare-fun mapRes!413 () Bool)

(declare-fun tp!881 () Bool)

(declare-fun e!3511 () Bool)

(assert (=> mapNonEmpty!413 (= mapRes!413 (and tp!881 e!3511))))

(declare-fun mapKey!413 () (_ BitVec 32))

(declare-fun mapRest!413 () (Array (_ BitVec 32) ValueCell!131))

(declare-fun mapValue!413 () ValueCell!131)

(assert (=> mapNonEmpty!413 (= (arr!246 _values!1492) (store mapRest!413 mapKey!413 mapValue!413))))

(declare-fun b!6392 () Bool)

(declare-fun e!3514 () Bool)

(assert (=> b!6392 (= e!3514 true)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!17 0))(
  ( (MissingZero!17 (index!2187 (_ BitVec 32))) (Found!17 (index!2188 (_ BitVec 32))) (Intermediate!17 (undefined!829 Bool) (index!2189 (_ BitVec 32)) (x!2523 (_ BitVec 32))) (Undefined!17) (MissingVacant!17 (index!2190 (_ BitVec 32))) )
))
(declare-fun lt!1194 () SeekEntryResult!17)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!517 (_ BitVec 32)) SeekEntryResult!17)

(assert (=> b!6392 (= lt!1194 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6393 () Bool)

(declare-fun res!6791 () Bool)

(assert (=> b!6393 (=> (not res!6791) (not e!3508))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6393 (= res!6791 (and (= (size!308 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!309 _keys!1806) (size!308 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6394 () Bool)

(declare-fun e!3515 () Bool)

(declare-fun arrayContainsKey!0 (array!517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6394 (= e!3515 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!413 () Bool)

(assert (=> mapIsEmpty!413 mapRes!413))

(declare-fun b!6395 () Bool)

(declare-fun e!3509 () Bool)

(assert (=> b!6395 (= e!3508 (not e!3509))))

(declare-fun res!6790 () Bool)

(assert (=> b!6395 (=> res!6790 e!3509)))

(assert (=> b!6395 (= res!6790 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6395 e!3515))

(declare-fun c!458 () Bool)

(assert (=> b!6395 (= c!458 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!571)

(declare-fun zeroValue!1434 () V!571)

(declare-datatypes ((Unit!107 0))(
  ( (Unit!108) )
))
(declare-fun lt!1193 () Unit!107)

(declare-fun lemmaKeyInListMapIsInArray!38 (array!517 array!515 (_ BitVec 32) (_ BitVec 32) V!571 V!571 (_ BitVec 64) Int) Unit!107)

(assert (=> b!6395 (= lt!1193 (lemmaKeyInListMapIsInArray!38 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6396 () Bool)

(declare-fun res!6795 () Bool)

(assert (=> b!6396 (=> (not res!6795) (not e!3508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6396 (= res!6795 (validKeyInArray!0 k0!1278))))

(declare-fun b!6397 () Bool)

(declare-fun res!6792 () Bool)

(assert (=> b!6397 (=> (not res!6792) (not e!3508))))

(declare-datatypes ((tuple2!156 0))(
  ( (tuple2!157 (_1!78 (_ BitVec 64)) (_2!78 V!571)) )
))
(declare-datatypes ((List!165 0))(
  ( (Nil!162) (Cons!161 (h!727 tuple2!156) (t!2300 List!165)) )
))
(declare-datatypes ((ListLongMap!161 0))(
  ( (ListLongMap!162 (toList!96 List!165)) )
))
(declare-fun contains!70 (ListLongMap!161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!55 (array!517 array!515 (_ BitVec 32) (_ BitVec 32) V!571 V!571 (_ BitVec 32) Int) ListLongMap!161)

(assert (=> b!6397 (= res!6792 (contains!70 (getCurrentListMap!55 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6398 () Bool)

(declare-fun e!3512 () Bool)

(assert (=> b!6398 (= e!3512 tp_is_empty!295)))

(declare-fun b!6399 () Bool)

(assert (=> b!6399 (= e!3511 tp_is_empty!295)))

(declare-fun b!6400 () Bool)

(assert (=> b!6400 (= e!3510 (and e!3512 mapRes!413))))

(declare-fun condMapEmpty!413 () Bool)

(declare-fun mapDefault!413 () ValueCell!131)

(assert (=> b!6400 (= condMapEmpty!413 (= (arr!246 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!131)) mapDefault!413)))))

(declare-fun b!6401 () Bool)

(declare-fun res!6794 () Bool)

(assert (=> b!6401 (=> (not res!6794) (not e!3508))))

(declare-datatypes ((List!166 0))(
  ( (Nil!163) (Cons!162 (h!728 (_ BitVec 64)) (t!2301 List!166)) )
))
(declare-fun arrayNoDuplicates!0 (array!517 (_ BitVec 32) List!166) Bool)

(assert (=> b!6401 (= res!6794 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!163))))

(declare-fun b!6402 () Bool)

(assert (=> b!6402 (= e!3515 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6403 () Bool)

(declare-fun res!6789 () Bool)

(assert (=> b!6403 (=> (not res!6789) (not e!3508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!517 (_ BitVec 32)) Bool)

(assert (=> b!6403 (= res!6789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6404 () Bool)

(assert (=> b!6404 (= e!3509 e!3514)))

(declare-fun res!6796 () Bool)

(assert (=> b!6404 (=> res!6796 e!3514)))

(assert (=> b!6404 (= res!6796 (not (= (size!309 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1192 () (_ BitVec 32))

(assert (=> b!6404 (arrayForallSeekEntryOrOpenFound!0 lt!1192 _keys!1806 mask!2250)))

(declare-fun lt!1191 () Unit!107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!107)

(assert (=> b!6404 (= lt!1191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1192))))

(declare-fun arrayScanForKey!0 (array!517 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6404 (= lt!1192 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!824 res!6793) b!6393))

(assert (= (and b!6393 res!6791) b!6403))

(assert (= (and b!6403 res!6789) b!6401))

(assert (= (and b!6401 res!6794) b!6397))

(assert (= (and b!6397 res!6792) b!6396))

(assert (= (and b!6396 res!6795) b!6395))

(assert (= (and b!6395 c!458) b!6394))

(assert (= (and b!6395 (not c!458)) b!6402))

(assert (= (and b!6395 (not res!6790)) b!6404))

(assert (= (and b!6404 (not res!6796)) b!6392))

(assert (= (and b!6400 condMapEmpty!413) mapIsEmpty!413))

(assert (= (and b!6400 (not condMapEmpty!413)) mapNonEmpty!413))

(get-info :version)

(assert (= (and mapNonEmpty!413 ((_ is ValueCellFull!131) mapValue!413)) b!6399))

(assert (= (and b!6400 ((_ is ValueCellFull!131) mapDefault!413)) b!6398))

(assert (= start!824 b!6400))

(declare-fun m!3677 () Bool)

(assert (=> b!6395 m!3677))

(declare-fun m!3679 () Bool)

(assert (=> b!6395 m!3679))

(declare-fun m!3681 () Bool)

(assert (=> b!6404 m!3681))

(declare-fun m!3683 () Bool)

(assert (=> b!6404 m!3683))

(declare-fun m!3685 () Bool)

(assert (=> b!6404 m!3685))

(declare-fun m!3687 () Bool)

(assert (=> b!6403 m!3687))

(declare-fun m!3689 () Bool)

(assert (=> b!6392 m!3689))

(declare-fun m!3691 () Bool)

(assert (=> b!6396 m!3691))

(declare-fun m!3693 () Bool)

(assert (=> mapNonEmpty!413 m!3693))

(declare-fun m!3695 () Bool)

(assert (=> b!6401 m!3695))

(declare-fun m!3697 () Bool)

(assert (=> start!824 m!3697))

(declare-fun m!3699 () Bool)

(assert (=> start!824 m!3699))

(declare-fun m!3701 () Bool)

(assert (=> start!824 m!3701))

(declare-fun m!3703 () Bool)

(assert (=> b!6397 m!3703))

(assert (=> b!6397 m!3703))

(declare-fun m!3705 () Bool)

(assert (=> b!6397 m!3705))

(assert (=> b!6394 m!3677))

(check-sat (not start!824) tp_is_empty!295 b_and!363 (not b!6397) (not b!6395) (not b!6401) (not b_next!217) (not b!6392) (not b!6403) (not b!6404) (not b!6394) (not mapNonEmpty!413) (not b!6396))
(check-sat b_and!363 (not b_next!217))
