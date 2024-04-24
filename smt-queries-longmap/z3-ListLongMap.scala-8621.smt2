; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105216 () Bool)

(assert start!105216)

(declare-fun b_free!26761 () Bool)

(declare-fun b_next!26761 () Bool)

(assert (=> start!105216 (= b_free!26761 (not b_next!26761))))

(declare-fun tp!93778 () Bool)

(declare-fun b_and!44549 () Bool)

(assert (=> start!105216 (= tp!93778 b_and!44549)))

(declare-fun res!835205 () Bool)

(declare-fun e!711470 () Bool)

(assert (=> start!105216 (=> (not res!835205) (not e!711470))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105216 (= res!835205 (validMask!0 mask!1466))))

(assert (=> start!105216 e!711470))

(assert (=> start!105216 true))

(assert (=> start!105216 tp!93778))

(declare-fun tp_is_empty!31663 () Bool)

(assert (=> start!105216 tp_is_empty!31663))

(declare-datatypes ((array!81039 0))(
  ( (array!81040 (arr!39080 (Array (_ BitVec 32) (_ BitVec 64))) (size!39617 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81039)

(declare-fun array_inv!29921 (array!81039) Bool)

(assert (=> start!105216 (array_inv!29921 _keys!1118)))

(declare-datatypes ((V!47583 0))(
  ( (V!47584 (val!15894 Int)) )
))
(declare-datatypes ((ValueCell!15068 0))(
  ( (ValueCellFull!15068 (v!18587 V!47583)) (EmptyCell!15068) )
))
(declare-datatypes ((array!81041 0))(
  ( (array!81042 (arr!39081 (Array (_ BitVec 32) ValueCell!15068)) (size!39618 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81041)

(declare-fun e!711469 () Bool)

(declare-fun array_inv!29922 (array!81041) Bool)

(assert (=> start!105216 (and (array_inv!29922 _values!914) e!711469)))

(declare-fun b!1252728 () Bool)

(declare-fun e!711467 () Bool)

(declare-fun e!711472 () Bool)

(assert (=> b!1252728 (= e!711467 e!711472)))

(declare-fun res!835202 () Bool)

(assert (=> b!1252728 (=> res!835202 e!711472)))

(declare-datatypes ((tuple2!20518 0))(
  ( (tuple2!20519 (_1!10270 (_ BitVec 64)) (_2!10270 V!47583)) )
))
(declare-datatypes ((List!27763 0))(
  ( (Nil!27760) (Cons!27759 (h!28977 tuple2!20518) (t!41230 List!27763)) )
))
(declare-datatypes ((ListLongMap!18399 0))(
  ( (ListLongMap!18400 (toList!9215 List!27763)) )
))
(declare-fun lt!565298 () ListLongMap!18399)

(declare-fun contains!7538 (ListLongMap!18399 (_ BitVec 64)) Bool)

(assert (=> b!1252728 (= res!835202 (contains!7538 lt!565298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47583)

(declare-fun minValueBefore!43 () V!47583)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4474 (array!81039 array!81041 (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 (_ BitVec 32) Int) ListLongMap!18399)

(assert (=> b!1252728 (= lt!565298 (getCurrentListMap!4474 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252729 () Bool)

(declare-fun res!835206 () Bool)

(assert (=> b!1252729 (=> (not res!835206) (not e!711470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81039 (_ BitVec 32)) Bool)

(assert (=> b!1252729 (= res!835206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252730 () Bool)

(declare-fun e!711471 () Bool)

(assert (=> b!1252730 (= e!711471 tp_is_empty!31663)))

(declare-fun mapIsEmpty!49261 () Bool)

(declare-fun mapRes!49261 () Bool)

(assert (=> mapIsEmpty!49261 mapRes!49261))

(declare-fun mapNonEmpty!49261 () Bool)

(declare-fun tp!93779 () Bool)

(assert (=> mapNonEmpty!49261 (= mapRes!49261 (and tp!93779 e!711471))))

(declare-fun mapRest!49261 () (Array (_ BitVec 32) ValueCell!15068))

(declare-fun mapKey!49261 () (_ BitVec 32))

(declare-fun mapValue!49261 () ValueCell!15068)

(assert (=> mapNonEmpty!49261 (= (arr!39081 _values!914) (store mapRest!49261 mapKey!49261 mapValue!49261))))

(declare-fun b!1252731 () Bool)

(declare-fun e!711468 () Bool)

(assert (=> b!1252731 (= e!711468 tp_is_empty!31663)))

(declare-fun b!1252732 () Bool)

(declare-fun res!835201 () Bool)

(assert (=> b!1252732 (=> (not res!835201) (not e!711470))))

(declare-datatypes ((List!27764 0))(
  ( (Nil!27761) (Cons!27760 (h!28978 (_ BitVec 64)) (t!41231 List!27764)) )
))
(declare-fun arrayNoDuplicates!0 (array!81039 (_ BitVec 32) List!27764) Bool)

(assert (=> b!1252732 (= res!835201 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27761))))

(declare-fun b!1252733 () Bool)

(declare-fun res!835204 () Bool)

(assert (=> b!1252733 (=> (not res!835204) (not e!711470))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252733 (= res!835204 (and (= (size!39618 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39617 _keys!1118) (size!39618 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252734 () Bool)

(assert (=> b!1252734 (= e!711469 (and e!711468 mapRes!49261))))

(declare-fun condMapEmpty!49261 () Bool)

(declare-fun mapDefault!49261 () ValueCell!15068)

(assert (=> b!1252734 (= condMapEmpty!49261 (= (arr!39081 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15068)) mapDefault!49261)))))

(declare-fun b!1252735 () Bool)

(assert (=> b!1252735 (= e!711470 (not e!711467))))

(declare-fun res!835203 () Bool)

(assert (=> b!1252735 (=> res!835203 e!711467)))

(assert (=> b!1252735 (= res!835203 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565299 () ListLongMap!18399)

(declare-fun lt!565297 () ListLongMap!18399)

(assert (=> b!1252735 (= lt!565299 lt!565297)))

(declare-fun minValueAfter!43 () V!47583)

(declare-datatypes ((Unit!41566 0))(
  ( (Unit!41567) )
))
(declare-fun lt!565300 () Unit!41566)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!956 (array!81039 array!81041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 V!47583 V!47583 (_ BitVec 32) Int) Unit!41566)

(assert (=> b!1252735 (= lt!565300 (lemmaNoChangeToArrayThenSameMapNoExtras!956 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5642 (array!81039 array!81041 (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 (_ BitVec 32) Int) ListLongMap!18399)

(assert (=> b!1252735 (= lt!565297 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252735 (= lt!565299 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252736 () Bool)

(assert (=> b!1252736 (= e!711472 true)))

(declare-fun -!1999 (ListLongMap!18399 (_ BitVec 64)) ListLongMap!18399)

(assert (=> b!1252736 (= (-!1999 lt!565298 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565298)))

(declare-fun lt!565296 () Unit!41566)

(declare-fun removeNotPresentStillSame!109 (ListLongMap!18399 (_ BitVec 64)) Unit!41566)

(assert (=> b!1252736 (= lt!565296 (removeNotPresentStillSame!109 lt!565298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105216 res!835205) b!1252733))

(assert (= (and b!1252733 res!835204) b!1252729))

(assert (= (and b!1252729 res!835206) b!1252732))

(assert (= (and b!1252732 res!835201) b!1252735))

(assert (= (and b!1252735 (not res!835203)) b!1252728))

(assert (= (and b!1252728 (not res!835202)) b!1252736))

(assert (= (and b!1252734 condMapEmpty!49261) mapIsEmpty!49261))

(assert (= (and b!1252734 (not condMapEmpty!49261)) mapNonEmpty!49261))

(get-info :version)

(assert (= (and mapNonEmpty!49261 ((_ is ValueCellFull!15068) mapValue!49261)) b!1252730))

(assert (= (and b!1252734 ((_ is ValueCellFull!15068) mapDefault!49261)) b!1252731))

(assert (= start!105216 b!1252734))

(declare-fun m!1153803 () Bool)

(assert (=> start!105216 m!1153803))

(declare-fun m!1153805 () Bool)

(assert (=> start!105216 m!1153805))

(declare-fun m!1153807 () Bool)

(assert (=> start!105216 m!1153807))

(declare-fun m!1153809 () Bool)

(assert (=> b!1252728 m!1153809))

(declare-fun m!1153811 () Bool)

(assert (=> b!1252728 m!1153811))

(declare-fun m!1153813 () Bool)

(assert (=> b!1252736 m!1153813))

(declare-fun m!1153815 () Bool)

(assert (=> b!1252736 m!1153815))

(declare-fun m!1153817 () Bool)

(assert (=> mapNonEmpty!49261 m!1153817))

(declare-fun m!1153819 () Bool)

(assert (=> b!1252732 m!1153819))

(declare-fun m!1153821 () Bool)

(assert (=> b!1252735 m!1153821))

(declare-fun m!1153823 () Bool)

(assert (=> b!1252735 m!1153823))

(declare-fun m!1153825 () Bool)

(assert (=> b!1252735 m!1153825))

(declare-fun m!1153827 () Bool)

(assert (=> b!1252729 m!1153827))

(check-sat (not b!1252735) (not b!1252728) (not mapNonEmpty!49261) (not b!1252729) tp_is_empty!31663 (not start!105216) (not b!1252732) (not b!1252736) (not b_next!26761) b_and!44549)
(check-sat b_and!44549 (not b_next!26761))
