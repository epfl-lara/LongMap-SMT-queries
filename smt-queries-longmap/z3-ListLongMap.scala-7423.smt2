; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94376 () Bool)

(assert start!94376)

(declare-fun b_free!21717 () Bool)

(declare-fun b_next!21717 () Bool)

(assert (=> start!94376 (= b_free!21717 (not b_next!21717))))

(declare-fun tp!76595 () Bool)

(declare-fun b_and!34501 () Bool)

(assert (=> start!94376 (= tp!76595 b_and!34501)))

(declare-fun b!1067184 () Bool)

(declare-fun e!608648 () Bool)

(declare-fun e!608647 () Bool)

(declare-fun mapRes!39982 () Bool)

(assert (=> b!1067184 (= e!608648 (and e!608647 mapRes!39982))))

(declare-fun condMapEmpty!39982 () Bool)

(declare-datatypes ((V!39171 0))(
  ( (V!39172 (val!12814 Int)) )
))
(declare-datatypes ((ValueCell!12060 0))(
  ( (ValueCellFull!12060 (v!15428 V!39171)) (EmptyCell!12060) )
))
(declare-datatypes ((array!68039 0))(
  ( (array!68040 (arr!32720 (Array (_ BitVec 32) ValueCell!12060)) (size!33256 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68039)

(declare-fun mapDefault!39982 () ValueCell!12060)

(assert (=> b!1067184 (= condMapEmpty!39982 (= (arr!32720 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12060)) mapDefault!39982)))))

(declare-fun mapIsEmpty!39982 () Bool)

(assert (=> mapIsEmpty!39982 mapRes!39982))

(declare-fun res!712193 () Bool)

(declare-fun e!608646 () Bool)

(assert (=> start!94376 (=> (not res!712193) (not e!608646))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94376 (= res!712193 (validMask!0 mask!1515))))

(assert (=> start!94376 e!608646))

(assert (=> start!94376 true))

(declare-fun tp_is_empty!25527 () Bool)

(assert (=> start!94376 tp_is_empty!25527))

(declare-fun array_inv!25332 (array!68039) Bool)

(assert (=> start!94376 (and (array_inv!25332 _values!955) e!608648)))

(assert (=> start!94376 tp!76595))

(declare-datatypes ((array!68041 0))(
  ( (array!68042 (arr!32721 (Array (_ BitVec 32) (_ BitVec 64))) (size!33257 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68041)

(declare-fun array_inv!25333 (array!68041) Bool)

(assert (=> start!94376 (array_inv!25333 _keys!1163)))

(declare-fun mapNonEmpty!39982 () Bool)

(declare-fun tp!76594 () Bool)

(declare-fun e!608645 () Bool)

(assert (=> mapNonEmpty!39982 (= mapRes!39982 (and tp!76594 e!608645))))

(declare-fun mapValue!39982 () ValueCell!12060)

(declare-fun mapKey!39982 () (_ BitVec 32))

(declare-fun mapRest!39982 () (Array (_ BitVec 32) ValueCell!12060))

(assert (=> mapNonEmpty!39982 (= (arr!32720 _values!955) (store mapRest!39982 mapKey!39982 mapValue!39982))))

(declare-fun b!1067185 () Bool)

(assert (=> b!1067185 (= e!608647 tp_is_empty!25527)))

(declare-fun b!1067186 () Bool)

(declare-fun res!712194 () Bool)

(assert (=> b!1067186 (=> (not res!712194) (not e!608646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68041 (_ BitVec 32)) Bool)

(assert (=> b!1067186 (= res!712194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067187 () Bool)

(declare-fun res!712195 () Bool)

(assert (=> b!1067187 (=> (not res!712195) (not e!608646))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067187 (= res!712195 (and (= (size!33256 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33257 _keys!1163) (size!33256 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067188 () Bool)

(assert (=> b!1067188 (= e!608646 (not true))))

(declare-datatypes ((tuple2!16260 0))(
  ( (tuple2!16261 (_1!8141 (_ BitVec 64)) (_2!8141 V!39171)) )
))
(declare-datatypes ((List!22818 0))(
  ( (Nil!22815) (Cons!22814 (h!24023 tuple2!16260) (t!32141 List!22818)) )
))
(declare-datatypes ((ListLongMap!14229 0))(
  ( (ListLongMap!14230 (toList!7130 List!22818)) )
))
(declare-fun lt!471338 () ListLongMap!14229)

(declare-fun lt!471339 () ListLongMap!14229)

(assert (=> b!1067188 (= lt!471338 lt!471339)))

(declare-fun zeroValueBefore!47 () V!39171)

(declare-datatypes ((Unit!35057 0))(
  ( (Unit!35058) )
))
(declare-fun lt!471337 () Unit!35057)

(declare-fun minValue!907 () V!39171)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39171)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!751 (array!68041 array!68039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39171 V!39171 V!39171 V!39171 (_ BitVec 32) Int) Unit!35057)

(assert (=> b!1067188 (= lt!471337 (lemmaNoChangeToArrayThenSameMapNoExtras!751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3714 (array!68041 array!68039 (_ BitVec 32) (_ BitVec 32) V!39171 V!39171 (_ BitVec 32) Int) ListLongMap!14229)

(assert (=> b!1067188 (= lt!471339 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067188 (= lt!471338 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067189 () Bool)

(assert (=> b!1067189 (= e!608645 tp_is_empty!25527)))

(declare-fun b!1067190 () Bool)

(declare-fun res!712196 () Bool)

(assert (=> b!1067190 (=> (not res!712196) (not e!608646))))

(declare-datatypes ((List!22819 0))(
  ( (Nil!22816) (Cons!22815 (h!24024 (_ BitVec 64)) (t!32142 List!22819)) )
))
(declare-fun arrayNoDuplicates!0 (array!68041 (_ BitVec 32) List!22819) Bool)

(assert (=> b!1067190 (= res!712196 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22816))))

(assert (= (and start!94376 res!712193) b!1067187))

(assert (= (and b!1067187 res!712195) b!1067186))

(assert (= (and b!1067186 res!712194) b!1067190))

(assert (= (and b!1067190 res!712196) b!1067188))

(assert (= (and b!1067184 condMapEmpty!39982) mapIsEmpty!39982))

(assert (= (and b!1067184 (not condMapEmpty!39982)) mapNonEmpty!39982))

(get-info :version)

(assert (= (and mapNonEmpty!39982 ((_ is ValueCellFull!12060) mapValue!39982)) b!1067189))

(assert (= (and b!1067184 ((_ is ValueCellFull!12060) mapDefault!39982)) b!1067185))

(assert (= start!94376 b!1067184))

(declare-fun m!985881 () Bool)

(assert (=> mapNonEmpty!39982 m!985881))

(declare-fun m!985883 () Bool)

(assert (=> start!94376 m!985883))

(declare-fun m!985885 () Bool)

(assert (=> start!94376 m!985885))

(declare-fun m!985887 () Bool)

(assert (=> start!94376 m!985887))

(declare-fun m!985889 () Bool)

(assert (=> b!1067188 m!985889))

(declare-fun m!985891 () Bool)

(assert (=> b!1067188 m!985891))

(declare-fun m!985893 () Bool)

(assert (=> b!1067188 m!985893))

(declare-fun m!985895 () Bool)

(assert (=> b!1067190 m!985895))

(declare-fun m!985897 () Bool)

(assert (=> b!1067186 m!985897))

(check-sat (not b!1067186) tp_is_empty!25527 (not mapNonEmpty!39982) (not b!1067190) b_and!34501 (not b!1067188) (not b_next!21717) (not start!94376))
(check-sat b_and!34501 (not b_next!21717))
