; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105288 () Bool)

(assert start!105288)

(declare-fun b_free!26983 () Bool)

(declare-fun b_next!26983 () Bool)

(assert (=> start!105288 (= b_free!26983 (not b_next!26983))))

(declare-fun tp!94457 () Bool)

(declare-fun b_and!44809 () Bool)

(assert (=> start!105288 (= tp!94457 b_and!44809)))

(declare-fun b!1254605 () Bool)

(declare-fun res!836522 () Bool)

(declare-fun e!712930 () Bool)

(assert (=> b!1254605 (=> (not res!836522) (not e!712930))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81424 0))(
  ( (array!81425 (arr!39273 (Array (_ BitVec 32) (_ BitVec 64))) (size!39809 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81424)

(declare-datatypes ((V!47879 0))(
  ( (V!47880 (val!16005 Int)) )
))
(declare-datatypes ((ValueCell!15179 0))(
  ( (ValueCellFull!15179 (v!18704 V!47879)) (EmptyCell!15179) )
))
(declare-datatypes ((array!81426 0))(
  ( (array!81427 (arr!39274 (Array (_ BitVec 32) ValueCell!15179)) (size!39810 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81426)

(assert (=> b!1254605 (= res!836522 (and (= (size!39810 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39809 _keys!1118) (size!39810 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49606 () Bool)

(declare-fun mapRes!49606 () Bool)

(assert (=> mapIsEmpty!49606 mapRes!49606))

(declare-fun mapNonEmpty!49606 () Bool)

(declare-fun tp!94456 () Bool)

(declare-fun e!712934 () Bool)

(assert (=> mapNonEmpty!49606 (= mapRes!49606 (and tp!94456 e!712934))))

(declare-fun mapValue!49606 () ValueCell!15179)

(declare-fun mapRest!49606 () (Array (_ BitVec 32) ValueCell!15179))

(declare-fun mapKey!49606 () (_ BitVec 32))

(assert (=> mapNonEmpty!49606 (= (arr!39274 _values!914) (store mapRest!49606 mapKey!49606 mapValue!49606))))

(declare-fun b!1254606 () Bool)

(declare-fun res!836523 () Bool)

(assert (=> b!1254606 (=> (not res!836523) (not e!712930))))

(declare-datatypes ((List!27895 0))(
  ( (Nil!27892) (Cons!27891 (h!29100 (_ BitVec 64)) (t!41378 List!27895)) )
))
(declare-fun arrayNoDuplicates!0 (array!81424 (_ BitVec 32) List!27895) Bool)

(assert (=> b!1254606 (= res!836523 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27892))))

(declare-fun b!1254608 () Bool)

(declare-fun e!712933 () Bool)

(assert (=> b!1254608 (= e!712933 true)))

(declare-datatypes ((tuple2!20670 0))(
  ( (tuple2!20671 (_1!10346 (_ BitVec 64)) (_2!10346 V!47879)) )
))
(declare-datatypes ((List!27896 0))(
  ( (Nil!27893) (Cons!27892 (h!29101 tuple2!20670) (t!41379 List!27896)) )
))
(declare-datatypes ((ListLongMap!18543 0))(
  ( (ListLongMap!18544 (toList!9287 List!27896)) )
))
(declare-fun lt!567089 () ListLongMap!18543)

(declare-fun lt!567092 () ListLongMap!18543)

(declare-fun -!2058 (ListLongMap!18543 (_ BitVec 64)) ListLongMap!18543)

(assert (=> b!1254608 (= lt!567089 (-!2058 lt!567092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567091 () ListLongMap!18543)

(declare-fun lt!567096 () ListLongMap!18543)

(assert (=> b!1254608 (= (-!2058 lt!567091 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567096)))

(declare-datatypes ((Unit!41758 0))(
  ( (Unit!41759) )
))
(declare-fun lt!567093 () Unit!41758)

(declare-fun minValueBefore!43 () V!47879)

(declare-fun addThenRemoveForNewKeyIsSame!328 (ListLongMap!18543 (_ BitVec 64) V!47879) Unit!41758)

(assert (=> b!1254608 (= lt!567093 (addThenRemoveForNewKeyIsSame!328 lt!567096 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567094 () ListLongMap!18543)

(declare-fun lt!567090 () ListLongMap!18543)

(assert (=> b!1254608 (and (= lt!567092 lt!567091) (= lt!567094 lt!567090))))

(declare-fun +!4181 (ListLongMap!18543 tuple2!20670) ListLongMap!18543)

(assert (=> b!1254608 (= lt!567091 (+!4181 lt!567096 (tuple2!20671 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47879)

(declare-fun zeroValue!871 () V!47879)

(declare-fun getCurrentListMap!4529 (array!81424 array!81426 (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 (_ BitVec 32) Int) ListLongMap!18543)

(assert (=> b!1254608 (= lt!567094 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254608 (= lt!567092 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254609 () Bool)

(declare-fun res!836525 () Bool)

(assert (=> b!1254609 (=> (not res!836525) (not e!712930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81424 (_ BitVec 32)) Bool)

(assert (=> b!1254609 (= res!836525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254610 () Bool)

(declare-fun e!712932 () Bool)

(declare-fun e!712929 () Bool)

(assert (=> b!1254610 (= e!712932 (and e!712929 mapRes!49606))))

(declare-fun condMapEmpty!49606 () Bool)

(declare-fun mapDefault!49606 () ValueCell!15179)

