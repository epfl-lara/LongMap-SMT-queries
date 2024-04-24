; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105342 () Bool)

(assert start!105342)

(declare-fun b_free!26851 () Bool)

(declare-fun b_next!26851 () Bool)

(assert (=> start!105342 (= b_free!26851 (not b_next!26851))))

(declare-fun tp!94054 () Bool)

(declare-fun b_and!44657 () Bool)

(assert (=> start!105342 (= tp!94054 b_and!44657)))

(declare-fun b!1253985 () Bool)

(declare-fun res!835906 () Bool)

(declare-fun e!712366 () Bool)

(assert (=> b!1253985 (=> (not res!835906) (not e!712366))))

(declare-datatypes ((array!81213 0))(
  ( (array!81214 (arr!39165 (Array (_ BitVec 32) (_ BitVec 64))) (size!39702 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81213)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81213 (_ BitVec 32)) Bool)

(assert (=> b!1253985 (= res!835906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253986 () Bool)

(declare-fun res!835904 () Bool)

(assert (=> b!1253986 (=> (not res!835904) (not e!712366))))

(declare-datatypes ((List!27825 0))(
  ( (Nil!27822) (Cons!27821 (h!29039 (_ BitVec 64)) (t!41296 List!27825)) )
))
(declare-fun arrayNoDuplicates!0 (array!81213 (_ BitVec 32) List!27825) Bool)

(assert (=> b!1253986 (= res!835904 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27822))))

(declare-fun b!1253987 () Bool)

(declare-fun e!712370 () Bool)

(declare-fun tp_is_empty!31753 () Bool)

(assert (=> b!1253987 (= e!712370 tp_is_empty!31753)))

(declare-fun b!1253988 () Bool)

(declare-fun e!712368 () Bool)

(assert (=> b!1253988 (= e!712366 (not e!712368))))

(declare-fun res!835903 () Bool)

(assert (=> b!1253988 (=> res!835903 e!712368)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253988 (= res!835903 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47703 0))(
  ( (V!47704 (val!15939 Int)) )
))
(declare-datatypes ((tuple2!20582 0))(
  ( (tuple2!20583 (_1!10302 (_ BitVec 64)) (_2!10302 V!47703)) )
))
(declare-datatypes ((List!27826 0))(
  ( (Nil!27823) (Cons!27822 (h!29040 tuple2!20582) (t!41297 List!27826)) )
))
(declare-datatypes ((ListLongMap!18463 0))(
  ( (ListLongMap!18464 (toList!9247 List!27826)) )
))
(declare-fun lt!565936 () ListLongMap!18463)

(declare-fun lt!565935 () ListLongMap!18463)

(assert (=> b!1253988 (= lt!565936 lt!565935)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41632 0))(
  ( (Unit!41633) )
))
(declare-fun lt!565937 () Unit!41632)

(declare-fun minValueAfter!43 () V!47703)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47703)

(declare-datatypes ((ValueCell!15113 0))(
  ( (ValueCellFull!15113 (v!18633 V!47703)) (EmptyCell!15113) )
))
(declare-datatypes ((array!81215 0))(
  ( (array!81216 (arr!39166 (Array (_ BitVec 32) ValueCell!15113)) (size!39703 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81215)

(declare-fun minValueBefore!43 () V!47703)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!988 (array!81213 array!81215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 V!47703 V!47703 (_ BitVec 32) Int) Unit!41632)

(assert (=> b!1253988 (= lt!565937 (lemmaNoChangeToArrayThenSameMapNoExtras!988 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5674 (array!81213 array!81215 (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 (_ BitVec 32) Int) ListLongMap!18463)

(assert (=> b!1253988 (= lt!565935 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253988 (= lt!565936 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253989 () Bool)

(assert (=> b!1253989 (= e!712368 true)))

(declare-fun lt!565938 () ListLongMap!18463)

(declare-fun getCurrentListMap!4486 (array!81213 array!81215 (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 (_ BitVec 32) Int) ListLongMap!18463)

(assert (=> b!1253989 (= lt!565938 (getCurrentListMap!4486 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835907 () Bool)

(assert (=> start!105342 (=> (not res!835907) (not e!712366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105342 (= res!835907 (validMask!0 mask!1466))))

(assert (=> start!105342 e!712366))

(assert (=> start!105342 true))

(assert (=> start!105342 tp!94054))

(assert (=> start!105342 tp_is_empty!31753))

(declare-fun array_inv!29979 (array!81213) Bool)

(assert (=> start!105342 (array_inv!29979 _keys!1118)))

(declare-fun e!712369 () Bool)

(declare-fun array_inv!29980 (array!81215) Bool)

(assert (=> start!105342 (and (array_inv!29980 _values!914) e!712369)))

(declare-fun b!1253990 () Bool)

(declare-fun e!712367 () Bool)

(declare-fun mapRes!49402 () Bool)

(assert (=> b!1253990 (= e!712369 (and e!712367 mapRes!49402))))

(declare-fun condMapEmpty!49402 () Bool)

(declare-fun mapDefault!49402 () ValueCell!15113)

(assert (=> b!1253990 (= condMapEmpty!49402 (= (arr!39166 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15113)) mapDefault!49402)))))

(declare-fun b!1253991 () Bool)

(declare-fun res!835905 () Bool)

(assert (=> b!1253991 (=> (not res!835905) (not e!712366))))

(assert (=> b!1253991 (= res!835905 (and (= (size!39703 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39702 _keys!1118) (size!39703 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49402 () Bool)

(assert (=> mapIsEmpty!49402 mapRes!49402))

(declare-fun b!1253992 () Bool)

(assert (=> b!1253992 (= e!712367 tp_is_empty!31753)))

(declare-fun mapNonEmpty!49402 () Bool)

(declare-fun tp!94055 () Bool)

(assert (=> mapNonEmpty!49402 (= mapRes!49402 (and tp!94055 e!712370))))

(declare-fun mapRest!49402 () (Array (_ BitVec 32) ValueCell!15113))

(declare-fun mapValue!49402 () ValueCell!15113)

(declare-fun mapKey!49402 () (_ BitVec 32))

(assert (=> mapNonEmpty!49402 (= (arr!39166 _values!914) (store mapRest!49402 mapKey!49402 mapValue!49402))))

(assert (= (and start!105342 res!835907) b!1253991))

(assert (= (and b!1253991 res!835905) b!1253985))

(assert (= (and b!1253985 res!835906) b!1253986))

(assert (= (and b!1253986 res!835904) b!1253988))

(assert (= (and b!1253988 (not res!835903)) b!1253989))

(assert (= (and b!1253990 condMapEmpty!49402) mapIsEmpty!49402))

(assert (= (and b!1253990 (not condMapEmpty!49402)) mapNonEmpty!49402))

(get-info :version)

(assert (= (and mapNonEmpty!49402 ((_ is ValueCellFull!15113) mapValue!49402)) b!1253987))

(assert (= (and b!1253990 ((_ is ValueCellFull!15113) mapDefault!49402)) b!1253992))

(assert (= start!105342 b!1253990))

(declare-fun m!1154877 () Bool)

(assert (=> b!1253988 m!1154877))

(declare-fun m!1154879 () Bool)

(assert (=> b!1253988 m!1154879))

(declare-fun m!1154881 () Bool)

(assert (=> b!1253988 m!1154881))

(declare-fun m!1154883 () Bool)

(assert (=> b!1253985 m!1154883))

(declare-fun m!1154885 () Bool)

(assert (=> start!105342 m!1154885))

(declare-fun m!1154887 () Bool)

(assert (=> start!105342 m!1154887))

(declare-fun m!1154889 () Bool)

(assert (=> start!105342 m!1154889))

(declare-fun m!1154891 () Bool)

(assert (=> mapNonEmpty!49402 m!1154891))

(declare-fun m!1154893 () Bool)

(assert (=> b!1253989 m!1154893))

(declare-fun m!1154895 () Bool)

(assert (=> b!1253986 m!1154895))

(check-sat (not b!1253985) tp_is_empty!31753 (not b_next!26851) b_and!44657 (not b!1253986) (not start!105342) (not mapNonEmpty!49402) (not b!1253988) (not b!1253989))
(check-sat b_and!44657 (not b_next!26851))
