; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104986 () Bool)

(assert start!104986)

(declare-fun b_free!26755 () Bool)

(declare-fun b_next!26755 () Bool)

(assert (=> start!104986 (= b_free!26755 (not b_next!26755))))

(declare-fun tp!93761 () Bool)

(declare-fun b_and!44541 () Bool)

(assert (=> start!104986 (= tp!93761 b_and!44541)))

(declare-fun b!1251342 () Bool)

(declare-fun res!834627 () Bool)

(declare-fun e!710560 () Bool)

(assert (=> b!1251342 (=> (not res!834627) (not e!710560))))

(declare-datatypes ((array!80978 0))(
  ( (array!80979 (arr!39054 (Array (_ BitVec 32) (_ BitVec 64))) (size!39590 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80978)

(declare-datatypes ((List!27721 0))(
  ( (Nil!27718) (Cons!27717 (h!28926 (_ BitVec 64)) (t!41196 List!27721)) )
))
(declare-fun arrayNoDuplicates!0 (array!80978 (_ BitVec 32) List!27721) Bool)

(assert (=> b!1251342 (= res!834627 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27718))))

(declare-fun mapIsEmpty!49252 () Bool)

(declare-fun mapRes!49252 () Bool)

(assert (=> mapIsEmpty!49252 mapRes!49252))

(declare-fun b!1251343 () Bool)

(declare-fun e!710558 () Bool)

(declare-fun e!710559 () Bool)

(assert (=> b!1251343 (= e!710558 (and e!710559 mapRes!49252))))

(declare-fun condMapEmpty!49252 () Bool)

(declare-datatypes ((V!47575 0))(
  ( (V!47576 (val!15891 Int)) )
))
(declare-datatypes ((ValueCell!15065 0))(
  ( (ValueCellFull!15065 (v!18588 V!47575)) (EmptyCell!15065) )
))
(declare-datatypes ((array!80980 0))(
  ( (array!80981 (arr!39055 (Array (_ BitVec 32) ValueCell!15065)) (size!39591 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80980)

(declare-fun mapDefault!49252 () ValueCell!15065)

