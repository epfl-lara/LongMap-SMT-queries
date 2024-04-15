; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93984 () Bool)

(assert start!93984)

(declare-fun b_free!21427 () Bool)

(declare-fun b_next!21427 () Bool)

(assert (=> start!93984 (= b_free!21427 (not b_next!21427))))

(declare-fun tp!75710 () Bool)

(declare-fun b_and!34133 () Bool)

(assert (=> start!93984 (= tp!75710 b_and!34133)))

(declare-fun b!1062845 () Bool)

(declare-fun e!605511 () Bool)

(assert (=> b!1062845 (= e!605511 true)))

(declare-datatypes ((V!38785 0))(
  ( (V!38786 (val!12669 Int)) )
))
(declare-datatypes ((tuple2!16098 0))(
  ( (tuple2!16099 (_1!8060 (_ BitVec 64)) (_2!8060 V!38785)) )
))
(declare-datatypes ((List!22648 0))(
  ( (Nil!22645) (Cons!22644 (h!23853 tuple2!16098) (t!31952 List!22648)) )
))
(declare-datatypes ((ListLongMap!14067 0))(
  ( (ListLongMap!14068 (toList!7049 List!22648)) )
))
(declare-fun lt!468246 () ListLongMap!14067)

(declare-fun -!569 (ListLongMap!14067 (_ BitVec 64)) ListLongMap!14067)

(assert (=> b!1062845 (= (-!569 lt!468246 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468246)))

(declare-datatypes ((Unit!34691 0))(
  ( (Unit!34692) )
))
(declare-fun lt!468247 () Unit!34691)

(declare-fun removeNotPresentStillSame!21 (ListLongMap!14067 (_ BitVec 64)) Unit!34691)

(assert (=> b!1062845 (= lt!468247 (removeNotPresentStillSame!21 lt!468246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062846 () Bool)

(declare-fun e!605509 () Bool)

(declare-fun e!605513 () Bool)

(assert (=> b!1062846 (= e!605509 (not e!605513))))

(declare-fun res!709688 () Bool)

(assert (=> b!1062846 (=> res!709688 e!605513)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062846 (= res!709688 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468250 () ListLongMap!14067)

(declare-fun lt!468249 () ListLongMap!14067)

(assert (=> b!1062846 (= lt!468250 lt!468249)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38785)

(declare-datatypes ((ValueCell!11915 0))(
  ( (ValueCellFull!11915 (v!15279 V!38785)) (EmptyCell!11915) )
))
(declare-datatypes ((array!67418 0))(
  ( (array!67419 (arr!32415 (Array (_ BitVec 32) ValueCell!11915)) (size!32953 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67418)

(declare-fun minValue!907 () V!38785)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38785)

(declare-fun lt!468248 () Unit!34691)

(declare-datatypes ((array!67420 0))(
  ( (array!67421 (arr!32416 (Array (_ BitVec 32) (_ BitVec 64))) (size!32954 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67420)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!652 (array!67420 array!67418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 V!38785 V!38785 (_ BitVec 32) Int) Unit!34691)

(assert (=> b!1062846 (= lt!468248 (lemmaNoChangeToArrayThenSameMapNoExtras!652 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3658 (array!67420 array!67418 (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 (_ BitVec 32) Int) ListLongMap!14067)

(assert (=> b!1062846 (= lt!468249 (getCurrentListMapNoExtraKeys!3658 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062846 (= lt!468250 (getCurrentListMapNoExtraKeys!3658 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39532 () Bool)

(declare-fun mapRes!39532 () Bool)

(assert (=> mapIsEmpty!39532 mapRes!39532))

(declare-fun res!709687 () Bool)

(assert (=> start!93984 (=> (not res!709687) (not e!605509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93984 (= res!709687 (validMask!0 mask!1515))))

(assert (=> start!93984 e!605509))

(assert (=> start!93984 true))

(declare-fun tp_is_empty!25237 () Bool)

(assert (=> start!93984 tp_is_empty!25237))

(declare-fun e!605512 () Bool)

(declare-fun array_inv!25116 (array!67418) Bool)

(assert (=> start!93984 (and (array_inv!25116 _values!955) e!605512)))

(assert (=> start!93984 tp!75710))

(declare-fun array_inv!25117 (array!67420) Bool)

(assert (=> start!93984 (array_inv!25117 _keys!1163)))

(declare-fun b!1062847 () Bool)

(declare-fun res!709691 () Bool)

(assert (=> b!1062847 (=> (not res!709691) (not e!605509))))

(declare-datatypes ((List!22649 0))(
  ( (Nil!22646) (Cons!22645 (h!23854 (_ BitVec 64)) (t!31953 List!22649)) )
))
(declare-fun arrayNoDuplicates!0 (array!67420 (_ BitVec 32) List!22649) Bool)

(assert (=> b!1062847 (= res!709691 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22646))))

(declare-fun b!1062848 () Bool)

(declare-fun e!605508 () Bool)

(assert (=> b!1062848 (= e!605508 tp_is_empty!25237)))

(declare-fun b!1062849 () Bool)

(assert (=> b!1062849 (= e!605513 e!605511)))

(declare-fun res!709690 () Bool)

(assert (=> b!1062849 (=> res!709690 e!605511)))

(declare-fun contains!6218 (ListLongMap!14067 (_ BitVec 64)) Bool)

(assert (=> b!1062849 (= res!709690 (contains!6218 lt!468246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3949 (array!67420 array!67418 (_ BitVec 32) (_ BitVec 32) V!38785 V!38785 (_ BitVec 32) Int) ListLongMap!14067)

(assert (=> b!1062849 (= lt!468246 (getCurrentListMap!3949 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062850 () Bool)

(declare-fun res!709689 () Bool)

(assert (=> b!1062850 (=> (not res!709689) (not e!605509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67420 (_ BitVec 32)) Bool)

(assert (=> b!1062850 (= res!709689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062851 () Bool)

(assert (=> b!1062851 (= e!605512 (and e!605508 mapRes!39532))))

(declare-fun condMapEmpty!39532 () Bool)

(declare-fun mapDefault!39532 () ValueCell!11915)

(assert (=> b!1062851 (= condMapEmpty!39532 (= (arr!32415 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11915)) mapDefault!39532)))))

(declare-fun b!1062852 () Bool)

(declare-fun res!709692 () Bool)

(assert (=> b!1062852 (=> (not res!709692) (not e!605509))))

(assert (=> b!1062852 (= res!709692 (and (= (size!32953 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32954 _keys!1163) (size!32953 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062853 () Bool)

(declare-fun e!605510 () Bool)

(assert (=> b!1062853 (= e!605510 tp_is_empty!25237)))

(declare-fun mapNonEmpty!39532 () Bool)

(declare-fun tp!75709 () Bool)

(assert (=> mapNonEmpty!39532 (= mapRes!39532 (and tp!75709 e!605510))))

(declare-fun mapValue!39532 () ValueCell!11915)

(declare-fun mapRest!39532 () (Array (_ BitVec 32) ValueCell!11915))

(declare-fun mapKey!39532 () (_ BitVec 32))

(assert (=> mapNonEmpty!39532 (= (arr!32415 _values!955) (store mapRest!39532 mapKey!39532 mapValue!39532))))

(assert (= (and start!93984 res!709687) b!1062852))

(assert (= (and b!1062852 res!709692) b!1062850))

(assert (= (and b!1062850 res!709689) b!1062847))

(assert (= (and b!1062847 res!709691) b!1062846))

(assert (= (and b!1062846 (not res!709688)) b!1062849))

(assert (= (and b!1062849 (not res!709690)) b!1062845))

(assert (= (and b!1062851 condMapEmpty!39532) mapIsEmpty!39532))

(assert (= (and b!1062851 (not condMapEmpty!39532)) mapNonEmpty!39532))

(get-info :version)

(assert (= (and mapNonEmpty!39532 ((_ is ValueCellFull!11915) mapValue!39532)) b!1062853))

(assert (= (and b!1062851 ((_ is ValueCellFull!11915) mapDefault!39532)) b!1062848))

(assert (= start!93984 b!1062851))

(declare-fun m!981079 () Bool)

(assert (=> b!1062845 m!981079))

(declare-fun m!981081 () Bool)

(assert (=> b!1062845 m!981081))

(declare-fun m!981083 () Bool)

(assert (=> b!1062847 m!981083))

(declare-fun m!981085 () Bool)

(assert (=> b!1062849 m!981085))

(declare-fun m!981087 () Bool)

(assert (=> b!1062849 m!981087))

(declare-fun m!981089 () Bool)

(assert (=> start!93984 m!981089))

(declare-fun m!981091 () Bool)

(assert (=> start!93984 m!981091))

(declare-fun m!981093 () Bool)

(assert (=> start!93984 m!981093))

(declare-fun m!981095 () Bool)

(assert (=> b!1062846 m!981095))

(declare-fun m!981097 () Bool)

(assert (=> b!1062846 m!981097))

(declare-fun m!981099 () Bool)

(assert (=> b!1062846 m!981099))

(declare-fun m!981101 () Bool)

(assert (=> mapNonEmpty!39532 m!981101))

(declare-fun m!981103 () Bool)

(assert (=> b!1062850 m!981103))

(check-sat (not b!1062849) (not b!1062845) b_and!34133 (not start!93984) (not b!1062850) tp_is_empty!25237 (not b!1062846) (not mapNonEmpty!39532) (not b!1062847) (not b_next!21427))
(check-sat b_and!34133 (not b_next!21427))
