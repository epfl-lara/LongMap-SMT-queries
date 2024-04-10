; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94930 () Bool)

(assert start!94930)

(declare-fun b_free!22135 () Bool)

(declare-fun b_next!22135 () Bool)

(assert (=> start!94930 (= b_free!22135 (not b_next!22135))))

(declare-fun tp!77870 () Bool)

(declare-fun b_and!34989 () Bool)

(assert (=> start!94930 (= tp!77870 b_and!34989)))

(declare-fun b!1073363 () Bool)

(declare-fun e!613208 () Bool)

(declare-fun e!613206 () Bool)

(declare-fun mapRes!40630 () Bool)

(assert (=> b!1073363 (= e!613208 (and e!613206 mapRes!40630))))

(declare-fun condMapEmpty!40630 () Bool)

(declare-datatypes ((V!39729 0))(
  ( (V!39730 (val!13023 Int)) )
))
(declare-datatypes ((ValueCell!12269 0))(
  ( (ValueCellFull!12269 (v!15641 V!39729)) (EmptyCell!12269) )
))
(declare-datatypes ((array!68853 0))(
  ( (array!68854 (arr!33120 (Array (_ BitVec 32) ValueCell!12269)) (size!33656 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68853)

(declare-fun mapDefault!40630 () ValueCell!12269)

