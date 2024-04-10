; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108102 () Bool)

(assert start!108102)

(declare-fun b_free!27815 () Bool)

(declare-fun b_next!27815 () Bool)

(assert (=> start!108102 (= b_free!27815 (not b_next!27815))))

(declare-fun tp!98398 () Bool)

(declare-fun b_and!45871 () Bool)

(assert (=> start!108102 (= tp!98398 b_and!45871)))

(declare-fun b!1276628 () Bool)

(declare-fun e!729017 () Bool)

(declare-fun e!729018 () Bool)

(declare-fun mapRes!51578 () Bool)

(assert (=> b!1276628 (= e!729017 (and e!729018 mapRes!51578))))

(declare-fun condMapEmpty!51578 () Bool)

(declare-datatypes ((V!49589 0))(
  ( (V!49590 (val!16757 Int)) )
))
(declare-datatypes ((ValueCell!15784 0))(
  ( (ValueCellFull!15784 (v!19354 V!49589)) (EmptyCell!15784) )
))
(declare-datatypes ((array!83824 0))(
  ( (array!83825 (arr!40423 (Array (_ BitVec 32) ValueCell!15784)) (size!40973 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83824)

(declare-fun mapDefault!51578 () ValueCell!15784)

