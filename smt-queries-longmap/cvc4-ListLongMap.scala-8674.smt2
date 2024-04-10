; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105424 () Bool)

(assert start!105424)

(declare-fun b_free!27083 () Bool)

(declare-fun b_next!27083 () Bool)

(assert (=> start!105424 (= b_free!27083 (not b_next!27083))))

(declare-fun tp!94763 () Bool)

(declare-fun b_and!44929 () Bool)

(assert (=> start!105424 (= tp!94763 b_and!44929)))

(declare-fun b!1256037 () Bool)

(declare-fun e!713966 () Bool)

(declare-fun tp_is_empty!31985 () Bool)

(assert (=> b!1256037 (= e!713966 tp_is_empty!31985)))

(declare-fun b!1256039 () Bool)

(declare-fun e!713967 () Bool)

(declare-fun e!713968 () Bool)

(assert (=> b!1256039 (= e!713967 e!713968)))

(declare-fun res!837348 () Bool)

(assert (=> b!1256039 (=> res!837348 e!713968)))

(declare-datatypes ((V!48011 0))(
  ( (V!48012 (val!16055 Int)) )
))
(declare-datatypes ((tuple2!20738 0))(
  ( (tuple2!20739 (_1!10380 (_ BitVec 64)) (_2!10380 V!48011)) )
))
(declare-datatypes ((List!27956 0))(
  ( (Nil!27953) (Cons!27952 (h!29161 tuple2!20738) (t!41443 List!27956)) )
))
(declare-datatypes ((ListLongMap!18611 0))(
  ( (ListLongMap!18612 (toList!9321 List!27956)) )
))
(declare-fun lt!567896 () ListLongMap!18611)

(declare-fun contains!7538 (ListLongMap!18611 (_ BitVec 64)) Bool)

(assert (=> b!1256039 (= res!837348 (contains!7538 lt!567896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48011)

(declare-datatypes ((array!81612 0))(
  ( (array!81613 (arr!39365 (Array (_ BitVec 32) (_ BitVec 64))) (size!39901 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81612)

(declare-datatypes ((ValueCell!15229 0))(
  ( (ValueCellFull!15229 (v!18755 V!48011)) (EmptyCell!15229) )
))
(declare-datatypes ((array!81614 0))(
  ( (array!81615 (arr!39366 (Array (_ BitVec 32) ValueCell!15229)) (size!39902 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81614)

(declare-fun minValueBefore!43 () V!48011)

(declare-fun getCurrentListMap!4544 (array!81612 array!81614 (_ BitVec 32) (_ BitVec 32) V!48011 V!48011 (_ BitVec 32) Int) ListLongMap!18611)

(assert (=> b!1256039 (= lt!567896 (getCurrentListMap!4544 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256040 () Bool)

(declare-fun res!837349 () Bool)

(declare-fun e!713970 () Bool)

(assert (=> b!1256040 (=> (not res!837349) (not e!713970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81612 (_ BitVec 32)) Bool)

(assert (=> b!1256040 (= res!837349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49762 () Bool)

(declare-fun mapRes!49762 () Bool)

(assert (=> mapIsEmpty!49762 mapRes!49762))

(declare-fun b!1256041 () Bool)

(declare-fun res!837350 () Bool)

(assert (=> b!1256041 (=> (not res!837350) (not e!713970))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256041 (= res!837350 (and (= (size!39902 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39901 _keys!1118) (size!39902 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256038 () Bool)

(assert (=> b!1256038 (= e!713970 (not e!713967))))

(declare-fun res!837351 () Bool)

(assert (=> b!1256038 (=> res!837351 e!713967)))

(assert (=> b!1256038 (= res!837351 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567895 () ListLongMap!18611)

(declare-fun lt!567898 () ListLongMap!18611)

(assert (=> b!1256038 (= lt!567895 lt!567898)))

(declare-fun minValueAfter!43 () V!48011)

(declare-datatypes ((Unit!41826 0))(
  ( (Unit!41827) )
))
(declare-fun lt!567897 () Unit!41826)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1068 (array!81612 array!81614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48011 V!48011 V!48011 V!48011 (_ BitVec 32) Int) Unit!41826)

(assert (=> b!1256038 (= lt!567897 (lemmaNoChangeToArrayThenSameMapNoExtras!1068 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5704 (array!81612 array!81614 (_ BitVec 32) (_ BitVec 32) V!48011 V!48011 (_ BitVec 32) Int) ListLongMap!18611)

(assert (=> b!1256038 (= lt!567898 (getCurrentListMapNoExtraKeys!5704 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256038 (= lt!567895 (getCurrentListMapNoExtraKeys!5704 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837353 () Bool)

(assert (=> start!105424 (=> (not res!837353) (not e!713970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105424 (= res!837353 (validMask!0 mask!1466))))

(assert (=> start!105424 e!713970))

(assert (=> start!105424 true))

(assert (=> start!105424 tp!94763))

(assert (=> start!105424 tp_is_empty!31985))

(declare-fun array_inv!29991 (array!81612) Bool)

(assert (=> start!105424 (array_inv!29991 _keys!1118)))

(declare-fun e!713972 () Bool)

(declare-fun array_inv!29992 (array!81614) Bool)

(assert (=> start!105424 (and (array_inv!29992 _values!914) e!713972)))

(declare-fun b!1256042 () Bool)

(assert (=> b!1256042 (= e!713968 true)))

(declare-fun -!2073 (ListLongMap!18611 (_ BitVec 64)) ListLongMap!18611)

(assert (=> b!1256042 (= (-!2073 lt!567896 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567896)))

(declare-fun lt!567894 () Unit!41826)

(declare-fun removeNotPresentStillSame!126 (ListLongMap!18611 (_ BitVec 64)) Unit!41826)

(assert (=> b!1256042 (= lt!567894 (removeNotPresentStillSame!126 lt!567896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256043 () Bool)

(declare-fun e!713971 () Bool)

(assert (=> b!1256043 (= e!713972 (and e!713971 mapRes!49762))))

(declare-fun condMapEmpty!49762 () Bool)

(declare-fun mapDefault!49762 () ValueCell!15229)

