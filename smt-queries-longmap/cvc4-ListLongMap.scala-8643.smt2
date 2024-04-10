; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105180 () Bool)

(assert start!105180)

(declare-fun b_free!26897 () Bool)

(declare-fun b_next!26897 () Bool)

(assert (=> start!105180 (= b_free!26897 (not b_next!26897))))

(declare-fun tp!94196 () Bool)

(declare-fun b_and!44711 () Bool)

(assert (=> start!105180 (= tp!94196 b_and!44711)))

(declare-fun b!1253389 () Bool)

(declare-fun e!712041 () Bool)

(declare-fun tp_is_empty!31799 () Bool)

(assert (=> b!1253389 (= e!712041 tp_is_empty!31799)))

(declare-fun b!1253390 () Bool)

(declare-fun res!835796 () Bool)

(declare-fun e!712040 () Bool)

(assert (=> b!1253390 (=> (not res!835796) (not e!712040))))

(declare-datatypes ((array!81258 0))(
  ( (array!81259 (arr!39191 (Array (_ BitVec 32) (_ BitVec 64))) (size!39727 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81258)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81258 (_ BitVec 32)) Bool)

(assert (=> b!1253390 (= res!835796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49474 () Bool)

(declare-fun mapRes!49474 () Bool)

(declare-fun tp!94195 () Bool)

(declare-fun e!712039 () Bool)

(assert (=> mapNonEmpty!49474 (= mapRes!49474 (and tp!94195 e!712039))))

(declare-datatypes ((V!47763 0))(
  ( (V!47764 (val!15962 Int)) )
))
(declare-datatypes ((ValueCell!15136 0))(
  ( (ValueCellFull!15136 (v!18660 V!47763)) (EmptyCell!15136) )
))
(declare-fun mapValue!49474 () ValueCell!15136)

(declare-datatypes ((array!81260 0))(
  ( (array!81261 (arr!39192 (Array (_ BitVec 32) ValueCell!15136)) (size!39728 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81260)

(declare-fun mapRest!49474 () (Array (_ BitVec 32) ValueCell!15136))

(declare-fun mapKey!49474 () (_ BitVec 32))

(assert (=> mapNonEmpty!49474 (= (arr!39192 _values!914) (store mapRest!49474 mapKey!49474 mapValue!49474))))

(declare-fun b!1253391 () Bool)

(declare-fun e!712038 () Bool)

(assert (=> b!1253391 (= e!712038 true)))

(declare-datatypes ((tuple2!20600 0))(
  ( (tuple2!20601 (_1!10311 (_ BitVec 64)) (_2!10311 V!47763)) )
))
(declare-datatypes ((List!27829 0))(
  ( (Nil!27826) (Cons!27825 (h!29034 tuple2!20600) (t!41310 List!27829)) )
))
(declare-datatypes ((ListLongMap!18473 0))(
  ( (ListLongMap!18474 (toList!9252 List!27829)) )
))
(declare-fun lt!565919 () ListLongMap!18473)

(declare-fun lt!565922 () ListLongMap!18473)

(declare-fun -!2025 (ListLongMap!18473 (_ BitVec 64)) ListLongMap!18473)

(assert (=> b!1253391 (= lt!565919 (-!2025 lt!565922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565920 () ListLongMap!18473)

(declare-fun lt!565923 () ListLongMap!18473)

(assert (=> b!1253391 (= (-!2025 lt!565920 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565923)))

(declare-datatypes ((Unit!41686 0))(
  ( (Unit!41687) )
))
(declare-fun lt!565921 () Unit!41686)

(declare-fun minValueBefore!43 () V!47763)

(declare-fun addThenRemoveForNewKeyIsSame!295 (ListLongMap!18473 (_ BitVec 64) V!47763) Unit!41686)

(assert (=> b!1253391 (= lt!565921 (addThenRemoveForNewKeyIsSame!295 lt!565923 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565926 () ListLongMap!18473)

(declare-fun lt!565924 () ListLongMap!18473)

(assert (=> b!1253391 (and (= lt!565922 lt!565920) (= lt!565924 lt!565926))))

(declare-fun +!4148 (ListLongMap!18473 tuple2!20600) ListLongMap!18473)

(assert (=> b!1253391 (= lt!565920 (+!4148 lt!565923 (tuple2!20601 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun minValueAfter!43 () V!47763)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47763)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4496 (array!81258 array!81260 (_ BitVec 32) (_ BitVec 32) V!47763 V!47763 (_ BitVec 32) Int) ListLongMap!18473)

(assert (=> b!1253391 (= lt!565924 (getCurrentListMap!4496 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253391 (= lt!565922 (getCurrentListMap!4496 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253392 () Bool)

(declare-fun res!835799 () Bool)

(assert (=> b!1253392 (=> (not res!835799) (not e!712040))))

(declare-datatypes ((List!27830 0))(
  ( (Nil!27827) (Cons!27826 (h!29035 (_ BitVec 64)) (t!41311 List!27830)) )
))
(declare-fun arrayNoDuplicates!0 (array!81258 (_ BitVec 32) List!27830) Bool)

(assert (=> b!1253392 (= res!835799 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27827))))

(declare-fun b!1253393 () Bool)

(declare-fun res!835798 () Bool)

(assert (=> b!1253393 (=> (not res!835798) (not e!712040))))

(assert (=> b!1253393 (= res!835798 (and (= (size!39728 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39727 _keys!1118) (size!39728 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253394 () Bool)

(assert (=> b!1253394 (= e!712039 tp_is_empty!31799)))

(declare-fun b!1253395 () Bool)

(assert (=> b!1253395 (= e!712040 (not e!712038))))

(declare-fun res!835797 () Bool)

(assert (=> b!1253395 (=> res!835797 e!712038)))

(assert (=> b!1253395 (= res!835797 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253395 (= lt!565923 lt!565926)))

(declare-fun lt!565925 () Unit!41686)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1007 (array!81258 array!81260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47763 V!47763 V!47763 V!47763 (_ BitVec 32) Int) Unit!41686)

(assert (=> b!1253395 (= lt!565925 (lemmaNoChangeToArrayThenSameMapNoExtras!1007 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5643 (array!81258 array!81260 (_ BitVec 32) (_ BitVec 32) V!47763 V!47763 (_ BitVec 32) Int) ListLongMap!18473)

(assert (=> b!1253395 (= lt!565926 (getCurrentListMapNoExtraKeys!5643 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253395 (= lt!565923 (getCurrentListMapNoExtraKeys!5643 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253396 () Bool)

(declare-fun e!712037 () Bool)

(assert (=> b!1253396 (= e!712037 (and e!712041 mapRes!49474))))

(declare-fun condMapEmpty!49474 () Bool)

(declare-fun mapDefault!49474 () ValueCell!15136)

