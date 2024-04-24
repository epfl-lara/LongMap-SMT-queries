; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95046 () Bool)

(assert start!95046)

(declare-fun b_free!22039 () Bool)

(declare-fun b_next!22039 () Bool)

(assert (=> start!95046 (= b_free!22039 (not b_next!22039))))

(declare-fun tp!77579 () Bool)

(declare-fun b_and!34891 () Bool)

(assert (=> start!95046 (= tp!77579 b_and!34891)))

(declare-fun res!715615 () Bool)

(declare-fun e!613080 () Bool)

(assert (=> start!95046 (=> (not res!715615) (not e!613080))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95046 (= res!715615 (validMask!0 mask!1515))))

(assert (=> start!95046 e!613080))

(assert (=> start!95046 true))

(declare-fun tp_is_empty!25849 () Bool)

(assert (=> start!95046 tp_is_empty!25849))

(declare-datatypes ((V!39601 0))(
  ( (V!39602 (val!12975 Int)) )
))
(declare-datatypes ((ValueCell!12221 0))(
  ( (ValueCellFull!12221 (v!15588 V!39601)) (EmptyCell!12221) )
))
(declare-datatypes ((array!68711 0))(
  ( (array!68712 (arr!33044 (Array (_ BitVec 32) ValueCell!12221)) (size!33581 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68711)

(declare-fun e!613078 () Bool)

(declare-fun array_inv!25578 (array!68711) Bool)

(assert (=> start!95046 (and (array_inv!25578 _values!955) e!613078)))

(assert (=> start!95046 tp!77579))

(declare-datatypes ((array!68713 0))(
  ( (array!68714 (arr!33045 (Array (_ BitVec 32) (_ BitVec 64))) (size!33582 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68713)

(declare-fun array_inv!25579 (array!68713) Bool)

(assert (=> start!95046 (array_inv!25579 _keys!1163)))

(declare-fun b!1073350 () Bool)

(declare-fun e!613076 () Bool)

(assert (=> b!1073350 (= e!613080 (not e!613076))))

(declare-fun res!715614 () Bool)

(assert (=> b!1073350 (=> res!715614 e!613076)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073350 (= res!715614 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16490 0))(
  ( (tuple2!16491 (_1!8256 (_ BitVec 64)) (_2!8256 V!39601)) )
))
(declare-datatypes ((List!23049 0))(
  ( (Nil!23046) (Cons!23045 (h!24263 tuple2!16490) (t!32376 List!23049)) )
))
(declare-datatypes ((ListLongMap!14467 0))(
  ( (ListLongMap!14468 (toList!7249 List!23049)) )
))
(declare-fun lt!475318 () ListLongMap!14467)

(declare-fun lt!475326 () ListLongMap!14467)

(assert (=> b!1073350 (= lt!475318 lt!475326)))

(declare-fun zeroValueBefore!47 () V!39601)

(declare-fun minValue!907 () V!39601)

(declare-datatypes ((Unit!35283 0))(
  ( (Unit!35284) )
))
(declare-fun lt!475325 () Unit!35283)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39601)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!856 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 V!39601 V!39601 (_ BitVec 32) Int) Unit!35283)

(assert (=> b!1073350 (= lt!475325 (lemmaNoChangeToArrayThenSameMapNoExtras!856 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3853 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1073350 (= lt!475326 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073350 (= lt!475318 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073351 () Bool)

(declare-fun e!613079 () Bool)

(assert (=> b!1073351 (= e!613079 tp_is_empty!25849)))

(declare-fun mapNonEmpty!40483 () Bool)

(declare-fun mapRes!40483 () Bool)

(declare-fun tp!77578 () Bool)

(assert (=> mapNonEmpty!40483 (= mapRes!40483 (and tp!77578 e!613079))))

(declare-fun mapRest!40483 () (Array (_ BitVec 32) ValueCell!12221))

(declare-fun mapKey!40483 () (_ BitVec 32))

(declare-fun mapValue!40483 () ValueCell!12221)

(assert (=> mapNonEmpty!40483 (= (arr!33044 _values!955) (store mapRest!40483 mapKey!40483 mapValue!40483))))

(declare-fun b!1073352 () Bool)

(declare-fun e!613082 () Bool)

(assert (=> b!1073352 (= e!613082 tp_is_empty!25849)))

(declare-fun b!1073353 () Bool)

(declare-fun res!715618 () Bool)

(assert (=> b!1073353 (=> (not res!715618) (not e!613080))))

(declare-datatypes ((List!23050 0))(
  ( (Nil!23047) (Cons!23046 (h!24264 (_ BitVec 64)) (t!32377 List!23050)) )
))
(declare-fun arrayNoDuplicates!0 (array!68713 (_ BitVec 32) List!23050) Bool)

(assert (=> b!1073353 (= res!715618 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23047))))

(declare-fun b!1073354 () Bool)

(assert (=> b!1073354 (= e!613078 (and e!613082 mapRes!40483))))

(declare-fun condMapEmpty!40483 () Bool)

(declare-fun mapDefault!40483 () ValueCell!12221)

(assert (=> b!1073354 (= condMapEmpty!40483 (= (arr!33044 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12221)) mapDefault!40483)))))

(declare-fun b!1073355 () Bool)

(declare-fun res!715613 () Bool)

(assert (=> b!1073355 (=> (not res!715613) (not e!613080))))

(assert (=> b!1073355 (= res!715613 (and (= (size!33581 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33582 _keys!1163) (size!33581 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613081 () Bool)

(declare-fun lt!475322 () tuple2!16490)

(declare-fun lt!475321 () ListLongMap!14467)

(declare-fun b!1073356 () Bool)

(declare-fun +!3212 (ListLongMap!14467 tuple2!16490) ListLongMap!14467)

(assert (=> b!1073356 (= e!613081 (= lt!475321 (+!3212 lt!475326 lt!475322)))))

(declare-fun mapIsEmpty!40483 () Bool)

(assert (=> mapIsEmpty!40483 mapRes!40483))

(declare-fun b!1073357 () Bool)

(assert (=> b!1073357 (= e!613076 true)))

(declare-fun lt!475327 () ListLongMap!14467)

(declare-fun lt!475323 () ListLongMap!14467)

(declare-fun -!682 (ListLongMap!14467 (_ BitVec 64)) ListLongMap!14467)

(assert (=> b!1073357 (= lt!475327 (-!682 lt!475323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475328 () ListLongMap!14467)

(declare-fun lt!475324 () ListLongMap!14467)

(assert (=> b!1073357 (= lt!475328 lt!475324)))

(declare-fun lt!475319 () Unit!35283)

(declare-fun addCommutativeForDiffKeys!739 (ListLongMap!14467 (_ BitVec 64) V!39601 (_ BitVec 64) V!39601) Unit!35283)

(assert (=> b!1073357 (= lt!475319 (addCommutativeForDiffKeys!739 lt!475318 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475317 () ListLongMap!14467)

(assert (=> b!1073357 (= (-!682 lt!475324 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475317)))

(declare-fun lt!475316 () tuple2!16490)

(assert (=> b!1073357 (= lt!475324 (+!3212 lt!475317 lt!475316))))

(declare-fun lt!475320 () Unit!35283)

(declare-fun addThenRemoveForNewKeyIsSame!57 (ListLongMap!14467 (_ BitVec 64) V!39601) Unit!35283)

(assert (=> b!1073357 (= lt!475320 (addThenRemoveForNewKeyIsSame!57 lt!475317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073357 (= lt!475317 (+!3212 lt!475318 lt!475322))))

(assert (=> b!1073357 e!613081))

(declare-fun res!715617 () Bool)

(assert (=> b!1073357 (=> (not res!715617) (not e!613081))))

(assert (=> b!1073357 (= res!715617 (= lt!475323 lt!475328))))

(assert (=> b!1073357 (= lt!475328 (+!3212 (+!3212 lt!475318 lt!475316) lt!475322))))

(assert (=> b!1073357 (= lt!475322 (tuple2!16491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073357 (= lt!475316 (tuple2!16491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4143 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1073357 (= lt!475321 (getCurrentListMap!4143 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073357 (= lt!475323 (getCurrentListMap!4143 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073358 () Bool)

(declare-fun res!715616 () Bool)

(assert (=> b!1073358 (=> (not res!715616) (not e!613080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68713 (_ BitVec 32)) Bool)

(assert (=> b!1073358 (= res!715616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95046 res!715615) b!1073355))

(assert (= (and b!1073355 res!715613) b!1073358))

(assert (= (and b!1073358 res!715616) b!1073353))

(assert (= (and b!1073353 res!715618) b!1073350))

(assert (= (and b!1073350 (not res!715614)) b!1073357))

(assert (= (and b!1073357 res!715617) b!1073356))

(assert (= (and b!1073354 condMapEmpty!40483) mapIsEmpty!40483))

(assert (= (and b!1073354 (not condMapEmpty!40483)) mapNonEmpty!40483))

(get-info :version)

(assert (= (and mapNonEmpty!40483 ((_ is ValueCellFull!12221) mapValue!40483)) b!1073351))

(assert (= (and b!1073354 ((_ is ValueCellFull!12221) mapDefault!40483)) b!1073352))

(assert (= start!95046 b!1073354))

(declare-fun m!992445 () Bool)

(assert (=> b!1073356 m!992445))

(declare-fun m!992447 () Bool)

(assert (=> start!95046 m!992447))

(declare-fun m!992449 () Bool)

(assert (=> start!95046 m!992449))

(declare-fun m!992451 () Bool)

(assert (=> start!95046 m!992451))

(declare-fun m!992453 () Bool)

(assert (=> b!1073350 m!992453))

(declare-fun m!992455 () Bool)

(assert (=> b!1073350 m!992455))

(declare-fun m!992457 () Bool)

(assert (=> b!1073350 m!992457))

(declare-fun m!992459 () Bool)

(assert (=> b!1073358 m!992459))

(declare-fun m!992461 () Bool)

(assert (=> mapNonEmpty!40483 m!992461))

(declare-fun m!992463 () Bool)

(assert (=> b!1073353 m!992463))

(declare-fun m!992465 () Bool)

(assert (=> b!1073357 m!992465))

(declare-fun m!992467 () Bool)

(assert (=> b!1073357 m!992467))

(declare-fun m!992469 () Bool)

(assert (=> b!1073357 m!992469))

(declare-fun m!992471 () Bool)

(assert (=> b!1073357 m!992471))

(declare-fun m!992473 () Bool)

(assert (=> b!1073357 m!992473))

(declare-fun m!992475 () Bool)

(assert (=> b!1073357 m!992475))

(declare-fun m!992477 () Bool)

(assert (=> b!1073357 m!992477))

(declare-fun m!992479 () Bool)

(assert (=> b!1073357 m!992479))

(assert (=> b!1073357 m!992477))

(declare-fun m!992481 () Bool)

(assert (=> b!1073357 m!992481))

(declare-fun m!992483 () Bool)

(assert (=> b!1073357 m!992483))

(check-sat tp_is_empty!25849 (not b!1073357) (not start!95046) (not b!1073356) (not b!1073353) (not b_next!22039) (not mapNonEmpty!40483) (not b!1073358) (not b!1073350) b_and!34891)
(check-sat b_and!34891 (not b_next!22039))
