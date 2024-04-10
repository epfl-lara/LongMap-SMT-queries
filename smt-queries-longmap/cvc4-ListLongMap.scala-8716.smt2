; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105772 () Bool)

(assert start!105772)

(declare-fun b_free!27335 () Bool)

(declare-fun b_next!27335 () Bool)

(assert (=> start!105772 (= b_free!27335 (not b_next!27335))))

(declare-fun tp!95534 () Bool)

(declare-fun b_and!45231 () Bool)

(assert (=> start!105772 (= tp!95534 b_and!45231)))

(declare-fun b!1259931 () Bool)

(declare-fun e!716844 () Bool)

(declare-fun e!716843 () Bool)

(declare-fun mapRes!50155 () Bool)

(assert (=> b!1259931 (= e!716844 (and e!716843 mapRes!50155))))

(declare-fun condMapEmpty!50155 () Bool)

(declare-datatypes ((V!48347 0))(
  ( (V!48348 (val!16181 Int)) )
))
(declare-datatypes ((ValueCell!15355 0))(
  ( (ValueCellFull!15355 (v!18884 V!48347)) (EmptyCell!15355) )
))
(declare-datatypes ((array!82094 0))(
  ( (array!82095 (arr!39601 (Array (_ BitVec 32) ValueCell!15355)) (size!40137 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82094)

(declare-fun mapDefault!50155 () ValueCell!15355)

