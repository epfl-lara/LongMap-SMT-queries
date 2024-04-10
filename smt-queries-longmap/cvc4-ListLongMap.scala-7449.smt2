; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94592 () Bool)

(assert start!94592)

(declare-fun b_free!21875 () Bool)

(declare-fun b_next!21875 () Bool)

(assert (=> start!94592 (= b_free!21875 (not b_next!21875))))

(declare-fun tp!77078 () Bool)

(declare-fun b_and!34687 () Bool)

(assert (=> start!94592 (= tp!77078 b_and!34687)))

(declare-fun b!1069575 () Bool)

(declare-fun e!610420 () Bool)

(declare-fun e!610422 () Bool)

(declare-fun mapRes!40228 () Bool)

(assert (=> b!1069575 (= e!610420 (and e!610422 mapRes!40228))))

(declare-fun condMapEmpty!40228 () Bool)

(declare-datatypes ((V!39381 0))(
  ( (V!39382 (val!12893 Int)) )
))
(declare-datatypes ((ValueCell!12139 0))(
  ( (ValueCellFull!12139 (v!15509 V!39381)) (EmptyCell!12139) )
))
(declare-datatypes ((array!68349 0))(
  ( (array!68350 (arr!32872 (Array (_ BitVec 32) ValueCell!12139)) (size!33408 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68349)

(declare-fun mapDefault!40228 () ValueCell!12139)

