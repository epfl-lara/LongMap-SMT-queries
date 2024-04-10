; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105350 () Bool)

(assert start!105350)

(declare-fun b_free!27023 () Bool)

(declare-fun b_next!27023 () Bool)

(assert (=> start!105350 (= b_free!27023 (not b_next!27023))))

(declare-fun tp!94580 () Bool)

(declare-fun b_and!44861 () Bool)

(assert (=> start!105350 (= tp!94580 b_and!44861)))

(declare-fun b!1255225 () Bool)

(declare-fun res!836860 () Bool)

(declare-fun e!713368 () Bool)

(assert (=> b!1255225 (=> (not res!836860) (not e!713368))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81496 0))(
  ( (array!81497 (arr!39308 (Array (_ BitVec 32) (_ BitVec 64))) (size!39844 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81496)

(declare-datatypes ((V!47931 0))(
  ( (V!47932 (val!16025 Int)) )
))
(declare-datatypes ((ValueCell!15199 0))(
  ( (ValueCellFull!15199 (v!18725 V!47931)) (EmptyCell!15199) )
))
(declare-datatypes ((array!81498 0))(
  ( (array!81499 (arr!39309 (Array (_ BitVec 32) ValueCell!15199)) (size!39845 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81498)

(assert (=> b!1255225 (= res!836860 (and (= (size!39845 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39844 _keys!1118) (size!39845 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255226 () Bool)

(declare-fun e!713364 () Bool)

(declare-fun e!713365 () Bool)

(declare-fun mapRes!49669 () Bool)

(assert (=> b!1255226 (= e!713364 (and e!713365 mapRes!49669))))

(declare-fun condMapEmpty!49669 () Bool)

(declare-fun mapDefault!49669 () ValueCell!15199)

