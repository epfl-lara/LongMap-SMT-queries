; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13522 () Bool)

(assert start!13522)

(declare-fun b!123990 () Bool)

(declare-fun b_free!2825 () Bool)

(declare-fun b_next!2825 () Bool)

(assert (=> b!123990 (= b_free!2825 (not b_next!2825))))

(declare-fun tp!10872 () Bool)

(declare-fun b_and!7615 () Bool)

(assert (=> b!123990 (= tp!10872 b_and!7615)))

(declare-fun b!124000 () Bool)

(declare-fun b_free!2827 () Bool)

(declare-fun b_next!2827 () Bool)

(assert (=> b!124000 (= b_free!2827 (not b_next!2827))))

(declare-fun tp!10870 () Bool)

(declare-fun b_and!7617 () Bool)

(assert (=> b!124000 (= tp!10870 b_and!7617)))

(declare-fun b!123989 () Bool)

(declare-fun e!81048 () Bool)

(declare-fun e!81055 () Bool)

(assert (=> b!123989 (= e!81048 e!81055)))

(declare-fun e!81049 () Bool)

(declare-fun e!81052 () Bool)

(declare-fun tp_is_empty!2829 () Bool)

(declare-datatypes ((V!3419 0))(
  ( (V!3420 (val!1459 Int)) )
))
(declare-datatypes ((array!4671 0))(
  ( (array!4672 (arr!2213 (Array (_ BitVec 32) (_ BitVec 64))) (size!2476 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1071 0))(
  ( (ValueCellFull!1071 (v!3099 V!3419)) (EmptyCell!1071) )
))
(declare-datatypes ((array!4673 0))(
  ( (array!4674 (arr!2214 (Array (_ BitVec 32) ValueCell!1071)) (size!2477 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1050 0))(
  ( (LongMapFixedSize!1051 (defaultEntry!2760 Int) (mask!7003 (_ BitVec 32)) (extraKeys!2545 (_ BitVec 32)) (zeroValue!2625 V!3419) (minValue!2625 V!3419) (_size!574 (_ BitVec 32)) (_keys!4489 array!4671) (_values!2743 array!4673) (_vacant!574 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!844 0))(
  ( (Cell!845 (v!3100 LongMapFixedSize!1050)) )
))
(declare-datatypes ((LongMap!844 0))(
  ( (LongMap!845 (underlying!433 Cell!844)) )
))
(declare-fun thiss!992 () LongMap!844)

(declare-fun array_inv!1389 (array!4671) Bool)

(declare-fun array_inv!1390 (array!4673) Bool)

(assert (=> b!123990 (= e!81052 (and tp!10872 tp_is_empty!2829 (array_inv!1389 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (array_inv!1390 (_values!2743 (v!3100 (underlying!433 thiss!992)))) e!81049))))

(declare-fun res!60150 () Bool)

(declare-fun e!81053 () Bool)

(assert (=> start!13522 (=> (not res!60150) (not e!81053))))

(declare-fun valid!499 (LongMap!844) Bool)

(assert (=> start!13522 (= res!60150 (valid!499 thiss!992))))

(assert (=> start!13522 e!81053))

(assert (=> start!13522 e!81048))

(assert (=> start!13522 true))

(declare-fun e!81047 () Bool)

(assert (=> start!13522 e!81047))

(declare-fun mapNonEmpty!4451 () Bool)

(declare-fun mapRes!4451 () Bool)

(declare-fun tp!10869 () Bool)

(declare-fun e!81057 () Bool)

(assert (=> mapNonEmpty!4451 (= mapRes!4451 (and tp!10869 e!81057))))

(declare-fun mapKey!4452 () (_ BitVec 32))

(declare-fun mapRest!4452 () (Array (_ BitVec 32) ValueCell!1071))

(declare-fun mapValue!4452 () ValueCell!1071)

(assert (=> mapNonEmpty!4451 (= (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) (store mapRest!4452 mapKey!4452 mapValue!4452))))

(declare-fun b!123991 () Bool)

(declare-fun e!81050 () Bool)

(assert (=> b!123991 (= e!81050 tp_is_empty!2829)))

(declare-fun b!123992 () Bool)

(declare-fun e!81060 () Bool)

(declare-fun e!81058 () Bool)

(declare-fun mapRes!4452 () Bool)

(assert (=> b!123992 (= e!81060 (and e!81058 mapRes!4452))))

(declare-fun condMapEmpty!4452 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1050)

(declare-fun mapDefault!4452 () ValueCell!1071)

(assert (=> b!123992 (= condMapEmpty!4452 (= (arr!2214 (_values!2743 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1071)) mapDefault!4452)))))

(declare-fun b!123993 () Bool)

(declare-fun res!60152 () Bool)

(assert (=> b!123993 (=> (not res!60152) (not e!81053))))

(declare-fun valid!500 (LongMapFixedSize!1050) Bool)

(assert (=> b!123993 (= res!60152 (valid!500 newMap!16))))

(declare-fun b!123994 () Bool)

(declare-fun e!81056 () Bool)

(assert (=> b!123994 (= e!81056 tp_is_empty!2829)))

(declare-fun mapNonEmpty!4452 () Bool)

(declare-fun tp!10871 () Bool)

(assert (=> mapNonEmpty!4452 (= mapRes!4452 (and tp!10871 e!81050))))

(declare-fun mapValue!4451 () ValueCell!1071)

(declare-fun mapKey!4451 () (_ BitVec 32))

(declare-fun mapRest!4451 () (Array (_ BitVec 32) ValueCell!1071))

(assert (=> mapNonEmpty!4452 (= (arr!2214 (_values!2743 newMap!16)) (store mapRest!4451 mapKey!4451 mapValue!4451))))

(declare-fun b!123995 () Bool)

(declare-fun res!60151 () Bool)

(assert (=> b!123995 (=> (not res!60151) (not e!81053))))

(assert (=> b!123995 (= res!60151 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7003 newMap!16)) (_size!574 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!123996 () Bool)

(declare-fun e!81054 () Bool)

(assert (=> b!123996 (= e!81053 e!81054)))

(declare-fun res!60149 () Bool)

(assert (=> b!123996 (=> (not res!60149) (not e!81054))))

(declare-datatypes ((tuple2!2564 0))(
  ( (tuple2!2565 (_1!1293 (_ BitVec 64)) (_2!1293 V!3419)) )
))
(declare-datatypes ((List!1693 0))(
  ( (Nil!1690) (Cons!1689 (h!2290 tuple2!2564) (t!6008 List!1693)) )
))
(declare-datatypes ((ListLongMap!1675 0))(
  ( (ListLongMap!1676 (toList!853 List!1693)) )
))
(declare-fun lt!63756 () ListLongMap!1675)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!63757 () ListLongMap!1675)

(assert (=> b!123996 (= res!60149 (and (= lt!63756 lt!63757) (not (= (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1381 (LongMapFixedSize!1050) ListLongMap!1675)

(assert (=> b!123996 (= lt!63757 (map!1381 newMap!16))))

(declare-fun getCurrentListMap!534 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 32) Int) ListLongMap!1675)

(assert (=> b!123996 (= lt!63756 (getCurrentListMap!534 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!123997 () Bool)

(declare-fun res!60147 () Bool)

(assert (=> b!123997 (=> (not res!60147) (not e!81053))))

(assert (=> b!123997 (= res!60147 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992)))))))))

(declare-fun mapIsEmpty!4451 () Bool)

(assert (=> mapIsEmpty!4451 mapRes!4452))

(declare-fun b!123998 () Bool)

(assert (=> b!123998 (= e!81058 tp_is_empty!2829)))

(declare-fun b!123999 () Bool)

(assert (=> b!123999 (= e!81055 e!81052)))

(declare-fun mapIsEmpty!4452 () Bool)

(assert (=> mapIsEmpty!4452 mapRes!4451))

(assert (=> b!124000 (= e!81047 (and tp!10870 tp_is_empty!2829 (array_inv!1389 (_keys!4489 newMap!16)) (array_inv!1390 (_values!2743 newMap!16)) e!81060))))

(declare-fun b!124001 () Bool)

(declare-fun e!81059 () Bool)

(assert (=> b!124001 (= e!81054 e!81059)))

(declare-fun res!60148 () Bool)

(assert (=> b!124001 (=> (not res!60148) (not e!81059))))

(declare-fun contains!872 (ListLongMap!1675 (_ BitVec 64)) Bool)

(assert (=> b!124001 (= res!60148 (contains!872 lt!63757 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2566 0))(
  ( (tuple2!2567 (_1!1294 Bool) (_2!1294 LongMapFixedSize!1050)) )
))
(declare-fun lt!63755 () tuple2!2566)

(declare-fun update!179 (LongMapFixedSize!1050 (_ BitVec 64) V!3419) tuple2!2566)

(declare-fun get!1431 (ValueCell!1071 V!3419) V!3419)

(declare-fun dynLambda!410 (Int (_ BitVec 64)) V!3419)

(assert (=> b!124001 (= lt!63755 (update!179 newMap!16 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!124002 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124002 (= e!81059 (not (validMask!0 (mask!7003 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124003 () Bool)

(assert (=> b!124003 (= e!81049 (and e!81056 mapRes!4451))))

(declare-fun condMapEmpty!4451 () Bool)

(declare-fun mapDefault!4451 () ValueCell!1071)

(assert (=> b!124003 (= condMapEmpty!4451 (= (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1071)) mapDefault!4451)))))

(declare-fun b!124004 () Bool)

(assert (=> b!124004 (= e!81057 tp_is_empty!2829)))

(assert (= (and start!13522 res!60150) b!123997))

(assert (= (and b!123997 res!60147) b!123993))

(assert (= (and b!123993 res!60152) b!123995))

(assert (= (and b!123995 res!60151) b!123996))

(assert (= (and b!123996 res!60149) b!124001))

(assert (= (and b!124001 res!60148) b!124002))

(assert (= (and b!124003 condMapEmpty!4451) mapIsEmpty!4452))

(assert (= (and b!124003 (not condMapEmpty!4451)) mapNonEmpty!4451))

(get-info :version)

(assert (= (and mapNonEmpty!4451 ((_ is ValueCellFull!1071) mapValue!4452)) b!124004))

(assert (= (and b!124003 ((_ is ValueCellFull!1071) mapDefault!4451)) b!123994))

(assert (= b!123990 b!124003))

(assert (= b!123999 b!123990))

(assert (= b!123989 b!123999))

(assert (= start!13522 b!123989))

(assert (= (and b!123992 condMapEmpty!4452) mapIsEmpty!4451))

(assert (= (and b!123992 (not condMapEmpty!4452)) mapNonEmpty!4452))

(assert (= (and mapNonEmpty!4452 ((_ is ValueCellFull!1071) mapValue!4451)) b!123991))

(assert (= (and b!123992 ((_ is ValueCellFull!1071) mapDefault!4452)) b!123998))

(assert (= b!124000 b!123992))

(assert (= start!13522 b!124000))

(declare-fun b_lambda!5447 () Bool)

(assert (=> (not b_lambda!5447) (not b!124001)))

(declare-fun t!6005 () Bool)

(declare-fun tb!2277 () Bool)

(assert (=> (and b!123990 (= (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))) t!6005) tb!2277))

(declare-fun result!3785 () Bool)

(assert (=> tb!2277 (= result!3785 tp_is_empty!2829)))

(assert (=> b!124001 t!6005))

(declare-fun b_and!7619 () Bool)

(assert (= b_and!7615 (and (=> t!6005 result!3785) b_and!7619)))

(declare-fun t!6007 () Bool)

(declare-fun tb!2279 () Bool)

(assert (=> (and b!124000 (= (defaultEntry!2760 newMap!16) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))) t!6007) tb!2279))

(declare-fun result!3789 () Bool)

(assert (= result!3789 result!3785))

(assert (=> b!124001 t!6007))

(declare-fun b_and!7621 () Bool)

(assert (= b_and!7617 (and (=> t!6007 result!3789) b_and!7621)))

(declare-fun m!144173 () Bool)

(assert (=> b!123993 m!144173))

(declare-fun m!144175 () Bool)

(assert (=> start!13522 m!144175))

(declare-fun m!144177 () Bool)

(assert (=> b!123990 m!144177))

(declare-fun m!144179 () Bool)

(assert (=> b!123990 m!144179))

(declare-fun m!144181 () Bool)

(assert (=> b!123996 m!144181))

(declare-fun m!144183 () Bool)

(assert (=> b!123996 m!144183))

(declare-fun m!144185 () Bool)

(assert (=> b!123996 m!144185))

(declare-fun m!144187 () Bool)

(assert (=> b!124000 m!144187))

(declare-fun m!144189 () Bool)

(assert (=> b!124000 m!144189))

(declare-fun m!144191 () Bool)

(assert (=> b!124001 m!144191))

(declare-fun m!144193 () Bool)

(assert (=> b!124001 m!144193))

(declare-fun m!144195 () Bool)

(assert (=> b!124001 m!144195))

(assert (=> b!124001 m!144181))

(declare-fun m!144197 () Bool)

(assert (=> b!124001 m!144197))

(assert (=> b!124001 m!144181))

(assert (=> b!124001 m!144193))

(assert (=> b!124001 m!144181))

(assert (=> b!124001 m!144195))

(declare-fun m!144199 () Bool)

(assert (=> b!124001 m!144199))

(assert (=> b!124001 m!144191))

(declare-fun m!144201 () Bool)

(assert (=> mapNonEmpty!4452 m!144201))

(declare-fun m!144203 () Bool)

(assert (=> b!124002 m!144203))

(declare-fun m!144205 () Bool)

(assert (=> mapNonEmpty!4451 m!144205))

(check-sat (not start!13522) (not b!124001) (not b!123996) (not b_next!2825) b_and!7621 (not b_lambda!5447) b_and!7619 (not b_next!2827) (not mapNonEmpty!4452) (not b!124000) tp_is_empty!2829 (not b!124002) (not b!123993) (not mapNonEmpty!4451) (not b!123990))
(check-sat b_and!7619 b_and!7621 (not b_next!2825) (not b_next!2827))
(get-model)

(declare-fun b_lambda!5451 () Bool)

(assert (= b_lambda!5447 (or (and b!123990 b_free!2825) (and b!124000 b_free!2827 (= (defaultEntry!2760 newMap!16) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))))) b_lambda!5451)))

(check-sat (not start!13522) (not b_lambda!5451) (not b!124001) (not b!123996) (not b_next!2825) b_and!7621 b_and!7619 (not b_next!2827) (not mapNonEmpty!4452) (not b!124000) tp_is_empty!2829 (not b!124002) (not b!123993) (not mapNonEmpty!4451) (not b!123990))
(check-sat b_and!7619 b_and!7621 (not b_next!2825) (not b_next!2827))
(get-model)

(declare-fun d!37259 () Bool)

(assert (=> d!37259 (= (array_inv!1389 (_keys!4489 newMap!16)) (bvsge (size!2476 (_keys!4489 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124000 d!37259))

(declare-fun d!37261 () Bool)

(assert (=> d!37261 (= (array_inv!1390 (_values!2743 newMap!16)) (bvsge (size!2477 (_values!2743 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124000 d!37261))

(declare-fun d!37263 () Bool)

(assert (=> d!37263 (= (map!1381 newMap!16) (getCurrentListMap!534 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2760 newMap!16)))))

(declare-fun bs!5142 () Bool)

(assert (= bs!5142 d!37263))

(declare-fun m!144241 () Bool)

(assert (=> bs!5142 m!144241))

(assert (=> b!123996 d!37263))

(declare-fun b!124099 () Bool)

(declare-fun e!81144 () ListLongMap!1675)

(declare-fun call!13169 () ListLongMap!1675)

(assert (=> b!124099 (= e!81144 call!13169)))

(declare-fun b!124100 () Bool)

(declare-fun e!81136 () ListLongMap!1675)

(declare-fun call!13171 () ListLongMap!1675)

(declare-fun +!168 (ListLongMap!1675 tuple2!2564) ListLongMap!1675)

(assert (=> b!124100 (= e!81136 (+!168 call!13171 (tuple2!2565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2625 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun bm!13166 () Bool)

(declare-fun call!13175 () Bool)

(declare-fun lt!63820 () ListLongMap!1675)

(assert (=> bm!13166 (= call!13175 (contains!872 lt!63820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!22536 () Bool)

(declare-fun call!13170 () ListLongMap!1675)

(declare-fun bm!13167 () Bool)

(declare-fun c!22535 () Bool)

(declare-fun call!13172 () ListLongMap!1675)

(assert (=> bm!13167 (= call!13171 (+!168 (ite c!22535 call!13172 (ite c!22536 call!13170 call!13169)) (ite (or c!22535 c!22536) (tuple2!2565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2625 (v!3100 (underlying!433 thiss!992)))) (tuple2!2565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2625 (v!3100 (underlying!433 thiss!992)))))))))

(declare-fun b!124101 () Bool)

(declare-datatypes ((Unit!3861 0))(
  ( (Unit!3862) )
))
(declare-fun e!81138 () Unit!3861)

(declare-fun Unit!3863 () Unit!3861)

(assert (=> b!124101 (= e!81138 Unit!3863)))

(declare-fun bm!13168 () Bool)

(assert (=> bm!13168 (= call!13170 call!13172)))

(declare-fun bm!13169 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!134 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 32) Int) ListLongMap!1675)

(assert (=> bm!13169 (= call!13172 (getCurrentListMapNoExtraKeys!134 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!124102 () Bool)

(declare-fun e!81142 () Bool)

(declare-fun call!13174 () Bool)

(assert (=> b!124102 (= e!81142 (not call!13174))))

(declare-fun b!124103 () Bool)

(declare-fun e!81135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124103 (= e!81135 (validKeyInArray!0 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!37265 () Bool)

(declare-fun e!81137 () Bool)

(assert (=> d!37265 e!81137))

(declare-fun res!60193 () Bool)

(assert (=> d!37265 (=> (not res!60193) (not e!81137))))

(assert (=> d!37265 (= res!60193 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))))))))

(declare-fun lt!63821 () ListLongMap!1675)

(assert (=> d!37265 (= lt!63820 lt!63821)))

(declare-fun lt!63828 () Unit!3861)

(assert (=> d!37265 (= lt!63828 e!81138)))

(declare-fun c!22534 () Bool)

(declare-fun e!81134 () Bool)

(assert (=> d!37265 (= c!22534 e!81134)))

(declare-fun res!60192 () Bool)

(assert (=> d!37265 (=> (not res!60192) (not e!81134))))

(assert (=> d!37265 (= res!60192 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))))))

(assert (=> d!37265 (= lt!63821 e!81136)))

(assert (=> d!37265 (= c!22535 (and (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37265 (validMask!0 (mask!7003 (v!3100 (underlying!433 thiss!992))))))

(assert (=> d!37265 (= (getCurrentListMap!534 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))) lt!63820)))

(declare-fun bm!13170 () Bool)

(assert (=> bm!13170 (= call!13174 (contains!872 lt!63820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124104 () Bool)

(declare-fun call!13173 () ListLongMap!1675)

(assert (=> b!124104 (= e!81144 call!13173)))

(declare-fun b!124105 () Bool)

(declare-fun res!60196 () Bool)

(assert (=> b!124105 (=> (not res!60196) (not e!81137))))

(declare-fun e!81141 () Bool)

(assert (=> b!124105 (= res!60196 e!81141)))

(declare-fun c!22538 () Bool)

(assert (=> b!124105 (= c!22538 (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124106 () Bool)

(declare-fun lt!63815 () Unit!3861)

(assert (=> b!124106 (= e!81138 lt!63815)))

(declare-fun lt!63814 () ListLongMap!1675)

(assert (=> b!124106 (= lt!63814 (getCurrentListMapNoExtraKeys!134 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63831 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63822 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63822 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63830 () Unit!3861)

(declare-fun addStillContains!85 (ListLongMap!1675 (_ BitVec 64) V!3419 (_ BitVec 64)) Unit!3861)

(assert (=> b!124106 (= lt!63830 (addStillContains!85 lt!63814 lt!63831 (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) lt!63822))))

(assert (=> b!124106 (contains!872 (+!168 lt!63814 (tuple2!2565 lt!63831 (zeroValue!2625 (v!3100 (underlying!433 thiss!992))))) lt!63822)))

(declare-fun lt!63824 () Unit!3861)

(assert (=> b!124106 (= lt!63824 lt!63830)))

(declare-fun lt!63832 () ListLongMap!1675)

(assert (=> b!124106 (= lt!63832 (getCurrentListMapNoExtraKeys!134 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63811 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63811 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63826 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63826 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63818 () Unit!3861)

(declare-fun addApplyDifferent!85 (ListLongMap!1675 (_ BitVec 64) V!3419 (_ BitVec 64)) Unit!3861)

(assert (=> b!124106 (= lt!63818 (addApplyDifferent!85 lt!63832 lt!63811 (minValue!2625 (v!3100 (underlying!433 thiss!992))) lt!63826))))

(declare-fun apply!109 (ListLongMap!1675 (_ BitVec 64)) V!3419)

(assert (=> b!124106 (= (apply!109 (+!168 lt!63832 (tuple2!2565 lt!63811 (minValue!2625 (v!3100 (underlying!433 thiss!992))))) lt!63826) (apply!109 lt!63832 lt!63826))))

(declare-fun lt!63819 () Unit!3861)

(assert (=> b!124106 (= lt!63819 lt!63818)))

(declare-fun lt!63829 () ListLongMap!1675)

(assert (=> b!124106 (= lt!63829 (getCurrentListMapNoExtraKeys!134 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63816 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63823 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63823 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63825 () Unit!3861)

(assert (=> b!124106 (= lt!63825 (addApplyDifferent!85 lt!63829 lt!63816 (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) lt!63823))))

(assert (=> b!124106 (= (apply!109 (+!168 lt!63829 (tuple2!2565 lt!63816 (zeroValue!2625 (v!3100 (underlying!433 thiss!992))))) lt!63823) (apply!109 lt!63829 lt!63823))))

(declare-fun lt!63812 () Unit!3861)

(assert (=> b!124106 (= lt!63812 lt!63825)))

(declare-fun lt!63817 () ListLongMap!1675)

(assert (=> b!124106 (= lt!63817 (getCurrentListMapNoExtraKeys!134 (_keys!4489 (v!3100 (underlying!433 thiss!992))) (_values!2743 (v!3100 (underlying!433 thiss!992))) (mask!7003 (v!3100 (underlying!433 thiss!992))) (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) (zeroValue!2625 (v!3100 (underlying!433 thiss!992))) (minValue!2625 (v!3100 (underlying!433 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun lt!63813 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63827 () (_ BitVec 64))

(assert (=> b!124106 (= lt!63827 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124106 (= lt!63815 (addApplyDifferent!85 lt!63817 lt!63813 (minValue!2625 (v!3100 (underlying!433 thiss!992))) lt!63827))))

(assert (=> b!124106 (= (apply!109 (+!168 lt!63817 (tuple2!2565 lt!63813 (minValue!2625 (v!3100 (underlying!433 thiss!992))))) lt!63827) (apply!109 lt!63817 lt!63827))))

(declare-fun b!124107 () Bool)

(assert (=> b!124107 (= e!81134 (validKeyInArray!0 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124108 () Bool)

(declare-fun e!81143 () Bool)

(assert (=> b!124108 (= e!81143 (= (apply!109 lt!63820 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2625 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun bm!13171 () Bool)

(assert (=> bm!13171 (= call!13169 call!13170)))

(declare-fun b!124109 () Bool)

(assert (=> b!124109 (= e!81137 e!81142)))

(declare-fun c!22537 () Bool)

(assert (=> b!124109 (= c!22537 (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124110 () Bool)

(declare-fun e!81132 () ListLongMap!1675)

(assert (=> b!124110 (= e!81132 call!13173)))

(declare-fun b!124111 () Bool)

(declare-fun e!81139 () Bool)

(assert (=> b!124111 (= e!81141 e!81139)))

(declare-fun res!60191 () Bool)

(assert (=> b!124111 (= res!60191 call!13175)))

(assert (=> b!124111 (=> (not res!60191) (not e!81139))))

(declare-fun b!124112 () Bool)

(declare-fun res!60197 () Bool)

(assert (=> b!124112 (=> (not res!60197) (not e!81137))))

(declare-fun e!81140 () Bool)

(assert (=> b!124112 (= res!60197 e!81140)))

(declare-fun res!60194 () Bool)

(assert (=> b!124112 (=> res!60194 e!81140)))

(assert (=> b!124112 (= res!60194 (not e!81135))))

(declare-fun res!60195 () Bool)

(assert (=> b!124112 (=> (not res!60195) (not e!81135))))

(assert (=> b!124112 (= res!60195 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124113 () Bool)

(declare-fun e!81133 () Bool)

(assert (=> b!124113 (= e!81133 (= (apply!109 lt!63820 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124113 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2477 (_values!2743 (v!3100 (underlying!433 thiss!992))))))))

(assert (=> b!124113 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124114 () Bool)

(assert (=> b!124114 (= e!81140 e!81133)))

(declare-fun res!60189 () Bool)

(assert (=> b!124114 (=> (not res!60189) (not e!81133))))

(assert (=> b!124114 (= res!60189 (contains!872 lt!63820 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992))))))))

(declare-fun b!124115 () Bool)

(assert (=> b!124115 (= e!81139 (= (apply!109 lt!63820 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2625 (v!3100 (underlying!433 thiss!992)))))))

(declare-fun b!124116 () Bool)

(assert (=> b!124116 (= e!81141 (not call!13175))))

(declare-fun b!124117 () Bool)

(assert (=> b!124117 (= e!81142 e!81143)))

(declare-fun res!60190 () Bool)

(assert (=> b!124117 (= res!60190 call!13174)))

(assert (=> b!124117 (=> (not res!60190) (not e!81143))))

(declare-fun b!124118 () Bool)

(declare-fun c!22539 () Bool)

(assert (=> b!124118 (= c!22539 (and (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124118 (= e!81132 e!81144)))

(declare-fun bm!13172 () Bool)

(assert (=> bm!13172 (= call!13173 call!13171)))

(declare-fun b!124119 () Bool)

(assert (=> b!124119 (= e!81136 e!81132)))

(assert (=> b!124119 (= c!22536 (and (not (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2545 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!37265 c!22535) b!124100))

(assert (= (and d!37265 (not c!22535)) b!124119))

(assert (= (and b!124119 c!22536) b!124110))

(assert (= (and b!124119 (not c!22536)) b!124118))

(assert (= (and b!124118 c!22539) b!124104))

(assert (= (and b!124118 (not c!22539)) b!124099))

(assert (= (or b!124104 b!124099) bm!13171))

(assert (= (or b!124110 bm!13171) bm!13168))

(assert (= (or b!124110 b!124104) bm!13172))

(assert (= (or b!124100 bm!13168) bm!13169))

(assert (= (or b!124100 bm!13172) bm!13167))

(assert (= (and d!37265 res!60192) b!124107))

(assert (= (and d!37265 c!22534) b!124106))

(assert (= (and d!37265 (not c!22534)) b!124101))

(assert (= (and d!37265 res!60193) b!124112))

(assert (= (and b!124112 res!60195) b!124103))

(assert (= (and b!124112 (not res!60194)) b!124114))

(assert (= (and b!124114 res!60189) b!124113))

(assert (= (and b!124112 res!60197) b!124105))

(assert (= (and b!124105 c!22538) b!124111))

(assert (= (and b!124105 (not c!22538)) b!124116))

(assert (= (and b!124111 res!60191) b!124115))

(assert (= (or b!124111 b!124116) bm!13166))

(assert (= (and b!124105 res!60196) b!124109))

(assert (= (and b!124109 c!22537) b!124117))

(assert (= (and b!124109 (not c!22537)) b!124102))

(assert (= (and b!124117 res!60190) b!124108))

(assert (= (or b!124117 b!124102) bm!13170))

(declare-fun b_lambda!5453 () Bool)

(assert (=> (not b_lambda!5453) (not b!124113)))

(assert (=> b!124113 t!6005))

(declare-fun b_and!7631 () Bool)

(assert (= b_and!7619 (and (=> t!6005 result!3785) b_and!7631)))

(assert (=> b!124113 t!6007))

(declare-fun b_and!7633 () Bool)

(assert (= b_and!7621 (and (=> t!6007 result!3789) b_and!7633)))

(assert (=> b!124113 m!144193))

(declare-fun m!144243 () Bool)

(assert (=> b!124113 m!144243))

(assert (=> b!124113 m!144193))

(declare-fun m!144245 () Bool)

(assert (=> b!124113 m!144245))

(declare-fun m!144247 () Bool)

(assert (=> b!124113 m!144247))

(assert (=> b!124113 m!144243))

(assert (=> b!124113 m!144247))

(declare-fun m!144249 () Bool)

(assert (=> b!124113 m!144249))

(declare-fun m!144251 () Bool)

(assert (=> bm!13169 m!144251))

(declare-fun m!144253 () Bool)

(assert (=> bm!13166 m!144253))

(declare-fun m!144255 () Bool)

(assert (=> b!124106 m!144255))

(declare-fun m!144257 () Bool)

(assert (=> b!124106 m!144257))

(assert (=> b!124106 m!144247))

(declare-fun m!144259 () Bool)

(assert (=> b!124106 m!144259))

(declare-fun m!144261 () Bool)

(assert (=> b!124106 m!144261))

(declare-fun m!144263 () Bool)

(assert (=> b!124106 m!144263))

(declare-fun m!144265 () Bool)

(assert (=> b!124106 m!144265))

(declare-fun m!144267 () Bool)

(assert (=> b!124106 m!144267))

(declare-fun m!144269 () Bool)

(assert (=> b!124106 m!144269))

(declare-fun m!144271 () Bool)

(assert (=> b!124106 m!144271))

(declare-fun m!144273 () Bool)

(assert (=> b!124106 m!144273))

(declare-fun m!144275 () Bool)

(assert (=> b!124106 m!144275))

(declare-fun m!144277 () Bool)

(assert (=> b!124106 m!144277))

(assert (=> b!124106 m!144269))

(declare-fun m!144279 () Bool)

(assert (=> b!124106 m!144279))

(assert (=> b!124106 m!144263))

(declare-fun m!144281 () Bool)

(assert (=> b!124106 m!144281))

(assert (=> b!124106 m!144255))

(assert (=> b!124106 m!144251))

(assert (=> b!124106 m!144265))

(declare-fun m!144283 () Bool)

(assert (=> b!124106 m!144283))

(declare-fun m!144285 () Bool)

(assert (=> b!124108 m!144285))

(declare-fun m!144287 () Bool)

(assert (=> bm!13167 m!144287))

(assert (=> b!124103 m!144247))

(assert (=> b!124103 m!144247))

(declare-fun m!144289 () Bool)

(assert (=> b!124103 m!144289))

(declare-fun m!144291 () Bool)

(assert (=> bm!13170 m!144291))

(assert (=> d!37265 m!144203))

(assert (=> b!124107 m!144247))

(assert (=> b!124107 m!144247))

(assert (=> b!124107 m!144289))

(declare-fun m!144293 () Bool)

(assert (=> b!124115 m!144293))

(assert (=> b!124114 m!144247))

(assert (=> b!124114 m!144247))

(declare-fun m!144295 () Bool)

(assert (=> b!124114 m!144295))

(declare-fun m!144297 () Bool)

(assert (=> b!124100 m!144297))

(assert (=> b!123996 d!37265))

(declare-fun d!37267 () Bool)

(assert (=> d!37267 (= (valid!499 thiss!992) (valid!500 (v!3100 (underlying!433 thiss!992))))))

(declare-fun bs!5143 () Bool)

(assert (= bs!5143 d!37267))

(declare-fun m!144299 () Bool)

(assert (=> bs!5143 m!144299))

(assert (=> start!13522 d!37267))

(declare-fun d!37269 () Bool)

(assert (=> d!37269 (= (array_inv!1389 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) (bvsge (size!2476 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123990 d!37269))

(declare-fun d!37271 () Bool)

(assert (=> d!37271 (= (array_inv!1390 (_values!2743 (v!3100 (underlying!433 thiss!992)))) (bvsge (size!2477 (_values!2743 (v!3100 (underlying!433 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123990 d!37271))

(declare-fun d!37273 () Bool)

(assert (=> d!37273 (= (validMask!0 (mask!7003 (v!3100 (underlying!433 thiss!992)))) (and (or (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000000111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000001111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000011111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000000111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000001111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000011111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000000111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000001111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000011111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000000111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000001111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000011111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000000111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000001111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000011111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000000111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000001111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000011111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000000111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000001111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000011111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000000111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000001111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000011111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00000111111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00001111111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00011111111111111111111111111111) (= (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7003 (v!3100 (underlying!433 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124002 d!37273))

(declare-fun d!37275 () Bool)

(declare-fun e!81150 () Bool)

(assert (=> d!37275 e!81150))

(declare-fun res!60200 () Bool)

(assert (=> d!37275 (=> res!60200 e!81150)))

(declare-fun lt!63841 () Bool)

(assert (=> d!37275 (= res!60200 (not lt!63841))))

(declare-fun lt!63844 () Bool)

(assert (=> d!37275 (= lt!63841 lt!63844)))

(declare-fun lt!63842 () Unit!3861)

(declare-fun e!81149 () Unit!3861)

(assert (=> d!37275 (= lt!63842 e!81149)))

(declare-fun c!22542 () Bool)

(assert (=> d!37275 (= c!22542 lt!63844)))

(declare-fun containsKey!169 (List!1693 (_ BitVec 64)) Bool)

(assert (=> d!37275 (= lt!63844 (containsKey!169 (toList!853 lt!63757) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(assert (=> d!37275 (= (contains!872 lt!63757 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)) lt!63841)))

(declare-fun b!124126 () Bool)

(declare-fun lt!63843 () Unit!3861)

(assert (=> b!124126 (= e!81149 lt!63843)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!117 (List!1693 (_ BitVec 64)) Unit!3861)

(assert (=> b!124126 (= lt!63843 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!853 lt!63757) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-datatypes ((Option!171 0))(
  ( (Some!170 (v!3104 V!3419)) (None!169) )
))
(declare-fun isDefined!118 (Option!171) Bool)

(declare-fun getValueByKey!165 (List!1693 (_ BitVec 64)) Option!171)

(assert (=> b!124126 (isDefined!118 (getValueByKey!165 (toList!853 lt!63757) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun b!124127 () Bool)

(declare-fun Unit!3864 () Unit!3861)

(assert (=> b!124127 (= e!81149 Unit!3864)))

(declare-fun b!124128 () Bool)

(assert (=> b!124128 (= e!81150 (isDefined!118 (getValueByKey!165 (toList!853 lt!63757) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355))))))

(assert (= (and d!37275 c!22542) b!124126))

(assert (= (and d!37275 (not c!22542)) b!124127))

(assert (= (and d!37275 (not res!60200)) b!124128))

(assert (=> d!37275 m!144181))

(declare-fun m!144301 () Bool)

(assert (=> d!37275 m!144301))

(assert (=> b!124126 m!144181))

(declare-fun m!144303 () Bool)

(assert (=> b!124126 m!144303))

(assert (=> b!124126 m!144181))

(declare-fun m!144305 () Bool)

(assert (=> b!124126 m!144305))

(assert (=> b!124126 m!144305))

(declare-fun m!144307 () Bool)

(assert (=> b!124126 m!144307))

(assert (=> b!124128 m!144181))

(assert (=> b!124128 m!144305))

(assert (=> b!124128 m!144305))

(assert (=> b!124128 m!144307))

(assert (=> b!124001 d!37275))

(declare-fun b!124213 () Bool)

(declare-fun res!60232 () Bool)

(declare-datatypes ((SeekEntryResult!268 0))(
  ( (MissingZero!268 (index!3226 (_ BitVec 32))) (Found!268 (index!3227 (_ BitVec 32))) (Intermediate!268 (undefined!1080 Bool) (index!3228 (_ BitVec 32)) (x!14777 (_ BitVec 32))) (Undefined!268) (MissingVacant!268 (index!3229 (_ BitVec 32))) )
))
(declare-fun lt!63911 () SeekEntryResult!268)

(assert (=> b!124213 (= res!60232 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3229 lt!63911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81199 () Bool)

(assert (=> b!124213 (=> (not res!60232) (not e!81199))))

(declare-fun bm!13221 () Bool)

(declare-fun call!13245 () Bool)

(declare-fun arrayContainsKey!0 (array!4671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13221 (= call!13245 (arrayContainsKey!0 (_keys!4489 newMap!16) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124214 () Bool)

(declare-fun e!81195 () tuple2!2566)

(declare-fun e!81204 () tuple2!2566)

(assert (=> b!124214 (= e!81195 e!81204)))

(declare-fun lt!63900 () SeekEntryResult!268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4671 (_ BitVec 32)) SeekEntryResult!268)

(assert (=> b!124214 (= lt!63900 (seekEntryOrOpen!0 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (_keys!4489 newMap!16) (mask!7003 newMap!16)))))

(declare-fun c!22581 () Bool)

(assert (=> b!124214 (= c!22581 ((_ is Undefined!268) lt!63900))))

(declare-fun b!124215 () Bool)

(declare-fun res!60238 () Bool)

(declare-fun call!13237 () Bool)

(assert (=> b!124215 (= res!60238 call!13237)))

(declare-fun e!81203 () Bool)

(assert (=> b!124215 (=> (not res!60238) (not e!81203))))

(declare-fun b!124216 () Bool)

(declare-fun res!60231 () Bool)

(declare-fun e!81201 () Bool)

(assert (=> b!124216 (=> (not res!60231) (not e!81201))))

(assert (=> b!124216 (= res!60231 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3226 lt!63911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124217 () Bool)

(declare-fun e!81200 () tuple2!2566)

(declare-fun e!81216 () tuple2!2566)

(assert (=> b!124217 (= e!81200 e!81216)))

(declare-fun c!22580 () Bool)

(assert (=> b!124217 (= c!22580 ((_ is MissingZero!268) lt!63900))))

(declare-fun b!124218 () Bool)

(declare-fun e!81196 () Bool)

(declare-fun call!13234 () Bool)

(assert (=> b!124218 (= e!81196 (not call!13234))))

(declare-fun b!124219 () Bool)

(declare-fun e!81205 () Bool)

(declare-fun call!13229 () ListLongMap!1675)

(declare-fun call!13239 () ListLongMap!1675)

(assert (=> b!124219 (= e!81205 (= call!13229 call!13239))))

(declare-fun b!124220 () Bool)

(declare-fun e!81207 () ListLongMap!1675)

(assert (=> b!124220 (= e!81207 (getCurrentListMap!534 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2760 newMap!16)))))

(declare-fun b!124221 () Bool)

(declare-fun lt!63920 () Unit!3861)

(declare-fun e!81210 () Unit!3861)

(assert (=> b!124221 (= lt!63920 e!81210)))

(declare-fun c!22583 () Bool)

(declare-fun call!13227 () Bool)

(assert (=> b!124221 (= c!22583 call!13227)))

(assert (=> b!124221 (= e!81204 (tuple2!2567 false newMap!16))))

(declare-fun bm!13222 () Bool)

(declare-fun call!13224 () ListLongMap!1675)

(declare-fun call!13228 () ListLongMap!1675)

(assert (=> bm!13222 (= call!13224 call!13228)))

(declare-fun bm!13223 () Bool)

(declare-fun call!13226 () ListLongMap!1675)

(declare-fun call!13238 () ListLongMap!1675)

(assert (=> bm!13223 (= call!13226 call!13238)))

(declare-fun bm!13224 () Bool)

(declare-fun c!22577 () Bool)

(declare-fun call!13242 () tuple2!2566)

(declare-fun updateHelperNewKey!54 (LongMapFixedSize!1050 (_ BitVec 64) V!3419 (_ BitVec 32)) tuple2!2566)

(assert (=> bm!13224 (= call!13242 (updateHelperNewKey!54 newMap!16 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22577 (index!3229 lt!63900) (index!3226 lt!63900))))))

(declare-fun bm!13225 () Bool)

(declare-fun lt!63905 () (_ BitVec 32))

(declare-fun c!22582 () Bool)

(declare-fun c!22579 () Bool)

(assert (=> bm!13225 (= call!13238 (getCurrentListMap!534 (_keys!4489 newMap!16) (ite c!22582 (_values!2743 newMap!16) (array!4674 (store (arr!2214 (_values!2743 newMap!16)) (index!3227 lt!63900) (ValueCellFull!1071 (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2477 (_values!2743 newMap!16)))) (mask!7003 newMap!16) (ite (and c!22582 c!22579) lt!63905 (extraKeys!2545 newMap!16)) (ite (and c!22582 c!22579) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2625 newMap!16)) (minValue!2625 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2760 newMap!16)))))

(declare-fun bm!13226 () Bool)

(declare-fun call!13231 () Bool)

(declare-fun call!13241 () Bool)

(assert (=> bm!13226 (= call!13231 call!13241)))

(declare-fun b!124222 () Bool)

(declare-fun res!60234 () Bool)

(assert (=> b!124222 (=> (not res!60234) (not e!81196))))

(declare-fun call!13246 () Bool)

(assert (=> b!124222 (= res!60234 call!13246)))

(declare-fun e!81214 () Bool)

(assert (=> b!124222 (= e!81214 e!81196)))

(declare-fun bm!13227 () Bool)

(declare-fun call!13233 () ListLongMap!1675)

(assert (=> bm!13227 (= call!13233 call!13228)))

(declare-fun b!124223 () Bool)

(declare-fun res!60242 () Bool)

(assert (=> b!124223 (=> (not res!60242) (not e!81201))))

(declare-fun call!13240 () Bool)

(assert (=> b!124223 (= res!60242 call!13240)))

(declare-fun e!81215 () Bool)

(assert (=> b!124223 (= e!81215 e!81201)))

(declare-fun b!124224 () Bool)

(declare-fun e!81198 () ListLongMap!1675)

(assert (=> b!124224 (= e!81198 call!13224)))

(declare-fun call!13235 () ListLongMap!1675)

(declare-fun bm!13228 () Bool)

(assert (=> bm!13228 (= call!13235 (+!168 e!81207 (ite c!22582 (ite c!22579 (tuple2!2565 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2565 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2565 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22575 () Bool)

(assert (=> bm!13228 (= c!22575 c!22582)))

(declare-fun b!124225 () Bool)

(declare-fun e!81202 () Bool)

(declare-fun lt!63925 () SeekEntryResult!268)

(assert (=> b!124225 (= e!81202 ((_ is Undefined!268) lt!63925))))

(declare-fun b!124226 () Bool)

(declare-fun e!81206 () Bool)

(assert (=> b!124226 (= e!81206 e!81205)))

(declare-fun c!22576 () Bool)

(declare-fun lt!63899 () tuple2!2566)

(assert (=> b!124226 (= c!22576 (_1!1294 lt!63899))))

(declare-fun b!124227 () Bool)

(declare-fun lt!63904 () Unit!3861)

(declare-fun lt!63924 () Unit!3861)

(assert (=> b!124227 (= lt!63904 lt!63924)))

(declare-fun call!13232 () ListLongMap!1675)

(assert (=> b!124227 (= call!13232 call!13226)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!54 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 V!3419 Int) Unit!3861)

(assert (=> b!124227 (= lt!63924 (lemmaChangeZeroKeyThenAddPairToListMap!54 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) lt!63905 (zeroValue!2625 newMap!16) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2625 newMap!16) (defaultEntry!2760 newMap!16)))))

(assert (=> b!124227 (= lt!63905 (bvor (extraKeys!2545 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!81211 () tuple2!2566)

(assert (=> b!124227 (= e!81211 (tuple2!2567 true (LongMapFixedSize!1051 (defaultEntry!2760 newMap!16) (mask!7003 newMap!16) (bvor (extraKeys!2545 newMap!16) #b00000000000000000000000000000001) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2625 newMap!16) (_size!574 newMap!16) (_keys!4489 newMap!16) (_values!2743 newMap!16) (_vacant!574 newMap!16))))))

(declare-fun call!13247 () SeekEntryResult!268)

(declare-fun bm!13229 () Bool)

(assert (=> bm!13229 (= call!13247 (seekEntryOrOpen!0 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (_keys!4489 newMap!16) (mask!7003 newMap!16)))))

(declare-fun bm!13230 () Bool)

(declare-fun c!22573 () Bool)

(assert (=> bm!13230 (= c!22573 c!22581)))

(assert (=> bm!13230 (= call!13227 (contains!872 e!81198 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun bm!13231 () Bool)

(declare-fun lt!63921 () (_ BitVec 32))

(declare-fun lt!63910 () array!4673)

(assert (=> bm!13231 (= call!13228 (getCurrentListMap!534 (_keys!4489 newMap!16) (ite (or c!22582 c!22581) (_values!2743 newMap!16) lt!63910) (mask!7003 newMap!16) (ite c!22582 (ite c!22579 (extraKeys!2545 newMap!16) lt!63921) (extraKeys!2545 newMap!16)) (zeroValue!2625 newMap!16) (ite c!22582 (ite c!22579 (minValue!2625 newMap!16) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2625 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2760 newMap!16)))))

(declare-fun bm!13232 () Bool)

(declare-fun call!13243 () SeekEntryResult!268)

(assert (=> bm!13232 (= call!13243 call!13247)))

(declare-fun b!124228 () Bool)

(declare-fun e!81208 () Bool)

(assert (=> b!124228 (= e!81208 (= call!13229 (+!168 call!13239 (tuple2!2565 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!124229 () Bool)

(declare-fun call!13230 () Bool)

(assert (=> b!124229 (= e!81199 (not call!13230))))

(declare-fun bm!13233 () Bool)

(assert (=> bm!13233 (= call!13229 (map!1381 (_2!1294 lt!63899)))))

(declare-fun b!124230 () Bool)

(assert (=> b!124230 (= e!81207 (ite c!22579 call!13233 call!13226))))

(declare-fun bm!13234 () Bool)

(assert (=> bm!13234 (= call!13239 (map!1381 newMap!16))))

(declare-fun b!124231 () Bool)

(declare-fun lt!63914 () Unit!3861)

(declare-fun lt!63923 () Unit!3861)

(assert (=> b!124231 (= lt!63914 lt!63923)))

(assert (=> b!124231 (contains!872 call!13224 (select (arr!2213 (_keys!4489 newMap!16)) (index!3227 lt!63900)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!115 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 32) Int) Unit!3861)

(assert (=> b!124231 (= lt!63923 (lemmaValidKeyInArrayIsInListMap!115 (_keys!4489 newMap!16) lt!63910 (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (index!3227 lt!63900) (defaultEntry!2760 newMap!16)))))

(assert (=> b!124231 (= lt!63910 (array!4674 (store (arr!2214 (_values!2743 newMap!16)) (index!3227 lt!63900) (ValueCellFull!1071 (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2477 (_values!2743 newMap!16))))))

(declare-fun lt!63919 () Unit!3861)

(declare-fun lt!63916 () Unit!3861)

(assert (=> b!124231 (= lt!63919 lt!63916)))

(assert (=> b!124231 (= call!13235 call!13238)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 32) (_ BitVec 64) V!3419 Int) Unit!3861)

(assert (=> b!124231 (= lt!63916 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!54 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (index!3227 lt!63900) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2760 newMap!16)))))

(declare-fun lt!63915 () Unit!3861)

(declare-fun e!81212 () Unit!3861)

(assert (=> b!124231 (= lt!63915 e!81212)))

(declare-fun c!22572 () Bool)

(assert (=> b!124231 (= c!22572 call!13227)))

(assert (=> b!124231 (= e!81216 (tuple2!2567 true (LongMapFixedSize!1051 (defaultEntry!2760 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (_size!574 newMap!16) (_keys!4489 newMap!16) (array!4674 (store (arr!2214 (_values!2743 newMap!16)) (index!3227 lt!63900) (ValueCellFull!1071 (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2477 (_values!2743 newMap!16))) (_vacant!574 newMap!16))))))

(declare-fun bm!13235 () Bool)

(assert (=> bm!13235 (= call!13237 call!13241)))

(declare-fun bm!13236 () Bool)

(assert (=> bm!13236 (= call!13232 call!13235)))

(declare-fun b!124232 () Bool)

(declare-fun Unit!3865 () Unit!3861)

(assert (=> b!124232 (= e!81210 Unit!3865)))

(declare-fun lt!63906 () Unit!3861)

(declare-fun call!13244 () Unit!3861)

(assert (=> b!124232 (= lt!63906 call!13244)))

(declare-fun lt!63901 () SeekEntryResult!268)

(declare-fun call!13225 () SeekEntryResult!268)

(assert (=> b!124232 (= lt!63901 call!13225)))

(declare-fun res!60233 () Bool)

(assert (=> b!124232 (= res!60233 ((_ is Found!268) lt!63901))))

(declare-fun e!81209 () Bool)

(assert (=> b!124232 (=> (not res!60233) (not e!81209))))

(assert (=> b!124232 e!81209))

(declare-fun lt!63902 () Unit!3861)

(assert (=> b!124232 (= lt!63902 lt!63906)))

(assert (=> b!124232 false))

(declare-fun b!124233 () Bool)

(declare-fun c!22578 () Bool)

(assert (=> b!124233 (= c!22578 ((_ is MissingVacant!268) lt!63911))))

(declare-fun e!81213 () Bool)

(assert (=> b!124233 (= e!81215 e!81213)))

(declare-fun b!124234 () Bool)

(assert (=> b!124234 (= e!81213 e!81199)))

(declare-fun res!60229 () Bool)

(assert (=> b!124234 (= res!60229 call!13240)))

(assert (=> b!124234 (=> (not res!60229) (not e!81199))))

(declare-fun bm!13237 () Bool)

(assert (=> bm!13237 (= call!13234 call!13245)))

(declare-fun b!124235 () Bool)

(declare-fun Unit!3866 () Unit!3861)

(assert (=> b!124235 (= e!81212 Unit!3866)))

(declare-fun lt!63913 () Unit!3861)

(declare-fun call!13236 () Unit!3861)

(assert (=> b!124235 (= lt!63913 call!13236)))

(assert (=> b!124235 (= lt!63925 call!13243)))

(declare-fun c!22574 () Bool)

(assert (=> b!124235 (= c!22574 ((_ is MissingZero!268) lt!63925))))

(assert (=> b!124235 e!81214))

(declare-fun lt!63917 () Unit!3861)

(assert (=> b!124235 (= lt!63917 lt!63913)))

(assert (=> b!124235 false))

(declare-fun bm!13238 () Bool)

(assert (=> bm!13238 (= call!13230 call!13245)))

(declare-fun lt!63903 () SeekEntryResult!268)

(declare-fun bm!13239 () Bool)

(declare-fun c!22571 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13239 (= call!13241 (inRange!0 (ite c!22581 (ite c!22583 (index!3227 lt!63901) (ite c!22571 (index!3226 lt!63911) (index!3229 lt!63911))) (ite c!22572 (index!3227 lt!63903) (ite c!22574 (index!3226 lt!63925) (index!3229 lt!63925)))) (mask!7003 newMap!16)))))

(declare-fun bm!13240 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 64) Int) Unit!3861)

(assert (=> bm!13240 (= call!13244 (lemmaInListMapThenSeekEntryOrOpenFindsIt!54 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (defaultEntry!2760 newMap!16)))))

(declare-fun b!124236 () Bool)

(assert (=> b!124236 (= e!81198 (getCurrentListMap!534 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2760 newMap!16)))))

(declare-fun b!124237 () Bool)

(assert (=> b!124237 (= c!22577 ((_ is MissingVacant!268) lt!63900))))

(assert (=> b!124237 (= e!81204 e!81200)))

(declare-fun b!124238 () Bool)

(declare-fun e!81197 () Bool)

(assert (=> b!124238 (= e!81197 (not call!13234))))

(declare-fun b!124239 () Bool)

(assert (=> b!124239 (= e!81203 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3227 lt!63903)) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun b!124240 () Bool)

(assert (=> b!124240 (= e!81205 e!81208)))

(declare-fun res!60241 () Bool)

(assert (=> b!124240 (= res!60241 (contains!872 call!13229 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(assert (=> b!124240 (=> (not res!60241) (not e!81208))))

(declare-fun bm!13241 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 (_ BitVec 64) Int) Unit!3861)

(assert (=> bm!13241 (= call!13236 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!54 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (defaultEntry!2760 newMap!16)))))

(declare-fun b!124241 () Bool)

(assert (=> b!124241 (= e!81209 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3227 lt!63901)) (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun bm!13242 () Bool)

(assert (=> bm!13242 (= call!13225 call!13247)))

(declare-fun b!124242 () Bool)

(declare-fun lt!63908 () Unit!3861)

(declare-fun lt!63909 () Unit!3861)

(assert (=> b!124242 (= lt!63908 lt!63909)))

(assert (=> b!124242 (= call!13232 call!13233)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (array!4671 array!4673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3419 V!3419 V!3419 Int) Unit!3861)

(assert (=> b!124242 (= lt!63909 (lemmaChangeLongMinValueKeyThenAddPairToListMap!54 (_keys!4489 newMap!16) (_values!2743 newMap!16) (mask!7003 newMap!16) (extraKeys!2545 newMap!16) lt!63921 (zeroValue!2625 newMap!16) (minValue!2625 newMap!16) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2760 newMap!16)))))

(assert (=> b!124242 (= lt!63921 (bvor (extraKeys!2545 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!124242 (= e!81211 (tuple2!2567 true (LongMapFixedSize!1051 (defaultEntry!2760 newMap!16) (mask!7003 newMap!16) (bvor (extraKeys!2545 newMap!16) #b00000000000000000000000000000010) (zeroValue!2625 newMap!16) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!574 newMap!16) (_keys!4489 newMap!16) (_values!2743 newMap!16) (_vacant!574 newMap!16))))))

(declare-fun d!37277 () Bool)

(assert (=> d!37277 e!81206))

(declare-fun res!60240 () Bool)

(assert (=> d!37277 (=> (not res!60240) (not e!81206))))

(assert (=> d!37277 (= res!60240 (valid!500 (_2!1294 lt!63899)))))

(assert (=> d!37277 (= lt!63899 e!81195)))

(assert (=> d!37277 (= c!22582 (= (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (bvneg (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355))))))

(assert (=> d!37277 (valid!500 newMap!16)))

(assert (=> d!37277 (= (update!179 newMap!16 (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!63899)))

(declare-fun b!124243 () Bool)

(declare-fun lt!63907 () Unit!3861)

(assert (=> b!124243 (= e!81210 lt!63907)))

(assert (=> b!124243 (= lt!63907 call!13236)))

(assert (=> b!124243 (= lt!63911 call!13225)))

(assert (=> b!124243 (= c!22571 ((_ is MissingZero!268) lt!63911))))

(assert (=> b!124243 e!81215))

(declare-fun b!124244 () Bool)

(declare-fun lt!63922 () Unit!3861)

(assert (=> b!124244 (= e!81212 lt!63922)))

(assert (=> b!124244 (= lt!63922 call!13244)))

(assert (=> b!124244 (= lt!63903 call!13243)))

(declare-fun res!60230 () Bool)

(assert (=> b!124244 (= res!60230 ((_ is Found!268) lt!63903))))

(assert (=> b!124244 (=> (not res!60230) (not e!81203))))

(assert (=> b!124244 e!81203))

(declare-fun b!124245 () Bool)

(assert (=> b!124245 (= e!81213 ((_ is Undefined!268) lt!63911))))

(declare-fun b!124246 () Bool)

(declare-fun lt!63918 () tuple2!2566)

(assert (=> b!124246 (= lt!63918 call!13242)))

(assert (=> b!124246 (= e!81216 (tuple2!2567 (_1!1294 lt!63918) (_2!1294 lt!63918)))))

(declare-fun b!124247 () Bool)

(assert (=> b!124247 (= e!81202 e!81197)))

(declare-fun res!60236 () Bool)

(assert (=> b!124247 (= res!60236 call!13246)))

(assert (=> b!124247 (=> (not res!60236) (not e!81197))))

(declare-fun b!124248 () Bool)

(assert (=> b!124248 (= e!81201 (not call!13230))))

(declare-fun b!124249 () Bool)

(declare-fun res!60239 () Bool)

(assert (=> b!124249 (=> (not res!60239) (not e!81196))))

(assert (=> b!124249 (= res!60239 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3226 lt!63925)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124250 () Bool)

(declare-fun c!22584 () Bool)

(assert (=> b!124250 (= c!22584 ((_ is MissingVacant!268) lt!63925))))

(assert (=> b!124250 (= e!81214 e!81202)))

(declare-fun bm!13243 () Bool)

(assert (=> bm!13243 (= call!13246 call!13237)))

(declare-fun b!124251 () Bool)

(declare-fun res!60237 () Bool)

(assert (=> b!124251 (= res!60237 call!13231)))

(assert (=> b!124251 (=> (not res!60237) (not e!81209))))

(declare-fun b!124252 () Bool)

(assert (=> b!124252 (= e!81195 e!81211)))

(assert (=> b!124252 (= c!22579 (= (select (arr!2213 (_keys!4489 (v!3100 (underlying!433 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124253 () Bool)

(declare-fun res!60235 () Bool)

(assert (=> b!124253 (= res!60235 (= (select (arr!2213 (_keys!4489 newMap!16)) (index!3229 lt!63925)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124253 (=> (not res!60235) (not e!81197))))

(declare-fun bm!13244 () Bool)

(assert (=> bm!13244 (= call!13240 call!13231)))

(declare-fun b!124254 () Bool)

(declare-fun lt!63912 () tuple2!2566)

(assert (=> b!124254 (= e!81200 (tuple2!2567 (_1!1294 lt!63912) (_2!1294 lt!63912)))))

(assert (=> b!124254 (= lt!63912 call!13242)))

(assert (= (and d!37277 c!22582) b!124252))

(assert (= (and d!37277 (not c!22582)) b!124214))

(assert (= (and b!124252 c!22579) b!124227))

(assert (= (and b!124252 (not c!22579)) b!124242))

(assert (= (or b!124227 b!124242) bm!13227))

(assert (= (or b!124227 b!124242) bm!13223))

(assert (= (or b!124227 b!124242) bm!13236))

(assert (= (and b!124214 c!22581) b!124221))

(assert (= (and b!124214 (not c!22581)) b!124237))

(assert (= (and b!124221 c!22583) b!124232))

(assert (= (and b!124221 (not c!22583)) b!124243))

(assert (= (and b!124232 res!60233) b!124251))

(assert (= (and b!124251 res!60237) b!124241))

(assert (= (and b!124243 c!22571) b!124223))

(assert (= (and b!124243 (not c!22571)) b!124233))

(assert (= (and b!124223 res!60242) b!124216))

(assert (= (and b!124216 res!60231) b!124248))

(assert (= (and b!124233 c!22578) b!124234))

(assert (= (and b!124233 (not c!22578)) b!124245))

(assert (= (and b!124234 res!60229) b!124213))

(assert (= (and b!124213 res!60232) b!124229))

(assert (= (or b!124223 b!124234) bm!13244))

(assert (= (or b!124248 b!124229) bm!13238))

(assert (= (or b!124251 bm!13244) bm!13226))

(assert (= (or b!124232 b!124243) bm!13242))

(assert (= (and b!124237 c!22577) b!124254))

(assert (= (and b!124237 (not c!22577)) b!124217))

(assert (= (and b!124217 c!22580) b!124246))

(assert (= (and b!124217 (not c!22580)) b!124231))

(assert (= (and b!124231 c!22572) b!124244))

(assert (= (and b!124231 (not c!22572)) b!124235))

(assert (= (and b!124244 res!60230) b!124215))

(assert (= (and b!124215 res!60238) b!124239))

(assert (= (and b!124235 c!22574) b!124222))

(assert (= (and b!124235 (not c!22574)) b!124250))

(assert (= (and b!124222 res!60234) b!124249))

(assert (= (and b!124249 res!60239) b!124218))

(assert (= (and b!124250 c!22584) b!124247))

(assert (= (and b!124250 (not c!22584)) b!124225))

(assert (= (and b!124247 res!60236) b!124253))

(assert (= (and b!124253 res!60235) b!124238))

(assert (= (or b!124222 b!124247) bm!13243))

(assert (= (or b!124218 b!124238) bm!13237))

(assert (= (or b!124215 bm!13243) bm!13235))

(assert (= (or b!124244 b!124235) bm!13232))

(assert (= (or b!124254 b!124246) bm!13224))

(assert (= (or bm!13226 bm!13235) bm!13239))

(assert (= (or bm!13242 bm!13232) bm!13229))

(assert (= (or b!124221 b!124231) bm!13222))

(assert (= (or b!124232 b!124244) bm!13240))

(assert (= (or b!124243 b!124235) bm!13241))

(assert (= (or bm!13238 bm!13237) bm!13221))

(assert (= (or b!124221 b!124231) bm!13230))

(assert (= (and bm!13230 c!22573) b!124224))

(assert (= (and bm!13230 (not c!22573)) b!124236))

(assert (= (or bm!13223 b!124231) bm!13225))

(assert (= (or bm!13227 bm!13222) bm!13231))

(assert (= (or bm!13236 b!124231) bm!13228))

(assert (= (and bm!13228 c!22575) b!124230))

(assert (= (and bm!13228 (not c!22575)) b!124220))

(assert (= (and d!37277 res!60240) b!124226))

(assert (= (and b!124226 c!22576) b!124240))

(assert (= (and b!124226 (not c!22576)) b!124219))

(assert (= (and b!124240 res!60241) b!124228))

(assert (= (or b!124240 b!124228 b!124219) bm!13233))

(assert (= (or b!124228 b!124219) bm!13234))

(assert (=> bm!13224 m!144181))

(assert (=> bm!13224 m!144195))

(declare-fun m!144309 () Bool)

(assert (=> bm!13224 m!144309))

(declare-fun m!144311 () Bool)

(assert (=> bm!13233 m!144311))

(declare-fun m!144313 () Bool)

(assert (=> d!37277 m!144313))

(assert (=> d!37277 m!144173))

(declare-fun m!144315 () Bool)

(assert (=> bm!13239 m!144315))

(declare-fun m!144317 () Bool)

(assert (=> bm!13228 m!144317))

(declare-fun m!144319 () Bool)

(assert (=> b!124213 m!144319))

(assert (=> b!124214 m!144181))

(declare-fun m!144321 () Bool)

(assert (=> b!124214 m!144321))

(assert (=> b!124227 m!144195))

(declare-fun m!144323 () Bool)

(assert (=> b!124227 m!144323))

(declare-fun m!144325 () Bool)

(assert (=> bm!13231 m!144325))

(declare-fun m!144327 () Bool)

(assert (=> bm!13225 m!144327))

(declare-fun m!144329 () Bool)

(assert (=> bm!13225 m!144329))

(declare-fun m!144331 () Bool)

(assert (=> b!124239 m!144331))

(assert (=> b!124240 m!144181))

(declare-fun m!144333 () Bool)

(assert (=> b!124240 m!144333))

(declare-fun m!144335 () Bool)

(assert (=> b!124241 m!144335))

(assert (=> bm!13229 m!144181))

(assert (=> bm!13229 m!144321))

(assert (=> b!124220 m!144241))

(assert (=> b!124242 m!144195))

(declare-fun m!144337 () Bool)

(assert (=> b!124242 m!144337))

(declare-fun m!144339 () Bool)

(assert (=> b!124216 m!144339))

(assert (=> bm!13221 m!144181))

(declare-fun m!144341 () Bool)

(assert (=> bm!13221 m!144341))

(declare-fun m!144343 () Bool)

(assert (=> b!124253 m!144343))

(assert (=> b!124231 m!144327))

(assert (=> b!124231 m!144181))

(assert (=> b!124231 m!144195))

(declare-fun m!144345 () Bool)

(assert (=> b!124231 m!144345))

(declare-fun m!144347 () Bool)

(assert (=> b!124231 m!144347))

(declare-fun m!144349 () Bool)

(assert (=> b!124231 m!144349))

(assert (=> b!124231 m!144347))

(declare-fun m!144351 () Bool)

(assert (=> b!124231 m!144351))

(assert (=> bm!13234 m!144183))

(assert (=> bm!13230 m!144181))

(declare-fun m!144353 () Bool)

(assert (=> bm!13230 m!144353))

(assert (=> bm!13241 m!144181))

(declare-fun m!144355 () Bool)

(assert (=> bm!13241 m!144355))

(declare-fun m!144357 () Bool)

(assert (=> b!124228 m!144357))

(assert (=> b!124236 m!144241))

(declare-fun m!144359 () Bool)

(assert (=> b!124249 m!144359))

(assert (=> bm!13240 m!144181))

(declare-fun m!144361 () Bool)

(assert (=> bm!13240 m!144361))

(assert (=> b!124001 d!37277))

(declare-fun d!37279 () Bool)

(declare-fun c!22587 () Bool)

(assert (=> d!37279 (= c!22587 ((_ is ValueCellFull!1071) (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355)))))

(declare-fun e!81219 () V!3419)

(assert (=> d!37279 (= (get!1431 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81219)))

(declare-fun b!124259 () Bool)

(declare-fun get!1432 (ValueCell!1071 V!3419) V!3419)

(assert (=> b!124259 (= e!81219 (get!1432 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124260 () Bool)

(declare-fun get!1433 (ValueCell!1071 V!3419) V!3419)

(assert (=> b!124260 (= e!81219 (get!1433 (select (arr!2214 (_values!2743 (v!3100 (underlying!433 thiss!992)))) from!355) (dynLambda!410 (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37279 c!22587) b!124259))

(assert (= (and d!37279 (not c!22587)) b!124260))

(assert (=> b!124259 m!144191))

(assert (=> b!124259 m!144193))

(declare-fun m!144363 () Bool)

(assert (=> b!124259 m!144363))

(assert (=> b!124260 m!144191))

(assert (=> b!124260 m!144193))

(declare-fun m!144365 () Bool)

(assert (=> b!124260 m!144365))

(assert (=> b!124001 d!37279))

(declare-fun d!37281 () Bool)

(declare-fun res!60249 () Bool)

(declare-fun e!81222 () Bool)

(assert (=> d!37281 (=> (not res!60249) (not e!81222))))

(declare-fun simpleValid!85 (LongMapFixedSize!1050) Bool)

(assert (=> d!37281 (= res!60249 (simpleValid!85 newMap!16))))

(assert (=> d!37281 (= (valid!500 newMap!16) e!81222)))

(declare-fun b!124267 () Bool)

(declare-fun res!60250 () Bool)

(assert (=> b!124267 (=> (not res!60250) (not e!81222))))

(declare-fun arrayCountValidKeys!0 (array!4671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124267 (= res!60250 (= (arrayCountValidKeys!0 (_keys!4489 newMap!16) #b00000000000000000000000000000000 (size!2476 (_keys!4489 newMap!16))) (_size!574 newMap!16)))))

(declare-fun b!124268 () Bool)

(declare-fun res!60251 () Bool)

(assert (=> b!124268 (=> (not res!60251) (not e!81222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4671 (_ BitVec 32)) Bool)

(assert (=> b!124268 (= res!60251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4489 newMap!16) (mask!7003 newMap!16)))))

(declare-fun b!124269 () Bool)

(declare-datatypes ((List!1694 0))(
  ( (Nil!1691) (Cons!1690 (h!2291 (_ BitVec 64)) (t!6013 List!1694)) )
))
(declare-fun arrayNoDuplicates!0 (array!4671 (_ BitVec 32) List!1694) Bool)

(assert (=> b!124269 (= e!81222 (arrayNoDuplicates!0 (_keys!4489 newMap!16) #b00000000000000000000000000000000 Nil!1691))))

(assert (= (and d!37281 res!60249) b!124267))

(assert (= (and b!124267 res!60250) b!124268))

(assert (= (and b!124268 res!60251) b!124269))

(declare-fun m!144367 () Bool)

(assert (=> d!37281 m!144367))

(declare-fun m!144369 () Bool)

(assert (=> b!124267 m!144369))

(declare-fun m!144371 () Bool)

(assert (=> b!124268 m!144371))

(declare-fun m!144373 () Bool)

(assert (=> b!124269 m!144373))

(assert (=> b!123993 d!37281))

(declare-fun mapIsEmpty!4461 () Bool)

(declare-fun mapRes!4461 () Bool)

(assert (=> mapIsEmpty!4461 mapRes!4461))

(declare-fun condMapEmpty!4461 () Bool)

(declare-fun mapDefault!4461 () ValueCell!1071)

(assert (=> mapNonEmpty!4451 (= condMapEmpty!4461 (= mapRest!4452 ((as const (Array (_ BitVec 32) ValueCell!1071)) mapDefault!4461)))))

(declare-fun e!81227 () Bool)

(assert (=> mapNonEmpty!4451 (= tp!10869 (and e!81227 mapRes!4461))))

(declare-fun b!124276 () Bool)

(declare-fun e!81228 () Bool)

(assert (=> b!124276 (= e!81228 tp_is_empty!2829)))

(declare-fun mapNonEmpty!4461 () Bool)

(declare-fun tp!10887 () Bool)

(assert (=> mapNonEmpty!4461 (= mapRes!4461 (and tp!10887 e!81228))))

(declare-fun mapValue!4461 () ValueCell!1071)

(declare-fun mapKey!4461 () (_ BitVec 32))

(declare-fun mapRest!4461 () (Array (_ BitVec 32) ValueCell!1071))

(assert (=> mapNonEmpty!4461 (= mapRest!4452 (store mapRest!4461 mapKey!4461 mapValue!4461))))

(declare-fun b!124277 () Bool)

(assert (=> b!124277 (= e!81227 tp_is_empty!2829)))

(assert (= (and mapNonEmpty!4451 condMapEmpty!4461) mapIsEmpty!4461))

(assert (= (and mapNonEmpty!4451 (not condMapEmpty!4461)) mapNonEmpty!4461))

(assert (= (and mapNonEmpty!4461 ((_ is ValueCellFull!1071) mapValue!4461)) b!124276))

(assert (= (and mapNonEmpty!4451 ((_ is ValueCellFull!1071) mapDefault!4461)) b!124277))

(declare-fun m!144375 () Bool)

(assert (=> mapNonEmpty!4461 m!144375))

(declare-fun mapIsEmpty!4462 () Bool)

(declare-fun mapRes!4462 () Bool)

(assert (=> mapIsEmpty!4462 mapRes!4462))

(declare-fun condMapEmpty!4462 () Bool)

(declare-fun mapDefault!4462 () ValueCell!1071)

(assert (=> mapNonEmpty!4452 (= condMapEmpty!4462 (= mapRest!4451 ((as const (Array (_ BitVec 32) ValueCell!1071)) mapDefault!4462)))))

(declare-fun e!81229 () Bool)

(assert (=> mapNonEmpty!4452 (= tp!10871 (and e!81229 mapRes!4462))))

(declare-fun b!124278 () Bool)

(declare-fun e!81230 () Bool)

(assert (=> b!124278 (= e!81230 tp_is_empty!2829)))

(declare-fun mapNonEmpty!4462 () Bool)

(declare-fun tp!10888 () Bool)

(assert (=> mapNonEmpty!4462 (= mapRes!4462 (and tp!10888 e!81230))))

(declare-fun mapValue!4462 () ValueCell!1071)

(declare-fun mapKey!4462 () (_ BitVec 32))

(declare-fun mapRest!4462 () (Array (_ BitVec 32) ValueCell!1071))

(assert (=> mapNonEmpty!4462 (= mapRest!4451 (store mapRest!4462 mapKey!4462 mapValue!4462))))

(declare-fun b!124279 () Bool)

(assert (=> b!124279 (= e!81229 tp_is_empty!2829)))

(assert (= (and mapNonEmpty!4452 condMapEmpty!4462) mapIsEmpty!4462))

(assert (= (and mapNonEmpty!4452 (not condMapEmpty!4462)) mapNonEmpty!4462))

(assert (= (and mapNonEmpty!4462 ((_ is ValueCellFull!1071) mapValue!4462)) b!124278))

(assert (= (and mapNonEmpty!4452 ((_ is ValueCellFull!1071) mapDefault!4462)) b!124279))

(declare-fun m!144377 () Bool)

(assert (=> mapNonEmpty!4462 m!144377))

(declare-fun b_lambda!5455 () Bool)

(assert (= b_lambda!5453 (or (and b!123990 b_free!2825) (and b!124000 b_free!2827 (= (defaultEntry!2760 newMap!16) (defaultEntry!2760 (v!3100 (underlying!433 thiss!992))))) b_lambda!5455)))

(check-sat tp_is_empty!2829 (not bm!13228) (not bm!13167) (not b!124267) (not bm!13240) (not bm!13166) (not bm!13169) (not b_lambda!5455) (not bm!13229) (not b!124214) (not mapNonEmpty!4462) (not d!37267) (not b!124106) (not bm!13239) (not bm!13224) (not d!37277) (not b!124103) (not bm!13221) (not bm!13231) (not b!124126) (not b_next!2827) (not b!124236) (not b!124228) (not b!124100) (not b!124108) (not b!124220) (not b!124114) b_and!7631 (not b_lambda!5451) (not b_next!2825) (not d!37281) (not d!37265) (not b!124260) (not b!124259) (not bm!13233) (not b!124115) (not b!124107) (not b!124242) (not bm!13234) (not d!37275) (not bm!13230) (not b!124128) (not bm!13241) (not b!124268) (not bm!13225) (not b!124231) (not bm!13170) b_and!7633 (not mapNonEmpty!4461) (not b!124113) (not b!124227) (not d!37263) (not b!124269) (not b!124240))
(check-sat b_and!7631 b_and!7633 (not b_next!2825) (not b_next!2827))
