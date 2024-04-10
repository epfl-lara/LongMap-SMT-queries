; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!834 () Bool)

(assert start!834)

(declare-fun b_free!227 () Bool)

(declare-fun b_next!227 () Bool)

(assert (=> start!834 (= b_free!227 (not b_next!227))))

(declare-fun tp!911 () Bool)

(declare-fun b_and!373 () Bool)

(assert (=> start!834 (= tp!911 b_and!373)))

(declare-fun b!6587 () Bool)

(declare-fun e!3635 () Bool)

(declare-fun e!3634 () Bool)

(assert (=> b!6587 (= e!3635 e!3634)))

(declare-fun res!6909 () Bool)

(assert (=> b!6587 (=> res!6909 e!3634)))

(declare-datatypes ((array!543 0))(
  ( (array!544 (arr!260 (Array (_ BitVec 32) (_ BitVec 64))) (size!322 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!543)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6587 (= res!6909 (not (= (size!322 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1254 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!543 (_ BitVec 32)) Bool)

(assert (=> b!6587 (arrayForallSeekEntryOrOpenFound!0 lt!1254 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!115 0))(
  ( (Unit!116) )
))
(declare-fun lt!1253 () Unit!115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!115)

(assert (=> b!6587 (= lt!1253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1254))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!543 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6587 (= lt!1254 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6588 () Bool)

(declare-fun res!6910 () Bool)

(declare-fun e!3631 () Bool)

(assert (=> b!6588 (=> (not res!6910) (not e!3631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6588 (= res!6910 (validKeyInArray!0 k!1278))))

(declare-fun mapNonEmpty!428 () Bool)

(declare-fun mapRes!428 () Bool)

(declare-fun tp!910 () Bool)

(declare-fun e!3629 () Bool)

(assert (=> mapNonEmpty!428 (= mapRes!428 (and tp!910 e!3629))))

(declare-datatypes ((V!583 0))(
  ( (V!584 (val!158 Int)) )
))
(declare-datatypes ((ValueCell!136 0))(
  ( (ValueCellFull!136 (v!1249 V!583)) (EmptyCell!136) )
))
(declare-fun mapRest!428 () (Array (_ BitVec 32) ValueCell!136))

(declare-fun mapKey!428 () (_ BitVec 32))

(declare-datatypes ((array!545 0))(
  ( (array!546 (arr!261 (Array (_ BitVec 32) ValueCell!136)) (size!323 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!545)

(declare-fun mapValue!428 () ValueCell!136)

(assert (=> mapNonEmpty!428 (= (arr!261 _values!1492) (store mapRest!428 mapKey!428 mapValue!428))))

(declare-fun b!6589 () Bool)

(assert (=> b!6589 (= e!3634 true)))

(declare-datatypes ((SeekEntryResult!22 0))(
  ( (MissingZero!22 (index!2207 (_ BitVec 32))) (Found!22 (index!2208 (_ BitVec 32))) (Intermediate!22 (undefined!834 Bool) (index!2209 (_ BitVec 32)) (x!2536 (_ BitVec 32))) (Undefined!22) (MissingVacant!22 (index!2210 (_ BitVec 32))) )
))
(declare-fun lt!1251 () SeekEntryResult!22)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!543 (_ BitVec 32)) SeekEntryResult!22)

(assert (=> b!6589 (= lt!1251 (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250))))

(declare-fun b!6590 () Bool)

(declare-fun e!3633 () Bool)

(declare-fun tp_is_empty!305 () Bool)

(assert (=> b!6590 (= e!3633 tp_is_empty!305)))

(declare-fun b!6591 () Bool)

(declare-fun e!3630 () Bool)

(assert (=> b!6591 (= e!3630 (and e!3633 mapRes!428))))

(declare-fun condMapEmpty!428 () Bool)

(declare-fun mapDefault!428 () ValueCell!136)

