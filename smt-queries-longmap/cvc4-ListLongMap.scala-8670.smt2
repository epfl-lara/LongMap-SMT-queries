; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105400 () Bool)

(assert start!105400)

(declare-fun b_free!27059 () Bool)

(declare-fun b_next!27059 () Bool)

(assert (=> start!105400 (= b_free!27059 (not b_next!27059))))

(declare-fun tp!94691 () Bool)

(declare-fun b_and!44905 () Bool)

(assert (=> start!105400 (= tp!94691 b_and!44905)))

(declare-fun b!1255713 () Bool)

(declare-fun res!837133 () Bool)

(declare-fun e!713718 () Bool)

(assert (=> b!1255713 (=> (not res!837133) (not e!713718))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81564 0))(
  ( (array!81565 (arr!39341 (Array (_ BitVec 32) (_ BitVec 64))) (size!39877 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81564)

(declare-datatypes ((V!47979 0))(
  ( (V!47980 (val!16043 Int)) )
))
(declare-datatypes ((ValueCell!15217 0))(
  ( (ValueCellFull!15217 (v!18743 V!47979)) (EmptyCell!15217) )
))
(declare-datatypes ((array!81566 0))(
  ( (array!81567 (arr!39342 (Array (_ BitVec 32) ValueCell!15217)) (size!39878 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81566)

(assert (=> b!1255713 (= res!837133 (and (= (size!39878 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39877 _keys!1118) (size!39878 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49726 () Bool)

(declare-fun mapRes!49726 () Bool)

(assert (=> mapIsEmpty!49726 mapRes!49726))

(declare-fun b!1255714 () Bool)

(declare-fun e!713715 () Bool)

(declare-fun e!713714 () Bool)

(assert (=> b!1255714 (= e!713715 (and e!713714 mapRes!49726))))

(declare-fun condMapEmpty!49726 () Bool)

(declare-fun mapDefault!49726 () ValueCell!15217)

