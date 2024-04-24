; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94628 () Bool)

(assert start!94628)

(declare-fun b_free!21733 () Bool)

(declare-fun b_next!21733 () Bool)

(assert (=> start!94628 (= b_free!21733 (not b_next!21733))))

(declare-fun tp!76642 () Bool)

(declare-fun b_and!34527 () Bool)

(assert (=> start!94628 (= tp!76642 b_and!34527)))

(declare-fun b!1068679 () Bool)

(declare-fun e!609620 () Bool)

(declare-fun tp_is_empty!25543 () Bool)

(assert (=> b!1068679 (= e!609620 tp_is_empty!25543)))

(declare-fun b!1068680 () Bool)

(declare-fun res!712813 () Bool)

(declare-fun e!609624 () Bool)

(assert (=> b!1068680 (=> (not res!712813) (not e!609624))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39193 0))(
  ( (V!39194 (val!12822 Int)) )
))
(declare-datatypes ((ValueCell!12068 0))(
  ( (ValueCellFull!12068 (v!15432 V!39193)) (EmptyCell!12068) )
))
(declare-datatypes ((array!68111 0))(
  ( (array!68112 (arr!32750 (Array (_ BitVec 32) ValueCell!12068)) (size!33287 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68111)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68113 0))(
  ( (array!68114 (arr!32751 (Array (_ BitVec 32) (_ BitVec 64))) (size!33288 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68113)

(assert (=> b!1068680 (= res!712813 (and (= (size!33287 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33288 _keys!1163) (size!33287 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40006 () Bool)

(declare-fun mapRes!40006 () Bool)

(declare-fun tp!76643 () Bool)

(assert (=> mapNonEmpty!40006 (= mapRes!40006 (and tp!76643 e!609620))))

(declare-fun mapValue!40006 () ValueCell!12068)

(declare-fun mapKey!40006 () (_ BitVec 32))

(declare-fun mapRest!40006 () (Array (_ BitVec 32) ValueCell!12068))

(assert (=> mapNonEmpty!40006 (= (arr!32750 _values!955) (store mapRest!40006 mapKey!40006 mapValue!40006))))

(declare-fun b!1068681 () Bool)

(declare-fun res!712812 () Bool)

(assert (=> b!1068681 (=> (not res!712812) (not e!609624))))

(declare-datatypes ((List!22816 0))(
  ( (Nil!22813) (Cons!22812 (h!24030 (_ BitVec 64)) (t!32131 List!22816)) )
))
(declare-fun arrayNoDuplicates!0 (array!68113 (_ BitVec 32) List!22816) Bool)

(assert (=> b!1068681 (= res!712812 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22813))))

(declare-fun mapIsEmpty!40006 () Bool)

(assert (=> mapIsEmpty!40006 mapRes!40006))

(declare-fun b!1068682 () Bool)

(assert (=> b!1068682 (= e!609624 (not true))))

(declare-datatypes ((tuple2!16244 0))(
  ( (tuple2!16245 (_1!8133 (_ BitVec 64)) (_2!8133 V!39193)) )
))
(declare-datatypes ((List!22817 0))(
  ( (Nil!22814) (Cons!22813 (h!24031 tuple2!16244) (t!32132 List!22817)) )
))
(declare-datatypes ((ListLongMap!14221 0))(
  ( (ListLongMap!14222 (toList!7126 List!22817)) )
))
(declare-fun lt!471926 () ListLongMap!14221)

(declare-fun lt!471924 () ListLongMap!14221)

(assert (=> b!1068682 (= lt!471926 lt!471924)))

(declare-fun zeroValueBefore!47 () V!39193)

(declare-fun minValue!907 () V!39193)

(declare-datatypes ((Unit!35050 0))(
  ( (Unit!35051) )
))
(declare-fun lt!471925 () Unit!35050)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39193)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!748 (array!68113 array!68111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 V!39193 V!39193 (_ BitVec 32) Int) Unit!35050)

(assert (=> b!1068682 (= lt!471925 (lemmaNoChangeToArrayThenSameMapNoExtras!748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3745 (array!68113 array!68111 (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 (_ BitVec 32) Int) ListLongMap!14221)

(assert (=> b!1068682 (= lt!471924 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068682 (= lt!471926 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068683 () Bool)

(declare-fun res!712811 () Bool)

(assert (=> b!1068683 (=> (not res!712811) (not e!609624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68113 (_ BitVec 32)) Bool)

(assert (=> b!1068683 (= res!712811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712814 () Bool)

(assert (=> start!94628 (=> (not res!712814) (not e!609624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94628 (= res!712814 (validMask!0 mask!1515))))

(assert (=> start!94628 e!609624))

(assert (=> start!94628 true))

(assert (=> start!94628 tp_is_empty!25543))

(declare-fun e!609623 () Bool)

(declare-fun array_inv!25376 (array!68111) Bool)

(assert (=> start!94628 (and (array_inv!25376 _values!955) e!609623)))

(assert (=> start!94628 tp!76642))

(declare-fun array_inv!25377 (array!68113) Bool)

(assert (=> start!94628 (array_inv!25377 _keys!1163)))

(declare-fun b!1068684 () Bool)

(declare-fun e!609622 () Bool)

(assert (=> b!1068684 (= e!609623 (and e!609622 mapRes!40006))))

(declare-fun condMapEmpty!40006 () Bool)

(declare-fun mapDefault!40006 () ValueCell!12068)

(assert (=> b!1068684 (= condMapEmpty!40006 (= (arr!32750 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12068)) mapDefault!40006)))))

(declare-fun b!1068685 () Bool)

(assert (=> b!1068685 (= e!609622 tp_is_empty!25543)))

(assert (= (and start!94628 res!712814) b!1068680))

(assert (= (and b!1068680 res!712813) b!1068683))

(assert (= (and b!1068683 res!712811) b!1068681))

(assert (= (and b!1068681 res!712812) b!1068682))

(assert (= (and b!1068684 condMapEmpty!40006) mapIsEmpty!40006))

(assert (= (and b!1068684 (not condMapEmpty!40006)) mapNonEmpty!40006))

(get-info :version)

(assert (= (and mapNonEmpty!40006 ((_ is ValueCellFull!12068) mapValue!40006)) b!1068679))

(assert (= (and b!1068684 ((_ is ValueCellFull!12068) mapDefault!40006)) b!1068685))

(assert (= start!94628 b!1068684))

(declare-fun m!987697 () Bool)

(assert (=> b!1068682 m!987697))

(declare-fun m!987699 () Bool)

(assert (=> b!1068682 m!987699))

(declare-fun m!987701 () Bool)

(assert (=> b!1068682 m!987701))

(declare-fun m!987703 () Bool)

(assert (=> b!1068683 m!987703))

(declare-fun m!987705 () Bool)

(assert (=> start!94628 m!987705))

(declare-fun m!987707 () Bool)

(assert (=> start!94628 m!987707))

(declare-fun m!987709 () Bool)

(assert (=> start!94628 m!987709))

(declare-fun m!987711 () Bool)

(assert (=> mapNonEmpty!40006 m!987711))

(declare-fun m!987713 () Bool)

(assert (=> b!1068681 m!987713))

(check-sat (not b_next!21733) (not mapNonEmpty!40006) tp_is_empty!25543 (not start!94628) (not b!1068683) (not b!1068681) (not b!1068682) b_and!34527)
(check-sat b_and!34527 (not b_next!21733))
