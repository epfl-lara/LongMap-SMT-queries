; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33364 () Bool)

(assert start!33364)

(declare-fun b!331547 () Bool)

(declare-fun e!203401 () Bool)

(declare-fun tp_is_empty!6661 () Bool)

(assert (=> b!331547 (= e!203401 tp_is_empty!6661)))

(declare-fun b!331548 () Bool)

(declare-fun e!203399 () Bool)

(declare-fun e!203398 () Bool)

(declare-fun mapRes!11361 () Bool)

(assert (=> b!331548 (= e!203399 (and e!203398 mapRes!11361))))

(declare-fun condMapEmpty!11361 () Bool)

(declare-datatypes ((V!9859 0))(
  ( (V!9860 (val!3375 Int)) )
))
(declare-datatypes ((ValueCell!2987 0))(
  ( (ValueCellFull!2987 (v!5533 V!9859)) (EmptyCell!2987) )
))
(declare-datatypes ((array!16915 0))(
  ( (array!16916 (arr!7997 (Array (_ BitVec 32) ValueCell!2987)) (size!8349 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16915)

(declare-fun mapDefault!11361 () ValueCell!2987)

