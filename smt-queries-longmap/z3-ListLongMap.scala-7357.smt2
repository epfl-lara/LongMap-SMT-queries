; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94082 () Bool)

(assert start!94082)

(declare-fun b_free!21319 () Bool)

(declare-fun b_next!21319 () Bool)

(assert (=> start!94082 (= b_free!21319 (not b_next!21319))))

(declare-fun tp!75379 () Bool)

(declare-fun b_and!34043 () Bool)

(assert (=> start!94082 (= tp!75379 b_and!34043)))

(declare-fun b!1062738 () Bool)

(declare-fun e!605282 () Bool)

(declare-fun tp_is_empty!25129 () Bool)

(assert (=> b!1062738 (= e!605282 tp_is_empty!25129)))

(declare-fun b!1062739 () Bool)

(declare-fun res!709330 () Bool)

(declare-fun e!605283 () Bool)

(assert (=> b!1062739 (=> (not res!709330) (not e!605283))))

(declare-datatypes ((array!67311 0))(
  ( (array!67312 (arr!32357 (Array (_ BitVec 32) (_ BitVec 64))) (size!32894 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67311)

(declare-datatypes ((List!22518 0))(
  ( (Nil!22515) (Cons!22514 (h!23732 (_ BitVec 64)) (t!31819 List!22518)) )
))
(declare-fun arrayNoDuplicates!0 (array!67311 (_ BitVec 32) List!22518) Bool)

(assert (=> b!1062739 (= res!709330 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22515))))

(declare-fun b!1062740 () Bool)

(declare-fun e!605279 () Bool)

(declare-fun mapRes!39364 () Bool)

(assert (=> b!1062740 (= e!605279 (and e!605282 mapRes!39364))))

(declare-fun condMapEmpty!39364 () Bool)

(declare-datatypes ((V!38641 0))(
  ( (V!38642 (val!12615 Int)) )
))
(declare-datatypes ((ValueCell!11861 0))(
  ( (ValueCellFull!11861 (v!15221 V!38641)) (EmptyCell!11861) )
))
(declare-datatypes ((array!67313 0))(
  ( (array!67314 (arr!32358 (Array (_ BitVec 32) ValueCell!11861)) (size!32895 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67313)

(declare-fun mapDefault!39364 () ValueCell!11861)

(assert (=> b!1062740 (= condMapEmpty!39364 (= (arr!32358 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11861)) mapDefault!39364)))))

(declare-fun b!1062742 () Bool)

(declare-fun e!605281 () Bool)

(assert (=> b!1062742 (= e!605281 tp_is_empty!25129)))

(declare-fun mapNonEmpty!39364 () Bool)

(declare-fun tp!75380 () Bool)

(assert (=> mapNonEmpty!39364 (= mapRes!39364 (and tp!75380 e!605281))))

(declare-fun mapRest!39364 () (Array (_ BitVec 32) ValueCell!11861))

(declare-fun mapValue!39364 () ValueCell!11861)

(declare-fun mapKey!39364 () (_ BitVec 32))

(assert (=> mapNonEmpty!39364 (= (arr!32358 _values!955) (store mapRest!39364 mapKey!39364 mapValue!39364))))

(declare-fun b!1062743 () Bool)

(assert (=> b!1062743 (= e!605283 (not true))))

(declare-datatypes ((tuple2!15932 0))(
  ( (tuple2!15933 (_1!7977 (_ BitVec 64)) (_2!7977 V!38641)) )
))
(declare-datatypes ((List!22519 0))(
  ( (Nil!22516) (Cons!22515 (h!23733 tuple2!15932) (t!31820 List!22519)) )
))
(declare-datatypes ((ListLongMap!13909 0))(
  ( (ListLongMap!13910 (toList!6970 List!22519)) )
))
(declare-fun lt!468101 () ListLongMap!13909)

(declare-fun lt!468102 () ListLongMap!13909)

(assert (=> b!1062743 (= lt!468101 lt!468102)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38641)

(declare-fun minValue!907 () V!38641)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38641)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((Unit!34745 0))(
  ( (Unit!34746) )
))
(declare-fun lt!468100 () Unit!34745)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!621 (array!67311 array!67313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 V!38641 V!38641 (_ BitVec 32) Int) Unit!34745)

(assert (=> b!1062743 (= lt!468100 (lemmaNoChangeToArrayThenSameMapNoExtras!621 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3618 (array!67311 array!67313 (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 (_ BitVec 32) Int) ListLongMap!13909)

(assert (=> b!1062743 (= lt!468102 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062743 (= lt!468101 (getCurrentListMapNoExtraKeys!3618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062744 () Bool)

(declare-fun res!709328 () Bool)

(assert (=> b!1062744 (=> (not res!709328) (not e!605283))))

(assert (=> b!1062744 (= res!709328 (and (= (size!32895 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32894 _keys!1163) (size!32895 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39364 () Bool)

(assert (=> mapIsEmpty!39364 mapRes!39364))

(declare-fun b!1062741 () Bool)

(declare-fun res!709329 () Bool)

(assert (=> b!1062741 (=> (not res!709329) (not e!605283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67311 (_ BitVec 32)) Bool)

(assert (=> b!1062741 (= res!709329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709327 () Bool)

(assert (=> start!94082 (=> (not res!709327) (not e!605283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94082 (= res!709327 (validMask!0 mask!1515))))

(assert (=> start!94082 e!605283))

(assert (=> start!94082 true))

(assert (=> start!94082 tp_is_empty!25129))

(declare-fun array_inv!25088 (array!67313) Bool)

(assert (=> start!94082 (and (array_inv!25088 _values!955) e!605279)))

(assert (=> start!94082 tp!75379))

(declare-fun array_inv!25089 (array!67311) Bool)

(assert (=> start!94082 (array_inv!25089 _keys!1163)))

(assert (= (and start!94082 res!709327) b!1062744))

(assert (= (and b!1062744 res!709328) b!1062741))

(assert (= (and b!1062741 res!709329) b!1062739))

(assert (= (and b!1062739 res!709330) b!1062743))

(assert (= (and b!1062740 condMapEmpty!39364) mapIsEmpty!39364))

(assert (= (and b!1062740 (not condMapEmpty!39364)) mapNonEmpty!39364))

(get-info :version)

(assert (= (and mapNonEmpty!39364 ((_ is ValueCellFull!11861) mapValue!39364)) b!1062742))

(assert (= (and b!1062740 ((_ is ValueCellFull!11861) mapDefault!39364)) b!1062738))

(assert (= start!94082 b!1062740))

(declare-fun m!981937 () Bool)

(assert (=> start!94082 m!981937))

(declare-fun m!981939 () Bool)

(assert (=> start!94082 m!981939))

(declare-fun m!981941 () Bool)

(assert (=> start!94082 m!981941))

(declare-fun m!981943 () Bool)

(assert (=> b!1062741 m!981943))

(declare-fun m!981945 () Bool)

(assert (=> b!1062743 m!981945))

(declare-fun m!981947 () Bool)

(assert (=> b!1062743 m!981947))

(declare-fun m!981949 () Bool)

(assert (=> b!1062743 m!981949))

(declare-fun m!981951 () Bool)

(assert (=> mapNonEmpty!39364 m!981951))

(declare-fun m!981953 () Bool)

(assert (=> b!1062739 m!981953))

(check-sat (not b!1062741) tp_is_empty!25129 (not b!1062739) (not mapNonEmpty!39364) b_and!34043 (not start!94082) (not b!1062743) (not b_next!21319))
(check-sat b_and!34043 (not b_next!21319))
