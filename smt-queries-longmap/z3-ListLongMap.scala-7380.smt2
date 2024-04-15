; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94014 () Bool)

(assert start!94014)

(declare-fun b_free!21457 () Bool)

(declare-fun b_next!21457 () Bool)

(assert (=> start!94014 (= b_free!21457 (not b_next!21457))))

(declare-fun tp!75799 () Bool)

(declare-fun b_and!34163 () Bool)

(assert (=> start!94014 (= tp!75799 b_and!34163)))

(declare-fun b!1063250 () Bool)

(declare-fun res!709959 () Bool)

(declare-fun e!605823 () Bool)

(assert (=> b!1063250 (=> (not res!709959) (not e!605823))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38825 0))(
  ( (V!38826 (val!12684 Int)) )
))
(declare-datatypes ((ValueCell!11930 0))(
  ( (ValueCellFull!11930 (v!15294 V!38825)) (EmptyCell!11930) )
))
(declare-datatypes ((array!67472 0))(
  ( (array!67473 (arr!32442 (Array (_ BitVec 32) ValueCell!11930)) (size!32980 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67472)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67474 0))(
  ( (array!67475 (arr!32443 (Array (_ BitVec 32) (_ BitVec 64))) (size!32981 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67474)

(assert (=> b!1063250 (= res!709959 (and (= (size!32980 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32981 _keys!1163) (size!32980 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063251 () Bool)

(declare-fun e!605826 () Bool)

(declare-fun tp_is_empty!25267 () Bool)

(assert (=> b!1063251 (= e!605826 tp_is_empty!25267)))

(declare-fun b!1063252 () Bool)

(declare-fun res!709957 () Bool)

(assert (=> b!1063252 (=> (not res!709957) (not e!605823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67474 (_ BitVec 32)) Bool)

(assert (=> b!1063252 (= res!709957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39577 () Bool)

(declare-fun mapRes!39577 () Bool)

(assert (=> mapIsEmpty!39577 mapRes!39577))

(declare-fun b!1063253 () Bool)

(declare-fun e!605824 () Bool)

(assert (=> b!1063253 (= e!605823 (not e!605824))))

(declare-fun res!709960 () Bool)

(assert (=> b!1063253 (=> res!709960 e!605824)))

(assert (=> b!1063253 (= res!709960 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16118 0))(
  ( (tuple2!16119 (_1!8070 (_ BitVec 64)) (_2!8070 V!38825)) )
))
(declare-datatypes ((List!22667 0))(
  ( (Nil!22664) (Cons!22663 (h!23872 tuple2!16118) (t!31971 List!22667)) )
))
(declare-datatypes ((ListLongMap!14087 0))(
  ( (ListLongMap!14088 (toList!7059 List!22667)) )
))
(declare-fun lt!468471 () ListLongMap!14087)

(declare-fun lt!468475 () ListLongMap!14087)

(assert (=> b!1063253 (= lt!468471 lt!468475)))

(declare-fun zeroValueBefore!47 () V!38825)

(declare-datatypes ((Unit!34707 0))(
  ( (Unit!34708) )
))
(declare-fun lt!468473 () Unit!34707)

(declare-fun minValue!907 () V!38825)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38825)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!659 (array!67474 array!67472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 V!38825 V!38825 (_ BitVec 32) Int) Unit!34707)

(assert (=> b!1063253 (= lt!468473 (lemmaNoChangeToArrayThenSameMapNoExtras!659 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3665 (array!67474 array!67472 (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 (_ BitVec 32) Int) ListLongMap!14087)

(assert (=> b!1063253 (= lt!468475 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063253 (= lt!468471 (getCurrentListMapNoExtraKeys!3665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063254 () Bool)

(declare-fun e!605828 () Bool)

(assert (=> b!1063254 (= e!605824 e!605828)))

(declare-fun res!709958 () Bool)

(assert (=> b!1063254 (=> res!709958 e!605828)))

(declare-fun lt!468474 () ListLongMap!14087)

(declare-fun contains!6228 (ListLongMap!14087 (_ BitVec 64)) Bool)

(assert (=> b!1063254 (= res!709958 (contains!6228 lt!468474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3959 (array!67474 array!67472 (_ BitVec 32) (_ BitVec 32) V!38825 V!38825 (_ BitVec 32) Int) ListLongMap!14087)

(assert (=> b!1063254 (= lt!468474 (getCurrentListMap!3959 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063255 () Bool)

(declare-fun res!709962 () Bool)

(assert (=> b!1063255 (=> (not res!709962) (not e!605823))))

(declare-datatypes ((List!22668 0))(
  ( (Nil!22665) (Cons!22664 (h!23873 (_ BitVec 64)) (t!31972 List!22668)) )
))
(declare-fun arrayNoDuplicates!0 (array!67474 (_ BitVec 32) List!22668) Bool)

(assert (=> b!1063255 (= res!709962 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22665))))

(declare-fun b!1063256 () Bool)

(assert (=> b!1063256 (= e!605828 true)))

(declare-fun -!577 (ListLongMap!14087 (_ BitVec 64)) ListLongMap!14087)

(assert (=> b!1063256 (= (-!577 lt!468474 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468474)))

(declare-fun lt!468472 () Unit!34707)

(declare-fun removeNotPresentStillSame!29 (ListLongMap!14087 (_ BitVec 64)) Unit!34707)

(assert (=> b!1063256 (= lt!468472 (removeNotPresentStillSame!29 lt!468474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39577 () Bool)

(declare-fun tp!75800 () Bool)

(assert (=> mapNonEmpty!39577 (= mapRes!39577 (and tp!75800 e!605826))))

(declare-fun mapValue!39577 () ValueCell!11930)

(declare-fun mapKey!39577 () (_ BitVec 32))

(declare-fun mapRest!39577 () (Array (_ BitVec 32) ValueCell!11930))

(assert (=> mapNonEmpty!39577 (= (arr!32442 _values!955) (store mapRest!39577 mapKey!39577 mapValue!39577))))

(declare-fun res!709961 () Bool)

(assert (=> start!94014 (=> (not res!709961) (not e!605823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94014 (= res!709961 (validMask!0 mask!1515))))

(assert (=> start!94014 e!605823))

(assert (=> start!94014 true))

(assert (=> start!94014 tp_is_empty!25267))

(declare-fun e!605822 () Bool)

(declare-fun array_inv!25134 (array!67472) Bool)

(assert (=> start!94014 (and (array_inv!25134 _values!955) e!605822)))

(assert (=> start!94014 tp!75799))

(declare-fun array_inv!25135 (array!67474) Bool)

(assert (=> start!94014 (array_inv!25135 _keys!1163)))

(declare-fun b!1063257 () Bool)

(declare-fun e!605825 () Bool)

(assert (=> b!1063257 (= e!605825 tp_is_empty!25267)))

(declare-fun b!1063258 () Bool)

(assert (=> b!1063258 (= e!605822 (and e!605825 mapRes!39577))))

(declare-fun condMapEmpty!39577 () Bool)

(declare-fun mapDefault!39577 () ValueCell!11930)

(assert (=> b!1063258 (= condMapEmpty!39577 (= (arr!32442 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11930)) mapDefault!39577)))))

(assert (= (and start!94014 res!709961) b!1063250))

(assert (= (and b!1063250 res!709959) b!1063252))

(assert (= (and b!1063252 res!709957) b!1063255))

(assert (= (and b!1063255 res!709962) b!1063253))

(assert (= (and b!1063253 (not res!709960)) b!1063254))

(assert (= (and b!1063254 (not res!709958)) b!1063256))

(assert (= (and b!1063258 condMapEmpty!39577) mapIsEmpty!39577))

(assert (= (and b!1063258 (not condMapEmpty!39577)) mapNonEmpty!39577))

(get-info :version)

(assert (= (and mapNonEmpty!39577 ((_ is ValueCellFull!11930) mapValue!39577)) b!1063251))

(assert (= (and b!1063258 ((_ is ValueCellFull!11930) mapDefault!39577)) b!1063257))

(assert (= start!94014 b!1063258))

(declare-fun m!981469 () Bool)

(assert (=> b!1063254 m!981469))

(declare-fun m!981471 () Bool)

(assert (=> b!1063254 m!981471))

(declare-fun m!981473 () Bool)

(assert (=> start!94014 m!981473))

(declare-fun m!981475 () Bool)

(assert (=> start!94014 m!981475))

(declare-fun m!981477 () Bool)

(assert (=> start!94014 m!981477))

(declare-fun m!981479 () Bool)

(assert (=> b!1063255 m!981479))

(declare-fun m!981481 () Bool)

(assert (=> mapNonEmpty!39577 m!981481))

(declare-fun m!981483 () Bool)

(assert (=> b!1063252 m!981483))

(declare-fun m!981485 () Bool)

(assert (=> b!1063253 m!981485))

(declare-fun m!981487 () Bool)

(assert (=> b!1063253 m!981487))

(declare-fun m!981489 () Bool)

(assert (=> b!1063253 m!981489))

(declare-fun m!981491 () Bool)

(assert (=> b!1063256 m!981491))

(declare-fun m!981493 () Bool)

(assert (=> b!1063256 m!981493))

(check-sat tp_is_empty!25267 (not b!1063254) (not b!1063256) (not b!1063255) b_and!34163 (not b!1063253) (not start!94014) (not mapNonEmpty!39577) (not b_next!21457) (not b!1063252))
(check-sat b_and!34163 (not b_next!21457))
