; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105890 () Bool)

(assert start!105890)

(declare-fun b_free!27431 () Bool)

(declare-fun b_next!27431 () Bool)

(assert (=> start!105890 (= b_free!27431 (not b_next!27431))))

(declare-fun tp!95825 () Bool)

(declare-fun b_and!45339 () Bool)

(assert (=> start!105890 (= tp!95825 b_and!45339)))

(declare-fun mapIsEmpty!50302 () Bool)

(declare-fun mapRes!50302 () Bool)

(assert (=> mapIsEmpty!50302 mapRes!50302))

(declare-fun b!1261273 () Bool)

(declare-fun res!840478 () Bool)

(declare-fun e!717826 () Bool)

(assert (=> b!1261273 (=> (not res!840478) (not e!717826))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82280 0))(
  ( (array!82281 (arr!39693 (Array (_ BitVec 32) (_ BitVec 64))) (size!40229 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82280)

(declare-datatypes ((V!48475 0))(
  ( (V!48476 (val!16229 Int)) )
))
(declare-datatypes ((ValueCell!15403 0))(
  ( (ValueCellFull!15403 (v!18933 V!48475)) (EmptyCell!15403) )
))
(declare-datatypes ((array!82282 0))(
  ( (array!82283 (arr!39694 (Array (_ BitVec 32) ValueCell!15403)) (size!40230 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82282)

(assert (=> b!1261273 (= res!840478 (and (= (size!40230 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40229 _keys!1118) (size!40230 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840479 () Bool)

(assert (=> start!105890 (=> (not res!840479) (not e!717826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105890 (= res!840479 (validMask!0 mask!1466))))

(assert (=> start!105890 e!717826))

(assert (=> start!105890 true))

(assert (=> start!105890 tp!95825))

(declare-fun tp_is_empty!32333 () Bool)

(assert (=> start!105890 tp_is_empty!32333))

(declare-fun array_inv!30219 (array!82280) Bool)

(assert (=> start!105890 (array_inv!30219 _keys!1118)))

(declare-fun e!717827 () Bool)

(declare-fun array_inv!30220 (array!82282) Bool)

(assert (=> start!105890 (and (array_inv!30220 _values!914) e!717827)))

(declare-fun b!1261274 () Bool)

(declare-fun e!717828 () Bool)

(assert (=> b!1261274 (= e!717828 tp_is_empty!32333)))

(declare-fun b!1261275 () Bool)

(declare-fun e!717830 () Bool)

(assert (=> b!1261275 (= e!717827 (and e!717830 mapRes!50302))))

(declare-fun condMapEmpty!50302 () Bool)

(declare-fun mapDefault!50302 () ValueCell!15403)

