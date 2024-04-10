; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40460 () Bool)

(assert start!40460)

(declare-fun b!445318 () Bool)

(declare-fun e!261781 () Bool)

(declare-fun e!261778 () Bool)

(assert (=> b!445318 (= e!261781 e!261778)))

(declare-fun res!264214 () Bool)

(assert (=> b!445318 (=> (not res!264214) (not e!261778))))

(declare-datatypes ((array!27497 0))(
  ( (array!27498 (arr!13196 (Array (_ BitVec 32) (_ BitVec 64))) (size!13548 (_ BitVec 32))) )
))
(declare-fun lt!203624 () array!27497)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27497 (_ BitVec 32)) Bool)

(assert (=> b!445318 (= res!264214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203624 mask!1025))))

(declare-fun _keys!709 () array!27497)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445318 (= lt!203624 (array!27498 (store (arr!13196 _keys!709) i!563 k!794) (size!13548 _keys!709)))))

(declare-fun b!445319 () Bool)

(declare-fun res!264219 () Bool)

(assert (=> b!445319 (=> (not res!264219) (not e!261781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445319 (= res!264219 (validMask!0 mask!1025))))

(declare-fun b!445320 () Bool)

(declare-fun res!264222 () Bool)

(assert (=> b!445320 (=> (not res!264222) (not e!261781))))

(assert (=> b!445320 (= res!264222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19395 () Bool)

(declare-fun mapRes!19395 () Bool)

(assert (=> mapIsEmpty!19395 mapRes!19395))

(declare-fun b!445321 () Bool)

(declare-fun e!261782 () Bool)

(declare-fun tp_is_empty!11845 () Bool)

(assert (=> b!445321 (= e!261782 tp_is_empty!11845)))

(declare-fun b!445322 () Bool)

(declare-fun res!264217 () Bool)

(assert (=> b!445322 (=> (not res!264217) (not e!261781))))

(declare-fun arrayContainsKey!0 (array!27497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445322 (= res!264217 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445323 () Bool)

(declare-fun e!261780 () Bool)

(assert (=> b!445323 (= e!261780 (and e!261782 mapRes!19395))))

(declare-fun condMapEmpty!19395 () Bool)

(declare-datatypes ((V!16899 0))(
  ( (V!16900 (val!5967 Int)) )
))
(declare-datatypes ((ValueCell!5579 0))(
  ( (ValueCellFull!5579 (v!8218 V!16899)) (EmptyCell!5579) )
))
(declare-datatypes ((array!27499 0))(
  ( (array!27500 (arr!13197 (Array (_ BitVec 32) ValueCell!5579)) (size!13549 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27499)

(declare-fun mapDefault!19395 () ValueCell!5579)

