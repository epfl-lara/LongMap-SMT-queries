; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94904 () Bool)

(assert start!94904)

(declare-fun b_free!21937 () Bool)

(declare-fun b_next!21937 () Bool)

(assert (=> start!94904 (= b_free!21937 (not b_next!21937))))

(declare-fun tp!77266 () Bool)

(declare-fun b_and!34767 () Bool)

(assert (=> start!94904 (= tp!77266 b_and!34767)))

(declare-fun b!1071676 () Bool)

(declare-fun e!611831 () Bool)

(declare-fun e!611835 () Bool)

(declare-fun mapRes!40324 () Bool)

(assert (=> b!1071676 (= e!611831 (and e!611835 mapRes!40324))))

(declare-fun condMapEmpty!40324 () Bool)

(declare-datatypes ((V!39465 0))(
  ( (V!39466 (val!12924 Int)) )
))
(declare-datatypes ((ValueCell!12170 0))(
  ( (ValueCellFull!12170 (v!15536 V!39465)) (EmptyCell!12170) )
))
(declare-datatypes ((array!68509 0))(
  ( (array!68510 (arr!32945 (Array (_ BitVec 32) ValueCell!12170)) (size!33482 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68509)

(declare-fun mapDefault!40324 () ValueCell!12170)

(assert (=> b!1071676 (= condMapEmpty!40324 (= (arr!32945 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12170)) mapDefault!40324)))))

(declare-fun b!1071677 () Bool)

(declare-fun res!714590 () Bool)

(declare-fun e!611834 () Bool)

(assert (=> b!1071677 (=> (not res!714590) (not e!611834))))

(declare-datatypes ((array!68511 0))(
  ( (array!68512 (arr!32946 (Array (_ BitVec 32) (_ BitVec 64))) (size!33483 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68511)

(declare-datatypes ((List!22974 0))(
  ( (Nil!22971) (Cons!22970 (h!24188 (_ BitVec 64)) (t!32297 List!22974)) )
))
(declare-fun arrayNoDuplicates!0 (array!68511 (_ BitVec 32) List!22974) Bool)

(assert (=> b!1071677 (= res!714590 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22971))))

(declare-fun b!1071678 () Bool)

(declare-fun e!611836 () Bool)

(assert (=> b!1071678 (= e!611836 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39465)

(declare-datatypes ((tuple2!16408 0))(
  ( (tuple2!16409 (_1!8215 (_ BitVec 64)) (_2!8215 V!39465)) )
))
(declare-datatypes ((List!22975 0))(
  ( (Nil!22972) (Cons!22971 (h!24189 tuple2!16408) (t!32298 List!22975)) )
))
(declare-datatypes ((ListLongMap!14385 0))(
  ( (ListLongMap!14386 (toList!7208 List!22975)) )
))
(declare-fun lt!473544 () ListLongMap!14385)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39465)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4109 (array!68511 array!68509 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14385)

(assert (=> b!1071678 (= lt!473544 (getCurrentListMap!4109 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071679 () Bool)

(assert (=> b!1071679 (= e!611834 (not e!611836))))

(declare-fun res!714591 () Bool)

(assert (=> b!1071679 (=> res!714591 e!611836)))

(assert (=> b!1071679 (= res!714591 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473542 () ListLongMap!14385)

(declare-fun lt!473541 () ListLongMap!14385)

(assert (=> b!1071679 (= lt!473542 lt!473541)))

(declare-datatypes ((Unit!35204 0))(
  ( (Unit!35205) )
))
(declare-fun lt!473543 () Unit!35204)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39465)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!820 (array!68511 array!68509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 V!39465 V!39465 (_ BitVec 32) Int) Unit!35204)

(assert (=> b!1071679 (= lt!473543 (lemmaNoChangeToArrayThenSameMapNoExtras!820 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3817 (array!68511 array!68509 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14385)

(assert (=> b!1071679 (= lt!473541 (getCurrentListMapNoExtraKeys!3817 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071679 (= lt!473542 (getCurrentListMapNoExtraKeys!3817 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071680 () Bool)

(declare-fun res!714592 () Bool)

(assert (=> b!1071680 (=> (not res!714592) (not e!611834))))

(assert (=> b!1071680 (= res!714592 (and (= (size!33482 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33483 _keys!1163) (size!33482 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714593 () Bool)

(assert (=> start!94904 (=> (not res!714593) (not e!611834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94904 (= res!714593 (validMask!0 mask!1515))))

(assert (=> start!94904 e!611834))

(assert (=> start!94904 true))

(declare-fun tp_is_empty!25747 () Bool)

(assert (=> start!94904 tp_is_empty!25747))

(declare-fun array_inv!25512 (array!68509) Bool)

(assert (=> start!94904 (and (array_inv!25512 _values!955) e!611831)))

(assert (=> start!94904 tp!77266))

(declare-fun array_inv!25513 (array!68511) Bool)

(assert (=> start!94904 (array_inv!25513 _keys!1163)))

(declare-fun b!1071681 () Bool)

(declare-fun res!714594 () Bool)

(assert (=> b!1071681 (=> (not res!714594) (not e!611834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68511 (_ BitVec 32)) Bool)

(assert (=> b!1071681 (= res!714594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071682 () Bool)

(declare-fun e!611833 () Bool)

(assert (=> b!1071682 (= e!611833 tp_is_empty!25747)))

(declare-fun mapNonEmpty!40324 () Bool)

(declare-fun tp!77267 () Bool)

(assert (=> mapNonEmpty!40324 (= mapRes!40324 (and tp!77267 e!611833))))

(declare-fun mapRest!40324 () (Array (_ BitVec 32) ValueCell!12170))

(declare-fun mapValue!40324 () ValueCell!12170)

(declare-fun mapKey!40324 () (_ BitVec 32))

(assert (=> mapNonEmpty!40324 (= (arr!32945 _values!955) (store mapRest!40324 mapKey!40324 mapValue!40324))))

(declare-fun b!1071683 () Bool)

(assert (=> b!1071683 (= e!611835 tp_is_empty!25747)))

(declare-fun mapIsEmpty!40324 () Bool)

(assert (=> mapIsEmpty!40324 mapRes!40324))

(assert (= (and start!94904 res!714593) b!1071680))

(assert (= (and b!1071680 res!714592) b!1071681))

(assert (= (and b!1071681 res!714594) b!1071677))

(assert (= (and b!1071677 res!714590) b!1071679))

(assert (= (and b!1071679 (not res!714591)) b!1071678))

(assert (= (and b!1071676 condMapEmpty!40324) mapIsEmpty!40324))

(assert (= (and b!1071676 (not condMapEmpty!40324)) mapNonEmpty!40324))

(get-info :version)

(assert (= (and mapNonEmpty!40324 ((_ is ValueCellFull!12170) mapValue!40324)) b!1071682))

(assert (= (and b!1071676 ((_ is ValueCellFull!12170) mapDefault!40324)) b!1071683))

(assert (= start!94904 b!1071676))

(declare-fun m!990385 () Bool)

(assert (=> b!1071677 m!990385))

(declare-fun m!990387 () Bool)

(assert (=> mapNonEmpty!40324 m!990387))

(declare-fun m!990389 () Bool)

(assert (=> b!1071679 m!990389))

(declare-fun m!990391 () Bool)

(assert (=> b!1071679 m!990391))

(declare-fun m!990393 () Bool)

(assert (=> b!1071679 m!990393))

(declare-fun m!990395 () Bool)

(assert (=> start!94904 m!990395))

(declare-fun m!990397 () Bool)

(assert (=> start!94904 m!990397))

(declare-fun m!990399 () Bool)

(assert (=> start!94904 m!990399))

(declare-fun m!990401 () Bool)

(assert (=> b!1071678 m!990401))

(declare-fun m!990403 () Bool)

(assert (=> b!1071681 m!990403))

(check-sat (not b!1071679) (not b_next!21937) b_and!34767 tp_is_empty!25747 (not start!94904) (not b!1071681) (not b!1071678) (not mapNonEmpty!40324) (not b!1071677))
(check-sat b_and!34767 (not b_next!21937))
