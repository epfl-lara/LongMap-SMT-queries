; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94944 () Bool)

(assert start!94944)

(declare-fun b_free!22149 () Bool)

(declare-fun b_next!22149 () Bool)

(assert (=> start!94944 (= b_free!22149 (not b_next!22149))))

(declare-fun tp!77912 () Bool)

(declare-fun b_and!35003 () Bool)

(assert (=> start!94944 (= tp!77912 b_and!35003)))

(declare-fun mapNonEmpty!40651 () Bool)

(declare-fun mapRes!40651 () Bool)

(declare-fun tp!77911 () Bool)

(declare-fun e!613309 () Bool)

(assert (=> mapNonEmpty!40651 (= mapRes!40651 (and tp!77911 e!613309))))

(declare-datatypes ((V!39747 0))(
  ( (V!39748 (val!13030 Int)) )
))
(declare-datatypes ((ValueCell!12276 0))(
  ( (ValueCellFull!12276 (v!15648 V!39747)) (EmptyCell!12276) )
))
(declare-fun mapRest!40651 () (Array (_ BitVec 32) ValueCell!12276))

(declare-fun mapKey!40651 () (_ BitVec 32))

(declare-datatypes ((array!68879 0))(
  ( (array!68880 (arr!33133 (Array (_ BitVec 32) ValueCell!12276)) (size!33669 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68879)

(declare-fun mapValue!40651 () ValueCell!12276)

(assert (=> mapNonEmpty!40651 (= (arr!33133 _values!955) (store mapRest!40651 mapKey!40651 mapValue!40651))))

(declare-fun res!715984 () Bool)

(declare-fun e!613312 () Bool)

(assert (=> start!94944 (=> (not res!715984) (not e!613312))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94944 (= res!715984 (validMask!0 mask!1515))))

(assert (=> start!94944 e!613312))

(assert (=> start!94944 true))

(declare-fun tp_is_empty!25959 () Bool)

(assert (=> start!94944 tp_is_empty!25959))

(declare-fun e!613313 () Bool)

(declare-fun array_inv!25608 (array!68879) Bool)

(assert (=> start!94944 (and (array_inv!25608 _values!955) e!613313)))

(assert (=> start!94944 tp!77912))

(declare-datatypes ((array!68881 0))(
  ( (array!68882 (arr!33134 (Array (_ BitVec 32) (_ BitVec 64))) (size!33670 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68881)

(declare-fun array_inv!25609 (array!68881) Bool)

(assert (=> start!94944 (array_inv!25609 _keys!1163)))

(declare-fun b!1073510 () Bool)

(declare-fun res!715983 () Bool)

(assert (=> b!1073510 (=> (not res!715983) (not e!613312))))

(declare-datatypes ((List!23130 0))(
  ( (Nil!23127) (Cons!23126 (h!24335 (_ BitVec 64)) (t!32467 List!23130)) )
))
(declare-fun arrayNoDuplicates!0 (array!68881 (_ BitVec 32) List!23130) Bool)

(assert (=> b!1073510 (= res!715983 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23127))))

(declare-fun b!1073511 () Bool)

(declare-fun res!715981 () Bool)

(assert (=> b!1073511 (=> (not res!715981) (not e!613312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68881 (_ BitVec 32)) Bool)

(assert (=> b!1073511 (= res!715981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073512 () Bool)

(assert (=> b!1073512 (= e!613312 false)))

(declare-fun minValue!907 () V!39747)

(declare-datatypes ((tuple2!16592 0))(
  ( (tuple2!16593 (_1!8307 (_ BitVec 64)) (_2!8307 V!39747)) )
))
(declare-datatypes ((List!23131 0))(
  ( (Nil!23128) (Cons!23127 (h!24336 tuple2!16592) (t!32468 List!23131)) )
))
(declare-datatypes ((ListLongMap!14561 0))(
  ( (ListLongMap!14562 (toList!7296 List!23131)) )
))
(declare-fun lt!476068 () ListLongMap!14561)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39747)

(declare-fun getCurrentListMapNoExtraKeys!3860 (array!68881 array!68879 (_ BitVec 32) (_ BitVec 32) V!39747 V!39747 (_ BitVec 32) Int) ListLongMap!14561)

(assert (=> b!1073512 (= lt!476068 (getCurrentListMapNoExtraKeys!3860 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39747)

(declare-fun lt!476067 () ListLongMap!14561)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073512 (= lt!476067 (getCurrentListMapNoExtraKeys!3860 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073513 () Bool)

(declare-fun e!613311 () Bool)

(assert (=> b!1073513 (= e!613313 (and e!613311 mapRes!40651))))

(declare-fun condMapEmpty!40651 () Bool)

(declare-fun mapDefault!40651 () ValueCell!12276)

(assert (=> b!1073513 (= condMapEmpty!40651 (= (arr!33133 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12276)) mapDefault!40651)))))

(declare-fun b!1073514 () Bool)

(assert (=> b!1073514 (= e!613311 tp_is_empty!25959)))

(declare-fun b!1073515 () Bool)

(assert (=> b!1073515 (= e!613309 tp_is_empty!25959)))

(declare-fun b!1073516 () Bool)

(declare-fun res!715982 () Bool)

(assert (=> b!1073516 (=> (not res!715982) (not e!613312))))

(assert (=> b!1073516 (= res!715982 (and (= (size!33669 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33670 _keys!1163) (size!33669 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40651 () Bool)

(assert (=> mapIsEmpty!40651 mapRes!40651))

(assert (= (and start!94944 res!715984) b!1073516))

(assert (= (and b!1073516 res!715982) b!1073511))

(assert (= (and b!1073511 res!715981) b!1073510))

(assert (= (and b!1073510 res!715983) b!1073512))

(assert (= (and b!1073513 condMapEmpty!40651) mapIsEmpty!40651))

(assert (= (and b!1073513 (not condMapEmpty!40651)) mapNonEmpty!40651))

(get-info :version)

(assert (= (and mapNonEmpty!40651 ((_ is ValueCellFull!12276) mapValue!40651)) b!1073515))

(assert (= (and b!1073513 ((_ is ValueCellFull!12276) mapDefault!40651)) b!1073514))

(assert (= start!94944 b!1073513))

(declare-fun m!992479 () Bool)

(assert (=> mapNonEmpty!40651 m!992479))

(declare-fun m!992481 () Bool)

(assert (=> b!1073510 m!992481))

(declare-fun m!992483 () Bool)

(assert (=> b!1073512 m!992483))

(declare-fun m!992485 () Bool)

(assert (=> b!1073512 m!992485))

(declare-fun m!992487 () Bool)

(assert (=> start!94944 m!992487))

(declare-fun m!992489 () Bool)

(assert (=> start!94944 m!992489))

(declare-fun m!992491 () Bool)

(assert (=> start!94944 m!992491))

(declare-fun m!992493 () Bool)

(assert (=> b!1073511 m!992493))

(check-sat (not mapNonEmpty!40651) (not b!1073510) (not b!1073511) (not b_next!22149) b_and!35003 tp_is_empty!25959 (not b!1073512) (not start!94944))
(check-sat b_and!35003 (not b_next!22149))
