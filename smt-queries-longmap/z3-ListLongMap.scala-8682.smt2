; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105492 () Bool)

(assert start!105492)

(declare-fun b_free!27129 () Bool)

(declare-fun b_next!27129 () Bool)

(assert (=> start!105492 (= b_free!27129 (not b_next!27129))))

(declare-fun tp!94903 () Bool)

(declare-fun b_and!44985 () Bool)

(assert (=> start!105492 (= tp!94903 b_and!44985)))

(declare-fun b!1256815 () Bool)

(declare-fun e!714549 () Bool)

(declare-fun e!714550 () Bool)

(assert (=> b!1256815 (= e!714549 e!714550)))

(declare-fun res!837825 () Bool)

(assert (=> b!1256815 (=> res!837825 e!714550)))

(declare-datatypes ((V!48073 0))(
  ( (V!48074 (val!16078 Int)) )
))
(declare-datatypes ((tuple2!20772 0))(
  ( (tuple2!20773 (_1!10397 (_ BitVec 64)) (_2!10397 V!48073)) )
))
(declare-datatypes ((List!27988 0))(
  ( (Nil!27985) (Cons!27984 (h!29193 tuple2!20772) (t!41477 List!27988)) )
))
(declare-datatypes ((ListLongMap!18645 0))(
  ( (ListLongMap!18646 (toList!9338 List!27988)) )
))
(declare-fun lt!568364 () ListLongMap!18645)

(declare-fun contains!7555 (ListLongMap!18645 (_ BitVec 64)) Bool)

(assert (=> b!1256815 (= res!837825 (contains!7555 lt!568364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48073)

(declare-datatypes ((array!81700 0))(
  ( (array!81701 (arr!39408 (Array (_ BitVec 32) (_ BitVec 64))) (size!39944 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81700)

(declare-datatypes ((ValueCell!15252 0))(
  ( (ValueCellFull!15252 (v!18779 V!48073)) (EmptyCell!15252) )
))
(declare-datatypes ((array!81702 0))(
  ( (array!81703 (arr!39409 (Array (_ BitVec 32) ValueCell!15252)) (size!39945 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81702)

(declare-fun minValueBefore!43 () V!48073)

(declare-fun getCurrentListMap!4560 (array!81700 array!81702 (_ BitVec 32) (_ BitVec 32) V!48073 V!48073 (_ BitVec 32) Int) ListLongMap!18645)

(assert (=> b!1256815 (= lt!568364 (getCurrentListMap!4560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256816 () Bool)

(assert (=> b!1256816 (= e!714550 true)))

(declare-fun -!2086 (ListLongMap!18645 (_ BitVec 64)) ListLongMap!18645)

(assert (=> b!1256816 (= (-!2086 lt!568364 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568364)))

(declare-datatypes ((Unit!41860 0))(
  ( (Unit!41861) )
))
(declare-fun lt!568363 () Unit!41860)

(declare-fun removeNotPresentStillSame!139 (ListLongMap!18645 (_ BitVec 64)) Unit!41860)

(assert (=> b!1256816 (= lt!568363 (removeNotPresentStillSame!139 lt!568364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49834 () Bool)

(declare-fun mapRes!49834 () Bool)

(declare-fun tp!94904 () Bool)

(declare-fun e!714553 () Bool)

(assert (=> mapNonEmpty!49834 (= mapRes!49834 (and tp!94904 e!714553))))

(declare-fun mapValue!49834 () ValueCell!15252)

(declare-fun mapRest!49834 () (Array (_ BitVec 32) ValueCell!15252))

(declare-fun mapKey!49834 () (_ BitVec 32))

(assert (=> mapNonEmpty!49834 (= (arr!39409 _values!914) (store mapRest!49834 mapKey!49834 mapValue!49834))))

(declare-fun b!1256817 () Bool)

(declare-fun e!714555 () Bool)

(assert (=> b!1256817 (= e!714555 (not e!714549))))

(declare-fun res!837827 () Bool)

(assert (=> b!1256817 (=> res!837827 e!714549)))

(assert (=> b!1256817 (= res!837827 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568367 () ListLongMap!18645)

(declare-fun lt!568366 () ListLongMap!18645)

(assert (=> b!1256817 (= lt!568367 lt!568366)))

(declare-fun minValueAfter!43 () V!48073)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!568365 () Unit!41860)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1084 (array!81700 array!81702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48073 V!48073 V!48073 V!48073 (_ BitVec 32) Int) Unit!41860)

(assert (=> b!1256817 (= lt!568365 (lemmaNoChangeToArrayThenSameMapNoExtras!1084 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5720 (array!81700 array!81702 (_ BitVec 32) (_ BitVec 32) V!48073 V!48073 (_ BitVec 32) Int) ListLongMap!18645)

(assert (=> b!1256817 (= lt!568366 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256817 (= lt!568367 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256818 () Bool)

(declare-fun e!714551 () Bool)

(declare-fun tp_is_empty!32031 () Bool)

(assert (=> b!1256818 (= e!714551 tp_is_empty!32031)))

(declare-fun res!837823 () Bool)

(assert (=> start!105492 (=> (not res!837823) (not e!714555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105492 (= res!837823 (validMask!0 mask!1466))))

(assert (=> start!105492 e!714555))

(assert (=> start!105492 true))

(assert (=> start!105492 tp!94903))

(assert (=> start!105492 tp_is_empty!32031))

(declare-fun array_inv!30021 (array!81700) Bool)

(assert (=> start!105492 (array_inv!30021 _keys!1118)))

(declare-fun e!714554 () Bool)

(declare-fun array_inv!30022 (array!81702) Bool)

(assert (=> start!105492 (and (array_inv!30022 _values!914) e!714554)))

(declare-fun b!1256819 () Bool)

(declare-fun res!837826 () Bool)

(assert (=> b!1256819 (=> (not res!837826) (not e!714555))))

(declare-datatypes ((List!27989 0))(
  ( (Nil!27986) (Cons!27985 (h!29194 (_ BitVec 64)) (t!41478 List!27989)) )
))
(declare-fun arrayNoDuplicates!0 (array!81700 (_ BitVec 32) List!27989) Bool)

(assert (=> b!1256819 (= res!837826 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27986))))

(declare-fun b!1256820 () Bool)

(declare-fun res!837828 () Bool)

(assert (=> b!1256820 (=> (not res!837828) (not e!714555))))

(assert (=> b!1256820 (= res!837828 (and (= (size!39945 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39944 _keys!1118) (size!39945 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256821 () Bool)

(assert (=> b!1256821 (= e!714554 (and e!714551 mapRes!49834))))

(declare-fun condMapEmpty!49834 () Bool)

(declare-fun mapDefault!49834 () ValueCell!15252)

(assert (=> b!1256821 (= condMapEmpty!49834 (= (arr!39409 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15252)) mapDefault!49834)))))

(declare-fun mapIsEmpty!49834 () Bool)

(assert (=> mapIsEmpty!49834 mapRes!49834))

(declare-fun b!1256822 () Bool)

(declare-fun res!837824 () Bool)

(assert (=> b!1256822 (=> (not res!837824) (not e!714555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81700 (_ BitVec 32)) Bool)

(assert (=> b!1256822 (= res!837824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256823 () Bool)

(assert (=> b!1256823 (= e!714553 tp_is_empty!32031)))

(assert (= (and start!105492 res!837823) b!1256820))

(assert (= (and b!1256820 res!837828) b!1256822))

(assert (= (and b!1256822 res!837824) b!1256819))

(assert (= (and b!1256819 res!837826) b!1256817))

(assert (= (and b!1256817 (not res!837827)) b!1256815))

(assert (= (and b!1256815 (not res!837825)) b!1256816))

(assert (= (and b!1256821 condMapEmpty!49834) mapIsEmpty!49834))

(assert (= (and b!1256821 (not condMapEmpty!49834)) mapNonEmpty!49834))

(get-info :version)

(assert (= (and mapNonEmpty!49834 ((_ is ValueCellFull!15252) mapValue!49834)) b!1256823))

(assert (= (and b!1256821 ((_ is ValueCellFull!15252) mapDefault!49834)) b!1256818))

(assert (= start!105492 b!1256821))

(declare-fun m!1157449 () Bool)

(assert (=> start!105492 m!1157449))

(declare-fun m!1157451 () Bool)

(assert (=> start!105492 m!1157451))

(declare-fun m!1157453 () Bool)

(assert (=> start!105492 m!1157453))

(declare-fun m!1157455 () Bool)

(assert (=> b!1256822 m!1157455))

(declare-fun m!1157457 () Bool)

(assert (=> mapNonEmpty!49834 m!1157457))

(declare-fun m!1157459 () Bool)

(assert (=> b!1256817 m!1157459))

(declare-fun m!1157461 () Bool)

(assert (=> b!1256817 m!1157461))

(declare-fun m!1157463 () Bool)

(assert (=> b!1256817 m!1157463))

(declare-fun m!1157465 () Bool)

(assert (=> b!1256815 m!1157465))

(declare-fun m!1157467 () Bool)

(assert (=> b!1256815 m!1157467))

(declare-fun m!1157469 () Bool)

(assert (=> b!1256816 m!1157469))

(declare-fun m!1157471 () Bool)

(assert (=> b!1256816 m!1157471))

(declare-fun m!1157473 () Bool)

(assert (=> b!1256819 m!1157473))

(check-sat (not b!1256815) (not b!1256816) (not b!1256819) (not start!105492) (not b!1256817) b_and!44985 (not mapNonEmpty!49834) (not b_next!27129) (not b!1256822) tp_is_empty!32031)
(check-sat b_and!44985 (not b_next!27129))
