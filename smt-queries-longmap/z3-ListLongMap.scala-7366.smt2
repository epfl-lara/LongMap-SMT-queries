; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93908 () Bool)

(assert start!93908)

(declare-fun b_free!21373 () Bool)

(declare-fun b_next!21373 () Bool)

(assert (=> start!93908 (= b_free!21373 (not b_next!21373))))

(declare-fun tp!75544 () Bool)

(declare-fun b_and!34069 () Bool)

(assert (=> start!93908 (= tp!75544 b_and!34069)))

(declare-fun mapIsEmpty!39448 () Bool)

(declare-fun mapRes!39448 () Bool)

(assert (=> mapIsEmpty!39448 mapRes!39448))

(declare-fun b!1061959 () Bool)

(declare-fun res!709142 () Bool)

(declare-fun e!604840 () Bool)

(assert (=> b!1061959 (=> (not res!709142) (not e!604840))))

(declare-datatypes ((array!67318 0))(
  ( (array!67319 (arr!32366 (Array (_ BitVec 32) (_ BitVec 64))) (size!32904 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67318)

(declare-datatypes ((List!22612 0))(
  ( (Nil!22609) (Cons!22608 (h!23817 (_ BitVec 64)) (t!31914 List!22612)) )
))
(declare-fun arrayNoDuplicates!0 (array!67318 (_ BitVec 32) List!22612) Bool)

(assert (=> b!1061959 (= res!709142 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22609))))

(declare-fun b!1061960 () Bool)

(declare-fun res!709145 () Bool)

(assert (=> b!1061960 (=> (not res!709145) (not e!604840))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67318 (_ BitVec 32)) Bool)

(assert (=> b!1061960 (= res!709145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061961 () Bool)

(declare-fun e!604844 () Bool)

(declare-fun e!604843 () Bool)

(assert (=> b!1061961 (= e!604844 (and e!604843 mapRes!39448))))

(declare-fun condMapEmpty!39448 () Bool)

(declare-datatypes ((V!38713 0))(
  ( (V!38714 (val!12642 Int)) )
))
(declare-datatypes ((ValueCell!11888 0))(
  ( (ValueCellFull!11888 (v!15251 V!38713)) (EmptyCell!11888) )
))
(declare-datatypes ((array!67320 0))(
  ( (array!67321 (arr!32367 (Array (_ BitVec 32) ValueCell!11888)) (size!32905 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67320)

(declare-fun mapDefault!39448 () ValueCell!11888)

(assert (=> b!1061961 (= condMapEmpty!39448 (= (arr!32367 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11888)) mapDefault!39448)))))

(declare-fun b!1061963 () Bool)

(declare-fun e!604845 () Bool)

(assert (=> b!1061963 (= e!604845 true)))

(declare-datatypes ((tuple2!16058 0))(
  ( (tuple2!16059 (_1!8040 (_ BitVec 64)) (_2!8040 V!38713)) )
))
(declare-datatypes ((List!22613 0))(
  ( (Nil!22610) (Cons!22609 (h!23818 tuple2!16058) (t!31915 List!22613)) )
))
(declare-datatypes ((ListLongMap!14027 0))(
  ( (ListLongMap!14028 (toList!7029 List!22613)) )
))
(declare-fun lt!467717 () ListLongMap!14027)

(declare-fun -!552 (ListLongMap!14027 (_ BitVec 64)) ListLongMap!14027)

(assert (=> b!1061963 (= (-!552 lt!467717 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467717)))

(declare-datatypes ((Unit!34651 0))(
  ( (Unit!34652) )
))
(declare-fun lt!467719 () Unit!34651)

(declare-fun removeNotPresentStillSame!4 (ListLongMap!14027 (_ BitVec 64)) Unit!34651)

(assert (=> b!1061963 (= lt!467719 (removeNotPresentStillSame!4 lt!467717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1061964 () Bool)

(declare-fun res!709143 () Bool)

(assert (=> b!1061964 (=> (not res!709143) (not e!604840))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061964 (= res!709143 (and (= (size!32905 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32904 _keys!1163) (size!32905 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061965 () Bool)

(declare-fun e!604842 () Bool)

(assert (=> b!1061965 (= e!604842 e!604845)))

(declare-fun res!709141 () Bool)

(assert (=> b!1061965 (=> res!709141 e!604845)))

(declare-fun contains!6199 (ListLongMap!14027 (_ BitVec 64)) Bool)

(assert (=> b!1061965 (= res!709141 (contains!6199 lt!467717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38713)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38713)

(declare-fun getCurrentListMap!3931 (array!67318 array!67320 (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 (_ BitVec 32) Int) ListLongMap!14027)

(assert (=> b!1061965 (= lt!467717 (getCurrentListMap!3931 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061966 () Bool)

(declare-fun tp_is_empty!25183 () Bool)

(assert (=> b!1061966 (= e!604843 tp_is_empty!25183)))

(declare-fun res!709140 () Bool)

(assert (=> start!93908 (=> (not res!709140) (not e!604840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93908 (= res!709140 (validMask!0 mask!1515))))

(assert (=> start!93908 e!604840))

(assert (=> start!93908 true))

(assert (=> start!93908 tp_is_empty!25183))

(declare-fun array_inv!25076 (array!67320) Bool)

(assert (=> start!93908 (and (array_inv!25076 _values!955) e!604844)))

(assert (=> start!93908 tp!75544))

(declare-fun array_inv!25077 (array!67318) Bool)

(assert (=> start!93908 (array_inv!25077 _keys!1163)))

(declare-fun b!1061962 () Bool)

(assert (=> b!1061962 (= e!604840 (not e!604842))))

(declare-fun res!709144 () Bool)

(assert (=> b!1061962 (=> res!709144 e!604842)))

(assert (=> b!1061962 (= res!709144 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467718 () ListLongMap!14027)

(declare-fun lt!467720 () ListLongMap!14027)

(assert (=> b!1061962 (= lt!467718 lt!467720)))

(declare-fun lt!467721 () Unit!34651)

(declare-fun zeroValueAfter!47 () V!38713)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!637 (array!67318 array!67320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 V!38713 V!38713 (_ BitVec 32) Int) Unit!34651)

(assert (=> b!1061962 (= lt!467721 (lemmaNoChangeToArrayThenSameMapNoExtras!637 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3643 (array!67318 array!67320 (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 (_ BitVec 32) Int) ListLongMap!14027)

(assert (=> b!1061962 (= lt!467720 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061962 (= lt!467718 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061967 () Bool)

(declare-fun e!604841 () Bool)

(assert (=> b!1061967 (= e!604841 tp_is_empty!25183)))

(declare-fun mapNonEmpty!39448 () Bool)

(declare-fun tp!75545 () Bool)

(assert (=> mapNonEmpty!39448 (= mapRes!39448 (and tp!75545 e!604841))))

(declare-fun mapKey!39448 () (_ BitVec 32))

(declare-fun mapRest!39448 () (Array (_ BitVec 32) ValueCell!11888))

(declare-fun mapValue!39448 () ValueCell!11888)

(assert (=> mapNonEmpty!39448 (= (arr!32367 _values!955) (store mapRest!39448 mapKey!39448 mapValue!39448))))

(assert (= (and start!93908 res!709140) b!1061964))

(assert (= (and b!1061964 res!709143) b!1061960))

(assert (= (and b!1061960 res!709145) b!1061959))

(assert (= (and b!1061959 res!709142) b!1061962))

(assert (= (and b!1061962 (not res!709144)) b!1061965))

(assert (= (and b!1061965 (not res!709141)) b!1061963))

(assert (= (and b!1061961 condMapEmpty!39448) mapIsEmpty!39448))

(assert (= (and b!1061961 (not condMapEmpty!39448)) mapNonEmpty!39448))

(get-info :version)

(assert (= (and mapNonEmpty!39448 ((_ is ValueCellFull!11888) mapValue!39448)) b!1061967))

(assert (= (and b!1061961 ((_ is ValueCellFull!11888) mapDefault!39448)) b!1061966))

(assert (= start!93908 b!1061961))

(declare-fun m!980251 () Bool)

(assert (=> b!1061959 m!980251))

(declare-fun m!980253 () Bool)

(assert (=> mapNonEmpty!39448 m!980253))

(declare-fun m!980255 () Bool)

(assert (=> b!1061960 m!980255))

(declare-fun m!980257 () Bool)

(assert (=> start!93908 m!980257))

(declare-fun m!980259 () Bool)

(assert (=> start!93908 m!980259))

(declare-fun m!980261 () Bool)

(assert (=> start!93908 m!980261))

(declare-fun m!980263 () Bool)

(assert (=> b!1061965 m!980263))

(declare-fun m!980265 () Bool)

(assert (=> b!1061965 m!980265))

(declare-fun m!980267 () Bool)

(assert (=> b!1061963 m!980267))

(declare-fun m!980269 () Bool)

(assert (=> b!1061963 m!980269))

(declare-fun m!980271 () Bool)

(assert (=> b!1061962 m!980271))

(declare-fun m!980273 () Bool)

(assert (=> b!1061962 m!980273))

(declare-fun m!980275 () Bool)

(assert (=> b!1061962 m!980275))

(check-sat (not b!1061963) (not b!1061960) b_and!34069 (not b_next!21373) (not mapNonEmpty!39448) (not b!1061959) (not start!93908) tp_is_empty!25183 (not b!1061962) (not b!1061965))
(check-sat b_and!34069 (not b_next!21373))
