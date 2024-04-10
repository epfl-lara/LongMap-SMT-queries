; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!594 () Bool)

(assert start!594)

(declare-fun b_free!67 () Bool)

(declare-fun b_next!67 () Bool)

(assert (=> start!594 (= b_free!67 (not b_next!67))))

(declare-fun tp!418 () Bool)

(declare-fun b_and!205 () Bool)

(assert (=> start!594 (= tp!418 b_and!205)))

(declare-fun b!3637 () Bool)

(declare-fun res!5281 () Bool)

(declare-fun e!1802 () Bool)

(assert (=> b!3637 (=> (not res!5281) (not e!1802))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!371 0))(
  ( (V!372 (val!78 Int)) )
))
(declare-datatypes ((ValueCell!56 0))(
  ( (ValueCellFull!56 (v!1165 V!371)) (EmptyCell!56) )
))
(declare-datatypes ((array!229 0))(
  ( (array!230 (arr!107 (Array (_ BitVec 32) ValueCell!56)) (size!169 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!229)

(declare-datatypes ((array!231 0))(
  ( (array!232 (arr!108 (Array (_ BitVec 32) (_ BitVec 64))) (size!170 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!231)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3637 (= res!5281 (and (= (size!169 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!170 _keys!1806) (size!169 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3638 () Bool)

(declare-fun e!1803 () Bool)

(declare-fun tp_is_empty!145 () Bool)

(assert (=> b!3638 (= e!1803 tp_is_empty!145)))

(declare-fun b!3639 () Bool)

(declare-fun e!1805 () Bool)

(declare-fun e!1801 () Bool)

(declare-fun mapRes!176 () Bool)

(assert (=> b!3639 (= e!1805 (and e!1801 mapRes!176))))

(declare-fun condMapEmpty!176 () Bool)

(declare-fun mapDefault!176 () ValueCell!56)

