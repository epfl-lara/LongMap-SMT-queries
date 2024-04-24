; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105268 () Bool)

(assert start!105268)

(declare-fun b_free!26791 () Bool)

(declare-fun b_next!26791 () Bool)

(assert (=> start!105268 (= b_free!26791 (not b_next!26791))))

(declare-fun tp!93871 () Bool)

(declare-fun b_and!44589 () Bool)

(assert (=> start!105268 (= tp!93871 b_and!44589)))

(declare-fun b!1253232 () Bool)

(declare-fun res!835475 () Bool)

(declare-fun e!711825 () Bool)

(assert (=> b!1253232 (=> (not res!835475) (not e!711825))))

(declare-datatypes ((array!81097 0))(
  ( (array!81098 (arr!39108 (Array (_ BitVec 32) (_ BitVec 64))) (size!39645 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81097)

(declare-datatypes ((List!27784 0))(
  ( (Nil!27781) (Cons!27780 (h!28998 (_ BitVec 64)) (t!41253 List!27784)) )
))
(declare-fun arrayNoDuplicates!0 (array!81097 (_ BitVec 32) List!27784) Bool)

(assert (=> b!1253232 (= res!835475 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27781))))

(declare-fun b!1253233 () Bool)

(declare-fun e!711827 () Bool)

(declare-fun e!711823 () Bool)

(declare-fun mapRes!49309 () Bool)

(assert (=> b!1253233 (= e!711827 (and e!711823 mapRes!49309))))

(declare-fun condMapEmpty!49309 () Bool)

(declare-datatypes ((V!47623 0))(
  ( (V!47624 (val!15909 Int)) )
))
(declare-datatypes ((ValueCell!15083 0))(
  ( (ValueCellFull!15083 (v!18603 V!47623)) (EmptyCell!15083) )
))
(declare-datatypes ((array!81099 0))(
  ( (array!81100 (arr!39109 (Array (_ BitVec 32) ValueCell!15083)) (size!39646 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81099)

(declare-fun mapDefault!49309 () ValueCell!15083)

(assert (=> b!1253233 (= condMapEmpty!49309 (= (arr!39109 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15083)) mapDefault!49309)))))

(declare-fun res!835477 () Bool)

(assert (=> start!105268 (=> (not res!835477) (not e!711825))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105268 (= res!835477 (validMask!0 mask!1466))))

(assert (=> start!105268 e!711825))

(assert (=> start!105268 true))

(assert (=> start!105268 tp!93871))

(declare-fun tp_is_empty!31693 () Bool)

(assert (=> start!105268 tp_is_empty!31693))

(declare-fun array_inv!29939 (array!81097) Bool)

(assert (=> start!105268 (array_inv!29939 _keys!1118)))

(declare-fun array_inv!29940 (array!81099) Bool)

(assert (=> start!105268 (and (array_inv!29940 _values!914) e!711827)))

(declare-fun b!1253234 () Bool)

(declare-fun res!835476 () Bool)

(assert (=> b!1253234 (=> (not res!835476) (not e!711825))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253234 (= res!835476 (and (= (size!39646 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39645 _keys!1118) (size!39646 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253235 () Bool)

(assert (=> b!1253235 (= e!711823 tp_is_empty!31693)))

(declare-fun b!1253236 () Bool)

(declare-fun res!835474 () Bool)

(assert (=> b!1253236 (=> (not res!835474) (not e!711825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81097 (_ BitVec 32)) Bool)

(assert (=> b!1253236 (= res!835474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49309 () Bool)

(assert (=> mapIsEmpty!49309 mapRes!49309))

(declare-fun b!1253237 () Bool)

(assert (=> b!1253237 (= e!711825 (not true))))

(declare-datatypes ((tuple2!20540 0))(
  ( (tuple2!20541 (_1!10281 (_ BitVec 64)) (_2!10281 V!47623)) )
))
(declare-datatypes ((List!27785 0))(
  ( (Nil!27782) (Cons!27781 (h!28999 tuple2!20540) (t!41254 List!27785)) )
))
(declare-datatypes ((ListLongMap!18421 0))(
  ( (ListLongMap!18422 (toList!9226 List!27785)) )
))
(declare-fun lt!565587 () ListLongMap!18421)

(declare-fun lt!565589 () ListLongMap!18421)

(assert (=> b!1253237 (= lt!565587 lt!565589)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47623)

(declare-fun zeroValue!871 () V!47623)

(declare-fun minValueBefore!43 () V!47623)

(declare-datatypes ((Unit!41590 0))(
  ( (Unit!41591) )
))
(declare-fun lt!565588 () Unit!41590)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!967 (array!81097 array!81099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 V!47623 V!47623 (_ BitVec 32) Int) Unit!41590)

(assert (=> b!1253237 (= lt!565588 (lemmaNoChangeToArrayThenSameMapNoExtras!967 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5653 (array!81097 array!81099 (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 (_ BitVec 32) Int) ListLongMap!18421)

(assert (=> b!1253237 (= lt!565589 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253237 (= lt!565587 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253238 () Bool)

(declare-fun e!711824 () Bool)

(assert (=> b!1253238 (= e!711824 tp_is_empty!31693)))

(declare-fun mapNonEmpty!49309 () Bool)

(declare-fun tp!93872 () Bool)

(assert (=> mapNonEmpty!49309 (= mapRes!49309 (and tp!93872 e!711824))))

(declare-fun mapValue!49309 () ValueCell!15083)

(declare-fun mapKey!49309 () (_ BitVec 32))

(declare-fun mapRest!49309 () (Array (_ BitVec 32) ValueCell!15083))

(assert (=> mapNonEmpty!49309 (= (arr!39109 _values!914) (store mapRest!49309 mapKey!49309 mapValue!49309))))

(assert (= (and start!105268 res!835477) b!1253234))

(assert (= (and b!1253234 res!835476) b!1253236))

(assert (= (and b!1253236 res!835474) b!1253232))

(assert (= (and b!1253232 res!835475) b!1253237))

(assert (= (and b!1253233 condMapEmpty!49309) mapIsEmpty!49309))

(assert (= (and b!1253233 (not condMapEmpty!49309)) mapNonEmpty!49309))

(get-info :version)

(assert (= (and mapNonEmpty!49309 ((_ is ValueCellFull!15083) mapValue!49309)) b!1253238))

(assert (= (and b!1253233 ((_ is ValueCellFull!15083) mapDefault!49309)) b!1253235))

(assert (= start!105268 b!1253233))

(declare-fun m!1154247 () Bool)

(assert (=> start!105268 m!1154247))

(declare-fun m!1154249 () Bool)

(assert (=> start!105268 m!1154249))

(declare-fun m!1154251 () Bool)

(assert (=> start!105268 m!1154251))

(declare-fun m!1154253 () Bool)

(assert (=> b!1253236 m!1154253))

(declare-fun m!1154255 () Bool)

(assert (=> b!1253232 m!1154255))

(declare-fun m!1154257 () Bool)

(assert (=> b!1253237 m!1154257))

(declare-fun m!1154259 () Bool)

(assert (=> b!1253237 m!1154259))

(declare-fun m!1154261 () Bool)

(assert (=> b!1253237 m!1154261))

(declare-fun m!1154263 () Bool)

(assert (=> mapNonEmpty!49309 m!1154263))

(check-sat (not b_next!26791) tp_is_empty!31693 (not b!1253232) b_and!44589 (not start!105268) (not b!1253237) (not b!1253236) (not mapNonEmpty!49309))
(check-sat b_and!44589 (not b_next!26791))
