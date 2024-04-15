; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105058 () Bool)

(assert start!105058)

(declare-fun b_free!26809 () Bool)

(declare-fun b_next!26809 () Bool)

(assert (=> start!105058 (= b_free!26809 (not b_next!26809))))

(declare-fun tp!93925 () Bool)

(declare-fun b_and!44587 () Bool)

(assert (=> start!105058 (= tp!93925 b_and!44587)))

(declare-fun b!1252034 () Bool)

(declare-fun res!835022 () Bool)

(declare-fun e!711066 () Bool)

(assert (=> b!1252034 (=> (not res!835022) (not e!711066))))

(declare-datatypes ((array!81007 0))(
  ( (array!81008 (arr!39068 (Array (_ BitVec 32) (_ BitVec 64))) (size!39606 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81007)

(declare-datatypes ((List!27832 0))(
  ( (Nil!27829) (Cons!27828 (h!29037 (_ BitVec 64)) (t!41300 List!27832)) )
))
(declare-fun arrayNoDuplicates!0 (array!81007 (_ BitVec 32) List!27832) Bool)

(assert (=> b!1252034 (= res!835022 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27829))))

(declare-fun b!1252036 () Bool)

(declare-fun res!835024 () Bool)

(assert (=> b!1252036 (=> (not res!835024) (not e!711066))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81007 (_ BitVec 32)) Bool)

(assert (=> b!1252036 (= res!835024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252037 () Bool)

(assert (=> b!1252037 (= e!711066 (not true))))

(declare-datatypes ((V!47647 0))(
  ( (V!47648 (val!15918 Int)) )
))
(declare-datatypes ((tuple2!20618 0))(
  ( (tuple2!20619 (_1!10320 (_ BitVec 64)) (_2!10320 V!47647)) )
))
(declare-datatypes ((List!27833 0))(
  ( (Nil!27830) (Cons!27829 (h!29038 tuple2!20618) (t!41301 List!27833)) )
))
(declare-datatypes ((ListLongMap!18491 0))(
  ( (ListLongMap!18492 (toList!9261 List!27833)) )
))
(declare-fun lt!565007 () ListLongMap!18491)

(declare-fun lt!565006 () ListLongMap!18491)

(assert (=> b!1252037 (= lt!565007 lt!565006)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47647)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47647)

(declare-datatypes ((ValueCell!15092 0))(
  ( (ValueCellFull!15092 (v!18615 V!47647)) (EmptyCell!15092) )
))
(declare-datatypes ((array!81009 0))(
  ( (array!81010 (arr!39069 (Array (_ BitVec 32) ValueCell!15092)) (size!39607 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81009)

(declare-datatypes ((Unit!41488 0))(
  ( (Unit!41489) )
))
(declare-fun lt!565005 () Unit!41488)

(declare-fun minValueBefore!43 () V!47647)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!987 (array!81007 array!81009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47647 V!47647 V!47647 V!47647 (_ BitVec 32) Int) Unit!41488)

(assert (=> b!1252037 (= lt!565005 (lemmaNoChangeToArrayThenSameMapNoExtras!987 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5665 (array!81007 array!81009 (_ BitVec 32) (_ BitVec 32) V!47647 V!47647 (_ BitVec 32) Int) ListLongMap!18491)

(assert (=> b!1252037 (= lt!565006 (getCurrentListMapNoExtraKeys!5665 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252037 (= lt!565007 (getCurrentListMapNoExtraKeys!5665 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252038 () Bool)

(declare-fun e!711068 () Bool)

(declare-fun tp_is_empty!31711 () Bool)

(assert (=> b!1252038 (= e!711068 tp_is_empty!31711)))

(declare-fun b!1252039 () Bool)

(declare-fun e!711070 () Bool)

(declare-fun mapRes!49336 () Bool)

(assert (=> b!1252039 (= e!711070 (and e!711068 mapRes!49336))))

(declare-fun condMapEmpty!49336 () Bool)

(declare-fun mapDefault!49336 () ValueCell!15092)

(assert (=> b!1252039 (= condMapEmpty!49336 (= (arr!39069 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15092)) mapDefault!49336)))))

(declare-fun b!1252040 () Bool)

(declare-fun e!711067 () Bool)

(assert (=> b!1252040 (= e!711067 tp_is_empty!31711)))

(declare-fun res!835025 () Bool)

(assert (=> start!105058 (=> (not res!835025) (not e!711066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105058 (= res!835025 (validMask!0 mask!1466))))

(assert (=> start!105058 e!711066))

(assert (=> start!105058 true))

(assert (=> start!105058 tp!93925))

(assert (=> start!105058 tp_is_empty!31711))

(declare-fun array_inv!29923 (array!81007) Bool)

(assert (=> start!105058 (array_inv!29923 _keys!1118)))

(declare-fun array_inv!29924 (array!81009) Bool)

(assert (=> start!105058 (and (array_inv!29924 _values!914) e!711070)))

(declare-fun b!1252035 () Bool)

(declare-fun res!835023 () Bool)

(assert (=> b!1252035 (=> (not res!835023) (not e!711066))))

(assert (=> b!1252035 (= res!835023 (and (= (size!39607 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39606 _keys!1118) (size!39607 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49336 () Bool)

(declare-fun tp!93926 () Bool)

(assert (=> mapNonEmpty!49336 (= mapRes!49336 (and tp!93926 e!711067))))

(declare-fun mapRest!49336 () (Array (_ BitVec 32) ValueCell!15092))

(declare-fun mapKey!49336 () (_ BitVec 32))

(declare-fun mapValue!49336 () ValueCell!15092)

(assert (=> mapNonEmpty!49336 (= (arr!39069 _values!914) (store mapRest!49336 mapKey!49336 mapValue!49336))))

(declare-fun mapIsEmpty!49336 () Bool)

(assert (=> mapIsEmpty!49336 mapRes!49336))

(assert (= (and start!105058 res!835025) b!1252035))

(assert (= (and b!1252035 res!835023) b!1252036))

(assert (= (and b!1252036 res!835024) b!1252034))

(assert (= (and b!1252034 res!835022) b!1252037))

(assert (= (and b!1252039 condMapEmpty!49336) mapIsEmpty!49336))

(assert (= (and b!1252039 (not condMapEmpty!49336)) mapNonEmpty!49336))

(get-info :version)

(assert (= (and mapNonEmpty!49336 ((_ is ValueCellFull!15092) mapValue!49336)) b!1252040))

(assert (= (and b!1252039 ((_ is ValueCellFull!15092) mapDefault!49336)) b!1252038))

(assert (= start!105058 b!1252039))

(declare-fun m!1152277 () Bool)

(assert (=> b!1252037 m!1152277))

(declare-fun m!1152279 () Bool)

(assert (=> b!1252037 m!1152279))

(declare-fun m!1152281 () Bool)

(assert (=> b!1252037 m!1152281))

(declare-fun m!1152283 () Bool)

(assert (=> b!1252036 m!1152283))

(declare-fun m!1152285 () Bool)

(assert (=> start!105058 m!1152285))

(declare-fun m!1152287 () Bool)

(assert (=> start!105058 m!1152287))

(declare-fun m!1152289 () Bool)

(assert (=> start!105058 m!1152289))

(declare-fun m!1152291 () Bool)

(assert (=> mapNonEmpty!49336 m!1152291))

(declare-fun m!1152293 () Bool)

(assert (=> b!1252034 m!1152293))

(check-sat (not b!1252034) (not b!1252036) (not b_next!26809) (not start!105058) b_and!44587 (not b!1252037) tp_is_empty!31711 (not mapNonEmpty!49336))
(check-sat b_and!44587 (not b_next!26809))
