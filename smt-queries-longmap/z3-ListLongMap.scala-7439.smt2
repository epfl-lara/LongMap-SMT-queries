; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94500 () Bool)

(assert start!94500)

(declare-fun b_free!21811 () Bool)

(declare-fun b_next!21811 () Bool)

(assert (=> start!94500 (= b_free!21811 (not b_next!21811))))

(declare-fun tp!76882 () Bool)

(declare-fun b_and!34587 () Bool)

(assert (=> start!94500 (= tp!76882 b_and!34587)))

(declare-fun mapNonEmpty!40129 () Bool)

(declare-fun mapRes!40129 () Bool)

(declare-fun tp!76883 () Bool)

(declare-fun e!609611 () Bool)

(assert (=> mapNonEmpty!40129 (= mapRes!40129 (and tp!76883 e!609611))))

(declare-datatypes ((V!39297 0))(
  ( (V!39298 (val!12861 Int)) )
))
(declare-datatypes ((ValueCell!12107 0))(
  ( (ValueCellFull!12107 (v!15475 V!39297)) (EmptyCell!12107) )
))
(declare-fun mapRest!40129 () (Array (_ BitVec 32) ValueCell!12107))

(declare-datatypes ((array!68166 0))(
  ( (array!68167 (arr!32782 (Array (_ BitVec 32) ValueCell!12107)) (size!33320 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68166)

(declare-fun mapKey!40129 () (_ BitVec 32))

(declare-fun mapValue!40129 () ValueCell!12107)

(assert (=> mapNonEmpty!40129 (= (arr!32782 _values!955) (store mapRest!40129 mapKey!40129 mapValue!40129))))

(declare-fun b!1068453 () Bool)

(declare-fun e!609605 () Bool)

(declare-fun e!609606 () Bool)

(assert (=> b!1068453 (= e!609605 (not e!609606))))

(declare-fun res!712974 () Bool)

(assert (=> b!1068453 (=> res!712974 e!609606)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068453 (= res!712974 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16388 0))(
  ( (tuple2!16389 (_1!8205 (_ BitVec 64)) (_2!8205 V!39297)) )
))
(declare-datatypes ((List!22927 0))(
  ( (Nil!22924) (Cons!22923 (h!24132 tuple2!16388) (t!32245 List!22927)) )
))
(declare-datatypes ((ListLongMap!14357 0))(
  ( (ListLongMap!14358 (toList!7194 List!22927)) )
))
(declare-fun lt!471919 () ListLongMap!14357)

(declare-fun lt!471918 () ListLongMap!14357)

(assert (=> b!1068453 (= lt!471919 lt!471918)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39297)

(declare-datatypes ((Unit!34978 0))(
  ( (Unit!34979) )
))
(declare-fun lt!471917 () Unit!34978)

(declare-fun minValue!907 () V!39297)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39297)

(declare-datatypes ((array!68168 0))(
  ( (array!68169 (arr!32783 (Array (_ BitVec 32) (_ BitVec 64))) (size!33321 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68168)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!780 (array!68168 array!68166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 V!39297 V!39297 (_ BitVec 32) Int) Unit!34978)

(assert (=> b!1068453 (= lt!471917 (lemmaNoChangeToArrayThenSameMapNoExtras!780 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3786 (array!68168 array!68166 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14357)

(assert (=> b!1068453 (= lt!471918 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068453 (= lt!471919 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068454 () Bool)

(declare-fun e!609607 () Bool)

(declare-fun e!609610 () Bool)

(assert (=> b!1068454 (= e!609607 (and e!609610 mapRes!40129))))

(declare-fun condMapEmpty!40129 () Bool)

(declare-fun mapDefault!40129 () ValueCell!12107)

(assert (=> b!1068454 (= condMapEmpty!40129 (= (arr!32782 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12107)) mapDefault!40129)))))

(declare-fun b!1068455 () Bool)

(declare-fun res!712973 () Bool)

(assert (=> b!1068455 (=> (not res!712973) (not e!609605))))

(assert (=> b!1068455 (= res!712973 (and (= (size!33320 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33321 _keys!1163) (size!33320 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068456 () Bool)

(declare-fun res!712977 () Bool)

(assert (=> b!1068456 (=> (not res!712977) (not e!609605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68168 (_ BitVec 32)) Bool)

(assert (=> b!1068456 (= res!712977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712975 () Bool)

(assert (=> start!94500 (=> (not res!712975) (not e!609605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94500 (= res!712975 (validMask!0 mask!1515))))

(assert (=> start!94500 e!609605))

(assert (=> start!94500 true))

(declare-fun tp_is_empty!25621 () Bool)

(assert (=> start!94500 tp_is_empty!25621))

(declare-fun array_inv!25374 (array!68166) Bool)

(assert (=> start!94500 (and (array_inv!25374 _values!955) e!609607)))

(assert (=> start!94500 tp!76882))

(declare-fun array_inv!25375 (array!68168) Bool)

(assert (=> start!94500 (array_inv!25375 _keys!1163)))

(declare-fun b!1068457 () Bool)

(declare-fun e!609608 () Bool)

(assert (=> b!1068457 (= e!609606 e!609608)))

(declare-fun res!712978 () Bool)

(assert (=> b!1068457 (=> res!712978 e!609608)))

(declare-fun lt!471921 () ListLongMap!14357)

(declare-fun contains!6268 (ListLongMap!14357 (_ BitVec 64)) Bool)

(assert (=> b!1068457 (= res!712978 (contains!6268 lt!471921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4036 (array!68168 array!68166 (_ BitVec 32) (_ BitVec 32) V!39297 V!39297 (_ BitVec 32) Int) ListLongMap!14357)

(assert (=> b!1068457 (= lt!471921 (getCurrentListMap!4036 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068458 () Bool)

(assert (=> b!1068458 (= e!609611 tp_is_empty!25621)))

(declare-fun b!1068459 () Bool)

(declare-fun res!712976 () Bool)

(assert (=> b!1068459 (=> (not res!712976) (not e!609605))))

(declare-datatypes ((List!22928 0))(
  ( (Nil!22925) (Cons!22924 (h!24133 (_ BitVec 64)) (t!32246 List!22928)) )
))
(declare-fun arrayNoDuplicates!0 (array!68168 (_ BitVec 32) List!22928) Bool)

(assert (=> b!1068459 (= res!712976 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22925))))

(declare-fun b!1068460 () Bool)

(assert (=> b!1068460 (= e!609608 true)))

(declare-fun -!639 (ListLongMap!14357 (_ BitVec 64)) ListLongMap!14357)

(assert (=> b!1068460 (= (-!639 lt!471921 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471921)))

(declare-fun lt!471920 () Unit!34978)

(declare-fun removeNotPresentStillSame!56 (ListLongMap!14357 (_ BitVec 64)) Unit!34978)

(assert (=> b!1068460 (= lt!471920 (removeNotPresentStillSame!56 lt!471921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068461 () Bool)

(assert (=> b!1068461 (= e!609610 tp_is_empty!25621)))

(declare-fun mapIsEmpty!40129 () Bool)

(assert (=> mapIsEmpty!40129 mapRes!40129))

(assert (= (and start!94500 res!712975) b!1068455))

(assert (= (and b!1068455 res!712973) b!1068456))

(assert (= (and b!1068456 res!712977) b!1068459))

(assert (= (and b!1068459 res!712976) b!1068453))

(assert (= (and b!1068453 (not res!712974)) b!1068457))

(assert (= (and b!1068457 (not res!712978)) b!1068460))

(assert (= (and b!1068454 condMapEmpty!40129) mapIsEmpty!40129))

(assert (= (and b!1068454 (not condMapEmpty!40129)) mapNonEmpty!40129))

(get-info :version)

(assert (= (and mapNonEmpty!40129 ((_ is ValueCellFull!12107) mapValue!40129)) b!1068458))

(assert (= (and b!1068454 ((_ is ValueCellFull!12107) mapDefault!40129)) b!1068461))

(assert (= start!94500 b!1068454))

(declare-fun m!986545 () Bool)

(assert (=> b!1068460 m!986545))

(declare-fun m!986547 () Bool)

(assert (=> b!1068460 m!986547))

(declare-fun m!986549 () Bool)

(assert (=> start!94500 m!986549))

(declare-fun m!986551 () Bool)

(assert (=> start!94500 m!986551))

(declare-fun m!986553 () Bool)

(assert (=> start!94500 m!986553))

(declare-fun m!986555 () Bool)

(assert (=> b!1068459 m!986555))

(declare-fun m!986557 () Bool)

(assert (=> b!1068456 m!986557))

(declare-fun m!986559 () Bool)

(assert (=> b!1068453 m!986559))

(declare-fun m!986561 () Bool)

(assert (=> b!1068453 m!986561))

(declare-fun m!986563 () Bool)

(assert (=> b!1068453 m!986563))

(declare-fun m!986565 () Bool)

(assert (=> b!1068457 m!986565))

(declare-fun m!986567 () Bool)

(assert (=> b!1068457 m!986567))

(declare-fun m!986569 () Bool)

(assert (=> mapNonEmpty!40129 m!986569))

(check-sat (not b!1068459) (not start!94500) (not b!1068460) (not b!1068453) tp_is_empty!25621 (not b!1068457) (not b!1068456) (not b_next!21811) b_and!34587 (not mapNonEmpty!40129))
(check-sat b_and!34587 (not b_next!21811))
