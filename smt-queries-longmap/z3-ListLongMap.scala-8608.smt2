; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105116 () Bool)

(assert start!105116)

(declare-fun b_free!26683 () Bool)

(declare-fun b_next!26683 () Bool)

(assert (=> start!105116 (= b_free!26683 (not b_next!26683))))

(declare-fun tp!93542 () Bool)

(declare-fun b_and!44461 () Bool)

(assert (=> start!105116 (= tp!93542 b_and!44461)))

(declare-fun b!1251518 () Bool)

(declare-fun e!710548 () Bool)

(declare-fun e!710550 () Bool)

(assert (=> b!1251518 (= e!710548 (not e!710550))))

(declare-fun res!834438 () Bool)

(assert (=> b!1251518 (=> res!834438 e!710550)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251518 (= res!834438 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47479 0))(
  ( (V!47480 (val!15855 Int)) )
))
(declare-datatypes ((tuple2!20460 0))(
  ( (tuple2!20461 (_1!10241 (_ BitVec 64)) (_2!10241 V!47479)) )
))
(declare-datatypes ((List!27711 0))(
  ( (Nil!27708) (Cons!27707 (h!28925 tuple2!20460) (t!41176 List!27711)) )
))
(declare-datatypes ((ListLongMap!18341 0))(
  ( (ListLongMap!18342 (toList!9186 List!27711)) )
))
(declare-fun lt!564588 () ListLongMap!18341)

(declare-fun lt!564590 () ListLongMap!18341)

(assert (=> b!1251518 (= lt!564588 lt!564590)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41510 0))(
  ( (Unit!41511) )
))
(declare-fun lt!564591 () Unit!41510)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47479)

(declare-fun zeroValue!871 () V!47479)

(declare-datatypes ((array!80889 0))(
  ( (array!80890 (arr!39006 (Array (_ BitVec 32) (_ BitVec 64))) (size!39543 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80889)

(declare-datatypes ((ValueCell!15029 0))(
  ( (ValueCellFull!15029 (v!18547 V!47479)) (EmptyCell!15029) )
))
(declare-datatypes ((array!80891 0))(
  ( (array!80892 (arr!39007 (Array (_ BitVec 32) ValueCell!15029)) (size!39544 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80891)

(declare-fun minValueBefore!43 () V!47479)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!934 (array!80889 array!80891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 V!47479 V!47479 (_ BitVec 32) Int) Unit!41510)

(assert (=> b!1251518 (= lt!564591 (lemmaNoChangeToArrayThenSameMapNoExtras!934 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5620 (array!80889 array!80891 (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 (_ BitVec 32) Int) ListLongMap!18341)

(assert (=> b!1251518 (= lt!564590 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251518 (= lt!564588 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251519 () Bool)

(declare-fun e!710553 () Bool)

(declare-fun tp_is_empty!31585 () Bool)

(assert (=> b!1251519 (= e!710553 tp_is_empty!31585)))

(declare-fun b!1251520 () Bool)

(declare-fun e!710552 () Bool)

(declare-fun e!710551 () Bool)

(declare-fun mapRes!49141 () Bool)

(assert (=> b!1251520 (= e!710552 (and e!710551 mapRes!49141))))

(declare-fun condMapEmpty!49141 () Bool)

(declare-fun mapDefault!49141 () ValueCell!15029)

(assert (=> b!1251520 (= condMapEmpty!49141 (= (arr!39007 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15029)) mapDefault!49141)))))

(declare-fun res!834440 () Bool)

(assert (=> start!105116 (=> (not res!834440) (not e!710548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105116 (= res!834440 (validMask!0 mask!1466))))

(assert (=> start!105116 e!710548))

(assert (=> start!105116 true))

(assert (=> start!105116 tp!93542))

(assert (=> start!105116 tp_is_empty!31585))

(declare-fun array_inv!29875 (array!80889) Bool)

(assert (=> start!105116 (array_inv!29875 _keys!1118)))

(declare-fun array_inv!29876 (array!80891) Bool)

(assert (=> start!105116 (and (array_inv!29876 _values!914) e!710552)))

(declare-fun b!1251521 () Bool)

(declare-fun e!710549 () Bool)

(assert (=> b!1251521 (= e!710550 e!710549)))

(declare-fun res!834441 () Bool)

(assert (=> b!1251521 (=> res!834441 e!710549)))

(declare-fun lt!564587 () ListLongMap!18341)

(declare-fun contains!7515 (ListLongMap!18341 (_ BitVec 64)) Bool)

(assert (=> b!1251521 (= res!834441 (contains!7515 lt!564587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4452 (array!80889 array!80891 (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 (_ BitVec 32) Int) ListLongMap!18341)

(assert (=> b!1251521 (= lt!564587 (getCurrentListMap!4452 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251522 () Bool)

(assert (=> b!1251522 (= e!710551 tp_is_empty!31585)))

(declare-fun b!1251523 () Bool)

(declare-fun res!834442 () Bool)

(assert (=> b!1251523 (=> (not res!834442) (not e!710548))))

(declare-datatypes ((List!27712 0))(
  ( (Nil!27709) (Cons!27708 (h!28926 (_ BitVec 64)) (t!41177 List!27712)) )
))
(declare-fun arrayNoDuplicates!0 (array!80889 (_ BitVec 32) List!27712) Bool)

(assert (=> b!1251523 (= res!834442 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27709))))

(declare-fun b!1251524 () Bool)

(declare-fun res!834439 () Bool)

(assert (=> b!1251524 (=> (not res!834439) (not e!710548))))

(assert (=> b!1251524 (= res!834439 (and (= (size!39544 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39543 _keys!1118) (size!39544 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251525 () Bool)

(declare-fun res!834443 () Bool)

(assert (=> b!1251525 (=> (not res!834443) (not e!710548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80889 (_ BitVec 32)) Bool)

(assert (=> b!1251525 (= res!834443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49141 () Bool)

(assert (=> mapIsEmpty!49141 mapRes!49141))

(declare-fun b!1251526 () Bool)

(assert (=> b!1251526 (= e!710549 true)))

(declare-fun -!1976 (ListLongMap!18341 (_ BitVec 64)) ListLongMap!18341)

(assert (=> b!1251526 (= (-!1976 lt!564587 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564587)))

(declare-fun lt!564589 () Unit!41510)

(declare-fun removeNotPresentStillSame!86 (ListLongMap!18341 (_ BitVec 64)) Unit!41510)

(assert (=> b!1251526 (= lt!564589 (removeNotPresentStillSame!86 lt!564587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49141 () Bool)

(declare-fun tp!93541 () Bool)

(assert (=> mapNonEmpty!49141 (= mapRes!49141 (and tp!93541 e!710553))))

(declare-fun mapValue!49141 () ValueCell!15029)

(declare-fun mapKey!49141 () (_ BitVec 32))

(declare-fun mapRest!49141 () (Array (_ BitVec 32) ValueCell!15029))

(assert (=> mapNonEmpty!49141 (= (arr!39007 _values!914) (store mapRest!49141 mapKey!49141 mapValue!49141))))

(assert (= (and start!105116 res!834440) b!1251524))

(assert (= (and b!1251524 res!834439) b!1251525))

(assert (= (and b!1251525 res!834443) b!1251523))

(assert (= (and b!1251523 res!834442) b!1251518))

(assert (= (and b!1251518 (not res!834438)) b!1251521))

(assert (= (and b!1251521 (not res!834441)) b!1251526))

(assert (= (and b!1251520 condMapEmpty!49141) mapIsEmpty!49141))

(assert (= (and b!1251520 (not condMapEmpty!49141)) mapNonEmpty!49141))

(get-info :version)

(assert (= (and mapNonEmpty!49141 ((_ is ValueCellFull!15029) mapValue!49141)) b!1251519))

(assert (= (and b!1251520 ((_ is ValueCellFull!15029) mapDefault!49141)) b!1251522))

(assert (= start!105116 b!1251520))

(declare-fun m!1152663 () Bool)

(assert (=> b!1251526 m!1152663))

(declare-fun m!1152665 () Bool)

(assert (=> b!1251526 m!1152665))

(declare-fun m!1152667 () Bool)

(assert (=> mapNonEmpty!49141 m!1152667))

(declare-fun m!1152669 () Bool)

(assert (=> start!105116 m!1152669))

(declare-fun m!1152671 () Bool)

(assert (=> start!105116 m!1152671))

(declare-fun m!1152673 () Bool)

(assert (=> start!105116 m!1152673))

(declare-fun m!1152675 () Bool)

(assert (=> b!1251518 m!1152675))

(declare-fun m!1152677 () Bool)

(assert (=> b!1251518 m!1152677))

(declare-fun m!1152679 () Bool)

(assert (=> b!1251518 m!1152679))

(declare-fun m!1152681 () Bool)

(assert (=> b!1251525 m!1152681))

(declare-fun m!1152683 () Bool)

(assert (=> b!1251521 m!1152683))

(declare-fun m!1152685 () Bool)

(assert (=> b!1251521 m!1152685))

(declare-fun m!1152687 () Bool)

(assert (=> b!1251523 m!1152687))

(check-sat (not b!1251525) (not b!1251518) (not b!1251523) (not b_next!26683) (not b!1251521) (not start!105116) (not mapNonEmpty!49141) tp_is_empty!31585 b_and!44461 (not b!1251526))
(check-sat b_and!44461 (not b_next!26683))
