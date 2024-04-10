; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!554 () Bool)

(assert start!554)

(declare-fun b!3321 () Bool)

(declare-fun e!1549 () Bool)

(declare-fun tp_is_empty!115 () Bool)

(assert (=> b!3321 (= e!1549 tp_is_empty!115)))

(declare-fun b!3322 () Bool)

(declare-fun res!5122 () Bool)

(declare-fun e!1550 () Bool)

(assert (=> b!3322 (=> (not res!5122) (not e!1550))))

(declare-datatypes ((array!169 0))(
  ( (array!170 (arr!78 (Array (_ BitVec 32) (_ BitVec 64))) (size!140 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!169)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!169 (_ BitVec 32)) Bool)

(assert (=> b!3322 (= res!5122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!128 () Bool)

(declare-fun mapRes!128 () Bool)

(assert (=> mapIsEmpty!128 mapRes!128))

(declare-fun res!5121 () Bool)

(assert (=> start!554 (=> (not res!5121) (not e!1550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!554 (= res!5121 (validMask!0 mask!2250))))

(assert (=> start!554 e!1550))

(assert (=> start!554 true))

(declare-datatypes ((V!331 0))(
  ( (V!332 (val!63 Int)) )
))
(declare-datatypes ((ValueCell!41 0))(
  ( (ValueCellFull!41 (v!1150 V!331)) (EmptyCell!41) )
))
(declare-datatypes ((array!171 0))(
  ( (array!172 (arr!79 (Array (_ BitVec 32) ValueCell!41)) (size!141 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!171)

(declare-fun e!1552 () Bool)

(declare-fun array_inv!53 (array!171) Bool)

(assert (=> start!554 (and (array_inv!53 _values!1492) e!1552)))

(declare-fun array_inv!54 (array!169) Bool)

(assert (=> start!554 (array_inv!54 _keys!1806)))

(declare-fun b!3323 () Bool)

(assert (=> b!3323 (= e!1552 (and e!1549 mapRes!128))))

(declare-fun condMapEmpty!128 () Bool)

(declare-fun mapDefault!128 () ValueCell!41)

