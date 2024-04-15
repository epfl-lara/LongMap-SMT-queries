; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41540 () Bool)

(assert start!41540)

(declare-fun b_free!11221 () Bool)

(declare-fun b_next!11221 () Bool)

(assert (=> start!41540 (= b_free!11221 (not b_next!11221))))

(declare-fun tp!39661 () Bool)

(declare-fun b_and!19535 () Bool)

(assert (=> start!41540 (= tp!39661 b_and!19535)))

(declare-fun b!463896 () Bool)

(declare-fun e!270931 () Bool)

(assert (=> b!463896 (= e!270931 (not true))))

(declare-datatypes ((V!17971 0))(
  ( (V!17972 (val!6369 Int)) )
))
(declare-datatypes ((tuple2!8376 0))(
  ( (tuple2!8377 (_1!4199 (_ BitVec 64)) (_2!4199 V!17971)) )
))
(declare-datatypes ((List!8463 0))(
  ( (Nil!8460) (Cons!8459 (h!9315 tuple2!8376) (t!14400 List!8463)) )
))
(declare-datatypes ((ListLongMap!7279 0))(
  ( (ListLongMap!7280 (toList!3655 List!8463)) )
))
(declare-fun lt!209364 () ListLongMap!7279)

(declare-fun lt!209366 () ListLongMap!7279)

(assert (=> b!463896 (= lt!209364 lt!209366)))

(declare-datatypes ((Unit!13426 0))(
  ( (Unit!13427) )
))
(declare-fun lt!209365 () Unit!13426)

(declare-fun minValueBefore!38 () V!17971)

(declare-fun zeroValue!794 () V!17971)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29087 0))(
  ( (array!29088 (arr!13975 (Array (_ BitVec 32) (_ BitVec 64))) (size!14328 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29087)

(declare-datatypes ((ValueCell!5981 0))(
  ( (ValueCellFull!5981 (v!8650 V!17971)) (EmptyCell!5981) )
))
(declare-datatypes ((array!29089 0))(
  ( (array!29090 (arr!13976 (Array (_ BitVec 32) ValueCell!5981)) (size!14329 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29089)

(declare-fun minValueAfter!38 () V!17971)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!4 (array!29087 array!29089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 V!17971 V!17971 (_ BitVec 32) Int) Unit!13426)

(assert (=> b!463896 (= lt!209365 (lemmaNoChangeToArrayThenSameMapNoExtras!4 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1847 (array!29087 array!29089 (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 (_ BitVec 32) Int) ListLongMap!7279)

(assert (=> b!463896 (= lt!209366 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!463896 (= lt!209364 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463897 () Bool)

(declare-fun e!270932 () Bool)

(declare-fun tp_is_empty!12649 () Bool)

(assert (=> b!463897 (= e!270932 tp_is_empty!12649)))

(declare-fun b!463898 () Bool)

(declare-fun res!277391 () Bool)

(assert (=> b!463898 (=> (not res!277391) (not e!270931))))

(assert (=> b!463898 (= res!277391 (and (= (size!14329 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14328 _keys!1025) (size!14329 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277388 () Bool)

(assert (=> start!41540 (=> (not res!277388) (not e!270931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41540 (= res!277388 (validMask!0 mask!1365))))

(assert (=> start!41540 e!270931))

(assert (=> start!41540 tp_is_empty!12649))

(assert (=> start!41540 tp!39661))

(assert (=> start!41540 true))

(declare-fun array_inv!10172 (array!29087) Bool)

(assert (=> start!41540 (array_inv!10172 _keys!1025)))

(declare-fun e!270930 () Bool)

(declare-fun array_inv!10173 (array!29089) Bool)

(assert (=> start!41540 (and (array_inv!10173 _values!833) e!270930)))

(declare-fun b!463899 () Bool)

(declare-fun res!277389 () Bool)

(assert (=> b!463899 (=> (not res!277389) (not e!270931))))

(declare-datatypes ((List!8464 0))(
  ( (Nil!8461) (Cons!8460 (h!9316 (_ BitVec 64)) (t!14401 List!8464)) )
))
(declare-fun arrayNoDuplicates!0 (array!29087 (_ BitVec 32) List!8464) Bool)

(assert (=> b!463899 (= res!277389 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8461))))

(declare-fun b!463900 () Bool)

(declare-fun mapRes!20650 () Bool)

(assert (=> b!463900 (= e!270930 (and e!270932 mapRes!20650))))

(declare-fun condMapEmpty!20650 () Bool)

(declare-fun mapDefault!20650 () ValueCell!5981)

(assert (=> b!463900 (= condMapEmpty!20650 (= (arr!13976 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5981)) mapDefault!20650)))))

(declare-fun mapIsEmpty!20650 () Bool)

(assert (=> mapIsEmpty!20650 mapRes!20650))

(declare-fun b!463901 () Bool)

(declare-fun e!270929 () Bool)

(assert (=> b!463901 (= e!270929 tp_is_empty!12649)))

(declare-fun mapNonEmpty!20650 () Bool)

(declare-fun tp!39660 () Bool)

(assert (=> mapNonEmpty!20650 (= mapRes!20650 (and tp!39660 e!270929))))

(declare-fun mapRest!20650 () (Array (_ BitVec 32) ValueCell!5981))

(declare-fun mapKey!20650 () (_ BitVec 32))

(declare-fun mapValue!20650 () ValueCell!5981)

(assert (=> mapNonEmpty!20650 (= (arr!13976 _values!833) (store mapRest!20650 mapKey!20650 mapValue!20650))))

(declare-fun b!463902 () Bool)

(declare-fun res!277390 () Bool)

(assert (=> b!463902 (=> (not res!277390) (not e!270931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29087 (_ BitVec 32)) Bool)

(assert (=> b!463902 (= res!277390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41540 res!277388) b!463898))

(assert (= (and b!463898 res!277391) b!463902))

(assert (= (and b!463902 res!277390) b!463899))

(assert (= (and b!463899 res!277389) b!463896))

(assert (= (and b!463900 condMapEmpty!20650) mapIsEmpty!20650))

(assert (= (and b!463900 (not condMapEmpty!20650)) mapNonEmpty!20650))

(get-info :version)

(assert (= (and mapNonEmpty!20650 ((_ is ValueCellFull!5981) mapValue!20650)) b!463901))

(assert (= (and b!463900 ((_ is ValueCellFull!5981) mapDefault!20650)) b!463897))

(assert (= start!41540 b!463900))

(declare-fun m!445857 () Bool)

(assert (=> b!463899 m!445857))

(declare-fun m!445859 () Bool)

(assert (=> mapNonEmpty!20650 m!445859))

(declare-fun m!445861 () Bool)

(assert (=> b!463896 m!445861))

(declare-fun m!445863 () Bool)

(assert (=> b!463896 m!445863))

(declare-fun m!445865 () Bool)

(assert (=> b!463896 m!445865))

(declare-fun m!445867 () Bool)

(assert (=> start!41540 m!445867))

(declare-fun m!445869 () Bool)

(assert (=> start!41540 m!445869))

(declare-fun m!445871 () Bool)

(assert (=> start!41540 m!445871))

(declare-fun m!445873 () Bool)

(assert (=> b!463902 m!445873))

(check-sat (not mapNonEmpty!20650) (not b!463896) tp_is_empty!12649 b_and!19535 (not b!463899) (not b!463902) (not b_next!11221) (not start!41540))
(check-sat b_and!19535 (not b_next!11221))
