; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39158 () Bool)

(assert start!39158)

(declare-fun b_free!9425 () Bool)

(declare-fun b_next!9425 () Bool)

(assert (=> start!39158 (= b_free!9425 (not b_next!9425))))

(declare-fun tp!33803 () Bool)

(declare-fun b_and!16811 () Bool)

(assert (=> start!39158 (= tp!33803 b_and!16811)))

(declare-fun res!239278 () Bool)

(declare-fun e!246697 () Bool)

(assert (=> start!39158 (=> (not res!239278) (not e!246697))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25015 0))(
  ( (array!25016 (arr!11957 (Array (_ BitVec 32) (_ BitVec 64))) (size!12309 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25015)

(assert (=> start!39158 (= res!239278 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12309 _keys!709))))))

(assert (=> start!39158 e!246697))

(declare-fun tp_is_empty!10577 () Bool)

(assert (=> start!39158 tp_is_empty!10577))

(assert (=> start!39158 tp!33803))

(assert (=> start!39158 true))

(declare-datatypes ((V!15207 0))(
  ( (V!15208 (val!5333 Int)) )
))
(declare-datatypes ((ValueCell!4945 0))(
  ( (ValueCellFull!4945 (v!7580 V!15207)) (EmptyCell!4945) )
))
(declare-datatypes ((array!25017 0))(
  ( (array!25018 (arr!11958 (Array (_ BitVec 32) ValueCell!4945)) (size!12310 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25017)

(declare-fun e!246701 () Bool)

(declare-fun array_inv!8720 (array!25017) Bool)

(assert (=> start!39158 (and (array_inv!8720 _values!549) e!246701)))

(declare-fun array_inv!8721 (array!25015) Bool)

(assert (=> start!39158 (array_inv!8721 _keys!709)))

(declare-fun b!412167 () Bool)

(declare-fun e!246699 () Bool)

(declare-fun mapRes!17487 () Bool)

(assert (=> b!412167 (= e!246701 (and e!246699 mapRes!17487))))

(declare-fun condMapEmpty!17487 () Bool)

(declare-fun mapDefault!17487 () ValueCell!4945)

