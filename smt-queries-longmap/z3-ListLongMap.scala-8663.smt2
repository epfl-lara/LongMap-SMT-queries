; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105564 () Bool)

(assert start!105564)

(declare-fun b_free!27013 () Bool)

(declare-fun b_next!27013 () Bool)

(assert (=> start!105564 (= b_free!27013 (not b_next!27013))))

(declare-fun tp!94550 () Bool)

(declare-fun b_and!44853 () Bool)

(assert (=> start!105564 (= tp!94550 b_and!44853)))

(declare-fun mapIsEmpty!49654 () Bool)

(declare-fun mapRes!49654 () Bool)

(assert (=> mapIsEmpty!49654 mapRes!49654))

(declare-fun mapNonEmpty!49654 () Bool)

(declare-fun tp!94549 () Bool)

(declare-fun e!714136 () Bool)

(assert (=> mapNonEmpty!49654 (= mapRes!49654 (and tp!94549 e!714136))))

(declare-datatypes ((V!47919 0))(
  ( (V!47920 (val!16020 Int)) )
))
(declare-datatypes ((ValueCell!15194 0))(
  ( (ValueCellFull!15194 (v!18716 V!47919)) (EmptyCell!15194) )
))
(declare-fun mapRest!49654 () (Array (_ BitVec 32) ValueCell!15194))

(declare-fun mapKey!49654 () (_ BitVec 32))

(declare-datatypes ((array!81527 0))(
  ( (array!81528 (arr!39319 (Array (_ BitVec 32) ValueCell!15194)) (size!39856 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81527)

(declare-fun mapValue!49654 () ValueCell!15194)

(assert (=> mapNonEmpty!49654 (= (arr!39319 _values!914) (store mapRest!49654 mapKey!49654 mapValue!49654))))

(declare-fun b!1256425 () Bool)

(declare-fun tp_is_empty!31915 () Bool)

(assert (=> b!1256425 (= e!714136 tp_is_empty!31915)))

(declare-fun b!1256426 () Bool)

(declare-fun e!714140 () Bool)

(assert (=> b!1256426 (= e!714140 tp_is_empty!31915)))

(declare-fun b!1256427 () Bool)

(declare-fun res!837323 () Bool)

(declare-fun e!714137 () Bool)

(assert (=> b!1256427 (=> (not res!837323) (not e!714137))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81529 0))(
  ( (array!81530 (arr!39320 (Array (_ BitVec 32) (_ BitVec 64))) (size!39857 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81529)

(assert (=> b!1256427 (= res!837323 (and (= (size!39856 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39857 _keys!1118) (size!39856 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837321 () Bool)

(assert (=> start!105564 (=> (not res!837321) (not e!714137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105564 (= res!837321 (validMask!0 mask!1466))))

(assert (=> start!105564 e!714137))

(assert (=> start!105564 true))

(assert (=> start!105564 tp!94550))

(assert (=> start!105564 tp_is_empty!31915))

(declare-fun array_inv!30093 (array!81529) Bool)

(assert (=> start!105564 (array_inv!30093 _keys!1118)))

(declare-fun e!714139 () Bool)

(declare-fun array_inv!30094 (array!81527) Bool)

(assert (=> start!105564 (and (array_inv!30094 _values!914) e!714139)))

(declare-fun b!1256428 () Bool)

(assert (=> b!1256428 (= e!714137 (not true))))

(declare-datatypes ((tuple2!20708 0))(
  ( (tuple2!20709 (_1!10365 (_ BitVec 64)) (_2!10365 V!47919)) )
))
(declare-datatypes ((List!27944 0))(
  ( (Nil!27941) (Cons!27940 (h!29158 tuple2!20708) (t!41421 List!27944)) )
))
(declare-datatypes ((ListLongMap!18589 0))(
  ( (ListLongMap!18590 (toList!9310 List!27944)) )
))
(declare-fun lt!567926 () ListLongMap!18589)

(declare-fun lt!567928 () ListLongMap!18589)

(assert (=> b!1256428 (= lt!567926 lt!567928)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47919)

(declare-fun zeroValue!871 () V!47919)

(declare-fun minValueBefore!43 () V!47919)

(declare-datatypes ((Unit!41761 0))(
  ( (Unit!41762) )
))
(declare-fun lt!567927 () Unit!41761)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1046 (array!81529 array!81527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47919 V!47919 V!47919 V!47919 (_ BitVec 32) Int) Unit!41761)

(assert (=> b!1256428 (= lt!567927 (lemmaNoChangeToArrayThenSameMapNoExtras!1046 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5732 (array!81529 array!81527 (_ BitVec 32) (_ BitVec 32) V!47919 V!47919 (_ BitVec 32) Int) ListLongMap!18589)

(assert (=> b!1256428 (= lt!567928 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256428 (= lt!567926 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256429 () Bool)

(declare-fun res!837322 () Bool)

(assert (=> b!1256429 (=> (not res!837322) (not e!714137))))

(declare-datatypes ((List!27945 0))(
  ( (Nil!27942) (Cons!27941 (h!29159 (_ BitVec 64)) (t!41422 List!27945)) )
))
(declare-fun arrayNoDuplicates!0 (array!81529 (_ BitVec 32) List!27945) Bool)

(assert (=> b!1256429 (= res!837322 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27942))))

(declare-fun b!1256430 () Bool)

(declare-fun res!837320 () Bool)

(assert (=> b!1256430 (=> (not res!837320) (not e!714137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81529 (_ BitVec 32)) Bool)

(assert (=> b!1256430 (= res!837320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256431 () Bool)

(assert (=> b!1256431 (= e!714139 (and e!714140 mapRes!49654))))

(declare-fun condMapEmpty!49654 () Bool)

(declare-fun mapDefault!49654 () ValueCell!15194)

(assert (=> b!1256431 (= condMapEmpty!49654 (= (arr!39319 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15194)) mapDefault!49654)))))

(assert (= (and start!105564 res!837321) b!1256427))

(assert (= (and b!1256427 res!837323) b!1256430))

(assert (= (and b!1256430 res!837320) b!1256429))

(assert (= (and b!1256429 res!837322) b!1256428))

(assert (= (and b!1256431 condMapEmpty!49654) mapIsEmpty!49654))

(assert (= (and b!1256431 (not condMapEmpty!49654)) mapNonEmpty!49654))

(get-info :version)

(assert (= (and mapNonEmpty!49654 ((_ is ValueCellFull!15194) mapValue!49654)) b!1256425))

(assert (= (and b!1256431 ((_ is ValueCellFull!15194) mapDefault!49654)) b!1256426))

(assert (= start!105564 b!1256431))

(declare-fun m!1157517 () Bool)

(assert (=> b!1256429 m!1157517))

(declare-fun m!1157519 () Bool)

(assert (=> b!1256428 m!1157519))

(declare-fun m!1157521 () Bool)

(assert (=> b!1256428 m!1157521))

(declare-fun m!1157523 () Bool)

(assert (=> b!1256428 m!1157523))

(declare-fun m!1157525 () Bool)

(assert (=> b!1256430 m!1157525))

(declare-fun m!1157527 () Bool)

(assert (=> mapNonEmpty!49654 m!1157527))

(declare-fun m!1157529 () Bool)

(assert (=> start!105564 m!1157529))

(declare-fun m!1157531 () Bool)

(assert (=> start!105564 m!1157531))

(declare-fun m!1157533 () Bool)

(assert (=> start!105564 m!1157533))

(check-sat b_and!44853 tp_is_empty!31915 (not mapNonEmpty!49654) (not start!105564) (not b!1256429) (not b_next!27013) (not b!1256428) (not b!1256430))
(check-sat b_and!44853 (not b_next!27013))
