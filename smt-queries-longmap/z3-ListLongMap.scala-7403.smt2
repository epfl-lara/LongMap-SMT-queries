; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94446 () Bool)

(assert start!94446)

(declare-fun b_free!21595 () Bool)

(declare-fun b_next!21595 () Bool)

(assert (=> start!94446 (= b_free!21595 (not b_next!21595))))

(declare-fun tp!76223 () Bool)

(declare-fun b_and!34365 () Bool)

(assert (=> start!94446 (= tp!76223 b_and!34365)))

(declare-fun b!1066720 () Bool)

(declare-fun res!711678 () Bool)

(declare-fun e!608207 () Bool)

(assert (=> b!1066720 (=> (not res!711678) (not e!608207))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39009 0))(
  ( (V!39010 (val!12753 Int)) )
))
(declare-datatypes ((ValueCell!11999 0))(
  ( (ValueCellFull!11999 (v!15361 V!39009)) (EmptyCell!11999) )
))
(declare-datatypes ((array!67845 0))(
  ( (array!67846 (arr!32619 (Array (_ BitVec 32) ValueCell!11999)) (size!33156 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67845)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67847 0))(
  ( (array!67848 (arr!32620 (Array (_ BitVec 32) (_ BitVec 64))) (size!33157 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67847)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1066720 (= res!711678 (and (= (size!33156 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33157 _keys!1163) (size!33156 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066721 () Bool)

(declare-fun res!711679 () Bool)

(assert (=> b!1066721 (=> (not res!711679) (not e!608207))))

(declare-datatypes ((List!22716 0))(
  ( (Nil!22713) (Cons!22712 (h!23930 (_ BitVec 64)) (t!32027 List!22716)) )
))
(declare-fun arrayNoDuplicates!0 (array!67847 (_ BitVec 32) List!22716) Bool)

(assert (=> b!1066721 (= res!711679 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22713))))

(declare-fun res!711681 () Bool)

(assert (=> start!94446 (=> (not res!711681) (not e!608207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94446 (= res!711681 (validMask!0 mask!1515))))

(assert (=> start!94446 e!608207))

(assert (=> start!94446 true))

(declare-fun tp_is_empty!25405 () Bool)

(assert (=> start!94446 tp_is_empty!25405))

(declare-fun e!608205 () Bool)

(declare-fun array_inv!25284 (array!67845) Bool)

(assert (=> start!94446 (and (array_inv!25284 _values!955) e!608205)))

(assert (=> start!94446 tp!76223))

(declare-fun array_inv!25285 (array!67847) Bool)

(assert (=> start!94446 (array_inv!25285 _keys!1163)))

(declare-fun b!1066722 () Bool)

(declare-fun e!608206 () Bool)

(assert (=> b!1066722 (= e!608207 (not e!608206))))

(declare-fun res!711677 () Bool)

(assert (=> b!1066722 (=> res!711677 e!608206)))

(assert (=> b!1066722 (= res!711677 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16144 0))(
  ( (tuple2!16145 (_1!8083 (_ BitVec 64)) (_2!8083 V!39009)) )
))
(declare-datatypes ((List!22717 0))(
  ( (Nil!22714) (Cons!22713 (h!23931 tuple2!16144) (t!32028 List!22717)) )
))
(declare-datatypes ((ListLongMap!14121 0))(
  ( (ListLongMap!14122 (toList!7076 List!22717)) )
))
(declare-fun lt!470321 () ListLongMap!14121)

(declare-fun lt!470318 () ListLongMap!14121)

(assert (=> b!1066722 (= lt!470321 lt!470318)))

(declare-fun zeroValueBefore!47 () V!39009)

(declare-datatypes ((Unit!34946 0))(
  ( (Unit!34947) )
))
(declare-fun lt!470322 () Unit!34946)

(declare-fun minValue!907 () V!39009)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39009)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!707 (array!67847 array!67845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 V!39009 V!39009 (_ BitVec 32) Int) Unit!34946)

(assert (=> b!1066722 (= lt!470322 (lemmaNoChangeToArrayThenSameMapNoExtras!707 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3704 (array!67847 array!67845 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14121)

(assert (=> b!1066722 (= lt!470318 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066722 (= lt!470321 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39793 () Bool)

(declare-fun mapRes!39793 () Bool)

(declare-fun tp!76222 () Bool)

(declare-fun e!608210 () Bool)

(assert (=> mapNonEmpty!39793 (= mapRes!39793 (and tp!76222 e!608210))))

(declare-fun mapRest!39793 () (Array (_ BitVec 32) ValueCell!11999))

(declare-fun mapValue!39793 () ValueCell!11999)

(declare-fun mapKey!39793 () (_ BitVec 32))

(assert (=> mapNonEmpty!39793 (= (arr!32619 _values!955) (store mapRest!39793 mapKey!39793 mapValue!39793))))

(declare-fun mapIsEmpty!39793 () Bool)

(assert (=> mapIsEmpty!39793 mapRes!39793))

(declare-fun b!1066723 () Bool)

(assert (=> b!1066723 (= e!608206 true)))

(declare-fun lt!470320 () ListLongMap!14121)

(declare-fun lt!470324 () ListLongMap!14121)

(declare-fun -!596 (ListLongMap!14121 (_ BitVec 64)) ListLongMap!14121)

(assert (=> b!1066723 (= lt!470320 (-!596 lt!470324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470317 () ListLongMap!14121)

(assert (=> b!1066723 (= (-!596 lt!470317 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470321)))

(declare-fun lt!470323 () Unit!34946)

(declare-fun addThenRemoveForNewKeyIsSame!6 (ListLongMap!14121 (_ BitVec 64) V!39009) Unit!34946)

(assert (=> b!1066723 (= lt!470323 (addThenRemoveForNewKeyIsSame!6 lt!470321 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470319 () ListLongMap!14121)

(assert (=> b!1066723 (and (= lt!470324 lt!470317) (= lt!470319 lt!470318))))

(declare-fun +!3149 (ListLongMap!14121 tuple2!16144) ListLongMap!14121)

(assert (=> b!1066723 (= lt!470317 (+!3149 lt!470321 (tuple2!16145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4030 (array!67847 array!67845 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14121)

(assert (=> b!1066723 (= lt!470319 (getCurrentListMap!4030 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066723 (= lt!470324 (getCurrentListMap!4030 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066724 () Bool)

(declare-fun res!711680 () Bool)

(assert (=> b!1066724 (=> (not res!711680) (not e!608207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67847 (_ BitVec 32)) Bool)

(assert (=> b!1066724 (= res!711680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066725 () Bool)

(declare-fun e!608209 () Bool)

(assert (=> b!1066725 (= e!608205 (and e!608209 mapRes!39793))))

(declare-fun condMapEmpty!39793 () Bool)

(declare-fun mapDefault!39793 () ValueCell!11999)

(assert (=> b!1066725 (= condMapEmpty!39793 (= (arr!32619 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11999)) mapDefault!39793)))))

(declare-fun b!1066726 () Bool)

(assert (=> b!1066726 (= e!608209 tp_is_empty!25405)))

(declare-fun b!1066727 () Bool)

(assert (=> b!1066727 (= e!608210 tp_is_empty!25405)))

(assert (= (and start!94446 res!711681) b!1066720))

(assert (= (and b!1066720 res!711678) b!1066724))

(assert (= (and b!1066724 res!711680) b!1066721))

(assert (= (and b!1066721 res!711679) b!1066722))

(assert (= (and b!1066722 (not res!711677)) b!1066723))

(assert (= (and b!1066725 condMapEmpty!39793) mapIsEmpty!39793))

(assert (= (and b!1066725 (not condMapEmpty!39793)) mapNonEmpty!39793))

(get-info :version)

(assert (= (and mapNonEmpty!39793 ((_ is ValueCellFull!11999) mapValue!39793)) b!1066727))

(assert (= (and b!1066725 ((_ is ValueCellFull!11999) mapDefault!39793)) b!1066726))

(assert (= start!94446 b!1066725))

(declare-fun m!985511 () Bool)

(assert (=> b!1066721 m!985511))

(declare-fun m!985513 () Bool)

(assert (=> b!1066722 m!985513))

(declare-fun m!985515 () Bool)

(assert (=> b!1066722 m!985515))

(declare-fun m!985517 () Bool)

(assert (=> b!1066722 m!985517))

(declare-fun m!985519 () Bool)

(assert (=> mapNonEmpty!39793 m!985519))

(declare-fun m!985521 () Bool)

(assert (=> b!1066724 m!985521))

(declare-fun m!985523 () Bool)

(assert (=> start!94446 m!985523))

(declare-fun m!985525 () Bool)

(assert (=> start!94446 m!985525))

(declare-fun m!985527 () Bool)

(assert (=> start!94446 m!985527))

(declare-fun m!985529 () Bool)

(assert (=> b!1066723 m!985529))

(declare-fun m!985531 () Bool)

(assert (=> b!1066723 m!985531))

(declare-fun m!985533 () Bool)

(assert (=> b!1066723 m!985533))

(declare-fun m!985535 () Bool)

(assert (=> b!1066723 m!985535))

(declare-fun m!985537 () Bool)

(assert (=> b!1066723 m!985537))

(declare-fun m!985539 () Bool)

(assert (=> b!1066723 m!985539))

(check-sat (not start!94446) tp_is_empty!25405 (not b_next!21595) (not b!1066722) (not mapNonEmpty!39793) (not b!1066721) b_and!34365 (not b!1066723) (not b!1066724))
(check-sat b_and!34365 (not b_next!21595))
