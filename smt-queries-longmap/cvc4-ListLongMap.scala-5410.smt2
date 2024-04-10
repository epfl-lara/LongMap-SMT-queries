; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72218 () Bool)

(assert start!72218)

(declare-fun b!837011 () Bool)

(declare-fun e!467083 () Bool)

(declare-fun tp_is_empty!15299 () Bool)

(assert (=> b!837011 (= e!467083 tp_is_empty!15299)))

(declare-fun b!837012 () Bool)

(declare-fun e!467084 () Bool)

(declare-fun e!467081 () Bool)

(declare-fun mapRes!24539 () Bool)

(assert (=> b!837012 (= e!467084 (and e!467081 mapRes!24539))))

(declare-fun condMapEmpty!24539 () Bool)

(declare-datatypes ((V!25445 0))(
  ( (V!25446 (val!7697 Int)) )
))
(declare-datatypes ((ValueCell!7210 0))(
  ( (ValueCellFull!7210 (v!10121 V!25445)) (EmptyCell!7210) )
))
(declare-datatypes ((array!46898 0))(
  ( (array!46899 (arr!22483 (Array (_ BitVec 32) ValueCell!7210)) (size!22923 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46898)

(declare-fun mapDefault!24539 () ValueCell!7210)

