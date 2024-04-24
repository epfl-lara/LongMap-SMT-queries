; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94226 () Bool)

(assert start!94226)

(declare-fun b_free!21427 () Bool)

(declare-fun b_next!21427 () Bool)

(assert (=> start!94226 (= b_free!21427 (not b_next!21427))))

(declare-fun tp!75710 () Bool)

(declare-fun b_and!34169 () Bool)

(assert (=> start!94226 (= tp!75710 b_and!34169)))

(declare-fun b!1064325 () Bool)

(declare-fun e!606455 () Bool)

(assert (=> b!1064325 (= e!606455 true)))

(declare-datatypes ((V!38785 0))(
  ( (V!38786 (val!12669 Int)) )
))
(declare-datatypes ((tuple2!16016 0))(
  ( (tuple2!16017 (_1!8019 (_ BitVec 64)) (_2!8019 V!38785)) )
))
(declare-datatypes ((List!22594 0))(
  ( (Nil!22591) (Cons!22590 (h!23808 tuple2!16016) (t!31899 List!22594)) )
))
(declare-datatypes ((ListLongMap!13993 0))(
  ( (ListLongMap!13994 (toList!7012 List!22594)) )
))
(declare-fun lt!468963 () ListLongMap!13993)

(declare-fun -!574 (ListLongMap!13993 (_ BitVec 64)) ListLongMap!13993)

(assert (=> b!1064325 (= (-!574 lt!468963 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468963)))

(declare-datatypes ((Unit!34827 0))(
  ( (Unit!34828) )
))
(declare-fun lt!468964 () Unit!34827)

(declare-fun removeNotPresentStillSame!25 (ListLongMap!13993 (_ BitVec 64)) Unit!34827)

(assert (=> b!1064325 (= lt!468964 (removeNotPresentStillSame!25 lt!468963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064327 () Bool)

(declare-fun e!606458 () Bool)

(declare-fun tp_is_empty!25237 () Bool)

(assert (=> b!1064327 (= e!606458 tp_is_empty!25237)))

(declare-fun b!1064328 () Bool)

(declare-fun e!606457 () Bool)

(assert (=> b!1064328 (= e!606457 e!606455)))

(declare-fun res!710282 () Bool)

(assert (=> b!1064328 (=> res!710282 e!606455)))

(declare-fun contains!6266 (ListLongMap!13993 (_ BitVec 64)) Bool)

(assert (=> b!1064328 (= res!710282 (contains!6266 lt!468963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38785)

(declare-datatypes ((ValueCell!11915 0))(
  ( (ValueCellFull!11915 (v!15276 V!38785)) (EmptyCell!11915) )
))
(declare-datatypes ((array!67517 0))(
  ( (array!67518 (arr!32458 (Array (_ BitVec 32) ValueCell!11915)) (size!32995 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67517)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38785)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67519 0))(
  ( (array!67520 (arr!32459 (Array (_ BitVec 32) (_ BitVec 64))) (size!32996 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67519)

(declare-fun getCurrentListMap!3991 (array!67519 array!67517 (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 (_ BitVec 32) Int) ListLongMap!13993)

(assert (=> b!1064328 (= lt!468963 (getCurrentListMap!3991 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064329 () Bool)

(declare-fun res!710280 () Bool)

(declare-fun e!606456 () Bool)

(assert (=> b!1064329 (=> (not res!710280) (not e!606456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67519 (_ BitVec 32)) Bool)

(assert (=> b!1064329 (= res!710280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39532 () Bool)

(declare-fun mapRes!39532 () Bool)

(assert (=> mapIsEmpty!39532 mapRes!39532))

(declare-fun b!1064330 () Bool)

(declare-fun res!710279 () Bool)

(assert (=> b!1064330 (=> (not res!710279) (not e!606456))))

(declare-datatypes ((List!22595 0))(
  ( (Nil!22592) (Cons!22591 (h!23809 (_ BitVec 64)) (t!31900 List!22595)) )
))
(declare-fun arrayNoDuplicates!0 (array!67519 (_ BitVec 32) List!22595) Bool)

(assert (=> b!1064330 (= res!710279 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22592))))

(declare-fun b!1064331 () Bool)

(declare-fun e!606459 () Bool)

(assert (=> b!1064331 (= e!606459 (and e!606458 mapRes!39532))))

(declare-fun condMapEmpty!39532 () Bool)

(declare-fun mapDefault!39532 () ValueCell!11915)

(assert (=> b!1064331 (= condMapEmpty!39532 (= (arr!32458 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11915)) mapDefault!39532)))))

(declare-fun mapNonEmpty!39532 () Bool)

(declare-fun tp!75709 () Bool)

(declare-fun e!606461 () Bool)

(assert (=> mapNonEmpty!39532 (= mapRes!39532 (and tp!75709 e!606461))))

(declare-fun mapKey!39532 () (_ BitVec 32))

(declare-fun mapRest!39532 () (Array (_ BitVec 32) ValueCell!11915))

(declare-fun mapValue!39532 () ValueCell!11915)

(assert (=> mapNonEmpty!39532 (= (arr!32458 _values!955) (store mapRest!39532 mapKey!39532 mapValue!39532))))

(declare-fun res!710281 () Bool)

(assert (=> start!94226 (=> (not res!710281) (not e!606456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94226 (= res!710281 (validMask!0 mask!1515))))

(assert (=> start!94226 e!606456))

(assert (=> start!94226 true))

(assert (=> start!94226 tp_is_empty!25237))

(declare-fun array_inv!25162 (array!67517) Bool)

(assert (=> start!94226 (and (array_inv!25162 _values!955) e!606459)))

(assert (=> start!94226 tp!75710))

(declare-fun array_inv!25163 (array!67519) Bool)

(assert (=> start!94226 (array_inv!25163 _keys!1163)))

(declare-fun b!1064326 () Bool)

(assert (=> b!1064326 (= e!606461 tp_is_empty!25237)))

(declare-fun b!1064332 () Bool)

(assert (=> b!1064332 (= e!606456 (not e!606457))))

(declare-fun res!710278 () Bool)

(assert (=> b!1064332 (=> res!710278 e!606457)))

(assert (=> b!1064332 (= res!710278 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468962 () ListLongMap!13993)

(declare-fun lt!468965 () ListLongMap!13993)

(assert (=> b!1064332 (= lt!468962 lt!468965)))

(declare-fun lt!468961 () Unit!34827)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38785)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!655 (array!67519 array!67517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 V!38785 V!38785 (_ BitVec 32) Int) Unit!34827)

(assert (=> b!1064332 (= lt!468961 (lemmaNoChangeToArrayThenSameMapNoExtras!655 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3652 (array!67519 array!67517 (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 (_ BitVec 32) Int) ListLongMap!13993)

(assert (=> b!1064332 (= lt!468965 (getCurrentListMapNoExtraKeys!3652 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064332 (= lt!468962 (getCurrentListMapNoExtraKeys!3652 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064333 () Bool)

(declare-fun res!710283 () Bool)

(assert (=> b!1064333 (=> (not res!710283) (not e!606456))))

(assert (=> b!1064333 (= res!710283 (and (= (size!32995 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32996 _keys!1163) (size!32995 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94226 res!710281) b!1064333))

(assert (= (and b!1064333 res!710283) b!1064329))

(assert (= (and b!1064329 res!710280) b!1064330))

(assert (= (and b!1064330 res!710279) b!1064332))

(assert (= (and b!1064332 (not res!710278)) b!1064328))

(assert (= (and b!1064328 (not res!710282)) b!1064325))

(assert (= (and b!1064331 condMapEmpty!39532) mapIsEmpty!39532))

(assert (= (and b!1064331 (not condMapEmpty!39532)) mapNonEmpty!39532))

(get-info :version)

(assert (= (and mapNonEmpty!39532 ((_ is ValueCellFull!11915) mapValue!39532)) b!1064326))

(assert (= (and b!1064331 ((_ is ValueCellFull!11915) mapDefault!39532)) b!1064327))

(assert (= start!94226 b!1064331))

(declare-fun m!983377 () Bool)

(assert (=> b!1064329 m!983377))

(declare-fun m!983379 () Bool)

(assert (=> b!1064325 m!983379))

(declare-fun m!983381 () Bool)

(assert (=> b!1064325 m!983381))

(declare-fun m!983383 () Bool)

(assert (=> start!94226 m!983383))

(declare-fun m!983385 () Bool)

(assert (=> start!94226 m!983385))

(declare-fun m!983387 () Bool)

(assert (=> start!94226 m!983387))

(declare-fun m!983389 () Bool)

(assert (=> b!1064332 m!983389))

(declare-fun m!983391 () Bool)

(assert (=> b!1064332 m!983391))

(declare-fun m!983393 () Bool)

(assert (=> b!1064332 m!983393))

(declare-fun m!983395 () Bool)

(assert (=> b!1064328 m!983395))

(declare-fun m!983397 () Bool)

(assert (=> b!1064328 m!983397))

(declare-fun m!983399 () Bool)

(assert (=> mapNonEmpty!39532 m!983399))

(declare-fun m!983401 () Bool)

(assert (=> b!1064330 m!983401))

(check-sat (not b_next!21427) (not mapNonEmpty!39532) (not b!1064329) (not start!94226) (not b!1064332) tp_is_empty!25237 (not b!1064328) b_and!34169 (not b!1064325) (not b!1064330))
(check-sat b_and!34169 (not b_next!21427))
