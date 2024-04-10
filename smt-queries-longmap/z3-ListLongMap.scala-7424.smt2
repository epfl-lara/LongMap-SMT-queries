; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94382 () Bool)

(assert start!94382)

(declare-fun b_free!21723 () Bool)

(declare-fun b_next!21723 () Bool)

(assert (=> start!94382 (= b_free!21723 (not b_next!21723))))

(declare-fun tp!76612 () Bool)

(declare-fun b_and!34507 () Bool)

(assert (=> start!94382 (= tp!76612 b_and!34507)))

(declare-fun b!1067247 () Bool)

(declare-fun res!712230 () Bool)

(declare-fun e!608692 () Bool)

(assert (=> b!1067247 (=> (not res!712230) (not e!608692))))

(declare-datatypes ((array!68049 0))(
  ( (array!68050 (arr!32725 (Array (_ BitVec 32) (_ BitVec 64))) (size!33261 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68049)

(declare-datatypes ((List!22820 0))(
  ( (Nil!22817) (Cons!22816 (h!24025 (_ BitVec 64)) (t!32143 List!22820)) )
))
(declare-fun arrayNoDuplicates!0 (array!68049 (_ BitVec 32) List!22820) Bool)

(assert (=> b!1067247 (= res!712230 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22817))))

(declare-fun b!1067248 () Bool)

(assert (=> b!1067248 (= e!608692 (not true))))

(declare-datatypes ((V!39179 0))(
  ( (V!39180 (val!12817 Int)) )
))
(declare-datatypes ((tuple2!16262 0))(
  ( (tuple2!16263 (_1!8142 (_ BitVec 64)) (_2!8142 V!39179)) )
))
(declare-datatypes ((List!22821 0))(
  ( (Nil!22818) (Cons!22817 (h!24026 tuple2!16262) (t!32144 List!22821)) )
))
(declare-datatypes ((ListLongMap!14231 0))(
  ( (ListLongMap!14232 (toList!7131 List!22821)) )
))
(declare-fun lt!471366 () ListLongMap!14231)

(declare-fun lt!471364 () ListLongMap!14231)

(assert (=> b!1067248 (= lt!471366 lt!471364)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39179)

(declare-datatypes ((ValueCell!12063 0))(
  ( (ValueCellFull!12063 (v!15431 V!39179)) (EmptyCell!12063) )
))
(declare-datatypes ((array!68051 0))(
  ( (array!68052 (arr!32726 (Array (_ BitVec 32) ValueCell!12063)) (size!33262 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68051)

(declare-fun minValue!907 () V!39179)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39179)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((Unit!35059 0))(
  ( (Unit!35060) )
))
(declare-fun lt!471365 () Unit!35059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!752 (array!68049 array!68051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39179 V!39179 V!39179 V!39179 (_ BitVec 32) Int) Unit!35059)

(assert (=> b!1067248 (= lt!471365 (lemmaNoChangeToArrayThenSameMapNoExtras!752 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3715 (array!68049 array!68051 (_ BitVec 32) (_ BitVec 32) V!39179 V!39179 (_ BitVec 32) Int) ListLongMap!14231)

(assert (=> b!1067248 (= lt!471364 (getCurrentListMapNoExtraKeys!3715 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067248 (= lt!471366 (getCurrentListMapNoExtraKeys!3715 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067249 () Bool)

(declare-fun res!712231 () Bool)

(assert (=> b!1067249 (=> (not res!712231) (not e!608692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68049 (_ BitVec 32)) Bool)

(assert (=> b!1067249 (= res!712231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39991 () Bool)

(declare-fun mapRes!39991 () Bool)

(declare-fun tp!76613 () Bool)

(declare-fun e!608690 () Bool)

(assert (=> mapNonEmpty!39991 (= mapRes!39991 (and tp!76613 e!608690))))

(declare-fun mapRest!39991 () (Array (_ BitVec 32) ValueCell!12063))

(declare-fun mapKey!39991 () (_ BitVec 32))

(declare-fun mapValue!39991 () ValueCell!12063)

(assert (=> mapNonEmpty!39991 (= (arr!32726 _values!955) (store mapRest!39991 mapKey!39991 mapValue!39991))))

(declare-fun b!1067250 () Bool)

(declare-fun e!608693 () Bool)

(declare-fun e!608691 () Bool)

(assert (=> b!1067250 (= e!608693 (and e!608691 mapRes!39991))))

(declare-fun condMapEmpty!39991 () Bool)

(declare-fun mapDefault!39991 () ValueCell!12063)

(assert (=> b!1067250 (= condMapEmpty!39991 (= (arr!32726 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12063)) mapDefault!39991)))))

(declare-fun mapIsEmpty!39991 () Bool)

(assert (=> mapIsEmpty!39991 mapRes!39991))

(declare-fun b!1067251 () Bool)

(declare-fun tp_is_empty!25533 () Bool)

(assert (=> b!1067251 (= e!608691 tp_is_empty!25533)))

(declare-fun res!712229 () Bool)

(assert (=> start!94382 (=> (not res!712229) (not e!608692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94382 (= res!712229 (validMask!0 mask!1515))))

(assert (=> start!94382 e!608692))

(assert (=> start!94382 true))

(assert (=> start!94382 tp_is_empty!25533))

(declare-fun array_inv!25334 (array!68051) Bool)

(assert (=> start!94382 (and (array_inv!25334 _values!955) e!608693)))

(assert (=> start!94382 tp!76612))

(declare-fun array_inv!25335 (array!68049) Bool)

(assert (=> start!94382 (array_inv!25335 _keys!1163)))

(declare-fun b!1067252 () Bool)

(declare-fun res!712232 () Bool)

(assert (=> b!1067252 (=> (not res!712232) (not e!608692))))

(assert (=> b!1067252 (= res!712232 (and (= (size!33262 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33261 _keys!1163) (size!33262 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067253 () Bool)

(assert (=> b!1067253 (= e!608690 tp_is_empty!25533)))

(assert (= (and start!94382 res!712229) b!1067252))

(assert (= (and b!1067252 res!712232) b!1067249))

(assert (= (and b!1067249 res!712231) b!1067247))

(assert (= (and b!1067247 res!712230) b!1067248))

(assert (= (and b!1067250 condMapEmpty!39991) mapIsEmpty!39991))

(assert (= (and b!1067250 (not condMapEmpty!39991)) mapNonEmpty!39991))

(get-info :version)

(assert (= (and mapNonEmpty!39991 ((_ is ValueCellFull!12063) mapValue!39991)) b!1067253))

(assert (= (and b!1067250 ((_ is ValueCellFull!12063) mapDefault!39991)) b!1067251))

(assert (= start!94382 b!1067250))

(declare-fun m!985935 () Bool)

(assert (=> b!1067249 m!985935))

(declare-fun m!985937 () Bool)

(assert (=> mapNonEmpty!39991 m!985937))

(declare-fun m!985939 () Bool)

(assert (=> b!1067247 m!985939))

(declare-fun m!985941 () Bool)

(assert (=> b!1067248 m!985941))

(declare-fun m!985943 () Bool)

(assert (=> b!1067248 m!985943))

(declare-fun m!985945 () Bool)

(assert (=> b!1067248 m!985945))

(declare-fun m!985947 () Bool)

(assert (=> start!94382 m!985947))

(declare-fun m!985949 () Bool)

(assert (=> start!94382 m!985949))

(declare-fun m!985951 () Bool)

(assert (=> start!94382 m!985951))

(check-sat (not start!94382) (not b!1067248) (not b!1067249) (not b!1067247) tp_is_empty!25533 b_and!34507 (not b_next!21723) (not mapNonEmpty!39991))
(check-sat b_and!34507 (not b_next!21723))
