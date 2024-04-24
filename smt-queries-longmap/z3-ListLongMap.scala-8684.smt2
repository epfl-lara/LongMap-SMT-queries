; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105726 () Bool)

(assert start!105726)

(declare-fun b_free!27139 () Bool)

(declare-fun b_next!27139 () Bool)

(assert (=> start!105726 (= b_free!27139 (not b_next!27139))))

(declare-fun tp!94934 () Bool)

(declare-fun b_and!44997 () Bool)

(assert (=> start!105726 (= tp!94934 b_and!44997)))

(declare-fun mapIsEmpty!49849 () Bool)

(declare-fun mapRes!49849 () Bool)

(assert (=> mapIsEmpty!49849 mapRes!49849))

(declare-fun mapNonEmpty!49849 () Bool)

(declare-fun tp!94933 () Bool)

(declare-fun e!715502 () Bool)

(assert (=> mapNonEmpty!49849 (= mapRes!49849 (and tp!94933 e!715502))))

(declare-datatypes ((V!48087 0))(
  ( (V!48088 (val!16083 Int)) )
))
(declare-datatypes ((ValueCell!15257 0))(
  ( (ValueCellFull!15257 (v!18780 V!48087)) (EmptyCell!15257) )
))
(declare-fun mapValue!49849 () ValueCell!15257)

(declare-fun mapKey!49849 () (_ BitVec 32))

(declare-fun mapRest!49849 () (Array (_ BitVec 32) ValueCell!15257))

(declare-datatypes ((array!81765 0))(
  ( (array!81766 (arr!39436 (Array (_ BitVec 32) ValueCell!15257)) (size!39973 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81765)

(assert (=> mapNonEmpty!49849 (= (arr!39436 _values!914) (store mapRest!49849 mapKey!49849 mapValue!49849))))

(declare-fun b!1258256 () Bool)

(declare-fun e!715503 () Bool)

(declare-fun e!715507 () Bool)

(assert (=> b!1258256 (= e!715503 e!715507)))

(declare-fun res!838435 () Bool)

(assert (=> b!1258256 (=> res!838435 e!715507)))

(declare-datatypes ((tuple2!20802 0))(
  ( (tuple2!20803 (_1!10412 (_ BitVec 64)) (_2!10412 V!48087)) )
))
(declare-datatypes ((List!28031 0))(
  ( (Nil!28028) (Cons!28027 (h!29245 tuple2!20802) (t!41512 List!28031)) )
))
(declare-datatypes ((ListLongMap!18683 0))(
  ( (ListLongMap!18684 (toList!9357 List!28031)) )
))
(declare-fun lt!568924 () ListLongMap!18683)

(declare-fun contains!7585 (ListLongMap!18683 (_ BitVec 64)) Bool)

(assert (=> b!1258256 (= res!838435 (contains!7585 lt!568924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48087)

(declare-datatypes ((array!81767 0))(
  ( (array!81768 (arr!39437 (Array (_ BitVec 32) (_ BitVec 64))) (size!39974 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81767)

(declare-fun minValueBefore!43 () V!48087)

(declare-fun getCurrentListMap!4562 (array!81767 array!81765 (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 (_ BitVec 32) Int) ListLongMap!18683)

(assert (=> b!1258256 (= lt!568924 (getCurrentListMap!4562 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258257 () Bool)

(declare-fun res!838437 () Bool)

(declare-fun e!715501 () Bool)

(assert (=> b!1258257 (=> (not res!838437) (not e!715501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81767 (_ BitVec 32)) Bool)

(assert (=> b!1258257 (= res!838437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258258 () Bool)

(declare-fun e!715504 () Bool)

(declare-fun tp_is_empty!32041 () Bool)

(assert (=> b!1258258 (= e!715504 tp_is_empty!32041)))

(declare-fun b!1258259 () Bool)

(declare-fun e!715505 () Bool)

(assert (=> b!1258259 (= e!715505 (and e!715504 mapRes!49849))))

(declare-fun condMapEmpty!49849 () Bool)

(declare-fun mapDefault!49849 () ValueCell!15257)

(assert (=> b!1258259 (= condMapEmpty!49849 (= (arr!39436 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15257)) mapDefault!49849)))))

(declare-fun b!1258260 () Bool)

(assert (=> b!1258260 (= e!715502 tp_is_empty!32041)))

(declare-fun b!1258261 () Bool)

(declare-fun res!838434 () Bool)

(assert (=> b!1258261 (=> (not res!838434) (not e!715501))))

(declare-datatypes ((List!28032 0))(
  ( (Nil!28029) (Cons!28028 (h!29246 (_ BitVec 64)) (t!41513 List!28032)) )
))
(declare-fun arrayNoDuplicates!0 (array!81767 (_ BitVec 32) List!28032) Bool)

(assert (=> b!1258261 (= res!838434 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28029))))

(declare-fun b!1258262 () Bool)

(assert (=> b!1258262 (= e!715507 true)))

(declare-fun -!2070 (ListLongMap!18683 (_ BitVec 64)) ListLongMap!18683)

(assert (=> b!1258262 (= (-!2070 lt!568924 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568924)))

(declare-datatypes ((Unit!41855 0))(
  ( (Unit!41856) )
))
(declare-fun lt!568926 () Unit!41855)

(declare-fun removeNotPresentStillSame!142 (ListLongMap!18683 (_ BitVec 64)) Unit!41855)

(assert (=> b!1258262 (= lt!568926 (removeNotPresentStillSame!142 lt!568924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258263 () Bool)

(declare-fun res!838436 () Bool)

(assert (=> b!1258263 (=> (not res!838436) (not e!715501))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258263 (= res!838436 (and (= (size!39973 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39974 _keys!1118) (size!39973 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838438 () Bool)

(assert (=> start!105726 (=> (not res!838438) (not e!715501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105726 (= res!838438 (validMask!0 mask!1466))))

(assert (=> start!105726 e!715501))

(assert (=> start!105726 true))

(assert (=> start!105726 tp!94934))

(assert (=> start!105726 tp_is_empty!32041))

(declare-fun array_inv!30175 (array!81767) Bool)

(assert (=> start!105726 (array_inv!30175 _keys!1118)))

(declare-fun array_inv!30176 (array!81765) Bool)

(assert (=> start!105726 (and (array_inv!30176 _values!914) e!715505)))

(declare-fun b!1258255 () Bool)

(assert (=> b!1258255 (= e!715501 (not e!715503))))

(declare-fun res!838433 () Bool)

(assert (=> b!1258255 (=> res!838433 e!715503)))

(assert (=> b!1258255 (= res!838433 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568923 () ListLongMap!18683)

(declare-fun lt!568922 () ListLongMap!18683)

(assert (=> b!1258255 (= lt!568923 lt!568922)))

(declare-fun lt!568925 () Unit!41855)

(declare-fun minValueAfter!43 () V!48087)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1088 (array!81767 array!81765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 V!48087 V!48087 (_ BitVec 32) Int) Unit!41855)

(assert (=> b!1258255 (= lt!568925 (lemmaNoChangeToArrayThenSameMapNoExtras!1088 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5774 (array!81767 array!81765 (_ BitVec 32) (_ BitVec 32) V!48087 V!48087 (_ BitVec 32) Int) ListLongMap!18683)

(assert (=> b!1258255 (= lt!568922 (getCurrentListMapNoExtraKeys!5774 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258255 (= lt!568923 (getCurrentListMapNoExtraKeys!5774 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105726 res!838438) b!1258263))

(assert (= (and b!1258263 res!838436) b!1258257))

(assert (= (and b!1258257 res!838437) b!1258261))

(assert (= (and b!1258261 res!838434) b!1258255))

(assert (= (and b!1258255 (not res!838433)) b!1258256))

(assert (= (and b!1258256 (not res!838435)) b!1258262))

(assert (= (and b!1258259 condMapEmpty!49849) mapIsEmpty!49849))

(assert (= (and b!1258259 (not condMapEmpty!49849)) mapNonEmpty!49849))

(get-info :version)

(assert (= (and mapNonEmpty!49849 ((_ is ValueCellFull!15257) mapValue!49849)) b!1258260))

(assert (= (and b!1258259 ((_ is ValueCellFull!15257) mapDefault!49849)) b!1258258))

(assert (= start!105726 b!1258259))

(declare-fun m!1159191 () Bool)

(assert (=> b!1258256 m!1159191))

(declare-fun m!1159193 () Bool)

(assert (=> b!1258256 m!1159193))

(declare-fun m!1159195 () Bool)

(assert (=> b!1258261 m!1159195))

(declare-fun m!1159197 () Bool)

(assert (=> mapNonEmpty!49849 m!1159197))

(declare-fun m!1159199 () Bool)

(assert (=> b!1258257 m!1159199))

(declare-fun m!1159201 () Bool)

(assert (=> b!1258255 m!1159201))

(declare-fun m!1159203 () Bool)

(assert (=> b!1258255 m!1159203))

(declare-fun m!1159205 () Bool)

(assert (=> b!1258255 m!1159205))

(declare-fun m!1159207 () Bool)

(assert (=> b!1258262 m!1159207))

(declare-fun m!1159209 () Bool)

(assert (=> b!1258262 m!1159209))

(declare-fun m!1159211 () Bool)

(assert (=> start!105726 m!1159211))

(declare-fun m!1159213 () Bool)

(assert (=> start!105726 m!1159213))

(declare-fun m!1159215 () Bool)

(assert (=> start!105726 m!1159215))

(check-sat (not mapNonEmpty!49849) (not b!1258255) (not b!1258256) b_and!44997 (not b!1258262) (not b_next!27139) (not start!105726) tp_is_empty!32041 (not b!1258257) (not b!1258261))
(check-sat b_and!44997 (not b_next!27139))
