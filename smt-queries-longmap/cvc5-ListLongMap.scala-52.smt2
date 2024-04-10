; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!824 () Bool)

(assert start!824)

(declare-fun b_free!217 () Bool)

(declare-fun b_next!217 () Bool)

(assert (=> start!824 (= b_free!217 (not b_next!217))))

(declare-fun tp!881 () Bool)

(declare-fun b_and!363 () Bool)

(assert (=> start!824 (= tp!881 b_and!363)))

(declare-fun b!6392 () Bool)

(declare-fun e!3514 () Bool)

(declare-fun tp_is_empty!295 () Bool)

(assert (=> b!6392 (= e!3514 tp_is_empty!295)))

(declare-fun b!6393 () Bool)

(declare-fun e!3509 () Bool)

(declare-datatypes ((array!523 0))(
  ( (array!524 (arr!250 (Array (_ BitVec 32) (_ BitVec 64))) (size!312 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!523)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6393 (= e!3509 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6394 () Bool)

(declare-fun e!3510 () Bool)

(declare-fun e!3515 () Bool)

(assert (=> b!6394 (= e!3510 e!3515)))

(declare-fun res!6789 () Bool)

(assert (=> b!6394 (=> res!6789 e!3515)))

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6394 (= res!6789 (not (= (size!312 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1193 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!523 (_ BitVec 32)) Bool)

(assert (=> b!6394 (arrayForallSeekEntryOrOpenFound!0 lt!1193 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!105 0))(
  ( (Unit!106) )
))
(declare-fun lt!1194 () Unit!105)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!105)

(assert (=> b!6394 (= lt!1194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1193))))

(declare-fun arrayScanForKey!0 (array!523 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6394 (= lt!1193 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6395 () Bool)

(declare-fun res!6792 () Bool)

(declare-fun e!3512 () Bool)

(assert (=> b!6395 (=> (not res!6792) (not e!3512))))

(declare-datatypes ((V!571 0))(
  ( (V!572 (val!153 Int)) )
))
(declare-datatypes ((ValueCell!131 0))(
  ( (ValueCellFull!131 (v!1244 V!571)) (EmptyCell!131) )
))
(declare-datatypes ((array!525 0))(
  ( (array!526 (arr!251 (Array (_ BitVec 32) ValueCell!131)) (size!313 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!525)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6395 (= res!6792 (and (= (size!313 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!312 _keys!1806) (size!313 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!6796 () Bool)

(assert (=> start!824 (=> (not res!6796) (not e!3512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!824 (= res!6796 (validMask!0 mask!2250))))

(assert (=> start!824 e!3512))

(assert (=> start!824 tp!881))

(assert (=> start!824 true))

(declare-fun e!3508 () Bool)

(declare-fun array_inv!181 (array!525) Bool)

(assert (=> start!824 (and (array_inv!181 _values!1492) e!3508)))

(assert (=> start!824 tp_is_empty!295))

(declare-fun array_inv!182 (array!523) Bool)

(assert (=> start!824 (array_inv!182 _keys!1806)))

(declare-fun b!6396 () Bool)

(declare-fun res!6795 () Bool)

(assert (=> b!6396 (=> (not res!6795) (not e!3512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6396 (= res!6795 (validKeyInArray!0 k!1278))))

(declare-fun b!6397 () Bool)

(assert (=> b!6397 (= e!3515 true)))

(declare-datatypes ((SeekEntryResult!18 0))(
  ( (MissingZero!18 (index!2191 (_ BitVec 32))) (Found!18 (index!2192 (_ BitVec 32))) (Intermediate!18 (undefined!830 Bool) (index!2193 (_ BitVec 32)) (x!2524 (_ BitVec 32))) (Undefined!18) (MissingVacant!18 (index!2194 (_ BitVec 32))) )
))
(declare-fun lt!1192 () SeekEntryResult!18)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!523 (_ BitVec 32)) SeekEntryResult!18)

(assert (=> b!6397 (= lt!1192 (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250))))

(declare-fun b!6398 () Bool)

(assert (=> b!6398 (= e!3512 (not e!3510))))

(declare-fun res!6791 () Bool)

(assert (=> b!6398 (=> res!6791 e!3510)))

(assert (=> b!6398 (= res!6791 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6398 e!3509))

(declare-fun c!458 () Bool)

(assert (=> b!6398 (= c!458 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!571)

(declare-fun zeroValue!1434 () V!571)

(declare-fun lt!1191 () Unit!105)

(declare-fun lemmaKeyInListMapIsInArray!37 (array!523 array!525 (_ BitVec 32) (_ BitVec 32) V!571 V!571 (_ BitVec 64) Int) Unit!105)

(assert (=> b!6398 (= lt!1191 (lemmaKeyInListMapIsInArray!37 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!6399 () Bool)

(declare-fun res!6794 () Bool)

(assert (=> b!6399 (=> (not res!6794) (not e!3512))))

(assert (=> b!6399 (= res!6794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!413 () Bool)

(declare-fun mapRes!413 () Bool)

(declare-fun tp!880 () Bool)

(declare-fun e!3511 () Bool)

(assert (=> mapNonEmpty!413 (= mapRes!413 (and tp!880 e!3511))))

(declare-fun mapValue!413 () ValueCell!131)

(declare-fun mapRest!413 () (Array (_ BitVec 32) ValueCell!131))

(declare-fun mapKey!413 () (_ BitVec 32))

(assert (=> mapNonEmpty!413 (= (arr!251 _values!1492) (store mapRest!413 mapKey!413 mapValue!413))))

(declare-fun b!6400 () Bool)

(declare-fun res!6793 () Bool)

(assert (=> b!6400 (=> (not res!6793) (not e!3512))))

(declare-datatypes ((tuple2!158 0))(
  ( (tuple2!159 (_1!79 (_ BitVec 64)) (_2!79 V!571)) )
))
(declare-datatypes ((List!168 0))(
  ( (Nil!165) (Cons!164 (h!730 tuple2!158) (t!2303 List!168)) )
))
(declare-datatypes ((ListLongMap!163 0))(
  ( (ListLongMap!164 (toList!97 List!168)) )
))
(declare-fun contains!71 (ListLongMap!163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!56 (array!523 array!525 (_ BitVec 32) (_ BitVec 32) V!571 V!571 (_ BitVec 32) Int) ListLongMap!163)

(assert (=> b!6400 (= res!6793 (contains!71 (getCurrentListMap!56 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6401 () Bool)

(declare-fun res!6790 () Bool)

(assert (=> b!6401 (=> (not res!6790) (not e!3512))))

(declare-datatypes ((List!169 0))(
  ( (Nil!166) (Cons!165 (h!731 (_ BitVec 64)) (t!2304 List!169)) )
))
(declare-fun arrayNoDuplicates!0 (array!523 (_ BitVec 32) List!169) Bool)

(assert (=> b!6401 (= res!6790 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!166))))

(declare-fun b!6402 () Bool)

(assert (=> b!6402 (= e!3511 tp_is_empty!295)))

(declare-fun mapIsEmpty!413 () Bool)

(assert (=> mapIsEmpty!413 mapRes!413))

(declare-fun b!6403 () Bool)

(assert (=> b!6403 (= e!3508 (and e!3514 mapRes!413))))

(declare-fun condMapEmpty!413 () Bool)

(declare-fun mapDefault!413 () ValueCell!131)

