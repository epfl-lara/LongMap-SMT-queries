; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93946 () Bool)

(assert start!93946)

(declare-fun b_free!21405 () Bool)

(declare-fun b_next!21405 () Bool)

(assert (=> start!93946 (= b_free!21405 (not b_next!21405))))

(declare-fun tp!75640 () Bool)

(declare-fun b_and!34127 () Bool)

(assert (=> start!93946 (= tp!75640 b_and!34127)))

(declare-fun b!1062544 () Bool)

(declare-fun e!605272 () Bool)

(declare-fun e!605271 () Bool)

(assert (=> b!1062544 (= e!605272 e!605271)))

(declare-fun res!709499 () Bool)

(assert (=> b!1062544 (=> res!709499 e!605271)))

(declare-datatypes ((V!38755 0))(
  ( (V!38756 (val!12658 Int)) )
))
(declare-datatypes ((tuple2!16016 0))(
  ( (tuple2!16017 (_1!8019 (_ BitVec 64)) (_2!8019 V!38755)) )
))
(declare-datatypes ((List!22597 0))(
  ( (Nil!22594) (Cons!22593 (h!23802 tuple2!16016) (t!31908 List!22597)) )
))
(declare-datatypes ((ListLongMap!13985 0))(
  ( (ListLongMap!13986 (toList!7008 List!22597)) )
))
(declare-fun lt!468159 () ListLongMap!13985)

(declare-fun contains!6239 (ListLongMap!13985 (_ BitVec 64)) Bool)

(assert (=> b!1062544 (= res!709499 (contains!6239 lt!468159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38755)

(declare-datatypes ((ValueCell!11904 0))(
  ( (ValueCellFull!11904 (v!15268 V!38755)) (EmptyCell!11904) )
))
(declare-datatypes ((array!67433 0))(
  ( (array!67434 (arr!32423 (Array (_ BitVec 32) ValueCell!11904)) (size!32959 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67433)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38755)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67435 0))(
  ( (array!67436 (arr!32424 (Array (_ BitVec 32) (_ BitVec 64))) (size!32960 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67435)

(declare-fun getCurrentListMap!3992 (array!67435 array!67433 (_ BitVec 32) (_ BitVec 32) V!38755 V!38755 (_ BitVec 32) Int) ListLongMap!13985)

(assert (=> b!1062544 (= lt!468159 (getCurrentListMap!3992 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062545 () Bool)

(declare-fun res!709501 () Bool)

(declare-fun e!605273 () Bool)

(assert (=> b!1062545 (=> (not res!709501) (not e!605273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67435 (_ BitVec 32)) Bool)

(assert (=> b!1062545 (= res!709501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39496 () Bool)

(declare-fun mapRes!39496 () Bool)

(declare-fun tp!75641 () Bool)

(declare-fun e!605269 () Bool)

(assert (=> mapNonEmpty!39496 (= mapRes!39496 (and tp!75641 e!605269))))

(declare-fun mapRest!39496 () (Array (_ BitVec 32) ValueCell!11904))

(declare-fun mapValue!39496 () ValueCell!11904)

(declare-fun mapKey!39496 () (_ BitVec 32))

(assert (=> mapNonEmpty!39496 (= (arr!32423 _values!955) (store mapRest!39496 mapKey!39496 mapValue!39496))))

(declare-fun b!1062546 () Bool)

(assert (=> b!1062546 (= e!605273 (not e!605272))))

(declare-fun res!709498 () Bool)

(assert (=> b!1062546 (=> res!709498 e!605272)))

(assert (=> b!1062546 (= res!709498 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468157 () ListLongMap!13985)

(declare-fun lt!468160 () ListLongMap!13985)

(assert (=> b!1062546 (= lt!468157 lt!468160)))

(declare-datatypes ((Unit!34814 0))(
  ( (Unit!34815) )
))
(declare-fun lt!468158 () Unit!34814)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38755)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!640 (array!67435 array!67433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38755 V!38755 V!38755 V!38755 (_ BitVec 32) Int) Unit!34814)

(assert (=> b!1062546 (= lt!468158 (lemmaNoChangeToArrayThenSameMapNoExtras!640 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3603 (array!67435 array!67433 (_ BitVec 32) (_ BitVec 32) V!38755 V!38755 (_ BitVec 32) Int) ListLongMap!13985)

(assert (=> b!1062546 (= lt!468160 (getCurrentListMapNoExtraKeys!3603 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062546 (= lt!468157 (getCurrentListMapNoExtraKeys!3603 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062547 () Bool)

(declare-fun e!605275 () Bool)

(declare-fun tp_is_empty!25215 () Bool)

(assert (=> b!1062547 (= e!605275 tp_is_empty!25215)))

(declare-fun b!1062548 () Bool)

(declare-fun e!605274 () Bool)

(assert (=> b!1062548 (= e!605274 (and e!605275 mapRes!39496))))

(declare-fun condMapEmpty!39496 () Bool)

(declare-fun mapDefault!39496 () ValueCell!11904)

(assert (=> b!1062548 (= condMapEmpty!39496 (= (arr!32423 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11904)) mapDefault!39496)))))

(declare-fun b!1062549 () Bool)

(declare-fun res!709500 () Bool)

(assert (=> b!1062549 (=> (not res!709500) (not e!605273))))

(assert (=> b!1062549 (= res!709500 (and (= (size!32959 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32960 _keys!1163) (size!32959 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062550 () Bool)

(assert (=> b!1062550 (= e!605271 true)))

(declare-fun -!572 (ListLongMap!13985 (_ BitVec 64)) ListLongMap!13985)

(assert (=> b!1062550 (= (-!572 lt!468159 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468159)))

(declare-fun lt!468161 () Unit!34814)

(declare-fun removeNotPresentStillSame!19 (ListLongMap!13985 (_ BitVec 64)) Unit!34814)

(assert (=> b!1062550 (= lt!468161 (removeNotPresentStillSame!19 lt!468159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062551 () Bool)

(assert (=> b!1062551 (= e!605269 tp_is_empty!25215)))

(declare-fun res!709497 () Bool)

(assert (=> start!93946 (=> (not res!709497) (not e!605273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93946 (= res!709497 (validMask!0 mask!1515))))

(assert (=> start!93946 e!605273))

(assert (=> start!93946 true))

(assert (=> start!93946 tp_is_empty!25215))

(declare-fun array_inv!25118 (array!67433) Bool)

(assert (=> start!93946 (and (array_inv!25118 _values!955) e!605274)))

(assert (=> start!93946 tp!75640))

(declare-fun array_inv!25119 (array!67435) Bool)

(assert (=> start!93946 (array_inv!25119 _keys!1163)))

(declare-fun mapIsEmpty!39496 () Bool)

(assert (=> mapIsEmpty!39496 mapRes!39496))

(declare-fun b!1062552 () Bool)

(declare-fun res!709502 () Bool)

(assert (=> b!1062552 (=> (not res!709502) (not e!605273))))

(declare-datatypes ((List!22598 0))(
  ( (Nil!22595) (Cons!22594 (h!23803 (_ BitVec 64)) (t!31909 List!22598)) )
))
(declare-fun arrayNoDuplicates!0 (array!67435 (_ BitVec 32) List!22598) Bool)

(assert (=> b!1062552 (= res!709502 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22595))))

(assert (= (and start!93946 res!709497) b!1062549))

(assert (= (and b!1062549 res!709500) b!1062545))

(assert (= (and b!1062545 res!709501) b!1062552))

(assert (= (and b!1062552 res!709502) b!1062546))

(assert (= (and b!1062546 (not res!709498)) b!1062544))

(assert (= (and b!1062544 (not res!709499)) b!1062550))

(assert (= (and b!1062548 condMapEmpty!39496) mapIsEmpty!39496))

(assert (= (and b!1062548 (not condMapEmpty!39496)) mapNonEmpty!39496))

(get-info :version)

(assert (= (and mapNonEmpty!39496 ((_ is ValueCellFull!11904) mapValue!39496)) b!1062551))

(assert (= (and b!1062548 ((_ is ValueCellFull!11904) mapDefault!39496)) b!1062547))

(assert (= start!93946 b!1062548))

(declare-fun m!981293 () Bool)

(assert (=> start!93946 m!981293))

(declare-fun m!981295 () Bool)

(assert (=> start!93946 m!981295))

(declare-fun m!981297 () Bool)

(assert (=> start!93946 m!981297))

(declare-fun m!981299 () Bool)

(assert (=> b!1062552 m!981299))

(declare-fun m!981301 () Bool)

(assert (=> b!1062550 m!981301))

(declare-fun m!981303 () Bool)

(assert (=> b!1062550 m!981303))

(declare-fun m!981305 () Bool)

(assert (=> mapNonEmpty!39496 m!981305))

(declare-fun m!981307 () Bool)

(assert (=> b!1062544 m!981307))

(declare-fun m!981309 () Bool)

(assert (=> b!1062544 m!981309))

(declare-fun m!981311 () Bool)

(assert (=> b!1062545 m!981311))

(declare-fun m!981313 () Bool)

(assert (=> b!1062546 m!981313))

(declare-fun m!981315 () Bool)

(assert (=> b!1062546 m!981315))

(declare-fun m!981317 () Bool)

(assert (=> b!1062546 m!981317))

(check-sat (not b!1062550) (not b!1062552) (not b!1062545) (not b!1062544) tp_is_empty!25215 (not start!93946) (not b!1062546) b_and!34127 (not b_next!21405) (not mapNonEmpty!39496))
(check-sat b_and!34127 (not b_next!21405))
