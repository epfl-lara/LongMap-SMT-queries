; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20076 () Bool)

(assert start!20076)

(declare-fun b!196581 () Bool)

(declare-fun res!92792 () Bool)

(declare-fun e!129492 () Bool)

(assert (=> b!196581 (=> (not res!92792) (not e!129492))))

(declare-datatypes ((array!8439 0))(
  ( (array!8440 (arr!3970 (Array (_ BitVec 32) (_ BitVec 64))) (size!4295 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8439)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8439 (_ BitVec 32)) Bool)

(assert (=> b!196581 (= res!92792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196582 () Bool)

(declare-fun e!129493 () Bool)

(declare-fun tp_is_empty!4591 () Bool)

(assert (=> b!196582 (= e!129493 tp_is_empty!4591)))

(declare-fun res!92793 () Bool)

(assert (=> start!20076 (=> (not res!92793) (not e!129492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20076 (= res!92793 (validMask!0 mask!1149))))

(assert (=> start!20076 e!129492))

(declare-fun array_inv!2589 (array!8439) Bool)

(assert (=> start!20076 (array_inv!2589 _keys!825)))

(assert (=> start!20076 true))

(declare-datatypes ((V!5769 0))(
  ( (V!5770 (val!2340 Int)) )
))
(declare-datatypes ((ValueCell!1952 0))(
  ( (ValueCellFull!1952 (v!4310 V!5769)) (EmptyCell!1952) )
))
(declare-datatypes ((array!8441 0))(
  ( (array!8442 (arr!3971 (Array (_ BitVec 32) ValueCell!1952)) (size!4296 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8441)

(declare-fun e!129490 () Bool)

(declare-fun array_inv!2590 (array!8441) Bool)

(assert (=> start!20076 (and (array_inv!2590 _values!649) e!129490)))

(declare-fun b!196583 () Bool)

(declare-fun mapRes!7955 () Bool)

(assert (=> b!196583 (= e!129490 (and e!129493 mapRes!7955))))

(declare-fun condMapEmpty!7955 () Bool)

(declare-fun mapDefault!7955 () ValueCell!1952)

