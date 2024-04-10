; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13440 () Bool)

(assert start!13440)

(declare-fun b!123206 () Bool)

(declare-fun b_free!2813 () Bool)

(declare-fun b_next!2813 () Bool)

(assert (=> b!123206 (= b_free!2813 (not b_next!2813))))

(declare-fun tp!10828 () Bool)

(declare-fun b_and!7567 () Bool)

(assert (=> b!123206 (= tp!10828 b_and!7567)))

(declare-fun b!123212 () Bool)

(declare-fun b_free!2815 () Bool)

(declare-fun b_next!2815 () Bool)

(assert (=> b!123212 (= b_free!2815 (not b_next!2815))))

(declare-fun tp!10827 () Bool)

(declare-fun b_and!7569 () Bool)

(assert (=> b!123212 (= tp!10827 b_and!7569)))

(declare-datatypes ((V!3411 0))(
  ( (V!3412 (val!1456 Int)) )
))
(declare-datatypes ((array!4657 0))(
  ( (array!4658 (arr!2207 (Array (_ BitVec 32) (_ BitVec 64))) (size!2469 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1068 0))(
  ( (ValueCellFull!1068 (v!3091 V!3411)) (EmptyCell!1068) )
))
(declare-datatypes ((array!4659 0))(
  ( (array!4660 (arr!2208 (Array (_ BitVec 32) ValueCell!1068)) (size!2470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1044 0))(
  ( (LongMapFixedSize!1045 (defaultEntry!2755 Int) (mask!6993 (_ BitVec 32)) (extraKeys!2540 (_ BitVec 32)) (zeroValue!2620 V!3411) (minValue!2620 V!3411) (_size!571 (_ BitVec 32)) (_keys!4482 array!4657) (_values!2738 array!4659) (_vacant!571 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!840 0))(
  ( (Cell!841 (v!3092 LongMapFixedSize!1044)) )
))
(declare-datatypes ((LongMap!840 0))(
  ( (LongMap!841 (underlying!431 Cell!840)) )
))
(declare-fun thiss!992 () LongMap!840)

(declare-fun e!80542 () Bool)

(declare-fun tp_is_empty!2823 () Bool)

(declare-fun e!80535 () Bool)

(declare-fun array_inv!1387 (array!4657) Bool)

(declare-fun array_inv!1388 (array!4659) Bool)

(assert (=> b!123206 (= e!80535 (and tp!10828 tp_is_empty!2823 (array_inv!1387 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (array_inv!1388 (_values!2738 (v!3092 (underlying!431 thiss!992)))) e!80542))))

(declare-fun mapIsEmpty!4425 () Bool)

(declare-fun mapRes!4425 () Bool)

(assert (=> mapIsEmpty!4425 mapRes!4425))

(declare-fun b!123207 () Bool)

(declare-fun e!80543 () Bool)

(assert (=> b!123207 (= e!80543 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4426 () Bool)

(declare-fun mapRes!4426 () Bool)

(declare-fun tp!10825 () Bool)

(declare-fun e!80534 () Bool)

(assert (=> mapNonEmpty!4426 (= mapRes!4426 (and tp!10825 e!80534))))

(declare-fun mapRest!4426 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapKey!4426 () (_ BitVec 32))

(declare-fun mapValue!4426 () ValueCell!1068)

(assert (=> mapNonEmpty!4426 (= (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (store mapRest!4426 mapKey!4426 mapValue!4426))))

(declare-fun b!123208 () Bool)

(declare-fun res!59843 () Bool)

(declare-fun e!80536 () Bool)

(assert (=> b!123208 (=> (not res!59843) (not e!80536))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!123208 (= res!59843 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123209 () Bool)

(declare-fun res!59846 () Bool)

(assert (=> b!123209 (=> (not res!59846) (not e!80536))))

(declare-fun newMap!16 () LongMapFixedSize!1044)

(declare-fun valid!497 (LongMapFixedSize!1044) Bool)

(assert (=> b!123209 (= res!59846 (valid!497 newMap!16))))

(declare-fun b!123210 () Bool)

(assert (=> b!123210 (= e!80534 tp_is_empty!2823)))

(declare-fun b!123211 () Bool)

(declare-fun res!59844 () Bool)

(assert (=> b!123211 (=> (not res!59844) (not e!80536))))

(declare-datatypes ((tuple2!2562 0))(
  ( (tuple2!2563 (_1!1292 (_ BitVec 64)) (_2!1292 V!3411)) )
))
(declare-datatypes ((List!1691 0))(
  ( (Nil!1688) (Cons!1687 (h!2288 tuple2!2562) (t!5990 List!1691)) )
))
(declare-datatypes ((ListLongMap!1673 0))(
  ( (ListLongMap!1674 (toList!852 List!1691)) )
))
(declare-fun getCurrentListMap!533 (array!4657 array!4659 (_ BitVec 32) (_ BitVec 32) V!3411 V!3411 (_ BitVec 32) Int) ListLongMap!1673)

(declare-fun map!1378 (LongMapFixedSize!1044) ListLongMap!1673)

(assert (=> b!123211 (= res!59844 (= (getCurrentListMap!533 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) (map!1378 newMap!16)))))

(declare-fun e!80545 () Bool)

(declare-fun e!80541 () Bool)

(assert (=> b!123212 (= e!80545 (and tp!10827 tp_is_empty!2823 (array_inv!1387 (_keys!4482 newMap!16)) (array_inv!1388 (_values!2738 newMap!16)) e!80541))))

(declare-fun b!123213 () Bool)

(declare-fun e!80537 () Bool)

(assert (=> b!123213 (= e!80537 tp_is_empty!2823)))

(declare-fun mapIsEmpty!4426 () Bool)

(assert (=> mapIsEmpty!4426 mapRes!4426))

(declare-fun b!123214 () Bool)

(declare-fun res!59845 () Bool)

(assert (=> b!123214 (=> (not res!59845) (not e!80536))))

(assert (=> b!123214 (= res!59845 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6993 newMap!16)) (_size!571 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123215 () Bool)

(assert (=> b!123215 (= e!80536 (bvsge from!355 (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123216 () Bool)

(declare-fun e!80539 () Bool)

(assert (=> b!123216 (= e!80542 (and e!80539 mapRes!4426))))

(declare-fun condMapEmpty!4426 () Bool)

(declare-fun mapDefault!4425 () ValueCell!1068)

(assert (=> b!123216 (= condMapEmpty!4426 (= (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4425)))))

(declare-fun b!123217 () Bool)

(declare-fun e!80540 () Bool)

(declare-fun e!80544 () Bool)

(assert (=> b!123217 (= e!80540 e!80544)))

(declare-fun b!123218 () Bool)

(assert (=> b!123218 (= e!80539 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4425 () Bool)

(declare-fun tp!10826 () Bool)

(assert (=> mapNonEmpty!4425 (= mapRes!4425 (and tp!10826 e!80537))))

(declare-fun mapRest!4425 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapValue!4425 () ValueCell!1068)

(declare-fun mapKey!4425 () (_ BitVec 32))

(assert (=> mapNonEmpty!4425 (= (arr!2208 (_values!2738 newMap!16)) (store mapRest!4425 mapKey!4425 mapValue!4425))))

(declare-fun res!59847 () Bool)

(assert (=> start!13440 (=> (not res!59847) (not e!80536))))

(declare-fun valid!498 (LongMap!840) Bool)

(assert (=> start!13440 (= res!59847 (valid!498 thiss!992))))

(assert (=> start!13440 e!80536))

(assert (=> start!13440 e!80540))

(assert (=> start!13440 true))

(assert (=> start!13440 e!80545))

(declare-fun b!123219 () Bool)

(assert (=> b!123219 (= e!80544 e!80535)))

(declare-fun b!123220 () Bool)

(assert (=> b!123220 (= e!80541 (and e!80543 mapRes!4425))))

(declare-fun condMapEmpty!4425 () Bool)

(declare-fun mapDefault!4426 () ValueCell!1068)

(assert (=> b!123220 (= condMapEmpty!4425 (= (arr!2208 (_values!2738 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4426)))))

(assert (= (and start!13440 res!59847) b!123208))

(assert (= (and b!123208 res!59843) b!123209))

(assert (= (and b!123209 res!59846) b!123214))

(assert (= (and b!123214 res!59845) b!123211))

(assert (= (and b!123211 res!59844) b!123215))

(assert (= (and b!123216 condMapEmpty!4426) mapIsEmpty!4426))

(assert (= (and b!123216 (not condMapEmpty!4426)) mapNonEmpty!4426))

(get-info :version)

(assert (= (and mapNonEmpty!4426 ((_ is ValueCellFull!1068) mapValue!4426)) b!123210))

(assert (= (and b!123216 ((_ is ValueCellFull!1068) mapDefault!4425)) b!123218))

(assert (= b!123206 b!123216))

(assert (= b!123219 b!123206))

(assert (= b!123217 b!123219))

(assert (= start!13440 b!123217))

(assert (= (and b!123220 condMapEmpty!4425) mapIsEmpty!4425))

(assert (= (and b!123220 (not condMapEmpty!4425)) mapNonEmpty!4425))

(assert (= (and mapNonEmpty!4425 ((_ is ValueCellFull!1068) mapValue!4425)) b!123213))

(assert (= (and b!123220 ((_ is ValueCellFull!1068) mapDefault!4426)) b!123207))

(assert (= b!123212 b!123220))

(assert (= start!13440 b!123212))

(declare-fun m!143139 () Bool)

(assert (=> b!123206 m!143139))

(declare-fun m!143141 () Bool)

(assert (=> b!123206 m!143141))

(declare-fun m!143143 () Bool)

(assert (=> b!123211 m!143143))

(declare-fun m!143145 () Bool)

(assert (=> b!123211 m!143145))

(declare-fun m!143147 () Bool)

(assert (=> b!123209 m!143147))

(declare-fun m!143149 () Bool)

(assert (=> mapNonEmpty!4426 m!143149))

(declare-fun m!143151 () Bool)

(assert (=> start!13440 m!143151))

(declare-fun m!143153 () Bool)

(assert (=> b!123212 m!143153))

(declare-fun m!143155 () Bool)

(assert (=> b!123212 m!143155))

(declare-fun m!143157 () Bool)

(assert (=> mapNonEmpty!4425 m!143157))

(check-sat b_and!7567 (not b!123212) (not mapNonEmpty!4425) (not b_next!2815) tp_is_empty!2823 b_and!7569 (not b!123209) (not mapNonEmpty!4426) (not start!13440) (not b!123206) (not b_next!2813) (not b!123211))
(check-sat b_and!7567 b_and!7569 (not b_next!2813) (not b_next!2815))
(get-model)

(declare-fun d!36923 () Bool)

(assert (=> d!36923 (= (array_inv!1387 (_keys!4482 newMap!16)) (bvsge (size!2469 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123212 d!36923))

(declare-fun d!36925 () Bool)

(assert (=> d!36925 (= (array_inv!1388 (_values!2738 newMap!16)) (bvsge (size!2470 (_values!2738 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123212 d!36925))

(declare-fun d!36927 () Bool)

(declare-fun res!59869 () Bool)

(declare-fun e!80587 () Bool)

(assert (=> d!36927 (=> (not res!59869) (not e!80587))))

(declare-fun simpleValid!84 (LongMapFixedSize!1044) Bool)

(assert (=> d!36927 (= res!59869 (simpleValid!84 newMap!16))))

(assert (=> d!36927 (= (valid!497 newMap!16) e!80587)))

(declare-fun b!123272 () Bool)

(declare-fun res!59870 () Bool)

(assert (=> b!123272 (=> (not res!59870) (not e!80587))))

(declare-fun arrayCountValidKeys!0 (array!4657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!123272 (= res!59870 (= (arrayCountValidKeys!0 (_keys!4482 newMap!16) #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))) (_size!571 newMap!16)))))

(declare-fun b!123273 () Bool)

(declare-fun res!59871 () Bool)

(assert (=> b!123273 (=> (not res!59871) (not e!80587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4657 (_ BitVec 32)) Bool)

(assert (=> b!123273 (= res!59871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4482 newMap!16) (mask!6993 newMap!16)))))

(declare-fun b!123274 () Bool)

(declare-datatypes ((List!1692 0))(
  ( (Nil!1689) (Cons!1688 (h!2289 (_ BitVec 64)) (t!5995 List!1692)) )
))
(declare-fun arrayNoDuplicates!0 (array!4657 (_ BitVec 32) List!1692) Bool)

(assert (=> b!123274 (= e!80587 (arrayNoDuplicates!0 (_keys!4482 newMap!16) #b00000000000000000000000000000000 Nil!1689))))

(assert (= (and d!36927 res!59869) b!123272))

(assert (= (and b!123272 res!59870) b!123273))

(assert (= (and b!123273 res!59871) b!123274))

(declare-fun m!143179 () Bool)

(assert (=> d!36927 m!143179))

(declare-fun m!143181 () Bool)

(assert (=> b!123272 m!143181))

(declare-fun m!143183 () Bool)

(assert (=> b!123273 m!143183))

(declare-fun m!143185 () Bool)

(assert (=> b!123274 m!143185))

(assert (=> b!123209 d!36927))

(declare-fun d!36929 () Bool)

(assert (=> d!36929 (= (array_inv!1387 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvsge (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123206 d!36929))

(declare-fun d!36931 () Bool)

(assert (=> d!36931 (= (array_inv!1388 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvsge (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123206 d!36931))

(declare-fun d!36933 () Bool)

(assert (=> d!36933 (= (valid!498 thiss!992) (valid!497 (v!3092 (underlying!431 thiss!992))))))

(declare-fun bs!5106 () Bool)

(assert (= bs!5106 d!36933))

(declare-fun m!143187 () Bool)

(assert (=> bs!5106 m!143187))

(assert (=> start!13440 d!36933))

(declare-fun b!123317 () Bool)

(declare-fun res!59891 () Bool)

(declare-fun e!80626 () Bool)

(assert (=> b!123317 (=> (not res!59891) (not e!80626))))

(declare-fun e!80621 () Bool)

(assert (=> b!123317 (= res!59891 e!80621)))

(declare-fun c!22357 () Bool)

(assert (=> b!123317 (= c!22357 (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13094 () Bool)

(declare-fun call!13102 () Bool)

(declare-fun lt!63422 () ListLongMap!1673)

(declare-fun contains!869 (ListLongMap!1673 (_ BitVec 64)) Bool)

(assert (=> bm!13094 (= call!13102 (contains!869 lt!63422 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123318 () Bool)

(declare-fun c!22355 () Bool)

(assert (=> b!123318 (= c!22355 (and (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!80618 () ListLongMap!1673)

(declare-fun e!80614 () ListLongMap!1673)

(assert (=> b!123318 (= e!80618 e!80614)))

(declare-fun bm!13095 () Bool)

(declare-fun call!13098 () ListLongMap!1673)

(declare-fun call!13103 () ListLongMap!1673)

(assert (=> bm!13095 (= call!13098 call!13103)))

(declare-fun b!123320 () Bool)

(declare-fun call!13097 () ListLongMap!1673)

(assert (=> b!123320 (= e!80614 call!13097)))

(declare-fun bm!13096 () Bool)

(declare-fun call!13101 () ListLongMap!1673)

(declare-fun call!13100 () ListLongMap!1673)

(assert (=> bm!13096 (= call!13101 call!13100)))

(declare-fun b!123321 () Bool)

(assert (=> b!123321 (= e!80618 call!13101)))

(declare-fun b!123322 () Bool)

(declare-fun e!80625 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!123322 (= e!80625 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123323 () Bool)

(declare-fun e!80620 () Bool)

(declare-fun apply!108 (ListLongMap!1673 (_ BitVec 64)) V!3411)

(declare-fun get!1425 (ValueCell!1068 V!3411) V!3411)

(declare-fun dynLambda!409 (Int (_ BitVec 64)) V!3411)

(assert (=> b!123323 (= e!80620 (= (apply!108 lt!63422 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123323 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> b!123323 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123324 () Bool)

(declare-datatypes ((Unit!3835 0))(
  ( (Unit!3836) )
))
(declare-fun e!80623 () Unit!3835)

(declare-fun Unit!3837 () Unit!3835)

(assert (=> b!123324 (= e!80623 Unit!3837)))

(declare-fun b!123325 () Bool)

(declare-fun lt!63438 () Unit!3835)

(assert (=> b!123325 (= e!80623 lt!63438)))

(declare-fun lt!63428 () ListLongMap!1673)

(declare-fun getCurrentListMapNoExtraKeys!133 (array!4657 array!4659 (_ BitVec 32) (_ BitVec 32) V!3411 V!3411 (_ BitVec 32) Int) ListLongMap!1673)

(assert (=> b!123325 (= lt!63428 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun lt!63423 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63440 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63440 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63427 () Unit!3835)

(declare-fun addStillContains!84 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> b!123325 (= lt!63427 (addStillContains!84 lt!63428 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63440))))

(declare-fun +!167 (ListLongMap!1673 tuple2!2562) ListLongMap!1673)

(assert (=> b!123325 (contains!869 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63440)))

(declare-fun lt!63424 () Unit!3835)

(assert (=> b!123325 (= lt!63424 lt!63427)))

(declare-fun lt!63439 () ListLongMap!1673)

(assert (=> b!123325 (= lt!63439 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun lt!63436 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63436 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63426 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63426 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63425 () Unit!3835)

(declare-fun addApplyDifferent!84 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> b!123325 (= lt!63425 (addApplyDifferent!84 lt!63439 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63426))))

(assert (=> b!123325 (= (apply!108 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63426) (apply!108 lt!63439 lt!63426))))

(declare-fun lt!63435 () Unit!3835)

(assert (=> b!123325 (= lt!63435 lt!63425)))

(declare-fun lt!63434 () ListLongMap!1673)

(assert (=> b!123325 (= lt!63434 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun lt!63442 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63433 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63433 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63431 () Unit!3835)

(assert (=> b!123325 (= lt!63431 (addApplyDifferent!84 lt!63434 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63433))))

(assert (=> b!123325 (= (apply!108 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63433) (apply!108 lt!63434 lt!63433))))

(declare-fun lt!63437 () Unit!3835)

(assert (=> b!123325 (= lt!63437 lt!63431)))

(declare-fun lt!63421 () ListLongMap!1673)

(assert (=> b!123325 (= lt!63421 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun lt!63429 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63432 () (_ BitVec 64))

(assert (=> b!123325 (= lt!63432 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123325 (= lt!63438 (addApplyDifferent!84 lt!63421 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63432))))

(assert (=> b!123325 (= (apply!108 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63432) (apply!108 lt!63421 lt!63432))))

(declare-fun b!123326 () Bool)

(declare-fun e!80624 () Bool)

(assert (=> b!123326 (= e!80624 (= (apply!108 lt!63422 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123327 () Bool)

(declare-fun e!80619 () Bool)

(assert (=> b!123327 (= e!80626 e!80619)))

(declare-fun c!22353 () Bool)

(assert (=> b!123327 (= c!22353 (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!22354 () Bool)

(declare-fun c!22358 () Bool)

(declare-fun bm!13097 () Bool)

(assert (=> bm!13097 (= call!13100 (+!167 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123328 () Bool)

(declare-fun e!80616 () Bool)

(assert (=> b!123328 (= e!80619 e!80616)))

(declare-fun res!59890 () Bool)

(declare-fun call!13099 () Bool)

(assert (=> b!123328 (= res!59890 call!13099)))

(assert (=> b!123328 (=> (not res!59890) (not e!80616))))

(declare-fun b!123329 () Bool)

(declare-fun e!80622 () ListLongMap!1673)

(assert (=> b!123329 (= e!80622 (+!167 call!13100 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123330 () Bool)

(assert (=> b!123330 (= e!80614 call!13101)))

(declare-fun bm!13098 () Bool)

(assert (=> bm!13098 (= call!13103 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123331 () Bool)

(declare-fun e!80617 () Bool)

(assert (=> b!123331 (= e!80617 e!80620)))

(declare-fun res!59895 () Bool)

(assert (=> b!123331 (=> (not res!59895) (not e!80620))))

(assert (=> b!123331 (= res!59895 (contains!869 lt!63422 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123331 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123319 () Bool)

(assert (=> b!123319 (= e!80622 e!80618)))

(assert (=> b!123319 (= c!22358 (and (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!36935 () Bool)

(assert (=> d!36935 e!80626))

(declare-fun res!59892 () Bool)

(assert (=> d!36935 (=> (not res!59892) (not e!80626))))

(assert (=> d!36935 (= res!59892 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun lt!63441 () ListLongMap!1673)

(assert (=> d!36935 (= lt!63422 lt!63441)))

(declare-fun lt!63430 () Unit!3835)

(assert (=> d!36935 (= lt!63430 e!80623)))

(declare-fun c!22356 () Bool)

(assert (=> d!36935 (= c!22356 e!80625)))

(declare-fun res!59896 () Bool)

(assert (=> d!36935 (=> (not res!59896) (not e!80625))))

(assert (=> d!36935 (= res!59896 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!36935 (= lt!63441 e!80622)))

(assert (=> d!36935 (= c!22354 (and (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!36935 (validMask!0 (mask!6993 (v!3092 (underlying!431 thiss!992))))))

(assert (=> d!36935 (= (getCurrentListMap!533 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) lt!63422)))

(declare-fun b!123332 () Bool)

(declare-fun e!80615 () Bool)

(assert (=> b!123332 (= e!80615 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13099 () Bool)

(assert (=> bm!13099 (= call!13097 call!13098)))

(declare-fun b!123333 () Bool)

(assert (=> b!123333 (= e!80616 (= (apply!108 lt!63422 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123334 () Bool)

(assert (=> b!123334 (= e!80621 e!80624)))

(declare-fun res!59897 () Bool)

(assert (=> b!123334 (= res!59897 call!13102)))

(assert (=> b!123334 (=> (not res!59897) (not e!80624))))

(declare-fun b!123335 () Bool)

(assert (=> b!123335 (= e!80619 (not call!13099))))

(declare-fun b!123336 () Bool)

(declare-fun res!59893 () Bool)

(assert (=> b!123336 (=> (not res!59893) (not e!80626))))

(assert (=> b!123336 (= res!59893 e!80617)))

(declare-fun res!59898 () Bool)

(assert (=> b!123336 (=> res!59898 e!80617)))

(assert (=> b!123336 (= res!59898 (not e!80615))))

(declare-fun res!59894 () Bool)

(assert (=> b!123336 (=> (not res!59894) (not e!80615))))

(assert (=> b!123336 (= res!59894 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123337 () Bool)

(assert (=> b!123337 (= e!80621 (not call!13102))))

(declare-fun bm!13100 () Bool)

(assert (=> bm!13100 (= call!13099 (contains!869 lt!63422 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!36935 c!22354) b!123329))

(assert (= (and d!36935 (not c!22354)) b!123319))

(assert (= (and b!123319 c!22358) b!123321))

(assert (= (and b!123319 (not c!22358)) b!123318))

(assert (= (and b!123318 c!22355) b!123330))

(assert (= (and b!123318 (not c!22355)) b!123320))

(assert (= (or b!123330 b!123320) bm!13099))

(assert (= (or b!123321 bm!13099) bm!13095))

(assert (= (or b!123321 b!123330) bm!13096))

(assert (= (or b!123329 bm!13095) bm!13098))

(assert (= (or b!123329 bm!13096) bm!13097))

(assert (= (and d!36935 res!59896) b!123322))

(assert (= (and d!36935 c!22356) b!123325))

(assert (= (and d!36935 (not c!22356)) b!123324))

(assert (= (and d!36935 res!59892) b!123336))

(assert (= (and b!123336 res!59894) b!123332))

(assert (= (and b!123336 (not res!59898)) b!123331))

(assert (= (and b!123331 res!59895) b!123323))

(assert (= (and b!123336 res!59893) b!123317))

(assert (= (and b!123317 c!22357) b!123334))

(assert (= (and b!123317 (not c!22357)) b!123337))

(assert (= (and b!123334 res!59897) b!123326))

(assert (= (or b!123334 b!123337) bm!13094))

(assert (= (and b!123317 res!59891) b!123327))

(assert (= (and b!123327 c!22353) b!123328))

(assert (= (and b!123327 (not c!22353)) b!123335))

(assert (= (and b!123328 res!59890) b!123333))

(assert (= (or b!123328 b!123335) bm!13100))

(declare-fun b_lambda!5413 () Bool)

(assert (=> (not b_lambda!5413) (not b!123323)))

(declare-fun t!5992 () Bool)

(declare-fun tb!2265 () Bool)

(assert (=> (and b!123206 (= (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) t!5992) tb!2265))

(declare-fun result!3767 () Bool)

(assert (=> tb!2265 (= result!3767 tp_is_empty!2823)))

(assert (=> b!123323 t!5992))

(declare-fun b_and!7575 () Bool)

(assert (= b_and!7567 (and (=> t!5992 result!3767) b_and!7575)))

(declare-fun t!5994 () Bool)

(declare-fun tb!2267 () Bool)

(assert (=> (and b!123212 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) t!5994) tb!2267))

(declare-fun result!3771 () Bool)

(assert (= result!3771 result!3767))

(assert (=> b!123323 t!5994))

(declare-fun b_and!7577 () Bool)

(assert (= b_and!7569 (and (=> t!5994 result!3771) b_and!7577)))

(declare-fun m!143189 () Bool)

(assert (=> bm!13098 m!143189))

(declare-fun m!143191 () Bool)

(assert (=> bm!13094 m!143191))

(declare-fun m!143193 () Bool)

(assert (=> b!123322 m!143193))

(assert (=> b!123322 m!143193))

(declare-fun m!143195 () Bool)

(assert (=> b!123322 m!143195))

(declare-fun m!143197 () Bool)

(assert (=> b!123329 m!143197))

(declare-fun m!143199 () Bool)

(assert (=> b!123333 m!143199))

(declare-fun m!143201 () Bool)

(assert (=> b!123326 m!143201))

(declare-fun m!143203 () Bool)

(assert (=> bm!13100 m!143203))

(assert (=> b!123331 m!143193))

(assert (=> b!123331 m!143193))

(declare-fun m!143205 () Bool)

(assert (=> b!123331 m!143205))

(declare-fun m!143207 () Bool)

(assert (=> bm!13097 m!143207))

(assert (=> b!123332 m!143193))

(assert (=> b!123332 m!143193))

(assert (=> b!123332 m!143195))

(declare-fun m!143209 () Bool)

(assert (=> b!123323 m!143209))

(assert (=> b!123323 m!143193))

(declare-fun m!143211 () Bool)

(assert (=> b!123323 m!143211))

(declare-fun m!143213 () Bool)

(assert (=> b!123323 m!143213))

(assert (=> b!123323 m!143209))

(declare-fun m!143215 () Bool)

(assert (=> b!123323 m!143215))

(assert (=> b!123323 m!143213))

(assert (=> b!123323 m!143193))

(declare-fun m!143217 () Bool)

(assert (=> b!123325 m!143217))

(declare-fun m!143219 () Bool)

(assert (=> b!123325 m!143219))

(declare-fun m!143221 () Bool)

(assert (=> b!123325 m!143221))

(declare-fun m!143223 () Bool)

(assert (=> b!123325 m!143223))

(declare-fun m!143225 () Bool)

(assert (=> b!123325 m!143225))

(declare-fun m!143227 () Bool)

(assert (=> b!123325 m!143227))

(declare-fun m!143229 () Bool)

(assert (=> b!123325 m!143229))

(declare-fun m!143231 () Bool)

(assert (=> b!123325 m!143231))

(assert (=> b!123325 m!143193))

(assert (=> b!123325 m!143225))

(declare-fun m!143233 () Bool)

(assert (=> b!123325 m!143233))

(declare-fun m!143235 () Bool)

(assert (=> b!123325 m!143235))

(declare-fun m!143237 () Bool)

(assert (=> b!123325 m!143237))

(declare-fun m!143239 () Bool)

(assert (=> b!123325 m!143239))

(declare-fun m!143241 () Bool)

(assert (=> b!123325 m!143241))

(assert (=> b!123325 m!143239))

(assert (=> b!123325 m!143235))

(assert (=> b!123325 m!143219))

(assert (=> b!123325 m!143189))

(declare-fun m!143243 () Bool)

(assert (=> b!123325 m!143243))

(declare-fun m!143245 () Bool)

(assert (=> b!123325 m!143245))

(declare-fun m!143247 () Bool)

(assert (=> d!36935 m!143247))

(assert (=> b!123211 d!36935))

(declare-fun d!36937 () Bool)

(assert (=> d!36937 (= (map!1378 newMap!16) (getCurrentListMap!533 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun bs!5107 () Bool)

(assert (= bs!5107 d!36937))

(declare-fun m!143249 () Bool)

(assert (=> bs!5107 m!143249))

(assert (=> b!123211 d!36937))

(declare-fun b!123347 () Bool)

(declare-fun e!80632 () Bool)

(assert (=> b!123347 (= e!80632 tp_is_empty!2823)))

(declare-fun b!123346 () Bool)

(declare-fun e!80631 () Bool)

(assert (=> b!123346 (= e!80631 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4435 () Bool)

(declare-fun mapRes!4435 () Bool)

(declare-fun tp!10843 () Bool)

(assert (=> mapNonEmpty!4435 (= mapRes!4435 (and tp!10843 e!80631))))

(declare-fun mapKey!4435 () (_ BitVec 32))

(declare-fun mapRest!4435 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapValue!4435 () ValueCell!1068)

(assert (=> mapNonEmpty!4435 (= mapRest!4426 (store mapRest!4435 mapKey!4435 mapValue!4435))))

(declare-fun mapIsEmpty!4435 () Bool)

(assert (=> mapIsEmpty!4435 mapRes!4435))

(declare-fun condMapEmpty!4435 () Bool)

(declare-fun mapDefault!4435 () ValueCell!1068)

(assert (=> mapNonEmpty!4426 (= condMapEmpty!4435 (= mapRest!4426 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4435)))))

(assert (=> mapNonEmpty!4426 (= tp!10825 (and e!80632 mapRes!4435))))

(assert (= (and mapNonEmpty!4426 condMapEmpty!4435) mapIsEmpty!4435))

(assert (= (and mapNonEmpty!4426 (not condMapEmpty!4435)) mapNonEmpty!4435))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1068) mapValue!4435)) b!123346))

(assert (= (and mapNonEmpty!4426 ((_ is ValueCellFull!1068) mapDefault!4435)) b!123347))

(declare-fun m!143251 () Bool)

(assert (=> mapNonEmpty!4435 m!143251))

(declare-fun b!123349 () Bool)

(declare-fun e!80634 () Bool)

(assert (=> b!123349 (= e!80634 tp_is_empty!2823)))

(declare-fun b!123348 () Bool)

(declare-fun e!80633 () Bool)

(assert (=> b!123348 (= e!80633 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4436 () Bool)

(declare-fun mapRes!4436 () Bool)

(declare-fun tp!10844 () Bool)

(assert (=> mapNonEmpty!4436 (= mapRes!4436 (and tp!10844 e!80633))))

(declare-fun mapValue!4436 () ValueCell!1068)

(declare-fun mapKey!4436 () (_ BitVec 32))

(declare-fun mapRest!4436 () (Array (_ BitVec 32) ValueCell!1068))

(assert (=> mapNonEmpty!4436 (= mapRest!4425 (store mapRest!4436 mapKey!4436 mapValue!4436))))

(declare-fun mapIsEmpty!4436 () Bool)

(assert (=> mapIsEmpty!4436 mapRes!4436))

(declare-fun condMapEmpty!4436 () Bool)

(declare-fun mapDefault!4436 () ValueCell!1068)

(assert (=> mapNonEmpty!4425 (= condMapEmpty!4436 (= mapRest!4425 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4436)))))

(assert (=> mapNonEmpty!4425 (= tp!10826 (and e!80634 mapRes!4436))))

(assert (= (and mapNonEmpty!4425 condMapEmpty!4436) mapIsEmpty!4436))

(assert (= (and mapNonEmpty!4425 (not condMapEmpty!4436)) mapNonEmpty!4436))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1068) mapValue!4436)) b!123348))

(assert (= (and mapNonEmpty!4425 ((_ is ValueCellFull!1068) mapDefault!4436)) b!123349))

(declare-fun m!143253 () Bool)

(assert (=> mapNonEmpty!4436 m!143253))

(declare-fun b_lambda!5415 () Bool)

(assert (= b_lambda!5413 (or (and b!123206 b_free!2813) (and b!123212 b_free!2815 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))) b_lambda!5415)))

(check-sat (not bm!13098) (not d!36937) (not bm!13097) (not bm!13100) (not b!123272) (not b_next!2815) tp_is_empty!2823 (not d!36927) (not mapNonEmpty!4436) (not b!123331) (not b!123325) (not d!36935) (not b!123274) (not d!36933) (not b!123332) (not b!123333) (not mapNonEmpty!4435) b_and!7577 (not bm!13094) (not b!123326) b_and!7575 (not b!123329) (not b_lambda!5415) (not b!123323) (not b!123273) (not b!123322) (not b_next!2813))
(check-sat b_and!7575 b_and!7577 (not b_next!2813) (not b_next!2815))
(get-model)

(declare-fun b!123350 () Bool)

(declare-fun res!59900 () Bool)

(declare-fun e!80647 () Bool)

(assert (=> b!123350 (=> (not res!59900) (not e!80647))))

(declare-fun e!80642 () Bool)

(assert (=> b!123350 (= res!59900 e!80642)))

(declare-fun c!22363 () Bool)

(assert (=> b!123350 (= c!22363 (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13101 () Bool)

(declare-fun call!13109 () Bool)

(declare-fun lt!63444 () ListLongMap!1673)

(assert (=> bm!13101 (= call!13109 (contains!869 lt!63444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123351 () Bool)

(declare-fun c!22361 () Bool)

(assert (=> b!123351 (= c!22361 (and (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!80639 () ListLongMap!1673)

(declare-fun e!80635 () ListLongMap!1673)

(assert (=> b!123351 (= e!80639 e!80635)))

(declare-fun bm!13102 () Bool)

(declare-fun call!13105 () ListLongMap!1673)

(declare-fun call!13110 () ListLongMap!1673)

(assert (=> bm!13102 (= call!13105 call!13110)))

(declare-fun b!123353 () Bool)

(declare-fun call!13104 () ListLongMap!1673)

(assert (=> b!123353 (= e!80635 call!13104)))

(declare-fun bm!13103 () Bool)

(declare-fun call!13108 () ListLongMap!1673)

(declare-fun call!13107 () ListLongMap!1673)

(assert (=> bm!13103 (= call!13108 call!13107)))

(declare-fun b!123354 () Bool)

(assert (=> b!123354 (= e!80639 call!13108)))

(declare-fun b!123355 () Bool)

(declare-fun e!80646 () Bool)

(assert (=> b!123355 (= e!80646 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123356 () Bool)

(declare-fun e!80641 () Bool)

(assert (=> b!123356 (= e!80641 (= (apply!108 lt!63444 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) (get!1425 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_values!2738 newMap!16))))))

(assert (=> b!123356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123357 () Bool)

(declare-fun e!80644 () Unit!3835)

(declare-fun Unit!3838 () Unit!3835)

(assert (=> b!123357 (= e!80644 Unit!3838)))

(declare-fun b!123358 () Bool)

(declare-fun lt!63460 () Unit!3835)

(assert (=> b!123358 (= e!80644 lt!63460)))

(declare-fun lt!63450 () ListLongMap!1673)

(assert (=> b!123358 (= lt!63450 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun lt!63445 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63462 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63462 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63449 () Unit!3835)

(assert (=> b!123358 (= lt!63449 (addStillContains!84 lt!63450 lt!63445 (zeroValue!2620 newMap!16) lt!63462))))

(assert (=> b!123358 (contains!869 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) lt!63462)))

(declare-fun lt!63446 () Unit!3835)

(assert (=> b!123358 (= lt!63446 lt!63449)))

(declare-fun lt!63461 () ListLongMap!1673)

(assert (=> b!123358 (= lt!63461 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun lt!63458 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63448 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63448 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63447 () Unit!3835)

(assert (=> b!123358 (= lt!63447 (addApplyDifferent!84 lt!63461 lt!63458 (minValue!2620 newMap!16) lt!63448))))

(assert (=> b!123358 (= (apply!108 (+!167 lt!63461 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) lt!63448) (apply!108 lt!63461 lt!63448))))

(declare-fun lt!63457 () Unit!3835)

(assert (=> b!123358 (= lt!63457 lt!63447)))

(declare-fun lt!63456 () ListLongMap!1673)

(assert (=> b!123358 (= lt!63456 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun lt!63464 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63455 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63455 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63453 () Unit!3835)

(assert (=> b!123358 (= lt!63453 (addApplyDifferent!84 lt!63456 lt!63464 (zeroValue!2620 newMap!16) lt!63455))))

(assert (=> b!123358 (= (apply!108 (+!167 lt!63456 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) lt!63455) (apply!108 lt!63456 lt!63455))))

(declare-fun lt!63459 () Unit!3835)

(assert (=> b!123358 (= lt!63459 lt!63453)))

(declare-fun lt!63443 () ListLongMap!1673)

(assert (=> b!123358 (= lt!63443 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun lt!63451 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63451 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63454 () (_ BitVec 64))

(assert (=> b!123358 (= lt!63454 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123358 (= lt!63460 (addApplyDifferent!84 lt!63443 lt!63451 (minValue!2620 newMap!16) lt!63454))))

(assert (=> b!123358 (= (apply!108 (+!167 lt!63443 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) lt!63454) (apply!108 lt!63443 lt!63454))))

(declare-fun b!123359 () Bool)

(declare-fun e!80645 () Bool)

(assert (=> b!123359 (= e!80645 (= (apply!108 lt!63444 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2620 newMap!16)))))

(declare-fun b!123360 () Bool)

(declare-fun e!80640 () Bool)

(assert (=> b!123360 (= e!80647 e!80640)))

(declare-fun c!22359 () Bool)

(assert (=> b!123360 (= c!22359 (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13104 () Bool)

(declare-fun c!22364 () Bool)

(declare-fun c!22360 () Bool)

(assert (=> bm!13104 (= call!13107 (+!167 (ite c!22360 call!13110 (ite c!22364 call!13105 call!13104)) (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(declare-fun b!123361 () Bool)

(declare-fun e!80637 () Bool)

(assert (=> b!123361 (= e!80640 e!80637)))

(declare-fun res!59899 () Bool)

(declare-fun call!13106 () Bool)

(assert (=> b!123361 (= res!59899 call!13106)))

(assert (=> b!123361 (=> (not res!59899) (not e!80637))))

(declare-fun b!123362 () Bool)

(declare-fun e!80643 () ListLongMap!1673)

(assert (=> b!123362 (= e!80643 (+!167 call!13107 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))

(declare-fun b!123363 () Bool)

(assert (=> b!123363 (= e!80635 call!13108)))

(declare-fun bm!13105 () Bool)

(assert (=> bm!13105 (= call!13110 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)))))

(declare-fun b!123364 () Bool)

(declare-fun e!80638 () Bool)

(assert (=> b!123364 (= e!80638 e!80641)))

(declare-fun res!59904 () Bool)

(assert (=> b!123364 (=> (not res!59904) (not e!80641))))

(assert (=> b!123364 (= res!59904 (contains!869 lt!63444 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123352 () Bool)

(assert (=> b!123352 (= e!80643 e!80639)))

(assert (=> b!123352 (= c!22364 (and (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!36939 () Bool)

(assert (=> d!36939 e!80647))

(declare-fun res!59901 () Bool)

(assert (=> d!36939 (=> (not res!59901) (not e!80647))))

(assert (=> d!36939 (= res!59901 (or (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))))

(declare-fun lt!63463 () ListLongMap!1673)

(assert (=> d!36939 (= lt!63444 lt!63463)))

(declare-fun lt!63452 () Unit!3835)

(assert (=> d!36939 (= lt!63452 e!80644)))

(declare-fun c!22362 () Bool)

(assert (=> d!36939 (= c!22362 e!80646)))

(declare-fun res!59905 () Bool)

(assert (=> d!36939 (=> (not res!59905) (not e!80646))))

(assert (=> d!36939 (= res!59905 (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!36939 (= lt!63463 e!80643)))

(assert (=> d!36939 (= c!22360 (and (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2540 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!36939 (validMask!0 (mask!6993 newMap!16))))

(assert (=> d!36939 (= (getCurrentListMap!533 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)) lt!63444)))

(declare-fun b!123365 () Bool)

(declare-fun e!80636 () Bool)

(assert (=> b!123365 (= e!80636 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13106 () Bool)

(assert (=> bm!13106 (= call!13104 call!13105)))

(declare-fun b!123366 () Bool)

(assert (=> b!123366 (= e!80637 (= (apply!108 lt!63444 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2620 newMap!16)))))

(declare-fun b!123367 () Bool)

(assert (=> b!123367 (= e!80642 e!80645)))

(declare-fun res!59906 () Bool)

(assert (=> b!123367 (= res!59906 call!13109)))

(assert (=> b!123367 (=> (not res!59906) (not e!80645))))

(declare-fun b!123368 () Bool)

(assert (=> b!123368 (= e!80640 (not call!13106))))

(declare-fun b!123369 () Bool)

(declare-fun res!59902 () Bool)

(assert (=> b!123369 (=> (not res!59902) (not e!80647))))

(assert (=> b!123369 (= res!59902 e!80638)))

(declare-fun res!59907 () Bool)

(assert (=> b!123369 (=> res!59907 e!80638)))

(assert (=> b!123369 (= res!59907 (not e!80636))))

(declare-fun res!59903 () Bool)

(assert (=> b!123369 (=> (not res!59903) (not e!80636))))

(assert (=> b!123369 (= res!59903 (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123370 () Bool)

(assert (=> b!123370 (= e!80642 (not call!13109))))

(declare-fun bm!13107 () Bool)

(assert (=> bm!13107 (= call!13106 (contains!869 lt!63444 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!36939 c!22360) b!123362))

(assert (= (and d!36939 (not c!22360)) b!123352))

(assert (= (and b!123352 c!22364) b!123354))

(assert (= (and b!123352 (not c!22364)) b!123351))

(assert (= (and b!123351 c!22361) b!123363))

(assert (= (and b!123351 (not c!22361)) b!123353))

(assert (= (or b!123363 b!123353) bm!13106))

(assert (= (or b!123354 bm!13106) bm!13102))

(assert (= (or b!123354 b!123363) bm!13103))

(assert (= (or b!123362 bm!13102) bm!13105))

(assert (= (or b!123362 bm!13103) bm!13104))

(assert (= (and d!36939 res!59905) b!123355))

(assert (= (and d!36939 c!22362) b!123358))

(assert (= (and d!36939 (not c!22362)) b!123357))

(assert (= (and d!36939 res!59901) b!123369))

(assert (= (and b!123369 res!59903) b!123365))

(assert (= (and b!123369 (not res!59907)) b!123364))

(assert (= (and b!123364 res!59904) b!123356))

(assert (= (and b!123369 res!59902) b!123350))

(assert (= (and b!123350 c!22363) b!123367))

(assert (= (and b!123350 (not c!22363)) b!123370))

(assert (= (and b!123367 res!59906) b!123359))

(assert (= (or b!123367 b!123370) bm!13101))

(assert (= (and b!123350 res!59900) b!123360))

(assert (= (and b!123360 c!22359) b!123361))

(assert (= (and b!123360 (not c!22359)) b!123368))

(assert (= (and b!123361 res!59899) b!123366))

(assert (= (or b!123361 b!123368) bm!13107))

(declare-fun b_lambda!5417 () Bool)

(assert (=> (not b_lambda!5417) (not b!123356)))

(declare-fun t!5997 () Bool)

(declare-fun tb!2269 () Bool)

(assert (=> (and b!123206 (= (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) (defaultEntry!2755 newMap!16)) t!5997) tb!2269))

(declare-fun result!3775 () Bool)

(assert (=> tb!2269 (= result!3775 tp_is_empty!2823)))

(assert (=> b!123356 t!5997))

(declare-fun b_and!7579 () Bool)

(assert (= b_and!7575 (and (=> t!5997 result!3775) b_and!7579)))

(declare-fun t!5999 () Bool)

(declare-fun tb!2271 () Bool)

(assert (=> (and b!123212 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 newMap!16)) t!5999) tb!2271))

(declare-fun result!3777 () Bool)

(assert (= result!3777 result!3775))

(assert (=> b!123356 t!5999))

(declare-fun b_and!7581 () Bool)

(assert (= b_and!7577 (and (=> t!5999 result!3777) b_and!7581)))

(declare-fun m!143255 () Bool)

(assert (=> bm!13105 m!143255))

(declare-fun m!143257 () Bool)

(assert (=> bm!13101 m!143257))

(declare-fun m!143259 () Bool)

(assert (=> b!123355 m!143259))

(assert (=> b!123355 m!143259))

(declare-fun m!143261 () Bool)

(assert (=> b!123355 m!143261))

(declare-fun m!143263 () Bool)

(assert (=> b!123362 m!143263))

(declare-fun m!143265 () Bool)

(assert (=> b!123366 m!143265))

(declare-fun m!143267 () Bool)

(assert (=> b!123359 m!143267))

(declare-fun m!143269 () Bool)

(assert (=> bm!13107 m!143269))

(assert (=> b!123364 m!143259))

(assert (=> b!123364 m!143259))

(declare-fun m!143271 () Bool)

(assert (=> b!123364 m!143271))

(declare-fun m!143273 () Bool)

(assert (=> bm!13104 m!143273))

(assert (=> b!123365 m!143259))

(assert (=> b!123365 m!143259))

(assert (=> b!123365 m!143261))

(declare-fun m!143275 () Bool)

(assert (=> b!123356 m!143275))

(assert (=> b!123356 m!143259))

(declare-fun m!143277 () Bool)

(assert (=> b!123356 m!143277))

(declare-fun m!143279 () Bool)

(assert (=> b!123356 m!143279))

(assert (=> b!123356 m!143275))

(declare-fun m!143281 () Bool)

(assert (=> b!123356 m!143281))

(assert (=> b!123356 m!143279))

(assert (=> b!123356 m!143259))

(declare-fun m!143283 () Bool)

(assert (=> b!123358 m!143283))

(declare-fun m!143285 () Bool)

(assert (=> b!123358 m!143285))

(declare-fun m!143287 () Bool)

(assert (=> b!123358 m!143287))

(declare-fun m!143289 () Bool)

(assert (=> b!123358 m!143289))

(declare-fun m!143291 () Bool)

(assert (=> b!123358 m!143291))

(declare-fun m!143293 () Bool)

(assert (=> b!123358 m!143293))

(declare-fun m!143295 () Bool)

(assert (=> b!123358 m!143295))

(declare-fun m!143297 () Bool)

(assert (=> b!123358 m!143297))

(assert (=> b!123358 m!143259))

(assert (=> b!123358 m!143291))

(declare-fun m!143299 () Bool)

(assert (=> b!123358 m!143299))

(declare-fun m!143301 () Bool)

(assert (=> b!123358 m!143301))

(declare-fun m!143303 () Bool)

(assert (=> b!123358 m!143303))

(declare-fun m!143305 () Bool)

(assert (=> b!123358 m!143305))

(declare-fun m!143307 () Bool)

(assert (=> b!123358 m!143307))

(assert (=> b!123358 m!143305))

(assert (=> b!123358 m!143301))

(assert (=> b!123358 m!143285))

(assert (=> b!123358 m!143255))

(declare-fun m!143309 () Bool)

(assert (=> b!123358 m!143309))

(declare-fun m!143311 () Bool)

(assert (=> b!123358 m!143311))

(declare-fun m!143313 () Bool)

(assert (=> d!36939 m!143313))

(assert (=> d!36937 d!36939))

(declare-fun d!36941 () Bool)

(declare-fun e!80652 () Bool)

(assert (=> d!36941 e!80652))

(declare-fun res!59910 () Bool)

(assert (=> d!36941 (=> res!59910 e!80652)))

(declare-fun lt!63476 () Bool)

(assert (=> d!36941 (= res!59910 (not lt!63476))))

(declare-fun lt!63474 () Bool)

(assert (=> d!36941 (= lt!63476 lt!63474)))

(declare-fun lt!63473 () Unit!3835)

(declare-fun e!80653 () Unit!3835)

(assert (=> d!36941 (= lt!63473 e!80653)))

(declare-fun c!22367 () Bool)

(assert (=> d!36941 (= c!22367 lt!63474)))

(declare-fun containsKey!168 (List!1691 (_ BitVec 64)) Bool)

(assert (=> d!36941 (= lt!63474 (containsKey!168 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!36941 (= (contains!869 lt!63422 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63476)))

(declare-fun b!123377 () Bool)

(declare-fun lt!63475 () Unit!3835)

(assert (=> b!123377 (= e!80653 lt!63475)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!116 (List!1691 (_ BitVec 64)) Unit!3835)

(assert (=> b!123377 (= lt!63475 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!170 0))(
  ( (Some!169 (v!3094 V!3411)) (None!168) )
))
(declare-fun isDefined!117 (Option!170) Bool)

(declare-fun getValueByKey!164 (List!1691 (_ BitVec 64)) Option!170)

(assert (=> b!123377 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123378 () Bool)

(declare-fun Unit!3839 () Unit!3835)

(assert (=> b!123378 (= e!80653 Unit!3839)))

(declare-fun b!123379 () Bool)

(assert (=> b!123379 (= e!80652 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!36941 c!22367) b!123377))

(assert (= (and d!36941 (not c!22367)) b!123378))

(assert (= (and d!36941 (not res!59910)) b!123379))

(declare-fun m!143315 () Bool)

(assert (=> d!36941 m!143315))

(declare-fun m!143317 () Bool)

(assert (=> b!123377 m!143317))

(declare-fun m!143319 () Bool)

(assert (=> b!123377 m!143319))

(assert (=> b!123377 m!143319))

(declare-fun m!143321 () Bool)

(assert (=> b!123377 m!143321))

(assert (=> b!123379 m!143319))

(assert (=> b!123379 m!143319))

(assert (=> b!123379 m!143321))

(assert (=> bm!13100 d!36941))

(declare-fun b!123388 () Bool)

(declare-fun e!80662 () Bool)

(declare-fun call!13113 () Bool)

(assert (=> b!123388 (= e!80662 call!13113)))

(declare-fun b!123389 () Bool)

(declare-fun e!80660 () Bool)

(assert (=> b!123389 (= e!80662 e!80660)))

(declare-fun lt!63485 () (_ BitVec 64))

(assert (=> b!123389 (= lt!63485 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63483 () Unit!3835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4657 (_ BitVec 64) (_ BitVec 32)) Unit!3835)

(assert (=> b!123389 (= lt!63483 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!123389 (arrayContainsKey!0 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000)))

(declare-fun lt!63484 () Unit!3835)

(assert (=> b!123389 (= lt!63484 lt!63483)))

(declare-fun res!59915 () Bool)

(declare-datatypes ((SeekEntryResult!267 0))(
  ( (MissingZero!267 (index!3222 (_ BitVec 32))) (Found!267 (index!3223 (_ BitVec 32))) (Intermediate!267 (undefined!1079 Bool) (index!3224 (_ BitVec 32)) (x!14728 (_ BitVec 32))) (Undefined!267) (MissingVacant!267 (index!3225 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4657 (_ BitVec 32)) SeekEntryResult!267)

(assert (=> b!123389 (= res!59915 (= (seekEntryOrOpen!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (_keys!4482 newMap!16) (mask!6993 newMap!16)) (Found!267 #b00000000000000000000000000000000)))))

(assert (=> b!123389 (=> (not res!59915) (not e!80660))))

(declare-fun b!123390 () Bool)

(assert (=> b!123390 (= e!80660 call!13113)))

(declare-fun b!123391 () Bool)

(declare-fun e!80661 () Bool)

(assert (=> b!123391 (= e!80661 e!80662)))

(declare-fun c!22370 () Bool)

(assert (=> b!123391 (= c!22370 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13110 () Bool)

(assert (=> bm!13110 (= call!13113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4482 newMap!16) (mask!6993 newMap!16)))))

(declare-fun d!36943 () Bool)

(declare-fun res!59916 () Bool)

(assert (=> d!36943 (=> res!59916 e!80661)))

(assert (=> d!36943 (= res!59916 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!36943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4482 newMap!16) (mask!6993 newMap!16)) e!80661)))

(assert (= (and d!36943 (not res!59916)) b!123391))

(assert (= (and b!123391 c!22370) b!123389))

(assert (= (and b!123391 (not c!22370)) b!123388))

(assert (= (and b!123389 res!59915) b!123390))

(assert (= (or b!123390 b!123388) bm!13110))

(assert (=> b!123389 m!143259))

(declare-fun m!143323 () Bool)

(assert (=> b!123389 m!143323))

(declare-fun m!143325 () Bool)

(assert (=> b!123389 m!143325))

(assert (=> b!123389 m!143259))

(declare-fun m!143327 () Bool)

(assert (=> b!123389 m!143327))

(assert (=> b!123391 m!143259))

(assert (=> b!123391 m!143259))

(assert (=> b!123391 m!143261))

(declare-fun m!143329 () Bool)

(assert (=> bm!13110 m!143329))

(assert (=> b!123273 d!36943))

(declare-fun d!36945 () Bool)

(declare-fun e!80665 () Bool)

(assert (=> d!36945 e!80665))

(declare-fun res!59921 () Bool)

(assert (=> d!36945 (=> (not res!59921) (not e!80665))))

(declare-fun lt!63496 () ListLongMap!1673)

(assert (=> d!36945 (= res!59921 (contains!869 lt!63496 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63495 () List!1691)

(assert (=> d!36945 (= lt!63496 (ListLongMap!1674 lt!63495))))

(declare-fun lt!63494 () Unit!3835)

(declare-fun lt!63497 () Unit!3835)

(assert (=> d!36945 (= lt!63494 lt!63497)))

(assert (=> d!36945 (= (getValueByKey!164 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!80 (List!1691 (_ BitVec 64) V!3411) Unit!3835)

(assert (=> d!36945 (= lt!63497 (lemmaContainsTupThenGetReturnValue!80 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun insertStrictlySorted!83 (List!1691 (_ BitVec 64) V!3411) List!1691)

(assert (=> d!36945 (= lt!63495 (insertStrictlySorted!83 (toList!852 call!13100) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36945 (= (+!167 call!13100 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63496)))

(declare-fun b!123396 () Bool)

(declare-fun res!59922 () Bool)

(assert (=> b!123396 (=> (not res!59922) (not e!80665))))

(assert (=> b!123396 (= res!59922 (= (getValueByKey!164 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123397 () Bool)

(declare-fun contains!870 (List!1691 tuple2!2562) Bool)

(assert (=> b!123397 (= e!80665 (contains!870 (toList!852 lt!63496) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!36945 res!59921) b!123396))

(assert (= (and b!123396 res!59922) b!123397))

(declare-fun m!143331 () Bool)

(assert (=> d!36945 m!143331))

(declare-fun m!143333 () Bool)

(assert (=> d!36945 m!143333))

(declare-fun m!143335 () Bool)

(assert (=> d!36945 m!143335))

(declare-fun m!143337 () Bool)

(assert (=> d!36945 m!143337))

(declare-fun m!143339 () Bool)

(assert (=> b!123396 m!143339))

(declare-fun m!143341 () Bool)

(assert (=> b!123397 m!143341))

(assert (=> b!123329 d!36945))

(declare-fun d!36947 () Bool)

(declare-fun e!80682 () Bool)

(assert (=> d!36947 e!80682))

(declare-fun res!59931 () Bool)

(assert (=> d!36947 (=> (not res!59931) (not e!80682))))

(declare-fun lt!63516 () ListLongMap!1673)

(assert (=> d!36947 (= res!59931 (not (contains!869 lt!63516 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80680 () ListLongMap!1673)

(assert (=> d!36947 (= lt!63516 e!80680)))

(declare-fun c!22379 () Bool)

(assert (=> d!36947 (= c!22379 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!36947 (validMask!0 (mask!6993 (v!3092 (underlying!431 thiss!992))))))

(assert (=> d!36947 (= (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) lt!63516)))

(declare-fun b!123422 () Bool)

(declare-fun e!80684 () Bool)

(assert (=> b!123422 (= e!80682 e!80684)))

(declare-fun c!22381 () Bool)

(declare-fun e!80683 () Bool)

(assert (=> b!123422 (= c!22381 e!80683)))

(declare-fun res!59933 () Bool)

(assert (=> b!123422 (=> (not res!59933) (not e!80683))))

(assert (=> b!123422 (= res!59933 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123423 () Bool)

(declare-fun e!80685 () ListLongMap!1673)

(declare-fun call!13116 () ListLongMap!1673)

(assert (=> b!123423 (= e!80685 call!13116)))

(declare-fun b!123424 () Bool)

(declare-fun e!80686 () Bool)

(assert (=> b!123424 (= e!80684 e!80686)))

(declare-fun c!22382 () Bool)

(assert (=> b!123424 (= c!22382 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123425 () Bool)

(declare-fun isEmpty!390 (ListLongMap!1673) Bool)

(assert (=> b!123425 (= e!80686 (isEmpty!390 lt!63516))))

(declare-fun b!123426 () Bool)

(declare-fun res!59934 () Bool)

(assert (=> b!123426 (=> (not res!59934) (not e!80682))))

(assert (=> b!123426 (= res!59934 (not (contains!869 lt!63516 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123427 () Bool)

(assert (=> b!123427 (= e!80680 (ListLongMap!1674 Nil!1688))))

(declare-fun b!123428 () Bool)

(assert (=> b!123428 (= e!80683 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123428 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!123429 () Bool)

(assert (=> b!123429 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> b!123429 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80681 () Bool)

(assert (=> b!123429 (= e!80681 (= (apply!108 lt!63516 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123430 () Bool)

(assert (=> b!123430 (= e!80680 e!80685)))

(declare-fun c!22380 () Bool)

(assert (=> b!123430 (= c!22380 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123431 () Bool)

(assert (=> b!123431 (= e!80686 (= lt!63516 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123432 () Bool)

(declare-fun lt!63515 () Unit!3835)

(declare-fun lt!63512 () Unit!3835)

(assert (=> b!123432 (= lt!63515 lt!63512)))

(declare-fun lt!63518 () V!3411)

(declare-fun lt!63514 () ListLongMap!1673)

(declare-fun lt!63513 () (_ BitVec 64))

(declare-fun lt!63517 () (_ BitVec 64))

(assert (=> b!123432 (not (contains!869 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518)) lt!63513))))

(declare-fun addStillNotContains!54 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> b!123432 (= lt!63512 (addStillNotContains!54 lt!63514 lt!63517 lt!63518 lt!63513))))

(assert (=> b!123432 (= lt!63513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123432 (= lt!63518 (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123432 (= lt!63517 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123432 (= lt!63514 call!13116)))

(assert (=> b!123432 (= e!80685 (+!167 call!13116 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!13113 () Bool)

(assert (=> bm!13113 (= call!13116 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123433 () Bool)

(assert (=> b!123433 (= e!80684 e!80681)))

(assert (=> b!123433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun res!59932 () Bool)

(assert (=> b!123433 (= res!59932 (contains!869 lt!63516 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123433 (=> (not res!59932) (not e!80681))))

(assert (= (and d!36947 c!22379) b!123427))

(assert (= (and d!36947 (not c!22379)) b!123430))

(assert (= (and b!123430 c!22380) b!123432))

(assert (= (and b!123430 (not c!22380)) b!123423))

(assert (= (or b!123432 b!123423) bm!13113))

(assert (= (and d!36947 res!59931) b!123426))

(assert (= (and b!123426 res!59934) b!123422))

(assert (= (and b!123422 res!59933) b!123428))

(assert (= (and b!123422 c!22381) b!123433))

(assert (= (and b!123422 (not c!22381)) b!123424))

(assert (= (and b!123433 res!59932) b!123429))

(assert (= (and b!123424 c!22382) b!123431))

(assert (= (and b!123424 (not c!22382)) b!123425))

(declare-fun b_lambda!5419 () Bool)

(assert (=> (not b_lambda!5419) (not b!123429)))

(assert (=> b!123429 t!5992))

(declare-fun b_and!7583 () Bool)

(assert (= b_and!7579 (and (=> t!5992 result!3767) b_and!7583)))

(assert (=> b!123429 t!5994))

(declare-fun b_and!7585 () Bool)

(assert (= b_and!7581 (and (=> t!5994 result!3771) b_and!7585)))

(declare-fun b_lambda!5421 () Bool)

(assert (=> (not b_lambda!5421) (not b!123432)))

(assert (=> b!123432 t!5992))

(declare-fun b_and!7587 () Bool)

(assert (= b_and!7583 (and (=> t!5992 result!3767) b_and!7587)))

(assert (=> b!123432 t!5994))

(declare-fun b_and!7589 () Bool)

(assert (= b_and!7585 (and (=> t!5994 result!3771) b_and!7589)))

(assert (=> b!123429 m!143213))

(assert (=> b!123429 m!143213))

(assert (=> b!123429 m!143209))

(assert (=> b!123429 m!143215))

(assert (=> b!123429 m!143193))

(declare-fun m!143343 () Bool)

(assert (=> b!123429 m!143343))

(assert (=> b!123429 m!143193))

(assert (=> b!123429 m!143209))

(assert (=> b!123428 m!143193))

(assert (=> b!123428 m!143193))

(assert (=> b!123428 m!143195))

(declare-fun m!143345 () Bool)

(assert (=> bm!13113 m!143345))

(assert (=> b!123431 m!143345))

(assert (=> b!123430 m!143193))

(assert (=> b!123430 m!143193))

(assert (=> b!123430 m!143195))

(declare-fun m!143347 () Bool)

(assert (=> b!123432 m!143347))

(assert (=> b!123432 m!143213))

(assert (=> b!123432 m!143209))

(assert (=> b!123432 m!143215))

(declare-fun m!143349 () Bool)

(assert (=> b!123432 m!143349))

(assert (=> b!123432 m!143193))

(declare-fun m!143351 () Bool)

(assert (=> b!123432 m!143351))

(assert (=> b!123432 m!143213))

(assert (=> b!123432 m!143209))

(assert (=> b!123432 m!143351))

(declare-fun m!143353 () Bool)

(assert (=> b!123432 m!143353))

(assert (=> b!123433 m!143193))

(assert (=> b!123433 m!143193))

(declare-fun m!143355 () Bool)

(assert (=> b!123433 m!143355))

(declare-fun m!143357 () Bool)

(assert (=> b!123425 m!143357))

(declare-fun m!143359 () Bool)

(assert (=> d!36947 m!143359))

(assert (=> d!36947 m!143247))

(declare-fun m!143361 () Bool)

(assert (=> b!123426 m!143361))

(assert (=> bm!13098 d!36947))

(declare-fun d!36949 () Bool)

(assert (=> d!36949 (= (validMask!0 (mask!6993 (v!3092 (underlying!431 thiss!992)))) (and (or (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000001111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000011111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000001111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000011111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000001111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000011111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000001111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000011111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000001111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000011111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000001111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000011111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000001111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000011111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000001111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000011111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000111111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00001111111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00011111111111111111111111111111) (= (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!36935 d!36949))

(declare-fun d!36951 () Bool)

(declare-fun res!59941 () Bool)

(declare-fun e!80697 () Bool)

(assert (=> d!36951 (=> res!59941 e!80697)))

(assert (=> d!36951 (= res!59941 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!36951 (= (arrayNoDuplicates!0 (_keys!4482 newMap!16) #b00000000000000000000000000000000 Nil!1689) e!80697)))

(declare-fun b!123444 () Bool)

(declare-fun e!80698 () Bool)

(assert (=> b!123444 (= e!80697 e!80698)))

(declare-fun res!59942 () Bool)

(assert (=> b!123444 (=> (not res!59942) (not e!80698))))

(declare-fun e!80695 () Bool)

(assert (=> b!123444 (= res!59942 (not e!80695))))

(declare-fun res!59943 () Bool)

(assert (=> b!123444 (=> (not res!59943) (not e!80695))))

(assert (=> b!123444 (= res!59943 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123445 () Bool)

(declare-fun contains!871 (List!1692 (_ BitVec 64)) Bool)

(assert (=> b!123445 (= e!80695 (contains!871 Nil!1689 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123446 () Bool)

(declare-fun e!80696 () Bool)

(declare-fun call!13119 () Bool)

(assert (=> b!123446 (= e!80696 call!13119)))

(declare-fun b!123447 () Bool)

(assert (=> b!123447 (= e!80696 call!13119)))

(declare-fun bm!13116 () Bool)

(declare-fun c!22385 () Bool)

(assert (=> bm!13116 (= call!13119 (arrayNoDuplicates!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22385 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689)))))

(declare-fun b!123448 () Bool)

(assert (=> b!123448 (= e!80698 e!80696)))

(assert (=> b!123448 (= c!22385 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!36951 (not res!59941)) b!123444))

(assert (= (and b!123444 res!59943) b!123445))

(assert (= (and b!123444 res!59942) b!123448))

(assert (= (and b!123448 c!22385) b!123447))

(assert (= (and b!123448 (not c!22385)) b!123446))

(assert (= (or b!123447 b!123446) bm!13116))

(assert (=> b!123444 m!143259))

(assert (=> b!123444 m!143259))

(assert (=> b!123444 m!143261))

(assert (=> b!123445 m!143259))

(assert (=> b!123445 m!143259))

(declare-fun m!143363 () Bool)

(assert (=> b!123445 m!143363))

(assert (=> bm!13116 m!143259))

(declare-fun m!143365 () Bool)

(assert (=> bm!13116 m!143365))

(assert (=> b!123448 m!143259))

(assert (=> b!123448 m!143259))

(assert (=> b!123448 m!143261))

(assert (=> b!123274 d!36951))

(declare-fun d!36953 () Bool)

(declare-fun e!80699 () Bool)

(assert (=> d!36953 e!80699))

(declare-fun res!59944 () Bool)

(assert (=> d!36953 (=> (not res!59944) (not e!80699))))

(declare-fun lt!63521 () ListLongMap!1673)

(assert (=> d!36953 (= res!59944 (contains!869 lt!63521 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun lt!63520 () List!1691)

(assert (=> d!36953 (= lt!63521 (ListLongMap!1674 lt!63520))))

(declare-fun lt!63519 () Unit!3835)

(declare-fun lt!63522 () Unit!3835)

(assert (=> d!36953 (= lt!63519 lt!63522)))

(assert (=> d!36953 (= (getValueByKey!164 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (Some!169 (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!36953 (= lt!63522 (lemmaContainsTupThenGetReturnValue!80 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!36953 (= lt!63520 (insertStrictlySorted!83 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!36953 (= (+!167 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63521)))

(declare-fun b!123449 () Bool)

(declare-fun res!59945 () Bool)

(assert (=> b!123449 (=> (not res!59945) (not e!80699))))

(assert (=> b!123449 (= res!59945 (= (getValueByKey!164 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (Some!169 (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123450 () Bool)

(assert (=> b!123450 (= e!80699 (contains!870 (toList!852 lt!63521) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!36953 res!59944) b!123449))

(assert (= (and b!123449 res!59945) b!123450))

(declare-fun m!143367 () Bool)

(assert (=> d!36953 m!143367))

(declare-fun m!143369 () Bool)

(assert (=> d!36953 m!143369))

(declare-fun m!143371 () Bool)

(assert (=> d!36953 m!143371))

(declare-fun m!143373 () Bool)

(assert (=> d!36953 m!143373))

(declare-fun m!143375 () Bool)

(assert (=> b!123449 m!143375))

(declare-fun m!143377 () Bool)

(assert (=> b!123450 m!143377))

(assert (=> bm!13097 d!36953))

(declare-fun b!123459 () Bool)

(declare-fun e!80705 () (_ BitVec 32))

(declare-fun e!80704 () (_ BitVec 32))

(assert (=> b!123459 (= e!80705 e!80704)))

(declare-fun c!22391 () Bool)

(assert (=> b!123459 (= c!22391 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123460 () Bool)

(declare-fun call!13122 () (_ BitVec 32))

(assert (=> b!123460 (= e!80704 call!13122)))

(declare-fun bm!13119 () Bool)

(assert (=> bm!13119 (= call!13122 (arrayCountValidKeys!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123461 () Bool)

(assert (=> b!123461 (= e!80704 (bvadd #b00000000000000000000000000000001 call!13122))))

(declare-fun b!123462 () Bool)

(assert (=> b!123462 (= e!80705 #b00000000000000000000000000000000)))

(declare-fun d!36955 () Bool)

(declare-fun lt!63525 () (_ BitVec 32))

(assert (=> d!36955 (and (bvsge lt!63525 #b00000000000000000000000000000000) (bvsle lt!63525 (bvsub (size!2469 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!36955 (= lt!63525 e!80705)))

(declare-fun c!22390 () Bool)

(assert (=> d!36955 (= c!22390 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!36955 (and (bvsle #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2469 (_keys!4482 newMap!16)) (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!36955 (= (arrayCountValidKeys!0 (_keys!4482 newMap!16) #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))) lt!63525)))

(assert (= (and d!36955 c!22390) b!123462))

(assert (= (and d!36955 (not c!22390)) b!123459))

(assert (= (and b!123459 c!22391) b!123461))

(assert (= (and b!123459 (not c!22391)) b!123460))

(assert (= (or b!123461 b!123460) bm!13119))

(assert (=> b!123459 m!143259))

(assert (=> b!123459 m!143259))

(assert (=> b!123459 m!143261))

(declare-fun m!143379 () Bool)

(assert (=> bm!13119 m!143379))

(assert (=> b!123272 d!36955))

(declare-fun b!123471 () Bool)

(declare-fun res!59954 () Bool)

(declare-fun e!80708 () Bool)

(assert (=> b!123471 (=> (not res!59954) (not e!80708))))

(assert (=> b!123471 (= res!59954 (and (= (size!2470 (_values!2738 newMap!16)) (bvadd (mask!6993 newMap!16) #b00000000000000000000000000000001)) (= (size!2469 (_keys!4482 newMap!16)) (size!2470 (_values!2738 newMap!16))) (bvsge (_size!571 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!571 newMap!16) (bvadd (mask!6993 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!123473 () Bool)

(declare-fun res!59956 () Bool)

(assert (=> b!123473 (=> (not res!59956) (not e!80708))))

(declare-fun size!2473 (LongMapFixedSize!1044) (_ BitVec 32))

(assert (=> b!123473 (= res!59956 (= (size!2473 newMap!16) (bvadd (_size!571 newMap!16) (bvsdiv (bvadd (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123472 () Bool)

(declare-fun res!59957 () Bool)

(assert (=> b!123472 (=> (not res!59957) (not e!80708))))

(assert (=> b!123472 (= res!59957 (bvsge (size!2473 newMap!16) (_size!571 newMap!16)))))

(declare-fun d!36957 () Bool)

(declare-fun res!59955 () Bool)

(assert (=> d!36957 (=> (not res!59955) (not e!80708))))

(assert (=> d!36957 (= res!59955 (validMask!0 (mask!6993 newMap!16)))))

(assert (=> d!36957 (= (simpleValid!84 newMap!16) e!80708)))

(declare-fun b!123474 () Bool)

(assert (=> b!123474 (= e!80708 (and (bvsge (extraKeys!2540 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2540 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!571 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!36957 res!59955) b!123471))

(assert (= (and b!123471 res!59954) b!123472))

(assert (= (and b!123472 res!59957) b!123473))

(assert (= (and b!123473 res!59956) b!123474))

(declare-fun m!143381 () Bool)

(assert (=> b!123473 m!143381))

(assert (=> b!123472 m!143381))

(assert (=> d!36957 m!143313))

(assert (=> d!36927 d!36957))

(declare-fun d!36959 () Bool)

(declare-fun e!80709 () Bool)

(assert (=> d!36959 e!80709))

(declare-fun res!59958 () Bool)

(assert (=> d!36959 (=> res!59958 e!80709)))

(declare-fun lt!63529 () Bool)

(assert (=> d!36959 (= res!59958 (not lt!63529))))

(declare-fun lt!63527 () Bool)

(assert (=> d!36959 (= lt!63529 lt!63527)))

(declare-fun lt!63526 () Unit!3835)

(declare-fun e!80710 () Unit!3835)

(assert (=> d!36959 (= lt!63526 e!80710)))

(declare-fun c!22392 () Bool)

(assert (=> d!36959 (= c!22392 lt!63527)))

(assert (=> d!36959 (= lt!63527 (containsKey!168 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!36959 (= (contains!869 lt!63422 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63529)))

(declare-fun b!123475 () Bool)

(declare-fun lt!63528 () Unit!3835)

(assert (=> b!123475 (= e!80710 lt!63528)))

(assert (=> b!123475 (= lt!63528 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123475 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123476 () Bool)

(declare-fun Unit!3840 () Unit!3835)

(assert (=> b!123476 (= e!80710 Unit!3840)))

(declare-fun b!123477 () Bool)

(assert (=> b!123477 (= e!80709 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!36959 c!22392) b!123475))

(assert (= (and d!36959 (not c!22392)) b!123476))

(assert (= (and d!36959 (not res!59958)) b!123477))

(declare-fun m!143383 () Bool)

(assert (=> d!36959 m!143383))

(declare-fun m!143385 () Bool)

(assert (=> b!123475 m!143385))

(declare-fun m!143387 () Bool)

(assert (=> b!123475 m!143387))

(assert (=> b!123475 m!143387))

(declare-fun m!143389 () Bool)

(assert (=> b!123475 m!143389))

(assert (=> b!123477 m!143387))

(assert (=> b!123477 m!143387))

(assert (=> b!123477 m!143389))

(assert (=> bm!13094 d!36959))

(declare-fun d!36961 () Bool)

(declare-fun get!1426 (Option!170) V!3411)

(assert (=> d!36961 (= (apply!108 lt!63422 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1426 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5108 () Bool)

(assert (= bs!5108 d!36961))

(assert (=> bs!5108 m!143319))

(assert (=> bs!5108 m!143319))

(declare-fun m!143391 () Bool)

(assert (=> bs!5108 m!143391))

(assert (=> b!123333 d!36961))

(declare-fun d!36963 () Bool)

(assert (=> d!36963 (= (apply!108 lt!63439 lt!63426) (get!1426 (getValueByKey!164 (toList!852 lt!63439) lt!63426)))))

(declare-fun bs!5109 () Bool)

(assert (= bs!5109 d!36963))

(declare-fun m!143393 () Bool)

(assert (=> bs!5109 m!143393))

(assert (=> bs!5109 m!143393))

(declare-fun m!143395 () Bool)

(assert (=> bs!5109 m!143395))

(assert (=> b!123325 d!36963))

(declare-fun d!36965 () Bool)

(assert (=> d!36965 (= (apply!108 lt!63421 lt!63432) (get!1426 (getValueByKey!164 (toList!852 lt!63421) lt!63432)))))

(declare-fun bs!5110 () Bool)

(assert (= bs!5110 d!36965))

(declare-fun m!143397 () Bool)

(assert (=> bs!5110 m!143397))

(assert (=> bs!5110 m!143397))

(declare-fun m!143399 () Bool)

(assert (=> bs!5110 m!143399))

(assert (=> b!123325 d!36965))

(declare-fun d!36967 () Bool)

(declare-fun e!80711 () Bool)

(assert (=> d!36967 e!80711))

(declare-fun res!59959 () Bool)

(assert (=> d!36967 (=> (not res!59959) (not e!80711))))

(declare-fun lt!63532 () ListLongMap!1673)

(assert (=> d!36967 (= res!59959 (contains!869 lt!63532 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63531 () List!1691)

(assert (=> d!36967 (= lt!63532 (ListLongMap!1674 lt!63531))))

(declare-fun lt!63530 () Unit!3835)

(declare-fun lt!63533 () Unit!3835)

(assert (=> d!36967 (= lt!63530 lt!63533)))

(assert (=> d!36967 (= (getValueByKey!164 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36967 (= lt!63533 (lemmaContainsTupThenGetReturnValue!80 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36967 (= lt!63531 (insertStrictlySorted!83 (toList!852 lt!63434) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36967 (= (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63532)))

(declare-fun b!123478 () Bool)

(declare-fun res!59960 () Bool)

(assert (=> b!123478 (=> (not res!59960) (not e!80711))))

(assert (=> b!123478 (= res!59960 (= (getValueByKey!164 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123479 () Bool)

(assert (=> b!123479 (= e!80711 (contains!870 (toList!852 lt!63532) (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!36967 res!59959) b!123478))

(assert (= (and b!123478 res!59960) b!123479))

(declare-fun m!143401 () Bool)

(assert (=> d!36967 m!143401))

(declare-fun m!143403 () Bool)

(assert (=> d!36967 m!143403))

(declare-fun m!143405 () Bool)

(assert (=> d!36967 m!143405))

(declare-fun m!143407 () Bool)

(assert (=> d!36967 m!143407))

(declare-fun m!143409 () Bool)

(assert (=> b!123478 m!143409))

(declare-fun m!143411 () Bool)

(assert (=> b!123479 m!143411))

(assert (=> b!123325 d!36967))

(declare-fun d!36969 () Bool)

(assert (=> d!36969 (= (apply!108 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63433) (apply!108 lt!63434 lt!63433))))

(declare-fun lt!63536 () Unit!3835)

(declare-fun choose!742 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> d!36969 (= lt!63536 (choose!742 lt!63434 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63433))))

(declare-fun e!80714 () Bool)

(assert (=> d!36969 e!80714))

(declare-fun res!59963 () Bool)

(assert (=> d!36969 (=> (not res!59963) (not e!80714))))

(assert (=> d!36969 (= res!59963 (contains!869 lt!63434 lt!63433))))

(assert (=> d!36969 (= (addApplyDifferent!84 lt!63434 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63433) lt!63536)))

(declare-fun b!123483 () Bool)

(assert (=> b!123483 (= e!80714 (not (= lt!63433 lt!63442)))))

(assert (= (and d!36969 res!59963) b!123483))

(declare-fun m!143413 () Bool)

(assert (=> d!36969 m!143413))

(assert (=> d!36969 m!143225))

(assert (=> d!36969 m!143243))

(assert (=> d!36969 m!143225))

(assert (=> d!36969 m!143233))

(declare-fun m!143415 () Bool)

(assert (=> d!36969 m!143415))

(assert (=> b!123325 d!36969))

(declare-fun d!36971 () Bool)

(assert (=> d!36971 (= (apply!108 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63432) (apply!108 lt!63421 lt!63432))))

(declare-fun lt!63537 () Unit!3835)

(assert (=> d!36971 (= lt!63537 (choose!742 lt!63421 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63432))))

(declare-fun e!80715 () Bool)

(assert (=> d!36971 e!80715))

(declare-fun res!59964 () Bool)

(assert (=> d!36971 (=> (not res!59964) (not e!80715))))

(assert (=> d!36971 (= res!59964 (contains!869 lt!63421 lt!63432))))

(assert (=> d!36971 (= (addApplyDifferent!84 lt!63421 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63432) lt!63537)))

(declare-fun b!123484 () Bool)

(assert (=> b!123484 (= e!80715 (not (= lt!63432 lt!63429)))))

(assert (= (and d!36971 res!59964) b!123484))

(declare-fun m!143417 () Bool)

(assert (=> d!36971 m!143417))

(assert (=> d!36971 m!143219))

(assert (=> d!36971 m!143223))

(assert (=> d!36971 m!143219))

(assert (=> d!36971 m!143221))

(declare-fun m!143419 () Bool)

(assert (=> d!36971 m!143419))

(assert (=> b!123325 d!36971))

(declare-fun d!36973 () Bool)

(assert (=> d!36973 (= (apply!108 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63426) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63426)))))

(declare-fun bs!5111 () Bool)

(assert (= bs!5111 d!36973))

(declare-fun m!143421 () Bool)

(assert (=> bs!5111 m!143421))

(assert (=> bs!5111 m!143421))

(declare-fun m!143423 () Bool)

(assert (=> bs!5111 m!143423))

(assert (=> b!123325 d!36973))

(declare-fun d!36975 () Bool)

(declare-fun e!80716 () Bool)

(assert (=> d!36975 e!80716))

(declare-fun res!59965 () Bool)

(assert (=> d!36975 (=> (not res!59965) (not e!80716))))

(declare-fun lt!63540 () ListLongMap!1673)

(assert (=> d!36975 (= res!59965 (contains!869 lt!63540 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63539 () List!1691)

(assert (=> d!36975 (= lt!63540 (ListLongMap!1674 lt!63539))))

(declare-fun lt!63538 () Unit!3835)

(declare-fun lt!63541 () Unit!3835)

(assert (=> d!36975 (= lt!63538 lt!63541)))

(assert (=> d!36975 (= (getValueByKey!164 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36975 (= lt!63541 (lemmaContainsTupThenGetReturnValue!80 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36975 (= lt!63539 (insertStrictlySorted!83 (toList!852 lt!63421) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36975 (= (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63540)))

(declare-fun b!123485 () Bool)

(declare-fun res!59966 () Bool)

(assert (=> b!123485 (=> (not res!59966) (not e!80716))))

(assert (=> b!123485 (= res!59966 (= (getValueByKey!164 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123486 () Bool)

(assert (=> b!123486 (= e!80716 (contains!870 (toList!852 lt!63540) (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!36975 res!59965) b!123485))

(assert (= (and b!123485 res!59966) b!123486))

(declare-fun m!143425 () Bool)

(assert (=> d!36975 m!143425))

(declare-fun m!143427 () Bool)

(assert (=> d!36975 m!143427))

(declare-fun m!143429 () Bool)

(assert (=> d!36975 m!143429))

(declare-fun m!143431 () Bool)

(assert (=> d!36975 m!143431))

(declare-fun m!143433 () Bool)

(assert (=> b!123485 m!143433))

(declare-fun m!143435 () Bool)

(assert (=> b!123486 m!143435))

(assert (=> b!123325 d!36975))

(declare-fun d!36977 () Bool)

(declare-fun e!80717 () Bool)

(assert (=> d!36977 e!80717))

(declare-fun res!59967 () Bool)

(assert (=> d!36977 (=> (not res!59967) (not e!80717))))

(declare-fun lt!63544 () ListLongMap!1673)

(assert (=> d!36977 (= res!59967 (contains!869 lt!63544 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63543 () List!1691)

(assert (=> d!36977 (= lt!63544 (ListLongMap!1674 lt!63543))))

(declare-fun lt!63542 () Unit!3835)

(declare-fun lt!63545 () Unit!3835)

(assert (=> d!36977 (= lt!63542 lt!63545)))

(assert (=> d!36977 (= (getValueByKey!164 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36977 (= lt!63545 (lemmaContainsTupThenGetReturnValue!80 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36977 (= lt!63543 (insertStrictlySorted!83 (toList!852 lt!63428) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36977 (= (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63544)))

(declare-fun b!123487 () Bool)

(declare-fun res!59968 () Bool)

(assert (=> b!123487 (=> (not res!59968) (not e!80717))))

(assert (=> b!123487 (= res!59968 (= (getValueByKey!164 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123488 () Bool)

(assert (=> b!123488 (= e!80717 (contains!870 (toList!852 lt!63544) (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!36977 res!59967) b!123487))

(assert (= (and b!123487 res!59968) b!123488))

(declare-fun m!143437 () Bool)

(assert (=> d!36977 m!143437))

(declare-fun m!143439 () Bool)

(assert (=> d!36977 m!143439))

(declare-fun m!143441 () Bool)

(assert (=> d!36977 m!143441))

(declare-fun m!143443 () Bool)

(assert (=> d!36977 m!143443))

(declare-fun m!143445 () Bool)

(assert (=> b!123487 m!143445))

(declare-fun m!143447 () Bool)

(assert (=> b!123488 m!143447))

(assert (=> b!123325 d!36977))

(declare-fun d!36979 () Bool)

(assert (=> d!36979 (= (apply!108 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63426) (apply!108 lt!63439 lt!63426))))

(declare-fun lt!63546 () Unit!3835)

(assert (=> d!36979 (= lt!63546 (choose!742 lt!63439 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63426))))

(declare-fun e!80718 () Bool)

(assert (=> d!36979 e!80718))

(declare-fun res!59969 () Bool)

(assert (=> d!36979 (=> (not res!59969) (not e!80718))))

(assert (=> d!36979 (= res!59969 (contains!869 lt!63439 lt!63426))))

(assert (=> d!36979 (= (addApplyDifferent!84 lt!63439 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63426) lt!63546)))

(declare-fun b!123489 () Bool)

(assert (=> b!123489 (= e!80718 (not (= lt!63426 lt!63436)))))

(assert (= (and d!36979 res!59969) b!123489))

(declare-fun m!143449 () Bool)

(assert (=> d!36979 m!143449))

(assert (=> d!36979 m!143235))

(assert (=> d!36979 m!143227))

(assert (=> d!36979 m!143235))

(assert (=> d!36979 m!143237))

(declare-fun m!143451 () Bool)

(assert (=> d!36979 m!143451))

(assert (=> b!123325 d!36979))

(declare-fun d!36981 () Bool)

(declare-fun e!80719 () Bool)

(assert (=> d!36981 e!80719))

(declare-fun res!59970 () Bool)

(assert (=> d!36981 (=> (not res!59970) (not e!80719))))

(declare-fun lt!63549 () ListLongMap!1673)

(assert (=> d!36981 (= res!59970 (contains!869 lt!63549 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63548 () List!1691)

(assert (=> d!36981 (= lt!63549 (ListLongMap!1674 lt!63548))))

(declare-fun lt!63547 () Unit!3835)

(declare-fun lt!63550 () Unit!3835)

(assert (=> d!36981 (= lt!63547 lt!63550)))

(assert (=> d!36981 (= (getValueByKey!164 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36981 (= lt!63550 (lemmaContainsTupThenGetReturnValue!80 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36981 (= lt!63548 (insertStrictlySorted!83 (toList!852 lt!63439) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!36981 (= (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63549)))

(declare-fun b!123490 () Bool)

(declare-fun res!59971 () Bool)

(assert (=> b!123490 (=> (not res!59971) (not e!80719))))

(assert (=> b!123490 (= res!59971 (= (getValueByKey!164 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123491 () Bool)

(assert (=> b!123491 (= e!80719 (contains!870 (toList!852 lt!63549) (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!36981 res!59970) b!123490))

(assert (= (and b!123490 res!59971) b!123491))

(declare-fun m!143453 () Bool)

(assert (=> d!36981 m!143453))

(declare-fun m!143455 () Bool)

(assert (=> d!36981 m!143455))

(declare-fun m!143457 () Bool)

(assert (=> d!36981 m!143457))

(declare-fun m!143459 () Bool)

(assert (=> d!36981 m!143459))

(declare-fun m!143461 () Bool)

(assert (=> b!123490 m!143461))

(declare-fun m!143463 () Bool)

(assert (=> b!123491 m!143463))

(assert (=> b!123325 d!36981))

(declare-fun d!36983 () Bool)

(declare-fun e!80720 () Bool)

(assert (=> d!36983 e!80720))

(declare-fun res!59972 () Bool)

(assert (=> d!36983 (=> res!59972 e!80720)))

(declare-fun lt!63554 () Bool)

(assert (=> d!36983 (= res!59972 (not lt!63554))))

(declare-fun lt!63552 () Bool)

(assert (=> d!36983 (= lt!63554 lt!63552)))

(declare-fun lt!63551 () Unit!3835)

(declare-fun e!80721 () Unit!3835)

(assert (=> d!36983 (= lt!63551 e!80721)))

(declare-fun c!22393 () Bool)

(assert (=> d!36983 (= c!22393 lt!63552)))

(assert (=> d!36983 (= lt!63552 (containsKey!168 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(assert (=> d!36983 (= (contains!869 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63440) lt!63554)))

(declare-fun b!123492 () Bool)

(declare-fun lt!63553 () Unit!3835)

(assert (=> b!123492 (= e!80721 lt!63553)))

(assert (=> b!123492 (= lt!63553 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(assert (=> b!123492 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(declare-fun b!123493 () Bool)

(declare-fun Unit!3841 () Unit!3835)

(assert (=> b!123493 (= e!80721 Unit!3841)))

(declare-fun b!123494 () Bool)

(assert (=> b!123494 (= e!80720 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440)))))

(assert (= (and d!36983 c!22393) b!123492))

(assert (= (and d!36983 (not c!22393)) b!123493))

(assert (= (and d!36983 (not res!59972)) b!123494))

(declare-fun m!143465 () Bool)

(assert (=> d!36983 m!143465))

(declare-fun m!143467 () Bool)

(assert (=> b!123492 m!143467))

(declare-fun m!143469 () Bool)

(assert (=> b!123492 m!143469))

(assert (=> b!123492 m!143469))

(declare-fun m!143471 () Bool)

(assert (=> b!123492 m!143471))

(assert (=> b!123494 m!143469))

(assert (=> b!123494 m!143469))

(assert (=> b!123494 m!143471))

(assert (=> b!123325 d!36983))

(declare-fun d!36985 () Bool)

(assert (=> d!36985 (= (apply!108 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63433) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63433)))))

(declare-fun bs!5112 () Bool)

(assert (= bs!5112 d!36985))

(declare-fun m!143473 () Bool)

(assert (=> bs!5112 m!143473))

(assert (=> bs!5112 m!143473))

(declare-fun m!143475 () Bool)

(assert (=> bs!5112 m!143475))

(assert (=> b!123325 d!36985))

(assert (=> b!123325 d!36947))

(declare-fun d!36987 () Bool)

(assert (=> d!36987 (= (apply!108 lt!63434 lt!63433) (get!1426 (getValueByKey!164 (toList!852 lt!63434) lt!63433)))))

(declare-fun bs!5113 () Bool)

(assert (= bs!5113 d!36987))

(declare-fun m!143477 () Bool)

(assert (=> bs!5113 m!143477))

(assert (=> bs!5113 m!143477))

(declare-fun m!143479 () Bool)

(assert (=> bs!5113 m!143479))

(assert (=> b!123325 d!36987))

(declare-fun d!36989 () Bool)

(assert (=> d!36989 (= (apply!108 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63432) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63432)))))

(declare-fun bs!5114 () Bool)

(assert (= bs!5114 d!36989))

(declare-fun m!143481 () Bool)

(assert (=> bs!5114 m!143481))

(assert (=> bs!5114 m!143481))

(declare-fun m!143483 () Bool)

(assert (=> bs!5114 m!143483))

(assert (=> b!123325 d!36989))

(declare-fun d!36991 () Bool)

(assert (=> d!36991 (contains!869 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63440)))

(declare-fun lt!63557 () Unit!3835)

(declare-fun choose!743 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> d!36991 (= lt!63557 (choose!743 lt!63428 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63440))))

(assert (=> d!36991 (contains!869 lt!63428 lt!63440)))

(assert (=> d!36991 (= (addStillContains!84 lt!63428 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63440) lt!63557)))

(declare-fun bs!5115 () Bool)

(assert (= bs!5115 d!36991))

(assert (=> bs!5115 m!143239))

(assert (=> bs!5115 m!143239))

(assert (=> bs!5115 m!143241))

(declare-fun m!143485 () Bool)

(assert (=> bs!5115 m!143485))

(declare-fun m!143487 () Bool)

(assert (=> bs!5115 m!143487))

(assert (=> b!123325 d!36991))

(declare-fun d!36993 () Bool)

(assert (=> d!36993 (= (apply!108 lt!63422 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1426 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5116 () Bool)

(assert (= bs!5116 d!36993))

(assert (=> bs!5116 m!143387))

(assert (=> bs!5116 m!143387))

(declare-fun m!143489 () Bool)

(assert (=> bs!5116 m!143489))

(assert (=> b!123326 d!36993))

(declare-fun d!36995 () Bool)

(assert (=> d!36995 (= (apply!108 lt!63422 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1426 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5117 () Bool)

(assert (= bs!5117 d!36995))

(assert (=> bs!5117 m!143193))

(declare-fun m!143491 () Bool)

(assert (=> bs!5117 m!143491))

(assert (=> bs!5117 m!143491))

(declare-fun m!143493 () Bool)

(assert (=> bs!5117 m!143493))

(assert (=> b!123323 d!36995))

(declare-fun d!36997 () Bool)

(declare-fun c!22396 () Bool)

(assert (=> d!36997 (= c!22396 ((_ is ValueCellFull!1068) (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80724 () V!3411)

(assert (=> d!36997 (= (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80724)))

(declare-fun b!123500 () Bool)

(declare-fun get!1427 (ValueCell!1068 V!3411) V!3411)

(assert (=> b!123500 (= e!80724 (get!1427 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123501 () Bool)

(declare-fun get!1428 (ValueCell!1068 V!3411) V!3411)

(assert (=> b!123501 (= e!80724 (get!1428 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!36997 c!22396) b!123500))

(assert (= (and d!36997 (not c!22396)) b!123501))

(assert (=> b!123500 m!143213))

(assert (=> b!123500 m!143209))

(declare-fun m!143495 () Bool)

(assert (=> b!123500 m!143495))

(assert (=> b!123501 m!143213))

(assert (=> b!123501 m!143209))

(declare-fun m!143497 () Bool)

(assert (=> b!123501 m!143497))

(assert (=> b!123323 d!36997))

(declare-fun d!36999 () Bool)

(declare-fun e!80725 () Bool)

(assert (=> d!36999 e!80725))

(declare-fun res!59973 () Bool)

(assert (=> d!36999 (=> res!59973 e!80725)))

(declare-fun lt!63561 () Bool)

(assert (=> d!36999 (= res!59973 (not lt!63561))))

(declare-fun lt!63559 () Bool)

(assert (=> d!36999 (= lt!63561 lt!63559)))

(declare-fun lt!63558 () Unit!3835)

(declare-fun e!80726 () Unit!3835)

(assert (=> d!36999 (= lt!63558 e!80726)))

(declare-fun c!22397 () Bool)

(assert (=> d!36999 (= c!22397 lt!63559)))

(assert (=> d!36999 (= lt!63559 (containsKey!168 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!36999 (= (contains!869 lt!63422 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63561)))

(declare-fun b!123502 () Bool)

(declare-fun lt!63560 () Unit!3835)

(assert (=> b!123502 (= e!80726 lt!63560)))

(assert (=> b!123502 (= lt!63560 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123502 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123503 () Bool)

(declare-fun Unit!3842 () Unit!3835)

(assert (=> b!123503 (= e!80726 Unit!3842)))

(declare-fun b!123504 () Bool)

(assert (=> b!123504 (= e!80725 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!36999 c!22397) b!123502))

(assert (= (and d!36999 (not c!22397)) b!123503))

(assert (= (and d!36999 (not res!59973)) b!123504))

(assert (=> d!36999 m!143193))

(declare-fun m!143499 () Bool)

(assert (=> d!36999 m!143499))

(assert (=> b!123502 m!143193))

(declare-fun m!143501 () Bool)

(assert (=> b!123502 m!143501))

(assert (=> b!123502 m!143193))

(assert (=> b!123502 m!143491))

(assert (=> b!123502 m!143491))

(declare-fun m!143503 () Bool)

(assert (=> b!123502 m!143503))

(assert (=> b!123504 m!143193))

(assert (=> b!123504 m!143491))

(assert (=> b!123504 m!143491))

(assert (=> b!123504 m!143503))

(assert (=> b!123331 d!36999))

(declare-fun d!37001 () Bool)

(assert (=> d!37001 (= (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123322 d!37001))

(declare-fun d!37003 () Bool)

(declare-fun res!59974 () Bool)

(declare-fun e!80727 () Bool)

(assert (=> d!37003 (=> (not res!59974) (not e!80727))))

(assert (=> d!37003 (= res!59974 (simpleValid!84 (v!3092 (underlying!431 thiss!992))))))

(assert (=> d!37003 (= (valid!497 (v!3092 (underlying!431 thiss!992))) e!80727)))

(declare-fun b!123505 () Bool)

(declare-fun res!59975 () Bool)

(assert (=> b!123505 (=> (not res!59975) (not e!80727))))

(assert (=> b!123505 (= res!59975 (= (arrayCountValidKeys!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))) (_size!571 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123506 () Bool)

(declare-fun res!59976 () Bool)

(assert (=> b!123506 (=> (not res!59976) (not e!80727))))

(assert (=> b!123506 (= res!59976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123507 () Bool)

(assert (=> b!123507 (= e!80727 (arrayNoDuplicates!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000 Nil!1689))))

(assert (= (and d!37003 res!59974) b!123505))

(assert (= (and b!123505 res!59975) b!123506))

(assert (= (and b!123506 res!59976) b!123507))

(declare-fun m!143505 () Bool)

(assert (=> d!37003 m!143505))

(declare-fun m!143507 () Bool)

(assert (=> b!123505 m!143507))

(declare-fun m!143509 () Bool)

(assert (=> b!123506 m!143509))

(declare-fun m!143511 () Bool)

(assert (=> b!123507 m!143511))

(assert (=> d!36933 d!37003))

(assert (=> b!123332 d!37001))

(declare-fun b!123509 () Bool)

(declare-fun e!80729 () Bool)

(assert (=> b!123509 (= e!80729 tp_is_empty!2823)))

(declare-fun b!123508 () Bool)

(declare-fun e!80728 () Bool)

(assert (=> b!123508 (= e!80728 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4437 () Bool)

(declare-fun mapRes!4437 () Bool)

(declare-fun tp!10845 () Bool)

(assert (=> mapNonEmpty!4437 (= mapRes!4437 (and tp!10845 e!80728))))

(declare-fun mapValue!4437 () ValueCell!1068)

(declare-fun mapRest!4437 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapKey!4437 () (_ BitVec 32))

(assert (=> mapNonEmpty!4437 (= mapRest!4436 (store mapRest!4437 mapKey!4437 mapValue!4437))))

(declare-fun mapIsEmpty!4437 () Bool)

(assert (=> mapIsEmpty!4437 mapRes!4437))

(declare-fun condMapEmpty!4437 () Bool)

(declare-fun mapDefault!4437 () ValueCell!1068)

(assert (=> mapNonEmpty!4436 (= condMapEmpty!4437 (= mapRest!4436 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4437)))))

(assert (=> mapNonEmpty!4436 (= tp!10844 (and e!80729 mapRes!4437))))

(assert (= (and mapNonEmpty!4436 condMapEmpty!4437) mapIsEmpty!4437))

(assert (= (and mapNonEmpty!4436 (not condMapEmpty!4437)) mapNonEmpty!4437))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1068) mapValue!4437)) b!123508))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1068) mapDefault!4437)) b!123509))

(declare-fun m!143513 () Bool)

(assert (=> mapNonEmpty!4437 m!143513))

(declare-fun b!123511 () Bool)

(declare-fun e!80731 () Bool)

(assert (=> b!123511 (= e!80731 tp_is_empty!2823)))

(declare-fun b!123510 () Bool)

(declare-fun e!80730 () Bool)

(assert (=> b!123510 (= e!80730 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4438 () Bool)

(declare-fun mapRes!4438 () Bool)

(declare-fun tp!10846 () Bool)

(assert (=> mapNonEmpty!4438 (= mapRes!4438 (and tp!10846 e!80730))))

(declare-fun mapValue!4438 () ValueCell!1068)

(declare-fun mapKey!4438 () (_ BitVec 32))

(declare-fun mapRest!4438 () (Array (_ BitVec 32) ValueCell!1068))

(assert (=> mapNonEmpty!4438 (= mapRest!4435 (store mapRest!4438 mapKey!4438 mapValue!4438))))

(declare-fun mapIsEmpty!4438 () Bool)

(assert (=> mapIsEmpty!4438 mapRes!4438))

(declare-fun condMapEmpty!4438 () Bool)

(declare-fun mapDefault!4438 () ValueCell!1068)

(assert (=> mapNonEmpty!4435 (= condMapEmpty!4438 (= mapRest!4435 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4438)))))

(assert (=> mapNonEmpty!4435 (= tp!10843 (and e!80731 mapRes!4438))))

(assert (= (and mapNonEmpty!4435 condMapEmpty!4438) mapIsEmpty!4438))

(assert (= (and mapNonEmpty!4435 (not condMapEmpty!4438)) mapNonEmpty!4438))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1068) mapValue!4438)) b!123510))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1068) mapDefault!4438)) b!123511))

(declare-fun m!143515 () Bool)

(assert (=> mapNonEmpty!4438 m!143515))

(declare-fun b_lambda!5423 () Bool)

(assert (= b_lambda!5421 (or (and b!123206 b_free!2813) (and b!123212 b_free!2815 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))) b_lambda!5423)))

(declare-fun b_lambda!5425 () Bool)

(assert (= b_lambda!5419 (or (and b!123206 b_free!2813) (and b!123212 b_free!2815 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))) b_lambda!5425)))

(declare-fun b_lambda!5427 () Bool)

(assert (= b_lambda!5417 (or (and b!123206 b_free!2813 (= (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) (defaultEntry!2755 newMap!16))) (and b!123212 b_free!2815) b_lambda!5427)))

(check-sat (not b!123444) (not b!123459) (not b!123473) (not b!123425) (not b!123472) (not b!123431) (not d!36947) (not b_lambda!5425) (not b!123364) (not b!123450) (not b!123492) (not d!36991) (not b!123502) (not d!36939) (not d!36959) (not b!123366) (not bm!13101) (not b!123365) (not bm!13107) (not b!123432) (not b!123445) (not b!123362) (not b!123358) (not bm!13104) (not d!36981) (not b!123429) (not d!36965) (not b!123504) (not d!36941) (not d!36989) (not b!123359) (not d!36969) (not bm!13119) (not d!36983) (not b_next!2815) (not bm!13113) (not mapNonEmpty!4437) (not b!123430) (not d!36971) (not d!36963) tp_is_empty!2823 (not b!123397) (not b!123491) (not d!36995) (not bm!13110) (not b!123396) (not b!123389) (not b!123494) (not b!123505) (not d!36993) (not b!123391) (not b!123428) (not b!123501) (not b!123478) (not d!36973) (not b!123449) (not d!36987) (not d!36999) (not b!123477) (not b!123448) (not b!123485) (not d!36967) (not b!123487) (not d!36975) (not b!123500) (not b!123506) (not d!36945) (not b!123488) (not b!123433) (not b!123475) (not b_lambda!5415) (not d!37003) b_and!7589 (not d!36961) (not b!123355) (not b!123486) (not b_lambda!5423) (not b!123507) (not b!123479) (not b!123426) (not b!123379) (not d!36953) (not bm!13105) (not b_next!2813) (not b!123356) (not d!36957) (not b_lambda!5427) (not d!36977) b_and!7587 (not bm!13116) (not mapNonEmpty!4438) (not b!123377) (not b!123490) (not d!36985) (not d!36979))
(check-sat b_and!7587 b_and!7589 (not b_next!2813) (not b_next!2815))
(get-model)

(declare-fun c!22402 () Bool)

(declare-fun d!37005 () Bool)

(assert (=> d!37005 (= c!22402 (and ((_ is Cons!1687) (toList!852 lt!63540)) (= (_1!1292 (h!2288 (toList!852 lt!63540))) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80736 () Option!170)

(assert (=> d!37005 (= (getValueByKey!164 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80736)))

(declare-fun b!123521 () Bool)

(declare-fun e!80737 () Option!170)

(assert (=> b!123521 (= e!80736 e!80737)))

(declare-fun c!22403 () Bool)

(assert (=> b!123521 (= c!22403 (and ((_ is Cons!1687) (toList!852 lt!63540)) (not (= (_1!1292 (h!2288 (toList!852 lt!63540))) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123522 () Bool)

(assert (=> b!123522 (= e!80737 (getValueByKey!164 (t!5990 (toList!852 lt!63540)) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123523 () Bool)

(assert (=> b!123523 (= e!80737 None!168)))

(declare-fun b!123520 () Bool)

(assert (=> b!123520 (= e!80736 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63540)))))))

(assert (= (and d!37005 c!22402) b!123520))

(assert (= (and d!37005 (not c!22402)) b!123521))

(assert (= (and b!123521 c!22403) b!123522))

(assert (= (and b!123521 (not c!22403)) b!123523))

(declare-fun m!143517 () Bool)

(assert (=> b!123522 m!143517))

(assert (=> b!123485 d!37005))

(declare-fun d!37007 () Bool)

(declare-fun e!80738 () Bool)

(assert (=> d!37007 e!80738))

(declare-fun res!59977 () Bool)

(assert (=> d!37007 (=> res!59977 e!80738)))

(declare-fun lt!63565 () Bool)

(assert (=> d!37007 (= res!59977 (not lt!63565))))

(declare-fun lt!63563 () Bool)

(assert (=> d!37007 (= lt!63565 lt!63563)))

(declare-fun lt!63562 () Unit!3835)

(declare-fun e!80739 () Unit!3835)

(assert (=> d!37007 (= lt!63562 e!80739)))

(declare-fun c!22404 () Bool)

(assert (=> d!37007 (= c!22404 lt!63563)))

(assert (=> d!37007 (= lt!63563 (containsKey!168 (toList!852 lt!63444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37007 (= (contains!869 lt!63444 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63565)))

(declare-fun b!123524 () Bool)

(declare-fun lt!63564 () Unit!3835)

(assert (=> b!123524 (= e!80739 lt!63564)))

(assert (=> b!123524 (= lt!63564 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123524 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123525 () Bool)

(declare-fun Unit!3843 () Unit!3835)

(assert (=> b!123525 (= e!80739 Unit!3843)))

(declare-fun b!123526 () Bool)

(assert (=> b!123526 (= e!80738 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37007 c!22404) b!123524))

(assert (= (and d!37007 (not c!22404)) b!123525))

(assert (= (and d!37007 (not res!59977)) b!123526))

(declare-fun m!143519 () Bool)

(assert (=> d!37007 m!143519))

(declare-fun m!143521 () Bool)

(assert (=> b!123524 m!143521))

(declare-fun m!143523 () Bool)

(assert (=> b!123524 m!143523))

(assert (=> b!123524 m!143523))

(declare-fun m!143525 () Bool)

(assert (=> b!123524 m!143525))

(assert (=> b!123526 m!143523))

(assert (=> b!123526 m!143523))

(assert (=> b!123526 m!143525))

(assert (=> bm!13107 d!37007))

(declare-fun d!37009 () Bool)

(assert (=> d!37009 (= (get!1426 (getValueByKey!164 (toList!852 lt!63439) lt!63426)) (v!3094 (getValueByKey!164 (toList!852 lt!63439) lt!63426)))))

(assert (=> d!36963 d!37009))

(declare-fun d!37011 () Bool)

(declare-fun c!22405 () Bool)

(assert (=> d!37011 (= c!22405 (and ((_ is Cons!1687) (toList!852 lt!63439)) (= (_1!1292 (h!2288 (toList!852 lt!63439))) lt!63426)))))

(declare-fun e!80740 () Option!170)

(assert (=> d!37011 (= (getValueByKey!164 (toList!852 lt!63439) lt!63426) e!80740)))

(declare-fun b!123528 () Bool)

(declare-fun e!80741 () Option!170)

(assert (=> b!123528 (= e!80740 e!80741)))

(declare-fun c!22406 () Bool)

(assert (=> b!123528 (= c!22406 (and ((_ is Cons!1687) (toList!852 lt!63439)) (not (= (_1!1292 (h!2288 (toList!852 lt!63439))) lt!63426))))))

(declare-fun b!123529 () Bool)

(assert (=> b!123529 (= e!80741 (getValueByKey!164 (t!5990 (toList!852 lt!63439)) lt!63426))))

(declare-fun b!123530 () Bool)

(assert (=> b!123530 (= e!80741 None!168)))

(declare-fun b!123527 () Bool)

(assert (=> b!123527 (= e!80740 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63439)))))))

(assert (= (and d!37011 c!22405) b!123527))

(assert (= (and d!37011 (not c!22405)) b!123528))

(assert (= (and b!123528 c!22406) b!123529))

(assert (= (and b!123528 (not c!22406)) b!123530))

(declare-fun m!143527 () Bool)

(assert (=> b!123529 m!143527))

(assert (=> d!36963 d!37011))

(declare-fun d!37013 () Bool)

(assert (=> d!37013 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63568 () Unit!3835)

(declare-fun choose!744 (List!1691 (_ BitVec 64)) Unit!3835)

(assert (=> d!37013 (= lt!63568 (choose!744 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80744 () Bool)

(assert (=> d!37013 e!80744))

(declare-fun res!59980 () Bool)

(assert (=> d!37013 (=> (not res!59980) (not e!80744))))

(declare-fun isStrictlySorted!315 (List!1691) Bool)

(assert (=> d!37013 (= res!59980 (isStrictlySorted!315 (toList!852 lt!63422)))))

(assert (=> d!37013 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000) lt!63568)))

(declare-fun b!123533 () Bool)

(assert (=> b!123533 (= e!80744 (containsKey!168 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37013 res!59980) b!123533))

(assert (=> d!37013 m!143387))

(assert (=> d!37013 m!143387))

(assert (=> d!37013 m!143389))

(declare-fun m!143529 () Bool)

(assert (=> d!37013 m!143529))

(declare-fun m!143531 () Bool)

(assert (=> d!37013 m!143531))

(assert (=> b!123533 m!143383))

(assert (=> b!123475 d!37013))

(declare-fun d!37015 () Bool)

(declare-fun isEmpty!391 (Option!170) Bool)

(assert (=> d!37015 (= (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!391 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5118 () Bool)

(assert (= bs!5118 d!37015))

(assert (=> bs!5118 m!143387))

(declare-fun m!143533 () Bool)

(assert (=> bs!5118 m!143533))

(assert (=> b!123475 d!37015))

(declare-fun d!37017 () Bool)

(declare-fun c!22407 () Bool)

(assert (=> d!37017 (= c!22407 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80745 () Option!170)

(assert (=> d!37017 (= (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000) e!80745)))

(declare-fun b!123535 () Bool)

(declare-fun e!80746 () Option!170)

(assert (=> b!123535 (= e!80745 e!80746)))

(declare-fun c!22408 () Bool)

(assert (=> b!123535 (= c!22408 (and ((_ is Cons!1687) (toList!852 lt!63422)) (not (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123536 () Bool)

(assert (=> b!123536 (= e!80746 (getValueByKey!164 (t!5990 (toList!852 lt!63422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123537 () Bool)

(assert (=> b!123537 (= e!80746 None!168)))

(declare-fun b!123534 () Bool)

(assert (=> b!123534 (= e!80745 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63422)))))))

(assert (= (and d!37017 c!22407) b!123534))

(assert (= (and d!37017 (not c!22407)) b!123535))

(assert (= (and b!123535 c!22408) b!123536))

(assert (= (and b!123535 (not c!22408)) b!123537))

(declare-fun m!143535 () Bool)

(assert (=> b!123536 m!143535))

(assert (=> b!123475 d!37017))

(declare-fun d!37019 () Bool)

(assert (=> d!37019 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!63569 () Unit!3835)

(assert (=> d!37019 (= lt!63569 (choose!744 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80747 () Bool)

(assert (=> d!37019 e!80747))

(declare-fun res!59981 () Bool)

(assert (=> d!37019 (=> (not res!59981) (not e!80747))))

(assert (=> d!37019 (= res!59981 (isStrictlySorted!315 (toList!852 lt!63422)))))

(assert (=> d!37019 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63569)))

(declare-fun b!123538 () Bool)

(assert (=> b!123538 (= e!80747 (containsKey!168 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37019 res!59981) b!123538))

(assert (=> d!37019 m!143193))

(assert (=> d!37019 m!143491))

(assert (=> d!37019 m!143491))

(assert (=> d!37019 m!143503))

(assert (=> d!37019 m!143193))

(declare-fun m!143537 () Bool)

(assert (=> d!37019 m!143537))

(assert (=> d!37019 m!143531))

(assert (=> b!123538 m!143193))

(assert (=> b!123538 m!143499))

(assert (=> b!123502 d!37019))

(declare-fun d!37021 () Bool)

(assert (=> d!37021 (= (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!391 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5119 () Bool)

(assert (= bs!5119 d!37021))

(assert (=> bs!5119 m!143491))

(declare-fun m!143539 () Bool)

(assert (=> bs!5119 m!143539))

(assert (=> b!123502 d!37021))

(declare-fun c!22409 () Bool)

(declare-fun d!37023 () Bool)

(assert (=> d!37023 (= c!22409 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!80748 () Option!170)

(assert (=> d!37023 (= (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!80748)))

(declare-fun b!123540 () Bool)

(declare-fun e!80749 () Option!170)

(assert (=> b!123540 (= e!80748 e!80749)))

(declare-fun c!22410 () Bool)

(assert (=> b!123540 (= c!22410 (and ((_ is Cons!1687) (toList!852 lt!63422)) (not (= (_1!1292 (h!2288 (toList!852 lt!63422))) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!123541 () Bool)

(assert (=> b!123541 (= e!80749 (getValueByKey!164 (t!5990 (toList!852 lt!63422)) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123542 () Bool)

(assert (=> b!123542 (= e!80749 None!168)))

(declare-fun b!123539 () Bool)

(assert (=> b!123539 (= e!80748 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63422)))))))

(assert (= (and d!37023 c!22409) b!123539))

(assert (= (and d!37023 (not c!22409)) b!123540))

(assert (= (and b!123540 c!22410) b!123541))

(assert (= (and b!123540 (not c!22410)) b!123542))

(assert (=> b!123541 m!143193))

(declare-fun m!143541 () Bool)

(assert (=> b!123541 m!143541))

(assert (=> b!123502 d!37023))

(declare-fun c!22411 () Bool)

(declare-fun d!37025 () Bool)

(assert (=> d!37025 (= c!22411 (and ((_ is Cons!1687) (toList!852 lt!63544)) (= (_1!1292 (h!2288 (toList!852 lt!63544))) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80750 () Option!170)

(assert (=> d!37025 (= (getValueByKey!164 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80750)))

(declare-fun b!123544 () Bool)

(declare-fun e!80751 () Option!170)

(assert (=> b!123544 (= e!80750 e!80751)))

(declare-fun c!22412 () Bool)

(assert (=> b!123544 (= c!22412 (and ((_ is Cons!1687) (toList!852 lt!63544)) (not (= (_1!1292 (h!2288 (toList!852 lt!63544))) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123545 () Bool)

(assert (=> b!123545 (= e!80751 (getValueByKey!164 (t!5990 (toList!852 lt!63544)) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123546 () Bool)

(assert (=> b!123546 (= e!80751 None!168)))

(declare-fun b!123543 () Bool)

(assert (=> b!123543 (= e!80750 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63544)))))))

(assert (= (and d!37025 c!22411) b!123543))

(assert (= (and d!37025 (not c!22411)) b!123544))

(assert (= (and b!123544 c!22412) b!123545))

(assert (= (and b!123544 (not c!22412)) b!123546))

(declare-fun m!143543 () Bool)

(assert (=> b!123545 m!143543))

(assert (=> b!123487 d!37025))

(assert (=> b!123477 d!37015))

(assert (=> b!123477 d!37017))

(declare-fun b!123547 () Bool)

(declare-fun e!80754 () Bool)

(declare-fun call!13123 () Bool)

(assert (=> b!123547 (= e!80754 call!13123)))

(declare-fun b!123548 () Bool)

(declare-fun e!80752 () Bool)

(assert (=> b!123548 (= e!80754 e!80752)))

(declare-fun lt!63572 () (_ BitVec 64))

(assert (=> b!123548 (= lt!63572 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!63570 () Unit!3835)

(assert (=> b!123548 (= lt!63570 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) lt!63572 #b00000000000000000000000000000000))))

(assert (=> b!123548 (arrayContainsKey!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) lt!63572 #b00000000000000000000000000000000)))

(declare-fun lt!63571 () Unit!3835)

(assert (=> b!123548 (= lt!63571 lt!63570)))

(declare-fun res!59982 () Bool)

(assert (=> b!123548 (= res!59982 (= (seekEntryOrOpen!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000) (_keys!4482 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992)))) (Found!267 #b00000000000000000000000000000000)))))

(assert (=> b!123548 (=> (not res!59982) (not e!80752))))

(declare-fun b!123549 () Bool)

(assert (=> b!123549 (= e!80752 call!13123)))

(declare-fun b!123550 () Bool)

(declare-fun e!80753 () Bool)

(assert (=> b!123550 (= e!80753 e!80754)))

(declare-fun c!22413 () Bool)

(assert (=> b!123550 (= c!22413 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13120 () Bool)

(assert (=> bm!13120 (= call!13123 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4482 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun d!37027 () Bool)

(declare-fun res!59983 () Bool)

(assert (=> d!37027 (=> res!59983 e!80753)))

(assert (=> d!37027 (= res!59983 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!37027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992)))) e!80753)))

(assert (= (and d!37027 (not res!59983)) b!123550))

(assert (= (and b!123550 c!22413) b!123548))

(assert (= (and b!123550 (not c!22413)) b!123547))

(assert (= (and b!123548 res!59982) b!123549))

(assert (= (or b!123549 b!123547) bm!13120))

(declare-fun m!143545 () Bool)

(assert (=> b!123548 m!143545))

(declare-fun m!143547 () Bool)

(assert (=> b!123548 m!143547))

(declare-fun m!143549 () Bool)

(assert (=> b!123548 m!143549))

(assert (=> b!123548 m!143545))

(declare-fun m!143551 () Bool)

(assert (=> b!123548 m!143551))

(assert (=> b!123550 m!143545))

(assert (=> b!123550 m!143545))

(declare-fun m!143553 () Bool)

(assert (=> b!123550 m!143553))

(declare-fun m!143555 () Bool)

(assert (=> bm!13120 m!143555))

(assert (=> b!123506 d!37027))

(declare-fun lt!63575 () Bool)

(declare-fun d!37029 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!121 (List!1691) (InoxSet tuple2!2562))

(assert (=> d!37029 (= lt!63575 (select (content!121 (toList!852 lt!63532)) (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80760 () Bool)

(assert (=> d!37029 (= lt!63575 e!80760)))

(declare-fun res!59989 () Bool)

(assert (=> d!37029 (=> (not res!59989) (not e!80760))))

(assert (=> d!37029 (= res!59989 ((_ is Cons!1687) (toList!852 lt!63532)))))

(assert (=> d!37029 (= (contains!870 (toList!852 lt!63532) (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63575)))

(declare-fun b!123555 () Bool)

(declare-fun e!80759 () Bool)

(assert (=> b!123555 (= e!80760 e!80759)))

(declare-fun res!59988 () Bool)

(assert (=> b!123555 (=> res!59988 e!80759)))

(assert (=> b!123555 (= res!59988 (= (h!2288 (toList!852 lt!63532)) (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123556 () Bool)

(assert (=> b!123556 (= e!80759 (contains!870 (t!5990 (toList!852 lt!63532)) (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!37029 res!59989) b!123555))

(assert (= (and b!123555 (not res!59988)) b!123556))

(declare-fun m!143557 () Bool)

(assert (=> d!37029 m!143557))

(declare-fun m!143559 () Bool)

(assert (=> d!37029 m!143559))

(declare-fun m!143561 () Bool)

(assert (=> b!123556 m!143561))

(assert (=> b!123479 d!37029))

(declare-fun d!37031 () Bool)

(declare-fun isEmpty!392 (List!1691) Bool)

(assert (=> d!37031 (= (isEmpty!390 lt!63516) (isEmpty!392 (toList!852 lt!63516)))))

(declare-fun bs!5120 () Bool)

(assert (= bs!5120 d!37031))

(declare-fun m!143563 () Bool)

(assert (=> bs!5120 m!143563))

(assert (=> b!123425 d!37031))

(declare-fun d!37033 () Bool)

(assert (=> d!37033 (= (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440)) (not (isEmpty!391 (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))))

(declare-fun bs!5121 () Bool)

(assert (= bs!5121 d!37033))

(assert (=> bs!5121 m!143469))

(declare-fun m!143565 () Bool)

(assert (=> bs!5121 m!143565))

(assert (=> b!123494 d!37033))

(declare-fun c!22414 () Bool)

(declare-fun d!37035 () Bool)

(assert (=> d!37035 (= c!22414 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63440)))))

(declare-fun e!80761 () Option!170)

(assert (=> d!37035 (= (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440) e!80761)))

(declare-fun b!123558 () Bool)

(declare-fun e!80762 () Option!170)

(assert (=> b!123558 (= e!80761 e!80762)))

(declare-fun c!22415 () Bool)

(assert (=> b!123558 (= c!22415 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (not (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63440))))))

(declare-fun b!123559 () Bool)

(assert (=> b!123559 (= e!80762 (getValueByKey!164 (t!5990 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63440))))

(declare-fun b!123560 () Bool)

(assert (=> b!123560 (= e!80762 None!168)))

(declare-fun b!123557 () Bool)

(assert (=> b!123557 (= e!80761 (Some!169 (_2!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(assert (= (and d!37035 c!22414) b!123557))

(assert (= (and d!37035 (not c!22414)) b!123558))

(assert (= (and b!123558 c!22415) b!123559))

(assert (= (and b!123558 (not c!22415)) b!123560))

(declare-fun m!143567 () Bool)

(assert (=> b!123559 m!143567))

(assert (=> b!123494 d!37035))

(declare-fun d!37037 () Bool)

(declare-fun e!80763 () Bool)

(assert (=> d!37037 e!80763))

(declare-fun res!59990 () Bool)

(assert (=> d!37037 (=> res!59990 e!80763)))

(declare-fun lt!63579 () Bool)

(assert (=> d!37037 (= res!59990 (not lt!63579))))

(declare-fun lt!63577 () Bool)

(assert (=> d!37037 (= lt!63579 lt!63577)))

(declare-fun lt!63576 () Unit!3835)

(declare-fun e!80764 () Unit!3835)

(assert (=> d!37037 (= lt!63576 e!80764)))

(declare-fun c!22416 () Bool)

(assert (=> d!37037 (= c!22416 lt!63577)))

(assert (=> d!37037 (= lt!63577 (containsKey!168 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!37037 (= (contains!869 lt!63549 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63579)))

(declare-fun b!123561 () Bool)

(declare-fun lt!63578 () Unit!3835)

(assert (=> b!123561 (= e!80764 lt!63578)))

(assert (=> b!123561 (= lt!63578 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> b!123561 (isDefined!117 (getValueByKey!164 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123562 () Bool)

(declare-fun Unit!3844 () Unit!3835)

(assert (=> b!123562 (= e!80764 Unit!3844)))

(declare-fun b!123563 () Bool)

(assert (=> b!123563 (= e!80763 (isDefined!117 (getValueByKey!164 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37037 c!22416) b!123561))

(assert (= (and d!37037 (not c!22416)) b!123562))

(assert (= (and d!37037 (not res!59990)) b!123563))

(declare-fun m!143569 () Bool)

(assert (=> d!37037 m!143569))

(declare-fun m!143571 () Bool)

(assert (=> b!123561 m!143571))

(assert (=> b!123561 m!143461))

(assert (=> b!123561 m!143461))

(declare-fun m!143573 () Bool)

(assert (=> b!123561 m!143573))

(assert (=> b!123563 m!143461))

(assert (=> b!123563 m!143461))

(assert (=> b!123563 m!143573))

(assert (=> d!36981 d!37037))

(declare-fun c!22417 () Bool)

(declare-fun d!37039 () Bool)

(assert (=> d!37039 (= c!22417 (and ((_ is Cons!1687) lt!63548) (= (_1!1292 (h!2288 lt!63548)) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80765 () Option!170)

(assert (=> d!37039 (= (getValueByKey!164 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80765)))

(declare-fun b!123565 () Bool)

(declare-fun e!80766 () Option!170)

(assert (=> b!123565 (= e!80765 e!80766)))

(declare-fun c!22418 () Bool)

(assert (=> b!123565 (= c!22418 (and ((_ is Cons!1687) lt!63548) (not (= (_1!1292 (h!2288 lt!63548)) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123566 () Bool)

(assert (=> b!123566 (= e!80766 (getValueByKey!164 (t!5990 lt!63548) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123567 () Bool)

(assert (=> b!123567 (= e!80766 None!168)))

(declare-fun b!123564 () Bool)

(assert (=> b!123564 (= e!80765 (Some!169 (_2!1292 (h!2288 lt!63548))))))

(assert (= (and d!37039 c!22417) b!123564))

(assert (= (and d!37039 (not c!22417)) b!123565))

(assert (= (and b!123565 c!22418) b!123566))

(assert (= (and b!123565 (not c!22418)) b!123567))

(declare-fun m!143575 () Bool)

(assert (=> b!123566 m!143575))

(assert (=> d!36981 d!37039))

(declare-fun d!37041 () Bool)

(assert (=> d!37041 (= (getValueByKey!164 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63582 () Unit!3835)

(declare-fun choose!745 (List!1691 (_ BitVec 64) V!3411) Unit!3835)

(assert (=> d!37041 (= lt!63582 (choose!745 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80769 () Bool)

(assert (=> d!37041 e!80769))

(declare-fun res!59995 () Bool)

(assert (=> d!37041 (=> (not res!59995) (not e!80769))))

(assert (=> d!37041 (= res!59995 (isStrictlySorted!315 lt!63548))))

(assert (=> d!37041 (= (lemmaContainsTupThenGetReturnValue!80 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63582)))

(declare-fun b!123572 () Bool)

(declare-fun res!59996 () Bool)

(assert (=> b!123572 (=> (not res!59996) (not e!80769))))

(assert (=> b!123572 (= res!59996 (containsKey!168 lt!63548 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123573 () Bool)

(assert (=> b!123573 (= e!80769 (contains!870 lt!63548 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37041 res!59995) b!123572))

(assert (= (and b!123572 res!59996) b!123573))

(assert (=> d!37041 m!143455))

(declare-fun m!143577 () Bool)

(assert (=> d!37041 m!143577))

(declare-fun m!143579 () Bool)

(assert (=> d!37041 m!143579))

(declare-fun m!143581 () Bool)

(assert (=> b!123572 m!143581))

(declare-fun m!143583 () Bool)

(assert (=> b!123573 m!143583))

(assert (=> d!36981 d!37041))

(declare-fun b!123594 () Bool)

(declare-fun e!80781 () List!1691)

(declare-fun call!13131 () List!1691)

(assert (=> b!123594 (= e!80781 call!13131)))

(declare-fun b!123596 () Bool)

(declare-fun e!80783 () List!1691)

(assert (=> b!123596 (= e!80783 e!80781)))

(declare-fun c!22430 () Bool)

(assert (=> b!123596 (= c!22430 (and ((_ is Cons!1687) (toList!852 lt!63439)) (= (_1!1292 (h!2288 (toList!852 lt!63439))) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun lt!63585 () List!1691)

(declare-fun b!123597 () Bool)

(declare-fun e!80782 () Bool)

(assert (=> b!123597 (= e!80782 (contains!870 lt!63585 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123598 () Bool)

(declare-fun e!80780 () List!1691)

(declare-fun call!13130 () List!1691)

(assert (=> b!123598 (= e!80780 call!13130)))

(declare-fun b!123599 () Bool)

(declare-fun call!13132 () List!1691)

(assert (=> b!123599 (= e!80783 call!13132)))

(declare-fun bm!13127 () Bool)

(assert (=> bm!13127 (= call!13130 call!13131)))

(declare-fun bm!13128 () Bool)

(assert (=> bm!13128 (= call!13131 call!13132)))

(declare-fun b!123600 () Bool)

(declare-fun c!22429 () Bool)

(assert (=> b!123600 (= c!22429 (and ((_ is Cons!1687) (toList!852 lt!63439)) (bvsgt (_1!1292 (h!2288 (toList!852 lt!63439))) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123600 (= e!80781 e!80780)))

(declare-fun b!123601 () Bool)

(declare-fun e!80784 () List!1691)

(assert (=> b!123601 (= e!80784 (ite c!22430 (t!5990 (toList!852 lt!63439)) (ite c!22429 (Cons!1687 (h!2288 (toList!852 lt!63439)) (t!5990 (toList!852 lt!63439))) Nil!1688)))))

(declare-fun b!123602 () Bool)

(assert (=> b!123602 (= e!80780 call!13130)))

(declare-fun c!22428 () Bool)

(declare-fun bm!13129 () Bool)

(declare-fun $colon$colon!87 (List!1691 tuple2!2562) List!1691)

(assert (=> bm!13129 (= call!13132 ($colon$colon!87 e!80784 (ite c!22428 (h!2288 (toList!852 lt!63439)) (tuple2!2563 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun c!22427 () Bool)

(assert (=> bm!13129 (= c!22427 c!22428)))

(declare-fun b!123603 () Bool)

(assert (=> b!123603 (= e!80784 (insertStrictlySorted!83 (t!5990 (toList!852 lt!63439)) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun d!37043 () Bool)

(assert (=> d!37043 e!80782))

(declare-fun res!60001 () Bool)

(assert (=> d!37043 (=> (not res!60001) (not e!80782))))

(assert (=> d!37043 (= res!60001 (isStrictlySorted!315 lt!63585))))

(assert (=> d!37043 (= lt!63585 e!80783)))

(assert (=> d!37043 (= c!22428 (and ((_ is Cons!1687) (toList!852 lt!63439)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63439))) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37043 (isStrictlySorted!315 (toList!852 lt!63439))))

(assert (=> d!37043 (= (insertStrictlySorted!83 (toList!852 lt!63439) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63585)))

(declare-fun b!123595 () Bool)

(declare-fun res!60002 () Bool)

(assert (=> b!123595 (=> (not res!60002) (not e!80782))))

(assert (=> b!123595 (= res!60002 (containsKey!168 lt!63585 (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37043 c!22428) b!123599))

(assert (= (and d!37043 (not c!22428)) b!123596))

(assert (= (and b!123596 c!22430) b!123594))

(assert (= (and b!123596 (not c!22430)) b!123600))

(assert (= (and b!123600 c!22429) b!123598))

(assert (= (and b!123600 (not c!22429)) b!123602))

(assert (= (or b!123598 b!123602) bm!13127))

(assert (= (or b!123594 bm!13127) bm!13128))

(assert (= (or b!123599 bm!13128) bm!13129))

(assert (= (and bm!13129 c!22427) b!123603))

(assert (= (and bm!13129 (not c!22427)) b!123601))

(assert (= (and d!37043 res!60001) b!123595))

(assert (= (and b!123595 res!60002) b!123597))

(declare-fun m!143585 () Bool)

(assert (=> bm!13129 m!143585))

(declare-fun m!143587 () Bool)

(assert (=> b!123597 m!143587))

(declare-fun m!143589 () Bool)

(assert (=> b!123595 m!143589))

(declare-fun m!143591 () Bool)

(assert (=> b!123603 m!143591))

(declare-fun m!143593 () Bool)

(assert (=> d!37043 m!143593))

(declare-fun m!143595 () Bool)

(assert (=> d!37043 m!143595))

(assert (=> d!36981 d!37043))

(declare-fun d!37045 () Bool)

(declare-fun lt!63586 () Bool)

(assert (=> d!37045 (= lt!63586 (select (content!121 (toList!852 lt!63496)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80786 () Bool)

(assert (=> d!37045 (= lt!63586 e!80786)))

(declare-fun res!60004 () Bool)

(assert (=> d!37045 (=> (not res!60004) (not e!80786))))

(assert (=> d!37045 (= res!60004 ((_ is Cons!1687) (toList!852 lt!63496)))))

(assert (=> d!37045 (= (contains!870 (toList!852 lt!63496) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63586)))

(declare-fun b!123604 () Bool)

(declare-fun e!80785 () Bool)

(assert (=> b!123604 (= e!80786 e!80785)))

(declare-fun res!60003 () Bool)

(assert (=> b!123604 (=> res!60003 e!80785)))

(assert (=> b!123604 (= res!60003 (= (h!2288 (toList!852 lt!63496)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123605 () Bool)

(assert (=> b!123605 (= e!80785 (contains!870 (t!5990 (toList!852 lt!63496)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!37045 res!60004) b!123604))

(assert (= (and b!123604 (not res!60003)) b!123605))

(declare-fun m!143597 () Bool)

(assert (=> d!37045 m!143597))

(declare-fun m!143599 () Bool)

(assert (=> d!37045 m!143599))

(declare-fun m!143601 () Bool)

(assert (=> b!123605 m!143601))

(assert (=> b!123397 d!37045))

(declare-fun d!37047 () Bool)

(assert (=> d!37047 (= (apply!108 lt!63516 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1426 (getValueByKey!164 (toList!852 lt!63516) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5122 () Bool)

(assert (= bs!5122 d!37047))

(assert (=> bs!5122 m!143193))

(declare-fun m!143603 () Bool)

(assert (=> bs!5122 m!143603))

(assert (=> bs!5122 m!143603))

(declare-fun m!143605 () Bool)

(assert (=> bs!5122 m!143605))

(assert (=> b!123429 d!37047))

(assert (=> b!123429 d!36997))

(declare-fun d!37049 () Bool)

(assert (=> d!37049 (= (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63433)) (v!3094 (getValueByKey!164 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63433)))))

(assert (=> d!36985 d!37049))

(declare-fun c!22431 () Bool)

(declare-fun d!37051 () Bool)

(assert (=> d!37051 (= c!22431 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63433)))))

(declare-fun e!80787 () Option!170)

(assert (=> d!37051 (= (getValueByKey!164 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63433) e!80787)))

(declare-fun b!123607 () Bool)

(declare-fun e!80788 () Option!170)

(assert (=> b!123607 (= e!80787 e!80788)))

(declare-fun c!22432 () Bool)

(assert (=> b!123607 (= c!22432 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (not (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63433))))))

(declare-fun b!123608 () Bool)

(assert (=> b!123608 (= e!80788 (getValueByKey!164 (t!5990 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63433))))

(declare-fun b!123609 () Bool)

(assert (=> b!123609 (= e!80788 None!168)))

(declare-fun b!123606 () Bool)

(assert (=> b!123606 (= e!80787 (Some!169 (_2!1292 (h!2288 (toList!852 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(assert (= (and d!37051 c!22431) b!123606))

(assert (= (and d!37051 (not c!22431)) b!123607))

(assert (= (and b!123607 c!22432) b!123608))

(assert (= (and b!123607 (not c!22432)) b!123609))

(declare-fun m!143607 () Bool)

(assert (=> b!123608 m!143607))

(assert (=> d!36985 d!37051))

(declare-fun d!37053 () Bool)

(assert (=> d!37053 (= (apply!108 lt!63444 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1426 (getValueByKey!164 (toList!852 lt!63444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5123 () Bool)

(assert (= bs!5123 d!37053))

(declare-fun m!143609 () Bool)

(assert (=> bs!5123 m!143609))

(assert (=> bs!5123 m!143609))

(declare-fun m!143611 () Bool)

(assert (=> bs!5123 m!143611))

(assert (=> b!123359 d!37053))

(declare-fun d!37055 () Bool)

(declare-fun res!60009 () Bool)

(declare-fun e!80793 () Bool)

(assert (=> d!37055 (=> res!60009 e!80793)))

(assert (=> d!37055 (= res!60009 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63440)))))

(assert (=> d!37055 (= (containsKey!168 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440) e!80793)))

(declare-fun b!123614 () Bool)

(declare-fun e!80794 () Bool)

(assert (=> b!123614 (= e!80793 e!80794)))

(declare-fun res!60010 () Bool)

(assert (=> b!123614 (=> (not res!60010) (not e!80794))))

(assert (=> b!123614 (= res!60010 (and (or (not ((_ is Cons!1687) (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) (bvsle (_1!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63440)) ((_ is Cons!1687) (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) (bvslt (_1!1292 (h!2288 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63440)))))

(declare-fun b!123615 () Bool)

(assert (=> b!123615 (= e!80794 (containsKey!168 (t!5990 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63440))))

(assert (= (and d!37055 (not res!60009)) b!123614))

(assert (= (and b!123614 res!60010) b!123615))

(declare-fun m!143613 () Bool)

(assert (=> b!123615 m!143613))

(assert (=> d!36983 d!37055))

(declare-fun d!37057 () Bool)

(declare-fun e!80797 () Bool)

(assert (=> d!37057 e!80797))

(declare-fun res!60011 () Bool)

(assert (=> d!37057 (=> (not res!60011) (not e!80797))))

(declare-fun lt!63591 () ListLongMap!1673)

(assert (=> d!37057 (= res!60011 (not (contains!869 lt!63591 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80795 () ListLongMap!1673)

(assert (=> d!37057 (= lt!63591 e!80795)))

(declare-fun c!22433 () Bool)

(assert (=> d!37057 (= c!22433 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!37057 (validMask!0 (mask!6993 (v!3092 (underlying!431 thiss!992))))))

(assert (=> d!37057 (= (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))) lt!63591)))

(declare-fun b!123616 () Bool)

(declare-fun e!80799 () Bool)

(assert (=> b!123616 (= e!80797 e!80799)))

(declare-fun c!22435 () Bool)

(declare-fun e!80798 () Bool)

(assert (=> b!123616 (= c!22435 e!80798)))

(declare-fun res!60013 () Bool)

(assert (=> b!123616 (=> (not res!60013) (not e!80798))))

(assert (=> b!123616 (= res!60013 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123617 () Bool)

(declare-fun e!80800 () ListLongMap!1673)

(declare-fun call!13133 () ListLongMap!1673)

(assert (=> b!123617 (= e!80800 call!13133)))

(declare-fun b!123618 () Bool)

(declare-fun e!80801 () Bool)

(assert (=> b!123618 (= e!80799 e!80801)))

(declare-fun c!22436 () Bool)

(assert (=> b!123618 (= c!22436 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123619 () Bool)

(assert (=> b!123619 (= e!80801 (isEmpty!390 lt!63591))))

(declare-fun b!123620 () Bool)

(declare-fun res!60014 () Bool)

(assert (=> b!123620 (=> (not res!60014) (not e!80797))))

(assert (=> b!123620 (= res!60014 (not (contains!869 lt!63591 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123621 () Bool)

(assert (=> b!123621 (= e!80795 (ListLongMap!1674 Nil!1688))))

(declare-fun b!123622 () Bool)

(assert (=> b!123622 (= e!80798 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123622 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!123623 () Bool)

(assert (=> b!123623 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> b!123623 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80796 () Bool)

(assert (=> b!123623 (= e!80796 (= (apply!108 lt!63591 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123624 () Bool)

(assert (=> b!123624 (= e!80795 e!80800)))

(declare-fun c!22434 () Bool)

(assert (=> b!123624 (= c!22434 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!123625 () Bool)

(assert (=> b!123625 (= e!80801 (= lt!63591 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123626 () Bool)

(declare-fun lt!63590 () Unit!3835)

(declare-fun lt!63587 () Unit!3835)

(assert (=> b!123626 (= lt!63590 lt!63587)))

(declare-fun lt!63588 () (_ BitVec 64))

(declare-fun lt!63589 () ListLongMap!1673)

(declare-fun lt!63592 () (_ BitVec 64))

(declare-fun lt!63593 () V!3411)

(assert (=> b!123626 (not (contains!869 (+!167 lt!63589 (tuple2!2563 lt!63592 lt!63593)) lt!63588))))

(assert (=> b!123626 (= lt!63587 (addStillNotContains!54 lt!63589 lt!63592 lt!63593 lt!63588))))

(assert (=> b!123626 (= lt!63588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123626 (= lt!63593 (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123626 (= lt!63592 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!123626 (= lt!63589 call!13133)))

(assert (=> b!123626 (= e!80800 (+!167 call!13133 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!13130 () Bool)

(assert (=> bm!13130 (= call!13133 (getCurrentListMapNoExtraKeys!133 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (_values!2738 (v!3092 (underlying!431 thiss!992))) (mask!6993 (v!3092 (underlying!431 thiss!992))) (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) (minValue!2620 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun b!123627 () Bool)

(assert (=> b!123627 (= e!80799 e!80796)))

(assert (=> b!123627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun res!60012 () Bool)

(assert (=> b!123627 (= res!60012 (contains!869 lt!63591 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123627 (=> (not res!60012) (not e!80796))))

(assert (= (and d!37057 c!22433) b!123621))

(assert (= (and d!37057 (not c!22433)) b!123624))

(assert (= (and b!123624 c!22434) b!123626))

(assert (= (and b!123624 (not c!22434)) b!123617))

(assert (= (or b!123626 b!123617) bm!13130))

(assert (= (and d!37057 res!60011) b!123620))

(assert (= (and b!123620 res!60014) b!123616))

(assert (= (and b!123616 res!60013) b!123622))

(assert (= (and b!123616 c!22435) b!123627))

(assert (= (and b!123616 (not c!22435)) b!123618))

(assert (= (and b!123627 res!60012) b!123623))

(assert (= (and b!123618 c!22436) b!123625))

(assert (= (and b!123618 (not c!22436)) b!123619))

(declare-fun b_lambda!5429 () Bool)

(assert (=> (not b_lambda!5429) (not b!123623)))

(assert (=> b!123623 t!5992))

(declare-fun b_and!7591 () Bool)

(assert (= b_and!7587 (and (=> t!5992 result!3767) b_and!7591)))

(assert (=> b!123623 t!5994))

(declare-fun b_and!7593 () Bool)

(assert (= b_and!7589 (and (=> t!5994 result!3771) b_and!7593)))

(declare-fun b_lambda!5431 () Bool)

(assert (=> (not b_lambda!5431) (not b!123626)))

(assert (=> b!123626 t!5992))

(declare-fun b_and!7595 () Bool)

(assert (= b_and!7591 (and (=> t!5992 result!3767) b_and!7595)))

(assert (=> b!123626 t!5994))

(declare-fun b_and!7597 () Bool)

(assert (= b_and!7593 (and (=> t!5994 result!3771) b_and!7597)))

(declare-fun m!143615 () Bool)

(assert (=> b!123623 m!143615))

(assert (=> b!123623 m!143615))

(assert (=> b!123623 m!143209))

(declare-fun m!143617 () Bool)

(assert (=> b!123623 m!143617))

(declare-fun m!143619 () Bool)

(assert (=> b!123623 m!143619))

(declare-fun m!143621 () Bool)

(assert (=> b!123623 m!143621))

(assert (=> b!123623 m!143619))

(assert (=> b!123623 m!143209))

(assert (=> b!123622 m!143619))

(assert (=> b!123622 m!143619))

(declare-fun m!143623 () Bool)

(assert (=> b!123622 m!143623))

(declare-fun m!143625 () Bool)

(assert (=> bm!13130 m!143625))

(assert (=> b!123625 m!143625))

(assert (=> b!123624 m!143619))

(assert (=> b!123624 m!143619))

(assert (=> b!123624 m!143623))

(declare-fun m!143627 () Bool)

(assert (=> b!123626 m!143627))

(assert (=> b!123626 m!143615))

(assert (=> b!123626 m!143209))

(assert (=> b!123626 m!143617))

(declare-fun m!143629 () Bool)

(assert (=> b!123626 m!143629))

(assert (=> b!123626 m!143619))

(declare-fun m!143631 () Bool)

(assert (=> b!123626 m!143631))

(assert (=> b!123626 m!143615))

(assert (=> b!123626 m!143209))

(assert (=> b!123626 m!143631))

(declare-fun m!143633 () Bool)

(assert (=> b!123626 m!143633))

(assert (=> b!123627 m!143619))

(assert (=> b!123627 m!143619))

(declare-fun m!143635 () Bool)

(assert (=> b!123627 m!143635))

(declare-fun m!143637 () Bool)

(assert (=> b!123619 m!143637))

(declare-fun m!143639 () Bool)

(assert (=> d!37057 m!143639))

(assert (=> d!37057 m!143247))

(declare-fun m!143641 () Bool)

(assert (=> b!123620 m!143641))

(assert (=> b!123431 d!37057))

(declare-fun d!37059 () Bool)

(assert (=> d!37059 (= (get!1426 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3094 (getValueByKey!164 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!36995 d!37059))

(assert (=> d!36995 d!37023))

(declare-fun d!37061 () Bool)

(assert (=> d!37061 (= (size!2473 newMap!16) (bvadd (_size!571 newMap!16) (bvsdiv (bvadd (extraKeys!2540 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!123472 d!37061))

(assert (=> d!36991 d!36983))

(assert (=> d!36991 d!36977))

(declare-fun d!37063 () Bool)

(assert (=> d!37063 (contains!869 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63440)))

(assert (=> d!37063 true))

(declare-fun _$35!365 () Unit!3835)

(assert (=> d!37063 (= (choose!743 lt!63428 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63440) _$35!365)))

(declare-fun bs!5124 () Bool)

(assert (= bs!5124 d!37063))

(assert (=> bs!5124 m!143239))

(assert (=> bs!5124 m!143239))

(assert (=> bs!5124 m!143241))

(assert (=> d!36991 d!37063))

(declare-fun d!37065 () Bool)

(declare-fun e!80802 () Bool)

(assert (=> d!37065 e!80802))

(declare-fun res!60015 () Bool)

(assert (=> d!37065 (=> res!60015 e!80802)))

(declare-fun lt!63597 () Bool)

(assert (=> d!37065 (= res!60015 (not lt!63597))))

(declare-fun lt!63595 () Bool)

(assert (=> d!37065 (= lt!63597 lt!63595)))

(declare-fun lt!63594 () Unit!3835)

(declare-fun e!80803 () Unit!3835)

(assert (=> d!37065 (= lt!63594 e!80803)))

(declare-fun c!22437 () Bool)

(assert (=> d!37065 (= c!22437 lt!63595)))

(assert (=> d!37065 (= lt!63595 (containsKey!168 (toList!852 lt!63428) lt!63440))))

(assert (=> d!37065 (= (contains!869 lt!63428 lt!63440) lt!63597)))

(declare-fun b!123629 () Bool)

(declare-fun lt!63596 () Unit!3835)

(assert (=> b!123629 (= e!80803 lt!63596)))

(assert (=> b!123629 (= lt!63596 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63428) lt!63440))))

(assert (=> b!123629 (isDefined!117 (getValueByKey!164 (toList!852 lt!63428) lt!63440))))

(declare-fun b!123630 () Bool)

(declare-fun Unit!3845 () Unit!3835)

(assert (=> b!123630 (= e!80803 Unit!3845)))

(declare-fun b!123631 () Bool)

(assert (=> b!123631 (= e!80802 (isDefined!117 (getValueByKey!164 (toList!852 lt!63428) lt!63440)))))

(assert (= (and d!37065 c!22437) b!123629))

(assert (= (and d!37065 (not c!22437)) b!123630))

(assert (= (and d!37065 (not res!60015)) b!123631))

(declare-fun m!143643 () Bool)

(assert (=> d!37065 m!143643))

(declare-fun m!143645 () Bool)

(assert (=> b!123629 m!143645))

(declare-fun m!143647 () Bool)

(assert (=> b!123629 m!143647))

(assert (=> b!123629 m!143647))

(declare-fun m!143649 () Bool)

(assert (=> b!123629 m!143649))

(assert (=> b!123631 m!143647))

(assert (=> b!123631 m!143647))

(assert (=> b!123631 m!143649))

(assert (=> d!36991 d!37065))

(declare-fun d!37067 () Bool)

(assert (=> d!37067 (= (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63426)) (v!3094 (getValueByKey!164 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63426)))))

(assert (=> d!36973 d!37067))

(declare-fun d!37069 () Bool)

(declare-fun c!22438 () Bool)

(assert (=> d!37069 (= c!22438 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63426)))))

(declare-fun e!80804 () Option!170)

(assert (=> d!37069 (= (getValueByKey!164 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63426) e!80804)))

(declare-fun b!123633 () Bool)

(declare-fun e!80805 () Option!170)

(assert (=> b!123633 (= e!80804 e!80805)))

(declare-fun c!22439 () Bool)

(assert (=> b!123633 (= c!22439 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (not (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63426))))))

(declare-fun b!123634 () Bool)

(assert (=> b!123634 (= e!80805 (getValueByKey!164 (t!5990 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63426))))

(declare-fun b!123635 () Bool)

(assert (=> b!123635 (= e!80805 None!168)))

(declare-fun b!123632 () Bool)

(assert (=> b!123632 (= e!80804 (Some!169 (_2!1292 (h!2288 (toList!852 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(assert (= (and d!37069 c!22438) b!123632))

(assert (= (and d!37069 (not c!22438)) b!123633))

(assert (= (and b!123633 c!22439) b!123634))

(assert (= (and b!123633 (not c!22439)) b!123635))

(declare-fun m!143651 () Bool)

(assert (=> b!123634 m!143651))

(assert (=> d!36973 d!37069))

(declare-fun d!37071 () Bool)

(assert (=> d!37071 (= (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123355 d!37071))

(assert (=> b!123504 d!37021))

(assert (=> b!123504 d!37023))

(declare-fun d!37073 () Bool)

(assert (=> d!37073 (arrayContainsKey!0 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000)))

(declare-fun lt!63600 () Unit!3835)

(declare-fun choose!13 (array!4657 (_ BitVec 64) (_ BitVec 32)) Unit!3835)

(assert (=> d!37073 (= lt!63600 (choose!13 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000))))

(assert (=> d!37073 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37073 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000) lt!63600)))

(declare-fun bs!5125 () Bool)

(assert (= bs!5125 d!37073))

(assert (=> bs!5125 m!143325))

(declare-fun m!143653 () Bool)

(assert (=> bs!5125 m!143653))

(assert (=> b!123389 d!37073))

(declare-fun d!37075 () Bool)

(declare-fun res!60020 () Bool)

(declare-fun e!80810 () Bool)

(assert (=> d!37075 (=> res!60020 e!80810)))

(assert (=> d!37075 (= res!60020 (= (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) lt!63485))))

(assert (=> d!37075 (= (arrayContainsKey!0 (_keys!4482 newMap!16) lt!63485 #b00000000000000000000000000000000) e!80810)))

(declare-fun b!123640 () Bool)

(declare-fun e!80811 () Bool)

(assert (=> b!123640 (= e!80810 e!80811)))

(declare-fun res!60021 () Bool)

(assert (=> b!123640 (=> (not res!60021) (not e!80811))))

(assert (=> b!123640 (= res!60021 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123641 () Bool)

(assert (=> b!123641 (= e!80811 (arrayContainsKey!0 (_keys!4482 newMap!16) lt!63485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37075 (not res!60020)) b!123640))

(assert (= (and b!123640 res!60021) b!123641))

(assert (=> d!37075 m!143259))

(declare-fun m!143655 () Bool)

(assert (=> b!123641 m!143655))

(assert (=> b!123389 d!37075))

(declare-fun b!123654 () Bool)

(declare-fun e!80818 () SeekEntryResult!267)

(declare-fun e!80819 () SeekEntryResult!267)

(assert (=> b!123654 (= e!80818 e!80819)))

(declare-fun lt!63607 () (_ BitVec 64))

(declare-fun lt!63608 () SeekEntryResult!267)

(assert (=> b!123654 (= lt!63607 (select (arr!2207 (_keys!4482 newMap!16)) (index!3224 lt!63608)))))

(declare-fun c!22447 () Bool)

(assert (=> b!123654 (= c!22447 (= lt!63607 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123655 () Bool)

(declare-fun e!80820 () SeekEntryResult!267)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4657 (_ BitVec 32)) SeekEntryResult!267)

(assert (=> b!123655 (= e!80820 (seekKeyOrZeroReturnVacant!0 (x!14728 lt!63608) (index!3224 lt!63608) (index!3224 lt!63608) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (_keys!4482 newMap!16) (mask!6993 newMap!16)))))

(declare-fun b!123656 () Bool)

(declare-fun c!22448 () Bool)

(assert (=> b!123656 (= c!22448 (= lt!63607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123656 (= e!80819 e!80820)))

(declare-fun b!123657 () Bool)

(assert (=> b!123657 (= e!80818 Undefined!267)))

(declare-fun b!123658 () Bool)

(assert (=> b!123658 (= e!80819 (Found!267 (index!3224 lt!63608)))))

(declare-fun d!37077 () Bool)

(declare-fun lt!63609 () SeekEntryResult!267)

(assert (=> d!37077 (and (or ((_ is Undefined!267) lt!63609) (not ((_ is Found!267) lt!63609)) (and (bvsge (index!3223 lt!63609) #b00000000000000000000000000000000) (bvslt (index!3223 lt!63609) (size!2469 (_keys!4482 newMap!16))))) (or ((_ is Undefined!267) lt!63609) ((_ is Found!267) lt!63609) (not ((_ is MissingZero!267) lt!63609)) (and (bvsge (index!3222 lt!63609) #b00000000000000000000000000000000) (bvslt (index!3222 lt!63609) (size!2469 (_keys!4482 newMap!16))))) (or ((_ is Undefined!267) lt!63609) ((_ is Found!267) lt!63609) ((_ is MissingZero!267) lt!63609) (not ((_ is MissingVacant!267) lt!63609)) (and (bvsge (index!3225 lt!63609) #b00000000000000000000000000000000) (bvslt (index!3225 lt!63609) (size!2469 (_keys!4482 newMap!16))))) (or ((_ is Undefined!267) lt!63609) (ite ((_ is Found!267) lt!63609) (= (select (arr!2207 (_keys!4482 newMap!16)) (index!3223 lt!63609)) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!267) lt!63609) (= (select (arr!2207 (_keys!4482 newMap!16)) (index!3222 lt!63609)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!267) lt!63609) (= (select (arr!2207 (_keys!4482 newMap!16)) (index!3225 lt!63609)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37077 (= lt!63609 e!80818)))

(declare-fun c!22446 () Bool)

(assert (=> d!37077 (= c!22446 (and ((_ is Intermediate!267) lt!63608) (undefined!1079 lt!63608)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4657 (_ BitVec 32)) SeekEntryResult!267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37077 (= lt!63608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (mask!6993 newMap!16)) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (_keys!4482 newMap!16) (mask!6993 newMap!16)))))

(assert (=> d!37077 (validMask!0 (mask!6993 newMap!16))))

(assert (=> d!37077 (= (seekEntryOrOpen!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (_keys!4482 newMap!16) (mask!6993 newMap!16)) lt!63609)))

(declare-fun b!123659 () Bool)

(assert (=> b!123659 (= e!80820 (MissingZero!267 (index!3224 lt!63608)))))

(assert (= (and d!37077 c!22446) b!123657))

(assert (= (and d!37077 (not c!22446)) b!123654))

(assert (= (and b!123654 c!22447) b!123658))

(assert (= (and b!123654 (not c!22447)) b!123656))

(assert (= (and b!123656 c!22448) b!123659))

(assert (= (and b!123656 (not c!22448)) b!123655))

(declare-fun m!143657 () Bool)

(assert (=> b!123654 m!143657))

(assert (=> b!123655 m!143259))

(declare-fun m!143659 () Bool)

(assert (=> b!123655 m!143659))

(declare-fun m!143661 () Bool)

(assert (=> d!37077 m!143661))

(declare-fun m!143663 () Bool)

(assert (=> d!37077 m!143663))

(assert (=> d!37077 m!143313))

(declare-fun m!143665 () Bool)

(assert (=> d!37077 m!143665))

(assert (=> d!37077 m!143259))

(declare-fun m!143667 () Bool)

(assert (=> d!37077 m!143667))

(declare-fun m!143669 () Bool)

(assert (=> d!37077 m!143669))

(assert (=> d!37077 m!143259))

(assert (=> d!37077 m!143665))

(assert (=> b!123389 d!37077))

(declare-fun d!37079 () Bool)

(assert (=> d!37079 (= (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!391 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5126 () Bool)

(assert (= bs!5126 d!37079))

(assert (=> bs!5126 m!143319))

(declare-fun m!143671 () Bool)

(assert (=> bs!5126 m!143671))

(assert (=> b!123379 d!37079))

(declare-fun d!37081 () Bool)

(declare-fun c!22449 () Bool)

(assert (=> d!37081 (= c!22449 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80821 () Option!170)

(assert (=> d!37081 (= (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000) e!80821)))

(declare-fun b!123661 () Bool)

(declare-fun e!80822 () Option!170)

(assert (=> b!123661 (= e!80821 e!80822)))

(declare-fun c!22450 () Bool)

(assert (=> b!123661 (= c!22450 (and ((_ is Cons!1687) (toList!852 lt!63422)) (not (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123662 () Bool)

(assert (=> b!123662 (= e!80822 (getValueByKey!164 (t!5990 (toList!852 lt!63422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123663 () Bool)

(assert (=> b!123663 (= e!80822 None!168)))

(declare-fun b!123660 () Bool)

(assert (=> b!123660 (= e!80821 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63422)))))))

(assert (= (and d!37081 c!22449) b!123660))

(assert (= (and d!37081 (not c!22449)) b!123661))

(assert (= (and b!123661 c!22450) b!123662))

(assert (= (and b!123661 (not c!22450)) b!123663))

(declare-fun m!143673 () Bool)

(assert (=> b!123662 m!143673))

(assert (=> b!123379 d!37081))

(declare-fun d!37083 () Bool)

(declare-fun e!80823 () Bool)

(assert (=> d!37083 e!80823))

(declare-fun res!60022 () Bool)

(assert (=> d!37083 (=> (not res!60022) (not e!80823))))

(declare-fun lt!63612 () ListLongMap!1673)

(assert (=> d!37083 (= res!60022 (contains!869 lt!63612 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(declare-fun lt!63611 () List!1691)

(assert (=> d!37083 (= lt!63612 (ListLongMap!1674 lt!63611))))

(declare-fun lt!63610 () Unit!3835)

(declare-fun lt!63613 () Unit!3835)

(assert (=> d!37083 (= lt!63610 lt!63613)))

(assert (=> d!37083 (= (getValueByKey!164 lt!63611 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(assert (=> d!37083 (= lt!63613 (lemmaContainsTupThenGetReturnValue!80 lt!63611 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(assert (=> d!37083 (= lt!63611 (insertStrictlySorted!83 (toList!852 call!13107) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(assert (=> d!37083 (= (+!167 call!13107 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))) lt!63612)))

(declare-fun b!123664 () Bool)

(declare-fun res!60023 () Bool)

(assert (=> b!123664 (=> (not res!60023) (not e!80823))))

(assert (=> b!123664 (= res!60023 (= (getValueByKey!164 (toList!852 lt!63612) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))))

(declare-fun b!123665 () Bool)

(assert (=> b!123665 (= e!80823 (contains!870 (toList!852 lt!63612) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))

(assert (= (and d!37083 res!60022) b!123664))

(assert (= (and b!123664 res!60023) b!123665))

(declare-fun m!143675 () Bool)

(assert (=> d!37083 m!143675))

(declare-fun m!143677 () Bool)

(assert (=> d!37083 m!143677))

(declare-fun m!143679 () Bool)

(assert (=> d!37083 m!143679))

(declare-fun m!143681 () Bool)

(assert (=> d!37083 m!143681))

(declare-fun m!143683 () Bool)

(assert (=> b!123664 m!143683))

(declare-fun m!143685 () Bool)

(assert (=> b!123665 m!143685))

(assert (=> b!123362 d!37083))

(declare-fun d!37085 () Bool)

(declare-fun res!60024 () Bool)

(declare-fun e!80824 () Bool)

(assert (=> d!37085 (=> res!60024 e!80824)))

(assert (=> d!37085 (= res!60024 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37085 (= (containsKey!168 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000) e!80824)))

(declare-fun b!123666 () Bool)

(declare-fun e!80825 () Bool)

(assert (=> b!123666 (= e!80824 e!80825)))

(declare-fun res!60025 () Bool)

(assert (=> b!123666 (=> (not res!60025) (not e!80825))))

(assert (=> b!123666 (= res!60025 (and (or (not ((_ is Cons!1687) (toList!852 lt!63422))) (bvsle (_1!1292 (h!2288 (toList!852 lt!63422))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1687) (toList!852 lt!63422)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63422))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123667 () Bool)

(assert (=> b!123667 (= e!80825 (containsKey!168 (t!5990 (toList!852 lt!63422)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37085 (not res!60024)) b!123666))

(assert (= (and b!123666 res!60025) b!123667))

(declare-fun m!143687 () Bool)

(assert (=> b!123667 m!143687))

(assert (=> d!36959 d!37085))

(declare-fun d!37087 () Bool)

(assert (=> d!37087 (= (get!1426 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3094 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36961 d!37087))

(assert (=> d!36961 d!37081))

(declare-fun lt!63614 () Bool)

(declare-fun d!37089 () Bool)

(assert (=> d!37089 (= lt!63614 (select (content!121 (toList!852 lt!63521)) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80827 () Bool)

(assert (=> d!37089 (= lt!63614 e!80827)))

(declare-fun res!60027 () Bool)

(assert (=> d!37089 (=> (not res!60027) (not e!80827))))

(assert (=> d!37089 (= res!60027 ((_ is Cons!1687) (toList!852 lt!63521)))))

(assert (=> d!37089 (= (contains!870 (toList!852 lt!63521) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63614)))

(declare-fun b!123668 () Bool)

(declare-fun e!80826 () Bool)

(assert (=> b!123668 (= e!80827 e!80826)))

(declare-fun res!60026 () Bool)

(assert (=> b!123668 (=> res!60026 e!80826)))

(assert (=> b!123668 (= res!60026 (= (h!2288 (toList!852 lt!63521)) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123669 () Bool)

(assert (=> b!123669 (= e!80826 (contains!870 (t!5990 (toList!852 lt!63521)) (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37089 res!60027) b!123668))

(assert (= (and b!123668 (not res!60026)) b!123669))

(declare-fun m!143689 () Bool)

(assert (=> d!37089 m!143689))

(declare-fun m!143691 () Bool)

(assert (=> d!37089 m!143691))

(declare-fun m!143693 () Bool)

(assert (=> b!123669 m!143693))

(assert (=> b!123450 d!37089))

(declare-fun d!37091 () Bool)

(assert (=> d!37091 (= (get!1428 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123501 d!37091))

(declare-fun d!37093 () Bool)

(declare-fun lt!63617 () Bool)

(declare-fun content!122 (List!1692) (InoxSet (_ BitVec 64)))

(assert (=> d!37093 (= lt!63617 (select (content!122 Nil!1689) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80833 () Bool)

(assert (=> d!37093 (= lt!63617 e!80833)))

(declare-fun res!60032 () Bool)

(assert (=> d!37093 (=> (not res!60032) (not e!80833))))

(assert (=> d!37093 (= res!60032 ((_ is Cons!1688) Nil!1689))))

(assert (=> d!37093 (= (contains!871 Nil!1689 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) lt!63617)))

(declare-fun b!123674 () Bool)

(declare-fun e!80832 () Bool)

(assert (=> b!123674 (= e!80833 e!80832)))

(declare-fun res!60033 () Bool)

(assert (=> b!123674 (=> res!60033 e!80832)))

(assert (=> b!123674 (= res!60033 (= (h!2289 Nil!1689) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123675 () Bool)

(assert (=> b!123675 (= e!80832 (contains!871 (t!5995 Nil!1689) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37093 res!60032) b!123674))

(assert (= (and b!123674 (not res!60033)) b!123675))

(declare-fun m!143695 () Bool)

(assert (=> d!37093 m!143695))

(assert (=> d!37093 m!143259))

(declare-fun m!143697 () Bool)

(assert (=> d!37093 m!143697))

(assert (=> b!123675 m!143259))

(declare-fun m!143699 () Bool)

(assert (=> b!123675 m!143699))

(assert (=> b!123445 d!37093))

(declare-fun d!37095 () Bool)

(assert (=> d!37095 (isDefined!117 (getValueByKey!164 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63618 () Unit!3835)

(assert (=> d!37095 (= lt!63618 (choose!744 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80834 () Bool)

(assert (=> d!37095 e!80834))

(declare-fun res!60034 () Bool)

(assert (=> d!37095 (=> (not res!60034) (not e!80834))))

(assert (=> d!37095 (= res!60034 (isStrictlySorted!315 (toList!852 lt!63422)))))

(assert (=> d!37095 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000) lt!63618)))

(declare-fun b!123676 () Bool)

(assert (=> b!123676 (= e!80834 (containsKey!168 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37095 res!60034) b!123676))

(assert (=> d!37095 m!143319))

(assert (=> d!37095 m!143319))

(assert (=> d!37095 m!143321))

(declare-fun m!143701 () Bool)

(assert (=> d!37095 m!143701))

(assert (=> d!37095 m!143531))

(assert (=> b!123676 m!143315))

(assert (=> b!123377 d!37095))

(assert (=> b!123377 d!37079))

(assert (=> b!123377 d!37081))

(declare-fun d!37097 () Bool)

(declare-fun e!80835 () Bool)

(assert (=> d!37097 e!80835))

(declare-fun res!60035 () Bool)

(assert (=> d!37097 (=> (not res!60035) (not e!80835))))

(declare-fun lt!63621 () ListLongMap!1673)

(assert (=> d!37097 (= res!60035 (contains!869 lt!63621 (_1!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))))

(declare-fun lt!63620 () List!1691)

(assert (=> d!37097 (= lt!63621 (ListLongMap!1674 lt!63620))))

(declare-fun lt!63619 () Unit!3835)

(declare-fun lt!63622 () Unit!3835)

(assert (=> d!37097 (= lt!63619 lt!63622)))

(assert (=> d!37097 (= (getValueByKey!164 lt!63620 (_1!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))) (Some!169 (_2!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))))

(assert (=> d!37097 (= lt!63622 (lemmaContainsTupThenGetReturnValue!80 lt!63620 (_1!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))) (_2!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))))

(assert (=> d!37097 (= lt!63620 (insertStrictlySorted!83 (toList!852 (ite c!22360 call!13110 (ite c!22364 call!13105 call!13104))) (_1!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))) (_2!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))))))

(assert (=> d!37097 (= (+!167 (ite c!22360 call!13110 (ite c!22364 call!13105 call!13104)) (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))) lt!63621)))

(declare-fun b!123677 () Bool)

(declare-fun res!60036 () Bool)

(assert (=> b!123677 (=> (not res!60036) (not e!80835))))

(assert (=> b!123677 (= res!60036 (= (getValueByKey!164 (toList!852 lt!63621) (_1!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16))))) (Some!169 (_2!1292 (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))))

(declare-fun b!123678 () Bool)

(assert (=> b!123678 (= e!80835 (contains!870 (toList!852 lt!63621) (ite (or c!22360 c!22364) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 newMap!16)) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 newMap!16)))))))

(assert (= (and d!37097 res!60035) b!123677))

(assert (= (and b!123677 res!60036) b!123678))

(declare-fun m!143703 () Bool)

(assert (=> d!37097 m!143703))

(declare-fun m!143705 () Bool)

(assert (=> d!37097 m!143705))

(declare-fun m!143707 () Bool)

(assert (=> d!37097 m!143707))

(declare-fun m!143709 () Bool)

(assert (=> d!37097 m!143709))

(declare-fun m!143711 () Bool)

(assert (=> b!123677 m!143711))

(declare-fun m!143713 () Bool)

(assert (=> b!123678 m!143713))

(assert (=> bm!13104 d!37097))

(assert (=> bm!13113 d!37057))

(declare-fun d!37099 () Bool)

(assert (=> d!37099 (= (apply!108 lt!63444 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1426 (getValueByKey!164 (toList!852 lt!63444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5127 () Bool)

(assert (= bs!5127 d!37099))

(assert (=> bs!5127 m!143523))

(assert (=> bs!5127 m!143523))

(declare-fun m!143715 () Bool)

(assert (=> bs!5127 m!143715))

(assert (=> b!123366 d!37099))

(declare-fun d!37101 () Bool)

(declare-fun e!80836 () Bool)

(assert (=> d!37101 e!80836))

(declare-fun res!60037 () Bool)

(assert (=> d!37101 (=> res!60037 e!80836)))

(declare-fun lt!63626 () Bool)

(assert (=> d!37101 (= res!60037 (not lt!63626))))

(declare-fun lt!63624 () Bool)

(assert (=> d!37101 (= lt!63626 lt!63624)))

(declare-fun lt!63623 () Unit!3835)

(declare-fun e!80837 () Unit!3835)

(assert (=> d!37101 (= lt!63623 e!80837)))

(declare-fun c!22451 () Bool)

(assert (=> d!37101 (= c!22451 lt!63624)))

(assert (=> d!37101 (= lt!63624 (containsKey!168 (toList!852 lt!63444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37101 (= (contains!869 lt!63444 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63626)))

(declare-fun b!123679 () Bool)

(declare-fun lt!63625 () Unit!3835)

(assert (=> b!123679 (= e!80837 lt!63625)))

(assert (=> b!123679 (= lt!63625 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123679 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123680 () Bool)

(declare-fun Unit!3846 () Unit!3835)

(assert (=> b!123680 (= e!80837 Unit!3846)))

(declare-fun b!123681 () Bool)

(assert (=> b!123681 (= e!80836 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37101 c!22451) b!123679))

(assert (= (and d!37101 (not c!22451)) b!123680))

(assert (= (and d!37101 (not res!60037)) b!123681))

(declare-fun m!143717 () Bool)

(assert (=> d!37101 m!143717))

(declare-fun m!143719 () Bool)

(assert (=> b!123679 m!143719))

(assert (=> b!123679 m!143609))

(assert (=> b!123679 m!143609))

(declare-fun m!143721 () Bool)

(assert (=> b!123679 m!143721))

(assert (=> b!123681 m!143609))

(assert (=> b!123681 m!143609))

(assert (=> b!123681 m!143721))

(assert (=> bm!13101 d!37101))

(declare-fun d!37103 () Bool)

(declare-fun c!22452 () Bool)

(assert (=> d!37103 (= c!22452 (and ((_ is Cons!1687) (toList!852 lt!63549)) (= (_1!1292 (h!2288 (toList!852 lt!63549))) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80838 () Option!170)

(assert (=> d!37103 (= (getValueByKey!164 (toList!852 lt!63549) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80838)))

(declare-fun b!123683 () Bool)

(declare-fun e!80839 () Option!170)

(assert (=> b!123683 (= e!80838 e!80839)))

(declare-fun c!22453 () Bool)

(assert (=> b!123683 (= c!22453 (and ((_ is Cons!1687) (toList!852 lt!63549)) (not (= (_1!1292 (h!2288 (toList!852 lt!63549))) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123684 () Bool)

(assert (=> b!123684 (= e!80839 (getValueByKey!164 (t!5990 (toList!852 lt!63549)) (_1!1292 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123685 () Bool)

(assert (=> b!123685 (= e!80839 None!168)))

(declare-fun b!123682 () Bool)

(assert (=> b!123682 (= e!80838 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63549)))))))

(assert (= (and d!37103 c!22452) b!123682))

(assert (= (and d!37103 (not c!22452)) b!123683))

(assert (= (and b!123683 c!22453) b!123684))

(assert (= (and b!123683 (not c!22453)) b!123685))

(declare-fun m!143723 () Bool)

(assert (=> b!123684 m!143723))

(assert (=> b!123490 d!37103))

(declare-fun d!37105 () Bool)

(declare-fun e!80840 () Bool)

(assert (=> d!37105 e!80840))

(declare-fun res!60038 () Bool)

(assert (=> d!37105 (=> res!60038 e!80840)))

(declare-fun lt!63630 () Bool)

(assert (=> d!37105 (= res!60038 (not lt!63630))))

(declare-fun lt!63628 () Bool)

(assert (=> d!37105 (= lt!63630 lt!63628)))

(declare-fun lt!63627 () Unit!3835)

(declare-fun e!80841 () Unit!3835)

(assert (=> d!37105 (= lt!63627 e!80841)))

(declare-fun c!22454 () Bool)

(assert (=> d!37105 (= c!22454 lt!63628)))

(assert (=> d!37105 (= lt!63628 (containsKey!168 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!37105 (= (contains!869 lt!63532 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63630)))

(declare-fun b!123686 () Bool)

(declare-fun lt!63629 () Unit!3835)

(assert (=> b!123686 (= e!80841 lt!63629)))

(assert (=> b!123686 (= lt!63629 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> b!123686 (isDefined!117 (getValueByKey!164 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123687 () Bool)

(declare-fun Unit!3847 () Unit!3835)

(assert (=> b!123687 (= e!80841 Unit!3847)))

(declare-fun b!123688 () Bool)

(assert (=> b!123688 (= e!80840 (isDefined!117 (getValueByKey!164 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37105 c!22454) b!123686))

(assert (= (and d!37105 (not c!22454)) b!123687))

(assert (= (and d!37105 (not res!60038)) b!123688))

(declare-fun m!143725 () Bool)

(assert (=> d!37105 m!143725))

(declare-fun m!143727 () Bool)

(assert (=> b!123686 m!143727))

(assert (=> b!123686 m!143409))

(assert (=> b!123686 m!143409))

(declare-fun m!143729 () Bool)

(assert (=> b!123686 m!143729))

(assert (=> b!123688 m!143409))

(assert (=> b!123688 m!143409))

(assert (=> b!123688 m!143729))

(assert (=> d!36967 d!37105))

(declare-fun c!22455 () Bool)

(declare-fun d!37107 () Bool)

(assert (=> d!37107 (= c!22455 (and ((_ is Cons!1687) lt!63531) (= (_1!1292 (h!2288 lt!63531)) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80842 () Option!170)

(assert (=> d!37107 (= (getValueByKey!164 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80842)))

(declare-fun b!123690 () Bool)

(declare-fun e!80843 () Option!170)

(assert (=> b!123690 (= e!80842 e!80843)))

(declare-fun c!22456 () Bool)

(assert (=> b!123690 (= c!22456 (and ((_ is Cons!1687) lt!63531) (not (= (_1!1292 (h!2288 lt!63531)) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123691 () Bool)

(assert (=> b!123691 (= e!80843 (getValueByKey!164 (t!5990 lt!63531) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123692 () Bool)

(assert (=> b!123692 (= e!80843 None!168)))

(declare-fun b!123689 () Bool)

(assert (=> b!123689 (= e!80842 (Some!169 (_2!1292 (h!2288 lt!63531))))))

(assert (= (and d!37107 c!22455) b!123689))

(assert (= (and d!37107 (not c!22455)) b!123690))

(assert (= (and b!123690 c!22456) b!123691))

(assert (= (and b!123690 (not c!22456)) b!123692))

(declare-fun m!143731 () Bool)

(assert (=> b!123691 m!143731))

(assert (=> d!36967 d!37107))

(declare-fun d!37109 () Bool)

(assert (=> d!37109 (= (getValueByKey!164 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63631 () Unit!3835)

(assert (=> d!37109 (= lt!63631 (choose!745 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80844 () Bool)

(assert (=> d!37109 e!80844))

(declare-fun res!60039 () Bool)

(assert (=> d!37109 (=> (not res!60039) (not e!80844))))

(assert (=> d!37109 (= res!60039 (isStrictlySorted!315 lt!63531))))

(assert (=> d!37109 (= (lemmaContainsTupThenGetReturnValue!80 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63631)))

(declare-fun b!123693 () Bool)

(declare-fun res!60040 () Bool)

(assert (=> b!123693 (=> (not res!60040) (not e!80844))))

(assert (=> b!123693 (= res!60040 (containsKey!168 lt!63531 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123694 () Bool)

(assert (=> b!123694 (= e!80844 (contains!870 lt!63531 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37109 res!60039) b!123693))

(assert (= (and b!123693 res!60040) b!123694))

(assert (=> d!37109 m!143403))

(declare-fun m!143733 () Bool)

(assert (=> d!37109 m!143733))

(declare-fun m!143735 () Bool)

(assert (=> d!37109 m!143735))

(declare-fun m!143737 () Bool)

(assert (=> b!123693 m!143737))

(declare-fun m!143739 () Bool)

(assert (=> b!123694 m!143739))

(assert (=> d!36967 d!37109))

(declare-fun b!123695 () Bool)

(declare-fun e!80846 () List!1691)

(declare-fun call!13135 () List!1691)

(assert (=> b!123695 (= e!80846 call!13135)))

(declare-fun b!123697 () Bool)

(declare-fun e!80848 () List!1691)

(assert (=> b!123697 (= e!80848 e!80846)))

(declare-fun c!22460 () Bool)

(assert (=> b!123697 (= c!22460 (and ((_ is Cons!1687) (toList!852 lt!63434)) (= (_1!1292 (h!2288 (toList!852 lt!63434))) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80847 () Bool)

(declare-fun b!123698 () Bool)

(declare-fun lt!63632 () List!1691)

(assert (=> b!123698 (= e!80847 (contains!870 lt!63632 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123699 () Bool)

(declare-fun e!80845 () List!1691)

(declare-fun call!13134 () List!1691)

(assert (=> b!123699 (= e!80845 call!13134)))

(declare-fun b!123700 () Bool)

(declare-fun call!13136 () List!1691)

(assert (=> b!123700 (= e!80848 call!13136)))

(declare-fun bm!13131 () Bool)

(assert (=> bm!13131 (= call!13134 call!13135)))

(declare-fun bm!13132 () Bool)

(assert (=> bm!13132 (= call!13135 call!13136)))

(declare-fun b!123701 () Bool)

(declare-fun c!22459 () Bool)

(assert (=> b!123701 (= c!22459 (and ((_ is Cons!1687) (toList!852 lt!63434)) (bvsgt (_1!1292 (h!2288 (toList!852 lt!63434))) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123701 (= e!80846 e!80845)))

(declare-fun b!123702 () Bool)

(declare-fun e!80849 () List!1691)

(assert (=> b!123702 (= e!80849 (ite c!22460 (t!5990 (toList!852 lt!63434)) (ite c!22459 (Cons!1687 (h!2288 (toList!852 lt!63434)) (t!5990 (toList!852 lt!63434))) Nil!1688)))))

(declare-fun b!123703 () Bool)

(assert (=> b!123703 (= e!80845 call!13134)))

(declare-fun bm!13133 () Bool)

(declare-fun c!22458 () Bool)

(assert (=> bm!13133 (= call!13136 ($colon$colon!87 e!80849 (ite c!22458 (h!2288 (toList!852 lt!63434)) (tuple2!2563 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun c!22457 () Bool)

(assert (=> bm!13133 (= c!22457 c!22458)))

(declare-fun b!123704 () Bool)

(assert (=> b!123704 (= e!80849 (insertStrictlySorted!83 (t!5990 (toList!852 lt!63434)) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun d!37111 () Bool)

(assert (=> d!37111 e!80847))

(declare-fun res!60041 () Bool)

(assert (=> d!37111 (=> (not res!60041) (not e!80847))))

(assert (=> d!37111 (= res!60041 (isStrictlySorted!315 lt!63632))))

(assert (=> d!37111 (= lt!63632 e!80848)))

(assert (=> d!37111 (= c!22458 (and ((_ is Cons!1687) (toList!852 lt!63434)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63434))) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37111 (isStrictlySorted!315 (toList!852 lt!63434))))

(assert (=> d!37111 (= (insertStrictlySorted!83 (toList!852 lt!63434) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63632)))

(declare-fun b!123696 () Bool)

(declare-fun res!60042 () Bool)

(assert (=> b!123696 (=> (not res!60042) (not e!80847))))

(assert (=> b!123696 (= res!60042 (containsKey!168 lt!63632 (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37111 c!22458) b!123700))

(assert (= (and d!37111 (not c!22458)) b!123697))

(assert (= (and b!123697 c!22460) b!123695))

(assert (= (and b!123697 (not c!22460)) b!123701))

(assert (= (and b!123701 c!22459) b!123699))

(assert (= (and b!123701 (not c!22459)) b!123703))

(assert (= (or b!123699 b!123703) bm!13131))

(assert (= (or b!123695 bm!13131) bm!13132))

(assert (= (or b!123700 bm!13132) bm!13133))

(assert (= (and bm!13133 c!22457) b!123704))

(assert (= (and bm!13133 (not c!22457)) b!123702))

(assert (= (and d!37111 res!60041) b!123696))

(assert (= (and b!123696 res!60042) b!123698))

(declare-fun m!143741 () Bool)

(assert (=> bm!13133 m!143741))

(declare-fun m!143743 () Bool)

(assert (=> b!123698 m!143743))

(declare-fun m!143745 () Bool)

(assert (=> b!123696 m!143745))

(declare-fun m!143747 () Bool)

(assert (=> b!123704 m!143747))

(declare-fun m!143749 () Bool)

(assert (=> d!37111 m!143749))

(declare-fun m!143751 () Bool)

(assert (=> d!37111 m!143751))

(assert (=> d!36967 d!37111))

(declare-fun d!37113 () Bool)

(declare-fun res!60043 () Bool)

(declare-fun e!80850 () Bool)

(assert (=> d!37113 (=> res!60043 e!80850)))

(assert (=> d!37113 (= res!60043 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37113 (= (containsKey!168 (toList!852 lt!63422) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!80850)))

(declare-fun b!123705 () Bool)

(declare-fun e!80851 () Bool)

(assert (=> b!123705 (= e!80850 e!80851)))

(declare-fun res!60044 () Bool)

(assert (=> b!123705 (=> (not res!60044) (not e!80851))))

(assert (=> b!123705 (= res!60044 (and (or (not ((_ is Cons!1687) (toList!852 lt!63422))) (bvsle (_1!1292 (h!2288 (toList!852 lt!63422))) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1687) (toList!852 lt!63422)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63422))) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!123706 () Bool)

(assert (=> b!123706 (= e!80851 (containsKey!168 (t!5990 (toList!852 lt!63422)) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37113 (not res!60043)) b!123705))

(assert (= (and b!123705 res!60044) b!123706))

(assert (=> b!123706 m!143193))

(declare-fun m!143753 () Bool)

(assert (=> b!123706 m!143753))

(assert (=> d!36999 d!37113))

(assert (=> b!123448 d!37071))

(assert (=> b!123459 d!37071))

(declare-fun d!37115 () Bool)

(declare-fun e!80854 () Bool)

(assert (=> d!37115 e!80854))

(declare-fun res!60045 () Bool)

(assert (=> d!37115 (=> (not res!60045) (not e!80854))))

(declare-fun lt!63637 () ListLongMap!1673)

(assert (=> d!37115 (= res!60045 (not (contains!869 lt!63637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80852 () ListLongMap!1673)

(assert (=> d!37115 (= lt!63637 e!80852)))

(declare-fun c!22461 () Bool)

(assert (=> d!37115 (= c!22461 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!37115 (validMask!0 (mask!6993 newMap!16))))

(assert (=> d!37115 (= (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2755 newMap!16)) lt!63637)))

(declare-fun b!123707 () Bool)

(declare-fun e!80856 () Bool)

(assert (=> b!123707 (= e!80854 e!80856)))

(declare-fun c!22463 () Bool)

(declare-fun e!80855 () Bool)

(assert (=> b!123707 (= c!22463 e!80855)))

(declare-fun res!60047 () Bool)

(assert (=> b!123707 (=> (not res!60047) (not e!80855))))

(assert (=> b!123707 (= res!60047 (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123708 () Bool)

(declare-fun e!80857 () ListLongMap!1673)

(declare-fun call!13137 () ListLongMap!1673)

(assert (=> b!123708 (= e!80857 call!13137)))

(declare-fun b!123709 () Bool)

(declare-fun e!80858 () Bool)

(assert (=> b!123709 (= e!80856 e!80858)))

(declare-fun c!22464 () Bool)

(assert (=> b!123709 (= c!22464 (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123710 () Bool)

(assert (=> b!123710 (= e!80858 (isEmpty!390 lt!63637))))

(declare-fun b!123711 () Bool)

(declare-fun res!60048 () Bool)

(assert (=> b!123711 (=> (not res!60048) (not e!80854))))

(assert (=> b!123711 (= res!60048 (not (contains!869 lt!63637 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123712 () Bool)

(assert (=> b!123712 (= e!80852 (ListLongMap!1674 Nil!1688))))

(declare-fun b!123713 () Bool)

(assert (=> b!123713 (= e!80855 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123713 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!123714 () Bool)

(assert (=> b!123714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(assert (=> b!123714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_values!2738 newMap!16))))))

(declare-fun e!80853 () Bool)

(assert (=> b!123714 (= e!80853 (= (apply!108 lt!63637 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) (get!1425 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123715 () Bool)

(assert (=> b!123715 (= e!80852 e!80857)))

(declare-fun c!22462 () Bool)

(assert (=> b!123715 (= c!22462 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123716 () Bool)

(assert (=> b!123716 (= e!80858 (= lt!63637 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2755 newMap!16))))))

(declare-fun b!123717 () Bool)

(declare-fun lt!63636 () Unit!3835)

(declare-fun lt!63633 () Unit!3835)

(assert (=> b!123717 (= lt!63636 lt!63633)))

(declare-fun lt!63639 () V!3411)

(declare-fun lt!63635 () ListLongMap!1673)

(declare-fun lt!63634 () (_ BitVec 64))

(declare-fun lt!63638 () (_ BitVec 64))

(assert (=> b!123717 (not (contains!869 (+!167 lt!63635 (tuple2!2563 lt!63638 lt!63639)) lt!63634))))

(assert (=> b!123717 (= lt!63633 (addStillNotContains!54 lt!63635 lt!63638 lt!63639 lt!63634))))

(assert (=> b!123717 (= lt!63634 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123717 (= lt!63639 (get!1425 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123717 (= lt!63638 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123717 (= lt!63635 call!13137)))

(assert (=> b!123717 (= e!80857 (+!167 call!13137 (tuple2!2563 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) (get!1425 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!13134 () Bool)

(assert (=> bm!13134 (= call!13137 (getCurrentListMapNoExtraKeys!133 (_keys!4482 newMap!16) (_values!2738 newMap!16) (mask!6993 newMap!16) (extraKeys!2540 newMap!16) (zeroValue!2620 newMap!16) (minValue!2620 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2755 newMap!16)))))

(declare-fun b!123718 () Bool)

(assert (=> b!123718 (= e!80856 e!80853)))

(assert (=> b!123718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2469 (_keys!4482 newMap!16))))))

(declare-fun res!60046 () Bool)

(assert (=> b!123718 (= res!60046 (contains!869 lt!63637 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123718 (=> (not res!60046) (not e!80853))))

(assert (= (and d!37115 c!22461) b!123712))

(assert (= (and d!37115 (not c!22461)) b!123715))

(assert (= (and b!123715 c!22462) b!123717))

(assert (= (and b!123715 (not c!22462)) b!123708))

(assert (= (or b!123717 b!123708) bm!13134))

(assert (= (and d!37115 res!60045) b!123711))

(assert (= (and b!123711 res!60048) b!123707))

(assert (= (and b!123707 res!60047) b!123713))

(assert (= (and b!123707 c!22463) b!123718))

(assert (= (and b!123707 (not c!22463)) b!123709))

(assert (= (and b!123718 res!60046) b!123714))

(assert (= (and b!123709 c!22464) b!123716))

(assert (= (and b!123709 (not c!22464)) b!123710))

(declare-fun b_lambda!5433 () Bool)

(assert (=> (not b_lambda!5433) (not b!123714)))

(assert (=> b!123714 t!5997))

(declare-fun b_and!7599 () Bool)

(assert (= b_and!7595 (and (=> t!5997 result!3775) b_and!7599)))

(assert (=> b!123714 t!5999))

(declare-fun b_and!7601 () Bool)

(assert (= b_and!7597 (and (=> t!5999 result!3777) b_and!7601)))

(declare-fun b_lambda!5435 () Bool)

(assert (=> (not b_lambda!5435) (not b!123717)))

(assert (=> b!123717 t!5997))

(declare-fun b_and!7603 () Bool)

(assert (= b_and!7599 (and (=> t!5997 result!3775) b_and!7603)))

(assert (=> b!123717 t!5999))

(declare-fun b_and!7605 () Bool)

(assert (= b_and!7601 (and (=> t!5999 result!3777) b_and!7605)))

(assert (=> b!123714 m!143279))

(assert (=> b!123714 m!143279))

(assert (=> b!123714 m!143275))

(assert (=> b!123714 m!143281))

(assert (=> b!123714 m!143259))

(declare-fun m!143755 () Bool)

(assert (=> b!123714 m!143755))

(assert (=> b!123714 m!143259))

(assert (=> b!123714 m!143275))

(assert (=> b!123713 m!143259))

(assert (=> b!123713 m!143259))

(assert (=> b!123713 m!143261))

(declare-fun m!143757 () Bool)

(assert (=> bm!13134 m!143757))

(assert (=> b!123716 m!143757))

(assert (=> b!123715 m!143259))

(assert (=> b!123715 m!143259))

(assert (=> b!123715 m!143261))

(declare-fun m!143759 () Bool)

(assert (=> b!123717 m!143759))

(assert (=> b!123717 m!143279))

(assert (=> b!123717 m!143275))

(assert (=> b!123717 m!143281))

(declare-fun m!143761 () Bool)

(assert (=> b!123717 m!143761))

(assert (=> b!123717 m!143259))

(declare-fun m!143763 () Bool)

(assert (=> b!123717 m!143763))

(assert (=> b!123717 m!143279))

(assert (=> b!123717 m!143275))

(assert (=> b!123717 m!143763))

(declare-fun m!143765 () Bool)

(assert (=> b!123717 m!143765))

(assert (=> b!123718 m!143259))

(assert (=> b!123718 m!143259))

(declare-fun m!143767 () Bool)

(assert (=> b!123718 m!143767))

(declare-fun m!143769 () Bool)

(assert (=> b!123710 m!143769))

(declare-fun m!143771 () Bool)

(assert (=> d!37115 m!143771))

(assert (=> d!37115 m!143313))

(declare-fun m!143773 () Bool)

(assert (=> b!123711 m!143773))

(assert (=> bm!13105 d!37115))

(declare-fun b!123719 () Bool)

(declare-fun e!80860 () (_ BitVec 32))

(declare-fun e!80859 () (_ BitVec 32))

(assert (=> b!123719 (= e!80860 e!80859)))

(declare-fun c!22466 () Bool)

(assert (=> b!123719 (= c!22466 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!123720 () Bool)

(declare-fun call!13138 () (_ BitVec 32))

(assert (=> b!123720 (= e!80859 call!13138)))

(declare-fun bm!13135 () Bool)

(assert (=> bm!13135 (= call!13138 (arrayCountValidKeys!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(declare-fun b!123721 () Bool)

(assert (=> b!123721 (= e!80859 (bvadd #b00000000000000000000000000000001 call!13138))))

(declare-fun b!123722 () Bool)

(assert (=> b!123722 (= e!80860 #b00000000000000000000000000000000)))

(declare-fun d!37117 () Bool)

(declare-fun lt!63640 () (_ BitVec 32))

(assert (=> d!37117 (and (bvsge lt!63640 #b00000000000000000000000000000000) (bvsle lt!63640 (bvsub (size!2469 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!37117 (= lt!63640 e!80860)))

(declare-fun c!22465 () Bool)

(assert (=> d!37117 (= c!22465 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!37117 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2469 (_keys!4482 newMap!16)) (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!37117 (= (arrayCountValidKeys!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))) lt!63640)))

(assert (= (and d!37117 c!22465) b!123722))

(assert (= (and d!37117 (not c!22465)) b!123719))

(assert (= (and b!123719 c!22466) b!123721))

(assert (= (and b!123719 (not c!22466)) b!123720))

(assert (= (or b!123721 b!123720) bm!13135))

(declare-fun m!143775 () Bool)

(assert (=> b!123719 m!143775))

(assert (=> b!123719 m!143775))

(declare-fun m!143777 () Bool)

(assert (=> b!123719 m!143777))

(declare-fun m!143779 () Bool)

(assert (=> bm!13135 m!143779))

(assert (=> bm!13119 d!37117))

(assert (=> b!123365 d!37071))

(assert (=> d!36969 d!36967))

(assert (=> d!36969 d!36987))

(assert (=> d!36969 d!36985))

(declare-fun d!37119 () Bool)

(assert (=> d!37119 (= (apply!108 (+!167 lt!63434 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63433) (apply!108 lt!63434 lt!63433))))

(assert (=> d!37119 true))

(declare-fun _$34!934 () Unit!3835)

(assert (=> d!37119 (= (choose!742 lt!63434 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63433) _$34!934)))

(declare-fun bs!5128 () Bool)

(assert (= bs!5128 d!37119))

(assert (=> bs!5128 m!143225))

(assert (=> bs!5128 m!143225))

(assert (=> bs!5128 m!143233))

(assert (=> bs!5128 m!143243))

(assert (=> d!36969 d!37119))

(declare-fun d!37121 () Bool)

(declare-fun e!80861 () Bool)

(assert (=> d!37121 e!80861))

(declare-fun res!60049 () Bool)

(assert (=> d!37121 (=> res!60049 e!80861)))

(declare-fun lt!63644 () Bool)

(assert (=> d!37121 (= res!60049 (not lt!63644))))

(declare-fun lt!63642 () Bool)

(assert (=> d!37121 (= lt!63644 lt!63642)))

(declare-fun lt!63641 () Unit!3835)

(declare-fun e!80862 () Unit!3835)

(assert (=> d!37121 (= lt!63641 e!80862)))

(declare-fun c!22467 () Bool)

(assert (=> d!37121 (= c!22467 lt!63642)))

(assert (=> d!37121 (= lt!63642 (containsKey!168 (toList!852 lt!63434) lt!63433))))

(assert (=> d!37121 (= (contains!869 lt!63434 lt!63433) lt!63644)))

(declare-fun b!123724 () Bool)

(declare-fun lt!63643 () Unit!3835)

(assert (=> b!123724 (= e!80862 lt!63643)))

(assert (=> b!123724 (= lt!63643 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63434) lt!63433))))

(assert (=> b!123724 (isDefined!117 (getValueByKey!164 (toList!852 lt!63434) lt!63433))))

(declare-fun b!123725 () Bool)

(declare-fun Unit!3848 () Unit!3835)

(assert (=> b!123725 (= e!80862 Unit!3848)))

(declare-fun b!123726 () Bool)

(assert (=> b!123726 (= e!80861 (isDefined!117 (getValueByKey!164 (toList!852 lt!63434) lt!63433)))))

(assert (= (and d!37121 c!22467) b!123724))

(assert (= (and d!37121 (not c!22467)) b!123725))

(assert (= (and d!37121 (not res!60049)) b!123726))

(declare-fun m!143781 () Bool)

(assert (=> d!37121 m!143781))

(declare-fun m!143783 () Bool)

(assert (=> b!123724 m!143783))

(assert (=> b!123724 m!143477))

(assert (=> b!123724 m!143477))

(declare-fun m!143785 () Bool)

(assert (=> b!123724 m!143785))

(assert (=> b!123726 m!143477))

(assert (=> b!123726 m!143477))

(assert (=> b!123726 m!143785))

(assert (=> d!36969 d!37121))

(declare-fun b!123727 () Bool)

(declare-fun e!80864 () (_ BitVec 32))

(declare-fun e!80863 () (_ BitVec 32))

(assert (=> b!123727 (= e!80864 e!80863)))

(declare-fun c!22469 () Bool)

(assert (=> b!123727 (= c!22469 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!123728 () Bool)

(declare-fun call!13139 () (_ BitVec 32))

(assert (=> b!123728 (= e!80863 call!13139)))

(declare-fun bm!13136 () Bool)

(assert (=> bm!13136 (= call!13139 (arrayCountValidKeys!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123729 () Bool)

(assert (=> b!123729 (= e!80863 (bvadd #b00000000000000000000000000000001 call!13139))))

(declare-fun b!123730 () Bool)

(assert (=> b!123730 (= e!80864 #b00000000000000000000000000000000)))

(declare-fun d!37123 () Bool)

(declare-fun lt!63645 () (_ BitVec 32))

(assert (=> d!37123 (and (bvsge lt!63645 #b00000000000000000000000000000000) (bvsle lt!63645 (bvsub (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!37123 (= lt!63645 e!80864)))

(declare-fun c!22468 () Bool)

(assert (=> d!37123 (= c!22468 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!37123 (and (bvsle #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!37123 (= (arrayCountValidKeys!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))) lt!63645)))

(assert (= (and d!37123 c!22468) b!123730))

(assert (= (and d!37123 (not c!22468)) b!123727))

(assert (= (and b!123727 c!22469) b!123729))

(assert (= (and b!123727 (not c!22469)) b!123728))

(assert (= (or b!123729 b!123728) bm!13136))

(assert (=> b!123727 m!143545))

(assert (=> b!123727 m!143545))

(assert (=> b!123727 m!143553))

(declare-fun m!143787 () Bool)

(assert (=> bm!13136 m!143787))

(assert (=> b!123505 d!37123))

(declare-fun c!22470 () Bool)

(declare-fun d!37125 () Bool)

(assert (=> d!37125 (= c!22470 (and ((_ is Cons!1687) (toList!852 lt!63532)) (= (_1!1292 (h!2288 (toList!852 lt!63532))) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80865 () Option!170)

(assert (=> d!37125 (= (getValueByKey!164 (toList!852 lt!63532) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80865)))

(declare-fun b!123732 () Bool)

(declare-fun e!80866 () Option!170)

(assert (=> b!123732 (= e!80865 e!80866)))

(declare-fun c!22471 () Bool)

(assert (=> b!123732 (= c!22471 (and ((_ is Cons!1687) (toList!852 lt!63532)) (not (= (_1!1292 (h!2288 (toList!852 lt!63532))) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123733 () Bool)

(assert (=> b!123733 (= e!80866 (getValueByKey!164 (t!5990 (toList!852 lt!63532)) (_1!1292 (tuple2!2563 lt!63442 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123734 () Bool)

(assert (=> b!123734 (= e!80866 None!168)))

(declare-fun b!123731 () Bool)

(assert (=> b!123731 (= e!80865 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63532)))))))

(assert (= (and d!37125 c!22470) b!123731))

(assert (= (and d!37125 (not c!22470)) b!123732))

(assert (= (and b!123732 c!22471) b!123733))

(assert (= (and b!123732 (not c!22471)) b!123734))

(declare-fun m!143789 () Bool)

(assert (=> b!123733 m!143789))

(assert (=> b!123478 d!37125))

(declare-fun d!37127 () Bool)

(assert (=> d!37127 (= (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63432)) (v!3094 (getValueByKey!164 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63432)))))

(assert (=> d!36989 d!37127))

(declare-fun c!22472 () Bool)

(declare-fun d!37129 () Bool)

(assert (=> d!37129 (= c!22472 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63432)))))

(declare-fun e!80867 () Option!170)

(assert (=> d!37129 (= (getValueByKey!164 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63432) e!80867)))

(declare-fun b!123736 () Bool)

(declare-fun e!80868 () Option!170)

(assert (=> b!123736 (= e!80867 e!80868)))

(declare-fun c!22473 () Bool)

(assert (=> b!123736 (= c!22473 (and ((_ is Cons!1687) (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (not (= (_1!1292 (h!2288 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))) lt!63432))))))

(declare-fun b!123737 () Bool)

(assert (=> b!123737 (= e!80868 (getValueByKey!164 (t!5990 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63432))))

(declare-fun b!123738 () Bool)

(assert (=> b!123738 (= e!80868 None!168)))

(declare-fun b!123735 () Bool)

(assert (=> b!123735 (= e!80867 (Some!169 (_2!1292 (h!2288 (toList!852 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(assert (= (and d!37129 c!22472) b!123735))

(assert (= (and d!37129 (not c!22472)) b!123736))

(assert (= (and b!123736 c!22473) b!123737))

(assert (= (and b!123736 (not c!22473)) b!123738))

(declare-fun m!143791 () Bool)

(assert (=> b!123737 m!143791))

(assert (=> d!36989 d!37129))

(declare-fun d!37131 () Bool)

(assert (=> d!37131 (= (validMask!0 (mask!6993 newMap!16)) (and (or (= (mask!6993 newMap!16) #b00000000000000000000000000000111) (= (mask!6993 newMap!16) #b00000000000000000000000000001111) (= (mask!6993 newMap!16) #b00000000000000000000000000011111) (= (mask!6993 newMap!16) #b00000000000000000000000000111111) (= (mask!6993 newMap!16) #b00000000000000000000000001111111) (= (mask!6993 newMap!16) #b00000000000000000000000011111111) (= (mask!6993 newMap!16) #b00000000000000000000000111111111) (= (mask!6993 newMap!16) #b00000000000000000000001111111111) (= (mask!6993 newMap!16) #b00000000000000000000011111111111) (= (mask!6993 newMap!16) #b00000000000000000000111111111111) (= (mask!6993 newMap!16) #b00000000000000000001111111111111) (= (mask!6993 newMap!16) #b00000000000000000011111111111111) (= (mask!6993 newMap!16) #b00000000000000000111111111111111) (= (mask!6993 newMap!16) #b00000000000000001111111111111111) (= (mask!6993 newMap!16) #b00000000000000011111111111111111) (= (mask!6993 newMap!16) #b00000000000000111111111111111111) (= (mask!6993 newMap!16) #b00000000000001111111111111111111) (= (mask!6993 newMap!16) #b00000000000011111111111111111111) (= (mask!6993 newMap!16) #b00000000000111111111111111111111) (= (mask!6993 newMap!16) #b00000000001111111111111111111111) (= (mask!6993 newMap!16) #b00000000011111111111111111111111) (= (mask!6993 newMap!16) #b00000000111111111111111111111111) (= (mask!6993 newMap!16) #b00000001111111111111111111111111) (= (mask!6993 newMap!16) #b00000011111111111111111111111111) (= (mask!6993 newMap!16) #b00000111111111111111111111111111) (= (mask!6993 newMap!16) #b00001111111111111111111111111111) (= (mask!6993 newMap!16) #b00011111111111111111111111111111) (= (mask!6993 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!6993 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!36957 d!37131))

(assert (=> d!36939 d!37131))

(declare-fun d!37133 () Bool)

(assert (=> d!37133 (= (get!1426 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3094 (getValueByKey!164 (toList!852 lt!63422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36993 d!37133))

(assert (=> d!36993 d!37017))

(declare-fun lt!63646 () Bool)

(declare-fun d!37135 () Bool)

(assert (=> d!37135 (= lt!63646 (select (content!121 (toList!852 lt!63540)) (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80870 () Bool)

(assert (=> d!37135 (= lt!63646 e!80870)))

(declare-fun res!60051 () Bool)

(assert (=> d!37135 (=> (not res!60051) (not e!80870))))

(assert (=> d!37135 (= res!60051 ((_ is Cons!1687) (toList!852 lt!63540)))))

(assert (=> d!37135 (= (contains!870 (toList!852 lt!63540) (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63646)))

(declare-fun b!123739 () Bool)

(declare-fun e!80869 () Bool)

(assert (=> b!123739 (= e!80870 e!80869)))

(declare-fun res!60050 () Bool)

(assert (=> b!123739 (=> res!60050 e!80869)))

(assert (=> b!123739 (= res!60050 (= (h!2288 (toList!852 lt!63540)) (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123740 () Bool)

(assert (=> b!123740 (= e!80869 (contains!870 (t!5990 (toList!852 lt!63540)) (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!37135 res!60051) b!123739))

(assert (= (and b!123739 (not res!60050)) b!123740))

(declare-fun m!143793 () Bool)

(assert (=> d!37135 m!143793))

(declare-fun m!143795 () Bool)

(assert (=> d!37135 m!143795))

(declare-fun m!143797 () Bool)

(assert (=> b!123740 m!143797))

(assert (=> b!123486 d!37135))

(declare-fun d!37137 () Bool)

(declare-fun e!80871 () Bool)

(assert (=> d!37137 e!80871))

(declare-fun res!60052 () Bool)

(assert (=> d!37137 (=> res!60052 e!80871)))

(declare-fun lt!63650 () Bool)

(assert (=> d!37137 (= res!60052 (not lt!63650))))

(declare-fun lt!63648 () Bool)

(assert (=> d!37137 (= lt!63650 lt!63648)))

(declare-fun lt!63647 () Unit!3835)

(declare-fun e!80872 () Unit!3835)

(assert (=> d!37137 (= lt!63647 e!80872)))

(declare-fun c!22474 () Bool)

(assert (=> d!37137 (= c!22474 lt!63648)))

(assert (=> d!37137 (= lt!63648 (containsKey!168 (toList!852 lt!63516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37137 (= (contains!869 lt!63516 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63650)))

(declare-fun b!123741 () Bool)

(declare-fun lt!63649 () Unit!3835)

(assert (=> b!123741 (= e!80872 lt!63649)))

(assert (=> b!123741 (= lt!63649 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123741 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123742 () Bool)

(declare-fun Unit!3849 () Unit!3835)

(assert (=> b!123742 (= e!80872 Unit!3849)))

(declare-fun b!123743 () Bool)

(assert (=> b!123743 (= e!80871 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37137 c!22474) b!123741))

(assert (= (and d!37137 (not c!22474)) b!123742))

(assert (= (and d!37137 (not res!60052)) b!123743))

(declare-fun m!143799 () Bool)

(assert (=> d!37137 m!143799))

(declare-fun m!143801 () Bool)

(assert (=> b!123741 m!143801))

(declare-fun m!143803 () Bool)

(assert (=> b!123741 m!143803))

(assert (=> b!123741 m!143803))

(declare-fun m!143805 () Bool)

(assert (=> b!123741 m!143805))

(assert (=> b!123743 m!143803))

(assert (=> b!123743 m!143803))

(assert (=> b!123743 m!143805))

(assert (=> d!36947 d!37137))

(assert (=> d!36947 d!36949))

(declare-fun d!37139 () Bool)

(declare-fun e!80873 () Bool)

(assert (=> d!37139 e!80873))

(declare-fun res!60053 () Bool)

(assert (=> d!37139 (=> res!60053 e!80873)))

(declare-fun lt!63654 () Bool)

(assert (=> d!37139 (= res!60053 (not lt!63654))))

(declare-fun lt!63652 () Bool)

(assert (=> d!37139 (= lt!63654 lt!63652)))

(declare-fun lt!63651 () Unit!3835)

(declare-fun e!80874 () Unit!3835)

(assert (=> d!37139 (= lt!63651 e!80874)))

(declare-fun c!22475 () Bool)

(assert (=> d!37139 (= c!22475 lt!63652)))

(assert (=> d!37139 (= lt!63652 (containsKey!168 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37139 (= (contains!869 lt!63521 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63654)))

(declare-fun b!123744 () Bool)

(declare-fun lt!63653 () Unit!3835)

(assert (=> b!123744 (= e!80874 lt!63653)))

(assert (=> b!123744 (= lt!63653 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123744 (isDefined!117 (getValueByKey!164 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123745 () Bool)

(declare-fun Unit!3850 () Unit!3835)

(assert (=> b!123745 (= e!80874 Unit!3850)))

(declare-fun b!123746 () Bool)

(assert (=> b!123746 (= e!80873 (isDefined!117 (getValueByKey!164 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(assert (= (and d!37139 c!22475) b!123744))

(assert (= (and d!37139 (not c!22475)) b!123745))

(assert (= (and d!37139 (not res!60053)) b!123746))

(declare-fun m!143807 () Bool)

(assert (=> d!37139 m!143807))

(declare-fun m!143809 () Bool)

(assert (=> b!123744 m!143809))

(assert (=> b!123744 m!143375))

(assert (=> b!123744 m!143375))

(declare-fun m!143811 () Bool)

(assert (=> b!123744 m!143811))

(assert (=> b!123746 m!143375))

(assert (=> b!123746 m!143375))

(assert (=> b!123746 m!143811))

(assert (=> d!36953 d!37139))

(declare-fun d!37141 () Bool)

(declare-fun c!22476 () Bool)

(assert (=> d!37141 (= c!22476 (and ((_ is Cons!1687) lt!63520) (= (_1!1292 (h!2288 lt!63520)) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun e!80875 () Option!170)

(assert (=> d!37141 (= (getValueByKey!164 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) e!80875)))

(declare-fun b!123748 () Bool)

(declare-fun e!80876 () Option!170)

(assert (=> b!123748 (= e!80875 e!80876)))

(declare-fun c!22477 () Bool)

(assert (=> b!123748 (= c!22477 (and ((_ is Cons!1687) lt!63520) (not (= (_1!1292 (h!2288 lt!63520)) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(declare-fun b!123749 () Bool)

(assert (=> b!123749 (= e!80876 (getValueByKey!164 (t!5990 lt!63520) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123750 () Bool)

(assert (=> b!123750 (= e!80876 None!168)))

(declare-fun b!123747 () Bool)

(assert (=> b!123747 (= e!80875 (Some!169 (_2!1292 (h!2288 lt!63520))))))

(assert (= (and d!37141 c!22476) b!123747))

(assert (= (and d!37141 (not c!22476)) b!123748))

(assert (= (and b!123748 c!22477) b!123749))

(assert (= (and b!123748 (not c!22477)) b!123750))

(declare-fun m!143813 () Bool)

(assert (=> b!123749 m!143813))

(assert (=> d!36953 d!37141))

(declare-fun d!37143 () Bool)

(assert (=> d!37143 (= (getValueByKey!164 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) (Some!169 (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun lt!63655 () Unit!3835)

(assert (=> d!37143 (= lt!63655 (choose!745 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80877 () Bool)

(assert (=> d!37143 e!80877))

(declare-fun res!60054 () Bool)

(assert (=> d!37143 (=> (not res!60054) (not e!80877))))

(assert (=> d!37143 (= res!60054 (isStrictlySorted!315 lt!63520))))

(assert (=> d!37143 (= (lemmaContainsTupThenGetReturnValue!80 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63655)))

(declare-fun b!123751 () Bool)

(declare-fun res!60055 () Bool)

(assert (=> b!123751 (=> (not res!60055) (not e!80877))))

(assert (=> b!123751 (= res!60055 (containsKey!168 lt!63520 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123752 () Bool)

(assert (=> b!123752 (= e!80877 (contains!870 lt!63520 (tuple2!2563 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(assert (= (and d!37143 res!60054) b!123751))

(assert (= (and b!123751 res!60055) b!123752))

(assert (=> d!37143 m!143369))

(declare-fun m!143815 () Bool)

(assert (=> d!37143 m!143815))

(declare-fun m!143817 () Bool)

(assert (=> d!37143 m!143817))

(declare-fun m!143819 () Bool)

(assert (=> b!123751 m!143819))

(declare-fun m!143821 () Bool)

(assert (=> b!123752 m!143821))

(assert (=> d!36953 d!37143))

(declare-fun b!123753 () Bool)

(declare-fun e!80879 () List!1691)

(declare-fun call!13141 () List!1691)

(assert (=> b!123753 (= e!80879 call!13141)))

(declare-fun b!123755 () Bool)

(declare-fun e!80881 () List!1691)

(assert (=> b!123755 (= e!80881 e!80879)))

(declare-fun c!22481 () Bool)

(assert (=> b!123755 (= c!22481 (and ((_ is Cons!1687) (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (= (_1!1292 (h!2288 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun e!80880 () Bool)

(declare-fun b!123756 () Bool)

(declare-fun lt!63656 () List!1691)

(assert (=> b!123756 (= e!80880 (contains!870 lt!63656 (tuple2!2563 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123757 () Bool)

(declare-fun e!80878 () List!1691)

(declare-fun call!13140 () List!1691)

(assert (=> b!123757 (= e!80878 call!13140)))

(declare-fun b!123758 () Bool)

(declare-fun call!13142 () List!1691)

(assert (=> b!123758 (= e!80881 call!13142)))

(declare-fun bm!13137 () Bool)

(assert (=> bm!13137 (= call!13140 call!13141)))

(declare-fun bm!13138 () Bool)

(assert (=> bm!13138 (= call!13141 call!13142)))

(declare-fun b!123759 () Bool)

(declare-fun c!22480 () Bool)

(assert (=> b!123759 (= c!22480 (and ((_ is Cons!1687) (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (bvsgt (_1!1292 (h!2288 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(assert (=> b!123759 (= e!80879 e!80878)))

(declare-fun b!123760 () Bool)

(declare-fun e!80882 () List!1691)

(assert (=> b!123760 (= e!80882 (ite c!22481 (t!5990 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (ite c!22480 (Cons!1687 (h!2288 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (t!5990 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))))) Nil!1688)))))

(declare-fun b!123761 () Bool)

(assert (=> b!123761 (= e!80878 call!13140)))

(declare-fun bm!13139 () Bool)

(declare-fun c!22479 () Bool)

(assert (=> bm!13139 (= call!13142 ($colon$colon!87 e!80882 (ite c!22479 (h!2288 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (tuple2!2563 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(declare-fun c!22478 () Bool)

(assert (=> bm!13139 (= c!22478 c!22479)))

(declare-fun b!123762 () Bool)

(assert (=> b!123762 (= e!80882 (insertStrictlySorted!83 (t!5990 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun d!37145 () Bool)

(assert (=> d!37145 e!80880))

(declare-fun res!60056 () Bool)

(assert (=> d!37145 (=> (not res!60056) (not e!80880))))

(assert (=> d!37145 (= res!60056 (isStrictlySorted!315 lt!63656))))

(assert (=> d!37145 (= lt!63656 e!80881)))

(assert (=> d!37145 (= c!22479 (and ((_ is Cons!1687) (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097)))) (bvslt (_1!1292 (h!2288 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(assert (=> d!37145 (isStrictlySorted!315 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))))))

(assert (=> d!37145 (= (insertStrictlySorted!83 (toList!852 (ite c!22354 call!13103 (ite c!22358 call!13098 call!13097))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (_2!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) lt!63656)))

(declare-fun b!123754 () Bool)

(declare-fun res!60057 () Bool)

(assert (=> b!123754 (=> (not res!60057) (not e!80880))))

(assert (=> b!123754 (= res!60057 (containsKey!168 lt!63656 (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37145 c!22479) b!123758))

(assert (= (and d!37145 (not c!22479)) b!123755))

(assert (= (and b!123755 c!22481) b!123753))

(assert (= (and b!123755 (not c!22481)) b!123759))

(assert (= (and b!123759 c!22480) b!123757))

(assert (= (and b!123759 (not c!22480)) b!123761))

(assert (= (or b!123757 b!123761) bm!13137))

(assert (= (or b!123753 bm!13137) bm!13138))

(assert (= (or b!123758 bm!13138) bm!13139))

(assert (= (and bm!13139 c!22478) b!123762))

(assert (= (and bm!13139 (not c!22478)) b!123760))

(assert (= (and d!37145 res!60056) b!123754))

(assert (= (and b!123754 res!60057) b!123756))

(declare-fun m!143823 () Bool)

(assert (=> bm!13139 m!143823))

(declare-fun m!143825 () Bool)

(assert (=> b!123756 m!143825))

(declare-fun m!143827 () Bool)

(assert (=> b!123754 m!143827))

(declare-fun m!143829 () Bool)

(assert (=> b!123762 m!143829))

(declare-fun m!143831 () Bool)

(assert (=> d!37145 m!143831))

(declare-fun m!143833 () Bool)

(assert (=> d!37145 m!143833))

(assert (=> d!36953 d!37145))

(declare-fun d!37147 () Bool)

(assert (=> d!37147 (= (apply!108 (+!167 lt!63456 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) lt!63455) (apply!108 lt!63456 lt!63455))))

(declare-fun lt!63657 () Unit!3835)

(assert (=> d!37147 (= lt!63657 (choose!742 lt!63456 lt!63464 (zeroValue!2620 newMap!16) lt!63455))))

(declare-fun e!80883 () Bool)

(assert (=> d!37147 e!80883))

(declare-fun res!60058 () Bool)

(assert (=> d!37147 (=> (not res!60058) (not e!80883))))

(assert (=> d!37147 (= res!60058 (contains!869 lt!63456 lt!63455))))

(assert (=> d!37147 (= (addApplyDifferent!84 lt!63456 lt!63464 (zeroValue!2620 newMap!16) lt!63455) lt!63657)))

(declare-fun b!123763 () Bool)

(assert (=> b!123763 (= e!80883 (not (= lt!63455 lt!63464)))))

(assert (= (and d!37147 res!60058) b!123763))

(declare-fun m!143835 () Bool)

(assert (=> d!37147 m!143835))

(assert (=> d!37147 m!143291))

(assert (=> d!37147 m!143309))

(assert (=> d!37147 m!143291))

(assert (=> d!37147 m!143299))

(declare-fun m!143837 () Bool)

(assert (=> d!37147 m!143837))

(assert (=> b!123358 d!37147))

(declare-fun d!37149 () Bool)

(assert (=> d!37149 (= (apply!108 (+!167 lt!63443 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) lt!63454) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63443 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))) lt!63454)))))

(declare-fun bs!5129 () Bool)

(assert (= bs!5129 d!37149))

(declare-fun m!143839 () Bool)

(assert (=> bs!5129 m!143839))

(assert (=> bs!5129 m!143839))

(declare-fun m!143841 () Bool)

(assert (=> bs!5129 m!143841))

(assert (=> b!123358 d!37149))

(declare-fun d!37151 () Bool)

(assert (=> d!37151 (= (apply!108 (+!167 lt!63456 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) lt!63455) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63456 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))) lt!63455)))))

(declare-fun bs!5130 () Bool)

(assert (= bs!5130 d!37151))

(declare-fun m!143843 () Bool)

(assert (=> bs!5130 m!143843))

(assert (=> bs!5130 m!143843))

(declare-fun m!143845 () Bool)

(assert (=> bs!5130 m!143845))

(assert (=> b!123358 d!37151))

(declare-fun d!37153 () Bool)

(declare-fun e!80884 () Bool)

(assert (=> d!37153 e!80884))

(declare-fun res!60059 () Bool)

(assert (=> d!37153 (=> (not res!60059) (not e!80884))))

(declare-fun lt!63660 () ListLongMap!1673)

(assert (=> d!37153 (= res!60059 (contains!869 lt!63660 (_1!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))))))

(declare-fun lt!63659 () List!1691)

(assert (=> d!37153 (= lt!63660 (ListLongMap!1674 lt!63659))))

(declare-fun lt!63658 () Unit!3835)

(declare-fun lt!63661 () Unit!3835)

(assert (=> d!37153 (= lt!63658 lt!63661)))

(assert (=> d!37153 (= (getValueByKey!164 lt!63659 (_1!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))))))

(assert (=> d!37153 (= lt!63661 (lemmaContainsTupThenGetReturnValue!80 lt!63659 (_1!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))))))

(assert (=> d!37153 (= lt!63659 (insertStrictlySorted!83 (toList!852 lt!63443) (_1!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))))))

(assert (=> d!37153 (= (+!167 lt!63443 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) lt!63660)))

(declare-fun b!123764 () Bool)

(declare-fun res!60060 () Bool)

(assert (=> b!123764 (=> (not res!60060) (not e!80884))))

(assert (=> b!123764 (= res!60060 (= (getValueByKey!164 (toList!852 lt!63660) (_1!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))))))))

(declare-fun b!123765 () Bool)

(assert (=> b!123765 (= e!80884 (contains!870 (toList!852 lt!63660) (tuple2!2563 lt!63451 (minValue!2620 newMap!16))))))

(assert (= (and d!37153 res!60059) b!123764))

(assert (= (and b!123764 res!60060) b!123765))

(declare-fun m!143847 () Bool)

(assert (=> d!37153 m!143847))

(declare-fun m!143849 () Bool)

(assert (=> d!37153 m!143849))

(declare-fun m!143851 () Bool)

(assert (=> d!37153 m!143851))

(declare-fun m!143853 () Bool)

(assert (=> d!37153 m!143853))

(declare-fun m!143855 () Bool)

(assert (=> b!123764 m!143855))

(declare-fun m!143857 () Bool)

(assert (=> b!123765 m!143857))

(assert (=> b!123358 d!37153))

(declare-fun d!37155 () Bool)

(assert (=> d!37155 (= (apply!108 (+!167 lt!63461 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) lt!63448) (get!1426 (getValueByKey!164 (toList!852 (+!167 lt!63461 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))) lt!63448)))))

(declare-fun bs!5131 () Bool)

(assert (= bs!5131 d!37155))

(declare-fun m!143859 () Bool)

(assert (=> bs!5131 m!143859))

(assert (=> bs!5131 m!143859))

(declare-fun m!143861 () Bool)

(assert (=> bs!5131 m!143861))

(assert (=> b!123358 d!37155))

(declare-fun d!37157 () Bool)

(assert (=> d!37157 (= (apply!108 lt!63443 lt!63454) (get!1426 (getValueByKey!164 (toList!852 lt!63443) lt!63454)))))

(declare-fun bs!5132 () Bool)

(assert (= bs!5132 d!37157))

(declare-fun m!143863 () Bool)

(assert (=> bs!5132 m!143863))

(assert (=> bs!5132 m!143863))

(declare-fun m!143865 () Bool)

(assert (=> bs!5132 m!143865))

(assert (=> b!123358 d!37157))

(declare-fun d!37159 () Bool)

(assert (=> d!37159 (= (apply!108 lt!63456 lt!63455) (get!1426 (getValueByKey!164 (toList!852 lt!63456) lt!63455)))))

(declare-fun bs!5133 () Bool)

(assert (= bs!5133 d!37159))

(declare-fun m!143867 () Bool)

(assert (=> bs!5133 m!143867))

(assert (=> bs!5133 m!143867))

(declare-fun m!143869 () Bool)

(assert (=> bs!5133 m!143869))

(assert (=> b!123358 d!37159))

(declare-fun d!37161 () Bool)

(declare-fun e!80885 () Bool)

(assert (=> d!37161 e!80885))

(declare-fun res!60061 () Bool)

(assert (=> d!37161 (=> (not res!60061) (not e!80885))))

(declare-fun lt!63664 () ListLongMap!1673)

(assert (=> d!37161 (= res!60061 (contains!869 lt!63664 (_1!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))))))

(declare-fun lt!63663 () List!1691)

(assert (=> d!37161 (= lt!63664 (ListLongMap!1674 lt!63663))))

(declare-fun lt!63662 () Unit!3835)

(declare-fun lt!63665 () Unit!3835)

(assert (=> d!37161 (= lt!63662 lt!63665)))

(assert (=> d!37161 (= (getValueByKey!164 lt!63663 (_1!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37161 (= lt!63665 (lemmaContainsTupThenGetReturnValue!80 lt!63663 (_1!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37161 (= lt!63663 (insertStrictlySorted!83 (toList!852 lt!63450) (_1!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37161 (= (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) lt!63664)))

(declare-fun b!123766 () Bool)

(declare-fun res!60062 () Bool)

(assert (=> b!123766 (=> (not res!60062) (not e!80885))))

(assert (=> b!123766 (= res!60062 (= (getValueByKey!164 (toList!852 lt!63664) (_1!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))))))))

(declare-fun b!123767 () Bool)

(assert (=> b!123767 (= e!80885 (contains!870 (toList!852 lt!63664) (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))))))

(assert (= (and d!37161 res!60061) b!123766))

(assert (= (and b!123766 res!60062) b!123767))

(declare-fun m!143871 () Bool)

(assert (=> d!37161 m!143871))

(declare-fun m!143873 () Bool)

(assert (=> d!37161 m!143873))

(declare-fun m!143875 () Bool)

(assert (=> d!37161 m!143875))

(declare-fun m!143877 () Bool)

(assert (=> d!37161 m!143877))

(declare-fun m!143879 () Bool)

(assert (=> b!123766 m!143879))

(declare-fun m!143881 () Bool)

(assert (=> b!123767 m!143881))

(assert (=> b!123358 d!37161))

(declare-fun d!37163 () Bool)

(assert (=> d!37163 (= (apply!108 lt!63461 lt!63448) (get!1426 (getValueByKey!164 (toList!852 lt!63461) lt!63448)))))

(declare-fun bs!5134 () Bool)

(assert (= bs!5134 d!37163))

(declare-fun m!143883 () Bool)

(assert (=> bs!5134 m!143883))

(assert (=> bs!5134 m!143883))

(declare-fun m!143885 () Bool)

(assert (=> bs!5134 m!143885))

(assert (=> b!123358 d!37163))

(declare-fun d!37165 () Bool)

(declare-fun e!80886 () Bool)

(assert (=> d!37165 e!80886))

(declare-fun res!60063 () Bool)

(assert (=> d!37165 (=> res!60063 e!80886)))

(declare-fun lt!63669 () Bool)

(assert (=> d!37165 (= res!60063 (not lt!63669))))

(declare-fun lt!63667 () Bool)

(assert (=> d!37165 (= lt!63669 lt!63667)))

(declare-fun lt!63666 () Unit!3835)

(declare-fun e!80887 () Unit!3835)

(assert (=> d!37165 (= lt!63666 e!80887)))

(declare-fun c!22482 () Bool)

(assert (=> d!37165 (= c!22482 lt!63667)))

(assert (=> d!37165 (= lt!63667 (containsKey!168 (toList!852 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) lt!63462))))

(assert (=> d!37165 (= (contains!869 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) lt!63462) lt!63669)))

(declare-fun b!123768 () Bool)

(declare-fun lt!63668 () Unit!3835)

(assert (=> b!123768 (= e!80887 lt!63668)))

(assert (=> b!123768 (= lt!63668 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) lt!63462))))

(assert (=> b!123768 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) lt!63462))))

(declare-fun b!123769 () Bool)

(declare-fun Unit!3851 () Unit!3835)

(assert (=> b!123769 (= e!80887 Unit!3851)))

(declare-fun b!123770 () Bool)

(assert (=> b!123770 (= e!80886 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16)))) lt!63462)))))

(assert (= (and d!37165 c!22482) b!123768))

(assert (= (and d!37165 (not c!22482)) b!123769))

(assert (= (and d!37165 (not res!60063)) b!123770))

(declare-fun m!143887 () Bool)

(assert (=> d!37165 m!143887))

(declare-fun m!143889 () Bool)

(assert (=> b!123768 m!143889))

(declare-fun m!143891 () Bool)

(assert (=> b!123768 m!143891))

(assert (=> b!123768 m!143891))

(declare-fun m!143893 () Bool)

(assert (=> b!123768 m!143893))

(assert (=> b!123770 m!143891))

(assert (=> b!123770 m!143891))

(assert (=> b!123770 m!143893))

(assert (=> b!123358 d!37165))

(declare-fun d!37167 () Bool)

(assert (=> d!37167 (= (apply!108 (+!167 lt!63461 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) lt!63448) (apply!108 lt!63461 lt!63448))))

(declare-fun lt!63670 () Unit!3835)

(assert (=> d!37167 (= lt!63670 (choose!742 lt!63461 lt!63458 (minValue!2620 newMap!16) lt!63448))))

(declare-fun e!80888 () Bool)

(assert (=> d!37167 e!80888))

(declare-fun res!60064 () Bool)

(assert (=> d!37167 (=> (not res!60064) (not e!80888))))

(assert (=> d!37167 (= res!60064 (contains!869 lt!63461 lt!63448))))

(assert (=> d!37167 (= (addApplyDifferent!84 lt!63461 lt!63458 (minValue!2620 newMap!16) lt!63448) lt!63670)))

(declare-fun b!123771 () Bool)

(assert (=> b!123771 (= e!80888 (not (= lt!63448 lt!63458)))))

(assert (= (and d!37167 res!60064) b!123771))

(declare-fun m!143895 () Bool)

(assert (=> d!37167 m!143895))

(assert (=> d!37167 m!143301))

(assert (=> d!37167 m!143293))

(assert (=> d!37167 m!143301))

(assert (=> d!37167 m!143303))

(declare-fun m!143897 () Bool)

(assert (=> d!37167 m!143897))

(assert (=> b!123358 d!37167))

(declare-fun d!37169 () Bool)

(declare-fun e!80889 () Bool)

(assert (=> d!37169 e!80889))

(declare-fun res!60065 () Bool)

(assert (=> d!37169 (=> (not res!60065) (not e!80889))))

(declare-fun lt!63673 () ListLongMap!1673)

(assert (=> d!37169 (= res!60065 (contains!869 lt!63673 (_1!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))))))

(declare-fun lt!63672 () List!1691)

(assert (=> d!37169 (= lt!63673 (ListLongMap!1674 lt!63672))))

(declare-fun lt!63671 () Unit!3835)

(declare-fun lt!63674 () Unit!3835)

(assert (=> d!37169 (= lt!63671 lt!63674)))

(assert (=> d!37169 (= (getValueByKey!164 lt!63672 (_1!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))))))

(assert (=> d!37169 (= lt!63674 (lemmaContainsTupThenGetReturnValue!80 lt!63672 (_1!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))))))

(assert (=> d!37169 (= lt!63672 (insertStrictlySorted!83 (toList!852 lt!63461) (_1!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))))))

(assert (=> d!37169 (= (+!167 lt!63461 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))) lt!63673)))

(declare-fun b!123772 () Bool)

(declare-fun res!60066 () Bool)

(assert (=> b!123772 (=> (not res!60066) (not e!80889))))

(assert (=> b!123772 (= res!60066 (= (getValueByKey!164 (toList!852 lt!63673) (_1!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63458 (minValue!2620 newMap!16))))))))

(declare-fun b!123773 () Bool)

(assert (=> b!123773 (= e!80889 (contains!870 (toList!852 lt!63673) (tuple2!2563 lt!63458 (minValue!2620 newMap!16))))))

(assert (= (and d!37169 res!60065) b!123772))

(assert (= (and b!123772 res!60066) b!123773))

(declare-fun m!143899 () Bool)

(assert (=> d!37169 m!143899))

(declare-fun m!143901 () Bool)

(assert (=> d!37169 m!143901))

(declare-fun m!143903 () Bool)

(assert (=> d!37169 m!143903))

(declare-fun m!143905 () Bool)

(assert (=> d!37169 m!143905))

(declare-fun m!143907 () Bool)

(assert (=> b!123772 m!143907))

(declare-fun m!143909 () Bool)

(assert (=> b!123773 m!143909))

(assert (=> b!123358 d!37169))

(declare-fun d!37171 () Bool)

(declare-fun e!80890 () Bool)

(assert (=> d!37171 e!80890))

(declare-fun res!60067 () Bool)

(assert (=> d!37171 (=> (not res!60067) (not e!80890))))

(declare-fun lt!63677 () ListLongMap!1673)

(assert (=> d!37171 (= res!60067 (contains!869 lt!63677 (_1!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))))))

(declare-fun lt!63676 () List!1691)

(assert (=> d!37171 (= lt!63677 (ListLongMap!1674 lt!63676))))

(declare-fun lt!63675 () Unit!3835)

(declare-fun lt!63678 () Unit!3835)

(assert (=> d!37171 (= lt!63675 lt!63678)))

(assert (=> d!37171 (= (getValueByKey!164 lt!63676 (_1!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37171 (= lt!63678 (lemmaContainsTupThenGetReturnValue!80 lt!63676 (_1!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37171 (= lt!63676 (insertStrictlySorted!83 (toList!852 lt!63456) (_1!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) (_2!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))))))

(assert (=> d!37171 (= (+!167 lt!63456 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))) lt!63677)))

(declare-fun b!123774 () Bool)

(declare-fun res!60068 () Bool)

(assert (=> b!123774 (=> (not res!60068) (not e!80890))))

(assert (=> b!123774 (= res!60068 (= (getValueByKey!164 (toList!852 lt!63677) (_1!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16)))) (Some!169 (_2!1292 (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))))))))

(declare-fun b!123775 () Bool)

(assert (=> b!123775 (= e!80890 (contains!870 (toList!852 lt!63677) (tuple2!2563 lt!63464 (zeroValue!2620 newMap!16))))))

(assert (= (and d!37171 res!60067) b!123774))

(assert (= (and b!123774 res!60068) b!123775))

(declare-fun m!143911 () Bool)

(assert (=> d!37171 m!143911))

(declare-fun m!143913 () Bool)

(assert (=> d!37171 m!143913))

(declare-fun m!143915 () Bool)

(assert (=> d!37171 m!143915))

(declare-fun m!143917 () Bool)

(assert (=> d!37171 m!143917))

(declare-fun m!143919 () Bool)

(assert (=> b!123774 m!143919))

(declare-fun m!143921 () Bool)

(assert (=> b!123775 m!143921))

(assert (=> b!123358 d!37171))

(declare-fun d!37173 () Bool)

(assert (=> d!37173 (= (apply!108 (+!167 lt!63443 (tuple2!2563 lt!63451 (minValue!2620 newMap!16))) lt!63454) (apply!108 lt!63443 lt!63454))))

(declare-fun lt!63679 () Unit!3835)

(assert (=> d!37173 (= lt!63679 (choose!742 lt!63443 lt!63451 (minValue!2620 newMap!16) lt!63454))))

(declare-fun e!80891 () Bool)

(assert (=> d!37173 e!80891))

(declare-fun res!60069 () Bool)

(assert (=> d!37173 (=> (not res!60069) (not e!80891))))

(assert (=> d!37173 (= res!60069 (contains!869 lt!63443 lt!63454))))

(assert (=> d!37173 (= (addApplyDifferent!84 lt!63443 lt!63451 (minValue!2620 newMap!16) lt!63454) lt!63679)))

(declare-fun b!123776 () Bool)

(assert (=> b!123776 (= e!80891 (not (= lt!63454 lt!63451)))))

(assert (= (and d!37173 res!60069) b!123776))

(declare-fun m!143923 () Bool)

(assert (=> d!37173 m!143923))

(assert (=> d!37173 m!143285))

(assert (=> d!37173 m!143289))

(assert (=> d!37173 m!143285))

(assert (=> d!37173 m!143287))

(declare-fun m!143925 () Bool)

(assert (=> d!37173 m!143925))

(assert (=> b!123358 d!37173))

(declare-fun d!37175 () Bool)

(assert (=> d!37175 (contains!869 (+!167 lt!63450 (tuple2!2563 lt!63445 (zeroValue!2620 newMap!16))) lt!63462)))

(declare-fun lt!63680 () Unit!3835)

(assert (=> d!37175 (= lt!63680 (choose!743 lt!63450 lt!63445 (zeroValue!2620 newMap!16) lt!63462))))

(assert (=> d!37175 (contains!869 lt!63450 lt!63462)))

(assert (=> d!37175 (= (addStillContains!84 lt!63450 lt!63445 (zeroValue!2620 newMap!16) lt!63462) lt!63680)))

(declare-fun bs!5135 () Bool)

(assert (= bs!5135 d!37175))

(assert (=> bs!5135 m!143305))

(assert (=> bs!5135 m!143305))

(assert (=> bs!5135 m!143307))

(declare-fun m!143927 () Bool)

(assert (=> bs!5135 m!143927))

(declare-fun m!143929 () Bool)

(assert (=> bs!5135 m!143929))

(assert (=> b!123358 d!37175))

(assert (=> b!123358 d!37115))

(declare-fun b!123777 () Bool)

(declare-fun e!80894 () Bool)

(declare-fun call!13143 () Bool)

(assert (=> b!123777 (= e!80894 call!13143)))

(declare-fun b!123778 () Bool)

(declare-fun e!80892 () Bool)

(assert (=> b!123778 (= e!80894 e!80892)))

(declare-fun lt!63683 () (_ BitVec 64))

(assert (=> b!123778 (= lt!63683 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!63681 () Unit!3835)

(assert (=> b!123778 (= lt!63681 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4482 newMap!16) lt!63683 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!123778 (arrayContainsKey!0 (_keys!4482 newMap!16) lt!63683 #b00000000000000000000000000000000)))

(declare-fun lt!63682 () Unit!3835)

(assert (=> b!123778 (= lt!63682 lt!63681)))

(declare-fun res!60070 () Bool)

(assert (=> b!123778 (= res!60070 (= (seekEntryOrOpen!0 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4482 newMap!16) (mask!6993 newMap!16)) (Found!267 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!123778 (=> (not res!60070) (not e!80892))))

(declare-fun b!123779 () Bool)

(assert (=> b!123779 (= e!80892 call!13143)))

(declare-fun b!123780 () Bool)

(declare-fun e!80893 () Bool)

(assert (=> b!123780 (= e!80893 e!80894)))

(declare-fun c!22483 () Bool)

(assert (=> b!123780 (= c!22483 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13140 () Bool)

(assert (=> bm!13140 (= call!13143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4482 newMap!16) (mask!6993 newMap!16)))))

(declare-fun d!37177 () Bool)

(declare-fun res!60071 () Bool)

(assert (=> d!37177 (=> res!60071 e!80893)))

(assert (=> d!37177 (= res!60071 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!37177 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4482 newMap!16) (mask!6993 newMap!16)) e!80893)))

(assert (= (and d!37177 (not res!60071)) b!123780))

(assert (= (and b!123780 c!22483) b!123778))

(assert (= (and b!123780 (not c!22483)) b!123777))

(assert (= (and b!123778 res!60070) b!123779))

(assert (= (or b!123779 b!123777) bm!13140))

(assert (=> b!123778 m!143775))

(declare-fun m!143931 () Bool)

(assert (=> b!123778 m!143931))

(declare-fun m!143933 () Bool)

(assert (=> b!123778 m!143933))

(assert (=> b!123778 m!143775))

(declare-fun m!143935 () Bool)

(assert (=> b!123778 m!143935))

(assert (=> b!123780 m!143775))

(assert (=> b!123780 m!143775))

(assert (=> b!123780 m!143777))

(declare-fun m!143937 () Bool)

(assert (=> bm!13140 m!143937))

(assert (=> bm!13110 d!37177))

(declare-fun d!37179 () Bool)

(assert (=> d!37179 (= (get!1427 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3091 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123500 d!37179))

(assert (=> b!123391 d!37071))

(assert (=> b!123473 d!37061))

(assert (=> b!123430 d!37001))

(declare-fun d!37181 () Bool)

(assert (=> d!37181 (= (get!1426 (getValueByKey!164 (toList!852 lt!63421) lt!63432)) (v!3094 (getValueByKey!164 (toList!852 lt!63421) lt!63432)))))

(assert (=> d!36965 d!37181))

(declare-fun d!37183 () Bool)

(declare-fun c!22484 () Bool)

(assert (=> d!37183 (= c!22484 (and ((_ is Cons!1687) (toList!852 lt!63421)) (= (_1!1292 (h!2288 (toList!852 lt!63421))) lt!63432)))))

(declare-fun e!80895 () Option!170)

(assert (=> d!37183 (= (getValueByKey!164 (toList!852 lt!63421) lt!63432) e!80895)))

(declare-fun b!123782 () Bool)

(declare-fun e!80896 () Option!170)

(assert (=> b!123782 (= e!80895 e!80896)))

(declare-fun c!22485 () Bool)

(assert (=> b!123782 (= c!22485 (and ((_ is Cons!1687) (toList!852 lt!63421)) (not (= (_1!1292 (h!2288 (toList!852 lt!63421))) lt!63432))))))

(declare-fun b!123783 () Bool)

(assert (=> b!123783 (= e!80896 (getValueByKey!164 (t!5990 (toList!852 lt!63421)) lt!63432))))

(declare-fun b!123784 () Bool)

(assert (=> b!123784 (= e!80896 None!168)))

(declare-fun b!123781 () Bool)

(assert (=> b!123781 (= e!80895 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63421)))))))

(assert (= (and d!37183 c!22484) b!123781))

(assert (= (and d!37183 (not c!22484)) b!123782))

(assert (= (and b!123782 c!22485) b!123783))

(assert (= (and b!123782 (not c!22485)) b!123784))

(declare-fun m!143939 () Bool)

(assert (=> b!123783 m!143939))

(assert (=> d!36965 d!37183))

(declare-fun c!22486 () Bool)

(declare-fun d!37185 () Bool)

(assert (=> d!37185 (= c!22486 (and ((_ is Cons!1687) (toList!852 lt!63521)) (= (_1!1292 (h!2288 (toList!852 lt!63521))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun e!80897 () Option!170)

(assert (=> d!37185 (= (getValueByKey!164 (toList!852 lt!63521) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))) e!80897)))

(declare-fun b!123786 () Bool)

(declare-fun e!80898 () Option!170)

(assert (=> b!123786 (= e!80897 e!80898)))

(declare-fun c!22487 () Bool)

(assert (=> b!123786 (= c!22487 (and ((_ is Cons!1687) (toList!852 lt!63521)) (not (= (_1!1292 (h!2288 (toList!852 lt!63521))) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))))

(declare-fun b!123787 () Bool)

(assert (=> b!123787 (= e!80898 (getValueByKey!164 (t!5990 (toList!852 lt!63521)) (_1!1292 (ite (or c!22354 c!22358) (tuple2!2563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))) (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123788 () Bool)

(assert (=> b!123788 (= e!80898 None!168)))

(declare-fun b!123785 () Bool)

(assert (=> b!123785 (= e!80897 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63521)))))))

(assert (= (and d!37185 c!22486) b!123785))

(assert (= (and d!37185 (not c!22486)) b!123786))

(assert (= (and b!123786 c!22487) b!123787))

(assert (= (and b!123786 (not c!22487)) b!123788))

(declare-fun m!143941 () Bool)

(assert (=> b!123787 m!143941))

(assert (=> b!123449 d!37185))

(declare-fun lt!63684 () Bool)

(declare-fun d!37187 () Bool)

(assert (=> d!37187 (= lt!63684 (select (content!121 (toList!852 lt!63544)) (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80900 () Bool)

(assert (=> d!37187 (= lt!63684 e!80900)))

(declare-fun res!60073 () Bool)

(assert (=> d!37187 (=> (not res!60073) (not e!80900))))

(assert (=> d!37187 (= res!60073 ((_ is Cons!1687) (toList!852 lt!63544)))))

(assert (=> d!37187 (= (contains!870 (toList!852 lt!63544) (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63684)))

(declare-fun b!123789 () Bool)

(declare-fun e!80899 () Bool)

(assert (=> b!123789 (= e!80900 e!80899)))

(declare-fun res!60072 () Bool)

(assert (=> b!123789 (=> res!60072 e!80899)))

(assert (=> b!123789 (= res!60072 (= (h!2288 (toList!852 lt!63544)) (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123790 () Bool)

(assert (=> b!123790 (= e!80899 (contains!870 (t!5990 (toList!852 lt!63544)) (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!37187 res!60073) b!123789))

(assert (= (and b!123789 (not res!60072)) b!123790))

(declare-fun m!143943 () Bool)

(assert (=> d!37187 m!143943))

(declare-fun m!143945 () Bool)

(assert (=> d!37187 m!143945))

(declare-fun m!143947 () Bool)

(assert (=> b!123790 m!143947))

(assert (=> b!123488 d!37187))

(declare-fun d!37189 () Bool)

(declare-fun res!60074 () Bool)

(declare-fun e!80903 () Bool)

(assert (=> d!37189 (=> res!60074 e!80903)))

(assert (=> d!37189 (= res!60074 (bvsge #b00000000000000000000000000000000 (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992))))))))

(assert (=> d!37189 (= (arrayNoDuplicates!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000 Nil!1689) e!80903)))

(declare-fun b!123791 () Bool)

(declare-fun e!80904 () Bool)

(assert (=> b!123791 (= e!80903 e!80904)))

(declare-fun res!60075 () Bool)

(assert (=> b!123791 (=> (not res!60075) (not e!80904))))

(declare-fun e!80901 () Bool)

(assert (=> b!123791 (= res!60075 (not e!80901))))

(declare-fun res!60076 () Bool)

(assert (=> b!123791 (=> (not res!60076) (not e!80901))))

(assert (=> b!123791 (= res!60076 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!123792 () Bool)

(assert (=> b!123792 (= e!80901 (contains!871 Nil!1689 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!123793 () Bool)

(declare-fun e!80902 () Bool)

(declare-fun call!13144 () Bool)

(assert (=> b!123793 (= e!80902 call!13144)))

(declare-fun b!123794 () Bool)

(assert (=> b!123794 (= e!80902 call!13144)))

(declare-fun bm!13141 () Bool)

(declare-fun c!22488 () Bool)

(assert (=> bm!13141 (= call!13144 (arrayNoDuplicates!0 (_keys!4482 (v!3092 (underlying!431 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22488 (Cons!1688 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000) Nil!1689) Nil!1689)))))

(declare-fun b!123795 () Bool)

(assert (=> b!123795 (= e!80904 e!80902)))

(assert (=> b!123795 (= c!22488 (validKeyInArray!0 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37189 (not res!60074)) b!123791))

(assert (= (and b!123791 res!60076) b!123792))

(assert (= (and b!123791 res!60075) b!123795))

(assert (= (and b!123795 c!22488) b!123794))

(assert (= (and b!123795 (not c!22488)) b!123793))

(assert (= (or b!123794 b!123793) bm!13141))

(assert (=> b!123791 m!143545))

(assert (=> b!123791 m!143545))

(assert (=> b!123791 m!143553))

(assert (=> b!123792 m!143545))

(assert (=> b!123792 m!143545))

(declare-fun m!143949 () Bool)

(assert (=> b!123792 m!143949))

(assert (=> bm!13141 m!143545))

(declare-fun m!143951 () Bool)

(assert (=> bm!13141 m!143951))

(assert (=> b!123795 m!143545))

(assert (=> b!123795 m!143545))

(assert (=> b!123795 m!143553))

(assert (=> b!123507 d!37189))

(declare-fun d!37191 () Bool)

(declare-fun e!80905 () Bool)

(assert (=> d!37191 e!80905))

(declare-fun res!60077 () Bool)

(assert (=> d!37191 (=> res!60077 e!80905)))

(declare-fun lt!63688 () Bool)

(assert (=> d!37191 (= res!60077 (not lt!63688))))

(declare-fun lt!63686 () Bool)

(assert (=> d!37191 (= lt!63688 lt!63686)))

(declare-fun lt!63685 () Unit!3835)

(declare-fun e!80906 () Unit!3835)

(assert (=> d!37191 (= lt!63685 e!80906)))

(declare-fun c!22489 () Bool)

(assert (=> d!37191 (= c!22489 lt!63686)))

(assert (=> d!37191 (= lt!63686 (containsKey!168 (toList!852 lt!63516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37191 (= (contains!869 lt!63516 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63688)))

(declare-fun b!123796 () Bool)

(declare-fun lt!63687 () Unit!3835)

(assert (=> b!123796 (= e!80906 lt!63687)))

(assert (=> b!123796 (= lt!63687 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123796 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123797 () Bool)

(declare-fun Unit!3852 () Unit!3835)

(assert (=> b!123797 (= e!80906 Unit!3852)))

(declare-fun b!123798 () Bool)

(assert (=> b!123798 (= e!80905 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37191 c!22489) b!123796))

(assert (= (and d!37191 (not c!22489)) b!123797))

(assert (= (and d!37191 (not res!60077)) b!123798))

(declare-fun m!143953 () Bool)

(assert (=> d!37191 m!143953))

(declare-fun m!143955 () Bool)

(assert (=> b!123796 m!143955))

(declare-fun m!143957 () Bool)

(assert (=> b!123796 m!143957))

(assert (=> b!123796 m!143957))

(declare-fun m!143959 () Bool)

(assert (=> b!123796 m!143959))

(assert (=> b!123798 m!143957))

(assert (=> b!123798 m!143957))

(assert (=> b!123798 m!143959))

(assert (=> b!123426 d!37191))

(declare-fun d!37193 () Bool)

(declare-fun c!22490 () Bool)

(assert (=> d!37193 (= c!22490 (and ((_ is Cons!1687) (toList!852 lt!63496)) (= (_1!1292 (h!2288 (toList!852 lt!63496))) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80907 () Option!170)

(assert (=> d!37193 (= (getValueByKey!164 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80907)))

(declare-fun b!123800 () Bool)

(declare-fun e!80908 () Option!170)

(assert (=> b!123800 (= e!80907 e!80908)))

(declare-fun c!22491 () Bool)

(assert (=> b!123800 (= c!22491 (and ((_ is Cons!1687) (toList!852 lt!63496)) (not (= (_1!1292 (h!2288 (toList!852 lt!63496))) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123801 () Bool)

(assert (=> b!123801 (= e!80908 (getValueByKey!164 (t!5990 (toList!852 lt!63496)) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123802 () Bool)

(assert (=> b!123802 (= e!80908 None!168)))

(declare-fun b!123799 () Bool)

(assert (=> b!123799 (= e!80907 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63496)))))))

(assert (= (and d!37193 c!22490) b!123799))

(assert (= (and d!37193 (not c!22490)) b!123800))

(assert (= (and b!123800 c!22491) b!123801))

(assert (= (and b!123800 (not c!22491)) b!123802))

(declare-fun m!143961 () Bool)

(assert (=> b!123801 m!143961))

(assert (=> b!123396 d!37193))

(assert (=> b!123428 d!37001))

(declare-fun d!37195 () Bool)

(assert (=> d!37195 (= (apply!108 lt!63444 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) (get!1426 (getValueByKey!164 (toList!852 lt!63444) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5136 () Bool)

(assert (= bs!5136 d!37195))

(assert (=> bs!5136 m!143259))

(declare-fun m!143963 () Bool)

(assert (=> bs!5136 m!143963))

(assert (=> bs!5136 m!143963))

(declare-fun m!143965 () Bool)

(assert (=> bs!5136 m!143965))

(assert (=> b!123356 d!37195))

(declare-fun d!37197 () Bool)

(declare-fun c!22492 () Bool)

(assert (=> d!37197 (= c!22492 ((_ is ValueCellFull!1068) (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80909 () V!3411)

(assert (=> d!37197 (= (get!1425 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80909)))

(declare-fun b!123803 () Bool)

(assert (=> b!123803 (= e!80909 (get!1427 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123804 () Bool)

(assert (=> b!123804 (= e!80909 (get!1428 (select (arr!2208 (_values!2738 newMap!16)) #b00000000000000000000000000000000) (dynLambda!409 (defaultEntry!2755 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37197 c!22492) b!123803))

(assert (= (and d!37197 (not c!22492)) b!123804))

(assert (=> b!123803 m!143279))

(assert (=> b!123803 m!143275))

(declare-fun m!143967 () Bool)

(assert (=> b!123803 m!143967))

(assert (=> b!123804 m!143279))

(assert (=> b!123804 m!143275))

(declare-fun m!143969 () Bool)

(assert (=> b!123804 m!143969))

(assert (=> b!123356 d!37197))

(declare-fun d!37199 () Bool)

(declare-fun e!80910 () Bool)

(assert (=> d!37199 e!80910))

(declare-fun res!60078 () Bool)

(assert (=> d!37199 (=> res!60078 e!80910)))

(declare-fun lt!63692 () Bool)

(assert (=> d!37199 (= res!60078 (not lt!63692))))

(declare-fun lt!63690 () Bool)

(assert (=> d!37199 (= lt!63692 lt!63690)))

(declare-fun lt!63689 () Unit!3835)

(declare-fun e!80911 () Unit!3835)

(assert (=> d!37199 (= lt!63689 e!80911)))

(declare-fun c!22493 () Bool)

(assert (=> d!37199 (= c!22493 lt!63690)))

(assert (=> d!37199 (= lt!63690 (containsKey!168 (toList!852 lt!63516) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37199 (= (contains!869 lt!63516 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63692)))

(declare-fun b!123805 () Bool)

(declare-fun lt!63691 () Unit!3835)

(assert (=> b!123805 (= e!80911 lt!63691)))

(assert (=> b!123805 (= lt!63691 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63516) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123805 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123806 () Bool)

(declare-fun Unit!3853 () Unit!3835)

(assert (=> b!123806 (= e!80911 Unit!3853)))

(declare-fun b!123807 () Bool)

(assert (=> b!123807 (= e!80910 (isDefined!117 (getValueByKey!164 (toList!852 lt!63516) (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37199 c!22493) b!123805))

(assert (= (and d!37199 (not c!22493)) b!123806))

(assert (= (and d!37199 (not res!60078)) b!123807))

(assert (=> d!37199 m!143193))

(declare-fun m!143971 () Bool)

(assert (=> d!37199 m!143971))

(assert (=> b!123805 m!143193))

(declare-fun m!143973 () Bool)

(assert (=> b!123805 m!143973))

(assert (=> b!123805 m!143193))

(assert (=> b!123805 m!143603))

(assert (=> b!123805 m!143603))

(declare-fun m!143975 () Bool)

(assert (=> b!123805 m!143975))

(assert (=> b!123807 m!143193))

(assert (=> b!123807 m!143603))

(assert (=> b!123807 m!143603))

(assert (=> b!123807 m!143975))

(assert (=> b!123433 d!37199))

(declare-fun d!37201 () Bool)

(declare-fun e!80912 () Bool)

(assert (=> d!37201 e!80912))

(declare-fun res!60079 () Bool)

(assert (=> d!37201 (=> (not res!60079) (not e!80912))))

(declare-fun lt!63695 () ListLongMap!1673)

(assert (=> d!37201 (= res!60079 (contains!869 lt!63695 (_1!1292 (tuple2!2563 lt!63517 lt!63518))))))

(declare-fun lt!63694 () List!1691)

(assert (=> d!37201 (= lt!63695 (ListLongMap!1674 lt!63694))))

(declare-fun lt!63693 () Unit!3835)

(declare-fun lt!63696 () Unit!3835)

(assert (=> d!37201 (= lt!63693 lt!63696)))

(assert (=> d!37201 (= (getValueByKey!164 lt!63694 (_1!1292 (tuple2!2563 lt!63517 lt!63518))) (Some!169 (_2!1292 (tuple2!2563 lt!63517 lt!63518))))))

(assert (=> d!37201 (= lt!63696 (lemmaContainsTupThenGetReturnValue!80 lt!63694 (_1!1292 (tuple2!2563 lt!63517 lt!63518)) (_2!1292 (tuple2!2563 lt!63517 lt!63518))))))

(assert (=> d!37201 (= lt!63694 (insertStrictlySorted!83 (toList!852 lt!63514) (_1!1292 (tuple2!2563 lt!63517 lt!63518)) (_2!1292 (tuple2!2563 lt!63517 lt!63518))))))

(assert (=> d!37201 (= (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518)) lt!63695)))

(declare-fun b!123808 () Bool)

(declare-fun res!60080 () Bool)

(assert (=> b!123808 (=> (not res!60080) (not e!80912))))

(assert (=> b!123808 (= res!60080 (= (getValueByKey!164 (toList!852 lt!63695) (_1!1292 (tuple2!2563 lt!63517 lt!63518))) (Some!169 (_2!1292 (tuple2!2563 lt!63517 lt!63518)))))))

(declare-fun b!123809 () Bool)

(assert (=> b!123809 (= e!80912 (contains!870 (toList!852 lt!63695) (tuple2!2563 lt!63517 lt!63518)))))

(assert (= (and d!37201 res!60079) b!123808))

(assert (= (and b!123808 res!60080) b!123809))

(declare-fun m!143977 () Bool)

(assert (=> d!37201 m!143977))

(declare-fun m!143979 () Bool)

(assert (=> d!37201 m!143979))

(declare-fun m!143981 () Bool)

(assert (=> d!37201 m!143981))

(declare-fun m!143983 () Bool)

(assert (=> d!37201 m!143983))

(declare-fun m!143985 () Bool)

(assert (=> b!123808 m!143985))

(declare-fun m!143987 () Bool)

(assert (=> b!123809 m!143987))

(assert (=> b!123432 d!37201))

(assert (=> b!123432 d!36997))

(declare-fun d!37203 () Bool)

(assert (=> d!37203 (not (contains!869 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518)) lt!63513))))

(declare-fun lt!63699 () Unit!3835)

(declare-fun choose!746 (ListLongMap!1673 (_ BitVec 64) V!3411 (_ BitVec 64)) Unit!3835)

(assert (=> d!37203 (= lt!63699 (choose!746 lt!63514 lt!63517 lt!63518 lt!63513))))

(declare-fun e!80915 () Bool)

(assert (=> d!37203 e!80915))

(declare-fun res!60083 () Bool)

(assert (=> d!37203 (=> (not res!60083) (not e!80915))))

(assert (=> d!37203 (= res!60083 (not (contains!869 lt!63514 lt!63513)))))

(assert (=> d!37203 (= (addStillNotContains!54 lt!63514 lt!63517 lt!63518 lt!63513) lt!63699)))

(declare-fun b!123813 () Bool)

(assert (=> b!123813 (= e!80915 (not (= lt!63517 lt!63513)))))

(assert (= (and d!37203 res!60083) b!123813))

(assert (=> d!37203 m!143351))

(assert (=> d!37203 m!143351))

(assert (=> d!37203 m!143353))

(declare-fun m!143989 () Bool)

(assert (=> d!37203 m!143989))

(declare-fun m!143991 () Bool)

(assert (=> d!37203 m!143991))

(assert (=> b!123432 d!37203))

(declare-fun d!37205 () Bool)

(declare-fun e!80916 () Bool)

(assert (=> d!37205 e!80916))

(declare-fun res!60084 () Bool)

(assert (=> d!37205 (=> res!60084 e!80916)))

(declare-fun lt!63703 () Bool)

(assert (=> d!37205 (= res!60084 (not lt!63703))))

(declare-fun lt!63701 () Bool)

(assert (=> d!37205 (= lt!63703 lt!63701)))

(declare-fun lt!63700 () Unit!3835)

(declare-fun e!80917 () Unit!3835)

(assert (=> d!37205 (= lt!63700 e!80917)))

(declare-fun c!22494 () Bool)

(assert (=> d!37205 (= c!22494 lt!63701)))

(assert (=> d!37205 (= lt!63701 (containsKey!168 (toList!852 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518))) lt!63513))))

(assert (=> d!37205 (= (contains!869 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518)) lt!63513) lt!63703)))

(declare-fun b!123814 () Bool)

(declare-fun lt!63702 () Unit!3835)

(assert (=> b!123814 (= e!80917 lt!63702)))

(assert (=> b!123814 (= lt!63702 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518))) lt!63513))))

(assert (=> b!123814 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518))) lt!63513))))

(declare-fun b!123815 () Bool)

(declare-fun Unit!3854 () Unit!3835)

(assert (=> b!123815 (= e!80917 Unit!3854)))

(declare-fun b!123816 () Bool)

(assert (=> b!123816 (= e!80916 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63514 (tuple2!2563 lt!63517 lt!63518))) lt!63513)))))

(assert (= (and d!37205 c!22494) b!123814))

(assert (= (and d!37205 (not c!22494)) b!123815))

(assert (= (and d!37205 (not res!60084)) b!123816))

(declare-fun m!143993 () Bool)

(assert (=> d!37205 m!143993))

(declare-fun m!143995 () Bool)

(assert (=> b!123814 m!143995))

(declare-fun m!143997 () Bool)

(assert (=> b!123814 m!143997))

(assert (=> b!123814 m!143997))

(declare-fun m!143999 () Bool)

(assert (=> b!123814 m!143999))

(assert (=> b!123816 m!143997))

(assert (=> b!123816 m!143997))

(assert (=> b!123816 m!143999))

(assert (=> b!123432 d!37205))

(declare-fun d!37207 () Bool)

(declare-fun e!80918 () Bool)

(assert (=> d!37207 e!80918))

(declare-fun res!60085 () Bool)

(assert (=> d!37207 (=> (not res!60085) (not e!80918))))

(declare-fun lt!63706 () ListLongMap!1673)

(assert (=> d!37207 (= res!60085 (contains!869 lt!63706 (_1!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!63705 () List!1691)

(assert (=> d!37207 (= lt!63706 (ListLongMap!1674 lt!63705))))

(declare-fun lt!63704 () Unit!3835)

(declare-fun lt!63707 () Unit!3835)

(assert (=> d!37207 (= lt!63704 lt!63707)))

(assert (=> d!37207 (= (getValueByKey!164 lt!63705 (_1!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37207 (= lt!63707 (lemmaContainsTupThenGetReturnValue!80 lt!63705 (_1!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37207 (= lt!63705 (insertStrictlySorted!83 (toList!852 call!13116) (_1!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37207 (= (+!167 call!13116 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!63706)))

(declare-fun b!123817 () Bool)

(declare-fun res!60086 () Bool)

(assert (=> b!123817 (=> (not res!60086) (not e!80918))))

(assert (=> b!123817 (= res!60086 (= (getValueByKey!164 (toList!852 lt!63706) (_1!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1292 (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!123818 () Bool)

(assert (=> b!123818 (= e!80918 (contains!870 (toList!852 lt!63706) (tuple2!2563 (select (arr!2207 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1425 (select (arr!2208 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!409 (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37207 res!60085) b!123817))

(assert (= (and b!123817 res!60086) b!123818))

(declare-fun m!144001 () Bool)

(assert (=> d!37207 m!144001))

(declare-fun m!144003 () Bool)

(assert (=> d!37207 m!144003))

(declare-fun m!144005 () Bool)

(assert (=> d!37207 m!144005))

(declare-fun m!144007 () Bool)

(assert (=> d!37207 m!144007))

(declare-fun m!144009 () Bool)

(assert (=> b!123817 m!144009))

(declare-fun m!144011 () Bool)

(assert (=> b!123818 m!144011))

(assert (=> b!123432 d!37207))

(assert (=> b!123444 d!37071))

(declare-fun d!37209 () Bool)

(assert (=> d!37209 (isDefined!117 (getValueByKey!164 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(declare-fun lt!63708 () Unit!3835)

(assert (=> d!37209 (= lt!63708 (choose!744 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(declare-fun e!80919 () Bool)

(assert (=> d!37209 e!80919))

(declare-fun res!60087 () Bool)

(assert (=> d!37209 (=> (not res!60087) (not e!80919))))

(assert (=> d!37209 (= res!60087 (isStrictlySorted!315 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37209 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440) lt!63708)))

(declare-fun b!123819 () Bool)

(assert (=> b!123819 (= e!80919 (containsKey!168 (toList!852 (+!167 lt!63428 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63440))))

(assert (= (and d!37209 res!60087) b!123819))

(assert (=> d!37209 m!143469))

(assert (=> d!37209 m!143469))

(assert (=> d!37209 m!143471))

(declare-fun m!144013 () Bool)

(assert (=> d!37209 m!144013))

(declare-fun m!144015 () Bool)

(assert (=> d!37209 m!144015))

(assert (=> b!123819 m!143465))

(assert (=> b!123492 d!37209))

(assert (=> b!123492 d!37033))

(assert (=> b!123492 d!37035))

(declare-fun b!123820 () Bool)

(declare-fun res!60088 () Bool)

(declare-fun e!80920 () Bool)

(assert (=> b!123820 (=> (not res!60088) (not e!80920))))

(assert (=> b!123820 (= res!60088 (and (= (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992)))) (bvadd (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001)) (= (size!2469 (_keys!4482 (v!3092 (underlying!431 thiss!992)))) (size!2470 (_values!2738 (v!3092 (underlying!431 thiss!992))))) (bvsge (_size!571 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!571 (v!3092 (underlying!431 thiss!992))) (bvadd (mask!6993 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!123822 () Bool)

(declare-fun res!60090 () Bool)

(assert (=> b!123822 (=> (not res!60090) (not e!80920))))

(assert (=> b!123822 (= res!60090 (= (size!2473 (v!3092 (underlying!431 thiss!992))) (bvadd (_size!571 (v!3092 (underlying!431 thiss!992))) (bvsdiv (bvadd (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123821 () Bool)

(declare-fun res!60091 () Bool)

(assert (=> b!123821 (=> (not res!60091) (not e!80920))))

(assert (=> b!123821 (= res!60091 (bvsge (size!2473 (v!3092 (underlying!431 thiss!992))) (_size!571 (v!3092 (underlying!431 thiss!992)))))))

(declare-fun d!37211 () Bool)

(declare-fun res!60089 () Bool)

(assert (=> d!37211 (=> (not res!60089) (not e!80920))))

(assert (=> d!37211 (= res!60089 (validMask!0 (mask!6993 (v!3092 (underlying!431 thiss!992)))))))

(assert (=> d!37211 (= (simpleValid!84 (v!3092 (underlying!431 thiss!992))) e!80920)))

(declare-fun b!123823 () Bool)

(assert (=> b!123823 (= e!80920 (and (bvsge (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2540 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!571 (v!3092 (underlying!431 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!37211 res!60089) b!123820))

(assert (= (and b!123820 res!60088) b!123821))

(assert (= (and b!123821 res!60091) b!123822))

(assert (= (and b!123822 res!60090) b!123823))

(declare-fun m!144017 () Bool)

(assert (=> b!123822 m!144017))

(assert (=> b!123821 m!144017))

(assert (=> d!37211 m!143247))

(assert (=> d!37003 d!37211))

(declare-fun d!37213 () Bool)

(declare-fun res!60092 () Bool)

(declare-fun e!80921 () Bool)

(assert (=> d!37213 (=> res!60092 e!80921)))

(assert (=> d!37213 (= res!60092 (and ((_ is Cons!1687) (toList!852 lt!63422)) (= (_1!1292 (h!2288 (toList!852 lt!63422))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37213 (= (containsKey!168 (toList!852 lt!63422) #b1000000000000000000000000000000000000000000000000000000000000000) e!80921)))

(declare-fun b!123824 () Bool)

(declare-fun e!80922 () Bool)

(assert (=> b!123824 (= e!80921 e!80922)))

(declare-fun res!60093 () Bool)

(assert (=> b!123824 (=> (not res!60093) (not e!80922))))

(assert (=> b!123824 (= res!60093 (and (or (not ((_ is Cons!1687) (toList!852 lt!63422))) (bvsle (_1!1292 (h!2288 (toList!852 lt!63422))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1687) (toList!852 lt!63422)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63422))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123825 () Bool)

(assert (=> b!123825 (= e!80922 (containsKey!168 (t!5990 (toList!852 lt!63422)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37213 (not res!60092)) b!123824))

(assert (= (and b!123824 res!60093) b!123825))

(declare-fun m!144019 () Bool)

(assert (=> b!123825 m!144019))

(assert (=> d!36941 d!37213))

(assert (=> d!36971 d!36965))

(assert (=> d!36971 d!36975))

(declare-fun d!37215 () Bool)

(declare-fun e!80923 () Bool)

(assert (=> d!37215 e!80923))

(declare-fun res!60094 () Bool)

(assert (=> d!37215 (=> res!60094 e!80923)))

(declare-fun lt!63712 () Bool)

(assert (=> d!37215 (= res!60094 (not lt!63712))))

(declare-fun lt!63710 () Bool)

(assert (=> d!37215 (= lt!63712 lt!63710)))

(declare-fun lt!63709 () Unit!3835)

(declare-fun e!80924 () Unit!3835)

(assert (=> d!37215 (= lt!63709 e!80924)))

(declare-fun c!22495 () Bool)

(assert (=> d!37215 (= c!22495 lt!63710)))

(assert (=> d!37215 (= lt!63710 (containsKey!168 (toList!852 lt!63421) lt!63432))))

(assert (=> d!37215 (= (contains!869 lt!63421 lt!63432) lt!63712)))

(declare-fun b!123826 () Bool)

(declare-fun lt!63711 () Unit!3835)

(assert (=> b!123826 (= e!80924 lt!63711)))

(assert (=> b!123826 (= lt!63711 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63421) lt!63432))))

(assert (=> b!123826 (isDefined!117 (getValueByKey!164 (toList!852 lt!63421) lt!63432))))

(declare-fun b!123827 () Bool)

(declare-fun Unit!3855 () Unit!3835)

(assert (=> b!123827 (= e!80924 Unit!3855)))

(declare-fun b!123828 () Bool)

(assert (=> b!123828 (= e!80923 (isDefined!117 (getValueByKey!164 (toList!852 lt!63421) lt!63432)))))

(assert (= (and d!37215 c!22495) b!123826))

(assert (= (and d!37215 (not c!22495)) b!123827))

(assert (= (and d!37215 (not res!60094)) b!123828))

(declare-fun m!144021 () Bool)

(assert (=> d!37215 m!144021))

(declare-fun m!144023 () Bool)

(assert (=> b!123826 m!144023))

(assert (=> b!123826 m!143397))

(assert (=> b!123826 m!143397))

(declare-fun m!144025 () Bool)

(assert (=> b!123826 m!144025))

(assert (=> b!123828 m!143397))

(assert (=> b!123828 m!143397))

(assert (=> b!123828 m!144025))

(assert (=> d!36971 d!37215))

(declare-fun d!37217 () Bool)

(assert (=> d!37217 (= (apply!108 (+!167 lt!63421 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63432) (apply!108 lt!63421 lt!63432))))

(assert (=> d!37217 true))

(declare-fun _$34!935 () Unit!3835)

(assert (=> d!37217 (= (choose!742 lt!63421 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63432) _$34!935)))

(declare-fun bs!5137 () Bool)

(assert (= bs!5137 d!37217))

(assert (=> bs!5137 m!143219))

(assert (=> bs!5137 m!143219))

(assert (=> bs!5137 m!143221))

(assert (=> bs!5137 m!143223))

(assert (=> d!36971 d!37217))

(assert (=> d!36971 d!36989))

(assert (=> d!36979 d!36963))

(declare-fun d!37219 () Bool)

(assert (=> d!37219 (= (apply!108 (+!167 lt!63439 (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63426) (apply!108 lt!63439 lt!63426))))

(assert (=> d!37219 true))

(declare-fun _$34!936 () Unit!3835)

(assert (=> d!37219 (= (choose!742 lt!63439 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))) lt!63426) _$34!936)))

(declare-fun bs!5138 () Bool)

(assert (= bs!5138 d!37219))

(assert (=> bs!5138 m!143235))

(assert (=> bs!5138 m!143235))

(assert (=> bs!5138 m!143237))

(assert (=> bs!5138 m!143227))

(assert (=> d!36979 d!37219))

(assert (=> d!36979 d!36973))

(assert (=> d!36979 d!36981))

(declare-fun d!37221 () Bool)

(declare-fun e!80925 () Bool)

(assert (=> d!37221 e!80925))

(declare-fun res!60095 () Bool)

(assert (=> d!37221 (=> res!60095 e!80925)))

(declare-fun lt!63716 () Bool)

(assert (=> d!37221 (= res!60095 (not lt!63716))))

(declare-fun lt!63714 () Bool)

(assert (=> d!37221 (= lt!63716 lt!63714)))

(declare-fun lt!63713 () Unit!3835)

(declare-fun e!80926 () Unit!3835)

(assert (=> d!37221 (= lt!63713 e!80926)))

(declare-fun c!22496 () Bool)

(assert (=> d!37221 (= c!22496 lt!63714)))

(assert (=> d!37221 (= lt!63714 (containsKey!168 (toList!852 lt!63439) lt!63426))))

(assert (=> d!37221 (= (contains!869 lt!63439 lt!63426) lt!63716)))

(declare-fun b!123829 () Bool)

(declare-fun lt!63715 () Unit!3835)

(assert (=> b!123829 (= e!80926 lt!63715)))

(assert (=> b!123829 (= lt!63715 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63439) lt!63426))))

(assert (=> b!123829 (isDefined!117 (getValueByKey!164 (toList!852 lt!63439) lt!63426))))

(declare-fun b!123830 () Bool)

(declare-fun Unit!3856 () Unit!3835)

(assert (=> b!123830 (= e!80926 Unit!3856)))

(declare-fun b!123831 () Bool)

(assert (=> b!123831 (= e!80925 (isDefined!117 (getValueByKey!164 (toList!852 lt!63439) lt!63426)))))

(assert (= (and d!37221 c!22496) b!123829))

(assert (= (and d!37221 (not c!22496)) b!123830))

(assert (= (and d!37221 (not res!60095)) b!123831))

(declare-fun m!144027 () Bool)

(assert (=> d!37221 m!144027))

(declare-fun m!144029 () Bool)

(assert (=> b!123829 m!144029))

(assert (=> b!123829 m!143393))

(assert (=> b!123829 m!143393))

(declare-fun m!144031 () Bool)

(assert (=> b!123829 m!144031))

(assert (=> b!123831 m!143393))

(assert (=> b!123831 m!143393))

(assert (=> b!123831 m!144031))

(assert (=> d!36979 d!37221))

(declare-fun d!37223 () Bool)

(declare-fun e!80927 () Bool)

(assert (=> d!37223 e!80927))

(declare-fun res!60096 () Bool)

(assert (=> d!37223 (=> res!60096 e!80927)))

(declare-fun lt!63720 () Bool)

(assert (=> d!37223 (= res!60096 (not lt!63720))))

(declare-fun lt!63718 () Bool)

(assert (=> d!37223 (= lt!63720 lt!63718)))

(declare-fun lt!63717 () Unit!3835)

(declare-fun e!80928 () Unit!3835)

(assert (=> d!37223 (= lt!63717 e!80928)))

(declare-fun c!22497 () Bool)

(assert (=> d!37223 (= c!22497 lt!63718)))

(assert (=> d!37223 (= lt!63718 (containsKey!168 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!37223 (= (contains!869 lt!63496 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63720)))

(declare-fun b!123832 () Bool)

(declare-fun lt!63719 () Unit!3835)

(assert (=> b!123832 (= e!80928 lt!63719)))

(assert (=> b!123832 (= lt!63719 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> b!123832 (isDefined!117 (getValueByKey!164 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123833 () Bool)

(declare-fun Unit!3857 () Unit!3835)

(assert (=> b!123833 (= e!80928 Unit!3857)))

(declare-fun b!123834 () Bool)

(assert (=> b!123834 (= e!80927 (isDefined!117 (getValueByKey!164 (toList!852 lt!63496) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37223 c!22497) b!123832))

(assert (= (and d!37223 (not c!22497)) b!123833))

(assert (= (and d!37223 (not res!60096)) b!123834))

(declare-fun m!144033 () Bool)

(assert (=> d!37223 m!144033))

(declare-fun m!144035 () Bool)

(assert (=> b!123832 m!144035))

(assert (=> b!123832 m!143339))

(assert (=> b!123832 m!143339))

(declare-fun m!144037 () Bool)

(assert (=> b!123832 m!144037))

(assert (=> b!123834 m!143339))

(assert (=> b!123834 m!143339))

(assert (=> b!123834 m!144037))

(assert (=> d!36945 d!37223))

(declare-fun d!37225 () Bool)

(declare-fun c!22498 () Bool)

(assert (=> d!37225 (= c!22498 (and ((_ is Cons!1687) lt!63495) (= (_1!1292 (h!2288 lt!63495)) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80929 () Option!170)

(assert (=> d!37225 (= (getValueByKey!164 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80929)))

(declare-fun b!123836 () Bool)

(declare-fun e!80930 () Option!170)

(assert (=> b!123836 (= e!80929 e!80930)))

(declare-fun c!22499 () Bool)

(assert (=> b!123836 (= c!22499 (and ((_ is Cons!1687) lt!63495) (not (= (_1!1292 (h!2288 lt!63495)) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123837 () Bool)

(assert (=> b!123837 (= e!80930 (getValueByKey!164 (t!5990 lt!63495) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123838 () Bool)

(assert (=> b!123838 (= e!80930 None!168)))

(declare-fun b!123835 () Bool)

(assert (=> b!123835 (= e!80929 (Some!169 (_2!1292 (h!2288 lt!63495))))))

(assert (= (and d!37225 c!22498) b!123835))

(assert (= (and d!37225 (not c!22498)) b!123836))

(assert (= (and b!123836 c!22499) b!123837))

(assert (= (and b!123836 (not c!22499)) b!123838))

(declare-fun m!144039 () Bool)

(assert (=> b!123837 m!144039))

(assert (=> d!36945 d!37225))

(declare-fun d!37227 () Bool)

(assert (=> d!37227 (= (getValueByKey!164 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63721 () Unit!3835)

(assert (=> d!37227 (= lt!63721 (choose!745 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80931 () Bool)

(assert (=> d!37227 e!80931))

(declare-fun res!60097 () Bool)

(assert (=> d!37227 (=> (not res!60097) (not e!80931))))

(assert (=> d!37227 (= res!60097 (isStrictlySorted!315 lt!63495))))

(assert (=> d!37227 (= (lemmaContainsTupThenGetReturnValue!80 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63721)))

(declare-fun b!123839 () Bool)

(declare-fun res!60098 () Bool)

(assert (=> b!123839 (=> (not res!60098) (not e!80931))))

(assert (=> b!123839 (= res!60098 (containsKey!168 lt!63495 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123840 () Bool)

(assert (=> b!123840 (= e!80931 (contains!870 lt!63495 (tuple2!2563 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37227 res!60097) b!123839))

(assert (= (and b!123839 res!60098) b!123840))

(assert (=> d!37227 m!143333))

(declare-fun m!144041 () Bool)

(assert (=> d!37227 m!144041))

(declare-fun m!144043 () Bool)

(assert (=> d!37227 m!144043))

(declare-fun m!144045 () Bool)

(assert (=> b!123839 m!144045))

(declare-fun m!144047 () Bool)

(assert (=> b!123840 m!144047))

(assert (=> d!36945 d!37227))

(declare-fun b!123841 () Bool)

(declare-fun e!80933 () List!1691)

(declare-fun call!13146 () List!1691)

(assert (=> b!123841 (= e!80933 call!13146)))

(declare-fun b!123843 () Bool)

(declare-fun e!80935 () List!1691)

(assert (=> b!123843 (= e!80935 e!80933)))

(declare-fun c!22503 () Bool)

(assert (=> b!123843 (= c!22503 (and ((_ is Cons!1687) (toList!852 call!13100)) (= (_1!1292 (h!2288 (toList!852 call!13100))) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123844 () Bool)

(declare-fun e!80934 () Bool)

(declare-fun lt!63722 () List!1691)

(assert (=> b!123844 (= e!80934 (contains!870 lt!63722 (tuple2!2563 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123845 () Bool)

(declare-fun e!80932 () List!1691)

(declare-fun call!13145 () List!1691)

(assert (=> b!123845 (= e!80932 call!13145)))

(declare-fun b!123846 () Bool)

(declare-fun call!13147 () List!1691)

(assert (=> b!123846 (= e!80935 call!13147)))

(declare-fun bm!13142 () Bool)

(assert (=> bm!13142 (= call!13145 call!13146)))

(declare-fun bm!13143 () Bool)

(assert (=> bm!13143 (= call!13146 call!13147)))

(declare-fun b!123847 () Bool)

(declare-fun c!22502 () Bool)

(assert (=> b!123847 (= c!22502 (and ((_ is Cons!1687) (toList!852 call!13100)) (bvsgt (_1!1292 (h!2288 (toList!852 call!13100))) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123847 (= e!80933 e!80932)))

(declare-fun b!123848 () Bool)

(declare-fun e!80936 () List!1691)

(assert (=> b!123848 (= e!80936 (ite c!22503 (t!5990 (toList!852 call!13100)) (ite c!22502 (Cons!1687 (h!2288 (toList!852 call!13100)) (t!5990 (toList!852 call!13100))) Nil!1688)))))

(declare-fun b!123849 () Bool)

(assert (=> b!123849 (= e!80932 call!13145)))

(declare-fun bm!13144 () Bool)

(declare-fun c!22501 () Bool)

(assert (=> bm!13144 (= call!13147 ($colon$colon!87 e!80936 (ite c!22501 (h!2288 (toList!852 call!13100)) (tuple2!2563 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun c!22500 () Bool)

(assert (=> bm!13144 (= c!22500 c!22501)))

(declare-fun b!123850 () Bool)

(assert (=> b!123850 (= e!80936 (insertStrictlySorted!83 (t!5990 (toList!852 call!13100)) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun d!37229 () Bool)

(assert (=> d!37229 e!80934))

(declare-fun res!60099 () Bool)

(assert (=> d!37229 (=> (not res!60099) (not e!80934))))

(assert (=> d!37229 (= res!60099 (isStrictlySorted!315 lt!63722))))

(assert (=> d!37229 (= lt!63722 e!80935)))

(assert (=> d!37229 (= c!22501 (and ((_ is Cons!1687) (toList!852 call!13100)) (bvslt (_1!1292 (h!2288 (toList!852 call!13100))) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37229 (isStrictlySorted!315 (toList!852 call!13100))))

(assert (=> d!37229 (= (insertStrictlySorted!83 (toList!852 call!13100) (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63722)))

(declare-fun b!123842 () Bool)

(declare-fun res!60100 () Bool)

(assert (=> b!123842 (=> (not res!60100) (not e!80934))))

(assert (=> b!123842 (= res!60100 (containsKey!168 lt!63722 (_1!1292 (tuple2!2563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37229 c!22501) b!123846))

(assert (= (and d!37229 (not c!22501)) b!123843))

(assert (= (and b!123843 c!22503) b!123841))

(assert (= (and b!123843 (not c!22503)) b!123847))

(assert (= (and b!123847 c!22502) b!123845))

(assert (= (and b!123847 (not c!22502)) b!123849))

(assert (= (or b!123845 b!123849) bm!13142))

(assert (= (or b!123841 bm!13142) bm!13143))

(assert (= (or b!123846 bm!13143) bm!13144))

(assert (= (and bm!13144 c!22500) b!123850))

(assert (= (and bm!13144 (not c!22500)) b!123848))

(assert (= (and d!37229 res!60099) b!123842))

(assert (= (and b!123842 res!60100) b!123844))

(declare-fun m!144049 () Bool)

(assert (=> bm!13144 m!144049))

(declare-fun m!144051 () Bool)

(assert (=> b!123844 m!144051))

(declare-fun m!144053 () Bool)

(assert (=> b!123842 m!144053))

(declare-fun m!144055 () Bool)

(assert (=> b!123850 m!144055))

(declare-fun m!144057 () Bool)

(assert (=> d!37229 m!144057))

(declare-fun m!144059 () Bool)

(assert (=> d!37229 m!144059))

(assert (=> d!36945 d!37229))

(declare-fun d!37231 () Bool)

(declare-fun e!80937 () Bool)

(assert (=> d!37231 e!80937))

(declare-fun res!60101 () Bool)

(assert (=> d!37231 (=> res!60101 e!80937)))

(declare-fun lt!63726 () Bool)

(assert (=> d!37231 (= res!60101 (not lt!63726))))

(declare-fun lt!63724 () Bool)

(assert (=> d!37231 (= lt!63726 lt!63724)))

(declare-fun lt!63723 () Unit!3835)

(declare-fun e!80938 () Unit!3835)

(assert (=> d!37231 (= lt!63723 e!80938)))

(declare-fun c!22504 () Bool)

(assert (=> d!37231 (= c!22504 lt!63724)))

(assert (=> d!37231 (= lt!63724 (containsKey!168 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!37231 (= (contains!869 lt!63540 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63726)))

(declare-fun b!123851 () Bool)

(declare-fun lt!63725 () Unit!3835)

(assert (=> b!123851 (= e!80938 lt!63725)))

(assert (=> b!123851 (= lt!63725 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> b!123851 (isDefined!117 (getValueByKey!164 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123852 () Bool)

(declare-fun Unit!3858 () Unit!3835)

(assert (=> b!123852 (= e!80938 Unit!3858)))

(declare-fun b!123853 () Bool)

(assert (=> b!123853 (= e!80937 (isDefined!117 (getValueByKey!164 (toList!852 lt!63540) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37231 c!22504) b!123851))

(assert (= (and d!37231 (not c!22504)) b!123852))

(assert (= (and d!37231 (not res!60101)) b!123853))

(declare-fun m!144061 () Bool)

(assert (=> d!37231 m!144061))

(declare-fun m!144063 () Bool)

(assert (=> b!123851 m!144063))

(assert (=> b!123851 m!143433))

(assert (=> b!123851 m!143433))

(declare-fun m!144065 () Bool)

(assert (=> b!123851 m!144065))

(assert (=> b!123853 m!143433))

(assert (=> b!123853 m!143433))

(assert (=> b!123853 m!144065))

(assert (=> d!36975 d!37231))

(declare-fun c!22505 () Bool)

(declare-fun d!37233 () Bool)

(assert (=> d!37233 (= c!22505 (and ((_ is Cons!1687) lt!63539) (= (_1!1292 (h!2288 lt!63539)) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80939 () Option!170)

(assert (=> d!37233 (= (getValueByKey!164 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80939)))

(declare-fun b!123855 () Bool)

(declare-fun e!80940 () Option!170)

(assert (=> b!123855 (= e!80939 e!80940)))

(declare-fun c!22506 () Bool)

(assert (=> b!123855 (= c!22506 (and ((_ is Cons!1687) lt!63539) (not (= (_1!1292 (h!2288 lt!63539)) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123856 () Bool)

(assert (=> b!123856 (= e!80940 (getValueByKey!164 (t!5990 lt!63539) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123857 () Bool)

(assert (=> b!123857 (= e!80940 None!168)))

(declare-fun b!123854 () Bool)

(assert (=> b!123854 (= e!80939 (Some!169 (_2!1292 (h!2288 lt!63539))))))

(assert (= (and d!37233 c!22505) b!123854))

(assert (= (and d!37233 (not c!22505)) b!123855))

(assert (= (and b!123855 c!22506) b!123856))

(assert (= (and b!123855 (not c!22506)) b!123857))

(declare-fun m!144067 () Bool)

(assert (=> b!123856 m!144067))

(assert (=> d!36975 d!37233))

(declare-fun d!37235 () Bool)

(assert (=> d!37235 (= (getValueByKey!164 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63727 () Unit!3835)

(assert (=> d!37235 (= lt!63727 (choose!745 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80941 () Bool)

(assert (=> d!37235 e!80941))

(declare-fun res!60102 () Bool)

(assert (=> d!37235 (=> (not res!60102) (not e!80941))))

(assert (=> d!37235 (= res!60102 (isStrictlySorted!315 lt!63539))))

(assert (=> d!37235 (= (lemmaContainsTupThenGetReturnValue!80 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63727)))

(declare-fun b!123858 () Bool)

(declare-fun res!60103 () Bool)

(assert (=> b!123858 (=> (not res!60103) (not e!80941))))

(assert (=> b!123858 (= res!60103 (containsKey!168 lt!63539 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123859 () Bool)

(assert (=> b!123859 (= e!80941 (contains!870 lt!63539 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37235 res!60102) b!123858))

(assert (= (and b!123858 res!60103) b!123859))

(assert (=> d!37235 m!143427))

(declare-fun m!144069 () Bool)

(assert (=> d!37235 m!144069))

(declare-fun m!144071 () Bool)

(assert (=> d!37235 m!144071))

(declare-fun m!144073 () Bool)

(assert (=> b!123858 m!144073))

(declare-fun m!144075 () Bool)

(assert (=> b!123859 m!144075))

(assert (=> d!36975 d!37235))

(declare-fun b!123860 () Bool)

(declare-fun e!80943 () List!1691)

(declare-fun call!13149 () List!1691)

(assert (=> b!123860 (= e!80943 call!13149)))

(declare-fun b!123862 () Bool)

(declare-fun e!80945 () List!1691)

(assert (=> b!123862 (= e!80945 e!80943)))

(declare-fun c!22510 () Bool)

(assert (=> b!123862 (= c!22510 (and ((_ is Cons!1687) (toList!852 lt!63421)) (= (_1!1292 (h!2288 (toList!852 lt!63421))) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun lt!63728 () List!1691)

(declare-fun b!123863 () Bool)

(declare-fun e!80944 () Bool)

(assert (=> b!123863 (= e!80944 (contains!870 lt!63728 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123864 () Bool)

(declare-fun e!80942 () List!1691)

(declare-fun call!13148 () List!1691)

(assert (=> b!123864 (= e!80942 call!13148)))

(declare-fun b!123865 () Bool)

(declare-fun call!13150 () List!1691)

(assert (=> b!123865 (= e!80945 call!13150)))

(declare-fun bm!13145 () Bool)

(assert (=> bm!13145 (= call!13148 call!13149)))

(declare-fun bm!13146 () Bool)

(assert (=> bm!13146 (= call!13149 call!13150)))

(declare-fun c!22509 () Bool)

(declare-fun b!123866 () Bool)

(assert (=> b!123866 (= c!22509 (and ((_ is Cons!1687) (toList!852 lt!63421)) (bvsgt (_1!1292 (h!2288 (toList!852 lt!63421))) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123866 (= e!80943 e!80942)))

(declare-fun b!123867 () Bool)

(declare-fun e!80946 () List!1691)

(assert (=> b!123867 (= e!80946 (ite c!22510 (t!5990 (toList!852 lt!63421)) (ite c!22509 (Cons!1687 (h!2288 (toList!852 lt!63421)) (t!5990 (toList!852 lt!63421))) Nil!1688)))))

(declare-fun b!123868 () Bool)

(assert (=> b!123868 (= e!80942 call!13148)))

(declare-fun c!22508 () Bool)

(declare-fun bm!13147 () Bool)

(assert (=> bm!13147 (= call!13150 ($colon$colon!87 e!80946 (ite c!22508 (h!2288 (toList!852 lt!63421)) (tuple2!2563 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun c!22507 () Bool)

(assert (=> bm!13147 (= c!22507 c!22508)))

(declare-fun b!123869 () Bool)

(assert (=> b!123869 (= e!80946 (insertStrictlySorted!83 (t!5990 (toList!852 lt!63421)) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun d!37237 () Bool)

(assert (=> d!37237 e!80944))

(declare-fun res!60104 () Bool)

(assert (=> d!37237 (=> (not res!60104) (not e!80944))))

(assert (=> d!37237 (= res!60104 (isStrictlySorted!315 lt!63728))))

(assert (=> d!37237 (= lt!63728 e!80945)))

(assert (=> d!37237 (= c!22508 (and ((_ is Cons!1687) (toList!852 lt!63421)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63421))) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37237 (isStrictlySorted!315 (toList!852 lt!63421))))

(assert (=> d!37237 (= (insertStrictlySorted!83 (toList!852 lt!63421) (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63728)))

(declare-fun b!123861 () Bool)

(declare-fun res!60105 () Bool)

(assert (=> b!123861 (=> (not res!60105) (not e!80944))))

(assert (=> b!123861 (= res!60105 (containsKey!168 lt!63728 (_1!1292 (tuple2!2563 lt!63429 (minValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37237 c!22508) b!123865))

(assert (= (and d!37237 (not c!22508)) b!123862))

(assert (= (and b!123862 c!22510) b!123860))

(assert (= (and b!123862 (not c!22510)) b!123866))

(assert (= (and b!123866 c!22509) b!123864))

(assert (= (and b!123866 (not c!22509)) b!123868))

(assert (= (or b!123864 b!123868) bm!13145))

(assert (= (or b!123860 bm!13145) bm!13146))

(assert (= (or b!123865 bm!13146) bm!13147))

(assert (= (and bm!13147 c!22507) b!123869))

(assert (= (and bm!13147 (not c!22507)) b!123867))

(assert (= (and d!37237 res!60104) b!123861))

(assert (= (and b!123861 res!60105) b!123863))

(declare-fun m!144077 () Bool)

(assert (=> bm!13147 m!144077))

(declare-fun m!144079 () Bool)

(assert (=> b!123863 m!144079))

(declare-fun m!144081 () Bool)

(assert (=> b!123861 m!144081))

(declare-fun m!144083 () Bool)

(assert (=> b!123869 m!144083))

(declare-fun m!144085 () Bool)

(assert (=> d!37237 m!144085))

(declare-fun m!144087 () Bool)

(assert (=> d!37237 m!144087))

(assert (=> d!36975 d!37237))

(declare-fun d!37239 () Bool)

(assert (=> d!37239 (= (get!1426 (getValueByKey!164 (toList!852 lt!63434) lt!63433)) (v!3094 (getValueByKey!164 (toList!852 lt!63434) lt!63433)))))

(assert (=> d!36987 d!37239))

(declare-fun d!37241 () Bool)

(declare-fun c!22511 () Bool)

(assert (=> d!37241 (= c!22511 (and ((_ is Cons!1687) (toList!852 lt!63434)) (= (_1!1292 (h!2288 (toList!852 lt!63434))) lt!63433)))))

(declare-fun e!80947 () Option!170)

(assert (=> d!37241 (= (getValueByKey!164 (toList!852 lt!63434) lt!63433) e!80947)))

(declare-fun b!123871 () Bool)

(declare-fun e!80948 () Option!170)

(assert (=> b!123871 (= e!80947 e!80948)))

(declare-fun c!22512 () Bool)

(assert (=> b!123871 (= c!22512 (and ((_ is Cons!1687) (toList!852 lt!63434)) (not (= (_1!1292 (h!2288 (toList!852 lt!63434))) lt!63433))))))

(declare-fun b!123872 () Bool)

(assert (=> b!123872 (= e!80948 (getValueByKey!164 (t!5990 (toList!852 lt!63434)) lt!63433))))

(declare-fun b!123873 () Bool)

(assert (=> b!123873 (= e!80948 None!168)))

(declare-fun b!123870 () Bool)

(assert (=> b!123870 (= e!80947 (Some!169 (_2!1292 (h!2288 (toList!852 lt!63434)))))))

(assert (= (and d!37241 c!22511) b!123870))

(assert (= (and d!37241 (not c!22511)) b!123871))

(assert (= (and b!123871 c!22512) b!123872))

(assert (= (and b!123871 (not c!22512)) b!123873))

(declare-fun m!144089 () Bool)

(assert (=> b!123872 m!144089))

(assert (=> d!36987 d!37241))

(declare-fun d!37243 () Bool)

(declare-fun e!80949 () Bool)

(assert (=> d!37243 e!80949))

(declare-fun res!60106 () Bool)

(assert (=> d!37243 (=> res!60106 e!80949)))

(declare-fun lt!63732 () Bool)

(assert (=> d!37243 (= res!60106 (not lt!63732))))

(declare-fun lt!63730 () Bool)

(assert (=> d!37243 (= lt!63732 lt!63730)))

(declare-fun lt!63729 () Unit!3835)

(declare-fun e!80950 () Unit!3835)

(assert (=> d!37243 (= lt!63729 e!80950)))

(declare-fun c!22513 () Bool)

(assert (=> d!37243 (= c!22513 lt!63730)))

(assert (=> d!37243 (= lt!63730 (containsKey!168 (toList!852 lt!63444) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37243 (= (contains!869 lt!63444 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)) lt!63732)))

(declare-fun b!123874 () Bool)

(declare-fun lt!63731 () Unit!3835)

(assert (=> b!123874 (= e!80950 lt!63731)))

(assert (=> b!123874 (= lt!63731 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63444) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123874 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123875 () Bool)

(declare-fun Unit!3859 () Unit!3835)

(assert (=> b!123875 (= e!80950 Unit!3859)))

(declare-fun b!123876 () Bool)

(assert (=> b!123876 (= e!80949 (isDefined!117 (getValueByKey!164 (toList!852 lt!63444) (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37243 c!22513) b!123874))

(assert (= (and d!37243 (not c!22513)) b!123875))

(assert (= (and d!37243 (not res!60106)) b!123876))

(assert (=> d!37243 m!143259))

(declare-fun m!144091 () Bool)

(assert (=> d!37243 m!144091))

(assert (=> b!123874 m!143259))

(declare-fun m!144093 () Bool)

(assert (=> b!123874 m!144093))

(assert (=> b!123874 m!143259))

(assert (=> b!123874 m!143963))

(assert (=> b!123874 m!143963))

(declare-fun m!144095 () Bool)

(assert (=> b!123874 m!144095))

(assert (=> b!123876 m!143259))

(assert (=> b!123876 m!143963))

(assert (=> b!123876 m!143963))

(assert (=> b!123876 m!144095))

(assert (=> b!123364 d!37243))

(declare-fun d!37245 () Bool)

(declare-fun res!60107 () Bool)

(declare-fun e!80953 () Bool)

(assert (=> d!37245 (=> res!60107 e!80953)))

(assert (=> d!37245 (= res!60107 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2469 (_keys!4482 newMap!16))))))

(assert (=> d!37245 (= (arrayNoDuplicates!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22385 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689)) e!80953)))

(declare-fun b!123877 () Bool)

(declare-fun e!80954 () Bool)

(assert (=> b!123877 (= e!80953 e!80954)))

(declare-fun res!60108 () Bool)

(assert (=> b!123877 (=> (not res!60108) (not e!80954))))

(declare-fun e!80951 () Bool)

(assert (=> b!123877 (= res!60108 (not e!80951))))

(declare-fun res!60109 () Bool)

(assert (=> b!123877 (=> (not res!60109) (not e!80951))))

(assert (=> b!123877 (= res!60109 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!123878 () Bool)

(assert (=> b!123878 (= e!80951 (contains!871 (ite c!22385 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689) (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!123879 () Bool)

(declare-fun e!80952 () Bool)

(declare-fun call!13151 () Bool)

(assert (=> b!123879 (= e!80952 call!13151)))

(declare-fun b!123880 () Bool)

(assert (=> b!123880 (= e!80952 call!13151)))

(declare-fun bm!13148 () Bool)

(declare-fun c!22514 () Bool)

(assert (=> bm!13148 (= call!13151 (arrayNoDuplicates!0 (_keys!4482 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!22514 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22385 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689)) (ite c!22385 (Cons!1688 (select (arr!2207 (_keys!4482 newMap!16)) #b00000000000000000000000000000000) Nil!1689) Nil!1689))))))

(declare-fun b!123881 () Bool)

(assert (=> b!123881 (= e!80954 e!80952)))

(assert (=> b!123881 (= c!22514 (validKeyInArray!0 (select (arr!2207 (_keys!4482 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37245 (not res!60107)) b!123877))

(assert (= (and b!123877 res!60109) b!123878))

(assert (= (and b!123877 res!60108) b!123881))

(assert (= (and b!123881 c!22514) b!123880))

(assert (= (and b!123881 (not c!22514)) b!123879))

(assert (= (or b!123880 b!123879) bm!13148))

(assert (=> b!123877 m!143775))

(assert (=> b!123877 m!143775))

(assert (=> b!123877 m!143777))

(assert (=> b!123878 m!143775))

(assert (=> b!123878 m!143775))

(declare-fun m!144097 () Bool)

(assert (=> b!123878 m!144097))

(assert (=> bm!13148 m!143775))

(declare-fun m!144099 () Bool)

(assert (=> bm!13148 m!144099))

(assert (=> b!123881 m!143775))

(assert (=> b!123881 m!143775))

(assert (=> b!123881 m!143777))

(assert (=> bm!13116 d!37245))

(declare-fun d!37247 () Bool)

(declare-fun e!80955 () Bool)

(assert (=> d!37247 e!80955))

(declare-fun res!60110 () Bool)

(assert (=> d!37247 (=> res!60110 e!80955)))

(declare-fun lt!63736 () Bool)

(assert (=> d!37247 (= res!60110 (not lt!63736))))

(declare-fun lt!63734 () Bool)

(assert (=> d!37247 (= lt!63736 lt!63734)))

(declare-fun lt!63733 () Unit!3835)

(declare-fun e!80956 () Unit!3835)

(assert (=> d!37247 (= lt!63733 e!80956)))

(declare-fun c!22515 () Bool)

(assert (=> d!37247 (= c!22515 lt!63734)))

(assert (=> d!37247 (= lt!63734 (containsKey!168 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> d!37247 (= (contains!869 lt!63544 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63736)))

(declare-fun b!123882 () Bool)

(declare-fun lt!63735 () Unit!3835)

(assert (=> b!123882 (= e!80956 lt!63735)))

(assert (=> b!123882 (= lt!63735 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (=> b!123882 (isDefined!117 (getValueByKey!164 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123883 () Bool)

(declare-fun Unit!3860 () Unit!3835)

(assert (=> b!123883 (= e!80956 Unit!3860)))

(declare-fun b!123884 () Bool)

(assert (=> b!123884 (= e!80955 (isDefined!117 (getValueByKey!164 (toList!852 lt!63544) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37247 c!22515) b!123882))

(assert (= (and d!37247 (not c!22515)) b!123883))

(assert (= (and d!37247 (not res!60110)) b!123884))

(declare-fun m!144101 () Bool)

(assert (=> d!37247 m!144101))

(declare-fun m!144103 () Bool)

(assert (=> b!123882 m!144103))

(assert (=> b!123882 m!143445))

(assert (=> b!123882 m!143445))

(declare-fun m!144105 () Bool)

(assert (=> b!123882 m!144105))

(assert (=> b!123884 m!143445))

(assert (=> b!123884 m!143445))

(assert (=> b!123884 m!144105))

(assert (=> d!36977 d!37247))

(declare-fun d!37249 () Bool)

(declare-fun c!22516 () Bool)

(assert (=> d!37249 (= c!22516 (and ((_ is Cons!1687) lt!63543) (= (_1!1292 (h!2288 lt!63543)) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80957 () Option!170)

(assert (=> d!37249 (= (getValueByKey!164 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) e!80957)))

(declare-fun b!123886 () Bool)

(declare-fun e!80958 () Option!170)

(assert (=> b!123886 (= e!80957 e!80958)))

(declare-fun c!22517 () Bool)

(assert (=> b!123886 (= c!22517 (and ((_ is Cons!1687) lt!63543) (not (= (_1!1292 (h!2288 lt!63543)) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun b!123887 () Bool)

(assert (=> b!123887 (= e!80958 (getValueByKey!164 (t!5990 lt!63543) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123888 () Bool)

(assert (=> b!123888 (= e!80958 None!168)))

(declare-fun b!123885 () Bool)

(assert (=> b!123885 (= e!80957 (Some!169 (_2!1292 (h!2288 lt!63543))))))

(assert (= (and d!37249 c!22516) b!123885))

(assert (= (and d!37249 (not c!22516)) b!123886))

(assert (= (and b!123886 c!22517) b!123887))

(assert (= (and b!123886 (not c!22517)) b!123888))

(declare-fun m!144107 () Bool)

(assert (=> b!123887 m!144107))

(assert (=> d!36977 d!37249))

(declare-fun d!37251 () Bool)

(assert (=> d!37251 (= (getValueByKey!164 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) (Some!169 (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun lt!63737 () Unit!3835)

(assert (=> d!37251 (= lt!63737 (choose!745 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun e!80959 () Bool)

(assert (=> d!37251 e!80959))

(declare-fun res!60111 () Bool)

(assert (=> d!37251 (=> (not res!60111) (not e!80959))))

(assert (=> d!37251 (= res!60111 (isStrictlySorted!315 lt!63543))))

(assert (=> d!37251 (= (lemmaContainsTupThenGetReturnValue!80 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63737)))

(declare-fun b!123889 () Bool)

(declare-fun res!60112 () Bool)

(assert (=> b!123889 (=> (not res!60112) (not e!80959))))

(assert (=> b!123889 (= res!60112 (containsKey!168 lt!63543 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun b!123890 () Bool)

(assert (=> b!123890 (= e!80959 (contains!870 lt!63543 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (= (and d!37251 res!60111) b!123889))

(assert (= (and b!123889 res!60112) b!123890))

(assert (=> d!37251 m!143439))

(declare-fun m!144109 () Bool)

(assert (=> d!37251 m!144109))

(declare-fun m!144111 () Bool)

(assert (=> d!37251 m!144111))

(declare-fun m!144113 () Bool)

(assert (=> b!123889 m!144113))

(declare-fun m!144115 () Bool)

(assert (=> b!123890 m!144115))

(assert (=> d!36977 d!37251))

(declare-fun b!123891 () Bool)

(declare-fun e!80961 () List!1691)

(declare-fun call!13153 () List!1691)

(assert (=> b!123891 (= e!80961 call!13153)))

(declare-fun b!123893 () Bool)

(declare-fun e!80963 () List!1691)

(assert (=> b!123893 (= e!80963 e!80961)))

(declare-fun c!22521 () Bool)

(assert (=> b!123893 (= c!22521 (and ((_ is Cons!1687) (toList!852 lt!63428)) (= (_1!1292 (h!2288 (toList!852 lt!63428))) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun e!80962 () Bool)

(declare-fun lt!63738 () List!1691)

(declare-fun b!123894 () Bool)

(assert (=> b!123894 (= e!80962 (contains!870 lt!63738 (tuple2!2563 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(declare-fun b!123895 () Bool)

(declare-fun e!80960 () List!1691)

(declare-fun call!13152 () List!1691)

(assert (=> b!123895 (= e!80960 call!13152)))

(declare-fun b!123896 () Bool)

(declare-fun call!13154 () List!1691)

(assert (=> b!123896 (= e!80963 call!13154)))

(declare-fun bm!13149 () Bool)

(assert (=> bm!13149 (= call!13152 call!13153)))

(declare-fun bm!13150 () Bool)

(assert (=> bm!13150 (= call!13153 call!13154)))

(declare-fun c!22520 () Bool)

(declare-fun b!123897 () Bool)

(assert (=> b!123897 (= c!22520 (and ((_ is Cons!1687) (toList!852 lt!63428)) (bvsgt (_1!1292 (h!2288 (toList!852 lt!63428))) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> b!123897 (= e!80961 e!80960)))

(declare-fun b!123898 () Bool)

(declare-fun e!80964 () List!1691)

(assert (=> b!123898 (= e!80964 (ite c!22521 (t!5990 (toList!852 lt!63428)) (ite c!22520 (Cons!1687 (h!2288 (toList!852 lt!63428)) (t!5990 (toList!852 lt!63428))) Nil!1688)))))

(declare-fun b!123899 () Bool)

(assert (=> b!123899 (= e!80960 call!13152)))

(declare-fun bm!13151 () Bool)

(declare-fun c!22519 () Bool)

(assert (=> bm!13151 (= call!13154 ($colon$colon!87 e!80964 (ite c!22519 (h!2288 (toList!852 lt!63428)) (tuple2!2563 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))))

(declare-fun c!22518 () Bool)

(assert (=> bm!13151 (= c!22518 c!22519)))

(declare-fun b!123900 () Bool)

(assert (=> b!123900 (= e!80964 (insertStrictlySorted!83 (t!5990 (toList!852 lt!63428)) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(declare-fun d!37253 () Bool)

(assert (=> d!37253 e!80962))

(declare-fun res!60113 () Bool)

(assert (=> d!37253 (=> (not res!60113) (not e!80962))))

(assert (=> d!37253 (= res!60113 (isStrictlySorted!315 lt!63738))))

(assert (=> d!37253 (= lt!63738 e!80963)))

(assert (=> d!37253 (= c!22519 (and ((_ is Cons!1687) (toList!852 lt!63428)) (bvslt (_1!1292 (h!2288 (toList!852 lt!63428))) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))))))))

(assert (=> d!37253 (isStrictlySorted!315 (toList!852 lt!63428))))

(assert (=> d!37253 (= (insertStrictlySorted!83 (toList!852 lt!63428) (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992))))) (_2!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))) lt!63738)))

(declare-fun b!123892 () Bool)

(declare-fun res!60114 () Bool)

(assert (=> b!123892 (=> (not res!60114) (not e!80962))))

(assert (=> b!123892 (= res!60114 (containsKey!168 lt!63738 (_1!1292 (tuple2!2563 lt!63423 (zeroValue!2620 (v!3092 (underlying!431 thiss!992)))))))))

(assert (= (and d!37253 c!22519) b!123896))

(assert (= (and d!37253 (not c!22519)) b!123893))

(assert (= (and b!123893 c!22521) b!123891))

(assert (= (and b!123893 (not c!22521)) b!123897))

(assert (= (and b!123897 c!22520) b!123895))

(assert (= (and b!123897 (not c!22520)) b!123899))

(assert (= (or b!123895 b!123899) bm!13149))

(assert (= (or b!123891 bm!13149) bm!13150))

(assert (= (or b!123896 bm!13150) bm!13151))

(assert (= (and bm!13151 c!22518) b!123900))

(assert (= (and bm!13151 (not c!22518)) b!123898))

(assert (= (and d!37253 res!60113) b!123892))

(assert (= (and b!123892 res!60114) b!123894))

(declare-fun m!144117 () Bool)

(assert (=> bm!13151 m!144117))

(declare-fun m!144119 () Bool)

(assert (=> b!123894 m!144119))

(declare-fun m!144121 () Bool)

(assert (=> b!123892 m!144121))

(declare-fun m!144123 () Bool)

(assert (=> b!123900 m!144123))

(declare-fun m!144125 () Bool)

(assert (=> d!37253 m!144125))

(declare-fun m!144127 () Bool)

(assert (=> d!37253 m!144127))

(assert (=> d!36977 d!37253))

(declare-fun d!37255 () Bool)

(declare-fun lt!63739 () Bool)

(assert (=> d!37255 (= lt!63739 (select (content!121 (toList!852 lt!63549)) (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun e!80966 () Bool)

(assert (=> d!37255 (= lt!63739 e!80966)))

(declare-fun res!60116 () Bool)

(assert (=> d!37255 (=> (not res!60116) (not e!80966))))

(assert (=> d!37255 (= res!60116 ((_ is Cons!1687) (toList!852 lt!63549)))))

(assert (=> d!37255 (= (contains!870 (toList!852 lt!63549) (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))) lt!63739)))

(declare-fun b!123901 () Bool)

(declare-fun e!80965 () Bool)

(assert (=> b!123901 (= e!80966 e!80965)))

(declare-fun res!60115 () Bool)

(assert (=> b!123901 (=> res!60115 e!80965)))

(assert (=> b!123901 (= res!60115 (= (h!2288 (toList!852 lt!63549)) (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(declare-fun b!123902 () Bool)

(assert (=> b!123902 (= e!80965 (contains!870 (t!5990 (toList!852 lt!63549)) (tuple2!2563 lt!63436 (minValue!2620 (v!3092 (underlying!431 thiss!992))))))))

(assert (= (and d!37255 res!60116) b!123901))

(assert (= (and b!123901 (not res!60115)) b!123902))

(declare-fun m!144129 () Bool)

(assert (=> d!37255 m!144129))

(declare-fun m!144131 () Bool)

(assert (=> d!37255 m!144131))

(declare-fun m!144133 () Bool)

(assert (=> b!123902 m!144133))

(assert (=> b!123491 d!37255))

(declare-fun b!123904 () Bool)

(declare-fun e!80968 () Bool)

(assert (=> b!123904 (= e!80968 tp_is_empty!2823)))

(declare-fun b!123903 () Bool)

(declare-fun e!80967 () Bool)

(assert (=> b!123903 (= e!80967 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4439 () Bool)

(declare-fun mapRes!4439 () Bool)

(declare-fun tp!10847 () Bool)

(assert (=> mapNonEmpty!4439 (= mapRes!4439 (and tp!10847 e!80967))))

(declare-fun mapRest!4439 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapKey!4439 () (_ BitVec 32))

(declare-fun mapValue!4439 () ValueCell!1068)

(assert (=> mapNonEmpty!4439 (= mapRest!4437 (store mapRest!4439 mapKey!4439 mapValue!4439))))

(declare-fun mapIsEmpty!4439 () Bool)

(assert (=> mapIsEmpty!4439 mapRes!4439))

(declare-fun condMapEmpty!4439 () Bool)

(declare-fun mapDefault!4439 () ValueCell!1068)

(assert (=> mapNonEmpty!4437 (= condMapEmpty!4439 (= mapRest!4437 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4439)))))

(assert (=> mapNonEmpty!4437 (= tp!10845 (and e!80968 mapRes!4439))))

(assert (= (and mapNonEmpty!4437 condMapEmpty!4439) mapIsEmpty!4439))

(assert (= (and mapNonEmpty!4437 (not condMapEmpty!4439)) mapNonEmpty!4439))

(assert (= (and mapNonEmpty!4439 ((_ is ValueCellFull!1068) mapValue!4439)) b!123903))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1068) mapDefault!4439)) b!123904))

(declare-fun m!144135 () Bool)

(assert (=> mapNonEmpty!4439 m!144135))

(declare-fun b!123906 () Bool)

(declare-fun e!80970 () Bool)

(assert (=> b!123906 (= e!80970 tp_is_empty!2823)))

(declare-fun b!123905 () Bool)

(declare-fun e!80969 () Bool)

(assert (=> b!123905 (= e!80969 tp_is_empty!2823)))

(declare-fun mapNonEmpty!4440 () Bool)

(declare-fun mapRes!4440 () Bool)

(declare-fun tp!10848 () Bool)

(assert (=> mapNonEmpty!4440 (= mapRes!4440 (and tp!10848 e!80969))))

(declare-fun mapKey!4440 () (_ BitVec 32))

(declare-fun mapRest!4440 () (Array (_ BitVec 32) ValueCell!1068))

(declare-fun mapValue!4440 () ValueCell!1068)

(assert (=> mapNonEmpty!4440 (= mapRest!4438 (store mapRest!4440 mapKey!4440 mapValue!4440))))

(declare-fun mapIsEmpty!4440 () Bool)

(assert (=> mapIsEmpty!4440 mapRes!4440))

(declare-fun condMapEmpty!4440 () Bool)

(declare-fun mapDefault!4440 () ValueCell!1068)

(assert (=> mapNonEmpty!4438 (= condMapEmpty!4440 (= mapRest!4438 ((as const (Array (_ BitVec 32) ValueCell!1068)) mapDefault!4440)))))

(assert (=> mapNonEmpty!4438 (= tp!10846 (and e!80970 mapRes!4440))))

(assert (= (and mapNonEmpty!4438 condMapEmpty!4440) mapIsEmpty!4440))

(assert (= (and mapNonEmpty!4438 (not condMapEmpty!4440)) mapNonEmpty!4440))

(assert (= (and mapNonEmpty!4440 ((_ is ValueCellFull!1068) mapValue!4440)) b!123905))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1068) mapDefault!4440)) b!123906))

(declare-fun m!144137 () Bool)

(assert (=> mapNonEmpty!4440 m!144137))

(declare-fun b_lambda!5437 () Bool)

(assert (= b_lambda!5435 (or (and b!123206 b_free!2813 (= (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) (defaultEntry!2755 newMap!16))) (and b!123212 b_free!2815) b_lambda!5437)))

(declare-fun b_lambda!5439 () Bool)

(assert (= b_lambda!5431 (or (and b!123206 b_free!2813) (and b!123212 b_free!2815 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))) b_lambda!5439)))

(declare-fun b_lambda!5441 () Bool)

(assert (= b_lambda!5433 (or (and b!123206 b_free!2813 (= (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))) (defaultEntry!2755 newMap!16))) (and b!123212 b_free!2815) b_lambda!5441)))

(declare-fun b_lambda!5443 () Bool)

(assert (= b_lambda!5429 (or (and b!123206 b_free!2813) (and b!123212 b_free!2815 (= (defaultEntry!2755 newMap!16) (defaultEntry!2755 (v!3092 (underlying!431 thiss!992))))) b_lambda!5443)))

(check-sat (not d!37207) (not d!37199) (not b_lambda!5437) (not d!37109) (not d!37149) (not d!37253) (not b!123694) (not b!123894) (not bm!13140) (not b!123829) (not d!37111) (not bm!13141) (not b!123831) (not b!123625) (not b_lambda!5425) (not b!123809) (not b!123550) (not b!123869) (not b!123545) (not d!37143) (not d!37231) (not b!123615) (not b!123548) (not d!37211) (not d!37155) (not b!123603) (not b!123556) (not d!37147) (not b!123762) (not b!123754) (not b!123746) (not d!37047) (not d!37255) (not b!123825) (not bm!13134) (not d!37159) (not b!123726) (not b!123536) (not bm!13120) (not b!123783) (not d!37201) (not b!123844) (not b!123688) (not b!123787) (not b!123850) (not b!123770) (not b!123756) (not d!37163) (not d!37237) (not d!37153) (not b!123623) (not b!123718) (not b!123822) (not d!37097) (not b!123561) (not d!37015) (not b!123605) (not b!123859) (not d!37045) (not d!37215) (not b!123622) (not b_lambda!5441) (not b!123724) (not b!123662) (not b!123566) (not b!123778) (not b!123837) (not bm!13148) (not d!37083) (not b!123629) (not d!37007) (not d!37219) (not b!123858) (not d!37135) (not b!123874) (not b_next!2815) (not d!37137) (not bm!13130) (not b!123863) (not b!123737) (not d!37229) (not d!37173) (not b!123526) (not d!37019) (not b!123876) (not d!37077) (not b!123634) tp_is_empty!2823 (not b!123533) (not b!123538) (not d!37073) (not b!123821) (not b!123717) (not d!37251) (not b!123529) (not b!123768) (not d!37105) b_and!7605 (not d!37065) (not b!123669) (not b!123887) (not d!37089) (not b!123890) (not bm!13144) (not b!123751) (not b!123619) (not b!123743) (not b!123713) (not bm!13133) (not b!123679) (not d!37139) (not b!123541) (not d!37121) (not b!123698) (not bm!13139) (not b!123597) (not b!123780) (not d!37063) (not b!123832) (not b!123681) (not b!123733) (not b!123900) (not b!123877) (not d!37041) (not b!123740) (not b!123853) (not b!123861) (not b!123573) (not b!123524) (not b!123851) (not b!123775) (not d!37053) b_and!7603 (not d!37057) (not b!123684) (not b!123691) (not b!123675) (not d!37037) (not b!123882) (not b!123840) (not b!123572) (not d!37243) (not d!37167) (not b!123839) (not d!37145) (not b!123741) (not d!37217) (not b_lambda!5415) (not b!123641) (not b!123804) (not b!123808) (not d!37221) (not d!37079) (not b!123791) (not bm!13129) (not d!37195) (not b!123765) (not b!123834) (not d!37191) (not d!37119) (not d!37095) (not b!123817) (not b!123856) (not b!123814) (not d!37165) (not b!123744) (not d!37227) (not b_lambda!5439) (not b!123826) (not b!123752) (not b!123884) (not b!123686) (not b!123719) (not mapNonEmpty!4440) (not d!37203) (not b!123693) (not mapNonEmpty!4439) (not bm!13151) (not d!37101) (not b!123790) (not b_lambda!5423) (not b!123828) (not d!37169) (not b!123805) (not b!123711) (not b!123766) (not b_lambda!5443) (not b!123803) (not b!123819) (not d!37209) (not b!123664) (not b!123872) (not b!123767) (not b!123798) (not d!37043) (not b!123715) (not b!123559) (not b!123772) (not d!37161) (not b!123727) (not b!123608) (not d!37157) (not d!37115) (not bm!13147) (not b!123522) (not b!123749) (not b!123714) (not d!37247) (not b!123667) (not d!37187) (not d!37099) (not b!123704) (not d!37205) (not b!123801) (not d!37013) (not b!123773) (not d!37031) (not b!123807) (not b!123710) (not b!123842) (not b!123792) (not b!123706) (not b_next!2813) (not b!123816) (not b!123620) (not b!123902) (not b!123774) (not b!123631) (not b_lambda!5427) (not d!37033) (not b!123655) (not d!37175) (not b!123627) (not b!123878) (not d!37029) (not b!123764) (not b!123677) (not b!123892) (not b!123626) (not d!37093) (not b!123696) (not bm!13136) (not d!37235) (not d!37021) (not b!123881) (not b!123665) (not b!123796) (not b!123795) (not b!123678) (not b!123595) (not b!123818) (not b!123889) (not bm!13135) (not b!123716) (not b!123563) (not b!123624) (not d!37223) (not d!37151) (not b!123676) (not d!37171))
(check-sat b_and!7603 b_and!7605 (not b_next!2813) (not b_next!2815))
