; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!822 () Bool)

(assert start!822)

(declare-fun b_free!215 () Bool)

(declare-fun b_next!215 () Bool)

(assert (=> start!822 (= b_free!215 (not b_next!215))))

(declare-fun tp!874 () Bool)

(declare-fun b_and!361 () Bool)

(assert (=> start!822 (= tp!874 b_and!361)))

(declare-fun b!6353 () Bool)

(declare-fun e!3488 () Bool)

(declare-fun tp_is_empty!293 () Bool)

(assert (=> b!6353 (= e!3488 tp_is_empty!293)))

(declare-fun mapNonEmpty!410 () Bool)

(declare-fun mapRes!410 () Bool)

(declare-fun tp!875 () Bool)

(declare-fun e!3491 () Bool)

(assert (=> mapNonEmpty!410 (= mapRes!410 (and tp!875 e!3491))))

(declare-fun mapKey!410 () (_ BitVec 32))

(declare-datatypes ((V!567 0))(
  ( (V!568 (val!152 Int)) )
))
(declare-datatypes ((ValueCell!130 0))(
  ( (ValueCellFull!130 (v!1243 V!567)) (EmptyCell!130) )
))
(declare-datatypes ((array!519 0))(
  ( (array!520 (arr!248 (Array (_ BitVec 32) ValueCell!130)) (size!310 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!519)

(declare-fun mapValue!410 () ValueCell!130)

(declare-fun mapRest!410 () (Array (_ BitVec 32) ValueCell!130))

(assert (=> mapNonEmpty!410 (= (arr!248 _values!1492) (store mapRest!410 mapKey!410 mapValue!410))))

(declare-fun b!6355 () Bool)

(assert (=> b!6355 (= e!3491 tp_is_empty!293)))

(declare-fun b!6356 () Bool)

(declare-fun e!3490 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6356 (= e!3490 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6357 () Bool)

(declare-fun res!6768 () Bool)

(declare-fun e!3486 () Bool)

(assert (=> b!6357 (=> (not res!6768) (not e!3486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6357 (= res!6768 (validKeyInArray!0 k!1278))))

(declare-fun b!6358 () Bool)

(declare-fun res!6765 () Bool)

(assert (=> b!6358 (=> (not res!6765) (not e!3486))))

(declare-datatypes ((array!521 0))(
  ( (array!522 (arr!249 (Array (_ BitVec 32) (_ BitVec 64))) (size!311 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!521)

(declare-datatypes ((List!167 0))(
  ( (Nil!164) (Cons!163 (h!729 (_ BitVec 64)) (t!2302 List!167)) )
))
(declare-fun arrayNoDuplicates!0 (array!521 (_ BitVec 32) List!167) Bool)

(assert (=> b!6358 (= res!6765 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!164))))

(declare-fun mapIsEmpty!410 () Bool)

(assert (=> mapIsEmpty!410 mapRes!410))

(declare-fun b!6359 () Bool)

(declare-fun arrayContainsKey!0 (array!521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6359 (= e!3490 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6360 () Bool)

(declare-fun res!6770 () Bool)

(assert (=> b!6360 (=> (not res!6770) (not e!3486))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!521 (_ BitVec 32)) Bool)

(assert (=> b!6360 (= res!6770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6361 () Bool)

(declare-fun e!3484 () Bool)

(declare-fun e!3485 () Bool)

(assert (=> b!6361 (= e!3484 e!3485)))

(declare-fun res!6769 () Bool)

(assert (=> b!6361 (=> res!6769 e!3485)))

(assert (=> b!6361 (= res!6769 (not (= (size!311 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1180 () (_ BitVec 32))

(assert (=> b!6361 (arrayForallSeekEntryOrOpenFound!0 lt!1180 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!103 0))(
  ( (Unit!104) )
))
(declare-fun lt!1179 () Unit!103)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!103)

(assert (=> b!6361 (= lt!1179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1180))))

(declare-fun arrayScanForKey!0 (array!521 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6361 (= lt!1180 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6362 () Bool)

(declare-fun e!3487 () Bool)

(assert (=> b!6362 (= e!3487 (and e!3488 mapRes!410))))

(declare-fun condMapEmpty!410 () Bool)

(declare-fun mapDefault!410 () ValueCell!130)

