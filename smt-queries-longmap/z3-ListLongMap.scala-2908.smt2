; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41576 () Bool)

(assert start!41576)

(declare-fun b_free!11257 () Bool)

(declare-fun b_next!11257 () Bool)

(assert (=> start!41576 (= b_free!11257 (not b_next!11257))))

(declare-fun tp!39769 () Bool)

(declare-fun b_and!19607 () Bool)

(assert (=> start!41576 (= tp!39769 b_and!19607)))

(declare-fun b!464484 () Bool)

(declare-fun e!271337 () Bool)

(declare-fun e!271335 () Bool)

(declare-fun mapRes!20704 () Bool)

(assert (=> b!464484 (= e!271337 (and e!271335 mapRes!20704))))

(declare-fun condMapEmpty!20704 () Bool)

(declare-datatypes ((V!18019 0))(
  ( (V!18020 (val!6387 Int)) )
))
(declare-datatypes ((ValueCell!5999 0))(
  ( (ValueCellFull!5999 (v!8675 V!18019)) (EmptyCell!5999) )
))
(declare-datatypes ((array!29152 0))(
  ( (array!29153 (arr!14007 (Array (_ BitVec 32) ValueCell!5999)) (size!14359 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29152)

(declare-fun mapDefault!20704 () ValueCell!5999)

(assert (=> b!464484 (= condMapEmpty!20704 (= (arr!14007 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5999)) mapDefault!20704)))))

(declare-fun b!464485 () Bool)

(declare-fun e!271338 () Bool)

(declare-fun tp_is_empty!12685 () Bool)

(assert (=> b!464485 (= e!271338 tp_is_empty!12685)))

(declare-fun b!464487 () Bool)

(assert (=> b!464487 (= e!271335 tp_is_empty!12685)))

(declare-fun b!464488 () Bool)

(declare-fun res!277726 () Bool)

(declare-fun e!271334 () Bool)

(assert (=> b!464488 (=> (not res!277726) (not e!271334))))

(declare-datatypes ((array!29154 0))(
  ( (array!29155 (arr!14008 (Array (_ BitVec 32) (_ BitVec 64))) (size!14360 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29154)

(declare-datatypes ((List!8390 0))(
  ( (Nil!8387) (Cons!8386 (h!9242 (_ BitVec 64)) (t!14328 List!8390)) )
))
(declare-fun arrayNoDuplicates!0 (array!29154 (_ BitVec 32) List!8390) Bool)

(assert (=> b!464488 (= res!277726 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8387))))

(declare-fun mapNonEmpty!20704 () Bool)

(declare-fun tp!39768 () Bool)

(assert (=> mapNonEmpty!20704 (= mapRes!20704 (and tp!39768 e!271338))))

(declare-fun mapRest!20704 () (Array (_ BitVec 32) ValueCell!5999))

(declare-fun mapKey!20704 () (_ BitVec 32))

(declare-fun mapValue!20704 () ValueCell!5999)

(assert (=> mapNonEmpty!20704 (= (arr!14007 _values!833) (store mapRest!20704 mapKey!20704 mapValue!20704))))

(declare-fun b!464489 () Bool)

(assert (=> b!464489 (= e!271334 (not true))))

(declare-datatypes ((tuple2!8306 0))(
  ( (tuple2!8307 (_1!4164 (_ BitVec 64)) (_2!4164 V!18019)) )
))
(declare-datatypes ((List!8391 0))(
  ( (Nil!8388) (Cons!8387 (h!9243 tuple2!8306) (t!14329 List!8391)) )
))
(declare-datatypes ((ListLongMap!7221 0))(
  ( (ListLongMap!7222 (toList!3626 List!8391)) )
))
(declare-fun lt!209772 () ListLongMap!7221)

(declare-fun lt!209774 () ListLongMap!7221)

(assert (=> b!464489 (= lt!209772 lt!209774)))

(declare-datatypes ((Unit!13470 0))(
  ( (Unit!13471) )
))
(declare-fun lt!209773 () Unit!13470)

(declare-fun minValueBefore!38 () V!18019)

(declare-fun zeroValue!794 () V!18019)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18019)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!13 (array!29154 array!29152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 V!18019 V!18019 (_ BitVec 32) Int) Unit!13470)

(assert (=> b!464489 (= lt!209773 (lemmaNoChangeToArrayThenSameMapNoExtras!13 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1853 (array!29154 array!29152 (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 (_ BitVec 32) Int) ListLongMap!7221)

(assert (=> b!464489 (= lt!209774 (getCurrentListMapNoExtraKeys!1853 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464489 (= lt!209772 (getCurrentListMapNoExtraKeys!1853 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20704 () Bool)

(assert (=> mapIsEmpty!20704 mapRes!20704))

(declare-fun b!464490 () Bool)

(declare-fun res!277729 () Bool)

(assert (=> b!464490 (=> (not res!277729) (not e!271334))))

(assert (=> b!464490 (= res!277729 (and (= (size!14359 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14360 _keys!1025) (size!14359 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464486 () Bool)

(declare-fun res!277728 () Bool)

(assert (=> b!464486 (=> (not res!277728) (not e!271334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29154 (_ BitVec 32)) Bool)

(assert (=> b!464486 (= res!277728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277727 () Bool)

(assert (=> start!41576 (=> (not res!277727) (not e!271334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41576 (= res!277727 (validMask!0 mask!1365))))

(assert (=> start!41576 e!271334))

(assert (=> start!41576 tp_is_empty!12685))

(assert (=> start!41576 tp!39769))

(assert (=> start!41576 true))

(declare-fun array_inv!10200 (array!29154) Bool)

(assert (=> start!41576 (array_inv!10200 _keys!1025)))

(declare-fun array_inv!10201 (array!29152) Bool)

(assert (=> start!41576 (and (array_inv!10201 _values!833) e!271337)))

(assert (= (and start!41576 res!277727) b!464490))

(assert (= (and b!464490 res!277729) b!464486))

(assert (= (and b!464486 res!277728) b!464488))

(assert (= (and b!464488 res!277726) b!464489))

(assert (= (and b!464484 condMapEmpty!20704) mapIsEmpty!20704))

(assert (= (and b!464484 (not condMapEmpty!20704)) mapNonEmpty!20704))

(get-info :version)

(assert (= (and mapNonEmpty!20704 ((_ is ValueCellFull!5999) mapValue!20704)) b!464485))

(assert (= (and b!464484 ((_ is ValueCellFull!5999) mapDefault!20704)) b!464487))

(assert (= start!41576 b!464484))

(declare-fun m!447097 () Bool)

(assert (=> b!464489 m!447097))

(declare-fun m!447099 () Bool)

(assert (=> b!464489 m!447099))

(declare-fun m!447101 () Bool)

(assert (=> b!464489 m!447101))

(declare-fun m!447103 () Bool)

(assert (=> mapNonEmpty!20704 m!447103))

(declare-fun m!447105 () Bool)

(assert (=> b!464486 m!447105))

(declare-fun m!447107 () Bool)

(assert (=> b!464488 m!447107))

(declare-fun m!447109 () Bool)

(assert (=> start!41576 m!447109))

(declare-fun m!447111 () Bool)

(assert (=> start!41576 m!447111))

(declare-fun m!447113 () Bool)

(assert (=> start!41576 m!447113))

(check-sat (not b!464489) (not b!464488) b_and!19607 (not b_next!11257) (not mapNonEmpty!20704) (not b!464486) (not start!41576) tp_is_empty!12685)
(check-sat b_and!19607 (not b_next!11257))
