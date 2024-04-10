; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105356 () Bool)

(assert start!105356)

(declare-fun b_free!27029 () Bool)

(declare-fun b_next!27029 () Bool)

(assert (=> start!105356 (= b_free!27029 (not b_next!27029))))

(declare-fun tp!94597 () Bool)

(declare-fun b_and!44867 () Bool)

(assert (=> start!105356 (= tp!94597 b_and!44867)))

(declare-fun b!1255288 () Bool)

(declare-fun res!836898 () Bool)

(declare-fun e!713409 () Bool)

(assert (=> b!1255288 (=> (not res!836898) (not e!713409))))

(declare-datatypes ((array!81508 0))(
  ( (array!81509 (arr!39314 (Array (_ BitVec 32) (_ BitVec 64))) (size!39850 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81508)

(declare-datatypes ((List!27920 0))(
  ( (Nil!27917) (Cons!27916 (h!29125 (_ BitVec 64)) (t!41405 List!27920)) )
))
(declare-fun arrayNoDuplicates!0 (array!81508 (_ BitVec 32) List!27920) Bool)

(assert (=> b!1255288 (= res!836898 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27917))))

(declare-fun mapIsEmpty!49678 () Bool)

(declare-fun mapRes!49678 () Bool)

(assert (=> mapIsEmpty!49678 mapRes!49678))

(declare-fun b!1255289 () Bool)

(declare-fun e!713410 () Bool)

(declare-fun tp_is_empty!31931 () Bool)

(assert (=> b!1255289 (= e!713410 tp_is_empty!31931)))

(declare-fun b!1255290 () Bool)

(declare-fun res!836896 () Bool)

(assert (=> b!1255290 (=> (not res!836896) (not e!713409))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81508 (_ BitVec 32)) Bool)

(assert (=> b!1255290 (= res!836896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255292 () Bool)

(declare-fun e!713412 () Bool)

(assert (=> b!1255292 (= e!713412 tp_is_empty!31931)))

(declare-fun res!836899 () Bool)

(assert (=> start!105356 (=> (not res!836899) (not e!713409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105356 (= res!836899 (validMask!0 mask!1466))))

(assert (=> start!105356 e!713409))

(assert (=> start!105356 true))

(assert (=> start!105356 tp!94597))

(assert (=> start!105356 tp_is_empty!31931))

(declare-fun array_inv!29959 (array!81508) Bool)

(assert (=> start!105356 (array_inv!29959 _keys!1118)))

(declare-datatypes ((V!47939 0))(
  ( (V!47940 (val!16028 Int)) )
))
(declare-datatypes ((ValueCell!15202 0))(
  ( (ValueCellFull!15202 (v!18728 V!47939)) (EmptyCell!15202) )
))
(declare-datatypes ((array!81510 0))(
  ( (array!81511 (arr!39315 (Array (_ BitVec 32) ValueCell!15202)) (size!39851 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81510)

(declare-fun e!713411 () Bool)

(declare-fun array_inv!29960 (array!81510) Bool)

(assert (=> start!105356 (and (array_inv!29960 _values!914) e!713411)))

(declare-fun b!1255291 () Bool)

(declare-fun res!836897 () Bool)

(assert (=> b!1255291 (=> (not res!836897) (not e!713409))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255291 (= res!836897 (and (= (size!39851 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39850 _keys!1118) (size!39851 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255293 () Bool)

(assert (=> b!1255293 (= e!713411 (and e!713410 mapRes!49678))))

(declare-fun condMapEmpty!49678 () Bool)

(declare-fun mapDefault!49678 () ValueCell!15202)

