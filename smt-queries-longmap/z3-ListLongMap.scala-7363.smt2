; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93898 () Bool)

(assert start!93898)

(declare-fun b_free!21357 () Bool)

(declare-fun b_next!21357 () Bool)

(assert (=> start!93898 (= b_free!21357 (not b_next!21357))))

(declare-fun tp!75496 () Bool)

(declare-fun b_and!34079 () Bool)

(assert (=> start!93898 (= tp!75496 b_and!34079)))

(declare-fun b!1061900 () Bool)

(declare-fun res!709072 () Bool)

(declare-fun e!604774 () Bool)

(assert (=> b!1061900 (=> (not res!709072) (not e!604774))))

(declare-datatypes ((array!67339 0))(
  ( (array!67340 (arr!32376 (Array (_ BitVec 32) (_ BitVec 64))) (size!32912 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67339)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67339 (_ BitVec 32)) Bool)

(assert (=> b!1061900 (= res!709072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709073 () Bool)

(assert (=> start!93898 (=> (not res!709073) (not e!604774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93898 (= res!709073 (validMask!0 mask!1515))))

(assert (=> start!93898 e!604774))

(assert (=> start!93898 true))

(declare-fun tp_is_empty!25167 () Bool)

(assert (=> start!93898 tp_is_empty!25167))

(declare-datatypes ((V!38691 0))(
  ( (V!38692 (val!12634 Int)) )
))
(declare-datatypes ((ValueCell!11880 0))(
  ( (ValueCellFull!11880 (v!15244 V!38691)) (EmptyCell!11880) )
))
(declare-datatypes ((array!67341 0))(
  ( (array!67342 (arr!32377 (Array (_ BitVec 32) ValueCell!11880)) (size!32913 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67341)

(declare-fun e!604769 () Bool)

(declare-fun array_inv!25086 (array!67341) Bool)

(assert (=> start!93898 (and (array_inv!25086 _values!955) e!604769)))

(assert (=> start!93898 tp!75496))

(declare-fun array_inv!25087 (array!67339) Bool)

(assert (=> start!93898 (array_inv!25087 _keys!1163)))

(declare-fun b!1061901 () Bool)

(declare-fun e!604773 () Bool)

(assert (=> b!1061901 (= e!604773 tp_is_empty!25167)))

(declare-fun b!1061902 () Bool)

(declare-fun e!604770 () Bool)

(assert (=> b!1061902 (= e!604774 (not e!604770))))

(declare-fun res!709071 () Bool)

(assert (=> b!1061902 (=> res!709071 e!604770)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061902 (= res!709071 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!15972 0))(
  ( (tuple2!15973 (_1!7997 (_ BitVec 64)) (_2!7997 V!38691)) )
))
(declare-datatypes ((List!22556 0))(
  ( (Nil!22553) (Cons!22552 (h!23761 tuple2!15972) (t!31867 List!22556)) )
))
(declare-datatypes ((ListLongMap!13941 0))(
  ( (ListLongMap!13942 (toList!6986 List!22556)) )
))
(declare-fun lt!467801 () ListLongMap!13941)

(declare-fun lt!467804 () ListLongMap!13941)

(assert (=> b!1061902 (= lt!467801 lt!467804)))

(declare-fun zeroValueBefore!47 () V!38691)

(declare-datatypes ((Unit!34774 0))(
  ( (Unit!34775) )
))
(declare-fun lt!467803 () Unit!34774)

(declare-fun minValue!907 () V!38691)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!625 (array!67339 array!67341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38691 V!38691 V!38691 V!38691 (_ BitVec 32) Int) Unit!34774)

(assert (=> b!1061902 (= lt!467803 (lemmaNoChangeToArrayThenSameMapNoExtras!625 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3588 (array!67339 array!67341 (_ BitVec 32) (_ BitVec 32) V!38691 V!38691 (_ BitVec 32) Int) ListLongMap!13941)

(assert (=> b!1061902 (= lt!467804 (getCurrentListMapNoExtraKeys!3588 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061902 (= lt!467801 (getCurrentListMapNoExtraKeys!3588 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39424 () Bool)

(declare-fun mapRes!39424 () Bool)

(assert (=> mapIsEmpty!39424 mapRes!39424))

(declare-fun b!1061903 () Bool)

(declare-fun res!709069 () Bool)

(assert (=> b!1061903 (=> (not res!709069) (not e!604774))))

(assert (=> b!1061903 (= res!709069 (and (= (size!32913 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32912 _keys!1163) (size!32913 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061904 () Bool)

(declare-fun e!604772 () Bool)

(assert (=> b!1061904 (= e!604769 (and e!604772 mapRes!39424))))

(declare-fun condMapEmpty!39424 () Bool)

(declare-fun mapDefault!39424 () ValueCell!11880)

(assert (=> b!1061904 (= condMapEmpty!39424 (= (arr!32377 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11880)) mapDefault!39424)))))

(declare-fun b!1061905 () Bool)

(declare-fun res!709070 () Bool)

(assert (=> b!1061905 (=> (not res!709070) (not e!604774))))

(declare-datatypes ((List!22557 0))(
  ( (Nil!22554) (Cons!22553 (h!23762 (_ BitVec 64)) (t!31868 List!22557)) )
))
(declare-fun arrayNoDuplicates!0 (array!67339 (_ BitVec 32) List!22557) Bool)

(assert (=> b!1061905 (= res!709070 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22554))))

(declare-fun b!1061906 () Bool)

(assert (=> b!1061906 (= e!604770 true)))

(declare-fun lt!467802 () Bool)

(declare-fun contains!6222 (ListLongMap!13941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3975 (array!67339 array!67341 (_ BitVec 32) (_ BitVec 32) V!38691 V!38691 (_ BitVec 32) Int) ListLongMap!13941)

(assert (=> b!1061906 (= lt!467802 (contains!6222 (getCurrentListMap!3975 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1061907 () Bool)

(assert (=> b!1061907 (= e!604772 tp_is_empty!25167)))

(declare-fun mapNonEmpty!39424 () Bool)

(declare-fun tp!75497 () Bool)

(assert (=> mapNonEmpty!39424 (= mapRes!39424 (and tp!75497 e!604773))))

(declare-fun mapKey!39424 () (_ BitVec 32))

(declare-fun mapRest!39424 () (Array (_ BitVec 32) ValueCell!11880))

(declare-fun mapValue!39424 () ValueCell!11880)

(assert (=> mapNonEmpty!39424 (= (arr!32377 _values!955) (store mapRest!39424 mapKey!39424 mapValue!39424))))

(assert (= (and start!93898 res!709073) b!1061903))

(assert (= (and b!1061903 res!709069) b!1061900))

(assert (= (and b!1061900 res!709072) b!1061905))

(assert (= (and b!1061905 res!709070) b!1061902))

(assert (= (and b!1061902 (not res!709071)) b!1061906))

(assert (= (and b!1061904 condMapEmpty!39424) mapIsEmpty!39424))

(assert (= (and b!1061904 (not condMapEmpty!39424)) mapNonEmpty!39424))

(get-info :version)

(assert (= (and mapNonEmpty!39424 ((_ is ValueCellFull!11880) mapValue!39424)) b!1061901))

(assert (= (and b!1061904 ((_ is ValueCellFull!11880) mapDefault!39424)) b!1061907))

(assert (= start!93898 b!1061904))

(declare-fun m!980677 () Bool)

(assert (=> b!1061900 m!980677))

(declare-fun m!980679 () Bool)

(assert (=> mapNonEmpty!39424 m!980679))

(declare-fun m!980681 () Bool)

(assert (=> b!1061906 m!980681))

(assert (=> b!1061906 m!980681))

(declare-fun m!980683 () Bool)

(assert (=> b!1061906 m!980683))

(declare-fun m!980685 () Bool)

(assert (=> start!93898 m!980685))

(declare-fun m!980687 () Bool)

(assert (=> start!93898 m!980687))

(declare-fun m!980689 () Bool)

(assert (=> start!93898 m!980689))

(declare-fun m!980691 () Bool)

(assert (=> b!1061902 m!980691))

(declare-fun m!980693 () Bool)

(assert (=> b!1061902 m!980693))

(declare-fun m!980695 () Bool)

(assert (=> b!1061902 m!980695))

(declare-fun m!980697 () Bool)

(assert (=> b!1061905 m!980697))

(check-sat (not b!1061905) tp_is_empty!25167 (not b!1061902) (not mapNonEmpty!39424) (not b!1061906) (not b_next!21357) (not b!1061900) (not start!93898) b_and!34079)
(check-sat b_and!34079 (not b_next!21357))
