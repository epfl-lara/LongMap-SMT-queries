; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41546 () Bool)

(assert start!41546)

(declare-fun b_free!11227 () Bool)

(declare-fun b_next!11227 () Bool)

(assert (=> start!41546 (= b_free!11227 (not b_next!11227))))

(declare-fun tp!39679 () Bool)

(declare-fun b_and!19541 () Bool)

(assert (=> start!41546 (= tp!39679 b_and!19541)))

(declare-fun mapIsEmpty!20659 () Bool)

(declare-fun mapRes!20659 () Bool)

(assert (=> mapIsEmpty!20659 mapRes!20659))

(declare-fun b!463960 () Bool)

(declare-fun e!270975 () Bool)

(declare-fun tp_is_empty!12655 () Bool)

(assert (=> b!463960 (= e!270975 tp_is_empty!12655)))

(declare-fun b!463961 () Bool)

(declare-fun e!270978 () Bool)

(assert (=> b!463961 (= e!270978 (not true))))

(declare-datatypes ((V!17979 0))(
  ( (V!17980 (val!6372 Int)) )
))
(declare-datatypes ((tuple2!8378 0))(
  ( (tuple2!8379 (_1!4200 (_ BitVec 64)) (_2!4200 V!17979)) )
))
(declare-datatypes ((List!8466 0))(
  ( (Nil!8463) (Cons!8462 (h!9318 tuple2!8378) (t!14403 List!8466)) )
))
(declare-datatypes ((ListLongMap!7281 0))(
  ( (ListLongMap!7282 (toList!3656 List!8466)) )
))
(declare-fun lt!209391 () ListLongMap!7281)

(declare-fun lt!209392 () ListLongMap!7281)

(assert (=> b!463961 (= lt!209391 lt!209392)))

(declare-fun minValueBefore!38 () V!17979)

(declare-fun zeroValue!794 () V!17979)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13428 0))(
  ( (Unit!13429) )
))
(declare-fun lt!209393 () Unit!13428)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29097 0))(
  ( (array!29098 (arr!13980 (Array (_ BitVec 32) (_ BitVec 64))) (size!14333 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29097)

(declare-datatypes ((ValueCell!5984 0))(
  ( (ValueCellFull!5984 (v!8653 V!17979)) (EmptyCell!5984) )
))
(declare-datatypes ((array!29099 0))(
  ( (array!29100 (arr!13981 (Array (_ BitVec 32) ValueCell!5984)) (size!14334 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29099)

(declare-fun minValueAfter!38 () V!17979)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!5 (array!29097 array!29099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17979 V!17979 V!17979 V!17979 (_ BitVec 32) Int) Unit!13428)

(assert (=> b!463961 (= lt!209393 (lemmaNoChangeToArrayThenSameMapNoExtras!5 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1848 (array!29097 array!29099 (_ BitVec 32) (_ BitVec 32) V!17979 V!17979 (_ BitVec 32) Int) ListLongMap!7281)

(assert (=> b!463961 (= lt!209392 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!463961 (= lt!209391 (getCurrentListMapNoExtraKeys!1848 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463962 () Bool)

(declare-fun res!277427 () Bool)

(assert (=> b!463962 (=> (not res!277427) (not e!270978))))

(declare-datatypes ((List!8467 0))(
  ( (Nil!8464) (Cons!8463 (h!9319 (_ BitVec 64)) (t!14404 List!8467)) )
))
(declare-fun arrayNoDuplicates!0 (array!29097 (_ BitVec 32) List!8467) Bool)

(assert (=> b!463962 (= res!277427 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8464))))

(declare-fun b!463963 () Bool)

(declare-fun res!277424 () Bool)

(assert (=> b!463963 (=> (not res!277424) (not e!270978))))

(assert (=> b!463963 (= res!277424 (and (= (size!14334 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14333 _keys!1025) (size!14334 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20659 () Bool)

(declare-fun tp!39678 () Bool)

(declare-fun e!270974 () Bool)

(assert (=> mapNonEmpty!20659 (= mapRes!20659 (and tp!39678 e!270974))))

(declare-fun mapKey!20659 () (_ BitVec 32))

(declare-fun mapValue!20659 () ValueCell!5984)

(declare-fun mapRest!20659 () (Array (_ BitVec 32) ValueCell!5984))

(assert (=> mapNonEmpty!20659 (= (arr!13981 _values!833) (store mapRest!20659 mapKey!20659 mapValue!20659))))

(declare-fun res!277426 () Bool)

(assert (=> start!41546 (=> (not res!277426) (not e!270978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41546 (= res!277426 (validMask!0 mask!1365))))

(assert (=> start!41546 e!270978))

(assert (=> start!41546 tp_is_empty!12655))

(assert (=> start!41546 tp!39679))

(assert (=> start!41546 true))

(declare-fun array_inv!10174 (array!29097) Bool)

(assert (=> start!41546 (array_inv!10174 _keys!1025)))

(declare-fun e!270977 () Bool)

(declare-fun array_inv!10175 (array!29099) Bool)

(assert (=> start!41546 (and (array_inv!10175 _values!833) e!270977)))

(declare-fun b!463959 () Bool)

(assert (=> b!463959 (= e!270977 (and e!270975 mapRes!20659))))

(declare-fun condMapEmpty!20659 () Bool)

(declare-fun mapDefault!20659 () ValueCell!5984)

(assert (=> b!463959 (= condMapEmpty!20659 (= (arr!13981 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5984)) mapDefault!20659)))))

(declare-fun b!463964 () Bool)

(assert (=> b!463964 (= e!270974 tp_is_empty!12655)))

(declare-fun b!463965 () Bool)

(declare-fun res!277425 () Bool)

(assert (=> b!463965 (=> (not res!277425) (not e!270978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29097 (_ BitVec 32)) Bool)

(assert (=> b!463965 (= res!277425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41546 res!277426) b!463963))

(assert (= (and b!463963 res!277424) b!463965))

(assert (= (and b!463965 res!277425) b!463962))

(assert (= (and b!463962 res!277427) b!463961))

(assert (= (and b!463959 condMapEmpty!20659) mapIsEmpty!20659))

(assert (= (and b!463959 (not condMapEmpty!20659)) mapNonEmpty!20659))

(get-info :version)

(assert (= (and mapNonEmpty!20659 ((_ is ValueCellFull!5984) mapValue!20659)) b!463964))

(assert (= (and b!463959 ((_ is ValueCellFull!5984) mapDefault!20659)) b!463960))

(assert (= start!41546 b!463959))

(declare-fun m!445911 () Bool)

(assert (=> start!41546 m!445911))

(declare-fun m!445913 () Bool)

(assert (=> start!41546 m!445913))

(declare-fun m!445915 () Bool)

(assert (=> start!41546 m!445915))

(declare-fun m!445917 () Bool)

(assert (=> mapNonEmpty!20659 m!445917))

(declare-fun m!445919 () Bool)

(assert (=> b!463965 m!445919))

(declare-fun m!445921 () Bool)

(assert (=> b!463962 m!445921))

(declare-fun m!445923 () Bool)

(assert (=> b!463961 m!445923))

(declare-fun m!445925 () Bool)

(assert (=> b!463961 m!445925))

(declare-fun m!445927 () Bool)

(assert (=> b!463961 m!445927))

(check-sat (not start!41546) (not b!463965) (not b!463962) b_and!19541 (not b_next!11227) tp_is_empty!12655 (not b!463961) (not mapNonEmpty!20659))
(check-sat b_and!19541 (not b_next!11227))
