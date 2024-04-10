; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!542 () Bool)

(assert start!542)

(declare-fun mapNonEmpty!110 () Bool)

(declare-fun mapRes!110 () Bool)

(declare-fun tp!350 () Bool)

(declare-fun e!1459 () Bool)

(assert (=> mapNonEmpty!110 (= mapRes!110 (and tp!350 e!1459))))

(declare-datatypes ((V!315 0))(
  ( (V!316 (val!57 Int)) )
))
(declare-datatypes ((ValueCell!35 0))(
  ( (ValueCellFull!35 (v!1144 V!315)) (EmptyCell!35) )
))
(declare-datatypes ((array!145 0))(
  ( (array!146 (arr!66 (Array (_ BitVec 32) ValueCell!35)) (size!128 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!145)

(declare-fun mapRest!110 () (Array (_ BitVec 32) ValueCell!35))

(declare-fun mapValue!110 () ValueCell!35)

(declare-fun mapKey!110 () (_ BitVec 32))

(assert (=> mapNonEmpty!110 (= (arr!66 _values!1492) (store mapRest!110 mapKey!110 mapValue!110))))

(declare-fun b!3213 () Bool)

(declare-fun tp_is_empty!103 () Bool)

(assert (=> b!3213 (= e!1459 tp_is_empty!103)))

(declare-fun mapIsEmpty!110 () Bool)

(assert (=> mapIsEmpty!110 mapRes!110))

(declare-fun b!3214 () Bool)

(declare-fun e!1463 () Bool)

(assert (=> b!3214 (= e!1463 tp_is_empty!103)))

(declare-fun b!3215 () Bool)

(declare-fun res!5067 () Bool)

(declare-fun e!1460 () Bool)

(assert (=> b!3215 (=> (not res!5067) (not e!1460))))

(declare-datatypes ((array!147 0))(
  ( (array!148 (arr!67 (Array (_ BitVec 32) (_ BitVec 64))) (size!129 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!147)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!147 (_ BitVec 32)) Bool)

(assert (=> b!3215 (= res!5067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5066 () Bool)

(assert (=> start!542 (=> (not res!5066) (not e!1460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!542 (= res!5066 (validMask!0 mask!2250))))

(assert (=> start!542 e!1460))

(assert (=> start!542 true))

(declare-fun e!1461 () Bool)

(declare-fun array_inv!45 (array!145) Bool)

(assert (=> start!542 (and (array_inv!45 _values!1492) e!1461)))

(declare-fun array_inv!46 (array!147) Bool)

(assert (=> start!542 (array_inv!46 _keys!1806)))

(declare-fun b!3216 () Bool)

(assert (=> b!3216 (= e!1461 (and e!1463 mapRes!110))))

(declare-fun condMapEmpty!110 () Bool)

(declare-fun mapDefault!110 () ValueCell!35)

