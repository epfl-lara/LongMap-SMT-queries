; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39196 () Bool)

(assert start!39196)

(declare-fun b_free!9463 () Bool)

(declare-fun b_next!9463 () Bool)

(assert (=> start!39196 (= b_free!9463 (not b_next!9463))))

(declare-fun tp!33917 () Bool)

(declare-fun b_and!16849 () Bool)

(assert (=> start!39196 (= tp!33917 b_and!16849)))

(declare-fun b!413055 () Bool)

(declare-fun e!247061 () Bool)

(declare-fun tp_is_empty!10615 () Bool)

(assert (=> b!413055 (= e!247061 tp_is_empty!10615)))

(declare-fun b!413056 () Bool)

(declare-fun e!247067 () Bool)

(declare-fun e!247065 () Bool)

(declare-fun mapRes!17544 () Bool)

(assert (=> b!413056 (= e!247067 (and e!247065 mapRes!17544))))

(declare-fun condMapEmpty!17544 () Bool)

(declare-datatypes ((V!15259 0))(
  ( (V!15260 (val!5352 Int)) )
))
(declare-datatypes ((ValueCell!4964 0))(
  ( (ValueCellFull!4964 (v!7599 V!15259)) (EmptyCell!4964) )
))
(declare-datatypes ((array!25089 0))(
  ( (array!25090 (arr!11994 (Array (_ BitVec 32) ValueCell!4964)) (size!12346 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25089)

(declare-fun mapDefault!17544 () ValueCell!4964)

