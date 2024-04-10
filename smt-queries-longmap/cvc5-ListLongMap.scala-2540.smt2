; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39058 () Bool)

(assert start!39058)

(declare-fun b_free!9325 () Bool)

(declare-fun b_next!9325 () Bool)

(assert (=> start!39058 (= b_free!9325 (not b_next!9325))))

(declare-fun tp!33503 () Bool)

(declare-fun b_and!16711 () Bool)

(assert (=> start!39058 (= tp!33503 b_and!16711)))

(declare-fun b!409917 () Bool)

(declare-fun e!245798 () Bool)

(declare-fun e!245799 () Bool)

(declare-fun mapRes!17337 () Bool)

(assert (=> b!409917 (= e!245798 (and e!245799 mapRes!17337))))

(declare-fun condMapEmpty!17337 () Bool)

(declare-datatypes ((V!15075 0))(
  ( (V!15076 (val!5283 Int)) )
))
(declare-datatypes ((ValueCell!4895 0))(
  ( (ValueCellFull!4895 (v!7530 V!15075)) (EmptyCell!4895) )
))
(declare-datatypes ((array!24827 0))(
  ( (array!24828 (arr!11863 (Array (_ BitVec 32) ValueCell!4895)) (size!12215 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24827)

(declare-fun mapDefault!17337 () ValueCell!4895)

