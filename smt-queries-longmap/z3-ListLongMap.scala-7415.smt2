; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94540 () Bool)

(assert start!94540)

(declare-fun b_free!21667 () Bool)

(declare-fun b_next!21667 () Bool)

(assert (=> start!94540 (= b_free!21667 (not b_next!21667))))

(declare-fun tp!76442 () Bool)

(declare-fun b_and!34449 () Bool)

(assert (=> start!94540 (= tp!76442 b_and!34449)))

(declare-fun b!1067768 () Bool)

(declare-fun res!712300 () Bool)

(declare-fun e!608973 () Bool)

(assert (=> b!1067768 (=> (not res!712300) (not e!608973))))

(declare-datatypes ((array!67981 0))(
  ( (array!67982 (arr!32686 (Array (_ BitVec 32) (_ BitVec 64))) (size!33223 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67981)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67981 (_ BitVec 32)) Bool)

(assert (=> b!1067768 (= res!712300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067769 () Bool)

(declare-fun res!712302 () Bool)

(assert (=> b!1067769 (=> (not res!712302) (not e!608973))))

(declare-datatypes ((V!39105 0))(
  ( (V!39106 (val!12789 Int)) )
))
(declare-datatypes ((ValueCell!12035 0))(
  ( (ValueCellFull!12035 (v!15398 V!39105)) (EmptyCell!12035) )
))
(declare-datatypes ((array!67983 0))(
  ( (array!67984 (arr!32687 (Array (_ BitVec 32) ValueCell!12035)) (size!33224 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67983)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067769 (= res!712302 (and (= (size!33224 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33223 _keys!1163) (size!33224 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067770 () Bool)

(declare-fun e!608975 () Bool)

(declare-fun tp_is_empty!25477 () Bool)

(assert (=> b!1067770 (= e!608975 tp_is_empty!25477)))

(declare-fun res!712303 () Bool)

(assert (=> start!94540 (=> (not res!712303) (not e!608973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94540 (= res!712303 (validMask!0 mask!1515))))

(assert (=> start!94540 e!608973))

(assert (=> start!94540 true))

(assert (=> start!94540 tp_is_empty!25477))

(declare-fun e!608972 () Bool)

(declare-fun array_inv!25330 (array!67983) Bool)

(assert (=> start!94540 (and (array_inv!25330 _values!955) e!608972)))

(assert (=> start!94540 tp!76442))

(declare-fun array_inv!25331 (array!67981) Bool)

(assert (=> start!94540 (array_inv!25331 _keys!1163)))

(declare-fun mapNonEmpty!39904 () Bool)

(declare-fun mapRes!39904 () Bool)

(declare-fun tp!76441 () Bool)

(declare-fun e!608976 () Bool)

(assert (=> mapNonEmpty!39904 (= mapRes!39904 (and tp!76441 e!608976))))

(declare-fun mapValue!39904 () ValueCell!12035)

(declare-fun mapKey!39904 () (_ BitVec 32))

(declare-fun mapRest!39904 () (Array (_ BitVec 32) ValueCell!12035))

(assert (=> mapNonEmpty!39904 (= (arr!32687 _values!955) (store mapRest!39904 mapKey!39904 mapValue!39904))))

(declare-fun b!1067771 () Bool)

(declare-fun e!608974 () Bool)

(assert (=> b!1067771 (= e!608973 (not e!608974))))

(declare-fun res!712301 () Bool)

(assert (=> b!1067771 (=> res!712301 e!608974)))

(assert (=> b!1067771 (= res!712301 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16198 0))(
  ( (tuple2!16199 (_1!8110 (_ BitVec 64)) (_2!8110 V!39105)) )
))
(declare-datatypes ((List!22766 0))(
  ( (Nil!22763) (Cons!22762 (h!23980 tuple2!16198) (t!32079 List!22766)) )
))
(declare-datatypes ((ListLongMap!14175 0))(
  ( (ListLongMap!14176 (toList!7103 List!22766)) )
))
(declare-fun lt!471325 () ListLongMap!14175)

(declare-fun lt!471322 () ListLongMap!14175)

(assert (=> b!1067771 (= lt!471325 lt!471322)))

(declare-fun zeroValueBefore!47 () V!39105)

(declare-fun minValue!907 () V!39105)

(declare-datatypes ((Unit!35002 0))(
  ( (Unit!35003) )
))
(declare-fun lt!471321 () Unit!35002)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39105)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!727 (array!67981 array!67983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 V!39105 V!39105 (_ BitVec 32) Int) Unit!35002)

(assert (=> b!1067771 (= lt!471321 (lemmaNoChangeToArrayThenSameMapNoExtras!727 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3724 (array!67981 array!67983 (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 (_ BitVec 32) Int) ListLongMap!14175)

(assert (=> b!1067771 (= lt!471322 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067771 (= lt!471325 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39904 () Bool)

(assert (=> mapIsEmpty!39904 mapRes!39904))

(declare-fun b!1067772 () Bool)

(declare-fun res!712299 () Bool)

(assert (=> b!1067772 (=> (not res!712299) (not e!608973))))

(declare-datatypes ((List!22767 0))(
  ( (Nil!22764) (Cons!22763 (h!23981 (_ BitVec 64)) (t!32080 List!22767)) )
))
(declare-fun arrayNoDuplicates!0 (array!67981 (_ BitVec 32) List!22767) Bool)

(assert (=> b!1067772 (= res!712299 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22764))))

(declare-fun b!1067773 () Bool)

(assert (=> b!1067773 (= e!608972 (and e!608975 mapRes!39904))))

(declare-fun condMapEmpty!39904 () Bool)

(declare-fun mapDefault!39904 () ValueCell!12035)

(assert (=> b!1067773 (= condMapEmpty!39904 (= (arr!32687 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12035)) mapDefault!39904)))))

(declare-fun b!1067774 () Bool)

(assert (=> b!1067774 (= e!608974 true)))

(declare-fun lt!471323 () ListLongMap!14175)

(declare-fun lt!471326 () ListLongMap!14175)

(declare-fun -!618 (ListLongMap!14175 (_ BitVec 64)) ListLongMap!14175)

(assert (=> b!1067774 (= lt!471323 (-!618 lt!471326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!471319 () ListLongMap!14175)

(assert (=> b!1067774 (= (-!618 lt!471319 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471325)))

(declare-fun lt!471324 () Unit!35002)

(declare-fun addThenRemoveForNewKeyIsSame!28 (ListLongMap!14175 (_ BitVec 64) V!39105) Unit!35002)

(assert (=> b!1067774 (= lt!471324 (addThenRemoveForNewKeyIsSame!28 lt!471325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!471320 () ListLongMap!14175)

(assert (=> b!1067774 (and (= lt!471326 lt!471319) (= lt!471320 lt!471322))))

(declare-fun +!3171 (ListLongMap!14175 tuple2!16198) ListLongMap!14175)

(assert (=> b!1067774 (= lt!471319 (+!3171 lt!471325 (tuple2!16199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4052 (array!67981 array!67983 (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 (_ BitVec 32) Int) ListLongMap!14175)

(assert (=> b!1067774 (= lt!471320 (getCurrentListMap!4052 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067774 (= lt!471326 (getCurrentListMap!4052 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067775 () Bool)

(assert (=> b!1067775 (= e!608976 tp_is_empty!25477)))

(assert (= (and start!94540 res!712303) b!1067769))

(assert (= (and b!1067769 res!712302) b!1067768))

(assert (= (and b!1067768 res!712300) b!1067772))

(assert (= (and b!1067772 res!712299) b!1067771))

(assert (= (and b!1067771 (not res!712301)) b!1067774))

(assert (= (and b!1067773 condMapEmpty!39904) mapIsEmpty!39904))

(assert (= (and b!1067773 (not condMapEmpty!39904)) mapNonEmpty!39904))

(get-info :version)

(assert (= (and mapNonEmpty!39904 ((_ is ValueCellFull!12035) mapValue!39904)) b!1067775))

(assert (= (and b!1067773 ((_ is ValueCellFull!12035) mapDefault!39904)) b!1067770))

(assert (= start!94540 b!1067773))

(declare-fun m!986775 () Bool)

(assert (=> b!1067772 m!986775))

(declare-fun m!986777 () Bool)

(assert (=> b!1067771 m!986777))

(declare-fun m!986779 () Bool)

(assert (=> b!1067771 m!986779))

(declare-fun m!986781 () Bool)

(assert (=> b!1067771 m!986781))

(declare-fun m!986783 () Bool)

(assert (=> start!94540 m!986783))

(declare-fun m!986785 () Bool)

(assert (=> start!94540 m!986785))

(declare-fun m!986787 () Bool)

(assert (=> start!94540 m!986787))

(declare-fun m!986789 () Bool)

(assert (=> b!1067768 m!986789))

(declare-fun m!986791 () Bool)

(assert (=> mapNonEmpty!39904 m!986791))

(declare-fun m!986793 () Bool)

(assert (=> b!1067774 m!986793))

(declare-fun m!986795 () Bool)

(assert (=> b!1067774 m!986795))

(declare-fun m!986797 () Bool)

(assert (=> b!1067774 m!986797))

(declare-fun m!986799 () Bool)

(assert (=> b!1067774 m!986799))

(declare-fun m!986801 () Bool)

(assert (=> b!1067774 m!986801))

(declare-fun m!986803 () Bool)

(assert (=> b!1067774 m!986803))

(check-sat (not mapNonEmpty!39904) (not b_next!21667) b_and!34449 (not b!1067774) (not b!1067772) tp_is_empty!25477 (not b!1067771) (not b!1067768) (not start!94540))
(check-sat b_and!34449 (not b_next!21667))
