; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93932 () Bool)

(assert start!93932)

(declare-fun b_free!21397 () Bool)

(declare-fun b_next!21397 () Bool)

(assert (=> start!93932 (= b_free!21397 (not b_next!21397))))

(declare-fun tp!75616 () Bool)

(declare-fun b_and!34093 () Bool)

(assert (=> start!93932 (= tp!75616 b_and!34093)))

(declare-fun mapIsEmpty!39484 () Bool)

(declare-fun mapRes!39484 () Bool)

(assert (=> mapIsEmpty!39484 mapRes!39484))

(declare-fun b!1062283 () Bool)

(declare-fun e!605093 () Bool)

(declare-fun e!605092 () Bool)

(assert (=> b!1062283 (= e!605093 e!605092)))

(declare-fun res!709359 () Bool)

(assert (=> b!1062283 (=> res!709359 e!605092)))

(declare-datatypes ((V!38745 0))(
  ( (V!38746 (val!12654 Int)) )
))
(declare-datatypes ((tuple2!16076 0))(
  ( (tuple2!16077 (_1!8049 (_ BitVec 64)) (_2!8049 V!38745)) )
))
(declare-datatypes ((List!22628 0))(
  ( (Nil!22625) (Cons!22624 (h!23833 tuple2!16076) (t!31930 List!22628)) )
))
(declare-datatypes ((ListLongMap!14045 0))(
  ( (ListLongMap!14046 (toList!7038 List!22628)) )
))
(declare-fun lt!467900 () ListLongMap!14045)

(declare-fun contains!6207 (ListLongMap!14045 (_ BitVec 64)) Bool)

(assert (=> b!1062283 (= res!709359 (contains!6207 lt!467900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38745)

(declare-datatypes ((ValueCell!11900 0))(
  ( (ValueCellFull!11900 (v!15263 V!38745)) (EmptyCell!11900) )
))
(declare-datatypes ((array!67362 0))(
  ( (array!67363 (arr!32388 (Array (_ BitVec 32) ValueCell!11900)) (size!32926 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67362)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38745)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67364 0))(
  ( (array!67365 (arr!32389 (Array (_ BitVec 32) (_ BitVec 64))) (size!32927 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67364)

(declare-fun getCurrentListMap!3939 (array!67364 array!67362 (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 (_ BitVec 32) Int) ListLongMap!14045)

(assert (=> b!1062283 (= lt!467900 (getCurrentListMap!3939 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062284 () Bool)

(assert (=> b!1062284 (= e!605092 true)))

(declare-fun -!559 (ListLongMap!14045 (_ BitVec 64)) ListLongMap!14045)

(assert (=> b!1062284 (= (-!559 lt!467900 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467900)))

(declare-datatypes ((Unit!34667 0))(
  ( (Unit!34668) )
))
(declare-fun lt!467897 () Unit!34667)

(declare-fun removeNotPresentStillSame!11 (ListLongMap!14045 (_ BitVec 64)) Unit!34667)

(assert (=> b!1062284 (= lt!467897 (removeNotPresentStillSame!11 lt!467900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062285 () Bool)

(declare-fun e!605096 () Bool)

(assert (=> b!1062285 (= e!605096 (not e!605093))))

(declare-fun res!709361 () Bool)

(assert (=> b!1062285 (=> res!709361 e!605093)))

(assert (=> b!1062285 (= res!709361 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467899 () ListLongMap!14045)

(declare-fun lt!467901 () ListLongMap!14045)

(assert (=> b!1062285 (= lt!467899 lt!467901)))

(declare-fun lt!467898 () Unit!34667)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38745)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!643 (array!67364 array!67362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 V!38745 V!38745 (_ BitVec 32) Int) Unit!34667)

(assert (=> b!1062285 (= lt!467898 (lemmaNoChangeToArrayThenSameMapNoExtras!643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3649 (array!67364 array!67362 (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 (_ BitVec 32) Int) ListLongMap!14045)

(assert (=> b!1062285 (= lt!467901 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062285 (= lt!467899 (getCurrentListMapNoExtraKeys!3649 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062286 () Bool)

(declare-fun res!709356 () Bool)

(assert (=> b!1062286 (=> (not res!709356) (not e!605096))))

(declare-datatypes ((List!22629 0))(
  ( (Nil!22626) (Cons!22625 (h!23834 (_ BitVec 64)) (t!31931 List!22629)) )
))
(declare-fun arrayNoDuplicates!0 (array!67364 (_ BitVec 32) List!22629) Bool)

(assert (=> b!1062286 (= res!709356 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22626))))

(declare-fun b!1062287 () Bool)

(declare-fun e!605097 () Bool)

(declare-fun tp_is_empty!25207 () Bool)

(assert (=> b!1062287 (= e!605097 tp_is_empty!25207)))

(declare-fun b!1062288 () Bool)

(declare-fun e!605098 () Bool)

(assert (=> b!1062288 (= e!605098 tp_is_empty!25207)))

(declare-fun b!1062289 () Bool)

(declare-fun res!709360 () Bool)

(assert (=> b!1062289 (=> (not res!709360) (not e!605096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67364 (_ BitVec 32)) Bool)

(assert (=> b!1062289 (= res!709360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39484 () Bool)

(declare-fun tp!75617 () Bool)

(assert (=> mapNonEmpty!39484 (= mapRes!39484 (and tp!75617 e!605097))))

(declare-fun mapRest!39484 () (Array (_ BitVec 32) ValueCell!11900))

(declare-fun mapValue!39484 () ValueCell!11900)

(declare-fun mapKey!39484 () (_ BitVec 32))

(assert (=> mapNonEmpty!39484 (= (arr!32388 _values!955) (store mapRest!39484 mapKey!39484 mapValue!39484))))

(declare-fun res!709357 () Bool)

(assert (=> start!93932 (=> (not res!709357) (not e!605096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93932 (= res!709357 (validMask!0 mask!1515))))

(assert (=> start!93932 e!605096))

(assert (=> start!93932 true))

(assert (=> start!93932 tp_is_empty!25207))

(declare-fun e!605094 () Bool)

(declare-fun array_inv!25094 (array!67362) Bool)

(assert (=> start!93932 (and (array_inv!25094 _values!955) e!605094)))

(assert (=> start!93932 tp!75616))

(declare-fun array_inv!25095 (array!67364) Bool)

(assert (=> start!93932 (array_inv!25095 _keys!1163)))

(declare-fun b!1062290 () Bool)

(declare-fun res!709358 () Bool)

(assert (=> b!1062290 (=> (not res!709358) (not e!605096))))

(assert (=> b!1062290 (= res!709358 (and (= (size!32926 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32927 _keys!1163) (size!32926 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062291 () Bool)

(assert (=> b!1062291 (= e!605094 (and e!605098 mapRes!39484))))

(declare-fun condMapEmpty!39484 () Bool)

(declare-fun mapDefault!39484 () ValueCell!11900)

(assert (=> b!1062291 (= condMapEmpty!39484 (= (arr!32388 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11900)) mapDefault!39484)))))

(assert (= (and start!93932 res!709357) b!1062290))

(assert (= (and b!1062290 res!709358) b!1062289))

(assert (= (and b!1062289 res!709360) b!1062286))

(assert (= (and b!1062286 res!709356) b!1062285))

(assert (= (and b!1062285 (not res!709361)) b!1062283))

(assert (= (and b!1062283 (not res!709359)) b!1062284))

(assert (= (and b!1062291 condMapEmpty!39484) mapIsEmpty!39484))

(assert (= (and b!1062291 (not condMapEmpty!39484)) mapNonEmpty!39484))

(get-info :version)

(assert (= (and mapNonEmpty!39484 ((_ is ValueCellFull!11900) mapValue!39484)) b!1062287))

(assert (= (and b!1062291 ((_ is ValueCellFull!11900) mapDefault!39484)) b!1062288))

(assert (= start!93932 b!1062291))

(declare-fun m!980563 () Bool)

(assert (=> b!1062286 m!980563))

(declare-fun m!980565 () Bool)

(assert (=> b!1062285 m!980565))

(declare-fun m!980567 () Bool)

(assert (=> b!1062285 m!980567))

(declare-fun m!980569 () Bool)

(assert (=> b!1062285 m!980569))

(declare-fun m!980571 () Bool)

(assert (=> b!1062283 m!980571))

(declare-fun m!980573 () Bool)

(assert (=> b!1062283 m!980573))

(declare-fun m!980575 () Bool)

(assert (=> mapNonEmpty!39484 m!980575))

(declare-fun m!980577 () Bool)

(assert (=> start!93932 m!980577))

(declare-fun m!980579 () Bool)

(assert (=> start!93932 m!980579))

(declare-fun m!980581 () Bool)

(assert (=> start!93932 m!980581))

(declare-fun m!980583 () Bool)

(assert (=> b!1062284 m!980583))

(declare-fun m!980585 () Bool)

(assert (=> b!1062284 m!980585))

(declare-fun m!980587 () Bool)

(assert (=> b!1062289 m!980587))

(check-sat (not b!1062286) (not b!1062284) (not start!93932) (not b!1062283) tp_is_empty!25207 b_and!34093 (not b_next!21397) (not b!1062285) (not mapNonEmpty!39484) (not b!1062289))
(check-sat b_and!34093 (not b_next!21397))
