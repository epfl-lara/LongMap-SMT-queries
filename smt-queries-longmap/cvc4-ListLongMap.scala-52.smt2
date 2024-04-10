; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!828 () Bool)

(assert start!828)

(declare-fun b_free!221 () Bool)

(declare-fun b_next!221 () Bool)

(assert (=> start!828 (= b_free!221 (not b_next!221))))

(declare-fun tp!892 () Bool)

(declare-fun b_and!367 () Bool)

(assert (=> start!828 (= tp!892 b_and!367)))

(declare-fun b!6470 () Bool)

(declare-fun e!3557 () Bool)

(assert (=> b!6470 (= e!3557 true)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!531 0))(
  ( (array!532 (arr!254 (Array (_ BitVec 32) (_ BitVec 64))) (size!316 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!531)

(declare-datatypes ((SeekEntryResult!20 0))(
  ( (MissingZero!20 (index!2199 (_ BitVec 32))) (Found!20 (index!2200 (_ BitVec 32))) (Intermediate!20 (undefined!832 Bool) (index!2201 (_ BitVec 32)) (x!2526 (_ BitVec 32))) (Undefined!20) (MissingVacant!20 (index!2202 (_ BitVec 32))) )
))
(declare-fun lt!1218 () SeekEntryResult!20)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!531 (_ BitVec 32)) SeekEntryResult!20)

(assert (=> b!6470 (= lt!1218 (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250))))

(declare-fun b!6471 () Bool)

(declare-fun res!6839 () Bool)

(declare-fun e!3560 () Bool)

(assert (=> b!6471 (=> (not res!6839) (not e!3560))))

(declare-datatypes ((V!575 0))(
  ( (V!576 (val!155 Int)) )
))
(declare-datatypes ((ValueCell!133 0))(
  ( (ValueCellFull!133 (v!1246 V!575)) (EmptyCell!133) )
))
(declare-datatypes ((array!533 0))(
  ( (array!534 (arr!255 (Array (_ BitVec 32) ValueCell!133)) (size!317 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!533)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6471 (= res!6839 (and (= (size!317 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!316 _keys!1806) (size!317 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!419 () Bool)

(declare-fun mapRes!419 () Bool)

(declare-fun tp!893 () Bool)

(declare-fun e!3563 () Bool)

(assert (=> mapNonEmpty!419 (= mapRes!419 (and tp!893 e!3563))))

(declare-fun mapValue!419 () ValueCell!133)

(declare-fun mapRest!419 () (Array (_ BitVec 32) ValueCell!133))

(declare-fun mapKey!419 () (_ BitVec 32))

(assert (=> mapNonEmpty!419 (= (arr!255 _values!1492) (store mapRest!419 mapKey!419 mapValue!419))))

(declare-fun b!6472 () Bool)

(declare-fun e!3561 () Bool)

(assert (=> b!6472 (= e!3561 e!3557)))

(declare-fun res!6841 () Bool)

(assert (=> b!6472 (=> res!6841 e!3557)))

(assert (=> b!6472 (= res!6841 (not (= (size!316 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!531 (_ BitVec 32)) Bool)

(assert (=> b!6472 (arrayForallSeekEntryOrOpenFound!0 lt!1216 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!109 0))(
  ( (Unit!110) )
))
(declare-fun lt!1215 () Unit!109)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!109)

(assert (=> b!6472 (= lt!1215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1216))))

(declare-fun arrayScanForKey!0 (array!531 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6472 (= lt!1216 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun res!6838 () Bool)

(assert (=> start!828 (=> (not res!6838) (not e!3560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!828 (= res!6838 (validMask!0 mask!2250))))

(assert (=> start!828 e!3560))

(assert (=> start!828 tp!892))

(assert (=> start!828 true))

(declare-fun e!3562 () Bool)

(declare-fun array_inv!185 (array!533) Bool)

(assert (=> start!828 (and (array_inv!185 _values!1492) e!3562)))

(declare-fun tp_is_empty!299 () Bool)

(assert (=> start!828 tp_is_empty!299))

(declare-fun array_inv!186 (array!531) Bool)

(assert (=> start!828 (array_inv!186 _keys!1806)))

(declare-fun b!6473 () Bool)

(declare-fun res!6844 () Bool)

(assert (=> b!6473 (=> (not res!6844) (not e!3560))))

(assert (=> b!6473 (= res!6844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!419 () Bool)

(assert (=> mapIsEmpty!419 mapRes!419))

(declare-fun b!6474 () Bool)

(declare-fun res!6843 () Bool)

(assert (=> b!6474 (=> (not res!6843) (not e!3560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6474 (= res!6843 (validKeyInArray!0 k!1278))))

(declare-fun b!6475 () Bool)

(declare-fun e!3556 () Bool)

(assert (=> b!6475 (= e!3556 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6476 () Bool)

(assert (=> b!6476 (= e!3563 tp_is_empty!299)))

(declare-fun b!6477 () Bool)

(declare-fun e!3559 () Bool)

(assert (=> b!6477 (= e!3559 tp_is_empty!299)))

(declare-fun b!6478 () Bool)

(declare-fun res!6840 () Bool)

(assert (=> b!6478 (=> (not res!6840) (not e!3560))))

(declare-datatypes ((List!172 0))(
  ( (Nil!169) (Cons!168 (h!734 (_ BitVec 64)) (t!2307 List!172)) )
))
(declare-fun arrayNoDuplicates!0 (array!531 (_ BitVec 32) List!172) Bool)

(assert (=> b!6478 (= res!6840 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!169))))

(declare-fun b!6479 () Bool)

(assert (=> b!6479 (= e!3562 (and e!3559 mapRes!419))))

(declare-fun condMapEmpty!419 () Bool)

(declare-fun mapDefault!419 () ValueCell!133)

