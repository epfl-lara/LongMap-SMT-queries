; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104808 () Bool)

(assert start!104808)

(declare-fun b_free!26617 () Bool)

(declare-fun b_next!26617 () Bool)

(assert (=> start!104808 (= b_free!26617 (not b_next!26617))))

(declare-fun tp!93340 () Bool)

(declare-fun b_and!44367 () Bool)

(assert (=> start!104808 (= tp!93340 b_and!44367)))

(declare-fun b!1249286 () Bool)

(declare-fun e!709039 () Bool)

(assert (=> b!1249286 (= e!709039 (not true))))

(declare-datatypes ((V!47391 0))(
  ( (V!47392 (val!15822 Int)) )
))
(declare-datatypes ((tuple2!20456 0))(
  ( (tuple2!20457 (_1!10239 (_ BitVec 64)) (_2!10239 V!47391)) )
))
(declare-datatypes ((List!27684 0))(
  ( (Nil!27681) (Cons!27680 (h!28889 tuple2!20456) (t!41146 List!27684)) )
))
(declare-datatypes ((ListLongMap!18329 0))(
  ( (ListLongMap!18330 (toList!9180 List!27684)) )
))
(declare-fun lt!563522 () ListLongMap!18329)

(declare-fun lt!563521 () ListLongMap!18329)

(assert (=> b!1249286 (= lt!563522 lt!563521)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47391)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47391)

(declare-datatypes ((array!80635 0))(
  ( (array!80636 (arr!38885 (Array (_ BitVec 32) (_ BitVec 64))) (size!39423 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80635)

(declare-datatypes ((ValueCell!14996 0))(
  ( (ValueCellFull!14996 (v!18517 V!47391)) (EmptyCell!14996) )
))
(declare-datatypes ((array!80637 0))(
  ( (array!80638 (arr!38886 (Array (_ BitVec 32) ValueCell!14996)) (size!39424 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80637)

(declare-datatypes ((Unit!41328 0))(
  ( (Unit!41329) )
))
(declare-fun lt!563520 () Unit!41328)

(declare-fun minValueBefore!43 () V!47391)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!919 (array!80635 array!80637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 V!47391 V!47391 (_ BitVec 32) Int) Unit!41328)

(assert (=> b!1249286 (= lt!563520 (lemmaNoChangeToArrayThenSameMapNoExtras!919 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5597 (array!80635 array!80637 (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 (_ BitVec 32) Int) ListLongMap!18329)

(assert (=> b!1249286 (= lt!563521 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249286 (= lt!563522 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833386 () Bool)

(assert (=> start!104808 (=> (not res!833386) (not e!709039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104808 (= res!833386 (validMask!0 mask!1466))))

(assert (=> start!104808 e!709039))

(assert (=> start!104808 true))

(assert (=> start!104808 tp!93340))

(declare-fun tp_is_empty!31519 () Bool)

(assert (=> start!104808 tp_is_empty!31519))

(declare-fun array_inv!29809 (array!80635) Bool)

(assert (=> start!104808 (array_inv!29809 _keys!1118)))

(declare-fun e!709040 () Bool)

(declare-fun array_inv!29810 (array!80637) Bool)

(assert (=> start!104808 (and (array_inv!29810 _values!914) e!709040)))

(declare-fun mapNonEmpty!49039 () Bool)

(declare-fun mapRes!49039 () Bool)

(declare-fun tp!93341 () Bool)

(declare-fun e!709042 () Bool)

(assert (=> mapNonEmpty!49039 (= mapRes!49039 (and tp!93341 e!709042))))

(declare-fun mapKey!49039 () (_ BitVec 32))

(declare-fun mapValue!49039 () ValueCell!14996)

(declare-fun mapRest!49039 () (Array (_ BitVec 32) ValueCell!14996))

(assert (=> mapNonEmpty!49039 (= (arr!38886 _values!914) (store mapRest!49039 mapKey!49039 mapValue!49039))))

(declare-fun b!1249287 () Bool)

(declare-fun res!833387 () Bool)

(assert (=> b!1249287 (=> (not res!833387) (not e!709039))))

(assert (=> b!1249287 (= res!833387 (and (= (size!39424 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39423 _keys!1118) (size!39424 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249288 () Bool)

(declare-fun res!833384 () Bool)

(assert (=> b!1249288 (=> (not res!833384) (not e!709039))))

(declare-datatypes ((List!27685 0))(
  ( (Nil!27682) (Cons!27681 (h!28890 (_ BitVec 64)) (t!41147 List!27685)) )
))
(declare-fun arrayNoDuplicates!0 (array!80635 (_ BitVec 32) List!27685) Bool)

(assert (=> b!1249288 (= res!833384 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27682))))

(declare-fun b!1249289 () Bool)

(declare-fun e!709038 () Bool)

(assert (=> b!1249289 (= e!709040 (and e!709038 mapRes!49039))))

(declare-fun condMapEmpty!49039 () Bool)

(declare-fun mapDefault!49039 () ValueCell!14996)

(assert (=> b!1249289 (= condMapEmpty!49039 (= (arr!38886 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14996)) mapDefault!49039)))))

(declare-fun mapIsEmpty!49039 () Bool)

(assert (=> mapIsEmpty!49039 mapRes!49039))

(declare-fun b!1249290 () Bool)

(declare-fun res!833385 () Bool)

(assert (=> b!1249290 (=> (not res!833385) (not e!709039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80635 (_ BitVec 32)) Bool)

(assert (=> b!1249290 (= res!833385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249291 () Bool)

(assert (=> b!1249291 (= e!709042 tp_is_empty!31519)))

(declare-fun b!1249292 () Bool)

(assert (=> b!1249292 (= e!709038 tp_is_empty!31519)))

(assert (= (and start!104808 res!833386) b!1249287))

(assert (= (and b!1249287 res!833387) b!1249290))

(assert (= (and b!1249290 res!833385) b!1249288))

(assert (= (and b!1249288 res!833384) b!1249286))

(assert (= (and b!1249289 condMapEmpty!49039) mapIsEmpty!49039))

(assert (= (and b!1249289 (not condMapEmpty!49039)) mapNonEmpty!49039))

(get-info :version)

(assert (= (and mapNonEmpty!49039 ((_ is ValueCellFull!14996) mapValue!49039)) b!1249291))

(assert (= (and b!1249289 ((_ is ValueCellFull!14996) mapDefault!49039)) b!1249292))

(assert (= start!104808 b!1249289))

(declare-fun m!1149787 () Bool)

(assert (=> b!1249290 m!1149787))

(declare-fun m!1149789 () Bool)

(assert (=> b!1249288 m!1149789))

(declare-fun m!1149791 () Bool)

(assert (=> mapNonEmpty!49039 m!1149791))

(declare-fun m!1149793 () Bool)

(assert (=> start!104808 m!1149793))

(declare-fun m!1149795 () Bool)

(assert (=> start!104808 m!1149795))

(declare-fun m!1149797 () Bool)

(assert (=> start!104808 m!1149797))

(declare-fun m!1149799 () Bool)

(assert (=> b!1249286 m!1149799))

(declare-fun m!1149801 () Bool)

(assert (=> b!1249286 m!1149801))

(declare-fun m!1149803 () Bool)

(assert (=> b!1249286 m!1149803))

(check-sat (not mapNonEmpty!49039) (not b!1249290) (not start!104808) (not b!1249286) tp_is_empty!31519 (not b!1249288) b_and!44367 (not b_next!26617))
(check-sat b_and!44367 (not b_next!26617))
