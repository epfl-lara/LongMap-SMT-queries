; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94654 () Bool)

(assert start!94654)

(declare-fun b_free!21745 () Bool)

(declare-fun b_next!21745 () Bool)

(assert (=> start!94654 (= b_free!21745 (not b_next!21745))))

(declare-fun tp!76682 () Bool)

(declare-fun b_and!34547 () Bool)

(assert (=> start!94654 (= tp!76682 b_and!34547)))

(declare-fun b!1068892 () Bool)

(declare-fun e!609769 () Bool)

(assert (=> b!1068892 (= e!609769 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39209 0))(
  ( (V!39210 (val!12828 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39209)

(declare-fun lt!472023 () Bool)

(declare-datatypes ((ValueCell!12074 0))(
  ( (ValueCellFull!12074 (v!15438 V!39209)) (EmptyCell!12074) )
))
(declare-datatypes ((array!68137 0))(
  ( (array!68138 (arr!32762 (Array (_ BitVec 32) ValueCell!12074)) (size!33299 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68137)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39209)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68139 0))(
  ( (array!68140 (arr!32763 (Array (_ BitVec 32) (_ BitVec 64))) (size!33300 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68139)

(declare-datatypes ((tuple2!16254 0))(
  ( (tuple2!16255 (_1!8138 (_ BitVec 64)) (_2!8138 V!39209)) )
))
(declare-datatypes ((List!22826 0))(
  ( (Nil!22823) (Cons!22822 (h!24040 tuple2!16254) (t!32143 List!22826)) )
))
(declare-datatypes ((ListLongMap!14231 0))(
  ( (ListLongMap!14232 (toList!7131 List!22826)) )
))
(declare-fun contains!6296 (ListLongMap!14231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4059 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14231)

(assert (=> b!1068892 (= lt!472023 (contains!6296 (getCurrentListMap!4059 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!40027 () Bool)

(declare-fun mapRes!40027 () Bool)

(declare-fun tp!76681 () Bool)

(declare-fun e!609767 () Bool)

(assert (=> mapNonEmpty!40027 (= mapRes!40027 (and tp!76681 e!609767))))

(declare-fun mapKey!40027 () (_ BitVec 32))

(declare-fun mapValue!40027 () ValueCell!12074)

(declare-fun mapRest!40027 () (Array (_ BitVec 32) ValueCell!12074))

(assert (=> mapNonEmpty!40027 (= (arr!32762 _values!955) (store mapRest!40027 mapKey!40027 mapValue!40027))))

(declare-fun res!712917 () Bool)

(declare-fun e!609770 () Bool)

(assert (=> start!94654 (=> (not res!712917) (not e!609770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94654 (= res!712917 (validMask!0 mask!1515))))

(assert (=> start!94654 e!609770))

(assert (=> start!94654 true))

(declare-fun tp_is_empty!25555 () Bool)

(assert (=> start!94654 tp_is_empty!25555))

(declare-fun e!609771 () Bool)

(declare-fun array_inv!25386 (array!68137) Bool)

(assert (=> start!94654 (and (array_inv!25386 _values!955) e!609771)))

(assert (=> start!94654 tp!76682))

(declare-fun array_inv!25387 (array!68139) Bool)

(assert (=> start!94654 (array_inv!25387 _keys!1163)))

(declare-fun mapIsEmpty!40027 () Bool)

(assert (=> mapIsEmpty!40027 mapRes!40027))

(declare-fun b!1068893 () Bool)

(declare-fun res!712920 () Bool)

(assert (=> b!1068893 (=> (not res!712920) (not e!609770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68139 (_ BitVec 32)) Bool)

(assert (=> b!1068893 (= res!712920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068894 () Bool)

(declare-fun res!712919 () Bool)

(assert (=> b!1068894 (=> (not res!712919) (not e!609770))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1068894 (= res!712919 (and (= (size!33299 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33300 _keys!1163) (size!33299 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068895 () Bool)

(declare-fun e!609768 () Bool)

(assert (=> b!1068895 (= e!609771 (and e!609768 mapRes!40027))))

(declare-fun condMapEmpty!40027 () Bool)

(declare-fun mapDefault!40027 () ValueCell!12074)

(assert (=> b!1068895 (= condMapEmpty!40027 (= (arr!32762 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12074)) mapDefault!40027)))))

(declare-fun b!1068896 () Bool)

(declare-fun res!712916 () Bool)

(assert (=> b!1068896 (=> (not res!712916) (not e!609770))))

(declare-datatypes ((List!22827 0))(
  ( (Nil!22824) (Cons!22823 (h!24041 (_ BitVec 64)) (t!32144 List!22827)) )
))
(declare-fun arrayNoDuplicates!0 (array!68139 (_ BitVec 32) List!22827) Bool)

(assert (=> b!1068896 (= res!712916 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22824))))

(declare-fun b!1068897 () Bool)

(assert (=> b!1068897 (= e!609768 tp_is_empty!25555)))

(declare-fun b!1068898 () Bool)

(assert (=> b!1068898 (= e!609767 tp_is_empty!25555)))

(declare-fun b!1068899 () Bool)

(assert (=> b!1068899 (= e!609770 (not e!609769))))

(declare-fun res!712918 () Bool)

(assert (=> b!1068899 (=> res!712918 e!609769)))

(assert (=> b!1068899 (= res!712918 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472021 () ListLongMap!14231)

(declare-fun lt!472020 () ListLongMap!14231)

(assert (=> b!1068899 (= lt!472021 lt!472020)))

(declare-datatypes ((Unit!35060 0))(
  ( (Unit!35061) )
))
(declare-fun lt!472022 () Unit!35060)

(declare-fun zeroValueAfter!47 () V!39209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!753 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 V!39209 V!39209 (_ BitVec 32) Int) Unit!35060)

(assert (=> b!1068899 (= lt!472022 (lemmaNoChangeToArrayThenSameMapNoExtras!753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3750 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) V!39209 V!39209 (_ BitVec 32) Int) ListLongMap!14231)

(assert (=> b!1068899 (= lt!472020 (getCurrentListMapNoExtraKeys!3750 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068899 (= lt!472021 (getCurrentListMapNoExtraKeys!3750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94654 res!712917) b!1068894))

(assert (= (and b!1068894 res!712919) b!1068893))

(assert (= (and b!1068893 res!712920) b!1068896))

(assert (= (and b!1068896 res!712916) b!1068899))

(assert (= (and b!1068899 (not res!712918)) b!1068892))

(assert (= (and b!1068895 condMapEmpty!40027) mapIsEmpty!40027))

(assert (= (and b!1068895 (not condMapEmpty!40027)) mapNonEmpty!40027))

(get-info :version)

(assert (= (and mapNonEmpty!40027 ((_ is ValueCellFull!12074) mapValue!40027)) b!1068898))

(assert (= (and b!1068895 ((_ is ValueCellFull!12074) mapDefault!40027)) b!1068897))

(assert (= start!94654 b!1068895))

(declare-fun m!987871 () Bool)

(assert (=> start!94654 m!987871))

(declare-fun m!987873 () Bool)

(assert (=> start!94654 m!987873))

(declare-fun m!987875 () Bool)

(assert (=> start!94654 m!987875))

(declare-fun m!987877 () Bool)

(assert (=> b!1068892 m!987877))

(assert (=> b!1068892 m!987877))

(declare-fun m!987879 () Bool)

(assert (=> b!1068892 m!987879))

(declare-fun m!987881 () Bool)

(assert (=> b!1068896 m!987881))

(declare-fun m!987883 () Bool)

(assert (=> mapNonEmpty!40027 m!987883))

(declare-fun m!987885 () Bool)

(assert (=> b!1068899 m!987885))

(declare-fun m!987887 () Bool)

(assert (=> b!1068899 m!987887))

(declare-fun m!987889 () Bool)

(assert (=> b!1068899 m!987889))

(declare-fun m!987891 () Bool)

(assert (=> b!1068893 m!987891))

(check-sat (not b_next!21745) (not b!1068899) (not mapNonEmpty!40027) b_and!34547 (not b!1068892) (not b!1068896) tp_is_empty!25555 (not b!1068893) (not start!94654))
(check-sat b_and!34547 (not b_next!21745))
