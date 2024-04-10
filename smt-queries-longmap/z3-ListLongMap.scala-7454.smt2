; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94620 () Bool)

(assert start!94620)

(declare-fun b_free!21903 () Bool)

(declare-fun b_next!21903 () Bool)

(assert (=> start!94620 (= b_free!21903 (not b_next!21903))))

(declare-fun tp!77161 () Bool)

(declare-fun b_and!34715 () Bool)

(assert (=> start!94620 (= tp!77161 b_and!34715)))

(declare-fun b!1069869 () Bool)

(declare-fun e!610632 () Bool)

(declare-fun e!610631 () Bool)

(declare-fun mapRes!40270 () Bool)

(assert (=> b!1069869 (= e!610632 (and e!610631 mapRes!40270))))

(declare-fun condMapEmpty!40270 () Bool)

(declare-datatypes ((V!39419 0))(
  ( (V!39420 (val!12907 Int)) )
))
(declare-datatypes ((ValueCell!12153 0))(
  ( (ValueCellFull!12153 (v!15523 V!39419)) (EmptyCell!12153) )
))
(declare-datatypes ((array!68403 0))(
  ( (array!68404 (arr!32899 (Array (_ BitVec 32) ValueCell!12153)) (size!33435 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68403)

(declare-fun mapDefault!40270 () ValueCell!12153)

(assert (=> b!1069869 (= condMapEmpty!40270 (= (arr!32899 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12153)) mapDefault!40270)))))

(declare-fun res!713798 () Bool)

(declare-fun e!610629 () Bool)

(assert (=> start!94620 (=> (not res!713798) (not e!610629))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94620 (= res!713798 (validMask!0 mask!1515))))

(assert (=> start!94620 e!610629))

(assert (=> start!94620 true))

(declare-fun tp_is_empty!25713 () Bool)

(assert (=> start!94620 tp_is_empty!25713))

(declare-fun array_inv!25454 (array!68403) Bool)

(assert (=> start!94620 (and (array_inv!25454 _values!955) e!610632)))

(assert (=> start!94620 tp!77161))

(declare-datatypes ((array!68405 0))(
  ( (array!68406 (arr!32900 (Array (_ BitVec 32) (_ BitVec 64))) (size!33436 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68405)

(declare-fun array_inv!25455 (array!68405) Bool)

(assert (=> start!94620 (array_inv!25455 _keys!1163)))

(declare-fun b!1069870 () Bool)

(declare-fun e!610630 () Bool)

(assert (=> b!1069870 (= e!610630 tp_is_empty!25713)))

(declare-fun mapIsEmpty!40270 () Bool)

(assert (=> mapIsEmpty!40270 mapRes!40270))

(declare-fun b!1069871 () Bool)

(assert (=> b!1069871 (= e!610629 (not true))))

(declare-datatypes ((tuple2!16406 0))(
  ( (tuple2!16407 (_1!8214 (_ BitVec 64)) (_2!8214 V!39419)) )
))
(declare-datatypes ((List!22950 0))(
  ( (Nil!22947) (Cons!22946 (h!24155 tuple2!16406) (t!32279 List!22950)) )
))
(declare-datatypes ((ListLongMap!14375 0))(
  ( (ListLongMap!14376 (toList!7203 List!22950)) )
))
(declare-fun lt!472796 () ListLongMap!14375)

(declare-fun lt!472797 () ListLongMap!14375)

(assert (=> b!1069871 (= lt!472796 lt!472797)))

(declare-datatypes ((Unit!35205 0))(
  ( (Unit!35206) )
))
(declare-fun lt!472795 () Unit!35205)

(declare-fun minValue!907 () V!39419)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39419)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39419)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!816 (array!68405 array!68403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39419 V!39419 V!39419 V!39419 (_ BitVec 32) Int) Unit!35205)

(assert (=> b!1069871 (= lt!472795 (lemmaNoChangeToArrayThenSameMapNoExtras!816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3779 (array!68405 array!68403 (_ BitVec 32) (_ BitVec 32) V!39419 V!39419 (_ BitVec 32) Int) ListLongMap!14375)

(assert (=> b!1069871 (= lt!472797 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069871 (= lt!472796 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069872 () Bool)

(declare-fun res!713797 () Bool)

(assert (=> b!1069872 (=> (not res!713797) (not e!610629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68405 (_ BitVec 32)) Bool)

(assert (=> b!1069872 (= res!713797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069873 () Bool)

(declare-fun res!713796 () Bool)

(assert (=> b!1069873 (=> (not res!713796) (not e!610629))))

(declare-datatypes ((List!22951 0))(
  ( (Nil!22948) (Cons!22947 (h!24156 (_ BitVec 64)) (t!32280 List!22951)) )
))
(declare-fun arrayNoDuplicates!0 (array!68405 (_ BitVec 32) List!22951) Bool)

(assert (=> b!1069873 (= res!713796 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22948))))

(declare-fun b!1069874 () Bool)

(assert (=> b!1069874 (= e!610631 tp_is_empty!25713)))

(declare-fun mapNonEmpty!40270 () Bool)

(declare-fun tp!77162 () Bool)

(assert (=> mapNonEmpty!40270 (= mapRes!40270 (and tp!77162 e!610630))))

(declare-fun mapValue!40270 () ValueCell!12153)

(declare-fun mapKey!40270 () (_ BitVec 32))

(declare-fun mapRest!40270 () (Array (_ BitVec 32) ValueCell!12153))

(assert (=> mapNonEmpty!40270 (= (arr!32899 _values!955) (store mapRest!40270 mapKey!40270 mapValue!40270))))

(declare-fun b!1069875 () Bool)

(declare-fun res!713795 () Bool)

(assert (=> b!1069875 (=> (not res!713795) (not e!610629))))

(assert (=> b!1069875 (= res!713795 (and (= (size!33435 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33436 _keys!1163) (size!33435 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94620 res!713798) b!1069875))

(assert (= (and b!1069875 res!713795) b!1069872))

(assert (= (and b!1069872 res!713797) b!1069873))

(assert (= (and b!1069873 res!713796) b!1069871))

(assert (= (and b!1069869 condMapEmpty!40270) mapIsEmpty!40270))

(assert (= (and b!1069869 (not condMapEmpty!40270)) mapNonEmpty!40270))

(get-info :version)

(assert (= (and mapNonEmpty!40270 ((_ is ValueCellFull!12153) mapValue!40270)) b!1069870))

(assert (= (and b!1069869 ((_ is ValueCellFull!12153) mapDefault!40270)) b!1069874))

(assert (= start!94620 b!1069869))

(declare-fun m!988317 () Bool)

(assert (=> b!1069871 m!988317))

(declare-fun m!988319 () Bool)

(assert (=> b!1069871 m!988319))

(declare-fun m!988321 () Bool)

(assert (=> b!1069871 m!988321))

(declare-fun m!988323 () Bool)

(assert (=> start!94620 m!988323))

(declare-fun m!988325 () Bool)

(assert (=> start!94620 m!988325))

(declare-fun m!988327 () Bool)

(assert (=> start!94620 m!988327))

(declare-fun m!988329 () Bool)

(assert (=> b!1069873 m!988329))

(declare-fun m!988331 () Bool)

(assert (=> mapNonEmpty!40270 m!988331))

(declare-fun m!988333 () Bool)

(assert (=> b!1069872 m!988333))

(check-sat tp_is_empty!25713 (not start!94620) (not b_next!21903) (not mapNonEmpty!40270) (not b!1069873) b_and!34715 (not b!1069871) (not b!1069872))
(check-sat b_and!34715 (not b_next!21903))
