; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105336 () Bool)

(assert start!105336)

(declare-fun b_free!27009 () Bool)

(declare-fun b_next!27009 () Bool)

(assert (=> start!105336 (= b_free!27009 (not b_next!27009))))

(declare-fun tp!94538 () Bool)

(declare-fun b_and!44847 () Bool)

(assert (=> start!105336 (= tp!94538 b_and!44847)))

(declare-fun b!1255078 () Bool)

(declare-fun e!713262 () Bool)

(declare-fun e!713260 () Bool)

(declare-fun mapRes!49648 () Bool)

(assert (=> b!1255078 (= e!713262 (and e!713260 mapRes!49648))))

(declare-fun condMapEmpty!49648 () Bool)

(declare-datatypes ((V!47913 0))(
  ( (V!47914 (val!16018 Int)) )
))
(declare-datatypes ((ValueCell!15192 0))(
  ( (ValueCellFull!15192 (v!18718 V!47913)) (EmptyCell!15192) )
))
(declare-datatypes ((array!81472 0))(
  ( (array!81473 (arr!39296 (Array (_ BitVec 32) ValueCell!15192)) (size!39832 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81472)

(declare-fun mapDefault!49648 () ValueCell!15192)

(assert (=> b!1255078 (= condMapEmpty!49648 (= (arr!39296 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15192)) mapDefault!49648)))))

(declare-fun b!1255079 () Bool)

(declare-fun e!713259 () Bool)

(declare-fun tp_is_empty!31911 () Bool)

(assert (=> b!1255079 (= e!713259 tp_is_empty!31911)))

(declare-fun res!836779 () Bool)

(declare-fun e!713261 () Bool)

(assert (=> start!105336 (=> (not res!836779) (not e!713261))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105336 (= res!836779 (validMask!0 mask!1466))))

(assert (=> start!105336 e!713261))

(assert (=> start!105336 true))

(assert (=> start!105336 tp!94538))

(assert (=> start!105336 tp_is_empty!31911))

(declare-datatypes ((array!81474 0))(
  ( (array!81475 (arr!39297 (Array (_ BitVec 32) (_ BitVec 64))) (size!39833 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81474)

(declare-fun array_inv!29949 (array!81474) Bool)

(assert (=> start!105336 (array_inv!29949 _keys!1118)))

(declare-fun array_inv!29950 (array!81472) Bool)

(assert (=> start!105336 (and (array_inv!29950 _values!914) e!713262)))

(declare-fun mapIsEmpty!49648 () Bool)

(assert (=> mapIsEmpty!49648 mapRes!49648))

(declare-fun b!1255080 () Bool)

(declare-fun res!836777 () Bool)

(assert (=> b!1255080 (=> (not res!836777) (not e!713261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81474 (_ BitVec 32)) Bool)

(assert (=> b!1255080 (= res!836777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255081 () Bool)

(assert (=> b!1255081 (= e!713260 tp_is_empty!31911)))

(declare-fun b!1255082 () Bool)

(assert (=> b!1255082 (= e!713261 (not true))))

(declare-datatypes ((tuple2!20688 0))(
  ( (tuple2!20689 (_1!10355 (_ BitVec 64)) (_2!10355 V!47913)) )
))
(declare-datatypes ((List!27910 0))(
  ( (Nil!27907) (Cons!27906 (h!29115 tuple2!20688) (t!41395 List!27910)) )
))
(declare-datatypes ((ListLongMap!18561 0))(
  ( (ListLongMap!18562 (toList!9296 List!27910)) )
))
(declare-fun lt!567424 () ListLongMap!18561)

(declare-fun lt!567426 () ListLongMap!18561)

(assert (=> b!1255082 (= lt!567424 lt!567426)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47913)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47913)

(declare-datatypes ((Unit!41778 0))(
  ( (Unit!41779) )
))
(declare-fun lt!567425 () Unit!41778)

(declare-fun minValueBefore!43 () V!47913)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1045 (array!81474 array!81472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47913 V!47913 V!47913 V!47913 (_ BitVec 32) Int) Unit!41778)

(assert (=> b!1255082 (= lt!567425 (lemmaNoChangeToArrayThenSameMapNoExtras!1045 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5681 (array!81474 array!81472 (_ BitVec 32) (_ BitVec 32) V!47913 V!47913 (_ BitVec 32) Int) ListLongMap!18561)

(assert (=> b!1255082 (= lt!567426 (getCurrentListMapNoExtraKeys!5681 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255082 (= lt!567424 (getCurrentListMapNoExtraKeys!5681 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49648 () Bool)

(declare-fun tp!94537 () Bool)

(assert (=> mapNonEmpty!49648 (= mapRes!49648 (and tp!94537 e!713259))))

(declare-fun mapValue!49648 () ValueCell!15192)

(declare-fun mapRest!49648 () (Array (_ BitVec 32) ValueCell!15192))

(declare-fun mapKey!49648 () (_ BitVec 32))

(assert (=> mapNonEmpty!49648 (= (arr!39296 _values!914) (store mapRest!49648 mapKey!49648 mapValue!49648))))

(declare-fun b!1255083 () Bool)

(declare-fun res!836776 () Bool)

(assert (=> b!1255083 (=> (not res!836776) (not e!713261))))

(assert (=> b!1255083 (= res!836776 (and (= (size!39832 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39833 _keys!1118) (size!39832 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255084 () Bool)

(declare-fun res!836778 () Bool)

(assert (=> b!1255084 (=> (not res!836778) (not e!713261))))

(declare-datatypes ((List!27911 0))(
  ( (Nil!27908) (Cons!27907 (h!29116 (_ BitVec 64)) (t!41396 List!27911)) )
))
(declare-fun arrayNoDuplicates!0 (array!81474 (_ BitVec 32) List!27911) Bool)

(assert (=> b!1255084 (= res!836778 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27908))))

(assert (= (and start!105336 res!836779) b!1255083))

(assert (= (and b!1255083 res!836776) b!1255080))

(assert (= (and b!1255080 res!836777) b!1255084))

(assert (= (and b!1255084 res!836778) b!1255082))

(assert (= (and b!1255078 condMapEmpty!49648) mapIsEmpty!49648))

(assert (= (and b!1255078 (not condMapEmpty!49648)) mapNonEmpty!49648))

(get-info :version)

(assert (= (and mapNonEmpty!49648 ((_ is ValueCellFull!15192) mapValue!49648)) b!1255079))

(assert (= (and b!1255078 ((_ is ValueCellFull!15192) mapDefault!49648)) b!1255081))

(assert (= start!105336 b!1255078))

(declare-fun m!1155869 () Bool)

(assert (=> b!1255080 m!1155869))

(declare-fun m!1155871 () Bool)

(assert (=> start!105336 m!1155871))

(declare-fun m!1155873 () Bool)

(assert (=> start!105336 m!1155873))

(declare-fun m!1155875 () Bool)

(assert (=> start!105336 m!1155875))

(declare-fun m!1155877 () Bool)

(assert (=> b!1255084 m!1155877))

(declare-fun m!1155879 () Bool)

(assert (=> b!1255082 m!1155879))

(declare-fun m!1155881 () Bool)

(assert (=> b!1255082 m!1155881))

(declare-fun m!1155883 () Bool)

(assert (=> b!1255082 m!1155883))

(declare-fun m!1155885 () Bool)

(assert (=> mapNonEmpty!49648 m!1155885))

(check-sat (not b_next!27009) b_and!44847 (not b!1255084) (not b!1255080) (not start!105336) tp_is_empty!31911 (not b!1255082) (not mapNonEmpty!49648))
(check-sat b_and!44847 (not b_next!27009))
