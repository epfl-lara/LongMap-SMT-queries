; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105030 () Bool)

(assert start!105030)

(declare-fun b_free!26777 () Bool)

(declare-fun b_next!26777 () Bool)

(assert (=> start!105030 (= b_free!26777 (not b_next!26777))))

(declare-fun tp!93830 () Bool)

(declare-fun b_and!44573 () Bool)

(assert (=> start!105030 (= tp!93830 b_and!44573)))

(declare-fun b!1251780 () Bool)

(declare-fun res!834873 () Bool)

(declare-fun e!710872 () Bool)

(assert (=> b!1251780 (=> (not res!834873) (not e!710872))))

(declare-datatypes ((array!81024 0))(
  ( (array!81025 (arr!39076 (Array (_ BitVec 32) (_ BitVec 64))) (size!39612 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81024)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81024 (_ BitVec 32)) Bool)

(assert (=> b!1251780 (= res!834873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251781 () Bool)

(declare-fun res!834870 () Bool)

(assert (=> b!1251781 (=> (not res!834870) (not e!710872))))

(declare-datatypes ((List!27739 0))(
  ( (Nil!27736) (Cons!27735 (h!28944 (_ BitVec 64)) (t!41216 List!27739)) )
))
(declare-fun arrayNoDuplicates!0 (array!81024 (_ BitVec 32) List!27739) Bool)

(assert (=> b!1251781 (= res!834870 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27736))))

(declare-fun b!1251782 () Bool)

(declare-fun e!710874 () Bool)

(declare-fun tp_is_empty!31679 () Bool)

(assert (=> b!1251782 (= e!710874 tp_is_empty!31679)))

(declare-fun mapIsEmpty!49288 () Bool)

(declare-fun mapRes!49288 () Bool)

(assert (=> mapIsEmpty!49288 mapRes!49288))

(declare-fun b!1251783 () Bool)

(declare-fun res!834872 () Bool)

(assert (=> b!1251783 (=> (not res!834872) (not e!710872))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47603 0))(
  ( (V!47604 (val!15902 Int)) )
))
(declare-datatypes ((ValueCell!15076 0))(
  ( (ValueCellFull!15076 (v!18600 V!47603)) (EmptyCell!15076) )
))
(declare-datatypes ((array!81026 0))(
  ( (array!81027 (arr!39077 (Array (_ BitVec 32) ValueCell!15076)) (size!39613 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81026)

(assert (=> b!1251783 (= res!834872 (and (= (size!39613 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39612 _keys!1118) (size!39613 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251784 () Bool)

(declare-fun e!710875 () Bool)

(assert (=> b!1251784 (= e!710875 tp_is_empty!31679)))

(declare-fun mapNonEmpty!49288 () Bool)

(declare-fun tp!93829 () Bool)

(assert (=> mapNonEmpty!49288 (= mapRes!49288 (and tp!93829 e!710874))))

(declare-fun mapKey!49288 () (_ BitVec 32))

(declare-fun mapValue!49288 () ValueCell!15076)

(declare-fun mapRest!49288 () (Array (_ BitVec 32) ValueCell!15076))

(assert (=> mapNonEmpty!49288 (= (arr!39077 _values!914) (store mapRest!49288 mapKey!49288 mapValue!49288))))

(declare-fun res!834871 () Bool)

(assert (=> start!105030 (=> (not res!834871) (not e!710872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105030 (= res!834871 (validMask!0 mask!1466))))

(assert (=> start!105030 e!710872))

(assert (=> start!105030 true))

(assert (=> start!105030 tp!93830))

(assert (=> start!105030 tp_is_empty!31679))

(declare-fun array_inv!29805 (array!81024) Bool)

(assert (=> start!105030 (array_inv!29805 _keys!1118)))

(declare-fun e!710873 () Bool)

(declare-fun array_inv!29806 (array!81026) Bool)

(assert (=> start!105030 (and (array_inv!29806 _values!914) e!710873)))

(declare-fun b!1251785 () Bool)

(assert (=> b!1251785 (= e!710873 (and e!710875 mapRes!49288))))

(declare-fun condMapEmpty!49288 () Bool)

(declare-fun mapDefault!49288 () ValueCell!15076)

