; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94150 () Bool)

(assert start!94150)

(declare-fun b_free!21373 () Bool)

(declare-fun b_next!21373 () Bool)

(assert (=> start!94150 (= b_free!21373 (not b_next!21373))))

(declare-fun tp!75545 () Bool)

(declare-fun b_and!34105 () Bool)

(assert (=> start!94150 (= tp!75545 b_and!34105)))

(declare-fun b!1063440 () Bool)

(declare-fun e!605791 () Bool)

(declare-fun e!605794 () Bool)

(assert (=> b!1063440 (= e!605791 (not e!605794))))

(declare-fun res!709731 () Bool)

(assert (=> b!1063440 (=> res!709731 e!605794)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063440 (= res!709731 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38713 0))(
  ( (V!38714 (val!12642 Int)) )
))
(declare-datatypes ((tuple2!15972 0))(
  ( (tuple2!15973 (_1!7997 (_ BitVec 64)) (_2!7997 V!38713)) )
))
(declare-datatypes ((List!22558 0))(
  ( (Nil!22555) (Cons!22554 (h!23772 tuple2!15972) (t!31861 List!22558)) )
))
(declare-datatypes ((ListLongMap!13949 0))(
  ( (ListLongMap!13950 (toList!6990 List!22558)) )
))
(declare-fun lt!468435 () ListLongMap!13949)

(declare-fun lt!468434 () ListLongMap!13949)

(assert (=> b!1063440 (= lt!468435 lt!468434)))

(declare-fun zeroValueBefore!47 () V!38713)

(declare-datatypes ((Unit!34785 0))(
  ( (Unit!34786) )
))
(declare-fun lt!468432 () Unit!34785)

(declare-datatypes ((ValueCell!11888 0))(
  ( (ValueCellFull!11888 (v!15248 V!38713)) (EmptyCell!11888) )
))
(declare-datatypes ((array!67413 0))(
  ( (array!67414 (arr!32407 (Array (_ BitVec 32) ValueCell!11888)) (size!32944 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67413)

(declare-fun minValue!907 () V!38713)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38713)

(declare-datatypes ((array!67415 0))(
  ( (array!67416 (arr!32408 (Array (_ BitVec 32) (_ BitVec 64))) (size!32945 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67415)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!640 (array!67415 array!67413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 V!38713 V!38713 (_ BitVec 32) Int) Unit!34785)

(assert (=> b!1063440 (= lt!468432 (lemmaNoChangeToArrayThenSameMapNoExtras!640 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3637 (array!67415 array!67413 (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 (_ BitVec 32) Int) ListLongMap!13949)

(assert (=> b!1063440 (= lt!468434 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063440 (= lt!468435 (getCurrentListMapNoExtraKeys!3637 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39448 () Bool)

(declare-fun mapRes!39448 () Bool)

(assert (=> mapIsEmpty!39448 mapRes!39448))

(declare-fun b!1063441 () Bool)

(declare-fun e!605790 () Bool)

(assert (=> b!1063441 (= e!605790 true)))

(declare-fun lt!468436 () ListLongMap!13949)

(declare-fun -!555 (ListLongMap!13949 (_ BitVec 64)) ListLongMap!13949)

(assert (=> b!1063441 (= (-!555 lt!468436 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468436)))

(declare-fun lt!468433 () Unit!34785)

(declare-fun removeNotPresentStillSame!6 (ListLongMap!13949 (_ BitVec 64)) Unit!34785)

(assert (=> b!1063441 (= lt!468433 (removeNotPresentStillSame!6 lt!468436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063442 () Bool)

(assert (=> b!1063442 (= e!605794 e!605790)))

(declare-fun res!709734 () Bool)

(assert (=> b!1063442 (=> res!709734 e!605790)))

(declare-fun contains!6249 (ListLongMap!13949 (_ BitVec 64)) Bool)

(assert (=> b!1063442 (= res!709734 (contains!6249 lt!468436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3975 (array!67415 array!67413 (_ BitVec 32) (_ BitVec 32) V!38713 V!38713 (_ BitVec 32) Int) ListLongMap!13949)

(assert (=> b!1063442 (= lt!468436 (getCurrentListMap!3975 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063443 () Bool)

(declare-fun res!709733 () Bool)

(assert (=> b!1063443 (=> (not res!709733) (not e!605791))))

(assert (=> b!1063443 (= res!709733 (and (= (size!32944 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32945 _keys!1163) (size!32944 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063444 () Bool)

(declare-fun res!709735 () Bool)

(assert (=> b!1063444 (=> (not res!709735) (not e!605791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67415 (_ BitVec 32)) Bool)

(assert (=> b!1063444 (= res!709735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063445 () Bool)

(declare-fun e!605788 () Bool)

(declare-fun tp_is_empty!25183 () Bool)

(assert (=> b!1063445 (= e!605788 tp_is_empty!25183)))

(declare-fun b!1063446 () Bool)

(declare-fun e!605793 () Bool)

(assert (=> b!1063446 (= e!605793 (and e!605788 mapRes!39448))))

(declare-fun condMapEmpty!39448 () Bool)

(declare-fun mapDefault!39448 () ValueCell!11888)

(assert (=> b!1063446 (= condMapEmpty!39448 (= (arr!32407 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11888)) mapDefault!39448)))))

(declare-fun b!1063447 () Bool)

(declare-fun e!605789 () Bool)

(assert (=> b!1063447 (= e!605789 tp_is_empty!25183)))

(declare-fun mapNonEmpty!39448 () Bool)

(declare-fun tp!75544 () Bool)

(assert (=> mapNonEmpty!39448 (= mapRes!39448 (and tp!75544 e!605789))))

(declare-fun mapRest!39448 () (Array (_ BitVec 32) ValueCell!11888))

(declare-fun mapValue!39448 () ValueCell!11888)

(declare-fun mapKey!39448 () (_ BitVec 32))

(assert (=> mapNonEmpty!39448 (= (arr!32407 _values!955) (store mapRest!39448 mapKey!39448 mapValue!39448))))

(declare-fun res!709732 () Bool)

(assert (=> start!94150 (=> (not res!709732) (not e!605791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94150 (= res!709732 (validMask!0 mask!1515))))

(assert (=> start!94150 e!605791))

(assert (=> start!94150 true))

(assert (=> start!94150 tp_is_empty!25183))

(declare-fun array_inv!25124 (array!67413) Bool)

(assert (=> start!94150 (and (array_inv!25124 _values!955) e!605793)))

(assert (=> start!94150 tp!75545))

(declare-fun array_inv!25125 (array!67415) Bool)

(assert (=> start!94150 (array_inv!25125 _keys!1163)))

(declare-fun b!1063439 () Bool)

(declare-fun res!709736 () Bool)

(assert (=> b!1063439 (=> (not res!709736) (not e!605791))))

(declare-datatypes ((List!22559 0))(
  ( (Nil!22556) (Cons!22555 (h!23773 (_ BitVec 64)) (t!31862 List!22559)) )
))
(declare-fun arrayNoDuplicates!0 (array!67415 (_ BitVec 32) List!22559) Bool)

(assert (=> b!1063439 (= res!709736 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22556))))

(assert (= (and start!94150 res!709732) b!1063443))

(assert (= (and b!1063443 res!709733) b!1063444))

(assert (= (and b!1063444 res!709735) b!1063439))

(assert (= (and b!1063439 res!709736) b!1063440))

(assert (= (and b!1063440 (not res!709731)) b!1063442))

(assert (= (and b!1063442 (not res!709734)) b!1063441))

(assert (= (and b!1063446 condMapEmpty!39448) mapIsEmpty!39448))

(assert (= (and b!1063446 (not condMapEmpty!39448)) mapNonEmpty!39448))

(get-info :version)

(assert (= (and mapNonEmpty!39448 ((_ is ValueCellFull!11888) mapValue!39448)) b!1063447))

(assert (= (and b!1063446 ((_ is ValueCellFull!11888) mapDefault!39448)) b!1063445))

(assert (= start!94150 b!1063446))

(declare-fun m!982549 () Bool)

(assert (=> b!1063439 m!982549))

(declare-fun m!982551 () Bool)

(assert (=> b!1063442 m!982551))

(declare-fun m!982553 () Bool)

(assert (=> b!1063442 m!982553))

(declare-fun m!982555 () Bool)

(assert (=> b!1063444 m!982555))

(declare-fun m!982557 () Bool)

(assert (=> start!94150 m!982557))

(declare-fun m!982559 () Bool)

(assert (=> start!94150 m!982559))

(declare-fun m!982561 () Bool)

(assert (=> start!94150 m!982561))

(declare-fun m!982563 () Bool)

(assert (=> b!1063440 m!982563))

(declare-fun m!982565 () Bool)

(assert (=> b!1063440 m!982565))

(declare-fun m!982567 () Bool)

(assert (=> b!1063440 m!982567))

(declare-fun m!982569 () Bool)

(assert (=> b!1063441 m!982569))

(declare-fun m!982571 () Bool)

(assert (=> b!1063441 m!982571))

(declare-fun m!982573 () Bool)

(assert (=> mapNonEmpty!39448 m!982573))

(check-sat (not b!1063439) (not b!1063441) (not b_next!21373) b_and!34105 (not b!1063440) tp_is_empty!25183 (not mapNonEmpty!39448) (not b!1063442) (not b!1063444) (not start!94150))
(check-sat b_and!34105 (not b_next!21373))
