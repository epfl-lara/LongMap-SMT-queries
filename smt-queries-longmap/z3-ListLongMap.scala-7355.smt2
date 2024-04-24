; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94070 () Bool)

(assert start!94070)

(declare-fun b_free!21307 () Bool)

(declare-fun b_next!21307 () Bool)

(assert (=> start!94070 (= b_free!21307 (not b_next!21307))))

(declare-fun tp!75343 () Bool)

(declare-fun b_and!34031 () Bool)

(assert (=> start!94070 (= tp!75343 b_and!34031)))

(declare-fun b!1062613 () Bool)

(declare-fun e!605192 () Bool)

(declare-fun tp_is_empty!25117 () Bool)

(assert (=> b!1062613 (= e!605192 tp_is_empty!25117)))

(declare-fun b!1062614 () Bool)

(declare-fun e!605189 () Bool)

(declare-fun e!605190 () Bool)

(declare-fun mapRes!39346 () Bool)

(assert (=> b!1062614 (= e!605189 (and e!605190 mapRes!39346))))

(declare-fun condMapEmpty!39346 () Bool)

(declare-datatypes ((V!38625 0))(
  ( (V!38626 (val!12609 Int)) )
))
(declare-datatypes ((ValueCell!11855 0))(
  ( (ValueCellFull!11855 (v!15215 V!38625)) (EmptyCell!11855) )
))
(declare-datatypes ((array!67289 0))(
  ( (array!67290 (arr!32346 (Array (_ BitVec 32) ValueCell!11855)) (size!32883 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67289)

(declare-fun mapDefault!39346 () ValueCell!11855)

(assert (=> b!1062614 (= condMapEmpty!39346 (= (arr!32346 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11855)) mapDefault!39346)))))

(declare-fun mapIsEmpty!39346 () Bool)

(assert (=> mapIsEmpty!39346 mapRes!39346))

(declare-fun mapNonEmpty!39346 () Bool)

(declare-fun tp!75344 () Bool)

(assert (=> mapNonEmpty!39346 (= mapRes!39346 (and tp!75344 e!605192))))

(declare-fun mapRest!39346 () (Array (_ BitVec 32) ValueCell!11855))

(declare-fun mapValue!39346 () ValueCell!11855)

(declare-fun mapKey!39346 () (_ BitVec 32))

(assert (=> mapNonEmpty!39346 (= (arr!32346 _values!955) (store mapRest!39346 mapKey!39346 mapValue!39346))))

(declare-fun b!1062615 () Bool)

(declare-fun res!709257 () Bool)

(declare-fun e!605191 () Bool)

(assert (=> b!1062615 (=> (not res!709257) (not e!605191))))

(declare-datatypes ((array!67291 0))(
  ( (array!67292 (arr!32347 (Array (_ BitVec 32) (_ BitVec 64))) (size!32884 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67291)

(declare-datatypes ((List!22511 0))(
  ( (Nil!22508) (Cons!22507 (h!23725 (_ BitVec 64)) (t!31812 List!22511)) )
))
(declare-fun arrayNoDuplicates!0 (array!67291 (_ BitVec 32) List!22511) Bool)

(assert (=> b!1062615 (= res!709257 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22508))))

(declare-fun b!1062616 () Bool)

(assert (=> b!1062616 (= e!605190 tp_is_empty!25117)))

(declare-fun b!1062617 () Bool)

(declare-fun res!709258 () Bool)

(assert (=> b!1062617 (=> (not res!709258) (not e!605191))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67291 (_ BitVec 32)) Bool)

(assert (=> b!1062617 (= res!709258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062618 () Bool)

(declare-fun res!709255 () Bool)

(assert (=> b!1062618 (=> (not res!709255) (not e!605191))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062618 (= res!709255 (and (= (size!32883 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32884 _keys!1163) (size!32883 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062612 () Bool)

(assert (=> b!1062612 (= e!605191 (not true))))

(declare-datatypes ((tuple2!15926 0))(
  ( (tuple2!15927 (_1!7974 (_ BitVec 64)) (_2!7974 V!38625)) )
))
(declare-datatypes ((List!22512 0))(
  ( (Nil!22509) (Cons!22508 (h!23726 tuple2!15926) (t!31813 List!22512)) )
))
(declare-datatypes ((ListLongMap!13903 0))(
  ( (ListLongMap!13904 (toList!6967 List!22512)) )
))
(declare-fun lt!468048 () ListLongMap!13903)

(declare-fun lt!468047 () ListLongMap!13903)

(assert (=> b!1062612 (= lt!468048 lt!468047)))

(declare-fun zeroValueBefore!47 () V!38625)

(declare-datatypes ((Unit!34739 0))(
  ( (Unit!34740) )
))
(declare-fun lt!468046 () Unit!34739)

(declare-fun minValue!907 () V!38625)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!618 (array!67291 array!67289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 V!38625 V!38625 (_ BitVec 32) Int) Unit!34739)

(assert (=> b!1062612 (= lt!468046 (lemmaNoChangeToArrayThenSameMapNoExtras!618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3615 (array!67291 array!67289 (_ BitVec 32) (_ BitVec 32) V!38625 V!38625 (_ BitVec 32) Int) ListLongMap!13903)

(assert (=> b!1062612 (= lt!468047 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062612 (= lt!468048 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709256 () Bool)

(assert (=> start!94070 (=> (not res!709256) (not e!605191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94070 (= res!709256 (validMask!0 mask!1515))))

(assert (=> start!94070 e!605191))

(assert (=> start!94070 true))

(assert (=> start!94070 tp_is_empty!25117))

(declare-fun array_inv!25078 (array!67289) Bool)

(assert (=> start!94070 (and (array_inv!25078 _values!955) e!605189)))

(assert (=> start!94070 tp!75343))

(declare-fun array_inv!25079 (array!67291) Bool)

(assert (=> start!94070 (array_inv!25079 _keys!1163)))

(assert (= (and start!94070 res!709256) b!1062618))

(assert (= (and b!1062618 res!709255) b!1062617))

(assert (= (and b!1062617 res!709258) b!1062615))

(assert (= (and b!1062615 res!709257) b!1062612))

(assert (= (and b!1062614 condMapEmpty!39346) mapIsEmpty!39346))

(assert (= (and b!1062614 (not condMapEmpty!39346)) mapNonEmpty!39346))

(get-info :version)

(assert (= (and mapNonEmpty!39346 ((_ is ValueCellFull!11855) mapValue!39346)) b!1062613))

(assert (= (and b!1062614 ((_ is ValueCellFull!11855) mapDefault!39346)) b!1062616))

(assert (= start!94070 b!1062614))

(declare-fun m!981829 () Bool)

(assert (=> b!1062612 m!981829))

(declare-fun m!981831 () Bool)

(assert (=> b!1062612 m!981831))

(declare-fun m!981833 () Bool)

(assert (=> b!1062612 m!981833))

(declare-fun m!981835 () Bool)

(assert (=> start!94070 m!981835))

(declare-fun m!981837 () Bool)

(assert (=> start!94070 m!981837))

(declare-fun m!981839 () Bool)

(assert (=> start!94070 m!981839))

(declare-fun m!981841 () Bool)

(assert (=> b!1062615 m!981841))

(declare-fun m!981843 () Bool)

(assert (=> b!1062617 m!981843))

(declare-fun m!981845 () Bool)

(assert (=> mapNonEmpty!39346 m!981845))

(check-sat tp_is_empty!25117 (not b_next!21307) (not b!1062617) b_and!34031 (not b!1062612) (not b!1062615) (not start!94070) (not mapNonEmpty!39346))
(check-sat b_and!34031 (not b_next!21307))
