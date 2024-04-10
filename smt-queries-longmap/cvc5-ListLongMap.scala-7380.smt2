; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94020 () Bool)

(assert start!94020)

(declare-fun b_free!21457 () Bool)

(declare-fun b_next!21457 () Bool)

(assert (=> start!94020 (= b_free!21457 (not b_next!21457))))

(declare-fun tp!75800 () Bool)

(declare-fun b_and!34189 () Bool)

(assert (=> start!94020 (= tp!75800 b_and!34189)))

(declare-fun b!1063403 () Bool)

(declare-fun e!605920 () Bool)

(declare-fun e!605916 () Bool)

(declare-fun mapRes!39577 () Bool)

(assert (=> b!1063403 (= e!605920 (and e!605916 mapRes!39577))))

(declare-fun condMapEmpty!39577 () Bool)

(declare-datatypes ((V!38825 0))(
  ( (V!38826 (val!12684 Int)) )
))
(declare-datatypes ((ValueCell!11930 0))(
  ( (ValueCellFull!11930 (v!15295 V!38825)) (EmptyCell!11930) )
))
(declare-datatypes ((array!67533 0))(
  ( (array!67534 (arr!32472 (Array (_ BitVec 32) ValueCell!11930)) (size!33008 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67533)

(declare-fun mapDefault!39577 () ValueCell!11930)

