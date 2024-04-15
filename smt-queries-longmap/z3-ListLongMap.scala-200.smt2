; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3838 () Bool)

(assert start!3838)

(declare-fun b_free!787 () Bool)

(declare-fun b_next!787 () Bool)

(assert (=> start!3838 (= b_free!787 (not b_next!787))))

(declare-fun tp!3775 () Bool)

(declare-fun b_and!1587 () Bool)

(assert (=> start!3838 (= tp!3775 b_and!1587)))

(declare-fun b!26933 () Bool)

(declare-fun res!15959 () Bool)

(declare-fun e!17558 () Bool)

(assert (=> b!26933 (=> (not res!15959) (not e!17558))))

(declare-datatypes ((V!1347 0))(
  ( (V!1348 (val!597 Int)) )
))
(declare-datatypes ((ValueCell!371 0))(
  ( (ValueCellFull!371 (v!1683 V!1347)) (EmptyCell!371) )
))
(declare-datatypes ((array!1497 0))(
  ( (array!1498 (arr!704 (Array (_ BitVec 32) ValueCell!371)) (size!805 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1497)

(declare-datatypes ((array!1499 0))(
  ( (array!1500 (arr!705 (Array (_ BitVec 32) (_ BitVec 64))) (size!806 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1499)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26933 (= res!15959 (and (= (size!805 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!806 _keys!1833) (size!805 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26934 () Bool)

(declare-fun res!15962 () Bool)

(assert (=> b!26934 (=> (not res!15962) (not e!17558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1499 (_ BitVec 32)) Bool)

(assert (=> b!26934 (= res!15962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26935 () Bool)

(declare-fun res!15961 () Bool)

(assert (=> b!26935 (=> (not res!15961) (not e!17558))))

(declare-datatypes ((List!601 0))(
  ( (Nil!598) (Cons!597 (h!1164 (_ BitVec 64)) (t!3283 List!601)) )
))
(declare-fun arrayNoDuplicates!0 (array!1499 (_ BitVec 32) List!601) Bool)

(assert (=> b!26935 (= res!15961 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!598))))

(declare-fun b!26936 () Bool)

(declare-fun res!15964 () Bool)

(assert (=> b!26936 (=> (not res!15964) (not e!17558))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26936 (= res!15964 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1234 () Bool)

(declare-fun mapRes!1234 () Bool)

(declare-fun tp!3774 () Bool)

(declare-fun e!17557 () Bool)

(assert (=> mapNonEmpty!1234 (= mapRes!1234 (and tp!3774 e!17557))))

(declare-fun mapKey!1234 () (_ BitVec 32))

(declare-fun mapValue!1234 () ValueCell!371)

(declare-fun mapRest!1234 () (Array (_ BitVec 32) ValueCell!371))

(assert (=> mapNonEmpty!1234 (= (arr!704 _values!1501) (store mapRest!1234 mapKey!1234 mapValue!1234))))

(declare-fun b!26937 () Bool)

(declare-fun e!17560 () Bool)

(declare-fun tp_is_empty!1141 () Bool)

(assert (=> b!26937 (= e!17560 tp_is_empty!1141)))

(declare-fun b!26938 () Bool)

(declare-fun e!17556 () Bool)

(assert (=> b!26938 (= e!17556 (and e!17560 mapRes!1234))))

(declare-fun condMapEmpty!1234 () Bool)

(declare-fun mapDefault!1234 () ValueCell!371)

(assert (=> b!26938 (= condMapEmpty!1234 (= (arr!704 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!371)) mapDefault!1234)))))

(declare-fun b!26939 () Bool)

(assert (=> b!26939 (= e!17558 (and (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)) (bvsge (size!806 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26940 () Bool)

(assert (=> b!26940 (= e!17557 tp_is_empty!1141)))

(declare-fun b!26941 () Bool)

(declare-fun res!15963 () Bool)

(assert (=> b!26941 (=> (not res!15963) (not e!17558))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1347)

(declare-fun minValue!1443 () V!1347)

(declare-datatypes ((tuple2!1014 0))(
  ( (tuple2!1015 (_1!518 (_ BitVec 64)) (_2!518 V!1347)) )
))
(declare-datatypes ((List!602 0))(
  ( (Nil!599) (Cons!598 (h!1165 tuple2!1014) (t!3284 List!602)) )
))
(declare-datatypes ((ListLongMap!579 0))(
  ( (ListLongMap!580 (toList!305 List!602)) )
))
(declare-fun contains!244 (ListLongMap!579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!135 (array!1499 array!1497 (_ BitVec 32) (_ BitVec 32) V!1347 V!1347 (_ BitVec 32) Int) ListLongMap!579)

(assert (=> b!26941 (= res!15963 (not (contains!244 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1234 () Bool)

(assert (=> mapIsEmpty!1234 mapRes!1234))

(declare-fun res!15960 () Bool)

(assert (=> start!3838 (=> (not res!15960) (not e!17558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3838 (= res!15960 (validMask!0 mask!2294))))

(assert (=> start!3838 e!17558))

(assert (=> start!3838 true))

(assert (=> start!3838 tp!3775))

(declare-fun array_inv!499 (array!1497) Bool)

(assert (=> start!3838 (and (array_inv!499 _values!1501) e!17556)))

(declare-fun array_inv!500 (array!1499) Bool)

(assert (=> start!3838 (array_inv!500 _keys!1833)))

(assert (=> start!3838 tp_is_empty!1141))

(assert (= (and start!3838 res!15960) b!26933))

(assert (= (and b!26933 res!15959) b!26934))

(assert (= (and b!26934 res!15962) b!26935))

(assert (= (and b!26935 res!15961) b!26936))

(assert (= (and b!26936 res!15964) b!26941))

(assert (= (and b!26941 res!15963) b!26939))

(assert (= (and b!26938 condMapEmpty!1234) mapIsEmpty!1234))

(assert (= (and b!26938 (not condMapEmpty!1234)) mapNonEmpty!1234))

(get-info :version)

(assert (= (and mapNonEmpty!1234 ((_ is ValueCellFull!371) mapValue!1234)) b!26940))

(assert (= (and b!26938 ((_ is ValueCellFull!371) mapDefault!1234)) b!26937))

(assert (= start!3838 b!26938))

(declare-fun m!21507 () Bool)

(assert (=> b!26941 m!21507))

(assert (=> b!26941 m!21507))

(declare-fun m!21509 () Bool)

(assert (=> b!26941 m!21509))

(declare-fun m!21511 () Bool)

(assert (=> b!26934 m!21511))

(declare-fun m!21513 () Bool)

(assert (=> start!3838 m!21513))

(declare-fun m!21515 () Bool)

(assert (=> start!3838 m!21515))

(declare-fun m!21517 () Bool)

(assert (=> start!3838 m!21517))

(declare-fun m!21519 () Bool)

(assert (=> b!26935 m!21519))

(declare-fun m!21521 () Bool)

(assert (=> b!26936 m!21521))

(declare-fun m!21523 () Bool)

(assert (=> mapNonEmpty!1234 m!21523))

(check-sat (not b_next!787) (not start!3838) (not b!26935) (not b!26936) b_and!1587 (not b!26934) (not b!26941) (not mapNonEmpty!1234) tp_is_empty!1141)
(check-sat b_and!1587 (not b_next!787))
(get-model)

(declare-fun d!4891 () Bool)

(declare-fun e!17595 () Bool)

(assert (=> d!4891 e!17595))

(declare-fun res!16003 () Bool)

(assert (=> d!4891 (=> res!16003 e!17595)))

(declare-fun lt!10503 () Bool)

(assert (=> d!4891 (= res!16003 (not lt!10503))))

(declare-fun lt!10501 () Bool)

(assert (=> d!4891 (= lt!10503 lt!10501)))

(declare-datatypes ((Unit!638 0))(
  ( (Unit!639) )
))
(declare-fun lt!10504 () Unit!638)

(declare-fun e!17596 () Unit!638)

(assert (=> d!4891 (= lt!10504 e!17596)))

(declare-fun c!3675 () Bool)

(assert (=> d!4891 (= c!3675 lt!10501)))

(declare-fun containsKey!26 (List!602 (_ BitVec 64)) Bool)

(assert (=> d!4891 (= lt!10501 (containsKey!26 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4891 (= (contains!244 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10503)))

(declare-fun b!27002 () Bool)

(declare-fun lt!10502 () Unit!638)

(assert (=> b!27002 (= e!17596 lt!10502)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!23 (List!602 (_ BitVec 64)) Unit!638)

(assert (=> b!27002 (= lt!10502 (lemmaContainsKeyImpliesGetValueByKeyDefined!23 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!68 0))(
  ( (Some!67 (v!1686 V!1347)) (None!66) )
))
(declare-fun isDefined!24 (Option!68) Bool)

(declare-fun getValueByKey!62 (List!602 (_ BitVec 64)) Option!68)

(assert (=> b!27002 (isDefined!24 (getValueByKey!62 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27003 () Bool)

(declare-fun Unit!640 () Unit!638)

(assert (=> b!27003 (= e!17596 Unit!640)))

(declare-fun b!27004 () Bool)

(assert (=> b!27004 (= e!17595 (isDefined!24 (getValueByKey!62 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4891 c!3675) b!27002))

(assert (= (and d!4891 (not c!3675)) b!27003))

(assert (= (and d!4891 (not res!16003)) b!27004))

(declare-fun m!21561 () Bool)

(assert (=> d!4891 m!21561))

(declare-fun m!21563 () Bool)

(assert (=> b!27002 m!21563))

(declare-fun m!21565 () Bool)

(assert (=> b!27002 m!21565))

(assert (=> b!27002 m!21565))

(declare-fun m!21567 () Bool)

(assert (=> b!27002 m!21567))

(assert (=> b!27004 m!21565))

(assert (=> b!27004 m!21565))

(assert (=> b!27004 m!21567))

(assert (=> b!26941 d!4891))

(declare-fun b!27047 () Bool)

(declare-fun e!17624 () Bool)

(declare-fun lt!10562 () ListLongMap!579)

(declare-fun apply!31 (ListLongMap!579 (_ BitVec 64)) V!1347)

(assert (=> b!27047 (= e!17624 (= (apply!31 lt!10562 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!27048 () Bool)

(declare-fun e!17633 () Bool)

(assert (=> b!27048 (= e!17633 (validKeyInArray!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27049 () Bool)

(declare-fun e!17625 () Bool)

(declare-fun e!17630 () Bool)

(assert (=> b!27049 (= e!17625 e!17630)))

(declare-fun res!16030 () Bool)

(assert (=> b!27049 (=> (not res!16030) (not e!17630))))

(assert (=> b!27049 (= res!16030 (contains!244 lt!10562 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(declare-fun b!27050 () Bool)

(declare-fun e!17632 () Bool)

(declare-fun e!17623 () Bool)

(assert (=> b!27050 (= e!17632 e!17623)))

(declare-fun c!3689 () Bool)

(assert (=> b!27050 (= c!3689 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27051 () Bool)

(declare-fun e!17629 () ListLongMap!579)

(declare-fun call!2552 () ListLongMap!579)

(assert (=> b!27051 (= e!17629 call!2552)))

(declare-fun bm!2546 () Bool)

(declare-fun call!2554 () ListLongMap!579)

(declare-fun call!2550 () ListLongMap!579)

(assert (=> bm!2546 (= call!2554 call!2550)))

(declare-fun b!27052 () Bool)

(declare-fun e!17634 () Bool)

(assert (=> b!27052 (= e!17634 (validKeyInArray!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27053 () Bool)

(declare-fun res!16022 () Bool)

(assert (=> b!27053 (=> (not res!16022) (not e!17632))))

(assert (=> b!27053 (= res!16022 e!17625)))

(declare-fun res!16029 () Bool)

(assert (=> b!27053 (=> res!16029 e!17625)))

(assert (=> b!27053 (= res!16029 (not e!17634))))

(declare-fun res!16026 () Bool)

(assert (=> b!27053 (=> (not res!16026) (not e!17634))))

(assert (=> b!27053 (= res!16026 (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(declare-fun b!27054 () Bool)

(declare-fun call!2553 () ListLongMap!579)

(assert (=> b!27054 (= e!17629 call!2553)))

(declare-fun b!27055 () Bool)

(declare-fun e!17635 () Unit!638)

(declare-fun Unit!641 () Unit!638)

(assert (=> b!27055 (= e!17635 Unit!641)))

(declare-fun b!27056 () Bool)

(declare-fun lt!10557 () Unit!638)

(assert (=> b!27056 (= e!17635 lt!10557)))

(declare-fun lt!10570 () ListLongMap!579)

(declare-fun getCurrentListMapNoExtraKeys!18 (array!1499 array!1497 (_ BitVec 32) (_ BitVec 32) V!1347 V!1347 (_ BitVec 32) Int) ListLongMap!579)

(assert (=> b!27056 (= lt!10570 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10552 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10569 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10569 (select (arr!705 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10559 () Unit!638)

(declare-fun addStillContains!16 (ListLongMap!579 (_ BitVec 64) V!1347 (_ BitVec 64)) Unit!638)

(assert (=> b!27056 (= lt!10559 (addStillContains!16 lt!10570 lt!10552 zeroValue!1443 lt!10569))))

(declare-fun +!49 (ListLongMap!579 tuple2!1014) ListLongMap!579)

(assert (=> b!27056 (contains!244 (+!49 lt!10570 (tuple2!1015 lt!10552 zeroValue!1443)) lt!10569)))

(declare-fun lt!10556 () Unit!638)

(assert (=> b!27056 (= lt!10556 lt!10559)))

(declare-fun lt!10560 () ListLongMap!579)

(assert (=> b!27056 (= lt!10560 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10550 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10551 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10551 (select (arr!705 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10553 () Unit!638)

(declare-fun addApplyDifferent!16 (ListLongMap!579 (_ BitVec 64) V!1347 (_ BitVec 64)) Unit!638)

(assert (=> b!27056 (= lt!10553 (addApplyDifferent!16 lt!10560 lt!10550 minValue!1443 lt!10551))))

(assert (=> b!27056 (= (apply!31 (+!49 lt!10560 (tuple2!1015 lt!10550 minValue!1443)) lt!10551) (apply!31 lt!10560 lt!10551))))

(declare-fun lt!10565 () Unit!638)

(assert (=> b!27056 (= lt!10565 lt!10553)))

(declare-fun lt!10549 () ListLongMap!579)

(assert (=> b!27056 (= lt!10549 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10561 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10566 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10566 (select (arr!705 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10563 () Unit!638)

(assert (=> b!27056 (= lt!10563 (addApplyDifferent!16 lt!10549 lt!10561 zeroValue!1443 lt!10566))))

(assert (=> b!27056 (= (apply!31 (+!49 lt!10549 (tuple2!1015 lt!10561 zeroValue!1443)) lt!10566) (apply!31 lt!10549 lt!10566))))

(declare-fun lt!10564 () Unit!638)

(assert (=> b!27056 (= lt!10564 lt!10563)))

(declare-fun lt!10568 () ListLongMap!579)

(assert (=> b!27056 (= lt!10568 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10567 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10555 () (_ BitVec 64))

(assert (=> b!27056 (= lt!10555 (select (arr!705 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27056 (= lt!10557 (addApplyDifferent!16 lt!10568 lt!10567 minValue!1443 lt!10555))))

(assert (=> b!27056 (= (apply!31 (+!49 lt!10568 (tuple2!1015 lt!10567 minValue!1443)) lt!10555) (apply!31 lt!10568 lt!10555))))

(declare-fun bm!2547 () Bool)

(declare-fun call!2555 () Bool)

(assert (=> bm!2547 (= call!2555 (contains!244 lt!10562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27057 () Bool)

(declare-fun res!16028 () Bool)

(assert (=> b!27057 (=> (not res!16028) (not e!17632))))

(declare-fun e!17626 () Bool)

(assert (=> b!27057 (= res!16028 e!17626)))

(declare-fun c!3691 () Bool)

(assert (=> b!27057 (= c!3691 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!2549 () ListLongMap!579)

(declare-fun c!3688 () Bool)

(declare-fun c!3692 () Bool)

(declare-fun bm!2548 () Bool)

(assert (=> bm!2548 (= call!2549 (+!49 (ite c!3692 call!2550 (ite c!3688 call!2554 call!2553)) (ite (or c!3692 c!3688) (tuple2!1015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!27058 () Bool)

(declare-fun e!17627 () Bool)

(assert (=> b!27058 (= e!17626 e!17627)))

(declare-fun res!16024 () Bool)

(assert (=> b!27058 (= res!16024 call!2555)))

(assert (=> b!27058 (=> (not res!16024) (not e!17627))))

(declare-fun b!27059 () Bool)

(declare-fun get!436 (ValueCell!371 V!1347) V!1347)

(declare-fun dynLambda!147 (Int (_ BitVec 64)) V!1347)

(assert (=> b!27059 (= e!17630 (= (apply!31 lt!10562 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)) (get!436 (select (arr!704 _values!1501) #b00000000000000000000000000000000) (dynLambda!147 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!805 _values!1501)))))

(assert (=> b!27059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(declare-fun b!27060 () Bool)

(assert (=> b!27060 (= e!17627 (= (apply!31 lt!10562 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2549 () Bool)

(assert (=> bm!2549 (= call!2550 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!27061 () Bool)

(declare-fun call!2551 () Bool)

(assert (=> b!27061 (= e!17623 (not call!2551))))

(declare-fun d!4893 () Bool)

(assert (=> d!4893 e!17632))

(declare-fun res!16027 () Bool)

(assert (=> d!4893 (=> (not res!16027) (not e!17632))))

(assert (=> d!4893 (= res!16027 (or (bvsge #b00000000000000000000000000000000 (size!806 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)))))))

(declare-fun lt!10558 () ListLongMap!579)

(assert (=> d!4893 (= lt!10562 lt!10558)))

(declare-fun lt!10554 () Unit!638)

(assert (=> d!4893 (= lt!10554 e!17635)))

(declare-fun c!3693 () Bool)

(assert (=> d!4893 (= c!3693 e!17633)))

(declare-fun res!16023 () Bool)

(assert (=> d!4893 (=> (not res!16023) (not e!17633))))

(assert (=> d!4893 (= res!16023 (bvslt #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(declare-fun e!17631 () ListLongMap!579)

(assert (=> d!4893 (= lt!10558 e!17631)))

(assert (=> d!4893 (= c!3692 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4893 (validMask!0 mask!2294)))

(assert (=> d!4893 (= (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10562)))

(declare-fun bm!2550 () Bool)

(assert (=> bm!2550 (= call!2551 (contains!244 lt!10562 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2551 () Bool)

(assert (=> bm!2551 (= call!2553 call!2554)))

(declare-fun b!27062 () Bool)

(assert (=> b!27062 (= e!17623 e!17624)))

(declare-fun res!16025 () Bool)

(assert (=> b!27062 (= res!16025 call!2551)))

(assert (=> b!27062 (=> (not res!16025) (not e!17624))))

(declare-fun b!27063 () Bool)

(declare-fun e!17628 () ListLongMap!579)

(assert (=> b!27063 (= e!17631 e!17628)))

(assert (=> b!27063 (= c!3688 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27064 () Bool)

(assert (=> b!27064 (= e!17631 (+!49 call!2549 (tuple2!1015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!27065 () Bool)

(assert (=> b!27065 (= e!17628 call!2552)))

(declare-fun bm!2552 () Bool)

(assert (=> bm!2552 (= call!2552 call!2549)))

(declare-fun b!27066 () Bool)

(declare-fun c!3690 () Bool)

(assert (=> b!27066 (= c!3690 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!27066 (= e!17628 e!17629)))

(declare-fun b!27067 () Bool)

(assert (=> b!27067 (= e!17626 (not call!2555))))

(assert (= (and d!4893 c!3692) b!27064))

(assert (= (and d!4893 (not c!3692)) b!27063))

(assert (= (and b!27063 c!3688) b!27065))

(assert (= (and b!27063 (not c!3688)) b!27066))

(assert (= (and b!27066 c!3690) b!27051))

(assert (= (and b!27066 (not c!3690)) b!27054))

(assert (= (or b!27051 b!27054) bm!2551))

(assert (= (or b!27065 bm!2551) bm!2546))

(assert (= (or b!27065 b!27051) bm!2552))

(assert (= (or b!27064 bm!2546) bm!2549))

(assert (= (or b!27064 bm!2552) bm!2548))

(assert (= (and d!4893 res!16023) b!27048))

(assert (= (and d!4893 c!3693) b!27056))

(assert (= (and d!4893 (not c!3693)) b!27055))

(assert (= (and d!4893 res!16027) b!27053))

(assert (= (and b!27053 res!16026) b!27052))

(assert (= (and b!27053 (not res!16029)) b!27049))

(assert (= (and b!27049 res!16030) b!27059))

(assert (= (and b!27053 res!16022) b!27057))

(assert (= (and b!27057 c!3691) b!27058))

(assert (= (and b!27057 (not c!3691)) b!27067))

(assert (= (and b!27058 res!16024) b!27060))

(assert (= (or b!27058 b!27067) bm!2547))

(assert (= (and b!27057 res!16028) b!27050))

(assert (= (and b!27050 c!3689) b!27062))

(assert (= (and b!27050 (not c!3689)) b!27061))

(assert (= (and b!27062 res!16025) b!27047))

(assert (= (or b!27062 b!27061) bm!2550))

(declare-fun b_lambda!1675 () Bool)

(assert (=> (not b_lambda!1675) (not b!27059)))

(declare-fun t!3287 () Bool)

(declare-fun tb!671 () Bool)

(assert (=> (and start!3838 (= defaultEntry!1504 defaultEntry!1504) t!3287) tb!671))

(declare-fun result!1135 () Bool)

(assert (=> tb!671 (= result!1135 tp_is_empty!1141)))

(assert (=> b!27059 t!3287))

(declare-fun b_and!1593 () Bool)

(assert (= b_and!1587 (and (=> t!3287 result!1135) b_and!1593)))

(assert (=> d!4893 m!21513))

(declare-fun m!21569 () Bool)

(assert (=> b!27060 m!21569))

(declare-fun m!21571 () Bool)

(assert (=> bm!2548 m!21571))

(declare-fun m!21573 () Bool)

(assert (=> b!27059 m!21573))

(declare-fun m!21575 () Bool)

(assert (=> b!27059 m!21575))

(declare-fun m!21577 () Bool)

(assert (=> b!27059 m!21577))

(assert (=> b!27059 m!21575))

(declare-fun m!21579 () Bool)

(assert (=> b!27059 m!21579))

(assert (=> b!27059 m!21573))

(assert (=> b!27059 m!21579))

(declare-fun m!21581 () Bool)

(assert (=> b!27059 m!21581))

(declare-fun m!21583 () Bool)

(assert (=> bm!2550 m!21583))

(declare-fun m!21585 () Bool)

(assert (=> b!27047 m!21585))

(assert (=> b!27049 m!21579))

(assert (=> b!27049 m!21579))

(declare-fun m!21587 () Bool)

(assert (=> b!27049 m!21587))

(assert (=> b!27048 m!21579))

(assert (=> b!27048 m!21579))

(declare-fun m!21589 () Bool)

(assert (=> b!27048 m!21589))

(declare-fun m!21591 () Bool)

(assert (=> b!27064 m!21591))

(declare-fun m!21593 () Bool)

(assert (=> bm!2549 m!21593))

(assert (=> b!27052 m!21579))

(assert (=> b!27052 m!21579))

(assert (=> b!27052 m!21589))

(declare-fun m!21595 () Bool)

(assert (=> bm!2547 m!21595))

(declare-fun m!21597 () Bool)

(assert (=> b!27056 m!21597))

(declare-fun m!21599 () Bool)

(assert (=> b!27056 m!21599))

(declare-fun m!21601 () Bool)

(assert (=> b!27056 m!21601))

(declare-fun m!21603 () Bool)

(assert (=> b!27056 m!21603))

(declare-fun m!21605 () Bool)

(assert (=> b!27056 m!21605))

(declare-fun m!21607 () Bool)

(assert (=> b!27056 m!21607))

(assert (=> b!27056 m!21593))

(declare-fun m!21609 () Bool)

(assert (=> b!27056 m!21609))

(declare-fun m!21611 () Bool)

(assert (=> b!27056 m!21611))

(declare-fun m!21613 () Bool)

(assert (=> b!27056 m!21613))

(assert (=> b!27056 m!21609))

(assert (=> b!27056 m!21599))

(declare-fun m!21615 () Bool)

(assert (=> b!27056 m!21615))

(declare-fun m!21617 () Bool)

(assert (=> b!27056 m!21617))

(assert (=> b!27056 m!21605))

(declare-fun m!21619 () Bool)

(assert (=> b!27056 m!21619))

(declare-fun m!21621 () Bool)

(assert (=> b!27056 m!21621))

(assert (=> b!27056 m!21601))

(declare-fun m!21623 () Bool)

(assert (=> b!27056 m!21623))

(declare-fun m!21625 () Bool)

(assert (=> b!27056 m!21625))

(assert (=> b!27056 m!21579))

(assert (=> b!26941 d!4893))

(declare-fun b!27078 () Bool)

(declare-fun e!17644 () Bool)

(declare-fun e!17642 () Bool)

(assert (=> b!27078 (= e!17644 e!17642)))

(declare-fun c!3696 () Bool)

(assert (=> b!27078 (= c!3696 (validKeyInArray!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27079 () Bool)

(declare-fun call!2558 () Bool)

(assert (=> b!27079 (= e!17642 call!2558)))

(declare-fun d!4895 () Bool)

(declare-fun res!16036 () Bool)

(assert (=> d!4895 (=> res!16036 e!17644)))

(assert (=> d!4895 (= res!16036 (bvsge #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(assert (=> d!4895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17644)))

(declare-fun bm!2555 () Bool)

(assert (=> bm!2555 (= call!2558 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!27080 () Bool)

(declare-fun e!17643 () Bool)

(assert (=> b!27080 (= e!17642 e!17643)))

(declare-fun lt!10579 () (_ BitVec 64))

(assert (=> b!27080 (= lt!10579 (select (arr!705 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10577 () Unit!638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1499 (_ BitVec 64) (_ BitVec 32)) Unit!638)

(assert (=> b!27080 (= lt!10577 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10579 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27080 (arrayContainsKey!0 _keys!1833 lt!10579 #b00000000000000000000000000000000)))

(declare-fun lt!10578 () Unit!638)

(assert (=> b!27080 (= lt!10578 lt!10577)))

(declare-fun res!16035 () Bool)

(declare-datatypes ((SeekEntryResult!64 0))(
  ( (MissingZero!64 (index!2378 (_ BitVec 32))) (Found!64 (index!2379 (_ BitVec 32))) (Intermediate!64 (undefined!876 Bool) (index!2380 (_ BitVec 32)) (x!6196 (_ BitVec 32))) (Undefined!64) (MissingVacant!64 (index!2381 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1499 (_ BitVec 32)) SeekEntryResult!64)

(assert (=> b!27080 (= res!16035 (= (seekEntryOrOpen!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!64 #b00000000000000000000000000000000)))))

(assert (=> b!27080 (=> (not res!16035) (not e!17643))))

(declare-fun b!27081 () Bool)

(assert (=> b!27081 (= e!17643 call!2558)))

(assert (= (and d!4895 (not res!16036)) b!27078))

(assert (= (and b!27078 c!3696) b!27080))

(assert (= (and b!27078 (not c!3696)) b!27079))

(assert (= (and b!27080 res!16035) b!27081))

(assert (= (or b!27081 b!27079) bm!2555))

(assert (=> b!27078 m!21579))

(assert (=> b!27078 m!21579))

(assert (=> b!27078 m!21589))

(declare-fun m!21627 () Bool)

(assert (=> bm!2555 m!21627))

(assert (=> b!27080 m!21579))

(declare-fun m!21629 () Bool)

(assert (=> b!27080 m!21629))

(declare-fun m!21631 () Bool)

(assert (=> b!27080 m!21631))

(assert (=> b!27080 m!21579))

(declare-fun m!21633 () Bool)

(assert (=> b!27080 m!21633))

(assert (=> b!26934 d!4895))

(declare-fun d!4897 () Bool)

(assert (=> d!4897 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26936 d!4897))

(declare-fun b!27092 () Bool)

(declare-fun e!17654 () Bool)

(declare-fun call!2561 () Bool)

(assert (=> b!27092 (= e!17654 call!2561)))

(declare-fun b!27093 () Bool)

(declare-fun e!17655 () Bool)

(declare-fun e!17656 () Bool)

(assert (=> b!27093 (= e!17655 e!17656)))

(declare-fun res!16043 () Bool)

(assert (=> b!27093 (=> (not res!16043) (not e!17656))))

(declare-fun e!17653 () Bool)

(assert (=> b!27093 (= res!16043 (not e!17653))))

(declare-fun res!16045 () Bool)

(assert (=> b!27093 (=> (not res!16045) (not e!17653))))

(assert (=> b!27093 (= res!16045 (validKeyInArray!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27094 () Bool)

(assert (=> b!27094 (= e!17654 call!2561)))

(declare-fun d!4899 () Bool)

(declare-fun res!16044 () Bool)

(assert (=> d!4899 (=> res!16044 e!17655)))

(assert (=> d!4899 (= res!16044 (bvsge #b00000000000000000000000000000000 (size!806 _keys!1833)))))

(assert (=> d!4899 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!598) e!17655)))

(declare-fun b!27095 () Bool)

(assert (=> b!27095 (= e!17656 e!17654)))

(declare-fun c!3699 () Bool)

(assert (=> b!27095 (= c!3699 (validKeyInArray!0 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2558 () Bool)

(assert (=> bm!2558 (= call!2561 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3699 (Cons!597 (select (arr!705 _keys!1833) #b00000000000000000000000000000000) Nil!598) Nil!598)))))

(declare-fun b!27096 () Bool)

(declare-fun contains!246 (List!601 (_ BitVec 64)) Bool)

(assert (=> b!27096 (= e!17653 (contains!246 Nil!598 (select (arr!705 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4899 (not res!16044)) b!27093))

(assert (= (and b!27093 res!16045) b!27096))

(assert (= (and b!27093 res!16043) b!27095))

(assert (= (and b!27095 c!3699) b!27094))

(assert (= (and b!27095 (not c!3699)) b!27092))

(assert (= (or b!27094 b!27092) bm!2558))

(assert (=> b!27093 m!21579))

(assert (=> b!27093 m!21579))

(assert (=> b!27093 m!21589))

(assert (=> b!27095 m!21579))

(assert (=> b!27095 m!21579))

(assert (=> b!27095 m!21589))

(assert (=> bm!2558 m!21579))

(declare-fun m!21635 () Bool)

(assert (=> bm!2558 m!21635))

(assert (=> b!27096 m!21579))

(assert (=> b!27096 m!21579))

(declare-fun m!21637 () Bool)

(assert (=> b!27096 m!21637))

(assert (=> b!26935 d!4899))

(declare-fun d!4901 () Bool)

(assert (=> d!4901 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3838 d!4901))

(declare-fun d!4903 () Bool)

(assert (=> d!4903 (= (array_inv!499 _values!1501) (bvsge (size!805 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3838 d!4903))

(declare-fun d!4905 () Bool)

(assert (=> d!4905 (= (array_inv!500 _keys!1833) (bvsge (size!806 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3838 d!4905))

(declare-fun b!27103 () Bool)

(declare-fun e!17661 () Bool)

(assert (=> b!27103 (= e!17661 tp_is_empty!1141)))

(declare-fun b!27104 () Bool)

(declare-fun e!17662 () Bool)

(assert (=> b!27104 (= e!17662 tp_is_empty!1141)))

(declare-fun condMapEmpty!1243 () Bool)

(declare-fun mapDefault!1243 () ValueCell!371)

(assert (=> mapNonEmpty!1234 (= condMapEmpty!1243 (= mapRest!1234 ((as const (Array (_ BitVec 32) ValueCell!371)) mapDefault!1243)))))

(declare-fun mapRes!1243 () Bool)

(assert (=> mapNonEmpty!1234 (= tp!3774 (and e!17662 mapRes!1243))))

(declare-fun mapIsEmpty!1243 () Bool)

(assert (=> mapIsEmpty!1243 mapRes!1243))

(declare-fun mapNonEmpty!1243 () Bool)

(declare-fun tp!3790 () Bool)

(assert (=> mapNonEmpty!1243 (= mapRes!1243 (and tp!3790 e!17661))))

(declare-fun mapValue!1243 () ValueCell!371)

(declare-fun mapKey!1243 () (_ BitVec 32))

(declare-fun mapRest!1243 () (Array (_ BitVec 32) ValueCell!371))

(assert (=> mapNonEmpty!1243 (= mapRest!1234 (store mapRest!1243 mapKey!1243 mapValue!1243))))

(assert (= (and mapNonEmpty!1234 condMapEmpty!1243) mapIsEmpty!1243))

(assert (= (and mapNonEmpty!1234 (not condMapEmpty!1243)) mapNonEmpty!1243))

(assert (= (and mapNonEmpty!1243 ((_ is ValueCellFull!371) mapValue!1243)) b!27103))

(assert (= (and mapNonEmpty!1234 ((_ is ValueCellFull!371) mapDefault!1243)) b!27104))

(declare-fun m!21639 () Bool)

(assert (=> mapNonEmpty!1243 m!21639))

(declare-fun b_lambda!1677 () Bool)

(assert (= b_lambda!1675 (or (and start!3838 b_free!787) b_lambda!1677)))

(check-sat (not b!27047) (not d!4893) (not b!27002) (not b!27096) (not b!27080) (not b!27048) tp_is_empty!1141 (not b_next!787) (not b!27004) (not b!27060) (not mapNonEmpty!1243) (not d!4891) (not bm!2550) (not b_lambda!1677) (not bm!2547) b_and!1593 (not bm!2555) (not bm!2558) (not b!27093) (not b!27052) (not b!27059) (not bm!2548) (not b!27049) (not b!27095) (not bm!2549) (not b!27064) (not b!27078) (not b!27056))
(check-sat b_and!1593 (not b_next!787))
