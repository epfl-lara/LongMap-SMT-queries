; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104988 () Bool)

(assert start!104988)

(declare-fun b_free!26761 () Bool)

(declare-fun b_next!26761 () Bool)

(assert (=> start!104988 (= b_free!26761 (not b_next!26761))))

(declare-fun tp!93779 () Bool)

(declare-fun b_and!44529 () Bool)

(assert (=> start!104988 (= tp!93779 b_and!44529)))

(declare-fun b!1251341 () Bool)

(declare-fun res!834642 () Bool)

(declare-fun e!710575 () Bool)

(assert (=> b!1251341 (=> (not res!834642) (not e!710575))))

(declare-datatypes ((array!80911 0))(
  ( (array!80912 (arr!39021 (Array (_ BitVec 32) (_ BitVec 64))) (size!39559 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80911)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80911 (_ BitVec 32)) Bool)

(assert (=> b!1251341 (= res!834642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251342 () Bool)

(declare-fun e!710577 () Bool)

(declare-fun e!710574 () Bool)

(declare-fun mapRes!49261 () Bool)

(assert (=> b!1251342 (= e!710577 (and e!710574 mapRes!49261))))

(declare-fun condMapEmpty!49261 () Bool)

(declare-datatypes ((V!47583 0))(
  ( (V!47584 (val!15894 Int)) )
))
(declare-datatypes ((ValueCell!15068 0))(
  ( (ValueCellFull!15068 (v!18590 V!47583)) (EmptyCell!15068) )
))
(declare-datatypes ((array!80913 0))(
  ( (array!80914 (arr!39022 (Array (_ BitVec 32) ValueCell!15068)) (size!39560 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80913)

(declare-fun mapDefault!49261 () ValueCell!15068)

(assert (=> b!1251342 (= condMapEmpty!49261 (= (arr!39022 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15068)) mapDefault!49261)))))

(declare-fun b!1251343 () Bool)

(declare-fun e!710578 () Bool)

(declare-fun tp_is_empty!31663 () Bool)

(assert (=> b!1251343 (= e!710578 tp_is_empty!31663)))

(declare-fun mapIsEmpty!49261 () Bool)

(assert (=> mapIsEmpty!49261 mapRes!49261))

(declare-fun b!1251345 () Bool)

(declare-fun res!834641 () Bool)

(assert (=> b!1251345 (=> (not res!834641) (not e!710575))))

(declare-datatypes ((List!27794 0))(
  ( (Nil!27791) (Cons!27790 (h!28999 (_ BitVec 64)) (t!41260 List!27794)) )
))
(declare-fun arrayNoDuplicates!0 (array!80911 (_ BitVec 32) List!27794) Bool)

(assert (=> b!1251345 (= res!834641 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27791))))

(declare-fun b!1251346 () Bool)

(declare-fun res!834646 () Bool)

(assert (=> b!1251346 (=> (not res!834646) (not e!710575))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251346 (= res!834646 (and (= (size!39560 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39559 _keys!1118) (size!39560 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251347 () Bool)

(declare-fun e!710576 () Bool)

(declare-fun e!710579 () Bool)

(assert (=> b!1251347 (= e!710576 e!710579)))

(declare-fun res!834643 () Bool)

(assert (=> b!1251347 (=> res!834643 e!710579)))

(declare-datatypes ((tuple2!20578 0))(
  ( (tuple2!20579 (_1!10300 (_ BitVec 64)) (_2!10300 V!47583)) )
))
(declare-datatypes ((List!27795 0))(
  ( (Nil!27792) (Cons!27791 (h!29000 tuple2!20578) (t!41261 List!27795)) )
))
(declare-datatypes ((ListLongMap!18451 0))(
  ( (ListLongMap!18452 (toList!9241 List!27795)) )
))
(declare-fun lt!564635 () ListLongMap!18451)

(declare-fun contains!7481 (ListLongMap!18451 (_ BitVec 64)) Bool)

(assert (=> b!1251347 (= res!834643 (contains!7481 lt!564635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47583)

(declare-fun minValueBefore!43 () V!47583)

(declare-fun getCurrentListMap!4407 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 (_ BitVec 32) Int) ListLongMap!18451)

(assert (=> b!1251347 (= lt!564635 (getCurrentListMap!4407 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251348 () Bool)

(assert (=> b!1251348 (= e!710574 tp_is_empty!31663)))

(declare-fun b!1251344 () Bool)

(assert (=> b!1251344 (= e!710575 (not e!710576))))

(declare-fun res!834645 () Bool)

(assert (=> b!1251344 (=> res!834645 e!710576)))

(assert (=> b!1251344 (= res!834645 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564633 () ListLongMap!18451)

(declare-fun lt!564636 () ListLongMap!18451)

(assert (=> b!1251344 (= lt!564633 lt!564636)))

(declare-fun minValueAfter!43 () V!47583)

(declare-datatypes ((Unit!41448 0))(
  ( (Unit!41449) )
))
(declare-fun lt!564637 () Unit!41448)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!968 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 V!47583 V!47583 (_ BitVec 32) Int) Unit!41448)

(assert (=> b!1251344 (= lt!564637 (lemmaNoChangeToArrayThenSameMapNoExtras!968 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5646 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) V!47583 V!47583 (_ BitVec 32) Int) ListLongMap!18451)

(assert (=> b!1251344 (= lt!564636 (getCurrentListMapNoExtraKeys!5646 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251344 (= lt!564633 (getCurrentListMapNoExtraKeys!5646 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834644 () Bool)

(assert (=> start!104988 (=> (not res!834644) (not e!710575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104988 (= res!834644 (validMask!0 mask!1466))))

(assert (=> start!104988 e!710575))

(assert (=> start!104988 true))

(assert (=> start!104988 tp!93779))

(assert (=> start!104988 tp_is_empty!31663))

(declare-fun array_inv!29893 (array!80911) Bool)

(assert (=> start!104988 (array_inv!29893 _keys!1118)))

(declare-fun array_inv!29894 (array!80913) Bool)

(assert (=> start!104988 (and (array_inv!29894 _values!914) e!710577)))

(declare-fun b!1251349 () Bool)

(assert (=> b!1251349 (= e!710579 true)))

(declare-fun -!1984 (ListLongMap!18451 (_ BitVec 64)) ListLongMap!18451)

(assert (=> b!1251349 (= (-!1984 lt!564635 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564635)))

(declare-fun lt!564634 () Unit!41448)

(declare-fun removeNotPresentStillSame!112 (ListLongMap!18451 (_ BitVec 64)) Unit!41448)

(assert (=> b!1251349 (= lt!564634 (removeNotPresentStillSame!112 lt!564635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49261 () Bool)

(declare-fun tp!93778 () Bool)

(assert (=> mapNonEmpty!49261 (= mapRes!49261 (and tp!93778 e!710578))))

(declare-fun mapValue!49261 () ValueCell!15068)

(declare-fun mapKey!49261 () (_ BitVec 32))

(declare-fun mapRest!49261 () (Array (_ BitVec 32) ValueCell!15068))

(assert (=> mapNonEmpty!49261 (= (arr!39022 _values!914) (store mapRest!49261 mapKey!49261 mapValue!49261))))

(assert (= (and start!104988 res!834644) b!1251346))

(assert (= (and b!1251346 res!834646) b!1251341))

(assert (= (and b!1251341 res!834642) b!1251345))

(assert (= (and b!1251345 res!834641) b!1251344))

(assert (= (and b!1251344 (not res!834645)) b!1251347))

(assert (= (and b!1251347 (not res!834643)) b!1251349))

(assert (= (and b!1251342 condMapEmpty!49261) mapIsEmpty!49261))

(assert (= (and b!1251342 (not condMapEmpty!49261)) mapNonEmpty!49261))

(get-info :version)

(assert (= (and mapNonEmpty!49261 ((_ is ValueCellFull!15068) mapValue!49261)) b!1251343))

(assert (= (and b!1251342 ((_ is ValueCellFull!15068) mapDefault!49261)) b!1251348))

(assert (= start!104988 b!1251342))

(declare-fun m!1151671 () Bool)

(assert (=> b!1251341 m!1151671))

(declare-fun m!1151673 () Bool)

(assert (=> mapNonEmpty!49261 m!1151673))

(declare-fun m!1151675 () Bool)

(assert (=> start!104988 m!1151675))

(declare-fun m!1151677 () Bool)

(assert (=> start!104988 m!1151677))

(declare-fun m!1151679 () Bool)

(assert (=> start!104988 m!1151679))

(declare-fun m!1151681 () Bool)

(assert (=> b!1251347 m!1151681))

(declare-fun m!1151683 () Bool)

(assert (=> b!1251347 m!1151683))

(declare-fun m!1151685 () Bool)

(assert (=> b!1251349 m!1151685))

(declare-fun m!1151687 () Bool)

(assert (=> b!1251349 m!1151687))

(declare-fun m!1151689 () Bool)

(assert (=> b!1251344 m!1151689))

(declare-fun m!1151691 () Bool)

(assert (=> b!1251344 m!1151691))

(declare-fun m!1151693 () Bool)

(assert (=> b!1251344 m!1151693))

(declare-fun m!1151695 () Bool)

(assert (=> b!1251345 m!1151695))

(check-sat (not b!1251347) (not b!1251345) b_and!44529 (not b!1251341) (not b!1251344) (not mapNonEmpty!49261) (not start!104988) (not b_next!26761) tp_is_empty!31663 (not b!1251349))
(check-sat b_and!44529 (not b_next!26761))
