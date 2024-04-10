; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70458 () Bool)

(assert start!70458)

(declare-fun b_free!12801 () Bool)

(declare-fun b_next!12801 () Bool)

(assert (=> start!70458 (= b_free!12801 (not b_next!12801))))

(declare-fun tp!45133 () Bool)

(declare-fun b_and!21621 () Bool)

(assert (=> start!70458 (= tp!45133 b_and!21621)))

(declare-fun b!818427 () Bool)

(declare-fun res!558561 () Bool)

(declare-fun e!454313 () Bool)

(assert (=> b!818427 (=> (not res!558561) (not e!454313))))

(declare-datatypes ((array!45220 0))(
  ( (array!45221 (arr!21665 (Array (_ BitVec 32) (_ BitVec 64))) (size!22086 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45220)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45220 (_ BitVec 32)) Bool)

(assert (=> b!818427 (= res!558561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818428 () Bool)

(declare-fun e!454315 () Bool)

(assert (=> b!818428 (= e!454315 (bvsle #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-datatypes ((V!24349 0))(
  ( (V!24350 (val!7303 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24349)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24349)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6840 0))(
  ( (ValueCellFull!6840 (v!9732 V!24349)) (EmptyCell!6840) )
))
(declare-datatypes ((array!45222 0))(
  ( (array!45223 (arr!21666 (Array (_ BitVec 32) ValueCell!6840)) (size!22087 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45222)

(declare-datatypes ((tuple2!9598 0))(
  ( (tuple2!9599 (_1!4810 (_ BitVec 64)) (_2!4810 V!24349)) )
))
(declare-datatypes ((List!15431 0))(
  ( (Nil!15428) (Cons!15427 (h!16556 tuple2!9598) (t!21758 List!15431)) )
))
(declare-datatypes ((ListLongMap!8421 0))(
  ( (ListLongMap!8422 (toList!4226 List!15431)) )
))
(declare-fun lt!366724 () ListLongMap!8421)

(declare-fun getCurrentListMap!2431 (array!45220 array!45222 (_ BitVec 32) (_ BitVec 32) V!24349 V!24349 (_ BitVec 32) Int) ListLongMap!8421)

(assert (=> b!818428 (= lt!366724 (getCurrentListMap!2431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558560 () Bool)

(assert (=> start!70458 (=> (not res!558560) (not e!454313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70458 (= res!558560 (validMask!0 mask!1312))))

(assert (=> start!70458 e!454313))

(declare-fun tp_is_empty!14511 () Bool)

(assert (=> start!70458 tp_is_empty!14511))

(declare-fun array_inv!17325 (array!45220) Bool)

(assert (=> start!70458 (array_inv!17325 _keys!976)))

(assert (=> start!70458 true))

(declare-fun e!454314 () Bool)

(declare-fun array_inv!17326 (array!45222) Bool)

(assert (=> start!70458 (and (array_inv!17326 _values!788) e!454314)))

(assert (=> start!70458 tp!45133))

(declare-fun b!818429 () Bool)

(declare-fun e!454318 () Bool)

(assert (=> b!818429 (= e!454318 tp_is_empty!14511)))

(declare-fun b!818430 () Bool)

(declare-fun res!558562 () Bool)

(assert (=> b!818430 (=> (not res!558562) (not e!454313))))

(declare-datatypes ((List!15432 0))(
  ( (Nil!15429) (Cons!15428 (h!16557 (_ BitVec 64)) (t!21759 List!15432)) )
))
(declare-fun arrayNoDuplicates!0 (array!45220 (_ BitVec 32) List!15432) Bool)

(assert (=> b!818430 (= res!558562 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15429))))

(declare-fun mapIsEmpty!23362 () Bool)

(declare-fun mapRes!23362 () Bool)

(assert (=> mapIsEmpty!23362 mapRes!23362))

(declare-fun b!818431 () Bool)

(declare-fun e!454317 () Bool)

(assert (=> b!818431 (= e!454317 tp_is_empty!14511)))

(declare-fun b!818432 () Bool)

(assert (=> b!818432 (= e!454313 (not e!454315))))

(declare-fun res!558563 () Bool)

(assert (=> b!818432 (=> res!558563 e!454315)))

(assert (=> b!818432 (= res!558563 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366723 () ListLongMap!8421)

(declare-fun lt!366721 () ListLongMap!8421)

(assert (=> b!818432 (= lt!366723 lt!366721)))

(declare-fun zeroValueAfter!34 () V!24349)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27934 0))(
  ( (Unit!27935) )
))
(declare-fun lt!366722 () Unit!27934)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!376 (array!45220 array!45222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24349 V!24349 V!24349 V!24349 (_ BitVec 32) Int) Unit!27934)

(assert (=> b!818432 (= lt!366722 (lemmaNoChangeToArrayThenSameMapNoExtras!376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2266 (array!45220 array!45222 (_ BitVec 32) (_ BitVec 32) V!24349 V!24349 (_ BitVec 32) Int) ListLongMap!8421)

(assert (=> b!818432 (= lt!366721 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818432 (= lt!366723 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23362 () Bool)

(declare-fun tp!45132 () Bool)

(assert (=> mapNonEmpty!23362 (= mapRes!23362 (and tp!45132 e!454317))))

(declare-fun mapRest!23362 () (Array (_ BitVec 32) ValueCell!6840))

(declare-fun mapValue!23362 () ValueCell!6840)

(declare-fun mapKey!23362 () (_ BitVec 32))

(assert (=> mapNonEmpty!23362 (= (arr!21666 _values!788) (store mapRest!23362 mapKey!23362 mapValue!23362))))

(declare-fun b!818433 () Bool)

(assert (=> b!818433 (= e!454314 (and e!454318 mapRes!23362))))

(declare-fun condMapEmpty!23362 () Bool)

(declare-fun mapDefault!23362 () ValueCell!6840)

(assert (=> b!818433 (= condMapEmpty!23362 (= (arr!21666 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6840)) mapDefault!23362)))))

(declare-fun b!818434 () Bool)

(declare-fun res!558559 () Bool)

(assert (=> b!818434 (=> (not res!558559) (not e!454313))))

(assert (=> b!818434 (= res!558559 (and (= (size!22087 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22086 _keys!976) (size!22087 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70458 res!558560) b!818434))

(assert (= (and b!818434 res!558559) b!818427))

(assert (= (and b!818427 res!558561) b!818430))

(assert (= (and b!818430 res!558562) b!818432))

(assert (= (and b!818432 (not res!558563)) b!818428))

(assert (= (and b!818433 condMapEmpty!23362) mapIsEmpty!23362))

(assert (= (and b!818433 (not condMapEmpty!23362)) mapNonEmpty!23362))

(get-info :version)

(assert (= (and mapNonEmpty!23362 ((_ is ValueCellFull!6840) mapValue!23362)) b!818431))

(assert (= (and b!818433 ((_ is ValueCellFull!6840) mapDefault!23362)) b!818429))

(assert (= start!70458 b!818433))

(declare-fun m!759845 () Bool)

(assert (=> b!818428 m!759845))

(declare-fun m!759847 () Bool)

(assert (=> mapNonEmpty!23362 m!759847))

(declare-fun m!759849 () Bool)

(assert (=> b!818432 m!759849))

(declare-fun m!759851 () Bool)

(assert (=> b!818432 m!759851))

(declare-fun m!759853 () Bool)

(assert (=> b!818432 m!759853))

(declare-fun m!759855 () Bool)

(assert (=> start!70458 m!759855))

(declare-fun m!759857 () Bool)

(assert (=> start!70458 m!759857))

(declare-fun m!759859 () Bool)

(assert (=> start!70458 m!759859))

(declare-fun m!759861 () Bool)

(assert (=> b!818430 m!759861))

(declare-fun m!759863 () Bool)

(assert (=> b!818427 m!759863))

(check-sat (not start!70458) (not mapNonEmpty!23362) (not b!818428) b_and!21621 tp_is_empty!14511 (not b!818430) (not b_next!12801) (not b!818432) (not b!818427))
(check-sat b_and!21621 (not b_next!12801))
(get-model)

(declare-fun bm!35617 () Bool)

(declare-fun call!35622 () ListLongMap!8421)

(declare-fun call!35620 () ListLongMap!8421)

(assert (=> bm!35617 (= call!35622 call!35620)))

(declare-fun b!818502 () Bool)

(declare-fun e!454371 () Bool)

(declare-fun e!454364 () Bool)

(assert (=> b!818502 (= e!454371 e!454364)))

(declare-fun res!558600 () Bool)

(declare-fun call!35623 () Bool)

(assert (=> b!818502 (= res!558600 call!35623)))

(assert (=> b!818502 (=> (not res!558600) (not e!454364))))

(declare-fun b!818503 () Bool)

(declare-fun lt!366797 () ListLongMap!8421)

(declare-fun apply!353 (ListLongMap!8421 (_ BitVec 64)) V!24349)

(assert (=> b!818503 (= e!454364 (= (apply!353 lt!366797 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35618 () Bool)

(declare-fun contains!4157 (ListLongMap!8421 (_ BitVec 64)) Bool)

(assert (=> bm!35618 (= call!35623 (contains!4157 lt!366797 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35619 () Bool)

(declare-fun call!35625 () ListLongMap!8421)

(declare-fun call!35626 () ListLongMap!8421)

(assert (=> bm!35619 (= call!35625 call!35626)))

(declare-fun b!818504 () Bool)

(declare-fun res!558604 () Bool)

(declare-fun e!454370 () Bool)

(assert (=> b!818504 (=> (not res!558604) (not e!454370))))

(declare-fun e!454368 () Bool)

(assert (=> b!818504 (= res!558604 e!454368)))

(declare-fun c!89100 () Bool)

(assert (=> b!818504 (= c!89100 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!818505 () Bool)

(declare-fun e!454363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!818505 (= e!454363 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35620 () Bool)

(declare-fun call!35624 () ListLongMap!8421)

(assert (=> bm!35620 (= call!35620 call!35624)))

(declare-fun b!818506 () Bool)

(declare-fun c!89095 () Bool)

(assert (=> b!818506 (= c!89095 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!454369 () ListLongMap!8421)

(declare-fun e!454365 () ListLongMap!8421)

(assert (=> b!818506 (= e!454369 e!454365)))

(declare-fun b!818507 () Bool)

(assert (=> b!818507 (= e!454369 call!35625)))

(declare-fun b!818501 () Bool)

(declare-fun e!454375 () Unit!27934)

(declare-fun Unit!27936 () Unit!27934)

(assert (=> b!818501 (= e!454375 Unit!27936)))

(declare-fun d!104617 () Bool)

(assert (=> d!104617 e!454370))

(declare-fun res!558602 () Bool)

(assert (=> d!104617 (=> (not res!558602) (not e!454370))))

(assert (=> d!104617 (= res!558602 (or (bvsge #b00000000000000000000000000000000 (size!22086 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))))

(declare-fun lt!366790 () ListLongMap!8421)

(assert (=> d!104617 (= lt!366797 lt!366790)))

(declare-fun lt!366788 () Unit!27934)

(assert (=> d!104617 (= lt!366788 e!454375)))

(declare-fun c!89099 () Bool)

(assert (=> d!104617 (= c!89099 e!454363)))

(declare-fun res!558605 () Bool)

(assert (=> d!104617 (=> (not res!558605) (not e!454363))))

(assert (=> d!104617 (= res!558605 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun e!454373 () ListLongMap!8421)

(assert (=> d!104617 (= lt!366790 e!454373)))

(declare-fun c!89097 () Bool)

(assert (=> d!104617 (= c!89097 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104617 (validMask!0 mask!1312)))

(assert (=> d!104617 (= (getCurrentListMap!2431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366797)))

(declare-fun b!818508 () Bool)

(assert (=> b!818508 (= e!454373 e!454369)))

(declare-fun c!89098 () Bool)

(assert (=> b!818508 (= c!89098 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!454366 () Bool)

(declare-fun b!818509 () Bool)

(declare-fun get!11566 (ValueCell!6840 V!24349) V!24349)

(declare-fun dynLambda!964 (Int (_ BitVec 64)) V!24349)

(assert (=> b!818509 (= e!454366 (= (apply!353 lt!366797 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)) (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!818509 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22087 _values!788)))))

(assert (=> b!818509 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun b!818510 () Bool)

(assert (=> b!818510 (= e!454365 call!35625)))

(declare-fun b!818511 () Bool)

(assert (=> b!818511 (= e!454371 (not call!35623))))

(declare-fun bm!35621 () Bool)

(declare-fun +!1823 (ListLongMap!8421 tuple2!9598) ListLongMap!8421)

(assert (=> bm!35621 (= call!35626 (+!1823 (ite c!89097 call!35624 (ite c!89098 call!35620 call!35622)) (ite (or c!89097 c!89098) (tuple2!9599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!818512 () Bool)

(declare-fun e!454372 () Bool)

(assert (=> b!818512 (= e!454368 e!454372)))

(declare-fun res!558603 () Bool)

(declare-fun call!35621 () Bool)

(assert (=> b!818512 (= res!558603 call!35621)))

(assert (=> b!818512 (=> (not res!558603) (not e!454372))))

(declare-fun b!818513 () Bool)

(assert (=> b!818513 (= e!454368 (not call!35621))))

(declare-fun b!818514 () Bool)

(assert (=> b!818514 (= e!454370 e!454371)))

(declare-fun c!89096 () Bool)

(assert (=> b!818514 (= c!89096 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35622 () Bool)

(assert (=> bm!35622 (= call!35621 (contains!4157 lt!366797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!818515 () Bool)

(assert (=> b!818515 (= e!454373 (+!1823 call!35626 (tuple2!9599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35623 () Bool)

(assert (=> bm!35623 (= call!35624 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818516 () Bool)

(assert (=> b!818516 (= e!454372 (= (apply!353 lt!366797 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!818517 () Bool)

(declare-fun lt!366800 () Unit!27934)

(assert (=> b!818517 (= e!454375 lt!366800)))

(declare-fun lt!366781 () ListLongMap!8421)

(assert (=> b!818517 (= lt!366781 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366784 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366793 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366793 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366802 () Unit!27934)

(declare-fun addStillContains!307 (ListLongMap!8421 (_ BitVec 64) V!24349 (_ BitVec 64)) Unit!27934)

(assert (=> b!818517 (= lt!366802 (addStillContains!307 lt!366781 lt!366784 zeroValueBefore!34 lt!366793))))

(assert (=> b!818517 (contains!4157 (+!1823 lt!366781 (tuple2!9599 lt!366784 zeroValueBefore!34)) lt!366793)))

(declare-fun lt!366791 () Unit!27934)

(assert (=> b!818517 (= lt!366791 lt!366802)))

(declare-fun lt!366801 () ListLongMap!8421)

(assert (=> b!818517 (= lt!366801 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366796 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366796 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366785 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366785 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366783 () Unit!27934)

(declare-fun addApplyDifferent!307 (ListLongMap!8421 (_ BitVec 64) V!24349 (_ BitVec 64)) Unit!27934)

(assert (=> b!818517 (= lt!366783 (addApplyDifferent!307 lt!366801 lt!366796 minValue!754 lt!366785))))

(assert (=> b!818517 (= (apply!353 (+!1823 lt!366801 (tuple2!9599 lt!366796 minValue!754)) lt!366785) (apply!353 lt!366801 lt!366785))))

(declare-fun lt!366798 () Unit!27934)

(assert (=> b!818517 (= lt!366798 lt!366783)))

(declare-fun lt!366789 () ListLongMap!8421)

(assert (=> b!818517 (= lt!366789 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366799 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366787 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366787 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366795 () Unit!27934)

(assert (=> b!818517 (= lt!366795 (addApplyDifferent!307 lt!366789 lt!366799 zeroValueBefore!34 lt!366787))))

(assert (=> b!818517 (= (apply!353 (+!1823 lt!366789 (tuple2!9599 lt!366799 zeroValueBefore!34)) lt!366787) (apply!353 lt!366789 lt!366787))))

(declare-fun lt!366794 () Unit!27934)

(assert (=> b!818517 (= lt!366794 lt!366795)))

(declare-fun lt!366792 () ListLongMap!8421)

(assert (=> b!818517 (= lt!366792 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366782 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366782 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366786 () (_ BitVec 64))

(assert (=> b!818517 (= lt!366786 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818517 (= lt!366800 (addApplyDifferent!307 lt!366792 lt!366782 minValue!754 lt!366786))))

(assert (=> b!818517 (= (apply!353 (+!1823 lt!366792 (tuple2!9599 lt!366782 minValue!754)) lt!366786) (apply!353 lt!366792 lt!366786))))

(declare-fun b!818518 () Bool)

(declare-fun e!454367 () Bool)

(assert (=> b!818518 (= e!454367 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818519 () Bool)

(assert (=> b!818519 (= e!454365 call!35622)))

(declare-fun b!818520 () Bool)

(declare-fun res!558601 () Bool)

(assert (=> b!818520 (=> (not res!558601) (not e!454370))))

(declare-fun e!454374 () Bool)

(assert (=> b!818520 (= res!558601 e!454374)))

(declare-fun res!558597 () Bool)

(assert (=> b!818520 (=> res!558597 e!454374)))

(assert (=> b!818520 (= res!558597 (not e!454367))))

(declare-fun res!558598 () Bool)

(assert (=> b!818520 (=> (not res!558598) (not e!454367))))

(assert (=> b!818520 (= res!558598 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun b!818521 () Bool)

(assert (=> b!818521 (= e!454374 e!454366)))

(declare-fun res!558599 () Bool)

(assert (=> b!818521 (=> (not res!558599) (not e!454366))))

(assert (=> b!818521 (= res!558599 (contains!4157 lt!366797 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (= (and d!104617 c!89097) b!818515))

(assert (= (and d!104617 (not c!89097)) b!818508))

(assert (= (and b!818508 c!89098) b!818507))

(assert (= (and b!818508 (not c!89098)) b!818506))

(assert (= (and b!818506 c!89095) b!818510))

(assert (= (and b!818506 (not c!89095)) b!818519))

(assert (= (or b!818510 b!818519) bm!35617))

(assert (= (or b!818507 bm!35617) bm!35620))

(assert (= (or b!818507 b!818510) bm!35619))

(assert (= (or b!818515 bm!35620) bm!35623))

(assert (= (or b!818515 bm!35619) bm!35621))

(assert (= (and d!104617 res!558605) b!818505))

(assert (= (and d!104617 c!89099) b!818517))

(assert (= (and d!104617 (not c!89099)) b!818501))

(assert (= (and d!104617 res!558602) b!818520))

(assert (= (and b!818520 res!558598) b!818518))

(assert (= (and b!818520 (not res!558597)) b!818521))

(assert (= (and b!818521 res!558599) b!818509))

(assert (= (and b!818520 res!558601) b!818504))

(assert (= (and b!818504 c!89100) b!818512))

(assert (= (and b!818504 (not c!89100)) b!818513))

(assert (= (and b!818512 res!558603) b!818516))

(assert (= (or b!818512 b!818513) bm!35622))

(assert (= (and b!818504 res!558604) b!818514))

(assert (= (and b!818514 c!89096) b!818502))

(assert (= (and b!818514 (not c!89096)) b!818511))

(assert (= (and b!818502 res!558600) b!818503))

(assert (= (or b!818502 b!818511) bm!35618))

(declare-fun b_lambda!10927 () Bool)

(assert (=> (not b_lambda!10927) (not b!818509)))

(declare-fun t!21761 () Bool)

(declare-fun tb!4187 () Bool)

(assert (=> (and start!70458 (= defaultEntry!796 defaultEntry!796) t!21761) tb!4187))

(declare-fun result!7901 () Bool)

(assert (=> tb!4187 (= result!7901 tp_is_empty!14511)))

(assert (=> b!818509 t!21761))

(declare-fun b_and!21625 () Bool)

(assert (= b_and!21621 (and (=> t!21761 result!7901) b_and!21625)))

(declare-fun m!759885 () Bool)

(assert (=> b!818509 m!759885))

(declare-fun m!759887 () Bool)

(assert (=> b!818509 m!759887))

(assert (=> b!818509 m!759885))

(declare-fun m!759889 () Bool)

(assert (=> b!818509 m!759889))

(declare-fun m!759891 () Bool)

(assert (=> b!818509 m!759891))

(assert (=> b!818509 m!759889))

(declare-fun m!759893 () Bool)

(assert (=> b!818509 m!759893))

(assert (=> b!818509 m!759891))

(declare-fun m!759895 () Bool)

(assert (=> b!818517 m!759895))

(declare-fun m!759897 () Bool)

(assert (=> b!818517 m!759897))

(declare-fun m!759899 () Bool)

(assert (=> b!818517 m!759899))

(declare-fun m!759901 () Bool)

(assert (=> b!818517 m!759901))

(declare-fun m!759903 () Bool)

(assert (=> b!818517 m!759903))

(declare-fun m!759905 () Bool)

(assert (=> b!818517 m!759905))

(declare-fun m!759907 () Bool)

(assert (=> b!818517 m!759907))

(declare-fun m!759909 () Bool)

(assert (=> b!818517 m!759909))

(declare-fun m!759911 () Bool)

(assert (=> b!818517 m!759911))

(declare-fun m!759913 () Bool)

(assert (=> b!818517 m!759913))

(declare-fun m!759915 () Bool)

(assert (=> b!818517 m!759915))

(assert (=> b!818517 m!759853))

(assert (=> b!818517 m!759913))

(declare-fun m!759917 () Bool)

(assert (=> b!818517 m!759917))

(assert (=> b!818517 m!759897))

(assert (=> b!818517 m!759885))

(assert (=> b!818517 m!759911))

(declare-fun m!759919 () Bool)

(assert (=> b!818517 m!759919))

(declare-fun m!759921 () Bool)

(assert (=> b!818517 m!759921))

(assert (=> b!818517 m!759905))

(declare-fun m!759923 () Bool)

(assert (=> b!818517 m!759923))

(declare-fun m!759925 () Bool)

(assert (=> b!818516 m!759925))

(assert (=> d!104617 m!759855))

(assert (=> b!818505 m!759885))

(assert (=> b!818505 m!759885))

(declare-fun m!759927 () Bool)

(assert (=> b!818505 m!759927))

(declare-fun m!759929 () Bool)

(assert (=> bm!35621 m!759929))

(declare-fun m!759931 () Bool)

(assert (=> b!818503 m!759931))

(declare-fun m!759933 () Bool)

(assert (=> bm!35622 m!759933))

(assert (=> b!818521 m!759885))

(assert (=> b!818521 m!759885))

(declare-fun m!759935 () Bool)

(assert (=> b!818521 m!759935))

(assert (=> bm!35623 m!759853))

(declare-fun m!759937 () Bool)

(assert (=> bm!35618 m!759937))

(declare-fun m!759939 () Bool)

(assert (=> b!818515 m!759939))

(assert (=> b!818518 m!759885))

(assert (=> b!818518 m!759885))

(assert (=> b!818518 m!759927))

(assert (=> b!818428 d!104617))

(declare-fun d!104619 () Bool)

(assert (=> d!104619 (= (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366805 () Unit!27934)

(declare-fun choose!1392 (array!45220 array!45222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24349 V!24349 V!24349 V!24349 (_ BitVec 32) Int) Unit!27934)

(assert (=> d!104619 (= lt!366805 (choose!1392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104619 (validMask!0 mask!1312)))

(assert (=> d!104619 (= (lemmaNoChangeToArrayThenSameMapNoExtras!376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366805)))

(declare-fun bs!22812 () Bool)

(assert (= bs!22812 d!104619))

(assert (=> bs!22812 m!759853))

(assert (=> bs!22812 m!759851))

(declare-fun m!759941 () Bool)

(assert (=> bs!22812 m!759941))

(assert (=> bs!22812 m!759855))

(assert (=> b!818432 d!104619))

(declare-fun b!818548 () Bool)

(declare-fun lt!366825 () Unit!27934)

(declare-fun lt!366821 () Unit!27934)

(assert (=> b!818548 (= lt!366825 lt!366821)))

(declare-fun lt!366823 () (_ BitVec 64))

(declare-fun lt!366824 () ListLongMap!8421)

(declare-fun lt!366820 () V!24349)

(declare-fun lt!366826 () (_ BitVec 64))

(assert (=> b!818548 (not (contains!4157 (+!1823 lt!366824 (tuple2!9599 lt!366823 lt!366820)) lt!366826))))

(declare-fun addStillNotContains!178 (ListLongMap!8421 (_ BitVec 64) V!24349 (_ BitVec 64)) Unit!27934)

(assert (=> b!818548 (= lt!366821 (addStillNotContains!178 lt!366824 lt!366823 lt!366820 lt!366826))))

(assert (=> b!818548 (= lt!366826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818548 (= lt!366820 (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818548 (= lt!366823 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35629 () ListLongMap!8421)

(assert (=> b!818548 (= lt!366824 call!35629)))

(declare-fun e!454393 () ListLongMap!8421)

(assert (=> b!818548 (= e!454393 (+!1823 call!35629 (tuple2!9599 (select (arr!21665 _keys!976) #b00000000000000000000000000000000) (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818549 () Bool)

(assert (=> b!818549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> b!818549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22087 _values!788)))))

(declare-fun e!454392 () Bool)

(declare-fun lt!366822 () ListLongMap!8421)

(assert (=> b!818549 (= e!454392 (= (apply!353 lt!366822 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)) (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!818550 () Bool)

(declare-fun res!558616 () Bool)

(declare-fun e!454395 () Bool)

(assert (=> b!818550 (=> (not res!558616) (not e!454395))))

(assert (=> b!818550 (= res!558616 (not (contains!4157 lt!366822 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818551 () Bool)

(declare-fun e!454391 () ListLongMap!8421)

(assert (=> b!818551 (= e!454391 (ListLongMap!8422 Nil!15428))))

(declare-fun b!818552 () Bool)

(declare-fun e!454394 () Bool)

(assert (=> b!818552 (= e!454395 e!454394)))

(declare-fun c!89112 () Bool)

(declare-fun e!454390 () Bool)

(assert (=> b!818552 (= c!89112 e!454390)))

(declare-fun res!558617 () Bool)

(assert (=> b!818552 (=> (not res!558617) (not e!454390))))

(assert (=> b!818552 (= res!558617 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun d!104621 () Bool)

(assert (=> d!104621 e!454395))

(declare-fun res!558615 () Bool)

(assert (=> d!104621 (=> (not res!558615) (not e!454395))))

(assert (=> d!104621 (= res!558615 (not (contains!4157 lt!366822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104621 (= lt!366822 e!454391)))

(declare-fun c!89110 () Bool)

(assert (=> d!104621 (= c!89110 (bvsge #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> d!104621 (validMask!0 mask!1312)))

(assert (=> d!104621 (= (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366822)))

(declare-fun b!818553 () Bool)

(declare-fun e!454396 () Bool)

(assert (=> b!818553 (= e!454394 e!454396)))

(declare-fun c!89109 () Bool)

(assert (=> b!818553 (= c!89109 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun b!818554 () Bool)

(assert (=> b!818554 (= e!454391 e!454393)))

(declare-fun c!89111 () Bool)

(assert (=> b!818554 (= c!89111 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818555 () Bool)

(assert (=> b!818555 (= e!454394 e!454392)))

(assert (=> b!818555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun res!558614 () Bool)

(assert (=> b!818555 (= res!558614 (contains!4157 lt!366822 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818555 (=> (not res!558614) (not e!454392))))

(declare-fun b!818556 () Bool)

(assert (=> b!818556 (= e!454393 call!35629)))

(declare-fun bm!35626 () Bool)

(assert (=> bm!35626 (= call!35629 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818557 () Bool)

(assert (=> b!818557 (= e!454396 (= lt!366822 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818558 () Bool)

(assert (=> b!818558 (= e!454390 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818558 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818559 () Bool)

(declare-fun isEmpty!635 (ListLongMap!8421) Bool)

(assert (=> b!818559 (= e!454396 (isEmpty!635 lt!366822))))

(assert (= (and d!104621 c!89110) b!818551))

(assert (= (and d!104621 (not c!89110)) b!818554))

(assert (= (and b!818554 c!89111) b!818548))

(assert (= (and b!818554 (not c!89111)) b!818556))

(assert (= (or b!818548 b!818556) bm!35626))

(assert (= (and d!104621 res!558615) b!818550))

(assert (= (and b!818550 res!558616) b!818552))

(assert (= (and b!818552 res!558617) b!818558))

(assert (= (and b!818552 c!89112) b!818555))

(assert (= (and b!818552 (not c!89112)) b!818553))

(assert (= (and b!818555 res!558614) b!818549))

(assert (= (and b!818553 c!89109) b!818557))

(assert (= (and b!818553 (not c!89109)) b!818559))

(declare-fun b_lambda!10929 () Bool)

(assert (=> (not b_lambda!10929) (not b!818548)))

(assert (=> b!818548 t!21761))

(declare-fun b_and!21627 () Bool)

(assert (= b_and!21625 (and (=> t!21761 result!7901) b_and!21627)))

(declare-fun b_lambda!10931 () Bool)

(assert (=> (not b_lambda!10931) (not b!818549)))

(assert (=> b!818549 t!21761))

(declare-fun b_and!21629 () Bool)

(assert (= b_and!21627 (and (=> t!21761 result!7901) b_and!21629)))

(assert (=> b!818555 m!759885))

(assert (=> b!818555 m!759885))

(declare-fun m!759943 () Bool)

(assert (=> b!818555 m!759943))

(assert (=> b!818549 m!759891))

(assert (=> b!818549 m!759889))

(assert (=> b!818549 m!759891))

(assert (=> b!818549 m!759889))

(assert (=> b!818549 m!759893))

(assert (=> b!818549 m!759885))

(declare-fun m!759945 () Bool)

(assert (=> b!818549 m!759945))

(assert (=> b!818549 m!759885))

(assert (=> b!818548 m!759891))

(declare-fun m!759947 () Bool)

(assert (=> b!818548 m!759947))

(declare-fun m!759949 () Bool)

(assert (=> b!818548 m!759949))

(declare-fun m!759951 () Bool)

(assert (=> b!818548 m!759951))

(assert (=> b!818548 m!759885))

(assert (=> b!818548 m!759949))

(assert (=> b!818548 m!759889))

(assert (=> b!818548 m!759891))

(assert (=> b!818548 m!759889))

(assert (=> b!818548 m!759893))

(declare-fun m!759953 () Bool)

(assert (=> b!818548 m!759953))

(declare-fun m!759955 () Bool)

(assert (=> b!818557 m!759955))

(assert (=> b!818554 m!759885))

(assert (=> b!818554 m!759885))

(assert (=> b!818554 m!759927))

(declare-fun m!759957 () Bool)

(assert (=> b!818550 m!759957))

(assert (=> b!818558 m!759885))

(assert (=> b!818558 m!759885))

(assert (=> b!818558 m!759927))

(declare-fun m!759959 () Bool)

(assert (=> b!818559 m!759959))

(assert (=> bm!35626 m!759955))

(declare-fun m!759961 () Bool)

(assert (=> d!104621 m!759961))

(assert (=> d!104621 m!759855))

(assert (=> b!818432 d!104621))

(declare-fun b!818560 () Bool)

(declare-fun lt!366832 () Unit!27934)

(declare-fun lt!366828 () Unit!27934)

(assert (=> b!818560 (= lt!366832 lt!366828)))

(declare-fun lt!366833 () (_ BitVec 64))

(declare-fun lt!366827 () V!24349)

(declare-fun lt!366830 () (_ BitVec 64))

(declare-fun lt!366831 () ListLongMap!8421)

(assert (=> b!818560 (not (contains!4157 (+!1823 lt!366831 (tuple2!9599 lt!366830 lt!366827)) lt!366833))))

(assert (=> b!818560 (= lt!366828 (addStillNotContains!178 lt!366831 lt!366830 lt!366827 lt!366833))))

(assert (=> b!818560 (= lt!366833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818560 (= lt!366827 (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818560 (= lt!366830 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35630 () ListLongMap!8421)

(assert (=> b!818560 (= lt!366831 call!35630)))

(declare-fun e!454400 () ListLongMap!8421)

(assert (=> b!818560 (= e!454400 (+!1823 call!35630 (tuple2!9599 (select (arr!21665 _keys!976) #b00000000000000000000000000000000) (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818561 () Bool)

(assert (=> b!818561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> b!818561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22087 _values!788)))))

(declare-fun e!454399 () Bool)

(declare-fun lt!366829 () ListLongMap!8421)

(assert (=> b!818561 (= e!454399 (= (apply!353 lt!366829 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)) (get!11566 (select (arr!21666 _values!788) #b00000000000000000000000000000000) (dynLambda!964 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!818562 () Bool)

(declare-fun res!558620 () Bool)

(declare-fun e!454402 () Bool)

(assert (=> b!818562 (=> (not res!558620) (not e!454402))))

(assert (=> b!818562 (= res!558620 (not (contains!4157 lt!366829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818563 () Bool)

(declare-fun e!454398 () ListLongMap!8421)

(assert (=> b!818563 (= e!454398 (ListLongMap!8422 Nil!15428))))

(declare-fun b!818564 () Bool)

(declare-fun e!454401 () Bool)

(assert (=> b!818564 (= e!454402 e!454401)))

(declare-fun c!89116 () Bool)

(declare-fun e!454397 () Bool)

(assert (=> b!818564 (= c!89116 e!454397)))

(declare-fun res!558621 () Bool)

(assert (=> b!818564 (=> (not res!558621) (not e!454397))))

(assert (=> b!818564 (= res!558621 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun d!104623 () Bool)

(assert (=> d!104623 e!454402))

(declare-fun res!558619 () Bool)

(assert (=> d!104623 (=> (not res!558619) (not e!454402))))

(assert (=> d!104623 (= res!558619 (not (contains!4157 lt!366829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104623 (= lt!366829 e!454398)))

(declare-fun c!89114 () Bool)

(assert (=> d!104623 (= c!89114 (bvsge #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> d!104623 (validMask!0 mask!1312)))

(assert (=> d!104623 (= (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366829)))

(declare-fun b!818565 () Bool)

(declare-fun e!454403 () Bool)

(assert (=> b!818565 (= e!454401 e!454403)))

(declare-fun c!89113 () Bool)

(assert (=> b!818565 (= c!89113 (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun b!818566 () Bool)

(assert (=> b!818566 (= e!454398 e!454400)))

(declare-fun c!89115 () Bool)

(assert (=> b!818566 (= c!89115 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818567 () Bool)

(assert (=> b!818567 (= e!454401 e!454399)))

(assert (=> b!818567 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(declare-fun res!558618 () Bool)

(assert (=> b!818567 (= res!558618 (contains!4157 lt!366829 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818567 (=> (not res!558618) (not e!454399))))

(declare-fun b!818568 () Bool)

(assert (=> b!818568 (= e!454400 call!35630)))

(declare-fun bm!35627 () Bool)

(assert (=> bm!35627 (= call!35630 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!818569 () Bool)

(assert (=> b!818569 (= e!454403 (= lt!366829 (getCurrentListMapNoExtraKeys!2266 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!818570 () Bool)

(assert (=> b!818570 (= e!454397 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818570 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818571 () Bool)

(assert (=> b!818571 (= e!454403 (isEmpty!635 lt!366829))))

(assert (= (and d!104623 c!89114) b!818563))

(assert (= (and d!104623 (not c!89114)) b!818566))

(assert (= (and b!818566 c!89115) b!818560))

(assert (= (and b!818566 (not c!89115)) b!818568))

(assert (= (or b!818560 b!818568) bm!35627))

(assert (= (and d!104623 res!558619) b!818562))

(assert (= (and b!818562 res!558620) b!818564))

(assert (= (and b!818564 res!558621) b!818570))

(assert (= (and b!818564 c!89116) b!818567))

(assert (= (and b!818564 (not c!89116)) b!818565))

(assert (= (and b!818567 res!558618) b!818561))

(assert (= (and b!818565 c!89113) b!818569))

(assert (= (and b!818565 (not c!89113)) b!818571))

(declare-fun b_lambda!10933 () Bool)

(assert (=> (not b_lambda!10933) (not b!818560)))

(assert (=> b!818560 t!21761))

(declare-fun b_and!21631 () Bool)

(assert (= b_and!21629 (and (=> t!21761 result!7901) b_and!21631)))

(declare-fun b_lambda!10935 () Bool)

(assert (=> (not b_lambda!10935) (not b!818561)))

(assert (=> b!818561 t!21761))

(declare-fun b_and!21633 () Bool)

(assert (= b_and!21631 (and (=> t!21761 result!7901) b_and!21633)))

(assert (=> b!818567 m!759885))

(assert (=> b!818567 m!759885))

(declare-fun m!759963 () Bool)

(assert (=> b!818567 m!759963))

(assert (=> b!818561 m!759891))

(assert (=> b!818561 m!759889))

(assert (=> b!818561 m!759891))

(assert (=> b!818561 m!759889))

(assert (=> b!818561 m!759893))

(assert (=> b!818561 m!759885))

(declare-fun m!759965 () Bool)

(assert (=> b!818561 m!759965))

(assert (=> b!818561 m!759885))

(assert (=> b!818560 m!759891))

(declare-fun m!759967 () Bool)

(assert (=> b!818560 m!759967))

(declare-fun m!759969 () Bool)

(assert (=> b!818560 m!759969))

(declare-fun m!759971 () Bool)

(assert (=> b!818560 m!759971))

(assert (=> b!818560 m!759885))

(assert (=> b!818560 m!759969))

(assert (=> b!818560 m!759889))

(assert (=> b!818560 m!759891))

(assert (=> b!818560 m!759889))

(assert (=> b!818560 m!759893))

(declare-fun m!759973 () Bool)

(assert (=> b!818560 m!759973))

(declare-fun m!759975 () Bool)

(assert (=> b!818569 m!759975))

(assert (=> b!818566 m!759885))

(assert (=> b!818566 m!759885))

(assert (=> b!818566 m!759927))

(declare-fun m!759977 () Bool)

(assert (=> b!818562 m!759977))

(assert (=> b!818570 m!759885))

(assert (=> b!818570 m!759885))

(assert (=> b!818570 m!759927))

(declare-fun m!759979 () Bool)

(assert (=> b!818571 m!759979))

(assert (=> bm!35627 m!759975))

(declare-fun m!759981 () Bool)

(assert (=> d!104623 m!759981))

(assert (=> d!104623 m!759855))

(assert (=> b!818432 d!104623))

(declare-fun b!818580 () Bool)

(declare-fun e!454410 () Bool)

(declare-fun e!454411 () Bool)

(assert (=> b!818580 (= e!454410 e!454411)))

(declare-fun c!89119 () Bool)

(assert (=> b!818580 (= c!89119 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818581 () Bool)

(declare-fun e!454412 () Bool)

(declare-fun call!35633 () Bool)

(assert (=> b!818581 (= e!454412 call!35633)))

(declare-fun bm!35630 () Bool)

(assert (=> bm!35630 (= call!35633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!818582 () Bool)

(assert (=> b!818582 (= e!454411 call!35633)))

(declare-fun d!104625 () Bool)

(declare-fun res!558626 () Bool)

(assert (=> d!104625 (=> res!558626 e!454410)))

(assert (=> d!104625 (= res!558626 (bvsge #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> d!104625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!454410)))

(declare-fun b!818583 () Bool)

(assert (=> b!818583 (= e!454411 e!454412)))

(declare-fun lt!366842 () (_ BitVec 64))

(assert (=> b!818583 (= lt!366842 (select (arr!21665 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366840 () Unit!27934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45220 (_ BitVec 64) (_ BitVec 32)) Unit!27934)

(assert (=> b!818583 (= lt!366840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366842 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!818583 (arrayContainsKey!0 _keys!976 lt!366842 #b00000000000000000000000000000000)))

(declare-fun lt!366841 () Unit!27934)

(assert (=> b!818583 (= lt!366841 lt!366840)))

(declare-fun res!558627 () Bool)

(declare-datatypes ((SeekEntryResult!8725 0))(
  ( (MissingZero!8725 (index!37271 (_ BitVec 32))) (Found!8725 (index!37272 (_ BitVec 32))) (Intermediate!8725 (undefined!9537 Bool) (index!37273 (_ BitVec 32)) (x!68953 (_ BitVec 32))) (Undefined!8725) (MissingVacant!8725 (index!37274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45220 (_ BitVec 32)) SeekEntryResult!8725)

(assert (=> b!818583 (= res!558627 (= (seekEntryOrOpen!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8725 #b00000000000000000000000000000000)))))

(assert (=> b!818583 (=> (not res!558627) (not e!454412))))

(assert (= (and d!104625 (not res!558626)) b!818580))

(assert (= (and b!818580 c!89119) b!818583))

(assert (= (and b!818580 (not c!89119)) b!818582))

(assert (= (and b!818583 res!558627) b!818581))

(assert (= (or b!818581 b!818582) bm!35630))

(assert (=> b!818580 m!759885))

(assert (=> b!818580 m!759885))

(assert (=> b!818580 m!759927))

(declare-fun m!759983 () Bool)

(assert (=> bm!35630 m!759983))

(assert (=> b!818583 m!759885))

(declare-fun m!759985 () Bool)

(assert (=> b!818583 m!759985))

(declare-fun m!759987 () Bool)

(assert (=> b!818583 m!759987))

(assert (=> b!818583 m!759885))

(declare-fun m!759989 () Bool)

(assert (=> b!818583 m!759989))

(assert (=> b!818427 d!104625))

(declare-fun d!104627 () Bool)

(assert (=> d!104627 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70458 d!104627))

(declare-fun d!104629 () Bool)

(assert (=> d!104629 (= (array_inv!17325 _keys!976) (bvsge (size!22086 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70458 d!104629))

(declare-fun d!104631 () Bool)

(assert (=> d!104631 (= (array_inv!17326 _values!788) (bvsge (size!22087 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70458 d!104631))

(declare-fun b!818595 () Bool)

(declare-fun e!454423 () Bool)

(declare-fun call!35636 () Bool)

(assert (=> b!818595 (= e!454423 call!35636)))

(declare-fun b!818596 () Bool)

(assert (=> b!818596 (= e!454423 call!35636)))

(declare-fun b!818597 () Bool)

(declare-fun e!454421 () Bool)

(declare-fun contains!4158 (List!15432 (_ BitVec 64)) Bool)

(assert (=> b!818597 (= e!454421 (contains!4158 Nil!15429 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818598 () Bool)

(declare-fun e!454422 () Bool)

(assert (=> b!818598 (= e!454422 e!454423)))

(declare-fun c!89122 () Bool)

(assert (=> b!818598 (= c!89122 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35633 () Bool)

(assert (=> bm!35633 (= call!35636 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89122 (Cons!15428 (select (arr!21665 _keys!976) #b00000000000000000000000000000000) Nil!15429) Nil!15429)))))

(declare-fun b!818594 () Bool)

(declare-fun e!454424 () Bool)

(assert (=> b!818594 (= e!454424 e!454422)))

(declare-fun res!558636 () Bool)

(assert (=> b!818594 (=> (not res!558636) (not e!454422))))

(assert (=> b!818594 (= res!558636 (not e!454421))))

(declare-fun res!558634 () Bool)

(assert (=> b!818594 (=> (not res!558634) (not e!454421))))

(assert (=> b!818594 (= res!558634 (validKeyInArray!0 (select (arr!21665 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104633 () Bool)

(declare-fun res!558635 () Bool)

(assert (=> d!104633 (=> res!558635 e!454424)))

(assert (=> d!104633 (= res!558635 (bvsge #b00000000000000000000000000000000 (size!22086 _keys!976)))))

(assert (=> d!104633 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15429) e!454424)))

(assert (= (and d!104633 (not res!558635)) b!818594))

(assert (= (and b!818594 res!558634) b!818597))

(assert (= (and b!818594 res!558636) b!818598))

(assert (= (and b!818598 c!89122) b!818596))

(assert (= (and b!818598 (not c!89122)) b!818595))

(assert (= (or b!818596 b!818595) bm!35633))

(assert (=> b!818597 m!759885))

(assert (=> b!818597 m!759885))

(declare-fun m!759991 () Bool)

(assert (=> b!818597 m!759991))

(assert (=> b!818598 m!759885))

(assert (=> b!818598 m!759885))

(assert (=> b!818598 m!759927))

(assert (=> bm!35633 m!759885))

(declare-fun m!759993 () Bool)

(assert (=> bm!35633 m!759993))

(assert (=> b!818594 m!759885))

(assert (=> b!818594 m!759885))

(assert (=> b!818594 m!759927))

(assert (=> b!818430 d!104633))

(declare-fun mapNonEmpty!23368 () Bool)

(declare-fun mapRes!23368 () Bool)

(declare-fun tp!45142 () Bool)

(declare-fun e!454429 () Bool)

(assert (=> mapNonEmpty!23368 (= mapRes!23368 (and tp!45142 e!454429))))

(declare-fun mapValue!23368 () ValueCell!6840)

(declare-fun mapKey!23368 () (_ BitVec 32))

(declare-fun mapRest!23368 () (Array (_ BitVec 32) ValueCell!6840))

(assert (=> mapNonEmpty!23368 (= mapRest!23362 (store mapRest!23368 mapKey!23368 mapValue!23368))))

(declare-fun condMapEmpty!23368 () Bool)

(declare-fun mapDefault!23368 () ValueCell!6840)

(assert (=> mapNonEmpty!23362 (= condMapEmpty!23368 (= mapRest!23362 ((as const (Array (_ BitVec 32) ValueCell!6840)) mapDefault!23368)))))

(declare-fun e!454430 () Bool)

(assert (=> mapNonEmpty!23362 (= tp!45132 (and e!454430 mapRes!23368))))

(declare-fun mapIsEmpty!23368 () Bool)

(assert (=> mapIsEmpty!23368 mapRes!23368))

(declare-fun b!818605 () Bool)

(assert (=> b!818605 (= e!454429 tp_is_empty!14511)))

(declare-fun b!818606 () Bool)

(assert (=> b!818606 (= e!454430 tp_is_empty!14511)))

(assert (= (and mapNonEmpty!23362 condMapEmpty!23368) mapIsEmpty!23368))

(assert (= (and mapNonEmpty!23362 (not condMapEmpty!23368)) mapNonEmpty!23368))

(assert (= (and mapNonEmpty!23368 ((_ is ValueCellFull!6840) mapValue!23368)) b!818605))

(assert (= (and mapNonEmpty!23362 ((_ is ValueCellFull!6840) mapDefault!23368)) b!818606))

(declare-fun m!759995 () Bool)

(assert (=> mapNonEmpty!23368 m!759995))

(declare-fun b_lambda!10937 () Bool)

(assert (= b_lambda!10935 (or (and start!70458 b_free!12801) b_lambda!10937)))

(declare-fun b_lambda!10939 () Bool)

(assert (= b_lambda!10933 (or (and start!70458 b_free!12801) b_lambda!10939)))

(declare-fun b_lambda!10941 () Bool)

(assert (= b_lambda!10929 (or (and start!70458 b_free!12801) b_lambda!10941)))

(declare-fun b_lambda!10943 () Bool)

(assert (= b_lambda!10931 (or (and start!70458 b_free!12801) b_lambda!10943)))

(declare-fun b_lambda!10945 () Bool)

(assert (= b_lambda!10927 (or (and start!70458 b_free!12801) b_lambda!10945)))

(check-sat (not b!818503) (not bm!35621) (not b!818554) (not b!818509) (not bm!35618) (not b!818561) (not b!818571) (not b!818566) (not bm!35622) (not mapNonEmpty!23368) (not b!818562) (not bm!35626) (not b!818555) (not b_lambda!10939) (not b_lambda!10937) (not b_lambda!10945) (not b!818594) b_and!21633 (not b!818558) (not b!818548) (not b!818516) (not b!818550) (not d!104617) (not b!818505) (not b!818517) (not d!104621) (not d!104623) (not b!818518) (not d!104619) (not bm!35627) (not b!818515) (not b!818583) (not bm!35630) (not b_lambda!10943) (not b!818570) (not b_lambda!10941) (not b!818521) (not b!818560) (not b!818580) tp_is_empty!14511 (not b!818598) (not bm!35623) (not b!818557) (not b!818549) (not b!818569) (not b!818597) (not bm!35633) (not b!818567) (not b!818559) (not b_next!12801))
(check-sat b_and!21633 (not b_next!12801))
