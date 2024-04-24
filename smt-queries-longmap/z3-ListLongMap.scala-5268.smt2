; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70908 () Bool)

(assert start!70908)

(declare-fun b_free!13015 () Bool)

(declare-fun b_next!13015 () Bool)

(assert (=> start!70908 (= b_free!13015 (not b_next!13015))))

(declare-fun tp!45787 () Bool)

(declare-fun b_and!21887 () Bool)

(assert (=> start!70908 (= tp!45787 b_and!21887)))

(declare-fun mapIsEmpty!23695 () Bool)

(declare-fun mapRes!23695 () Bool)

(assert (=> mapIsEmpty!23695 mapRes!23695))

(declare-fun res!560867 () Bool)

(declare-fun e!457299 () Bool)

(assert (=> start!70908 (=> (not res!560867) (not e!457299))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70908 (= res!560867 (validMask!0 mask!1312))))

(assert (=> start!70908 e!457299))

(declare-fun tp_is_empty!14725 () Bool)

(assert (=> start!70908 tp_is_empty!14725))

(declare-datatypes ((array!45647 0))(
  ( (array!45648 (arr!21870 (Array (_ BitVec 32) (_ BitVec 64))) (size!22290 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45647)

(declare-fun array_inv!17503 (array!45647) Bool)

(assert (=> start!70908 (array_inv!17503 _keys!976)))

(assert (=> start!70908 true))

(declare-datatypes ((V!24635 0))(
  ( (V!24636 (val!7410 Int)) )
))
(declare-datatypes ((ValueCell!6947 0))(
  ( (ValueCellFull!6947 (v!9841 V!24635)) (EmptyCell!6947) )
))
(declare-datatypes ((array!45649 0))(
  ( (array!45650 (arr!21871 (Array (_ BitVec 32) ValueCell!6947)) (size!22291 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45649)

(declare-fun e!457298 () Bool)

(declare-fun array_inv!17504 (array!45649) Bool)

(assert (=> start!70908 (and (array_inv!17504 _values!788) e!457298)))

(assert (=> start!70908 tp!45787))

(declare-fun b!822591 () Bool)

(declare-fun e!457297 () Bool)

(assert (=> b!822591 (= e!457298 (and e!457297 mapRes!23695))))

(declare-fun condMapEmpty!23695 () Bool)

(declare-fun mapDefault!23695 () ValueCell!6947)

(assert (=> b!822591 (= condMapEmpty!23695 (= (arr!21871 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6947)) mapDefault!23695)))))

(declare-fun b!822592 () Bool)

(declare-fun e!457295 () Bool)

(assert (=> b!822592 (= e!457295 tp_is_empty!14725)))

(declare-fun b!822593 () Bool)

(declare-fun e!457300 () Bool)

(assert (=> b!822593 (= e!457299 (not e!457300))))

(declare-fun res!560868 () Bool)

(assert (=> b!822593 (=> res!560868 e!457300)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822593 (= res!560868 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9696 0))(
  ( (tuple2!9697 (_1!4859 (_ BitVec 64)) (_2!4859 V!24635)) )
))
(declare-datatypes ((List!15488 0))(
  ( (Nil!15485) (Cons!15484 (h!16619 tuple2!9696) (t!21815 List!15488)) )
))
(declare-datatypes ((ListLongMap!8521 0))(
  ( (ListLongMap!8522 (toList!4276 List!15488)) )
))
(declare-fun lt!369706 () ListLongMap!8521)

(declare-fun lt!369705 () ListLongMap!8521)

(assert (=> b!822593 (= lt!369706 lt!369705)))

(declare-fun zeroValueAfter!34 () V!24635)

(declare-fun minValue!754 () V!24635)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24635)

(declare-datatypes ((Unit!28100 0))(
  ( (Unit!28101) )
))
(declare-fun lt!369707 () Unit!28100)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!453 (array!45647 array!45649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 V!24635 V!24635 (_ BitVec 32) Int) Unit!28100)

(assert (=> b!822593 (= lt!369707 (lemmaNoChangeToArrayThenSameMapNoExtras!453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2365 (array!45647 array!45649 (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 (_ BitVec 32) Int) ListLongMap!8521)

(assert (=> b!822593 (= lt!369705 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822593 (= lt!369706 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822594 () Bool)

(assert (=> b!822594 (= e!457297 tp_is_empty!14725)))

(declare-fun b!822595 () Bool)

(assert (=> b!822595 (= e!457300 (bvsle #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun lt!369704 () ListLongMap!8521)

(declare-fun getCurrentListMap!2432 (array!45647 array!45649 (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 (_ BitVec 32) Int) ListLongMap!8521)

(assert (=> b!822595 (= lt!369704 (getCurrentListMap!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822596 () Bool)

(declare-fun res!560864 () Bool)

(assert (=> b!822596 (=> (not res!560864) (not e!457299))))

(assert (=> b!822596 (= res!560864 (and (= (size!22291 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22290 _keys!976) (size!22291 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822597 () Bool)

(declare-fun res!560866 () Bool)

(assert (=> b!822597 (=> (not res!560866) (not e!457299))))

(declare-datatypes ((List!15489 0))(
  ( (Nil!15486) (Cons!15485 (h!16620 (_ BitVec 64)) (t!21816 List!15489)) )
))
(declare-fun arrayNoDuplicates!0 (array!45647 (_ BitVec 32) List!15489) Bool)

(assert (=> b!822597 (= res!560866 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15486))))

(declare-fun b!822598 () Bool)

(declare-fun res!560865 () Bool)

(assert (=> b!822598 (=> (not res!560865) (not e!457299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45647 (_ BitVec 32)) Bool)

(assert (=> b!822598 (= res!560865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23695 () Bool)

(declare-fun tp!45786 () Bool)

(assert (=> mapNonEmpty!23695 (= mapRes!23695 (and tp!45786 e!457295))))

(declare-fun mapValue!23695 () ValueCell!6947)

(declare-fun mapRest!23695 () (Array (_ BitVec 32) ValueCell!6947))

(declare-fun mapKey!23695 () (_ BitVec 32))

(assert (=> mapNonEmpty!23695 (= (arr!21871 _values!788) (store mapRest!23695 mapKey!23695 mapValue!23695))))

(assert (= (and start!70908 res!560867) b!822596))

(assert (= (and b!822596 res!560864) b!822598))

(assert (= (and b!822598 res!560865) b!822597))

(assert (= (and b!822597 res!560866) b!822593))

(assert (= (and b!822593 (not res!560868)) b!822595))

(assert (= (and b!822591 condMapEmpty!23695) mapIsEmpty!23695))

(assert (= (and b!822591 (not condMapEmpty!23695)) mapNonEmpty!23695))

(get-info :version)

(assert (= (and mapNonEmpty!23695 ((_ is ValueCellFull!6947) mapValue!23695)) b!822592))

(assert (= (and b!822591 ((_ is ValueCellFull!6947) mapDefault!23695)) b!822594))

(assert (= start!70908 b!822591))

(declare-fun m!764731 () Bool)

(assert (=> start!70908 m!764731))

(declare-fun m!764733 () Bool)

(assert (=> start!70908 m!764733))

(declare-fun m!764735 () Bool)

(assert (=> start!70908 m!764735))

(declare-fun m!764737 () Bool)

(assert (=> mapNonEmpty!23695 m!764737))

(declare-fun m!764739 () Bool)

(assert (=> b!822593 m!764739))

(declare-fun m!764741 () Bool)

(assert (=> b!822593 m!764741))

(declare-fun m!764743 () Bool)

(assert (=> b!822593 m!764743))

(declare-fun m!764745 () Bool)

(assert (=> b!822595 m!764745))

(declare-fun m!764747 () Bool)

(assert (=> b!822598 m!764747))

(declare-fun m!764749 () Bool)

(assert (=> b!822597 m!764749))

(check-sat (not b!822593) (not start!70908) (not b_next!13015) (not b!822598) (not mapNonEmpty!23695) b_and!21887 tp_is_empty!14725 (not b!822595) (not b!822597))
(check-sat b_and!21887 (not b_next!13015))
(get-model)

(declare-fun d!105111 () Bool)

(assert (=> d!105111 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70908 d!105111))

(declare-fun d!105113 () Bool)

(assert (=> d!105113 (= (array_inv!17503 _keys!976) (bvsge (size!22290 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70908 d!105113))

(declare-fun d!105115 () Bool)

(assert (=> d!105115 (= (array_inv!17504 _values!788) (bvsge (size!22291 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70908 d!105115))

(declare-fun d!105117 () Bool)

(assert (=> d!105117 (= (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369734 () Unit!28100)

(declare-fun choose!1404 (array!45647 array!45649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 V!24635 V!24635 (_ BitVec 32) Int) Unit!28100)

(assert (=> d!105117 (= lt!369734 (choose!1404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105117 (validMask!0 mask!1312)))

(assert (=> d!105117 (= (lemmaNoChangeToArrayThenSameMapNoExtras!453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369734)))

(declare-fun bs!22940 () Bool)

(assert (= bs!22940 d!105117))

(assert (=> bs!22940 m!764743))

(assert (=> bs!22940 m!764741))

(declare-fun m!764791 () Bool)

(assert (=> bs!22940 m!764791))

(assert (=> bs!22940 m!764731))

(assert (=> b!822593 d!105117))

(declare-fun b!822671 () Bool)

(declare-fun lt!369753 () Unit!28100)

(declare-fun lt!369752 () Unit!28100)

(assert (=> b!822671 (= lt!369753 lt!369752)))

(declare-fun lt!369749 () ListLongMap!8521)

(declare-fun lt!369754 () (_ BitVec 64))

(declare-fun lt!369755 () (_ BitVec 64))

(declare-fun lt!369751 () V!24635)

(declare-fun contains!4145 (ListLongMap!8521 (_ BitVec 64)) Bool)

(declare-fun +!1869 (ListLongMap!8521 tuple2!9696) ListLongMap!8521)

(assert (=> b!822671 (not (contains!4145 (+!1869 lt!369749 (tuple2!9697 lt!369754 lt!369751)) lt!369755))))

(declare-fun addStillNotContains!184 (ListLongMap!8521 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28100)

(assert (=> b!822671 (= lt!369752 (addStillNotContains!184 lt!369749 lt!369754 lt!369751 lt!369755))))

(assert (=> b!822671 (= lt!369755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11645 (ValueCell!6947 V!24635) V!24635)

(declare-fun dynLambda!965 (Int (_ BitVec 64)) V!24635)

(assert (=> b!822671 (= lt!369751 (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822671 (= lt!369754 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35770 () ListLongMap!8521)

(assert (=> b!822671 (= lt!369749 call!35770)))

(declare-fun e!457352 () ListLongMap!8521)

(assert (=> b!822671 (= e!457352 (+!1869 call!35770 (tuple2!9697 (select (arr!21870 _keys!976) #b00000000000000000000000000000000) (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822672 () Bool)

(declare-fun res!560909 () Bool)

(declare-fun e!457353 () Bool)

(assert (=> b!822672 (=> (not res!560909) (not e!457353))))

(declare-fun lt!369750 () ListLongMap!8521)

(assert (=> b!822672 (= res!560909 (not (contains!4145 lt!369750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!822673 () Bool)

(declare-fun e!457357 () ListLongMap!8521)

(assert (=> b!822673 (= e!457357 e!457352)))

(declare-fun c!89524 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!822673 (= c!89524 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822674 () Bool)

(assert (=> b!822674 (= e!457357 (ListLongMap!8522 Nil!15485))))

(declare-fun d!105119 () Bool)

(assert (=> d!105119 e!457353))

(declare-fun res!560907 () Bool)

(assert (=> d!105119 (=> (not res!560907) (not e!457353))))

(assert (=> d!105119 (= res!560907 (not (contains!4145 lt!369750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105119 (= lt!369750 e!457357)))

(declare-fun c!89523 () Bool)

(assert (=> d!105119 (= c!89523 (bvsge #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> d!105119 (validMask!0 mask!1312)))

(assert (=> d!105119 (= (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369750)))

(declare-fun b!822675 () Bool)

(declare-fun e!457355 () Bool)

(assert (=> b!822675 (= e!457355 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822675 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!457351 () Bool)

(declare-fun b!822676 () Bool)

(assert (=> b!822676 (= e!457351 (= lt!369750 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!822677 () Bool)

(declare-fun e!457356 () Bool)

(assert (=> b!822677 (= e!457356 e!457351)))

(declare-fun c!89525 () Bool)

(assert (=> b!822677 (= c!89525 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun b!822678 () Bool)

(assert (=> b!822678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> b!822678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22291 _values!788)))))

(declare-fun e!457354 () Bool)

(declare-fun apply!357 (ListLongMap!8521 (_ BitVec 64)) V!24635)

(assert (=> b!822678 (= e!457354 (= (apply!357 lt!369750 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)) (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822679 () Bool)

(declare-fun isEmpty!645 (ListLongMap!8521) Bool)

(assert (=> b!822679 (= e!457351 (isEmpty!645 lt!369750))))

(declare-fun b!822680 () Bool)

(assert (=> b!822680 (= e!457352 call!35770)))

(declare-fun b!822681 () Bool)

(assert (=> b!822681 (= e!457353 e!457356)))

(declare-fun c!89522 () Bool)

(assert (=> b!822681 (= c!89522 e!457355)))

(declare-fun res!560908 () Bool)

(assert (=> b!822681 (=> (not res!560908) (not e!457355))))

(assert (=> b!822681 (= res!560908 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun bm!35767 () Bool)

(assert (=> bm!35767 (= call!35770 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822682 () Bool)

(assert (=> b!822682 (= e!457356 e!457354)))

(assert (=> b!822682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun res!560910 () Bool)

(assert (=> b!822682 (= res!560910 (contains!4145 lt!369750 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822682 (=> (not res!560910) (not e!457354))))

(assert (= (and d!105119 c!89523) b!822674))

(assert (= (and d!105119 (not c!89523)) b!822673))

(assert (= (and b!822673 c!89524) b!822671))

(assert (= (and b!822673 (not c!89524)) b!822680))

(assert (= (or b!822671 b!822680) bm!35767))

(assert (= (and d!105119 res!560907) b!822672))

(assert (= (and b!822672 res!560909) b!822681))

(assert (= (and b!822681 res!560908) b!822675))

(assert (= (and b!822681 c!89522) b!822682))

(assert (= (and b!822681 (not c!89522)) b!822677))

(assert (= (and b!822682 res!560910) b!822678))

(assert (= (and b!822677 c!89525) b!822676))

(assert (= (and b!822677 (not c!89525)) b!822679))

(declare-fun b_lambda!11025 () Bool)

(assert (=> (not b_lambda!11025) (not b!822671)))

(declare-fun t!21820 () Bool)

(declare-fun tb!4187 () Bool)

(assert (=> (and start!70908 (= defaultEntry!796 defaultEntry!796) t!21820) tb!4187))

(declare-fun result!7917 () Bool)

(assert (=> tb!4187 (= result!7917 tp_is_empty!14725)))

(assert (=> b!822671 t!21820))

(declare-fun b_and!21893 () Bool)

(assert (= b_and!21887 (and (=> t!21820 result!7917) b_and!21893)))

(declare-fun b_lambda!11027 () Bool)

(assert (=> (not b_lambda!11027) (not b!822678)))

(assert (=> b!822678 t!21820))

(declare-fun b_and!21895 () Bool)

(assert (= b_and!21893 (and (=> t!21820 result!7917) b_and!21895)))

(declare-fun m!764793 () Bool)

(assert (=> b!822673 m!764793))

(assert (=> b!822673 m!764793))

(declare-fun m!764795 () Bool)

(assert (=> b!822673 m!764795))

(declare-fun m!764797 () Bool)

(assert (=> b!822676 m!764797))

(declare-fun m!764799 () Bool)

(assert (=> d!105119 m!764799))

(assert (=> d!105119 m!764731))

(declare-fun m!764801 () Bool)

(assert (=> b!822672 m!764801))

(assert (=> b!822682 m!764793))

(assert (=> b!822682 m!764793))

(declare-fun m!764803 () Bool)

(assert (=> b!822682 m!764803))

(assert (=> b!822675 m!764793))

(assert (=> b!822675 m!764793))

(assert (=> b!822675 m!764795))

(declare-fun m!764805 () Bool)

(assert (=> b!822671 m!764805))

(declare-fun m!764807 () Bool)

(assert (=> b!822671 m!764807))

(assert (=> b!822671 m!764793))

(declare-fun m!764809 () Bool)

(assert (=> b!822671 m!764809))

(declare-fun m!764811 () Bool)

(assert (=> b!822671 m!764811))

(assert (=> b!822671 m!764811))

(declare-fun m!764813 () Bool)

(assert (=> b!822671 m!764813))

(declare-fun m!764815 () Bool)

(assert (=> b!822671 m!764815))

(assert (=> b!822671 m!764813))

(assert (=> b!822671 m!764805))

(declare-fun m!764817 () Bool)

(assert (=> b!822671 m!764817))

(declare-fun m!764819 () Bool)

(assert (=> b!822679 m!764819))

(assert (=> bm!35767 m!764797))

(assert (=> b!822678 m!764793))

(assert (=> b!822678 m!764811))

(assert (=> b!822678 m!764811))

(assert (=> b!822678 m!764813))

(assert (=> b!822678 m!764815))

(assert (=> b!822678 m!764813))

(assert (=> b!822678 m!764793))

(declare-fun m!764821 () Bool)

(assert (=> b!822678 m!764821))

(assert (=> b!822593 d!105119))

(declare-fun b!822685 () Bool)

(declare-fun lt!369760 () Unit!28100)

(declare-fun lt!369759 () Unit!28100)

(assert (=> b!822685 (= lt!369760 lt!369759)))

(declare-fun lt!369758 () V!24635)

(declare-fun lt!369756 () ListLongMap!8521)

(declare-fun lt!369761 () (_ BitVec 64))

(declare-fun lt!369762 () (_ BitVec 64))

(assert (=> b!822685 (not (contains!4145 (+!1869 lt!369756 (tuple2!9697 lt!369761 lt!369758)) lt!369762))))

(assert (=> b!822685 (= lt!369759 (addStillNotContains!184 lt!369756 lt!369761 lt!369758 lt!369762))))

(assert (=> b!822685 (= lt!369762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!822685 (= lt!369758 (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822685 (= lt!369761 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35771 () ListLongMap!8521)

(assert (=> b!822685 (= lt!369756 call!35771)))

(declare-fun e!457359 () ListLongMap!8521)

(assert (=> b!822685 (= e!457359 (+!1869 call!35771 (tuple2!9697 (select (arr!21870 _keys!976) #b00000000000000000000000000000000) (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822686 () Bool)

(declare-fun res!560913 () Bool)

(declare-fun e!457360 () Bool)

(assert (=> b!822686 (=> (not res!560913) (not e!457360))))

(declare-fun lt!369757 () ListLongMap!8521)

(assert (=> b!822686 (= res!560913 (not (contains!4145 lt!369757 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!822687 () Bool)

(declare-fun e!457364 () ListLongMap!8521)

(assert (=> b!822687 (= e!457364 e!457359)))

(declare-fun c!89528 () Bool)

(assert (=> b!822687 (= c!89528 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822688 () Bool)

(assert (=> b!822688 (= e!457364 (ListLongMap!8522 Nil!15485))))

(declare-fun d!105121 () Bool)

(assert (=> d!105121 e!457360))

(declare-fun res!560911 () Bool)

(assert (=> d!105121 (=> (not res!560911) (not e!457360))))

(assert (=> d!105121 (= res!560911 (not (contains!4145 lt!369757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105121 (= lt!369757 e!457364)))

(declare-fun c!89527 () Bool)

(assert (=> d!105121 (= c!89527 (bvsge #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> d!105121 (validMask!0 mask!1312)))

(assert (=> d!105121 (= (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369757)))

(declare-fun b!822689 () Bool)

(declare-fun e!457362 () Bool)

(assert (=> b!822689 (= e!457362 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822689 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!457358 () Bool)

(declare-fun b!822690 () Bool)

(assert (=> b!822690 (= e!457358 (= lt!369757 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!822691 () Bool)

(declare-fun e!457363 () Bool)

(assert (=> b!822691 (= e!457363 e!457358)))

(declare-fun c!89529 () Bool)

(assert (=> b!822691 (= c!89529 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun b!822692 () Bool)

(assert (=> b!822692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> b!822692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22291 _values!788)))))

(declare-fun e!457361 () Bool)

(assert (=> b!822692 (= e!457361 (= (apply!357 lt!369757 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)) (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822693 () Bool)

(assert (=> b!822693 (= e!457358 (isEmpty!645 lt!369757))))

(declare-fun b!822694 () Bool)

(assert (=> b!822694 (= e!457359 call!35771)))

(declare-fun b!822695 () Bool)

(assert (=> b!822695 (= e!457360 e!457363)))

(declare-fun c!89526 () Bool)

(assert (=> b!822695 (= c!89526 e!457362)))

(declare-fun res!560912 () Bool)

(assert (=> b!822695 (=> (not res!560912) (not e!457362))))

(assert (=> b!822695 (= res!560912 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun bm!35768 () Bool)

(assert (=> bm!35768 (= call!35771 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822696 () Bool)

(assert (=> b!822696 (= e!457363 e!457361)))

(assert (=> b!822696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun res!560914 () Bool)

(assert (=> b!822696 (= res!560914 (contains!4145 lt!369757 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822696 (=> (not res!560914) (not e!457361))))

(assert (= (and d!105121 c!89527) b!822688))

(assert (= (and d!105121 (not c!89527)) b!822687))

(assert (= (and b!822687 c!89528) b!822685))

(assert (= (and b!822687 (not c!89528)) b!822694))

(assert (= (or b!822685 b!822694) bm!35768))

(assert (= (and d!105121 res!560911) b!822686))

(assert (= (and b!822686 res!560913) b!822695))

(assert (= (and b!822695 res!560912) b!822689))

(assert (= (and b!822695 c!89526) b!822696))

(assert (= (and b!822695 (not c!89526)) b!822691))

(assert (= (and b!822696 res!560914) b!822692))

(assert (= (and b!822691 c!89529) b!822690))

(assert (= (and b!822691 (not c!89529)) b!822693))

(declare-fun b_lambda!11029 () Bool)

(assert (=> (not b_lambda!11029) (not b!822685)))

(assert (=> b!822685 t!21820))

(declare-fun b_and!21897 () Bool)

(assert (= b_and!21895 (and (=> t!21820 result!7917) b_and!21897)))

(declare-fun b_lambda!11031 () Bool)

(assert (=> (not b_lambda!11031) (not b!822692)))

(assert (=> b!822692 t!21820))

(declare-fun b_and!21899 () Bool)

(assert (= b_and!21897 (and (=> t!21820 result!7917) b_and!21899)))

(assert (=> b!822687 m!764793))

(assert (=> b!822687 m!764793))

(assert (=> b!822687 m!764795))

(declare-fun m!764823 () Bool)

(assert (=> b!822690 m!764823))

(declare-fun m!764825 () Bool)

(assert (=> d!105121 m!764825))

(assert (=> d!105121 m!764731))

(declare-fun m!764827 () Bool)

(assert (=> b!822686 m!764827))

(assert (=> b!822696 m!764793))

(assert (=> b!822696 m!764793))

(declare-fun m!764829 () Bool)

(assert (=> b!822696 m!764829))

(assert (=> b!822689 m!764793))

(assert (=> b!822689 m!764793))

(assert (=> b!822689 m!764795))

(declare-fun m!764831 () Bool)

(assert (=> b!822685 m!764831))

(declare-fun m!764833 () Bool)

(assert (=> b!822685 m!764833))

(assert (=> b!822685 m!764793))

(declare-fun m!764835 () Bool)

(assert (=> b!822685 m!764835))

(assert (=> b!822685 m!764811))

(assert (=> b!822685 m!764811))

(assert (=> b!822685 m!764813))

(assert (=> b!822685 m!764815))

(assert (=> b!822685 m!764813))

(assert (=> b!822685 m!764831))

(declare-fun m!764837 () Bool)

(assert (=> b!822685 m!764837))

(declare-fun m!764839 () Bool)

(assert (=> b!822693 m!764839))

(assert (=> bm!35768 m!764823))

(assert (=> b!822692 m!764793))

(assert (=> b!822692 m!764811))

(assert (=> b!822692 m!764811))

(assert (=> b!822692 m!764813))

(assert (=> b!822692 m!764815))

(assert (=> b!822692 m!764813))

(assert (=> b!822692 m!764793))

(declare-fun m!764841 () Bool)

(assert (=> b!822692 m!764841))

(assert (=> b!822593 d!105121))

(declare-fun bm!35783 () Bool)

(declare-fun call!35790 () ListLongMap!8521)

(declare-fun c!89546 () Bool)

(declare-fun call!35788 () ListLongMap!8521)

(declare-fun call!35791 () ListLongMap!8521)

(declare-fun call!35786 () ListLongMap!8521)

(declare-fun c!89543 () Bool)

(assert (=> bm!35783 (= call!35786 (+!1869 (ite c!89543 call!35791 (ite c!89546 call!35788 call!35790)) (ite (or c!89543 c!89546) (tuple2!9697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!822739 () Bool)

(declare-fun res!560934 () Bool)

(declare-fun e!457392 () Bool)

(assert (=> b!822739 (=> (not res!560934) (not e!457392))))

(declare-fun e!457398 () Bool)

(assert (=> b!822739 (= res!560934 e!457398)))

(declare-fun c!89544 () Bool)

(assert (=> b!822739 (= c!89544 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!822740 () Bool)

(declare-fun e!457397 () ListLongMap!8521)

(declare-fun call!35789 () ListLongMap!8521)

(assert (=> b!822740 (= e!457397 call!35789)))

(declare-fun bm!35784 () Bool)

(assert (=> bm!35784 (= call!35790 call!35788)))

(declare-fun lt!369807 () ListLongMap!8521)

(declare-fun b!822741 () Bool)

(declare-fun e!457400 () Bool)

(assert (=> b!822741 (= e!457400 (= (apply!357 lt!369807 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)) (get!11645 (select (arr!21871 _values!788) #b00000000000000000000000000000000) (dynLambda!965 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!822741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22291 _values!788)))))

(assert (=> b!822741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun bm!35785 () Bool)

(assert (=> bm!35785 (= call!35791 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822742 () Bool)

(declare-fun e!457391 () Unit!28100)

(declare-fun lt!369823 () Unit!28100)

(assert (=> b!822742 (= e!457391 lt!369823)))

(declare-fun lt!369812 () ListLongMap!8521)

(assert (=> b!822742 (= lt!369812 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369821 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369808 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369808 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369810 () Unit!28100)

(declare-fun addStillContains!310 (ListLongMap!8521 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28100)

(assert (=> b!822742 (= lt!369810 (addStillContains!310 lt!369812 lt!369821 zeroValueBefore!34 lt!369808))))

(assert (=> b!822742 (contains!4145 (+!1869 lt!369812 (tuple2!9697 lt!369821 zeroValueBefore!34)) lt!369808)))

(declare-fun lt!369824 () Unit!28100)

(assert (=> b!822742 (= lt!369824 lt!369810)))

(declare-fun lt!369825 () ListLongMap!8521)

(assert (=> b!822742 (= lt!369825 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369816 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369826 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369826 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369817 () Unit!28100)

(declare-fun addApplyDifferent!310 (ListLongMap!8521 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28100)

(assert (=> b!822742 (= lt!369817 (addApplyDifferent!310 lt!369825 lt!369816 minValue!754 lt!369826))))

(assert (=> b!822742 (= (apply!357 (+!1869 lt!369825 (tuple2!9697 lt!369816 minValue!754)) lt!369826) (apply!357 lt!369825 lt!369826))))

(declare-fun lt!369811 () Unit!28100)

(assert (=> b!822742 (= lt!369811 lt!369817)))

(declare-fun lt!369818 () ListLongMap!8521)

(assert (=> b!822742 (= lt!369818 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369819 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369827 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369827 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369814 () Unit!28100)

(assert (=> b!822742 (= lt!369814 (addApplyDifferent!310 lt!369818 lt!369819 zeroValueBefore!34 lt!369827))))

(assert (=> b!822742 (= (apply!357 (+!1869 lt!369818 (tuple2!9697 lt!369819 zeroValueBefore!34)) lt!369827) (apply!357 lt!369818 lt!369827))))

(declare-fun lt!369809 () Unit!28100)

(assert (=> b!822742 (= lt!369809 lt!369814)))

(declare-fun lt!369815 () ListLongMap!8521)

(assert (=> b!822742 (= lt!369815 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369820 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369820 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369828 () (_ BitVec 64))

(assert (=> b!822742 (= lt!369828 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822742 (= lt!369823 (addApplyDifferent!310 lt!369815 lt!369820 minValue!754 lt!369828))))

(assert (=> b!822742 (= (apply!357 (+!1869 lt!369815 (tuple2!9697 lt!369820 minValue!754)) lt!369828) (apply!357 lt!369815 lt!369828))))

(declare-fun bm!35786 () Bool)

(assert (=> bm!35786 (= call!35789 call!35786)))

(declare-fun b!822743 () Bool)

(declare-fun c!89545 () Bool)

(assert (=> b!822743 (= c!89545 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!457394 () ListLongMap!8521)

(assert (=> b!822743 (= e!457397 e!457394)))

(declare-fun b!822744 () Bool)

(declare-fun e!457395 () Bool)

(assert (=> b!822744 (= e!457395 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822745 () Bool)

(declare-fun Unit!28106 () Unit!28100)

(assert (=> b!822745 (= e!457391 Unit!28106)))

(declare-fun b!822746 () Bool)

(declare-fun e!457399 () Bool)

(assert (=> b!822746 (= e!457399 e!457400)))

(declare-fun res!560935 () Bool)

(assert (=> b!822746 (=> (not res!560935) (not e!457400))))

(assert (=> b!822746 (= res!560935 (contains!4145 lt!369807 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun bm!35787 () Bool)

(declare-fun call!35792 () Bool)

(assert (=> bm!35787 (= call!35792 (contains!4145 lt!369807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!822747 () Bool)

(declare-fun e!457402 () Bool)

(assert (=> b!822747 (= e!457398 e!457402)))

(declare-fun res!560941 () Bool)

(declare-fun call!35787 () Bool)

(assert (=> b!822747 (= res!560941 call!35787)))

(assert (=> b!822747 (=> (not res!560941) (not e!457402))))

(declare-fun b!822748 () Bool)

(declare-fun e!457403 () ListLongMap!8521)

(assert (=> b!822748 (= e!457403 e!457397)))

(assert (=> b!822748 (= c!89546 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822749 () Bool)

(assert (=> b!822749 (= e!457402 (= (apply!357 lt!369807 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35788 () Bool)

(assert (=> bm!35788 (= call!35787 (contains!4145 lt!369807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!822750 () Bool)

(assert (=> b!822750 (= e!457403 (+!1869 call!35786 (tuple2!9697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!822751 () Bool)

(assert (=> b!822751 (= e!457398 (not call!35787))))

(declare-fun b!822752 () Bool)

(declare-fun e!457396 () Bool)

(assert (=> b!822752 (= e!457392 e!457396)))

(declare-fun c!89542 () Bool)

(assert (=> b!822752 (= c!89542 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!822753 () Bool)

(declare-fun e!457393 () Bool)

(assert (=> b!822753 (= e!457393 (= (apply!357 lt!369807 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!822754 () Bool)

(declare-fun e!457401 () Bool)

(assert (=> b!822754 (= e!457401 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35789 () Bool)

(assert (=> bm!35789 (= call!35788 call!35791)))

(declare-fun b!822755 () Bool)

(assert (=> b!822755 (= e!457394 call!35790)))

(declare-fun d!105123 () Bool)

(assert (=> d!105123 e!457392))

(declare-fun res!560937 () Bool)

(assert (=> d!105123 (=> (not res!560937) (not e!457392))))

(assert (=> d!105123 (= res!560937 (or (bvsge #b00000000000000000000000000000000 (size!22290 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))))

(declare-fun lt!369822 () ListLongMap!8521)

(assert (=> d!105123 (= lt!369807 lt!369822)))

(declare-fun lt!369813 () Unit!28100)

(assert (=> d!105123 (= lt!369813 e!457391)))

(declare-fun c!89547 () Bool)

(assert (=> d!105123 (= c!89547 e!457395)))

(declare-fun res!560939 () Bool)

(assert (=> d!105123 (=> (not res!560939) (not e!457395))))

(assert (=> d!105123 (= res!560939 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> d!105123 (= lt!369822 e!457403)))

(assert (=> d!105123 (= c!89543 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105123 (validMask!0 mask!1312)))

(assert (=> d!105123 (= (getCurrentListMap!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369807)))

(declare-fun b!822756 () Bool)

(assert (=> b!822756 (= e!457396 e!457393)))

(declare-fun res!560933 () Bool)

(assert (=> b!822756 (= res!560933 call!35792)))

(assert (=> b!822756 (=> (not res!560933) (not e!457393))))

(declare-fun b!822757 () Bool)

(declare-fun res!560936 () Bool)

(assert (=> b!822757 (=> (not res!560936) (not e!457392))))

(assert (=> b!822757 (= res!560936 e!457399)))

(declare-fun res!560940 () Bool)

(assert (=> b!822757 (=> res!560940 e!457399)))

(assert (=> b!822757 (= res!560940 (not e!457401))))

(declare-fun res!560938 () Bool)

(assert (=> b!822757 (=> (not res!560938) (not e!457401))))

(assert (=> b!822757 (= res!560938 (bvslt #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(declare-fun b!822758 () Bool)

(assert (=> b!822758 (= e!457394 call!35789)))

(declare-fun b!822759 () Bool)

(assert (=> b!822759 (= e!457396 (not call!35792))))

(assert (= (and d!105123 c!89543) b!822750))

(assert (= (and d!105123 (not c!89543)) b!822748))

(assert (= (and b!822748 c!89546) b!822740))

(assert (= (and b!822748 (not c!89546)) b!822743))

(assert (= (and b!822743 c!89545) b!822758))

(assert (= (and b!822743 (not c!89545)) b!822755))

(assert (= (or b!822758 b!822755) bm!35784))

(assert (= (or b!822740 bm!35784) bm!35789))

(assert (= (or b!822740 b!822758) bm!35786))

(assert (= (or b!822750 bm!35789) bm!35785))

(assert (= (or b!822750 bm!35786) bm!35783))

(assert (= (and d!105123 res!560939) b!822744))

(assert (= (and d!105123 c!89547) b!822742))

(assert (= (and d!105123 (not c!89547)) b!822745))

(assert (= (and d!105123 res!560937) b!822757))

(assert (= (and b!822757 res!560938) b!822754))

(assert (= (and b!822757 (not res!560940)) b!822746))

(assert (= (and b!822746 res!560935) b!822741))

(assert (= (and b!822757 res!560936) b!822739))

(assert (= (and b!822739 c!89544) b!822747))

(assert (= (and b!822739 (not c!89544)) b!822751))

(assert (= (and b!822747 res!560941) b!822749))

(assert (= (or b!822747 b!822751) bm!35788))

(assert (= (and b!822739 res!560934) b!822752))

(assert (= (and b!822752 c!89542) b!822756))

(assert (= (and b!822752 (not c!89542)) b!822759))

(assert (= (and b!822756 res!560933) b!822753))

(assert (= (or b!822756 b!822759) bm!35787))

(declare-fun b_lambda!11033 () Bool)

(assert (=> (not b_lambda!11033) (not b!822741)))

(assert (=> b!822741 t!21820))

(declare-fun b_and!21901 () Bool)

(assert (= b_and!21899 (and (=> t!21820 result!7917) b_and!21901)))

(declare-fun m!764843 () Bool)

(assert (=> b!822749 m!764843))

(assert (=> b!822744 m!764793))

(assert (=> b!822744 m!764793))

(assert (=> b!822744 m!764795))

(declare-fun m!764845 () Bool)

(assert (=> b!822750 m!764845))

(declare-fun m!764847 () Bool)

(assert (=> b!822753 m!764847))

(declare-fun m!764849 () Bool)

(assert (=> bm!35787 m!764849))

(assert (=> b!822754 m!764793))

(assert (=> b!822754 m!764793))

(assert (=> b!822754 m!764795))

(assert (=> b!822746 m!764793))

(assert (=> b!822746 m!764793))

(declare-fun m!764851 () Bool)

(assert (=> b!822746 m!764851))

(assert (=> bm!35785 m!764743))

(assert (=> b!822741 m!764811))

(assert (=> b!822741 m!764813))

(assert (=> b!822741 m!764793))

(assert (=> b!822741 m!764811))

(assert (=> b!822741 m!764813))

(assert (=> b!822741 m!764815))

(assert (=> b!822741 m!764793))

(declare-fun m!764853 () Bool)

(assert (=> b!822741 m!764853))

(declare-fun m!764855 () Bool)

(assert (=> b!822742 m!764855))

(declare-fun m!764857 () Bool)

(assert (=> b!822742 m!764857))

(declare-fun m!764859 () Bool)

(assert (=> b!822742 m!764859))

(declare-fun m!764861 () Bool)

(assert (=> b!822742 m!764861))

(declare-fun m!764863 () Bool)

(assert (=> b!822742 m!764863))

(assert (=> b!822742 m!764861))

(declare-fun m!764865 () Bool)

(assert (=> b!822742 m!764865))

(declare-fun m!764867 () Bool)

(assert (=> b!822742 m!764867))

(declare-fun m!764869 () Bool)

(assert (=> b!822742 m!764869))

(declare-fun m!764871 () Bool)

(assert (=> b!822742 m!764871))

(assert (=> b!822742 m!764855))

(declare-fun m!764873 () Bool)

(assert (=> b!822742 m!764873))

(declare-fun m!764875 () Bool)

(assert (=> b!822742 m!764875))

(assert (=> b!822742 m!764867))

(declare-fun m!764877 () Bool)

(assert (=> b!822742 m!764877))

(declare-fun m!764879 () Bool)

(assert (=> b!822742 m!764879))

(assert (=> b!822742 m!764793))

(assert (=> b!822742 m!764743))

(declare-fun m!764881 () Bool)

(assert (=> b!822742 m!764881))

(declare-fun m!764883 () Bool)

(assert (=> b!822742 m!764883))

(assert (=> b!822742 m!764881))

(declare-fun m!764885 () Bool)

(assert (=> bm!35783 m!764885))

(declare-fun m!764887 () Bool)

(assert (=> bm!35788 m!764887))

(assert (=> d!105123 m!764731))

(assert (=> b!822595 d!105123))

(declare-fun d!105125 () Bool)

(declare-fun res!560947 () Bool)

(declare-fun e!457411 () Bool)

(assert (=> d!105125 (=> res!560947 e!457411)))

(assert (=> d!105125 (= res!560947 (bvsge #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> d!105125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!457411)))

(declare-fun b!822768 () Bool)

(declare-fun e!457412 () Bool)

(declare-fun e!457410 () Bool)

(assert (=> b!822768 (= e!457412 e!457410)))

(declare-fun lt!369835 () (_ BitVec 64))

(assert (=> b!822768 (= lt!369835 (select (arr!21870 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369837 () Unit!28100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45647 (_ BitVec 64) (_ BitVec 32)) Unit!28100)

(assert (=> b!822768 (= lt!369837 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!822768 (arrayContainsKey!0 _keys!976 lt!369835 #b00000000000000000000000000000000)))

(declare-fun lt!369836 () Unit!28100)

(assert (=> b!822768 (= lt!369836 lt!369837)))

(declare-fun res!560946 () Bool)

(declare-datatypes ((SeekEntryResult!8680 0))(
  ( (MissingZero!8680 (index!37091 (_ BitVec 32))) (Found!8680 (index!37092 (_ BitVec 32))) (Intermediate!8680 (undefined!9492 Bool) (index!37093 (_ BitVec 32)) (x!69254 (_ BitVec 32))) (Undefined!8680) (MissingVacant!8680 (index!37094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45647 (_ BitVec 32)) SeekEntryResult!8680)

(assert (=> b!822768 (= res!560946 (= (seekEntryOrOpen!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8680 #b00000000000000000000000000000000)))))

(assert (=> b!822768 (=> (not res!560946) (not e!457410))))

(declare-fun b!822769 () Bool)

(declare-fun call!35795 () Bool)

(assert (=> b!822769 (= e!457412 call!35795)))

(declare-fun b!822770 () Bool)

(assert (=> b!822770 (= e!457411 e!457412)))

(declare-fun c!89550 () Bool)

(assert (=> b!822770 (= c!89550 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822771 () Bool)

(assert (=> b!822771 (= e!457410 call!35795)))

(declare-fun bm!35792 () Bool)

(assert (=> bm!35792 (= call!35795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105125 (not res!560947)) b!822770))

(assert (= (and b!822770 c!89550) b!822768))

(assert (= (and b!822770 (not c!89550)) b!822769))

(assert (= (and b!822768 res!560946) b!822771))

(assert (= (or b!822771 b!822769) bm!35792))

(assert (=> b!822768 m!764793))

(declare-fun m!764889 () Bool)

(assert (=> b!822768 m!764889))

(declare-fun m!764891 () Bool)

(assert (=> b!822768 m!764891))

(assert (=> b!822768 m!764793))

(declare-fun m!764893 () Bool)

(assert (=> b!822768 m!764893))

(assert (=> b!822770 m!764793))

(assert (=> b!822770 m!764793))

(assert (=> b!822770 m!764795))

(declare-fun m!764895 () Bool)

(assert (=> bm!35792 m!764895))

(assert (=> b!822598 d!105125))

(declare-fun b!822782 () Bool)

(declare-fun e!457424 () Bool)

(declare-fun call!35798 () Bool)

(assert (=> b!822782 (= e!457424 call!35798)))

(declare-fun b!822783 () Bool)

(declare-fun e!457423 () Bool)

(assert (=> b!822783 (= e!457423 e!457424)))

(declare-fun c!89553 () Bool)

(assert (=> b!822783 (= c!89553 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822784 () Bool)

(declare-fun e!457422 () Bool)

(assert (=> b!822784 (= e!457422 e!457423)))

(declare-fun res!560956 () Bool)

(assert (=> b!822784 (=> (not res!560956) (not e!457423))))

(declare-fun e!457421 () Bool)

(assert (=> b!822784 (= res!560956 (not e!457421))))

(declare-fun res!560955 () Bool)

(assert (=> b!822784 (=> (not res!560955) (not e!457421))))

(assert (=> b!822784 (= res!560955 (validKeyInArray!0 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822785 () Bool)

(declare-fun contains!4146 (List!15489 (_ BitVec 64)) Bool)

(assert (=> b!822785 (= e!457421 (contains!4146 Nil!15486 (select (arr!21870 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35795 () Bool)

(assert (=> bm!35795 (= call!35798 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89553 (Cons!15485 (select (arr!21870 _keys!976) #b00000000000000000000000000000000) Nil!15486) Nil!15486)))))

(declare-fun b!822786 () Bool)

(assert (=> b!822786 (= e!457424 call!35798)))

(declare-fun d!105127 () Bool)

(declare-fun res!560954 () Bool)

(assert (=> d!105127 (=> res!560954 e!457422)))

(assert (=> d!105127 (= res!560954 (bvsge #b00000000000000000000000000000000 (size!22290 _keys!976)))))

(assert (=> d!105127 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15486) e!457422)))

(assert (= (and d!105127 (not res!560954)) b!822784))

(assert (= (and b!822784 res!560955) b!822785))

(assert (= (and b!822784 res!560956) b!822783))

(assert (= (and b!822783 c!89553) b!822786))

(assert (= (and b!822783 (not c!89553)) b!822782))

(assert (= (or b!822786 b!822782) bm!35795))

(assert (=> b!822783 m!764793))

(assert (=> b!822783 m!764793))

(assert (=> b!822783 m!764795))

(assert (=> b!822784 m!764793))

(assert (=> b!822784 m!764793))

(assert (=> b!822784 m!764795))

(assert (=> b!822785 m!764793))

(assert (=> b!822785 m!764793))

(declare-fun m!764897 () Bool)

(assert (=> b!822785 m!764897))

(assert (=> bm!35795 m!764793))

(declare-fun m!764899 () Bool)

(assert (=> bm!35795 m!764899))

(assert (=> b!822597 d!105127))

(declare-fun condMapEmpty!23704 () Bool)

(declare-fun mapDefault!23704 () ValueCell!6947)

(assert (=> mapNonEmpty!23695 (= condMapEmpty!23704 (= mapRest!23695 ((as const (Array (_ BitVec 32) ValueCell!6947)) mapDefault!23704)))))

(declare-fun e!457430 () Bool)

(declare-fun mapRes!23704 () Bool)

(assert (=> mapNonEmpty!23695 (= tp!45786 (and e!457430 mapRes!23704))))

(declare-fun b!822794 () Bool)

(assert (=> b!822794 (= e!457430 tp_is_empty!14725)))

(declare-fun mapNonEmpty!23704 () Bool)

(declare-fun tp!45802 () Bool)

(declare-fun e!457429 () Bool)

(assert (=> mapNonEmpty!23704 (= mapRes!23704 (and tp!45802 e!457429))))

(declare-fun mapValue!23704 () ValueCell!6947)

(declare-fun mapKey!23704 () (_ BitVec 32))

(declare-fun mapRest!23704 () (Array (_ BitVec 32) ValueCell!6947))

(assert (=> mapNonEmpty!23704 (= mapRest!23695 (store mapRest!23704 mapKey!23704 mapValue!23704))))

(declare-fun mapIsEmpty!23704 () Bool)

(assert (=> mapIsEmpty!23704 mapRes!23704))

(declare-fun b!822793 () Bool)

(assert (=> b!822793 (= e!457429 tp_is_empty!14725)))

(assert (= (and mapNonEmpty!23695 condMapEmpty!23704) mapIsEmpty!23704))

(assert (= (and mapNonEmpty!23695 (not condMapEmpty!23704)) mapNonEmpty!23704))

(assert (= (and mapNonEmpty!23704 ((_ is ValueCellFull!6947) mapValue!23704)) b!822793))

(assert (= (and mapNonEmpty!23695 ((_ is ValueCellFull!6947) mapDefault!23704)) b!822794))

(declare-fun m!764901 () Bool)

(assert (=> mapNonEmpty!23704 m!764901))

(declare-fun b_lambda!11035 () Bool)

(assert (= b_lambda!11027 (or (and start!70908 b_free!13015) b_lambda!11035)))

(declare-fun b_lambda!11037 () Bool)

(assert (= b_lambda!11031 (or (and start!70908 b_free!13015) b_lambda!11037)))

(declare-fun b_lambda!11039 () Bool)

(assert (= b_lambda!11025 (or (and start!70908 b_free!13015) b_lambda!11039)))

(declare-fun b_lambda!11041 () Bool)

(assert (= b_lambda!11033 (or (and start!70908 b_free!13015) b_lambda!11041)))

(declare-fun b_lambda!11043 () Bool)

(assert (= b_lambda!11029 (or (and start!70908 b_free!13015) b_lambda!11043)))

(check-sat (not b!822675) (not b!822678) (not b!822686) (not b_next!13015) (not b!822754) (not bm!35767) (not b!822679) (not bm!35768) (not b!822685) (not b!822682) (not b!822753) (not b!822690) (not b!822741) (not mapNonEmpty!23704) (not b!822673) (not b!822750) (not b!822744) (not b_lambda!11043) (not bm!35792) (not b!822693) (not bm!35785) (not d!105121) (not b!822671) (not b!822696) (not b_lambda!11039) (not bm!35787) (not b!822742) (not b!822687) (not b_lambda!11041) (not b!822783) b_and!21901 (not d!105117) (not b!822784) (not b_lambda!11037) (not bm!35788) (not b!822676) (not b!822785) (not b!822768) (not b!822689) (not b!822770) (not b!822672) (not bm!35783) (not b!822746) tp_is_empty!14725 (not b_lambda!11035) (not b!822692) (not b!822749) (not bm!35795) (not d!105119) (not d!105123))
(check-sat b_and!21901 (not b_next!13015))
