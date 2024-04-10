; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39008 () Bool)

(assert start!39008)

(declare-fun b!408848 () Bool)

(declare-fun res!236635 () Bool)

(declare-fun e!245347 () Bool)

(assert (=> b!408848 (=> (not res!236635) (not e!245347))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408848 (= res!236635 (validMask!0 mask!1025))))

(declare-fun b!408849 () Bool)

(declare-fun e!245351 () Bool)

(declare-fun e!245348 () Bool)

(declare-fun mapRes!17262 () Bool)

(assert (=> b!408849 (= e!245351 (and e!245348 mapRes!17262))))

(declare-fun condMapEmpty!17262 () Bool)

(declare-datatypes ((V!15007 0))(
  ( (V!15008 (val!5258 Int)) )
))
(declare-datatypes ((ValueCell!4870 0))(
  ( (ValueCellFull!4870 (v!7505 V!15007)) (EmptyCell!4870) )
))
(declare-datatypes ((array!24729 0))(
  ( (array!24730 (arr!11814 (Array (_ BitVec 32) ValueCell!4870)) (size!12166 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24729)

(declare-fun mapDefault!17262 () ValueCell!4870)

