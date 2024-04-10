; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94648 () Bool)

(assert start!94648)

(declare-fun b_free!21917 () Bool)

(declare-fun b_next!21917 () Bool)

(assert (=> start!94648 (= b_free!21917 (not b_next!21917))))

(declare-fun tp!77206 () Bool)

(declare-fun b_and!34737 () Bool)

(assert (=> start!94648 (= tp!77206 b_and!34737)))

(declare-fun b!1070109 () Bool)

(declare-fun e!610796 () Bool)

(declare-fun e!610799 () Bool)

(declare-fun mapRes!40294 () Bool)

(assert (=> b!1070109 (= e!610796 (and e!610799 mapRes!40294))))

(declare-fun condMapEmpty!40294 () Bool)

(declare-datatypes ((V!39437 0))(
  ( (V!39438 (val!12914 Int)) )
))
(declare-datatypes ((ValueCell!12160 0))(
  ( (ValueCellFull!12160 (v!15530 V!39437)) (EmptyCell!12160) )
))
(declare-datatypes ((array!68433 0))(
  ( (array!68434 (arr!32913 (Array (_ BitVec 32) ValueCell!12160)) (size!33449 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68433)

(declare-fun mapDefault!40294 () ValueCell!12160)

