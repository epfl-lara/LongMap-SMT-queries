; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71164 () Bool)

(assert start!71164)

(declare-fun b_free!13201 () Bool)

(declare-fun b_next!13201 () Bool)

(assert (=> start!71164 (= b_free!13201 (not b_next!13201))))

(declare-fun tp!46357 () Bool)

(declare-fun b_and!22115 () Bool)

(assert (=> start!71164 (= tp!46357 b_and!22115)))

(declare-fun b!825346 () Bool)

(declare-fun e!459272 () Bool)

(declare-fun e!459275 () Bool)

(declare-fun mapRes!23986 () Bool)

(assert (=> b!825346 (= e!459272 (and e!459275 mapRes!23986))))

(declare-fun condMapEmpty!23986 () Bool)

(declare-datatypes ((V!24883 0))(
  ( (V!24884 (val!7503 Int)) )
))
(declare-datatypes ((ValueCell!7040 0))(
  ( (ValueCellFull!7040 (v!9936 V!24883)) (EmptyCell!7040) )
))
(declare-datatypes ((array!46017 0))(
  ( (array!46018 (arr!22051 (Array (_ BitVec 32) ValueCell!7040)) (size!22471 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46017)

(declare-fun mapDefault!23986 () ValueCell!7040)

(assert (=> b!825346 (= condMapEmpty!23986 (= (arr!22051 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7040)) mapDefault!23986)))))

(declare-fun b!825347 () Bool)

(declare-fun e!459276 () Bool)

(declare-fun tp_is_empty!14911 () Bool)

(assert (=> b!825347 (= e!459276 tp_is_empty!14911)))

(declare-fun b!825348 () Bool)

(declare-fun e!459273 () Bool)

(declare-fun e!459274 () Bool)

(assert (=> b!825348 (= e!459273 (not e!459274))))

(declare-fun res!562436 () Bool)

(assert (=> b!825348 (=> res!562436 e!459274)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825348 (= res!562436 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9854 0))(
  ( (tuple2!9855 (_1!4938 (_ BitVec 64)) (_2!4938 V!24883)) )
))
(declare-datatypes ((List!15637 0))(
  ( (Nil!15634) (Cons!15633 (h!16768 tuple2!9854) (t!21972 List!15637)) )
))
(declare-datatypes ((ListLongMap!8679 0))(
  ( (ListLongMap!8680 (toList!4355 List!15637)) )
))
(declare-fun lt!372187 () ListLongMap!8679)

(declare-fun lt!372185 () ListLongMap!8679)

(assert (=> b!825348 (= lt!372187 lt!372185)))

(declare-fun zeroValueBefore!34 () V!24883)

(declare-datatypes ((array!46019 0))(
  ( (array!46020 (arr!22052 (Array (_ BitVec 32) (_ BitVec 64))) (size!22472 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46019)

(declare-fun zeroValueAfter!34 () V!24883)

(declare-fun minValue!754 () V!24883)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28261 0))(
  ( (Unit!28262) )
))
(declare-fun lt!372186 () Unit!28261)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!525 (array!46019 array!46017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 V!24883 V!24883 (_ BitVec 32) Int) Unit!28261)

(assert (=> b!825348 (= lt!372186 (lemmaNoChangeToArrayThenSameMapNoExtras!525 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2437 (array!46019 array!46017 (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!825348 (= lt!372185 (getCurrentListMapNoExtraKeys!2437 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825348 (= lt!372187 (getCurrentListMapNoExtraKeys!2437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23986 () Bool)

(declare-fun tp!46356 () Bool)

(assert (=> mapNonEmpty!23986 (= mapRes!23986 (and tp!46356 e!459276))))

(declare-fun mapRest!23986 () (Array (_ BitVec 32) ValueCell!7040))

(declare-fun mapKey!23986 () (_ BitVec 32))

(declare-fun mapValue!23986 () ValueCell!7040)

(assert (=> mapNonEmpty!23986 (= (arr!22051 _values!788) (store mapRest!23986 mapKey!23986 mapValue!23986))))

(declare-fun mapIsEmpty!23986 () Bool)

(assert (=> mapIsEmpty!23986 mapRes!23986))

(declare-fun b!825349 () Bool)

(declare-fun res!562435 () Bool)

(assert (=> b!825349 (=> (not res!562435) (not e!459273))))

(assert (=> b!825349 (= res!562435 (and (= (size!22471 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22472 _keys!976) (size!22471 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825350 () Bool)

(assert (=> b!825350 (= e!459275 tp_is_empty!14911)))

(declare-fun b!825352 () Bool)

(assert (=> b!825352 (= e!459274 true)))

(declare-fun lt!372188 () ListLongMap!8679)

(declare-fun getCurrentListMap!2482 (array!46019 array!46017 (_ BitVec 32) (_ BitVec 32) V!24883 V!24883 (_ BitVec 32) Int) ListLongMap!8679)

(assert (=> b!825352 (= lt!372188 (getCurrentListMap!2482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825353 () Bool)

(declare-fun res!562434 () Bool)

(assert (=> b!825353 (=> (not res!562434) (not e!459273))))

(declare-datatypes ((List!15638 0))(
  ( (Nil!15635) (Cons!15634 (h!16769 (_ BitVec 64)) (t!21973 List!15638)) )
))
(declare-fun arrayNoDuplicates!0 (array!46019 (_ BitVec 32) List!15638) Bool)

(assert (=> b!825353 (= res!562434 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15635))))

(declare-fun res!562437 () Bool)

(assert (=> start!71164 (=> (not res!562437) (not e!459273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71164 (= res!562437 (validMask!0 mask!1312))))

(assert (=> start!71164 e!459273))

(assert (=> start!71164 tp_is_empty!14911))

(declare-fun array_inv!17629 (array!46019) Bool)

(assert (=> start!71164 (array_inv!17629 _keys!976)))

(assert (=> start!71164 true))

(declare-fun array_inv!17630 (array!46017) Bool)

(assert (=> start!71164 (and (array_inv!17630 _values!788) e!459272)))

(assert (=> start!71164 tp!46357))

(declare-fun b!825351 () Bool)

(declare-fun res!562438 () Bool)

(assert (=> b!825351 (=> (not res!562438) (not e!459273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46019 (_ BitVec 32)) Bool)

(assert (=> b!825351 (= res!562438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71164 res!562437) b!825349))

(assert (= (and b!825349 res!562435) b!825351))

(assert (= (and b!825351 res!562438) b!825353))

(assert (= (and b!825353 res!562434) b!825348))

(assert (= (and b!825348 (not res!562436)) b!825352))

(assert (= (and b!825346 condMapEmpty!23986) mapIsEmpty!23986))

(assert (= (and b!825346 (not condMapEmpty!23986)) mapNonEmpty!23986))

(get-info :version)

(assert (= (and mapNonEmpty!23986 ((_ is ValueCellFull!7040) mapValue!23986)) b!825347))

(assert (= (and b!825346 ((_ is ValueCellFull!7040) mapDefault!23986)) b!825350))

(assert (= start!71164 b!825346))

(declare-fun m!767819 () Bool)

(assert (=> b!825352 m!767819))

(declare-fun m!767821 () Bool)

(assert (=> b!825351 m!767821))

(declare-fun m!767823 () Bool)

(assert (=> b!825348 m!767823))

(declare-fun m!767825 () Bool)

(assert (=> b!825348 m!767825))

(declare-fun m!767827 () Bool)

(assert (=> b!825348 m!767827))

(declare-fun m!767829 () Bool)

(assert (=> start!71164 m!767829))

(declare-fun m!767831 () Bool)

(assert (=> start!71164 m!767831))

(declare-fun m!767833 () Bool)

(assert (=> start!71164 m!767833))

(declare-fun m!767835 () Bool)

(assert (=> b!825353 m!767835))

(declare-fun m!767837 () Bool)

(assert (=> mapNonEmpty!23986 m!767837))

(check-sat (not b!825351) (not b!825353) (not b!825348) (not b!825352) (not mapNonEmpty!23986) tp_is_empty!14911 (not b_next!13201) (not start!71164) b_and!22115)
(check-sat b_and!22115 (not b_next!13201))
