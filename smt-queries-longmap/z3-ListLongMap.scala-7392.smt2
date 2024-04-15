; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94122 () Bool)

(assert start!94122)

(declare-fun b_free!21529 () Bool)

(declare-fun b_next!21529 () Bool)

(assert (=> start!94122 (= b_free!21529 (not b_next!21529))))

(declare-fun tp!76021 () Bool)

(declare-fun b_and!34253 () Bool)

(assert (=> start!94122 (= tp!76021 b_and!34253)))

(declare-fun b!1064291 () Bool)

(declare-fun e!606560 () Bool)

(declare-fun tp_is_empty!25339 () Bool)

(assert (=> b!1064291 (= e!606560 tp_is_empty!25339)))

(declare-fun mapNonEmpty!39691 () Bool)

(declare-fun mapRes!39691 () Bool)

(declare-fun tp!76022 () Bool)

(declare-fun e!606563 () Bool)

(assert (=> mapNonEmpty!39691 (= mapRes!39691 (and tp!76022 e!606563))))

(declare-datatypes ((V!38921 0))(
  ( (V!38922 (val!12720 Int)) )
))
(declare-datatypes ((ValueCell!11966 0))(
  ( (ValueCellFull!11966 (v!15331 V!38921)) (EmptyCell!11966) )
))
(declare-datatypes ((array!67612 0))(
  ( (array!67613 (arr!32510 (Array (_ BitVec 32) ValueCell!11966)) (size!33048 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67612)

(declare-fun mapKey!39691 () (_ BitVec 32))

(declare-fun mapRest!39691 () (Array (_ BitVec 32) ValueCell!11966))

(declare-fun mapValue!39691 () ValueCell!11966)

(assert (=> mapNonEmpty!39691 (= (arr!32510 _values!955) (store mapRest!39691 mapKey!39691 mapValue!39691))))

(declare-fun res!710526 () Bool)

(declare-fun e!606561 () Bool)

(assert (=> start!94122 (=> (not res!710526) (not e!606561))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94122 (= res!710526 (validMask!0 mask!1515))))

(assert (=> start!94122 e!606561))

(assert (=> start!94122 true))

(assert (=> start!94122 tp_is_empty!25339))

(declare-fun e!606565 () Bool)

(declare-fun array_inv!25180 (array!67612) Bool)

(assert (=> start!94122 (and (array_inv!25180 _values!955) e!606565)))

(assert (=> start!94122 tp!76021))

(declare-datatypes ((array!67614 0))(
  ( (array!67615 (arr!32511 (Array (_ BitVec 32) (_ BitVec 64))) (size!33049 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67614)

(declare-fun array_inv!25181 (array!67614) Bool)

(assert (=> start!94122 (array_inv!25181 _keys!1163)))

(declare-fun mapIsEmpty!39691 () Bool)

(assert (=> mapIsEmpty!39691 mapRes!39691))

(declare-fun b!1064292 () Bool)

(assert (=> b!1064292 (= e!606563 tp_is_empty!25339)))

(declare-fun b!1064293 () Bool)

(declare-fun res!710527 () Bool)

(assert (=> b!1064293 (=> (not res!710527) (not e!606561))))

(declare-datatypes ((List!22719 0))(
  ( (Nil!22716) (Cons!22715 (h!23924 (_ BitVec 64)) (t!32027 List!22719)) )
))
(declare-fun arrayNoDuplicates!0 (array!67614 (_ BitVec 32) List!22719) Bool)

(assert (=> b!1064293 (= res!710527 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22716))))

(declare-fun b!1064294 () Bool)

(declare-fun res!710528 () Bool)

(assert (=> b!1064294 (=> (not res!710528) (not e!606561))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064294 (= res!710528 (and (= (size!33048 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33049 _keys!1163) (size!33048 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064295 () Bool)

(declare-fun e!606564 () Bool)

(assert (=> b!1064295 (= e!606561 (not e!606564))))

(declare-fun res!710524 () Bool)

(assert (=> b!1064295 (=> res!710524 e!606564)))

(assert (=> b!1064295 (= res!710524 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16170 0))(
  ( (tuple2!16171 (_1!8096 (_ BitVec 64)) (_2!8096 V!38921)) )
))
(declare-datatypes ((List!22720 0))(
  ( (Nil!22717) (Cons!22716 (h!23925 tuple2!16170) (t!32028 List!22720)) )
))
(declare-datatypes ((ListLongMap!14139 0))(
  ( (ListLongMap!14140 (toList!7085 List!22720)) )
))
(declare-fun lt!469005 () ListLongMap!14139)

(declare-fun lt!469002 () ListLongMap!14139)

(assert (=> b!1064295 (= lt!469005 lt!469002)))

(declare-fun zeroValueBefore!47 () V!38921)

(declare-datatypes ((Unit!34761 0))(
  ( (Unit!34762) )
))
(declare-fun lt!469004 () Unit!34761)

(declare-fun minValue!907 () V!38921)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38921)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!685 (array!67614 array!67612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 V!38921 V!38921 (_ BitVec 32) Int) Unit!34761)

(assert (=> b!1064295 (= lt!469004 (lemmaNoChangeToArrayThenSameMapNoExtras!685 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3691 (array!67614 array!67612 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1064295 (= lt!469002 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064295 (= lt!469005 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064296 () Bool)

(assert (=> b!1064296 (= e!606564 true)))

(declare-fun lt!469003 () ListLongMap!14139)

(declare-fun getCurrentListMap!3965 (array!67614 array!67612 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1064296 (= lt!469003 (getCurrentListMap!3965 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064297 () Bool)

(declare-fun res!710525 () Bool)

(assert (=> b!1064297 (=> (not res!710525) (not e!606561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67614 (_ BitVec 32)) Bool)

(assert (=> b!1064297 (= res!710525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064298 () Bool)

(assert (=> b!1064298 (= e!606565 (and e!606560 mapRes!39691))))

(declare-fun condMapEmpty!39691 () Bool)

(declare-fun mapDefault!39691 () ValueCell!11966)

(assert (=> b!1064298 (= condMapEmpty!39691 (= (arr!32510 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11966)) mapDefault!39691)))))

(assert (= (and start!94122 res!710526) b!1064294))

(assert (= (and b!1064294 res!710528) b!1064297))

(assert (= (and b!1064297 res!710525) b!1064293))

(assert (= (and b!1064293 res!710527) b!1064295))

(assert (= (and b!1064295 (not res!710524)) b!1064296))

(assert (= (and b!1064298 condMapEmpty!39691) mapIsEmpty!39691))

(assert (= (and b!1064298 (not condMapEmpty!39691)) mapNonEmpty!39691))

(get-info :version)

(assert (= (and mapNonEmpty!39691 ((_ is ValueCellFull!11966) mapValue!39691)) b!1064292))

(assert (= (and b!1064298 ((_ is ValueCellFull!11966) mapDefault!39691)) b!1064291))

(assert (= start!94122 b!1064298))

(declare-fun m!982363 () Bool)

(assert (=> b!1064295 m!982363))

(declare-fun m!982365 () Bool)

(assert (=> b!1064295 m!982365))

(declare-fun m!982367 () Bool)

(assert (=> b!1064295 m!982367))

(declare-fun m!982369 () Bool)

(assert (=> start!94122 m!982369))

(declare-fun m!982371 () Bool)

(assert (=> start!94122 m!982371))

(declare-fun m!982373 () Bool)

(assert (=> start!94122 m!982373))

(declare-fun m!982375 () Bool)

(assert (=> b!1064297 m!982375))

(declare-fun m!982377 () Bool)

(assert (=> mapNonEmpty!39691 m!982377))

(declare-fun m!982379 () Bool)

(assert (=> b!1064296 m!982379))

(declare-fun m!982381 () Bool)

(assert (=> b!1064293 m!982381))

(check-sat (not b!1064297) (not b!1064293) (not start!94122) (not b_next!21529) tp_is_empty!25339 b_and!34253 (not b!1064295) (not b!1064296) (not mapNonEmpty!39691))
(check-sat b_and!34253 (not b_next!21529))
