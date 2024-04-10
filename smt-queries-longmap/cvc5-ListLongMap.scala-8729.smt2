; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105868 () Bool)

(assert start!105868)

(declare-fun b_free!27409 () Bool)

(declare-fun b_next!27409 () Bool)

(assert (=> start!105868 (= b_free!27409 (not b_next!27409))))

(declare-fun tp!95759 () Bool)

(declare-fun b_and!45317 () Bool)

(assert (=> start!105868 (= tp!95759 b_and!45317)))

(declare-fun res!840349 () Bool)

(declare-fun e!717663 () Bool)

(assert (=> start!105868 (=> (not res!840349) (not e!717663))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105868 (= res!840349 (validMask!0 mask!1466))))

(assert (=> start!105868 e!717663))

(assert (=> start!105868 true))

(assert (=> start!105868 tp!95759))

(declare-fun tp_is_empty!32311 () Bool)

(assert (=> start!105868 tp_is_empty!32311))

(declare-datatypes ((array!82236 0))(
  ( (array!82237 (arr!39671 (Array (_ BitVec 32) (_ BitVec 64))) (size!40207 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82236)

(declare-fun array_inv!30201 (array!82236) Bool)

(assert (=> start!105868 (array_inv!30201 _keys!1118)))

(declare-datatypes ((V!48447 0))(
  ( (V!48448 (val!16218 Int)) )
))
(declare-datatypes ((ValueCell!15392 0))(
  ( (ValueCellFull!15392 (v!18922 V!48447)) (EmptyCell!15392) )
))
(declare-datatypes ((array!82238 0))(
  ( (array!82239 (arr!39672 (Array (_ BitVec 32) ValueCell!15392)) (size!40208 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82238)

(declare-fun e!717661 () Bool)

(declare-fun array_inv!30202 (array!82238) Bool)

(assert (=> start!105868 (and (array_inv!30202 _values!914) e!717661)))

(declare-fun b!1261042 () Bool)

(declare-fun e!717665 () Bool)

(declare-fun mapRes!50269 () Bool)

(assert (=> b!1261042 (= e!717661 (and e!717665 mapRes!50269))))

(declare-fun condMapEmpty!50269 () Bool)

(declare-fun mapDefault!50269 () ValueCell!15392)

