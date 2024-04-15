; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105132 () Bool)

(assert start!105132)

(declare-fun b_free!26869 () Bool)

(declare-fun b_next!26869 () Bool)

(assert (=> start!105132 (= b_free!26869 (not b_next!26869))))

(declare-fun tp!94109 () Bool)

(declare-fun b_and!44655 () Bool)

(assert (=> start!105132 (= tp!94109 b_and!44655)))

(declare-fun b!1252814 () Bool)

(declare-fun e!711636 () Bool)

(assert (=> b!1252814 (= e!711636 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47727 0))(
  ( (V!47728 (val!15948 Int)) )
))
(declare-fun zeroValue!871 () V!47727)

(declare-datatypes ((array!81127 0))(
  ( (array!81128 (arr!39127 (Array (_ BitVec 32) (_ BitVec 64))) (size!39665 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81127)

(declare-datatypes ((ValueCell!15122 0))(
  ( (ValueCellFull!15122 (v!18645 V!47727)) (EmptyCell!15122) )
))
(declare-datatypes ((array!81129 0))(
  ( (array!81130 (arr!39128 (Array (_ BitVec 32) ValueCell!15122)) (size!39666 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81129)

(declare-fun minValueBefore!43 () V!47727)

(declare-datatypes ((tuple2!20664 0))(
  ( (tuple2!20665 (_1!10343 (_ BitVec 64)) (_2!10343 V!47727)) )
))
(declare-datatypes ((List!27879 0))(
  ( (Nil!27876) (Cons!27875 (h!29084 tuple2!20664) (t!41349 List!27879)) )
))
(declare-datatypes ((ListLongMap!18537 0))(
  ( (ListLongMap!18538 (toList!9284 List!27879)) )
))
(declare-fun lt!565380 () ListLongMap!18537)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMap!4422 (array!81127 array!81129 (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 (_ BitVec 32) Int) ListLongMap!18537)

(assert (=> b!1252814 (= lt!565380 (getCurrentListMap!4422 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252815 () Bool)

(declare-fun e!711641 () Bool)

(declare-fun tp_is_empty!31771 () Bool)

(assert (=> b!1252815 (= e!711641 tp_is_empty!31771)))

(declare-fun mapNonEmpty!49429 () Bool)

(declare-fun mapRes!49429 () Bool)

(declare-fun tp!94108 () Bool)

(declare-fun e!711639 () Bool)

(assert (=> mapNonEmpty!49429 (= mapRes!49429 (and tp!94108 e!711639))))

(declare-fun mapRest!49429 () (Array (_ BitVec 32) ValueCell!15122))

(declare-fun mapKey!49429 () (_ BitVec 32))

(declare-fun mapValue!49429 () ValueCell!15122)

(assert (=> mapNonEmpty!49429 (= (arr!39128 _values!914) (store mapRest!49429 mapKey!49429 mapValue!49429))))

(declare-fun b!1252817 () Bool)

(declare-fun e!711638 () Bool)

(assert (=> b!1252817 (= e!711638 (and e!711641 mapRes!49429))))

(declare-fun condMapEmpty!49429 () Bool)

(declare-fun mapDefault!49429 () ValueCell!15122)

(assert (=> b!1252817 (= condMapEmpty!49429 (= (arr!39128 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15122)) mapDefault!49429)))))

(declare-fun b!1252818 () Bool)

(assert (=> b!1252818 (= e!711639 tp_is_empty!31771)))

(declare-fun mapIsEmpty!49429 () Bool)

(assert (=> mapIsEmpty!49429 mapRes!49429))

(declare-fun b!1252819 () Bool)

(declare-fun res!835478 () Bool)

(declare-fun e!711637 () Bool)

(assert (=> b!1252819 (=> (not res!835478) (not e!711637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81127 (_ BitVec 32)) Bool)

(assert (=> b!1252819 (= res!835478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252820 () Bool)

(assert (=> b!1252820 (= e!711637 (not e!711636))))

(declare-fun res!835481 () Bool)

(assert (=> b!1252820 (=> res!835481 e!711636)))

(assert (=> b!1252820 (= res!835481 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565381 () ListLongMap!18537)

(declare-fun lt!565383 () ListLongMap!18537)

(assert (=> b!1252820 (= lt!565381 lt!565383)))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47727)

(declare-datatypes ((Unit!41532 0))(
  ( (Unit!41533) )
))
(declare-fun lt!565382 () Unit!41532)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1009 (array!81127 array!81129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 V!47727 V!47727 (_ BitVec 32) Int) Unit!41532)

(assert (=> b!1252820 (= lt!565382 (lemmaNoChangeToArrayThenSameMapNoExtras!1009 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5687 (array!81127 array!81129 (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 (_ BitVec 32) Int) ListLongMap!18537)

(assert (=> b!1252820 (= lt!565383 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252820 (= lt!565381 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252821 () Bool)

(declare-fun res!835479 () Bool)

(assert (=> b!1252821 (=> (not res!835479) (not e!711637))))

(assert (=> b!1252821 (= res!835479 (and (= (size!39666 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39665 _keys!1118) (size!39666 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835480 () Bool)

(assert (=> start!105132 (=> (not res!835480) (not e!711637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105132 (= res!835480 (validMask!0 mask!1466))))

(assert (=> start!105132 e!711637))

(assert (=> start!105132 true))

(assert (=> start!105132 tp!94109))

(assert (=> start!105132 tp_is_empty!31771))

(declare-fun array_inv!29959 (array!81127) Bool)

(assert (=> start!105132 (array_inv!29959 _keys!1118)))

(declare-fun array_inv!29960 (array!81129) Bool)

(assert (=> start!105132 (and (array_inv!29960 _values!914) e!711638)))

(declare-fun b!1252816 () Bool)

(declare-fun res!835482 () Bool)

(assert (=> b!1252816 (=> (not res!835482) (not e!711637))))

(declare-datatypes ((List!27880 0))(
  ( (Nil!27877) (Cons!27876 (h!29085 (_ BitVec 64)) (t!41350 List!27880)) )
))
(declare-fun arrayNoDuplicates!0 (array!81127 (_ BitVec 32) List!27880) Bool)

(assert (=> b!1252816 (= res!835482 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27877))))

(assert (= (and start!105132 res!835480) b!1252821))

(assert (= (and b!1252821 res!835479) b!1252819))

(assert (= (and b!1252819 res!835478) b!1252816))

(assert (= (and b!1252816 res!835482) b!1252820))

(assert (= (and b!1252820 (not res!835481)) b!1252814))

(assert (= (and b!1252817 condMapEmpty!49429) mapIsEmpty!49429))

(assert (= (and b!1252817 (not condMapEmpty!49429)) mapNonEmpty!49429))

(get-info :version)

(assert (= (and mapNonEmpty!49429 ((_ is ValueCellFull!15122) mapValue!49429)) b!1252818))

(assert (= (and b!1252817 ((_ is ValueCellFull!15122) mapDefault!49429)) b!1252815))

(assert (= start!105132 b!1252817))

(declare-fun m!1152925 () Bool)

(assert (=> b!1252816 m!1152925))

(declare-fun m!1152927 () Bool)

(assert (=> mapNonEmpty!49429 m!1152927))

(declare-fun m!1152929 () Bool)

(assert (=> b!1252820 m!1152929))

(declare-fun m!1152931 () Bool)

(assert (=> b!1252820 m!1152931))

(declare-fun m!1152933 () Bool)

(assert (=> b!1252820 m!1152933))

(declare-fun m!1152935 () Bool)

(assert (=> b!1252814 m!1152935))

(declare-fun m!1152937 () Bool)

(assert (=> b!1252819 m!1152937))

(declare-fun m!1152939 () Bool)

(assert (=> start!105132 m!1152939))

(declare-fun m!1152941 () Bool)

(assert (=> start!105132 m!1152941))

(declare-fun m!1152943 () Bool)

(assert (=> start!105132 m!1152943))

(check-sat tp_is_empty!31771 (not mapNonEmpty!49429) (not b!1252814) (not b!1252819) (not b_next!26869) (not start!105132) b_and!44655 (not b!1252820) (not b!1252816))
(check-sat b_and!44655 (not b_next!26869))
