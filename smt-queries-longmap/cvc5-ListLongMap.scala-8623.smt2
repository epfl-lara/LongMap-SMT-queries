; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105026 () Bool)

(assert start!105026)

(declare-fun b_free!26773 () Bool)

(declare-fun b_next!26773 () Bool)

(assert (=> start!105026 (= b_free!26773 (not b_next!26773))))

(declare-fun tp!93817 () Bool)

(declare-fun b_and!44569 () Bool)

(assert (=> start!105026 (= tp!93817 b_and!44569)))

(declare-fun b!1251738 () Bool)

(declare-fun res!834848 () Bool)

(declare-fun e!710841 () Bool)

(assert (=> b!1251738 (=> (not res!834848) (not e!710841))))

(declare-datatypes ((array!81016 0))(
  ( (array!81017 (arr!39072 (Array (_ BitVec 32) (_ BitVec 64))) (size!39608 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81016)

(declare-datatypes ((List!27735 0))(
  ( (Nil!27732) (Cons!27731 (h!28940 (_ BitVec 64)) (t!41212 List!27735)) )
))
(declare-fun arrayNoDuplicates!0 (array!81016 (_ BitVec 32) List!27735) Bool)

(assert (=> b!1251738 (= res!834848 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27732))))

(declare-fun b!1251739 () Bool)

(declare-fun res!834849 () Bool)

(assert (=> b!1251739 (=> (not res!834849) (not e!710841))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81016 (_ BitVec 32)) Bool)

(assert (=> b!1251739 (= res!834849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251740 () Bool)

(declare-fun res!834847 () Bool)

(assert (=> b!1251740 (=> (not res!834847) (not e!710841))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47599 0))(
  ( (V!47600 (val!15900 Int)) )
))
(declare-datatypes ((ValueCell!15074 0))(
  ( (ValueCellFull!15074 (v!18598 V!47599)) (EmptyCell!15074) )
))
(declare-datatypes ((array!81018 0))(
  ( (array!81019 (arr!39073 (Array (_ BitVec 32) ValueCell!15074)) (size!39609 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81018)

(assert (=> b!1251740 (= res!834847 (and (= (size!39609 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39608 _keys!1118) (size!39609 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49282 () Bool)

(declare-fun mapRes!49282 () Bool)

(declare-fun tp!93818 () Bool)

(declare-fun e!710845 () Bool)

(assert (=> mapNonEmpty!49282 (= mapRes!49282 (and tp!93818 e!710845))))

(declare-fun mapKey!49282 () (_ BitVec 32))

(declare-fun mapRest!49282 () (Array (_ BitVec 32) ValueCell!15074))

(declare-fun mapValue!49282 () ValueCell!15074)

(assert (=> mapNonEmpty!49282 (= (arr!39073 _values!914) (store mapRest!49282 mapKey!49282 mapValue!49282))))

(declare-fun b!1251741 () Bool)

(assert (=> b!1251741 (= e!710841 (not true))))

(declare-datatypes ((tuple2!20504 0))(
  ( (tuple2!20505 (_1!10263 (_ BitVec 64)) (_2!10263 V!47599)) )
))
(declare-datatypes ((List!27736 0))(
  ( (Nil!27733) (Cons!27732 (h!28941 tuple2!20504) (t!41213 List!27736)) )
))
(declare-datatypes ((ListLongMap!18377 0))(
  ( (ListLongMap!18378 (toList!9204 List!27736)) )
))
(declare-fun lt!565024 () ListLongMap!18377)

(declare-fun lt!565023 () ListLongMap!18377)

(assert (=> b!1251741 (= lt!565024 lt!565023)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41597 0))(
  ( (Unit!41598) )
))
(declare-fun lt!565022 () Unit!41597)

(declare-fun minValueAfter!43 () V!47599)

(declare-fun zeroValue!871 () V!47599)

(declare-fun minValueBefore!43 () V!47599)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!964 (array!81016 array!81018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 V!47599 V!47599 (_ BitVec 32) Int) Unit!41597)

(assert (=> b!1251741 (= lt!565022 (lemmaNoChangeToArrayThenSameMapNoExtras!964 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5600 (array!81016 array!81018 (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 (_ BitVec 32) Int) ListLongMap!18377)

(assert (=> b!1251741 (= lt!565023 (getCurrentListMapNoExtraKeys!5600 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251741 (= lt!565024 (getCurrentListMapNoExtraKeys!5600 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834846 () Bool)

(assert (=> start!105026 (=> (not res!834846) (not e!710841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105026 (= res!834846 (validMask!0 mask!1466))))

(assert (=> start!105026 e!710841))

(assert (=> start!105026 true))

(assert (=> start!105026 tp!93817))

(declare-fun tp_is_empty!31675 () Bool)

(assert (=> start!105026 tp_is_empty!31675))

(declare-fun array_inv!29801 (array!81016) Bool)

(assert (=> start!105026 (array_inv!29801 _keys!1118)))

(declare-fun e!710843 () Bool)

(declare-fun array_inv!29802 (array!81018) Bool)

(assert (=> start!105026 (and (array_inv!29802 _values!914) e!710843)))

(declare-fun b!1251742 () Bool)

(declare-fun e!710842 () Bool)

(assert (=> b!1251742 (= e!710843 (and e!710842 mapRes!49282))))

(declare-fun condMapEmpty!49282 () Bool)

(declare-fun mapDefault!49282 () ValueCell!15074)

