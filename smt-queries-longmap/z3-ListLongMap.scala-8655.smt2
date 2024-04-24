; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105494 () Bool)

(assert start!105494)

(declare-fun b_free!26965 () Bool)

(declare-fun b_next!26965 () Bool)

(assert (=> start!105494 (= b_free!26965 (not b_next!26965))))

(declare-fun tp!94403 () Bool)

(declare-fun b_and!44793 () Bool)

(assert (=> start!105494 (= tp!94403 b_and!44793)))

(declare-fun b!1255694 () Bool)

(declare-fun res!836909 () Bool)

(declare-fun e!713618 () Bool)

(assert (=> b!1255694 (=> (not res!836909) (not e!713618))))

(declare-datatypes ((array!81433 0))(
  ( (array!81434 (arr!39273 (Array (_ BitVec 32) (_ BitVec 64))) (size!39810 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81433)

(declare-datatypes ((List!27907 0))(
  ( (Nil!27904) (Cons!27903 (h!29121 (_ BitVec 64)) (t!41382 List!27907)) )
))
(declare-fun arrayNoDuplicates!0 (array!81433 (_ BitVec 32) List!27907) Bool)

(assert (=> b!1255694 (= res!836909 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27904))))

(declare-fun res!836911 () Bool)

(assert (=> start!105494 (=> (not res!836911) (not e!713618))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105494 (= res!836911 (validMask!0 mask!1466))))

(assert (=> start!105494 e!713618))

(assert (=> start!105494 true))

(assert (=> start!105494 tp!94403))

(declare-fun tp_is_empty!31867 () Bool)

(assert (=> start!105494 tp_is_empty!31867))

(declare-fun array_inv!30055 (array!81433) Bool)

(assert (=> start!105494 (array_inv!30055 _keys!1118)))

(declare-datatypes ((V!47855 0))(
  ( (V!47856 (val!15996 Int)) )
))
(declare-datatypes ((ValueCell!15170 0))(
  ( (ValueCellFull!15170 (v!18691 V!47855)) (EmptyCell!15170) )
))
(declare-datatypes ((array!81435 0))(
  ( (array!81436 (arr!39274 (Array (_ BitVec 32) ValueCell!15170)) (size!39811 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81435)

(declare-fun e!713617 () Bool)

(declare-fun array_inv!30056 (array!81435) Bool)

(assert (=> start!105494 (and (array_inv!30056 _values!914) e!713617)))

(declare-fun b!1255695 () Bool)

(declare-fun res!836907 () Bool)

(assert (=> b!1255695 (=> (not res!836907) (not e!713618))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255695 (= res!836907 (and (= (size!39811 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39810 _keys!1118) (size!39811 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255696 () Bool)

(declare-fun e!713615 () Bool)

(assert (=> b!1255696 (= e!713618 (not e!713615))))

(declare-fun res!836910 () Bool)

(assert (=> b!1255696 (=> res!836910 e!713615)))

(assert (=> b!1255696 (= res!836910 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20670 0))(
  ( (tuple2!20671 (_1!10346 (_ BitVec 64)) (_2!10346 V!47855)) )
))
(declare-datatypes ((List!27908 0))(
  ( (Nil!27905) (Cons!27904 (h!29122 tuple2!20670) (t!41383 List!27908)) )
))
(declare-datatypes ((ListLongMap!18551 0))(
  ( (ListLongMap!18552 (toList!9291 List!27908)) )
))
(declare-fun lt!567357 () ListLongMap!18551)

(declare-fun lt!567360 () ListLongMap!18551)

(assert (=> b!1255696 (= lt!567357 lt!567360)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47855)

(declare-fun zeroValue!871 () V!47855)

(declare-fun minValueBefore!43 () V!47855)

(declare-datatypes ((Unit!41721 0))(
  ( (Unit!41722) )
))
(declare-fun lt!567364 () Unit!41721)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1029 (array!81433 array!81435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 V!47855 V!47855 (_ BitVec 32) Int) Unit!41721)

(assert (=> b!1255696 (= lt!567364 (lemmaNoChangeToArrayThenSameMapNoExtras!1029 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5715 (array!81433 array!81435 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18551)

(assert (=> b!1255696 (= lt!567360 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255696 (= lt!567357 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255697 () Bool)

(declare-fun e!713619 () Bool)

(assert (=> b!1255697 (= e!713619 tp_is_empty!31867)))

(declare-fun mapNonEmpty!49579 () Bool)

(declare-fun mapRes!49579 () Bool)

(declare-fun tp!94402 () Bool)

(declare-fun e!713616 () Bool)

(assert (=> mapNonEmpty!49579 (= mapRes!49579 (and tp!94402 e!713616))))

(declare-fun mapKey!49579 () (_ BitVec 32))

(declare-fun mapValue!49579 () ValueCell!15170)

(declare-fun mapRest!49579 () (Array (_ BitVec 32) ValueCell!15170))

(assert (=> mapNonEmpty!49579 (= (arr!39274 _values!914) (store mapRest!49579 mapKey!49579 mapValue!49579))))

(declare-fun b!1255698 () Bool)

(assert (=> b!1255698 (= e!713617 (and e!713619 mapRes!49579))))

(declare-fun condMapEmpty!49579 () Bool)

(declare-fun mapDefault!49579 () ValueCell!15170)

(assert (=> b!1255698 (= condMapEmpty!49579 (= (arr!39274 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15170)) mapDefault!49579)))))

(declare-fun mapIsEmpty!49579 () Bool)

(assert (=> mapIsEmpty!49579 mapRes!49579))

(declare-fun b!1255699 () Bool)

(assert (=> b!1255699 (= e!713615 true)))

(declare-fun lt!567361 () ListLongMap!18551)

(declare-fun lt!567363 () ListLongMap!18551)

(declare-fun -!2030 (ListLongMap!18551 (_ BitVec 64)) ListLongMap!18551)

(assert (=> b!1255699 (= lt!567361 (-!2030 lt!567363 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567362 () ListLongMap!18551)

(assert (=> b!1255699 (= (-!2030 lt!567362 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567357)))

(declare-fun lt!567359 () Unit!41721)

(declare-fun addThenRemoveForNewKeyIsSame!320 (ListLongMap!18551 (_ BitVec 64) V!47855) Unit!41721)

(assert (=> b!1255699 (= lt!567359 (addThenRemoveForNewKeyIsSame!320 lt!567357 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567358 () ListLongMap!18551)

(assert (=> b!1255699 (and (= lt!567363 lt!567362) (= lt!567358 lt!567360))))

(declare-fun +!4226 (ListLongMap!18551 tuple2!20670) ListLongMap!18551)

(assert (=> b!1255699 (= lt!567362 (+!4226 lt!567357 (tuple2!20671 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4523 (array!81433 array!81435 (_ BitVec 32) (_ BitVec 32) V!47855 V!47855 (_ BitVec 32) Int) ListLongMap!18551)

(assert (=> b!1255699 (= lt!567358 (getCurrentListMap!4523 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255699 (= lt!567363 (getCurrentListMap!4523 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255700 () Bool)

(declare-fun res!836908 () Bool)

(assert (=> b!1255700 (=> (not res!836908) (not e!713618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81433 (_ BitVec 32)) Bool)

(assert (=> b!1255700 (= res!836908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255701 () Bool)

(assert (=> b!1255701 (= e!713616 tp_is_empty!31867)))

(assert (= (and start!105494 res!836911) b!1255695))

(assert (= (and b!1255695 res!836907) b!1255700))

(assert (= (and b!1255700 res!836908) b!1255694))

(assert (= (and b!1255694 res!836909) b!1255696))

(assert (= (and b!1255696 (not res!836910)) b!1255699))

(assert (= (and b!1255698 condMapEmpty!49579) mapIsEmpty!49579))

(assert (= (and b!1255698 (not condMapEmpty!49579)) mapNonEmpty!49579))

(get-info :version)

(assert (= (and mapNonEmpty!49579 ((_ is ValueCellFull!15170) mapValue!49579)) b!1255701))

(assert (= (and b!1255698 ((_ is ValueCellFull!15170) mapDefault!49579)) b!1255697))

(assert (= start!105494 b!1255698))

(declare-fun m!1156721 () Bool)

(assert (=> b!1255694 m!1156721))

(declare-fun m!1156723 () Bool)

(assert (=> b!1255696 m!1156723))

(declare-fun m!1156725 () Bool)

(assert (=> b!1255696 m!1156725))

(declare-fun m!1156727 () Bool)

(assert (=> b!1255696 m!1156727))

(declare-fun m!1156729 () Bool)

(assert (=> start!105494 m!1156729))

(declare-fun m!1156731 () Bool)

(assert (=> start!105494 m!1156731))

(declare-fun m!1156733 () Bool)

(assert (=> start!105494 m!1156733))

(declare-fun m!1156735 () Bool)

(assert (=> b!1255700 m!1156735))

(declare-fun m!1156737 () Bool)

(assert (=> mapNonEmpty!49579 m!1156737))

(declare-fun m!1156739 () Bool)

(assert (=> b!1255699 m!1156739))

(declare-fun m!1156741 () Bool)

(assert (=> b!1255699 m!1156741))

(declare-fun m!1156743 () Bool)

(assert (=> b!1255699 m!1156743))

(declare-fun m!1156745 () Bool)

(assert (=> b!1255699 m!1156745))

(declare-fun m!1156747 () Bool)

(assert (=> b!1255699 m!1156747))

(declare-fun m!1156749 () Bool)

(assert (=> b!1255699 m!1156749))

(check-sat (not b!1255694) tp_is_empty!31867 (not start!105494) (not b!1255696) (not b!1255699) (not mapNonEmpty!49579) (not b!1255700) b_and!44793 (not b_next!26965))
(check-sat b_and!44793 (not b_next!26965))
