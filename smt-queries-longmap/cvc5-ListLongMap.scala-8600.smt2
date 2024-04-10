; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104830 () Bool)

(assert start!104830)

(declare-fun b_free!26635 () Bool)

(declare-fun b_next!26635 () Bool)

(assert (=> start!104830 (= b_free!26635 (not b_next!26635))))

(declare-fun tp!93394 () Bool)

(declare-fun b_and!44403 () Bool)

(assert (=> start!104830 (= tp!93394 b_and!44403)))

(declare-fun b!1249557 () Bool)

(declare-fun e!709221 () Bool)

(declare-fun e!709219 () Bool)

(declare-fun mapRes!49066 () Bool)

(assert (=> b!1249557 (= e!709221 (and e!709219 mapRes!49066))))

(declare-fun condMapEmpty!49066 () Bool)

(declare-datatypes ((V!47415 0))(
  ( (V!47416 (val!15831 Int)) )
))
(declare-datatypes ((ValueCell!15005 0))(
  ( (ValueCellFull!15005 (v!18527 V!47415)) (EmptyCell!15005) )
))
(declare-datatypes ((array!80754 0))(
  ( (array!80755 (arr!38944 (Array (_ BitVec 32) ValueCell!15005)) (size!39480 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80754)

(declare-fun mapDefault!49066 () ValueCell!15005)

