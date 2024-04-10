; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104842 () Bool)

(assert start!104842)

(declare-fun b_free!26647 () Bool)

(declare-fun b_next!26647 () Bool)

(assert (=> start!104842 (= b_free!26647 (not b_next!26647))))

(declare-fun tp!93431 () Bool)

(declare-fun b_and!44415 () Bool)

(assert (=> start!104842 (= tp!93431 b_and!44415)))

(declare-fun b!1249683 () Bool)

(declare-fun e!709309 () Bool)

(declare-fun e!709310 () Bool)

(declare-fun mapRes!49084 () Bool)

(assert (=> b!1249683 (= e!709309 (and e!709310 mapRes!49084))))

(declare-fun condMapEmpty!49084 () Bool)

(declare-datatypes ((V!47431 0))(
  ( (V!47432 (val!15837 Int)) )
))
(declare-datatypes ((ValueCell!15011 0))(
  ( (ValueCellFull!15011 (v!18533 V!47431)) (EmptyCell!15011) )
))
(declare-datatypes ((array!80774 0))(
  ( (array!80775 (arr!38954 (Array (_ BitVec 32) ValueCell!15011)) (size!39490 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80774)

(declare-fun mapDefault!49084 () ValueCell!15011)

