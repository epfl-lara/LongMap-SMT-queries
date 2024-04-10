; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38258 () Bool)

(assert start!38258)

(declare-fun mapNonEmpty!16251 () Bool)

(declare-fun mapRes!16251 () Bool)

(declare-fun tp!32046 () Bool)

(declare-fun e!238973 () Bool)

(assert (=> mapNonEmpty!16251 (= mapRes!16251 (and tp!32046 e!238973))))

(declare-fun mapKey!16251 () (_ BitVec 32))

(declare-datatypes ((V!14127 0))(
  ( (V!14128 (val!4928 Int)) )
))
(declare-datatypes ((ValueCell!4540 0))(
  ( (ValueCellFull!4540 (v!7173 V!14127)) (EmptyCell!4540) )
))
(declare-datatypes ((array!23439 0))(
  ( (array!23440 (arr!11176 (Array (_ BitVec 32) ValueCell!4540)) (size!11528 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23439)

(declare-fun mapValue!16251 () ValueCell!4540)

(declare-fun mapRest!16251 () (Array (_ BitVec 32) ValueCell!4540))

(assert (=> mapNonEmpty!16251 (= (arr!11176 _values!549) (store mapRest!16251 mapKey!16251 mapValue!16251))))

(declare-fun mapIsEmpty!16251 () Bool)

(assert (=> mapIsEmpty!16251 mapRes!16251))

(declare-fun b!394742 () Bool)

(declare-fun res!226271 () Bool)

(declare-fun e!238972 () Bool)

(assert (=> b!394742 (=> (not res!226271) (not e!238972))))

(declare-datatypes ((array!23441 0))(
  ( (array!23442 (arr!11177 (Array (_ BitVec 32) (_ BitVec 64))) (size!11529 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23441)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23441 (_ BitVec 32)) Bool)

(assert (=> b!394742 (= res!226271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394743 () Bool)

(declare-fun e!238976 () Bool)

(declare-fun tp_is_empty!9767 () Bool)

(assert (=> b!394743 (= e!238976 tp_is_empty!9767)))

(declare-fun b!394744 () Bool)

(declare-fun e!238975 () Bool)

(assert (=> b!394744 (= e!238975 (and e!238976 mapRes!16251))))

(declare-fun condMapEmpty!16251 () Bool)

(declare-fun mapDefault!16251 () ValueCell!4540)

