; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!566 () Bool)

(assert start!566)

(declare-fun res!5174 () Bool)

(declare-fun e!1641 () Bool)

(assert (=> start!566 (=> (not res!5174) (not e!1641))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!566 (= res!5174 (validMask!0 mask!2250))))

(assert (=> start!566 e!1641))

(assert (=> start!566 true))

(declare-datatypes ((V!347 0))(
  ( (V!348 (val!69 Int)) )
))
(declare-datatypes ((ValueCell!47 0))(
  ( (ValueCellFull!47 (v!1156 V!347)) (EmptyCell!47) )
))
(declare-datatypes ((array!193 0))(
  ( (array!194 (arr!90 (Array (_ BitVec 32) ValueCell!47)) (size!152 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!193)

(declare-fun e!1640 () Bool)

(declare-fun array_inv!65 (array!193) Bool)

(assert (=> start!566 (and (array_inv!65 _values!1492) e!1640)))

(declare-datatypes ((array!195 0))(
  ( (array!196 (arr!91 (Array (_ BitVec 32) (_ BitVec 64))) (size!153 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!195)

(declare-fun array_inv!66 (array!195) Bool)

(assert (=> start!566 (array_inv!66 _keys!1806)))

(declare-fun b!3429 () Bool)

(declare-fun e!1642 () Bool)

(declare-fun tp_is_empty!127 () Bool)

(assert (=> b!3429 (= e!1642 tp_is_empty!127)))

(declare-fun b!3430 () Bool)

(declare-fun res!5176 () Bool)

(assert (=> b!3430 (=> (not res!5176) (not e!1641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!195 (_ BitVec 32)) Bool)

(assert (=> b!3430 (= res!5176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3431 () Bool)

(declare-fun e!1643 () Bool)

(declare-fun mapRes!146 () Bool)

(assert (=> b!3431 (= e!1640 (and e!1643 mapRes!146))))

(declare-fun condMapEmpty!146 () Bool)

(declare-fun mapDefault!146 () ValueCell!47)

