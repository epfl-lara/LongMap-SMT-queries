; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104904 () Bool)

(assert start!104904)

(declare-fun b_free!26695 () Bool)

(declare-fun b_next!26695 () Bool)

(assert (=> start!104904 (= b_free!26695 (not b_next!26695))))

(declare-fun tp!93577 () Bool)

(declare-fun b_and!44471 () Bool)

(assert (=> start!104904 (= tp!93577 b_and!44471)))

(declare-fun b!1250375 () Bool)

(declare-fun e!709828 () Bool)

(declare-fun tp_is_empty!31597 () Bool)

(assert (=> b!1250375 (= e!709828 tp_is_empty!31597)))

(declare-fun b!1250376 () Bool)

(declare-fun e!709830 () Bool)

(assert (=> b!1250376 (= e!709830 tp_is_empty!31597)))

(declare-fun b!1250377 () Bool)

(declare-fun e!709832 () Bool)

(declare-fun mapRes!49159 () Bool)

(assert (=> b!1250377 (= e!709832 (and e!709830 mapRes!49159))))

(declare-fun condMapEmpty!49159 () Bool)

(declare-datatypes ((V!47495 0))(
  ( (V!47496 (val!15861 Int)) )
))
(declare-datatypes ((ValueCell!15035 0))(
  ( (ValueCellFull!15035 (v!18557 V!47495)) (EmptyCell!15035) )
))
(declare-datatypes ((array!80864 0))(
  ( (array!80865 (arr!38998 (Array (_ BitVec 32) ValueCell!15035)) (size!39534 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80864)

(declare-fun mapDefault!49159 () ValueCell!15035)

