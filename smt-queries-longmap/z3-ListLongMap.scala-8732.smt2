; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106110 () Bool)

(assert start!106110)

(declare-fun b_free!27427 () Bool)

(declare-fun b_next!27427 () Bool)

(assert (=> start!106110 (= b_free!27427 (not b_next!27427))))

(declare-fun tp!95813 () Bool)

(declare-fun b_and!45337 () Bool)

(assert (=> start!106110 (= tp!95813 b_and!45337)))

(declare-fun b!1262536 () Bool)

(declare-fun e!718647 () Bool)

(declare-fun tp_is_empty!32329 () Bool)

(assert (=> b!1262536 (= e!718647 tp_is_empty!32329)))

(declare-fun b!1262537 () Bool)

(declare-fun e!718643 () Bool)

(assert (=> b!1262537 (= e!718643 tp_is_empty!32329)))

(declare-fun b!1262538 () Bool)

(declare-fun res!840977 () Bool)

(declare-fun e!718645 () Bool)

(assert (=> b!1262538 (=> (not res!840977) (not e!718645))))

(declare-datatypes ((array!82319 0))(
  ( (array!82320 (arr!39708 (Array (_ BitVec 32) (_ BitVec 64))) (size!40245 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82319)

(declare-datatypes ((List!28232 0))(
  ( (Nil!28229) (Cons!28228 (h!29446 (_ BitVec 64)) (t!41723 List!28232)) )
))
(declare-fun arrayNoDuplicates!0 (array!82319 (_ BitVec 32) List!28232) Bool)

(assert (=> b!1262538 (= res!840977 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28229))))

(declare-fun b!1262539 () Bool)

(assert (=> b!1262539 (= e!718645 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48471 0))(
  ( (V!48472 (val!16227 Int)) )
))
(declare-datatypes ((tuple2!21010 0))(
  ( (tuple2!21011 (_1!10516 (_ BitVec 64)) (_2!10516 V!48471)) )
))
(declare-datatypes ((List!28233 0))(
  ( (Nil!28230) (Cons!28229 (h!29447 tuple2!21010) (t!41724 List!28233)) )
))
(declare-datatypes ((ListLongMap!18891 0))(
  ( (ListLongMap!18892 (toList!9461 List!28233)) )
))
(declare-fun lt!572053 () ListLongMap!18891)

(declare-fun minValueAfter!43 () V!48471)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48471)

(declare-datatypes ((ValueCell!15401 0))(
  ( (ValueCellFull!15401 (v!18927 V!48471)) (EmptyCell!15401) )
))
(declare-datatypes ((array!82321 0))(
  ( (array!82322 (arr!39709 (Array (_ BitVec 32) ValueCell!15401)) (size!40246 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82321)

(declare-fun getCurrentListMapNoExtraKeys!5867 (array!82319 array!82321 (_ BitVec 32) (_ BitVec 32) V!48471 V!48471 (_ BitVec 32) Int) ListLongMap!18891)

(assert (=> b!1262539 (= lt!572053 (getCurrentListMapNoExtraKeys!5867 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48471)

(declare-fun lt!572052 () ListLongMap!18891)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262539 (= lt!572052 (getCurrentListMapNoExtraKeys!5867 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840976 () Bool)

(assert (=> start!106110 (=> (not res!840976) (not e!718645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106110 (= res!840976 (validMask!0 mask!1466))))

(assert (=> start!106110 e!718645))

(assert (=> start!106110 true))

(assert (=> start!106110 tp!95813))

(assert (=> start!106110 tp_is_empty!32329))

(declare-fun array_inv!30377 (array!82319) Bool)

(assert (=> start!106110 (array_inv!30377 _keys!1118)))

(declare-fun e!718646 () Bool)

(declare-fun array_inv!30378 (array!82321) Bool)

(assert (=> start!106110 (and (array_inv!30378 _values!914) e!718646)))

(declare-fun mapIsEmpty!50296 () Bool)

(declare-fun mapRes!50296 () Bool)

(assert (=> mapIsEmpty!50296 mapRes!50296))

(declare-fun b!1262540 () Bool)

(assert (=> b!1262540 (= e!718646 (and e!718647 mapRes!50296))))

(declare-fun condMapEmpty!50296 () Bool)

(declare-fun mapDefault!50296 () ValueCell!15401)

(assert (=> b!1262540 (= condMapEmpty!50296 (= (arr!39709 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15401)) mapDefault!50296)))))

(declare-fun b!1262541 () Bool)

(declare-fun res!840975 () Bool)

(assert (=> b!1262541 (=> (not res!840975) (not e!718645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82319 (_ BitVec 32)) Bool)

(assert (=> b!1262541 (= res!840975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50296 () Bool)

(declare-fun tp!95812 () Bool)

(assert (=> mapNonEmpty!50296 (= mapRes!50296 (and tp!95812 e!718643))))

(declare-fun mapRest!50296 () (Array (_ BitVec 32) ValueCell!15401))

(declare-fun mapValue!50296 () ValueCell!15401)

(declare-fun mapKey!50296 () (_ BitVec 32))

(assert (=> mapNonEmpty!50296 (= (arr!39709 _values!914) (store mapRest!50296 mapKey!50296 mapValue!50296))))

(declare-fun b!1262542 () Bool)

(declare-fun res!840974 () Bool)

(assert (=> b!1262542 (=> (not res!840974) (not e!718645))))

(assert (=> b!1262542 (= res!840974 (and (= (size!40246 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40245 _keys!1118) (size!40246 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106110 res!840976) b!1262542))

(assert (= (and b!1262542 res!840974) b!1262541))

(assert (= (and b!1262541 res!840975) b!1262538))

(assert (= (and b!1262538 res!840977) b!1262539))

(assert (= (and b!1262540 condMapEmpty!50296) mapIsEmpty!50296))

(assert (= (and b!1262540 (not condMapEmpty!50296)) mapNonEmpty!50296))

(get-info :version)

(assert (= (and mapNonEmpty!50296 ((_ is ValueCellFull!15401) mapValue!50296)) b!1262537))

(assert (= (and b!1262540 ((_ is ValueCellFull!15401) mapDefault!50296)) b!1262536))

(assert (= start!106110 b!1262540))

(declare-fun m!1163517 () Bool)

(assert (=> start!106110 m!1163517))

(declare-fun m!1163519 () Bool)

(assert (=> start!106110 m!1163519))

(declare-fun m!1163521 () Bool)

(assert (=> start!106110 m!1163521))

(declare-fun m!1163523 () Bool)

(assert (=> b!1262541 m!1163523))

(declare-fun m!1163525 () Bool)

(assert (=> mapNonEmpty!50296 m!1163525))

(declare-fun m!1163527 () Bool)

(assert (=> b!1262538 m!1163527))

(declare-fun m!1163529 () Bool)

(assert (=> b!1262539 m!1163529))

(declare-fun m!1163531 () Bool)

(assert (=> b!1262539 m!1163531))

(check-sat b_and!45337 tp_is_empty!32329 (not b!1262541) (not start!106110) (not mapNonEmpty!50296) (not b!1262539) (not b!1262538) (not b_next!27427))
(check-sat b_and!45337 (not b_next!27427))
