; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105172 () Bool)

(assert start!105172)

(declare-fun b_free!26893 () Bool)

(declare-fun b_next!26893 () Bool)

(assert (=> start!105172 (= b_free!26893 (not b_next!26893))))

(declare-fun tp!94183 () Bool)

(declare-fun b_and!44689 () Bool)

(assert (=> start!105172 (= tp!94183 b_and!44689)))

(declare-fun b!1253259 () Bool)

(declare-fun res!835727 () Bool)

(declare-fun e!711958 () Bool)

(assert (=> b!1253259 (=> (not res!835727) (not e!711958))))

(declare-datatypes ((array!81177 0))(
  ( (array!81178 (arr!39151 (Array (_ BitVec 32) (_ BitVec 64))) (size!39689 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81177)

(declare-datatypes ((List!27898 0))(
  ( (Nil!27895) (Cons!27894 (h!29103 (_ BitVec 64)) (t!41370 List!27898)) )
))
(declare-fun arrayNoDuplicates!0 (array!81177 (_ BitVec 32) List!27898) Bool)

(assert (=> b!1253259 (= res!835727 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27895))))

(declare-fun res!835725 () Bool)

(assert (=> start!105172 (=> (not res!835725) (not e!711958))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105172 (= res!835725 (validMask!0 mask!1466))))

(assert (=> start!105172 e!711958))

(assert (=> start!105172 true))

(assert (=> start!105172 tp!94183))

(declare-fun tp_is_empty!31795 () Bool)

(assert (=> start!105172 tp_is_empty!31795))

(declare-fun array_inv!29977 (array!81177) Bool)

(assert (=> start!105172 (array_inv!29977 _keys!1118)))

(declare-datatypes ((V!47759 0))(
  ( (V!47760 (val!15960 Int)) )
))
(declare-datatypes ((ValueCell!15134 0))(
  ( (ValueCellFull!15134 (v!18657 V!47759)) (EmptyCell!15134) )
))
(declare-datatypes ((array!81179 0))(
  ( (array!81180 (arr!39152 (Array (_ BitVec 32) ValueCell!15134)) (size!39690 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81179)

(declare-fun e!711960 () Bool)

(declare-fun array_inv!29978 (array!81179) Bool)

(assert (=> start!105172 (and (array_inv!29978 _values!914) e!711960)))

(declare-fun b!1253260 () Bool)

(declare-fun e!711959 () Bool)

(assert (=> b!1253260 (= e!711959 tp_is_empty!31795)))

(declare-fun b!1253261 () Bool)

(declare-fun res!835729 () Bool)

(assert (=> b!1253261 (=> (not res!835729) (not e!711958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81177 (_ BitVec 32)) Bool)

(assert (=> b!1253261 (= res!835729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253262 () Bool)

(declare-fun res!835728 () Bool)

(assert (=> b!1253262 (=> (not res!835728) (not e!711958))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253262 (= res!835728 (and (= (size!39690 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39689 _keys!1118) (size!39690 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253263 () Bool)

(declare-fun e!711957 () Bool)

(assert (=> b!1253263 (= e!711958 (not e!711957))))

(declare-fun res!835726 () Bool)

(assert (=> b!1253263 (=> res!835726 e!711957)))

(assert (=> b!1253263 (= res!835726 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20684 0))(
  ( (tuple2!20685 (_1!10353 (_ BitVec 64)) (_2!10353 V!47759)) )
))
(declare-datatypes ((List!27899 0))(
  ( (Nil!27896) (Cons!27895 (h!29104 tuple2!20684) (t!41371 List!27899)) )
))
(declare-datatypes ((ListLongMap!18557 0))(
  ( (ListLongMap!18558 (toList!9294 List!27899)) )
))
(declare-fun lt!565695 () ListLongMap!18557)

(declare-fun lt!565699 () ListLongMap!18557)

(assert (=> b!1253263 (= lt!565695 lt!565699)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47759)

(declare-fun zeroValue!871 () V!47759)

(declare-fun minValueBefore!43 () V!47759)

(declare-datatypes ((Unit!41551 0))(
  ( (Unit!41552) )
))
(declare-fun lt!565694 () Unit!41551)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1017 (array!81177 array!81179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 V!47759 V!47759 (_ BitVec 32) Int) Unit!41551)

(assert (=> b!1253263 (= lt!565694 (lemmaNoChangeToArrayThenSameMapNoExtras!1017 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5695 (array!81177 array!81179 (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 (_ BitVec 32) Int) ListLongMap!18557)

(assert (=> b!1253263 (= lt!565699 (getCurrentListMapNoExtraKeys!5695 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253263 (= lt!565695 (getCurrentListMapNoExtraKeys!5695 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253264 () Bool)

(declare-fun e!711956 () Bool)

(assert (=> b!1253264 (= e!711956 tp_is_empty!31795)))

(declare-fun mapIsEmpty!49468 () Bool)

(declare-fun mapRes!49468 () Bool)

(assert (=> mapIsEmpty!49468 mapRes!49468))

(declare-fun mapNonEmpty!49468 () Bool)

(declare-fun tp!94184 () Bool)

(assert (=> mapNonEmpty!49468 (= mapRes!49468 (and tp!94184 e!711956))))

(declare-fun mapRest!49468 () (Array (_ BitVec 32) ValueCell!15134))

(declare-fun mapKey!49468 () (_ BitVec 32))

(declare-fun mapValue!49468 () ValueCell!15134)

(assert (=> mapNonEmpty!49468 (= (arr!39152 _values!914) (store mapRest!49468 mapKey!49468 mapValue!49468))))

(declare-fun b!1253265 () Bool)

(assert (=> b!1253265 (= e!711957 true)))

(declare-fun lt!565698 () ListLongMap!18557)

(declare-fun lt!565697 () ListLongMap!18557)

(declare-fun -!1991 (ListLongMap!18557 (_ BitVec 64)) ListLongMap!18557)

(assert (=> b!1253265 (= lt!565698 (-!1991 lt!565697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565693 () ListLongMap!18557)

(assert (=> b!1253265 (= (-!1991 lt!565693 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565695)))

(declare-fun lt!565696 () Unit!41551)

(declare-fun addThenRemoveForNewKeyIsSame!280 (ListLongMap!18557 (_ BitVec 64) V!47759) Unit!41551)

(assert (=> b!1253265 (= lt!565696 (addThenRemoveForNewKeyIsSame!280 lt!565695 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565692 () ListLongMap!18557)

(assert (=> b!1253265 (and (= lt!565697 lt!565693) (= lt!565692 lt!565699))))

(declare-fun +!4194 (ListLongMap!18557 tuple2!20684) ListLongMap!18557)

(assert (=> b!1253265 (= lt!565693 (+!4194 lt!565695 (tuple2!20685 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4430 (array!81177 array!81179 (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 (_ BitVec 32) Int) ListLongMap!18557)

(assert (=> b!1253265 (= lt!565692 (getCurrentListMap!4430 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253265 (= lt!565697 (getCurrentListMap!4430 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253266 () Bool)

(assert (=> b!1253266 (= e!711960 (and e!711959 mapRes!49468))))

(declare-fun condMapEmpty!49468 () Bool)

(declare-fun mapDefault!49468 () ValueCell!15134)

(assert (=> b!1253266 (= condMapEmpty!49468 (= (arr!39152 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15134)) mapDefault!49468)))))

(assert (= (and start!105172 res!835725) b!1253262))

(assert (= (and b!1253262 res!835728) b!1253261))

(assert (= (and b!1253261 res!835729) b!1253259))

(assert (= (and b!1253259 res!835727) b!1253263))

(assert (= (and b!1253263 (not res!835726)) b!1253265))

(assert (= (and b!1253266 condMapEmpty!49468) mapIsEmpty!49468))

(assert (= (and b!1253266 (not condMapEmpty!49468)) mapNonEmpty!49468))

(get-info :version)

(assert (= (and mapNonEmpty!49468 ((_ is ValueCellFull!15134) mapValue!49468)) b!1253264))

(assert (= (and b!1253266 ((_ is ValueCellFull!15134) mapDefault!49468)) b!1253260))

(assert (= start!105172 b!1253266))

(declare-fun m!1153325 () Bool)

(assert (=> b!1253259 m!1153325))

(declare-fun m!1153327 () Bool)

(assert (=> start!105172 m!1153327))

(declare-fun m!1153329 () Bool)

(assert (=> start!105172 m!1153329))

(declare-fun m!1153331 () Bool)

(assert (=> start!105172 m!1153331))

(declare-fun m!1153333 () Bool)

(assert (=> b!1253263 m!1153333))

(declare-fun m!1153335 () Bool)

(assert (=> b!1253263 m!1153335))

(declare-fun m!1153337 () Bool)

(assert (=> b!1253263 m!1153337))

(declare-fun m!1153339 () Bool)

(assert (=> b!1253261 m!1153339))

(declare-fun m!1153341 () Bool)

(assert (=> b!1253265 m!1153341))

(declare-fun m!1153343 () Bool)

(assert (=> b!1253265 m!1153343))

(declare-fun m!1153345 () Bool)

(assert (=> b!1253265 m!1153345))

(declare-fun m!1153347 () Bool)

(assert (=> b!1253265 m!1153347))

(declare-fun m!1153349 () Bool)

(assert (=> b!1253265 m!1153349))

(declare-fun m!1153351 () Bool)

(assert (=> b!1253265 m!1153351))

(declare-fun m!1153353 () Bool)

(assert (=> mapNonEmpty!49468 m!1153353))

(check-sat (not b!1253263) b_and!44689 (not b_next!26893) tp_is_empty!31795 (not b!1253265) (not mapNonEmpty!49468) (not start!105172) (not b!1253261) (not b!1253259))
(check-sat b_and!44689 (not b_next!26893))
