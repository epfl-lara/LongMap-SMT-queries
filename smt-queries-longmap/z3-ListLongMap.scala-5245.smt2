; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70550 () Bool)

(assert start!70550)

(declare-fun b_free!12877 () Bool)

(declare-fun b_next!12877 () Bool)

(assert (=> start!70550 (= b_free!12877 (not b_next!12877))))

(declare-fun tp!45367 () Bool)

(declare-fun b_and!21693 () Bool)

(assert (=> start!70550 (= tp!45367 b_and!21693)))

(declare-fun mapNonEmpty!23482 () Bool)

(declare-fun mapRes!23482 () Bool)

(declare-fun tp!45366 () Bool)

(declare-fun e!455180 () Bool)

(assert (=> mapNonEmpty!23482 (= mapRes!23482 (and tp!45366 e!455180))))

(declare-datatypes ((V!24451 0))(
  ( (V!24452 (val!7341 Int)) )
))
(declare-datatypes ((ValueCell!6878 0))(
  ( (ValueCellFull!6878 (v!9765 V!24451)) (EmptyCell!6878) )
))
(declare-fun mapValue!23482 () ValueCell!6878)

(declare-fun mapRest!23482 () (Array (_ BitVec 32) ValueCell!6878))

(declare-fun mapKey!23482 () (_ BitVec 32))

(declare-datatypes ((array!45347 0))(
  ( (array!45348 (arr!21727 (Array (_ BitVec 32) ValueCell!6878)) (size!22148 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45347)

(assert (=> mapNonEmpty!23482 (= (arr!21727 _values!788) (store mapRest!23482 mapKey!23482 mapValue!23482))))

(declare-fun b!819546 () Bool)

(declare-fun e!455177 () Bool)

(declare-fun tp_is_empty!14587 () Bool)

(assert (=> b!819546 (= e!455177 tp_is_empty!14587)))

(declare-fun mapIsEmpty!23482 () Bool)

(assert (=> mapIsEmpty!23482 mapRes!23482))

(declare-fun b!819547 () Bool)

(assert (=> b!819547 (= e!455180 tp_is_empty!14587)))

(declare-fun b!819548 () Bool)

(declare-fun res!559288 () Bool)

(declare-fun e!455176 () Bool)

(assert (=> b!819548 (=> (not res!559288) (not e!455176))))

(declare-datatypes ((array!45349 0))(
  ( (array!45350 (arr!21728 (Array (_ BitVec 32) (_ BitVec 64))) (size!22149 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45349)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45349 (_ BitVec 32)) Bool)

(assert (=> b!819548 (= res!559288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819549 () Bool)

(declare-fun e!455181 () Bool)

(assert (=> b!819549 (= e!455176 (not e!455181))))

(declare-fun res!559285 () Bool)

(assert (=> b!819549 (=> res!559285 e!455181)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819549 (= res!559285 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9684 0))(
  ( (tuple2!9685 (_1!4853 (_ BitVec 64)) (_2!4853 V!24451)) )
))
(declare-datatypes ((List!15503 0))(
  ( (Nil!15500) (Cons!15499 (h!16628 tuple2!9684) (t!21825 List!15503)) )
))
(declare-datatypes ((ListLongMap!8497 0))(
  ( (ListLongMap!8498 (toList!4264 List!15503)) )
))
(declare-fun lt!367859 () ListLongMap!8497)

(declare-fun lt!367862 () ListLongMap!8497)

(assert (=> b!819549 (= lt!367859 lt!367862)))

(declare-fun zeroValueBefore!34 () V!24451)

(declare-fun zeroValueAfter!34 () V!24451)

(declare-fun minValue!754 () V!24451)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27955 0))(
  ( (Unit!27956) )
))
(declare-fun lt!367861 () Unit!27955)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!411 (array!45349 array!45347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 V!24451 V!24451 (_ BitVec 32) Int) Unit!27955)

(assert (=> b!819549 (= lt!367861 (lemmaNoChangeToArrayThenSameMapNoExtras!411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2318 (array!45349 array!45347 (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 (_ BitVec 32) Int) ListLongMap!8497)

(assert (=> b!819549 (= lt!367862 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819549 (= lt!367859 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819550 () Bool)

(declare-fun res!559284 () Bool)

(assert (=> b!819550 (=> (not res!559284) (not e!455176))))

(declare-datatypes ((List!15504 0))(
  ( (Nil!15501) (Cons!15500 (h!16629 (_ BitVec 64)) (t!21826 List!15504)) )
))
(declare-fun arrayNoDuplicates!0 (array!45349 (_ BitVec 32) List!15504) Bool)

(assert (=> b!819550 (= res!559284 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15501))))

(declare-fun b!819551 () Bool)

(declare-fun res!559286 () Bool)

(assert (=> b!819551 (=> (not res!559286) (not e!455176))))

(assert (=> b!819551 (= res!559286 (and (= (size!22148 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22149 _keys!976) (size!22148 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819552 () Bool)

(declare-fun e!455179 () Bool)

(assert (=> b!819552 (= e!455179 (and e!455177 mapRes!23482))))

(declare-fun condMapEmpty!23482 () Bool)

(declare-fun mapDefault!23482 () ValueCell!6878)

(assert (=> b!819552 (= condMapEmpty!23482 (= (arr!21727 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6878)) mapDefault!23482)))))

(declare-fun b!819553 () Bool)

(assert (=> b!819553 (= e!455181 true)))

(declare-fun lt!367860 () tuple2!9684)

(declare-fun lt!367856 () ListLongMap!8497)

(declare-fun lt!367863 () tuple2!9684)

(declare-fun +!1885 (ListLongMap!8497 tuple2!9684) ListLongMap!8497)

(assert (=> b!819553 (= lt!367856 (+!1885 (+!1885 lt!367862 lt!367863) lt!367860))))

(declare-fun lt!367857 () ListLongMap!8497)

(assert (=> b!819553 (= (+!1885 lt!367859 lt!367860) (+!1885 lt!367857 lt!367860))))

(declare-fun lt!367854 () Unit!27955)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!200 (ListLongMap!8497 (_ BitVec 64) V!24451 V!24451) Unit!27955)

(assert (=> b!819553 (= lt!367854 (addSameAsAddTwiceSameKeyDiffValues!200 lt!367859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819553 (= lt!367860 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455178 () Bool)

(assert (=> b!819553 e!455178))

(declare-fun res!559283 () Bool)

(assert (=> b!819553 (=> (not res!559283) (not e!455178))))

(declare-fun lt!367855 () ListLongMap!8497)

(assert (=> b!819553 (= res!559283 (= lt!367855 lt!367857))))

(assert (=> b!819553 (= lt!367857 (+!1885 lt!367859 lt!367863))))

(assert (=> b!819553 (= lt!367863 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367858 () ListLongMap!8497)

(declare-fun getCurrentListMap!2413 (array!45349 array!45347 (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 (_ BitVec 32) Int) ListLongMap!8497)

(assert (=> b!819553 (= lt!367858 (getCurrentListMap!2413 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819553 (= lt!367855 (getCurrentListMap!2413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559287 () Bool)

(assert (=> start!70550 (=> (not res!559287) (not e!455176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70550 (= res!559287 (validMask!0 mask!1312))))

(assert (=> start!70550 e!455176))

(assert (=> start!70550 tp_is_empty!14587))

(declare-fun array_inv!17435 (array!45349) Bool)

(assert (=> start!70550 (array_inv!17435 _keys!976)))

(assert (=> start!70550 true))

(declare-fun array_inv!17436 (array!45347) Bool)

(assert (=> start!70550 (and (array_inv!17436 _values!788) e!455179)))

(assert (=> start!70550 tp!45367))

(declare-fun b!819545 () Bool)

(assert (=> b!819545 (= e!455178 (= lt!367858 (+!1885 lt!367862 (tuple2!9685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70550 res!559287) b!819551))

(assert (= (and b!819551 res!559286) b!819548))

(assert (= (and b!819548 res!559288) b!819550))

(assert (= (and b!819550 res!559284) b!819549))

(assert (= (and b!819549 (not res!559285)) b!819553))

(assert (= (and b!819553 res!559283) b!819545))

(assert (= (and b!819552 condMapEmpty!23482) mapIsEmpty!23482))

(assert (= (and b!819552 (not condMapEmpty!23482)) mapNonEmpty!23482))

(get-info :version)

(assert (= (and mapNonEmpty!23482 ((_ is ValueCellFull!6878) mapValue!23482)) b!819547))

(assert (= (and b!819552 ((_ is ValueCellFull!6878) mapDefault!23482)) b!819546))

(assert (= start!70550 b!819552))

(declare-fun m!760779 () Bool)

(assert (=> b!819549 m!760779))

(declare-fun m!760781 () Bool)

(assert (=> b!819549 m!760781))

(declare-fun m!760783 () Bool)

(assert (=> b!819549 m!760783))

(declare-fun m!760785 () Bool)

(assert (=> b!819553 m!760785))

(declare-fun m!760787 () Bool)

(assert (=> b!819553 m!760787))

(declare-fun m!760789 () Bool)

(assert (=> b!819553 m!760789))

(declare-fun m!760791 () Bool)

(assert (=> b!819553 m!760791))

(declare-fun m!760793 () Bool)

(assert (=> b!819553 m!760793))

(declare-fun m!760795 () Bool)

(assert (=> b!819553 m!760795))

(declare-fun m!760797 () Bool)

(assert (=> b!819553 m!760797))

(declare-fun m!760799 () Bool)

(assert (=> b!819553 m!760799))

(assert (=> b!819553 m!760787))

(declare-fun m!760801 () Bool)

(assert (=> start!70550 m!760801))

(declare-fun m!760803 () Bool)

(assert (=> start!70550 m!760803))

(declare-fun m!760805 () Bool)

(assert (=> start!70550 m!760805))

(declare-fun m!760807 () Bool)

(assert (=> mapNonEmpty!23482 m!760807))

(declare-fun m!760809 () Bool)

(assert (=> b!819550 m!760809))

(declare-fun m!760811 () Bool)

(assert (=> b!819545 m!760811))

(declare-fun m!760813 () Bool)

(assert (=> b!819548 m!760813))

(check-sat (not b_next!12877) (not b!819545) b_and!21693 (not b!819548) (not start!70550) (not b!819549) (not b!819553) (not b!819550) (not mapNonEmpty!23482) tp_is_empty!14587)
(check-sat b_and!21693 (not b_next!12877))
