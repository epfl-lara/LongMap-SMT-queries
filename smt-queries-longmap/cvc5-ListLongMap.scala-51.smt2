; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!818 () Bool)

(assert start!818)

(declare-fun b_free!211 () Bool)

(declare-fun b_next!211 () Bool)

(assert (=> start!818 (= b_free!211 (not b_next!211))))

(declare-fun tp!862 () Bool)

(declare-fun b_and!357 () Bool)

(assert (=> start!818 (= tp!862 b_and!357)))

(declare-fun b!6275 () Bool)

(declare-fun e!3441 () Bool)

(declare-fun tp_is_empty!289 () Bool)

(assert (=> b!6275 (= e!3441 tp_is_empty!289)))

(declare-fun b!6276 () Bool)

(declare-fun e!3443 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6276 (= e!3443 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6277 () Bool)

(declare-fun e!3442 () Bool)

(assert (=> b!6277 (= e!3442 tp_is_empty!289)))

(declare-fun b!6278 () Bool)

(declare-fun e!3436 () Bool)

(declare-fun e!3438 () Bool)

(assert (=> b!6278 (= e!3436 e!3438)))

(declare-fun res!6721 () Bool)

(assert (=> b!6278 (=> res!6721 e!3438)))

(declare-datatypes ((array!511 0))(
  ( (array!512 (arr!244 (Array (_ BitVec 32) (_ BitVec 64))) (size!306 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!511)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6278 (= res!6721 (not (= (size!306 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1155 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!511 (_ BitVec 32)) Bool)

(assert (=> b!6278 (arrayForallSeekEntryOrOpenFound!0 lt!1155 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!99 0))(
  ( (Unit!100) )
))
(declare-fun lt!1157 () Unit!99)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!99)

(assert (=> b!6278 (= lt!1157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1155))))

(declare-fun arrayScanForKey!0 (array!511 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6278 (= lt!1155 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6279 () Bool)

(declare-fun res!6719 () Bool)

(declare-fun e!3437 () Bool)

(assert (=> b!6279 (=> (not res!6719) (not e!3437))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!563 0))(
  ( (V!564 (val!150 Int)) )
))
(declare-datatypes ((ValueCell!128 0))(
  ( (ValueCellFull!128 (v!1241 V!563)) (EmptyCell!128) )
))
(declare-datatypes ((array!513 0))(
  ( (array!514 (arr!245 (Array (_ BitVec 32) ValueCell!128)) (size!307 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!513)

(declare-fun minValue!1434 () V!563)

(declare-fun zeroValue!1434 () V!563)

(declare-datatypes ((tuple2!154 0))(
  ( (tuple2!155 (_1!77 (_ BitVec 64)) (_2!77 V!563)) )
))
(declare-datatypes ((List!163 0))(
  ( (Nil!160) (Cons!159 (h!725 tuple2!154) (t!2298 List!163)) )
))
(declare-datatypes ((ListLongMap!159 0))(
  ( (ListLongMap!160 (toList!95 List!163)) )
))
(declare-fun contains!69 (ListLongMap!159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!54 (array!511 array!513 (_ BitVec 32) (_ BitVec 32) V!563 V!563 (_ BitVec 32) Int) ListLongMap!159)

(assert (=> b!6279 (= res!6719 (contains!69 (getCurrentListMap!54 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun mapIsEmpty!404 () Bool)

(declare-fun mapRes!404 () Bool)

(assert (=> mapIsEmpty!404 mapRes!404))

(declare-fun b!6280 () Bool)

(assert (=> b!6280 (= e!3437 (not e!3436))))

(declare-fun res!6722 () Bool)

(assert (=> b!6280 (=> res!6722 e!3436)))

(declare-fun arrayContainsKey!0 (array!511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6280 (= res!6722 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6280 e!3443))

(declare-fun c!449 () Bool)

(assert (=> b!6280 (= c!449 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1156 () Unit!99)

(declare-fun lemmaKeyInListMapIsInArray!35 (array!511 array!513 (_ BitVec 32) (_ BitVec 32) V!563 V!563 (_ BitVec 64) Int) Unit!99)

(assert (=> b!6280 (= lt!1156 (lemmaKeyInListMapIsInArray!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!6281 () Bool)

(assert (=> b!6281 (= e!3438 true)))

(declare-datatypes ((SeekEntryResult!16 0))(
  ( (MissingZero!16 (index!2183 (_ BitVec 32))) (Found!16 (index!2184 (_ BitVec 32))) (Intermediate!16 (undefined!828 Bool) (index!2185 (_ BitVec 32)) (x!2514 (_ BitVec 32))) (Undefined!16) (MissingVacant!16 (index!2186 (_ BitVec 32))) )
))
(declare-fun lt!1158 () SeekEntryResult!16)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!511 (_ BitVec 32)) SeekEntryResult!16)

(assert (=> b!6281 (= lt!1158 (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250))))

(declare-fun b!6282 () Bool)

(declare-fun res!6720 () Bool)

(assert (=> b!6282 (=> (not res!6720) (not e!3437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6282 (= res!6720 (validKeyInArray!0 k!1278))))

(declare-fun b!6283 () Bool)

(declare-fun res!6723 () Bool)

(assert (=> b!6283 (=> (not res!6723) (not e!3437))))

(assert (=> b!6283 (= res!6723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!6718 () Bool)

(assert (=> start!818 (=> (not res!6718) (not e!3437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!818 (= res!6718 (validMask!0 mask!2250))))

(assert (=> start!818 e!3437))

(assert (=> start!818 tp!862))

(assert (=> start!818 true))

(declare-fun e!3440 () Bool)

(declare-fun array_inv!177 (array!513) Bool)

(assert (=> start!818 (and (array_inv!177 _values!1492) e!3440)))

(assert (=> start!818 tp_is_empty!289))

(declare-fun array_inv!178 (array!511) Bool)

(assert (=> start!818 (array_inv!178 _keys!1806)))

(declare-fun b!6284 () Bool)

(assert (=> b!6284 (= e!3443 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!404 () Bool)

(declare-fun tp!863 () Bool)

(assert (=> mapNonEmpty!404 (= mapRes!404 (and tp!863 e!3441))))

(declare-fun mapRest!404 () (Array (_ BitVec 32) ValueCell!128))

(declare-fun mapKey!404 () (_ BitVec 32))

(declare-fun mapValue!404 () ValueCell!128)

(assert (=> mapNonEmpty!404 (= (arr!245 _values!1492) (store mapRest!404 mapKey!404 mapValue!404))))

(declare-fun b!6285 () Bool)

(declare-fun res!6724 () Bool)

(assert (=> b!6285 (=> (not res!6724) (not e!3437))))

(declare-datatypes ((List!164 0))(
  ( (Nil!161) (Cons!160 (h!726 (_ BitVec 64)) (t!2299 List!164)) )
))
(declare-fun arrayNoDuplicates!0 (array!511 (_ BitVec 32) List!164) Bool)

(assert (=> b!6285 (= res!6724 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!161))))

(declare-fun b!6286 () Bool)

(assert (=> b!6286 (= e!3440 (and e!3442 mapRes!404))))

(declare-fun condMapEmpty!404 () Bool)

(declare-fun mapDefault!404 () ValueCell!128)

