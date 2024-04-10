; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105396 () Bool)

(assert start!105396)

(declare-fun b_free!27055 () Bool)

(declare-fun b_next!27055 () Bool)

(assert (=> start!105396 (= b_free!27055 (not b_next!27055))))

(declare-fun tp!94679 () Bool)

(declare-fun b_and!44901 () Bool)

(assert (=> start!105396 (= tp!94679 b_and!44901)))

(declare-fun b!1255659 () Bool)

(declare-fun res!837100 () Bool)

(declare-fun e!713677 () Bool)

(assert (=> b!1255659 (=> (not res!837100) (not e!713677))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!81556 0))(
  ( (array!81557 (arr!39337 (Array (_ BitVec 32) (_ BitVec 64))) (size!39873 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81556)

(declare-datatypes ((V!47975 0))(
  ( (V!47976 (val!16041 Int)) )
))
(declare-datatypes ((ValueCell!15215 0))(
  ( (ValueCellFull!15215 (v!18741 V!47975)) (EmptyCell!15215) )
))
(declare-datatypes ((array!81558 0))(
  ( (array!81559 (arr!39338 (Array (_ BitVec 32) ValueCell!15215)) (size!39874 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81558)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255659 (= res!837100 (and (= (size!39874 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39873 _keys!1118) (size!39874 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49720 () Bool)

(declare-fun mapRes!49720 () Bool)

(declare-fun tp!94678 () Bool)

(declare-fun e!713672 () Bool)

(assert (=> mapNonEmpty!49720 (= mapRes!49720 (and tp!94678 e!713672))))

(declare-fun mapRest!49720 () (Array (_ BitVec 32) ValueCell!15215))

(declare-fun mapKey!49720 () (_ BitVec 32))

(declare-fun mapValue!49720 () ValueCell!15215)

(assert (=> mapNonEmpty!49720 (= (arr!39338 _values!914) (store mapRest!49720 mapKey!49720 mapValue!49720))))

(declare-fun res!837098 () Bool)

(assert (=> start!105396 (=> (not res!837098) (not e!713677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105396 (= res!837098 (validMask!0 mask!1466))))

(assert (=> start!105396 e!713677))

(assert (=> start!105396 true))

(assert (=> start!105396 tp!94679))

(declare-fun tp_is_empty!31957 () Bool)

(assert (=> start!105396 tp_is_empty!31957))

(declare-fun array_inv!29973 (array!81556) Bool)

(assert (=> start!105396 (array_inv!29973 _keys!1118)))

(declare-fun e!713676 () Bool)

(declare-fun array_inv!29974 (array!81558) Bool)

(assert (=> start!105396 (and (array_inv!29974 _values!914) e!713676)))

(declare-fun b!1255660 () Bool)

(declare-fun res!837097 () Bool)

(assert (=> b!1255660 (=> (not res!837097) (not e!713677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81556 (_ BitVec 32)) Bool)

(assert (=> b!1255660 (= res!837097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255661 () Bool)

(declare-fun e!713675 () Bool)

(assert (=> b!1255661 (= e!713676 (and e!713675 mapRes!49720))))

(declare-fun condMapEmpty!49720 () Bool)

(declare-fun mapDefault!49720 () ValueCell!15215)

