; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104848 () Bool)

(assert start!104848)

(declare-fun b_free!26653 () Bool)

(declare-fun b_next!26653 () Bool)

(assert (=> start!104848 (= b_free!26653 (not b_next!26653))))

(declare-fun tp!93449 () Bool)

(declare-fun b_and!44421 () Bool)

(assert (=> start!104848 (= tp!93449 b_and!44421)))

(declare-fun b!1249746 () Bool)

(declare-fun e!709356 () Bool)

(declare-fun e!709353 () Bool)

(declare-fun mapRes!49093 () Bool)

(assert (=> b!1249746 (= e!709356 (and e!709353 mapRes!49093))))

(declare-fun condMapEmpty!49093 () Bool)

(declare-datatypes ((V!47439 0))(
  ( (V!47440 (val!15840 Int)) )
))
(declare-datatypes ((ValueCell!15014 0))(
  ( (ValueCellFull!15014 (v!18536 V!47439)) (EmptyCell!15014) )
))
(declare-datatypes ((array!80784 0))(
  ( (array!80785 (arr!38959 (Array (_ BitVec 32) ValueCell!15014)) (size!39495 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80784)

(declare-fun mapDefault!49093 () ValueCell!15014)

