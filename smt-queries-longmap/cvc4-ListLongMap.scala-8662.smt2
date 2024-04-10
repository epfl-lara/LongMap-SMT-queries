; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105338 () Bool)

(assert start!105338)

(declare-fun b_free!27011 () Bool)

(declare-fun b_next!27011 () Bool)

(assert (=> start!105338 (= b_free!27011 (not b_next!27011))))

(declare-fun tp!94543 () Bool)

(declare-fun b_and!44849 () Bool)

(assert (=> start!105338 (= tp!94543 b_and!44849)))

(declare-fun b!1255099 () Bool)

(declare-fun res!836790 () Bool)

(declare-fun e!713278 () Bool)

(assert (=> b!1255099 (=> (not res!836790) (not e!713278))))

(declare-datatypes ((array!81476 0))(
  ( (array!81477 (arr!39298 (Array (_ BitVec 32) (_ BitVec 64))) (size!39834 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81476)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81476 (_ BitVec 32)) Bool)

(assert (=> b!1255099 (= res!836790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255100 () Bool)

(declare-fun res!836789 () Bool)

(assert (=> b!1255100 (=> (not res!836789) (not e!713278))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47915 0))(
  ( (V!47916 (val!16019 Int)) )
))
(declare-datatypes ((ValueCell!15193 0))(
  ( (ValueCellFull!15193 (v!18719 V!47915)) (EmptyCell!15193) )
))
(declare-datatypes ((array!81478 0))(
  ( (array!81479 (arr!39299 (Array (_ BitVec 32) ValueCell!15193)) (size!39835 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81478)

(assert (=> b!1255100 (= res!836789 (and (= (size!39835 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39834 _keys!1118) (size!39835 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255101 () Bool)

(declare-fun e!713276 () Bool)

(declare-fun tp_is_empty!31913 () Bool)

(assert (=> b!1255101 (= e!713276 tp_is_empty!31913)))

(declare-fun mapNonEmpty!49651 () Bool)

(declare-fun mapRes!49651 () Bool)

(declare-fun tp!94544 () Bool)

(assert (=> mapNonEmpty!49651 (= mapRes!49651 (and tp!94544 e!713276))))

(declare-fun mapKey!49651 () (_ BitVec 32))

(declare-fun mapValue!49651 () ValueCell!15193)

(declare-fun mapRest!49651 () (Array (_ BitVec 32) ValueCell!15193))

(assert (=> mapNonEmpty!49651 (= (arr!39299 _values!914) (store mapRest!49651 mapKey!49651 mapValue!49651))))

(declare-fun b!1255102 () Bool)

(declare-fun e!713277 () Bool)

(declare-fun e!713275 () Bool)

(assert (=> b!1255102 (= e!713277 (and e!713275 mapRes!49651))))

(declare-fun condMapEmpty!49651 () Bool)

(declare-fun mapDefault!49651 () ValueCell!15193)

