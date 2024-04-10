; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94160 () Bool)

(assert start!94160)

(declare-fun b_free!21561 () Bool)

(declare-fun b_next!21561 () Bool)

(assert (=> start!94160 (= b_free!21561 (not b_next!21561))))

(declare-fun tp!76117 () Bool)

(declare-fun b_and!34311 () Bool)

(assert (=> start!94160 (= tp!76117 b_and!34311)))

(declare-fun mapNonEmpty!39739 () Bool)

(declare-fun mapRes!39739 () Bool)

(declare-fun tp!76118 () Bool)

(declare-fun e!606941 () Bool)

(assert (=> mapNonEmpty!39739 (= mapRes!39739 (and tp!76118 e!606941))))

(declare-datatypes ((V!38963 0))(
  ( (V!38964 (val!12736 Int)) )
))
(declare-datatypes ((ValueCell!11982 0))(
  ( (ValueCellFull!11982 (v!15348 V!38963)) (EmptyCell!11982) )
))
(declare-fun mapValue!39739 () ValueCell!11982)

(declare-datatypes ((array!67727 0))(
  ( (array!67728 (arr!32567 (Array (_ BitVec 32) ValueCell!11982)) (size!33103 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67727)

(declare-fun mapRest!39739 () (Array (_ BitVec 32) ValueCell!11982))

(declare-fun mapKey!39739 () (_ BitVec 32))

(assert (=> mapNonEmpty!39739 (= (arr!32567 _values!955) (store mapRest!39739 mapKey!39739 mapValue!39739))))

(declare-fun b!1064828 () Bool)

(declare-fun e!606943 () Bool)

(assert (=> b!1064828 (= e!606943 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38963)

(declare-datatypes ((tuple2!16134 0))(
  ( (tuple2!16135 (_1!8078 (_ BitVec 64)) (_2!8078 V!38963)) )
))
(declare-datatypes ((List!22703 0))(
  ( (Nil!22700) (Cons!22699 (h!23908 tuple2!16134) (t!32020 List!22703)) )
))
(declare-datatypes ((ListLongMap!14103 0))(
  ( (ListLongMap!14104 (toList!7067 List!22703)) )
))
(declare-fun lt!469397 () ListLongMap!14103)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38963)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67729 0))(
  ( (array!67730 (arr!32568 (Array (_ BitVec 32) (_ BitVec 64))) (size!33104 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67729)

(declare-fun getCurrentListMap!4027 (array!67729 array!67727 (_ BitVec 32) (_ BitVec 32) V!38963 V!38963 (_ BitVec 32) Int) ListLongMap!14103)

(assert (=> b!1064828 (= lt!469397 (getCurrentListMap!4027 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064829 () Bool)

(declare-fun e!606942 () Bool)

(declare-fun e!606944 () Bool)

(assert (=> b!1064829 (= e!606942 (and e!606944 mapRes!39739))))

(declare-fun condMapEmpty!39739 () Bool)

(declare-fun mapDefault!39739 () ValueCell!11982)

(assert (=> b!1064829 (= condMapEmpty!39739 (= (arr!32567 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11982)) mapDefault!39739)))))

(declare-fun b!1064830 () Bool)

(declare-fun tp_is_empty!25371 () Bool)

(assert (=> b!1064830 (= e!606941 tp_is_empty!25371)))

(declare-fun b!1064831 () Bool)

(declare-fun res!710835 () Bool)

(declare-fun e!606946 () Bool)

(assert (=> b!1064831 (=> (not res!710835) (not e!606946))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064831 (= res!710835 (and (= (size!33103 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33104 _keys!1163) (size!33103 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39739 () Bool)

(assert (=> mapIsEmpty!39739 mapRes!39739))

(declare-fun res!710836 () Bool)

(assert (=> start!94160 (=> (not res!710836) (not e!606946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94160 (= res!710836 (validMask!0 mask!1515))))

(assert (=> start!94160 e!606946))

(assert (=> start!94160 true))

(assert (=> start!94160 tp_is_empty!25371))

(declare-fun array_inv!25220 (array!67727) Bool)

(assert (=> start!94160 (and (array_inv!25220 _values!955) e!606942)))

(assert (=> start!94160 tp!76117))

(declare-fun array_inv!25221 (array!67729) Bool)

(assert (=> start!94160 (array_inv!25221 _keys!1163)))

(declare-fun b!1064832 () Bool)

(declare-fun res!710833 () Bool)

(assert (=> b!1064832 (=> (not res!710833) (not e!606946))))

(declare-datatypes ((List!22704 0))(
  ( (Nil!22701) (Cons!22700 (h!23909 (_ BitVec 64)) (t!32021 List!22704)) )
))
(declare-fun arrayNoDuplicates!0 (array!67729 (_ BitVec 32) List!22704) Bool)

(assert (=> b!1064832 (= res!710833 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22701))))

(declare-fun b!1064833 () Bool)

(declare-fun res!710837 () Bool)

(assert (=> b!1064833 (=> (not res!710837) (not e!606946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67729 (_ BitVec 32)) Bool)

(assert (=> b!1064833 (= res!710837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064834 () Bool)

(assert (=> b!1064834 (= e!606944 tp_is_empty!25371)))

(declare-fun b!1064835 () Bool)

(assert (=> b!1064835 (= e!606946 (not e!606943))))

(declare-fun res!710834 () Bool)

(assert (=> b!1064835 (=> res!710834 e!606943)))

(assert (=> b!1064835 (= res!710834 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469395 () ListLongMap!14103)

(declare-fun lt!469396 () ListLongMap!14103)

(assert (=> b!1064835 (= lt!469395 lt!469396)))

(declare-datatypes ((Unit!34928 0))(
  ( (Unit!34929) )
))
(declare-fun lt!469394 () Unit!34928)

(declare-fun zeroValueAfter!47 () V!38963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!693 (array!67729 array!67727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38963 V!38963 V!38963 V!38963 (_ BitVec 32) Int) Unit!34928)

(assert (=> b!1064835 (= lt!469394 (lemmaNoChangeToArrayThenSameMapNoExtras!693 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3656 (array!67729 array!67727 (_ BitVec 32) (_ BitVec 32) V!38963 V!38963 (_ BitVec 32) Int) ListLongMap!14103)

(assert (=> b!1064835 (= lt!469396 (getCurrentListMapNoExtraKeys!3656 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064835 (= lt!469395 (getCurrentListMapNoExtraKeys!3656 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94160 res!710836) b!1064831))

(assert (= (and b!1064831 res!710835) b!1064833))

(assert (= (and b!1064833 res!710837) b!1064832))

(assert (= (and b!1064832 res!710833) b!1064835))

(assert (= (and b!1064835 (not res!710834)) b!1064828))

(assert (= (and b!1064829 condMapEmpty!39739) mapIsEmpty!39739))

(assert (= (and b!1064829 (not condMapEmpty!39739)) mapNonEmpty!39739))

(get-info :version)

(assert (= (and mapNonEmpty!39739 ((_ is ValueCellFull!11982) mapValue!39739)) b!1064830))

(assert (= (and b!1064829 ((_ is ValueCellFull!11982) mapDefault!39739)) b!1064834))

(assert (= start!94160 b!1064829))

(declare-fun m!983309 () Bool)

(assert (=> start!94160 m!983309))

(declare-fun m!983311 () Bool)

(assert (=> start!94160 m!983311))

(declare-fun m!983313 () Bool)

(assert (=> start!94160 m!983313))

(declare-fun m!983315 () Bool)

(assert (=> b!1064828 m!983315))

(declare-fun m!983317 () Bool)

(assert (=> mapNonEmpty!39739 m!983317))

(declare-fun m!983319 () Bool)

(assert (=> b!1064833 m!983319))

(declare-fun m!983321 () Bool)

(assert (=> b!1064832 m!983321))

(declare-fun m!983323 () Bool)

(assert (=> b!1064835 m!983323))

(declare-fun m!983325 () Bool)

(assert (=> b!1064835 m!983325))

(declare-fun m!983327 () Bool)

(assert (=> b!1064835 m!983327))

(check-sat (not b!1064835) tp_is_empty!25371 b_and!34311 (not b_next!21561) (not start!94160) (not mapNonEmpty!39739) (not b!1064832) (not b!1064833) (not b!1064828))
(check-sat b_and!34311 (not b_next!21561))
