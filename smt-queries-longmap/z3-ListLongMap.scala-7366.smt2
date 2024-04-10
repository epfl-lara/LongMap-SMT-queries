; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93916 () Bool)

(assert start!93916)

(declare-fun b_free!21375 () Bool)

(declare-fun b_next!21375 () Bool)

(assert (=> start!93916 (= b_free!21375 (not b_next!21375))))

(declare-fun tp!75551 () Bool)

(declare-fun b_and!34097 () Bool)

(assert (=> start!93916 (= tp!75551 b_and!34097)))

(declare-fun b!1062139 () Bool)

(declare-fun e!604960 () Bool)

(declare-fun e!604957 () Bool)

(assert (=> b!1062139 (= e!604960 e!604957)))

(declare-fun res!709232 () Bool)

(assert (=> b!1062139 (=> res!709232 e!604957)))

(declare-datatypes ((V!38715 0))(
  ( (V!38716 (val!12643 Int)) )
))
(declare-datatypes ((tuple2!15988 0))(
  ( (tuple2!15989 (_1!8005 (_ BitVec 64)) (_2!8005 V!38715)) )
))
(declare-datatypes ((List!22571 0))(
  ( (Nil!22568) (Cons!22567 (h!23776 tuple2!15988) (t!31882 List!22571)) )
))
(declare-datatypes ((ListLongMap!13957 0))(
  ( (ListLongMap!13958 (toList!6994 List!22571)) )
))
(declare-fun lt!467933 () ListLongMap!13957)

(declare-fun contains!6227 (ListLongMap!13957 (_ BitVec 64)) Bool)

(assert (=> b!1062139 (= res!709232 (contains!6227 lt!467933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38715)

(declare-datatypes ((ValueCell!11889 0))(
  ( (ValueCellFull!11889 (v!15253 V!38715)) (EmptyCell!11889) )
))
(declare-datatypes ((array!67375 0))(
  ( (array!67376 (arr!32394 (Array (_ BitVec 32) ValueCell!11889)) (size!32930 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67375)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38715)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67377 0))(
  ( (array!67378 (arr!32395 (Array (_ BitVec 32) (_ BitVec 64))) (size!32931 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67377)

(declare-fun getCurrentListMap!3980 (array!67377 array!67375 (_ BitVec 32) (_ BitVec 32) V!38715 V!38715 (_ BitVec 32) Int) ListLongMap!13957)

(assert (=> b!1062139 (= lt!467933 (getCurrentListMap!3980 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062140 () Bool)

(declare-fun res!709227 () Bool)

(declare-fun e!604958 () Bool)

(assert (=> b!1062140 (=> (not res!709227) (not e!604958))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062140 (= res!709227 (and (= (size!32930 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32931 _keys!1163) (size!32930 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39451 () Bool)

(declare-fun mapRes!39451 () Bool)

(declare-fun tp!75550 () Bool)

(declare-fun e!604955 () Bool)

(assert (=> mapNonEmpty!39451 (= mapRes!39451 (and tp!75550 e!604955))))

(declare-fun mapKey!39451 () (_ BitVec 32))

(declare-fun mapRest!39451 () (Array (_ BitVec 32) ValueCell!11889))

(declare-fun mapValue!39451 () ValueCell!11889)

(assert (=> mapNonEmpty!39451 (= (arr!32394 _values!955) (store mapRest!39451 mapKey!39451 mapValue!39451))))

(declare-fun b!1062141 () Bool)

(declare-fun tp_is_empty!25185 () Bool)

(assert (=> b!1062141 (= e!604955 tp_is_empty!25185)))

(declare-fun b!1062142 () Bool)

(declare-fun e!604954 () Bool)

(assert (=> b!1062142 (= e!604954 tp_is_empty!25185)))

(declare-fun mapIsEmpty!39451 () Bool)

(assert (=> mapIsEmpty!39451 mapRes!39451))

(declare-fun b!1062143 () Bool)

(declare-fun res!709228 () Bool)

(assert (=> b!1062143 (=> (not res!709228) (not e!604958))))

(declare-datatypes ((List!22572 0))(
  ( (Nil!22569) (Cons!22568 (h!23777 (_ BitVec 64)) (t!31883 List!22572)) )
))
(declare-fun arrayNoDuplicates!0 (array!67377 (_ BitVec 32) List!22572) Bool)

(assert (=> b!1062143 (= res!709228 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22569))))

(declare-fun b!1062144 () Bool)

(assert (=> b!1062144 (= e!604957 true)))

(declare-fun -!560 (ListLongMap!13957 (_ BitVec 64)) ListLongMap!13957)

(assert (=> b!1062144 (= (-!560 lt!467933 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467933)))

(declare-datatypes ((Unit!34790 0))(
  ( (Unit!34791) )
))
(declare-fun lt!467934 () Unit!34790)

(declare-fun removeNotPresentStillSame!7 (ListLongMap!13957 (_ BitVec 64)) Unit!34790)

(assert (=> b!1062144 (= lt!467934 (removeNotPresentStillSame!7 lt!467933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062145 () Bool)

(declare-fun res!709229 () Bool)

(assert (=> b!1062145 (=> (not res!709229) (not e!604958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67377 (_ BitVec 32)) Bool)

(assert (=> b!1062145 (= res!709229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709231 () Bool)

(assert (=> start!93916 (=> (not res!709231) (not e!604958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93916 (= res!709231 (validMask!0 mask!1515))))

(assert (=> start!93916 e!604958))

(assert (=> start!93916 true))

(assert (=> start!93916 tp_is_empty!25185))

(declare-fun e!604959 () Bool)

(declare-fun array_inv!25098 (array!67375) Bool)

(assert (=> start!93916 (and (array_inv!25098 _values!955) e!604959)))

(assert (=> start!93916 tp!75551))

(declare-fun array_inv!25099 (array!67377) Bool)

(assert (=> start!93916 (array_inv!25099 _keys!1163)))

(declare-fun b!1062146 () Bool)

(assert (=> b!1062146 (= e!604958 (not e!604960))))

(declare-fun res!709230 () Bool)

(assert (=> b!1062146 (=> res!709230 e!604960)))

(assert (=> b!1062146 (= res!709230 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467936 () ListLongMap!13957)

(declare-fun lt!467932 () ListLongMap!13957)

(assert (=> b!1062146 (= lt!467936 lt!467932)))

(declare-fun lt!467935 () Unit!34790)

(declare-fun zeroValueAfter!47 () V!38715)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!631 (array!67377 array!67375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38715 V!38715 V!38715 V!38715 (_ BitVec 32) Int) Unit!34790)

(assert (=> b!1062146 (= lt!467935 (lemmaNoChangeToArrayThenSameMapNoExtras!631 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3594 (array!67377 array!67375 (_ BitVec 32) (_ BitVec 32) V!38715 V!38715 (_ BitVec 32) Int) ListLongMap!13957)

(assert (=> b!1062146 (= lt!467932 (getCurrentListMapNoExtraKeys!3594 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062146 (= lt!467936 (getCurrentListMapNoExtraKeys!3594 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062147 () Bool)

(assert (=> b!1062147 (= e!604959 (and e!604954 mapRes!39451))))

(declare-fun condMapEmpty!39451 () Bool)

(declare-fun mapDefault!39451 () ValueCell!11889)

(assert (=> b!1062147 (= condMapEmpty!39451 (= (arr!32394 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11889)) mapDefault!39451)))))

(assert (= (and start!93916 res!709231) b!1062140))

(assert (= (and b!1062140 res!709227) b!1062145))

(assert (= (and b!1062145 res!709229) b!1062143))

(assert (= (and b!1062143 res!709228) b!1062146))

(assert (= (and b!1062146 (not res!709230)) b!1062139))

(assert (= (and b!1062139 (not res!709232)) b!1062144))

(assert (= (and b!1062147 condMapEmpty!39451) mapIsEmpty!39451))

(assert (= (and b!1062147 (not condMapEmpty!39451)) mapNonEmpty!39451))

(get-info :version)

(assert (= (and mapNonEmpty!39451 ((_ is ValueCellFull!11889) mapValue!39451)) b!1062141))

(assert (= (and b!1062147 ((_ is ValueCellFull!11889) mapDefault!39451)) b!1062142))

(assert (= start!93916 b!1062147))

(declare-fun m!980903 () Bool)

(assert (=> mapNonEmpty!39451 m!980903))

(declare-fun m!980905 () Bool)

(assert (=> b!1062145 m!980905))

(declare-fun m!980907 () Bool)

(assert (=> b!1062139 m!980907))

(declare-fun m!980909 () Bool)

(assert (=> b!1062139 m!980909))

(declare-fun m!980911 () Bool)

(assert (=> b!1062146 m!980911))

(declare-fun m!980913 () Bool)

(assert (=> b!1062146 m!980913))

(declare-fun m!980915 () Bool)

(assert (=> b!1062146 m!980915))

(declare-fun m!980917 () Bool)

(assert (=> start!93916 m!980917))

(declare-fun m!980919 () Bool)

(assert (=> start!93916 m!980919))

(declare-fun m!980921 () Bool)

(assert (=> start!93916 m!980921))

(declare-fun m!980923 () Bool)

(assert (=> b!1062143 m!980923))

(declare-fun m!980925 () Bool)

(assert (=> b!1062144 m!980925))

(declare-fun m!980927 () Bool)

(assert (=> b!1062144 m!980927))

(check-sat b_and!34097 (not b!1062139) (not mapNonEmpty!39451) (not b!1062144) (not start!93916) tp_is_empty!25185 (not b_next!21375) (not b!1062143) (not b!1062146) (not b!1062145))
(check-sat b_and!34097 (not b_next!21375))
