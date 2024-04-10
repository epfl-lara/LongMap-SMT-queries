; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93922 () Bool)

(assert start!93922)

(declare-fun b_free!21381 () Bool)

(declare-fun b_next!21381 () Bool)

(assert (=> start!93922 (= b_free!21381 (not b_next!21381))))

(declare-fun tp!75569 () Bool)

(declare-fun b_and!34103 () Bool)

(assert (=> start!93922 (= tp!75569 b_and!34103)))

(declare-fun b!1062220 () Bool)

(declare-fun e!605021 () Bool)

(declare-fun tp_is_empty!25191 () Bool)

(assert (=> b!1062220 (= e!605021 tp_is_empty!25191)))

(declare-fun b!1062221 () Bool)

(declare-fun e!605022 () Bool)

(assert (=> b!1062221 (= e!605022 true)))

(declare-datatypes ((V!38723 0))(
  ( (V!38724 (val!12646 Int)) )
))
(declare-datatypes ((tuple2!15992 0))(
  ( (tuple2!15993 (_1!8007 (_ BitVec 64)) (_2!8007 V!38723)) )
))
(declare-datatypes ((List!22575 0))(
  ( (Nil!22572) (Cons!22571 (h!23780 tuple2!15992) (t!31886 List!22575)) )
))
(declare-datatypes ((ListLongMap!13961 0))(
  ( (ListLongMap!13962 (toList!6996 List!22575)) )
))
(declare-fun lt!467979 () ListLongMap!13961)

(declare-fun -!561 (ListLongMap!13961 (_ BitVec 64)) ListLongMap!13961)

(assert (=> b!1062221 (= (-!561 lt!467979 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467979)))

(declare-datatypes ((Unit!34792 0))(
  ( (Unit!34793) )
))
(declare-fun lt!467977 () Unit!34792)

(declare-fun removeNotPresentStillSame!8 (ListLongMap!13961 (_ BitVec 64)) Unit!34792)

(assert (=> b!1062221 (= lt!467977 (removeNotPresentStillSame!8 lt!467979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062222 () Bool)

(declare-fun e!605019 () Bool)

(assert (=> b!1062222 (= e!605019 e!605022)))

(declare-fun res!709281 () Bool)

(assert (=> b!1062222 (=> res!709281 e!605022)))

(declare-fun contains!6229 (ListLongMap!13961 (_ BitVec 64)) Bool)

(assert (=> b!1062222 (= res!709281 (contains!6229 lt!467979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38723)

(declare-datatypes ((ValueCell!11892 0))(
  ( (ValueCellFull!11892 (v!15256 V!38723)) (EmptyCell!11892) )
))
(declare-datatypes ((array!67385 0))(
  ( (array!67386 (arr!32399 (Array (_ BitVec 32) ValueCell!11892)) (size!32935 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67385)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38723)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67387 0))(
  ( (array!67388 (arr!32400 (Array (_ BitVec 32) (_ BitVec 64))) (size!32936 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67387)

(declare-fun getCurrentListMap!3982 (array!67387 array!67385 (_ BitVec 32) (_ BitVec 32) V!38723 V!38723 (_ BitVec 32) Int) ListLongMap!13961)

(assert (=> b!1062222 (= lt!467979 (getCurrentListMap!3982 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39460 () Bool)

(declare-fun mapRes!39460 () Bool)

(assert (=> mapIsEmpty!39460 mapRes!39460))

(declare-fun b!1062223 () Bool)

(declare-fun res!709282 () Bool)

(declare-fun e!605020 () Bool)

(assert (=> b!1062223 (=> (not res!709282) (not e!605020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67387 (_ BitVec 32)) Bool)

(assert (=> b!1062223 (= res!709282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062224 () Bool)

(assert (=> b!1062224 (= e!605020 (not e!605019))))

(declare-fun res!709286 () Bool)

(assert (=> b!1062224 (=> res!709286 e!605019)))

(assert (=> b!1062224 (= res!709286 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467981 () ListLongMap!13961)

(declare-fun lt!467980 () ListLongMap!13961)

(assert (=> b!1062224 (= lt!467981 lt!467980)))

(declare-fun lt!467978 () Unit!34792)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38723)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!632 (array!67387 array!67385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38723 V!38723 V!38723 V!38723 (_ BitVec 32) Int) Unit!34792)

(assert (=> b!1062224 (= lt!467978 (lemmaNoChangeToArrayThenSameMapNoExtras!632 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3595 (array!67387 array!67385 (_ BitVec 32) (_ BitVec 32) V!38723 V!38723 (_ BitVec 32) Int) ListLongMap!13961)

(assert (=> b!1062224 (= lt!467980 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062224 (= lt!467981 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062225 () Bool)

(declare-fun e!605017 () Bool)

(assert (=> b!1062225 (= e!605017 tp_is_empty!25191)))

(declare-fun b!1062226 () Bool)

(declare-fun res!709284 () Bool)

(assert (=> b!1062226 (=> (not res!709284) (not e!605020))))

(assert (=> b!1062226 (= res!709284 (and (= (size!32935 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32936 _keys!1163) (size!32935 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062227 () Bool)

(declare-fun res!709285 () Bool)

(assert (=> b!1062227 (=> (not res!709285) (not e!605020))))

(declare-datatypes ((List!22576 0))(
  ( (Nil!22573) (Cons!22572 (h!23781 (_ BitVec 64)) (t!31887 List!22576)) )
))
(declare-fun arrayNoDuplicates!0 (array!67387 (_ BitVec 32) List!22576) Bool)

(assert (=> b!1062227 (= res!709285 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22573))))

(declare-fun b!1062228 () Bool)

(declare-fun e!605023 () Bool)

(assert (=> b!1062228 (= e!605023 (and e!605017 mapRes!39460))))

(declare-fun condMapEmpty!39460 () Bool)

(declare-fun mapDefault!39460 () ValueCell!11892)

(assert (=> b!1062228 (= condMapEmpty!39460 (= (arr!32399 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11892)) mapDefault!39460)))))

(declare-fun mapNonEmpty!39460 () Bool)

(declare-fun tp!75568 () Bool)

(assert (=> mapNonEmpty!39460 (= mapRes!39460 (and tp!75568 e!605021))))

(declare-fun mapRest!39460 () (Array (_ BitVec 32) ValueCell!11892))

(declare-fun mapValue!39460 () ValueCell!11892)

(declare-fun mapKey!39460 () (_ BitVec 32))

(assert (=> mapNonEmpty!39460 (= (arr!32399 _values!955) (store mapRest!39460 mapKey!39460 mapValue!39460))))

(declare-fun res!709283 () Bool)

(assert (=> start!93922 (=> (not res!709283) (not e!605020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93922 (= res!709283 (validMask!0 mask!1515))))

(assert (=> start!93922 e!605020))

(assert (=> start!93922 true))

(assert (=> start!93922 tp_is_empty!25191))

(declare-fun array_inv!25100 (array!67385) Bool)

(assert (=> start!93922 (and (array_inv!25100 _values!955) e!605023)))

(assert (=> start!93922 tp!75569))

(declare-fun array_inv!25101 (array!67387) Bool)

(assert (=> start!93922 (array_inv!25101 _keys!1163)))

(assert (= (and start!93922 res!709283) b!1062226))

(assert (= (and b!1062226 res!709284) b!1062223))

(assert (= (and b!1062223 res!709282) b!1062227))

(assert (= (and b!1062227 res!709285) b!1062224))

(assert (= (and b!1062224 (not res!709286)) b!1062222))

(assert (= (and b!1062222 (not res!709281)) b!1062221))

(assert (= (and b!1062228 condMapEmpty!39460) mapIsEmpty!39460))

(assert (= (and b!1062228 (not condMapEmpty!39460)) mapNonEmpty!39460))

(get-info :version)

(assert (= (and mapNonEmpty!39460 ((_ is ValueCellFull!11892) mapValue!39460)) b!1062220))

(assert (= (and b!1062228 ((_ is ValueCellFull!11892) mapDefault!39460)) b!1062225))

(assert (= start!93922 b!1062228))

(declare-fun m!980981 () Bool)

(assert (=> b!1062227 m!980981))

(declare-fun m!980983 () Bool)

(assert (=> b!1062221 m!980983))

(declare-fun m!980985 () Bool)

(assert (=> b!1062221 m!980985))

(declare-fun m!980987 () Bool)

(assert (=> b!1062223 m!980987))

(declare-fun m!980989 () Bool)

(assert (=> mapNonEmpty!39460 m!980989))

(declare-fun m!980991 () Bool)

(assert (=> b!1062224 m!980991))

(declare-fun m!980993 () Bool)

(assert (=> b!1062224 m!980993))

(declare-fun m!980995 () Bool)

(assert (=> b!1062224 m!980995))

(declare-fun m!980997 () Bool)

(assert (=> start!93922 m!980997))

(declare-fun m!980999 () Bool)

(assert (=> start!93922 m!980999))

(declare-fun m!981001 () Bool)

(assert (=> start!93922 m!981001))

(declare-fun m!981003 () Bool)

(assert (=> b!1062222 m!981003))

(declare-fun m!981005 () Bool)

(assert (=> b!1062222 m!981005))

(check-sat tp_is_empty!25191 (not b!1062221) (not b!1062222) (not b_next!21381) (not b!1062227) (not mapNonEmpty!39460) (not b!1062224) (not start!93922) (not b!1062223) b_and!34103)
(check-sat b_and!34103 (not b_next!21381))
