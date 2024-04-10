; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94426 () Bool)

(assert start!94426)

(declare-fun b_free!21753 () Bool)

(declare-fun b_next!21753 () Bool)

(assert (=> start!94426 (= b_free!21753 (not b_next!21753))))

(declare-fun tp!76706 () Bool)

(declare-fun b_and!34545 () Bool)

(assert (=> start!94426 (= tp!76706 b_and!34545)))

(declare-fun b!1067666 () Bool)

(declare-fun res!712460 () Bool)

(declare-fun e!608992 () Bool)

(assert (=> b!1067666 (=> (not res!712460) (not e!608992))))

(declare-datatypes ((array!68109 0))(
  ( (array!68110 (arr!32754 (Array (_ BitVec 32) (_ BitVec 64))) (size!33290 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68109)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68109 (_ BitVec 32)) Bool)

(assert (=> b!1067666 (= res!712460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067667 () Bool)

(declare-fun e!608990 () Bool)

(declare-fun tp_is_empty!25563 () Bool)

(assert (=> b!1067667 (= e!608990 tp_is_empty!25563)))

(declare-fun res!712463 () Bool)

(assert (=> start!94426 (=> (not res!712463) (not e!608992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94426 (= res!712463 (validMask!0 mask!1515))))

(assert (=> start!94426 e!608992))

(assert (=> start!94426 true))

(assert (=> start!94426 tp_is_empty!25563))

(declare-datatypes ((V!39219 0))(
  ( (V!39220 (val!12832 Int)) )
))
(declare-datatypes ((ValueCell!12078 0))(
  ( (ValueCellFull!12078 (v!15446 V!39219)) (EmptyCell!12078) )
))
(declare-datatypes ((array!68111 0))(
  ( (array!68112 (arr!32755 (Array (_ BitVec 32) ValueCell!12078)) (size!33291 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68111)

(declare-fun e!608989 () Bool)

(declare-fun array_inv!25358 (array!68111) Bool)

(assert (=> start!94426 (and (array_inv!25358 _values!955) e!608989)))

(assert (=> start!94426 tp!76706))

(declare-fun array_inv!25359 (array!68109) Bool)

(assert (=> start!94426 (array_inv!25359 _keys!1163)))

(declare-fun mapNonEmpty!40039 () Bool)

(declare-fun mapRes!40039 () Bool)

(declare-fun tp!76705 () Bool)

(declare-fun e!608991 () Bool)

(assert (=> mapNonEmpty!40039 (= mapRes!40039 (and tp!76705 e!608991))))

(declare-fun mapRest!40039 () (Array (_ BitVec 32) ValueCell!12078))

(declare-fun mapValue!40039 () ValueCell!12078)

(declare-fun mapKey!40039 () (_ BitVec 32))

(assert (=> mapNonEmpty!40039 (= (arr!32755 _values!955) (store mapRest!40039 mapKey!40039 mapValue!40039))))

(declare-fun b!1067668 () Bool)

(declare-fun e!608995 () Bool)

(assert (=> b!1067668 (= e!608992 (not e!608995))))

(declare-fun res!712462 () Bool)

(assert (=> b!1067668 (=> res!712462 e!608995)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067668 (= res!712462 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16286 0))(
  ( (tuple2!16287 (_1!8154 (_ BitVec 64)) (_2!8154 V!39219)) )
))
(declare-datatypes ((List!22843 0))(
  ( (Nil!22840) (Cons!22839 (h!24048 tuple2!16286) (t!32168 List!22843)) )
))
(declare-datatypes ((ListLongMap!14255 0))(
  ( (ListLongMap!14256 (toList!7143 List!22843)) )
))
(declare-fun lt!471559 () ListLongMap!14255)

(declare-fun lt!471560 () ListLongMap!14255)

(assert (=> b!1067668 (= lt!471559 lt!471560)))

(declare-fun zeroValueBefore!47 () V!39219)

(declare-fun minValue!907 () V!39219)

(declare-datatypes ((Unit!35083 0))(
  ( (Unit!35084) )
))
(declare-fun lt!471562 () Unit!35083)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39219)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!763 (array!68109 array!68111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39219 V!39219 V!39219 V!39219 (_ BitVec 32) Int) Unit!35083)

(assert (=> b!1067668 (= lt!471562 (lemmaNoChangeToArrayThenSameMapNoExtras!763 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3726 (array!68109 array!68111 (_ BitVec 32) (_ BitVec 32) V!39219 V!39219 (_ BitVec 32) Int) ListLongMap!14255)

(assert (=> b!1067668 (= lt!471560 (getCurrentListMapNoExtraKeys!3726 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067668 (= lt!471559 (getCurrentListMapNoExtraKeys!3726 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40039 () Bool)

(assert (=> mapIsEmpty!40039 mapRes!40039))

(declare-fun b!1067669 () Bool)

(declare-fun e!608994 () Bool)

(assert (=> b!1067669 (= e!608995 e!608994)))

(declare-fun res!712464 () Bool)

(assert (=> b!1067669 (=> res!712464 e!608994)))

(declare-fun lt!471561 () ListLongMap!14255)

(declare-fun contains!6280 (ListLongMap!14255 (_ BitVec 64)) Bool)

(assert (=> b!1067669 (= res!712464 (contains!6280 lt!471561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4077 (array!68109 array!68111 (_ BitVec 32) (_ BitVec 32) V!39219 V!39219 (_ BitVec 32) Int) ListLongMap!14255)

(assert (=> b!1067669 (= lt!471561 (getCurrentListMap!4077 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067670 () Bool)

(assert (=> b!1067670 (= e!608991 tp_is_empty!25563)))

(declare-fun b!1067671 () Bool)

(declare-fun res!712459 () Bool)

(assert (=> b!1067671 (=> (not res!712459) (not e!608992))))

(assert (=> b!1067671 (= res!712459 (and (= (size!33291 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33290 _keys!1163) (size!33291 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067672 () Bool)

(assert (=> b!1067672 (= e!608994 true)))

(declare-fun -!630 (ListLongMap!14255 (_ BitVec 64)) ListLongMap!14255)

(assert (=> b!1067672 (= (-!630 lt!471561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471561)))

(declare-fun lt!471558 () Unit!35083)

(declare-fun removeNotPresentStillSame!40 (ListLongMap!14255 (_ BitVec 64)) Unit!35083)

(assert (=> b!1067672 (= lt!471558 (removeNotPresentStillSame!40 lt!471561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067673 () Bool)

(declare-fun res!712461 () Bool)

(assert (=> b!1067673 (=> (not res!712461) (not e!608992))))

(declare-datatypes ((List!22844 0))(
  ( (Nil!22841) (Cons!22840 (h!24049 (_ BitVec 64)) (t!32169 List!22844)) )
))
(declare-fun arrayNoDuplicates!0 (array!68109 (_ BitVec 32) List!22844) Bool)

(assert (=> b!1067673 (= res!712461 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22841))))

(declare-fun b!1067674 () Bool)

(assert (=> b!1067674 (= e!608989 (and e!608990 mapRes!40039))))

(declare-fun condMapEmpty!40039 () Bool)

(declare-fun mapDefault!40039 () ValueCell!12078)

(assert (=> b!1067674 (= condMapEmpty!40039 (= (arr!32755 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12078)) mapDefault!40039)))))

(assert (= (and start!94426 res!712463) b!1067671))

(assert (= (and b!1067671 res!712459) b!1067666))

(assert (= (and b!1067666 res!712460) b!1067673))

(assert (= (and b!1067673 res!712461) b!1067668))

(assert (= (and b!1067668 (not res!712462)) b!1067669))

(assert (= (and b!1067669 (not res!712464)) b!1067672))

(assert (= (and b!1067674 condMapEmpty!40039) mapIsEmpty!40039))

(assert (= (and b!1067674 (not condMapEmpty!40039)) mapNonEmpty!40039))

(get-info :version)

(assert (= (and mapNonEmpty!40039 ((_ is ValueCellFull!12078) mapValue!40039)) b!1067670))

(assert (= (and b!1067674 ((_ is ValueCellFull!12078) mapDefault!40039)) b!1067667))

(assert (= start!94426 b!1067674))

(declare-fun m!986291 () Bool)

(assert (=> b!1067673 m!986291))

(declare-fun m!986293 () Bool)

(assert (=> start!94426 m!986293))

(declare-fun m!986295 () Bool)

(assert (=> start!94426 m!986295))

(declare-fun m!986297 () Bool)

(assert (=> start!94426 m!986297))

(declare-fun m!986299 () Bool)

(assert (=> b!1067666 m!986299))

(declare-fun m!986301 () Bool)

(assert (=> mapNonEmpty!40039 m!986301))

(declare-fun m!986303 () Bool)

(assert (=> b!1067672 m!986303))

(declare-fun m!986305 () Bool)

(assert (=> b!1067672 m!986305))

(declare-fun m!986307 () Bool)

(assert (=> b!1067668 m!986307))

(declare-fun m!986309 () Bool)

(assert (=> b!1067668 m!986309))

(declare-fun m!986311 () Bool)

(assert (=> b!1067668 m!986311))

(declare-fun m!986313 () Bool)

(assert (=> b!1067669 m!986313))

(declare-fun m!986315 () Bool)

(assert (=> b!1067669 m!986315))

(check-sat (not b!1067673) tp_is_empty!25563 (not b!1067666) (not start!94426) b_and!34545 (not b_next!21753) (not b!1067669) (not b!1067672) (not mapNonEmpty!40039) (not b!1067668))
(check-sat b_and!34545 (not b_next!21753))
