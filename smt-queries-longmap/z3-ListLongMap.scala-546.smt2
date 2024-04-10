; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14430 () Bool)

(assert start!14430)

(declare-fun b!136004 () Bool)

(declare-fun b_free!2945 () Bool)

(declare-fun b_next!2945 () Bool)

(assert (=> b!136004 (= b_free!2945 (not b_next!2945))))

(declare-fun tp!11288 () Bool)

(declare-fun b_and!8419 () Bool)

(assert (=> b!136004 (= tp!11288 b_and!8419)))

(declare-fun b!136009 () Bool)

(declare-fun b_free!2947 () Bool)

(declare-fun b_next!2947 () Bool)

(assert (=> b!136009 (= b_free!2947 (not b_next!2947))))

(declare-fun tp!11287 () Bool)

(declare-fun b_and!8421 () Bool)

(assert (=> b!136009 (= tp!11287 b_and!8421)))

(declare-fun b!135994 () Bool)

(declare-fun e!88599 () Bool)

(declare-fun e!88598 () Bool)

(assert (=> b!135994 (= e!88599 e!88598)))

(declare-fun b!135995 () Bool)

(declare-fun e!88595 () Bool)

(declare-fun e!88600 () Bool)

(assert (=> b!135995 (= e!88595 e!88600)))

(declare-fun res!65277 () Bool)

(assert (=> b!135995 (=> (not res!65277) (not e!88600))))

(declare-datatypes ((V!3499 0))(
  ( (V!3500 (val!1489 Int)) )
))
(declare-datatypes ((array!4807 0))(
  ( (array!4808 (arr!2273 (Array (_ BitVec 32) (_ BitVec 64))) (size!2543 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1101 0))(
  ( (ValueCellFull!1101 (v!3220 V!3499)) (EmptyCell!1101) )
))
(declare-datatypes ((array!4809 0))(
  ( (array!4810 (arr!2274 (Array (_ BitVec 32) ValueCell!1101)) (size!2544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1110 0))(
  ( (LongMapFixedSize!1111 (defaultEntry!2889 Int) (mask!7203 (_ BitVec 32)) (extraKeys!2650 (_ BitVec 32)) (zeroValue!2742 V!3499) (minValue!2742 V!3499) (_size!604 (_ BitVec 32)) (_keys!4642 array!4807) (_values!2872 array!4809) (_vacant!604 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!898 0))(
  ( (Cell!899 (v!3221 LongMapFixedSize!1110)) )
))
(declare-datatypes ((LongMap!898 0))(
  ( (LongMap!899 (underlying!460 Cell!898)) )
))
(declare-fun thiss!992 () LongMap!898)

(declare-datatypes ((tuple2!2642 0))(
  ( (tuple2!2643 (_1!1332 (_ BitVec 64)) (_2!1332 V!3499)) )
))
(declare-datatypes ((List!1723 0))(
  ( (Nil!1720) (Cons!1719 (h!2325 tuple2!2642) (t!6211 List!1723)) )
))
(declare-datatypes ((ListLongMap!1715 0))(
  ( (ListLongMap!1716 (toList!873 List!1723)) )
))
(declare-fun lt!70949 () ListLongMap!1715)

(declare-fun lt!70951 () ListLongMap!1715)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!135995 (= res!65277 (and (= lt!70949 lt!70951) (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1110)

(declare-fun map!1416 (LongMapFixedSize!1110) ListLongMap!1715)

(assert (=> b!135995 (= lt!70951 (map!1416 newMap!16))))

(declare-fun getCurrentListMap!549 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) Int) ListLongMap!1715)

(assert (=> b!135995 (= lt!70949 (getCurrentListMap!549 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!135996 () Bool)

(declare-fun e!88590 () Bool)

(declare-fun tp_is_empty!2889 () Bool)

(assert (=> b!135996 (= e!88590 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4689 () Bool)

(declare-fun mapRes!4690 () Bool)

(declare-fun tp!11290 () Bool)

(declare-fun e!88594 () Bool)

(assert (=> mapNonEmpty!4689 (= mapRes!4690 (and tp!11290 e!88594))))

(declare-fun mapValue!4689 () ValueCell!1101)

(declare-fun mapRest!4689 () (Array (_ BitVec 32) ValueCell!1101))

(declare-fun mapKey!4690 () (_ BitVec 32))

(assert (=> mapNonEmpty!4689 (= (arr!2274 (_values!2872 newMap!16)) (store mapRest!4689 mapKey!4690 mapValue!4689))))

(declare-fun b!135997 () Bool)

(declare-fun res!65278 () Bool)

(assert (=> b!135997 (=> (not res!65278) (not e!88595))))

(assert (=> b!135997 (= res!65278 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!135998 () Bool)

(declare-fun e!88601 () Bool)

(declare-fun mapRes!4689 () Bool)

(assert (=> b!135998 (= e!88601 (and e!88590 mapRes!4689))))

(declare-fun condMapEmpty!4689 () Bool)

(declare-fun mapDefault!4690 () ValueCell!1101)

(assert (=> b!135998 (= condMapEmpty!4689 (= (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4690)))))

(declare-fun b!135999 () Bool)

(declare-fun e!88603 () Bool)

(assert (=> b!135999 (= e!88600 e!88603)))

(declare-fun res!65273 () Bool)

(assert (=> b!135999 (=> (not res!65273) (not e!88603))))

(declare-fun contains!905 (ListLongMap!1715 (_ BitVec 64)) Bool)

(assert (=> b!135999 (= res!65273 (contains!905 lt!70951 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2644 0))(
  ( (tuple2!2645 (_1!1333 Bool) (_2!1333 LongMapFixedSize!1110)) )
))
(declare-fun lt!70950 () tuple2!2644)

(declare-fun update!198 (LongMapFixedSize!1110 (_ BitVec 64) V!3499) tuple2!2644)

(declare-fun get!1493 (ValueCell!1101 V!3499) V!3499)

(declare-fun dynLambda!429 (Int (_ BitVec 64)) V!3499)

(assert (=> b!135999 (= lt!70950 (update!198 newMap!16 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!136000 () Bool)

(declare-fun e!88602 () Bool)

(declare-fun e!88592 () Bool)

(assert (=> b!136000 (= e!88602 (and e!88592 mapRes!4690))))

(declare-fun condMapEmpty!4690 () Bool)

(declare-fun mapDefault!4689 () ValueCell!1101)

(assert (=> b!136000 (= condMapEmpty!4690 (= (arr!2274 (_values!2872 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4689)))))

(declare-fun b!136001 () Bool)

(assert (=> b!136001 (= e!88592 tp_is_empty!2889)))

(declare-fun b!136002 () Bool)

(declare-fun res!65275 () Bool)

(assert (=> b!136002 (=> (not res!65275) (not e!88595))))

(assert (=> b!136002 (= res!65275 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7203 newMap!16)) (_size!604 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136003 () Bool)

(assert (=> b!136003 (= e!88603 (not (bvslt (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b01111111111111111111111111111111)))))

(declare-fun arrayContainsKey!0 (array!4807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136003 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4275 0))(
  ( (Unit!4276) )
))
(declare-fun lt!70948 () Unit!4275)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!128 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) (_ BitVec 32) Int) Unit!4275)

(assert (=> b!136003 (= lt!70948 (lemmaListMapContainsThenArrayContainsFrom!128 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun res!65276 () Bool)

(assert (=> start!14430 (=> (not res!65276) (not e!88595))))

(declare-fun valid!532 (LongMap!898) Bool)

(assert (=> start!14430 (= res!65276 (valid!532 thiss!992))))

(assert (=> start!14430 e!88595))

(assert (=> start!14430 e!88599))

(assert (=> start!14430 true))

(declare-fun e!88591 () Bool)

(assert (=> start!14430 e!88591))

(declare-fun e!88597 () Bool)

(declare-fun array_inv!1429 (array!4807) Bool)

(declare-fun array_inv!1430 (array!4809) Bool)

(assert (=> b!136004 (= e!88597 (and tp!11288 tp_is_empty!2889 (array_inv!1429 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (array_inv!1430 (_values!2872 (v!3221 (underlying!460 thiss!992)))) e!88601))))

(declare-fun mapNonEmpty!4690 () Bool)

(declare-fun tp!11289 () Bool)

(declare-fun e!88589 () Bool)

(assert (=> mapNonEmpty!4690 (= mapRes!4689 (and tp!11289 e!88589))))

(declare-fun mapKey!4689 () (_ BitVec 32))

(declare-fun mapValue!4690 () ValueCell!1101)

(declare-fun mapRest!4690 () (Array (_ BitVec 32) ValueCell!1101))

(assert (=> mapNonEmpty!4690 (= (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (store mapRest!4690 mapKey!4689 mapValue!4690))))

(declare-fun b!136005 () Bool)

(declare-fun res!65274 () Bool)

(assert (=> b!136005 (=> (not res!65274) (not e!88595))))

(declare-fun valid!533 (LongMapFixedSize!1110) Bool)

(assert (=> b!136005 (= res!65274 (valid!533 newMap!16))))

(declare-fun mapIsEmpty!4689 () Bool)

(assert (=> mapIsEmpty!4689 mapRes!4690))

(declare-fun b!136006 () Bool)

(assert (=> b!136006 (= e!88598 e!88597)))

(declare-fun b!136007 () Bool)

(assert (=> b!136007 (= e!88589 tp_is_empty!2889)))

(declare-fun b!136008 () Bool)

(assert (=> b!136008 (= e!88594 tp_is_empty!2889)))

(assert (=> b!136009 (= e!88591 (and tp!11287 tp_is_empty!2889 (array_inv!1429 (_keys!4642 newMap!16)) (array_inv!1430 (_values!2872 newMap!16)) e!88602))))

(declare-fun mapIsEmpty!4690 () Bool)

(assert (=> mapIsEmpty!4690 mapRes!4689))

(assert (= (and start!14430 res!65276) b!135997))

(assert (= (and b!135997 res!65278) b!136005))

(assert (= (and b!136005 res!65274) b!136002))

(assert (= (and b!136002 res!65275) b!135995))

(assert (= (and b!135995 res!65277) b!135999))

(assert (= (and b!135999 res!65273) b!136003))

(assert (= (and b!135998 condMapEmpty!4689) mapIsEmpty!4690))

(assert (= (and b!135998 (not condMapEmpty!4689)) mapNonEmpty!4690))

(get-info :version)

(assert (= (and mapNonEmpty!4690 ((_ is ValueCellFull!1101) mapValue!4690)) b!136007))

(assert (= (and b!135998 ((_ is ValueCellFull!1101) mapDefault!4690)) b!135996))

(assert (= b!136004 b!135998))

(assert (= b!136006 b!136004))

(assert (= b!135994 b!136006))

(assert (= start!14430 b!135994))

(assert (= (and b!136000 condMapEmpty!4690) mapIsEmpty!4689))

(assert (= (and b!136000 (not condMapEmpty!4690)) mapNonEmpty!4689))

(assert (= (and mapNonEmpty!4689 ((_ is ValueCellFull!1101) mapValue!4689)) b!136008))

(assert (= (and b!136000 ((_ is ValueCellFull!1101) mapDefault!4689)) b!136001))

(assert (= b!136009 b!136000))

(assert (= start!14430 b!136009))

(declare-fun b_lambda!6073 () Bool)

(assert (=> (not b_lambda!6073) (not b!135999)))

(declare-fun t!6208 () Bool)

(declare-fun tb!2449 () Bool)

(assert (=> (and b!136004 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) t!6208) tb!2449))

(declare-fun result!4033 () Bool)

(assert (=> tb!2449 (= result!4033 tp_is_empty!2889)))

(assert (=> b!135999 t!6208))

(declare-fun b_and!8423 () Bool)

(assert (= b_and!8419 (and (=> t!6208 result!4033) b_and!8423)))

(declare-fun t!6210 () Bool)

(declare-fun tb!2451 () Bool)

(assert (=> (and b!136009 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) t!6210) tb!2451))

(declare-fun result!4037 () Bool)

(assert (= result!4037 result!4033))

(assert (=> b!135999 t!6210))

(declare-fun b_and!8425 () Bool)

(assert (= b_and!8421 (and (=> t!6210 result!4037) b_and!8425)))

(declare-fun m!162079 () Bool)

(assert (=> mapNonEmpty!4690 m!162079))

(declare-fun m!162081 () Bool)

(assert (=> b!136003 m!162081))

(assert (=> b!136003 m!162081))

(declare-fun m!162083 () Bool)

(assert (=> b!136003 m!162083))

(assert (=> b!136003 m!162081))

(declare-fun m!162085 () Bool)

(assert (=> b!136003 m!162085))

(declare-fun m!162087 () Bool)

(assert (=> b!136005 m!162087))

(assert (=> b!135995 m!162081))

(declare-fun m!162089 () Bool)

(assert (=> b!135995 m!162089))

(declare-fun m!162091 () Bool)

(assert (=> b!135995 m!162091))

(declare-fun m!162093 () Bool)

(assert (=> start!14430 m!162093))

(declare-fun m!162095 () Bool)

(assert (=> b!136009 m!162095))

(declare-fun m!162097 () Bool)

(assert (=> b!136009 m!162097))

(declare-fun m!162099 () Bool)

(assert (=> b!135999 m!162099))

(declare-fun m!162101 () Bool)

(assert (=> b!135999 m!162101))

(declare-fun m!162103 () Bool)

(assert (=> b!135999 m!162103))

(assert (=> b!135999 m!162081))

(declare-fun m!162105 () Bool)

(assert (=> b!135999 m!162105))

(assert (=> b!135999 m!162081))

(assert (=> b!135999 m!162101))

(assert (=> b!135999 m!162081))

(assert (=> b!135999 m!162103))

(declare-fun m!162107 () Bool)

(assert (=> b!135999 m!162107))

(assert (=> b!135999 m!162099))

(declare-fun m!162109 () Bool)

(assert (=> mapNonEmpty!4689 m!162109))

(declare-fun m!162111 () Bool)

(assert (=> b!136004 m!162111))

(declare-fun m!162113 () Bool)

(assert (=> b!136004 m!162113))

(check-sat b_and!8423 (not mapNonEmpty!4690) tp_is_empty!2889 (not b_lambda!6073) (not b!136005) (not b!136003) (not b_next!2947) (not b!136004) (not b!135999) (not mapNonEmpty!4689) (not start!14430) (not b!136009) (not b!135995) b_and!8425 (not b_next!2945))
(check-sat b_and!8423 b_and!8425 (not b_next!2945) (not b_next!2947))
(get-model)

(declare-fun b_lambda!6077 () Bool)

(assert (= b_lambda!6073 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6077)))

(check-sat (not mapNonEmpty!4690) tp_is_empty!2889 (not b!136005) (not b!136003) (not b_next!2947) (not b!136004) (not b!135999) (not mapNonEmpty!4689) (not start!14430) (not b!136009) (not b!135995) (not b_lambda!6077) b_and!8423 b_and!8425 (not b_next!2945))
(check-sat b_and!8423 b_and!8425 (not b_next!2945) (not b_next!2947))
(get-model)

(declare-fun d!42427 () Bool)

(declare-fun e!88653 () Bool)

(assert (=> d!42427 e!88653))

(declare-fun res!65299 () Bool)

(assert (=> d!42427 (=> res!65299 e!88653)))

(declare-fun lt!70974 () Bool)

(assert (=> d!42427 (= res!65299 (not lt!70974))))

(declare-fun lt!70972 () Bool)

(assert (=> d!42427 (= lt!70974 lt!70972)))

(declare-fun lt!70975 () Unit!4275)

(declare-fun e!88654 () Unit!4275)

(assert (=> d!42427 (= lt!70975 e!88654)))

(declare-fun c!25405 () Bool)

(assert (=> d!42427 (= c!25405 lt!70972)))

(declare-fun containsKey!177 (List!1723 (_ BitVec 64)) Bool)

(assert (=> d!42427 (= lt!70972 (containsKey!177 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42427 (= (contains!905 lt!70951 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!70974)))

(declare-fun b!136068 () Bool)

(declare-fun lt!70973 () Unit!4275)

(assert (=> b!136068 (= e!88654 lt!70973)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!125 (List!1723 (_ BitVec 64)) Unit!4275)

(assert (=> b!136068 (= lt!70973 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-datatypes ((Option!179 0))(
  ( (Some!178 (v!3225 V!3499)) (None!177) )
))
(declare-fun isDefined!126 (Option!179) Bool)

(declare-fun getValueByKey!173 (List!1723 (_ BitVec 64)) Option!179)

(assert (=> b!136068 (isDefined!126 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136069 () Bool)

(declare-fun Unit!4279 () Unit!4275)

(assert (=> b!136069 (= e!88654 Unit!4279)))

(declare-fun b!136070 () Bool)

(assert (=> b!136070 (= e!88653 (isDefined!126 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (= (and d!42427 c!25405) b!136068))

(assert (= (and d!42427 (not c!25405)) b!136069))

(assert (= (and d!42427 (not res!65299)) b!136070))

(assert (=> d!42427 m!162081))

(declare-fun m!162151 () Bool)

(assert (=> d!42427 m!162151))

(assert (=> b!136068 m!162081))

(declare-fun m!162153 () Bool)

(assert (=> b!136068 m!162153))

(assert (=> b!136068 m!162081))

(declare-fun m!162155 () Bool)

(assert (=> b!136068 m!162155))

(assert (=> b!136068 m!162155))

(declare-fun m!162157 () Bool)

(assert (=> b!136068 m!162157))

(assert (=> b!136070 m!162081))

(assert (=> b!136070 m!162155))

(assert (=> b!136070 m!162155))

(assert (=> b!136070 m!162157))

(assert (=> b!135999 d!42427))

(declare-fun b!136147 () Bool)

(declare-fun e!88701 () Bool)

(declare-fun e!88711 () Bool)

(assert (=> b!136147 (= e!88701 e!88711)))

(declare-fun res!65336 () Bool)

(declare-fun call!14968 () ListLongMap!1715)

(assert (=> b!136147 (= res!65336 (contains!905 call!14968 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136147 (=> (not res!65336) (not e!88711))))

(declare-fun b!136148 () Bool)

(declare-fun e!88697 () Bool)

(declare-fun call!14976 () Bool)

(assert (=> b!136148 (= e!88697 (not call!14976))))

(declare-fun b!136149 () Bool)

(declare-fun e!88706 () Unit!4275)

(declare-fun Unit!4280 () Unit!4275)

(assert (=> b!136149 (= e!88706 Unit!4280)))

(declare-fun lt!71047 () Unit!4275)

(declare-fun call!14957 () Unit!4275)

(assert (=> b!136149 (= lt!71047 call!14957)))

(declare-datatypes ((SeekEntryResult!276 0))(
  ( (MissingZero!276 (index!3265 (_ BitVec 32))) (Found!276 (index!3266 (_ BitVec 32))) (Intermediate!276 (undefined!1088 Bool) (index!3267 (_ BitVec 32)) (x!15804 (_ BitVec 32))) (Undefined!276) (MissingVacant!276 (index!3268 (_ BitVec 32))) )
))
(declare-fun lt!71046 () SeekEntryResult!276)

(declare-fun call!14973 () SeekEntryResult!276)

(assert (=> b!136149 (= lt!71046 call!14973)))

(declare-fun c!25437 () Bool)

(assert (=> b!136149 (= c!25437 ((_ is MissingZero!276) lt!71046))))

(declare-fun e!88700 () Bool)

(assert (=> b!136149 e!88700))

(declare-fun lt!71044 () Unit!4275)

(assert (=> b!136149 (= lt!71044 lt!71047)))

(assert (=> b!136149 false))

(declare-fun bm!14951 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!62 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) Int) Unit!4275)

(assert (=> bm!14951 (= call!14957 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(declare-fun b!136150 () Bool)

(declare-fun e!88698 () Bool)

(assert (=> b!136150 (= e!88698 e!88697)))

(declare-fun res!65329 () Bool)

(declare-fun call!14969 () Bool)

(assert (=> b!136150 (= res!65329 call!14969)))

(assert (=> b!136150 (=> (not res!65329) (not e!88697))))

(declare-fun b!136151 () Bool)

(declare-fun e!88712 () tuple2!2644)

(declare-fun e!88703 () tuple2!2644)

(assert (=> b!136151 (= e!88712 e!88703)))

(declare-fun c!25436 () Bool)

(declare-fun lt!71036 () SeekEntryResult!276)

(assert (=> b!136151 (= c!25436 ((_ is MissingZero!276) lt!71036))))

(declare-fun b!136152 () Bool)

(declare-fun res!65332 () Bool)

(declare-fun e!88714 () Bool)

(assert (=> b!136152 (=> (not res!65332) (not e!88714))))

(assert (=> b!136152 (= res!65332 call!14969)))

(assert (=> b!136152 (= e!88700 e!88714)))

(declare-fun b!136153 () Bool)

(declare-fun lt!71041 () Unit!4275)

(assert (=> b!136153 (= e!88706 lt!71041)))

(declare-fun call!14955 () Unit!4275)

(assert (=> b!136153 (= lt!71041 call!14955)))

(declare-fun lt!71051 () SeekEntryResult!276)

(assert (=> b!136153 (= lt!71051 call!14973)))

(declare-fun res!65337 () Bool)

(assert (=> b!136153 (= res!65337 ((_ is Found!276) lt!71051))))

(declare-fun e!88696 () Bool)

(assert (=> b!136153 (=> (not res!65337) (not e!88696))))

(assert (=> b!136153 e!88696))

(declare-fun call!14972 () ListLongMap!1715)

(declare-fun lt!71040 () array!4809)

(declare-fun c!25439 () Bool)

(declare-fun lt!71048 () (_ BitVec 32))

(declare-fun c!25435 () Bool)

(declare-fun lt!71052 () (_ BitVec 32))

(declare-fun c!25441 () Bool)

(declare-fun bm!14952 () Bool)

(assert (=> bm!14952 (= call!14972 (getCurrentListMap!549 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun bm!14953 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!62 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) Int) Unit!4275)

(assert (=> bm!14953 (= call!14955 (lemmaInListMapThenSeekEntryOrOpenFindsIt!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(declare-fun b!136154 () Bool)

(declare-fun e!88707 () Unit!4275)

(declare-fun lt!71042 () Unit!4275)

(assert (=> b!136154 (= e!88707 lt!71042)))

(assert (=> b!136154 (= lt!71042 call!14957)))

(declare-fun lt!71043 () SeekEntryResult!276)

(declare-fun call!14954 () SeekEntryResult!276)

(assert (=> b!136154 (= lt!71043 call!14954)))

(declare-fun c!25434 () Bool)

(assert (=> b!136154 (= c!25434 ((_ is MissingZero!276) lt!71043))))

(declare-fun e!88699 () Bool)

(assert (=> b!136154 e!88699))

(declare-fun b!136155 () Bool)

(declare-fun call!14960 () ListLongMap!1715)

(assert (=> b!136155 (= e!88701 (= call!14968 call!14960))))

(declare-fun b!136156 () Bool)

(declare-fun e!88710 () Bool)

(declare-fun e!88695 () Bool)

(assert (=> b!136156 (= e!88710 e!88695)))

(declare-fun res!65338 () Bool)

(declare-fun call!14971 () Bool)

(assert (=> b!136156 (= res!65338 call!14971)))

(assert (=> b!136156 (=> (not res!65338) (not e!88695))))

(declare-fun bm!14954 () Bool)

(declare-fun call!14970 () ListLongMap!1715)

(assert (=> bm!14954 (= call!14970 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun call!14959 () ListLongMap!1715)

(declare-fun call!14958 () ListLongMap!1715)

(declare-fun bm!14955 () Bool)

(declare-fun +!176 (ListLongMap!1715 tuple2!2642) ListLongMap!1715)

(assert (=> bm!14955 (= call!14959 (+!176 (ite c!25441 call!14958 call!14970) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!88704 () Bool)

(declare-fun b!136157 () Bool)

(declare-fun lt!71034 () SeekEntryResult!276)

(assert (=> b!136157 (= e!88704 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71034)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136158 () Bool)

(declare-fun e!88702 () tuple2!2644)

(declare-fun e!88713 () tuple2!2644)

(assert (=> b!136158 (= e!88702 e!88713)))

(assert (=> b!136158 (= c!25439 (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14956 () Bool)

(declare-fun call!14967 () ListLongMap!1715)

(assert (=> bm!14956 (= call!14967 call!14972)))

(declare-fun bm!14957 () Bool)

(declare-fun c!25431 () Bool)

(declare-fun call!14964 () Bool)

(declare-fun c!25433 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14957 (= call!14964 (inRange!0 (ite c!25435 (ite c!25433 (index!3266 lt!71034) (ite c!25434 (index!3265 lt!71043) (index!3268 lt!71043))) (ite c!25431 (index!3266 lt!71051) (ite c!25437 (index!3265 lt!71046) (index!3268 lt!71046)))) (mask!7203 newMap!16)))))

(declare-fun call!14956 () Bool)

(declare-fun bm!14958 () Bool)

(assert (=> bm!14958 (= call!14956 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!136159 () Bool)

(declare-fun lt!71055 () Unit!4275)

(assert (=> b!136159 (= lt!71055 e!88707)))

(declare-fun call!14974 () Bool)

(assert (=> b!136159 (= c!25433 call!14974)))

(declare-fun e!88705 () tuple2!2644)

(assert (=> b!136159 (= e!88705 (tuple2!2645 false newMap!16))))

(declare-fun bm!14959 () Bool)

(declare-fun call!14961 () Bool)

(assert (=> bm!14959 (= call!14961 call!14964)))

(declare-fun b!136160 () Bool)

(declare-fun res!65340 () Bool)

(assert (=> b!136160 (=> (not res!65340) (not e!88714))))

(assert (=> b!136160 (= res!65340 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71046)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136161 () Bool)

(assert (=> b!136161 (= e!88698 ((_ is Undefined!276) lt!71046))))

(declare-fun bm!14960 () Bool)

(assert (=> bm!14960 (= call!14958 call!14970)))

(declare-fun bm!14961 () Bool)

(assert (=> bm!14961 (= call!14974 (contains!905 call!14967 (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(declare-fun b!136162 () Bool)

(assert (=> b!136162 (= e!88702 e!88705)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4807 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> b!136162 (= lt!71036 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (=> b!136162 (= c!25435 ((_ is Undefined!276) lt!71036))))

(declare-fun b!136163 () Bool)

(assert (=> b!136163 (= e!88711 (= call!14968 (+!176 call!14960 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!136164 () Bool)

(declare-fun c!25438 () Bool)

(assert (=> b!136164 (= c!25438 ((_ is MissingVacant!276) lt!71046))))

(assert (=> b!136164 (= e!88700 e!88698)))

(declare-fun bm!14962 () Bool)

(declare-fun call!14965 () ListLongMap!1715)

(assert (=> bm!14962 (= call!14965 call!14972)))

(declare-fun bm!14963 () Bool)

(declare-fun call!14962 () Bool)

(assert (=> bm!14963 (= call!14962 call!14956)))

(declare-fun b!136165 () Bool)

(assert (=> b!136165 (= e!88710 ((_ is Undefined!276) lt!71043))))

(declare-fun b!136166 () Bool)

(declare-fun e!88709 () Bool)

(assert (=> b!136166 (= e!88709 (not call!14962))))

(declare-fun b!136167 () Bool)

(declare-fun lt!71056 () Unit!4275)

(declare-fun lt!71038 () Unit!4275)

(assert (=> b!136167 (= lt!71056 lt!71038)))

(assert (=> b!136167 call!14974))

(declare-fun lemmaValidKeyInArrayIsInListMap!123 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) Int) Unit!4275)

(assert (=> b!136167 (= lt!71038 (lemmaValidKeyInArrayIsInListMap!123 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (defaultEntry!2889 newMap!16)))))

(assert (=> b!136167 (= lt!71040 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))))))

(declare-fun lt!71039 () Unit!4275)

(declare-fun lt!71045 () Unit!4275)

(assert (=> b!136167 (= lt!71039 lt!71045)))

(assert (=> b!136167 (= call!14959 (getCurrentListMap!549 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!62 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) (_ BitVec 64) V!3499 Int) Unit!4275)

(assert (=> b!136167 (= lt!71045 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71035 () Unit!4275)

(assert (=> b!136167 (= lt!71035 e!88706)))

(assert (=> b!136167 (= c!25431 (contains!905 call!14970 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136167 (= e!88703 (tuple2!2645 true (LongMapFixedSize!1111 (defaultEntry!2889 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (_size!604 newMap!16) (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (_vacant!604 newMap!16))))))

(declare-fun bm!14964 () Bool)

(assert (=> bm!14964 (= call!14976 call!14956)))

(declare-fun bm!14965 () Bool)

(assert (=> bm!14965 (= call!14960 (map!1416 newMap!16))))

(declare-fun b!136168 () Bool)

(declare-fun c!25440 () Bool)

(assert (=> b!136168 (= c!25440 ((_ is MissingVacant!276) lt!71043))))

(assert (=> b!136168 (= e!88699 e!88710)))

(declare-fun call!14966 () SeekEntryResult!276)

(declare-fun bm!14966 () Bool)

(assert (=> bm!14966 (= call!14966 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun bm!14967 () Bool)

(declare-fun call!14975 () Bool)

(assert (=> bm!14967 (= call!14975 call!14964)))

(declare-fun b!136169 () Bool)

(declare-fun lt!71030 () Unit!4275)

(declare-fun lt!71049 () Unit!4275)

(assert (=> b!136169 (= lt!71030 lt!71049)))

(declare-fun call!14977 () ListLongMap!1715)

(assert (=> b!136169 (= call!14977 call!14965)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!62 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 V!3499 Int) Unit!4275)

(assert (=> b!136169 (= lt!71049 (lemmaChangeLongMinValueKeyThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(assert (=> b!136169 (= lt!71052 (bvor (extraKeys!2650 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!136169 (= e!88713 (tuple2!2645 true (LongMapFixedSize!1111 (defaultEntry!2889 newMap!16) (mask!7203 newMap!16) (bvor (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!604 newMap!16) (_keys!4642 newMap!16) (_values!2872 newMap!16) (_vacant!604 newMap!16))))))

(declare-fun d!42429 () Bool)

(declare-fun e!88708 () Bool)

(assert (=> d!42429 e!88708))

(declare-fun res!65330 () Bool)

(assert (=> d!42429 (=> (not res!65330) (not e!88708))))

(declare-fun lt!71054 () tuple2!2644)

(assert (=> d!42429 (= res!65330 (valid!533 (_2!1333 lt!71054)))))

(assert (=> d!42429 (= lt!71054 e!88702)))

(assert (=> d!42429 (= c!25441 (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvneg (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42429 (valid!533 newMap!16)))

(assert (=> d!42429 (= (update!198 newMap!16 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!71054)))

(declare-fun b!136170 () Bool)

(declare-fun c!25430 () Bool)

(assert (=> b!136170 (= c!25430 ((_ is MissingVacant!276) lt!71036))))

(assert (=> b!136170 (= e!88705 e!88712)))

(declare-fun bm!14968 () Bool)

(assert (=> bm!14968 (= call!14971 call!14975)))

(declare-fun b!136171 () Bool)

(declare-fun lt!71032 () tuple2!2644)

(assert (=> b!136171 (= e!88712 (tuple2!2645 (_1!1333 lt!71032) (_2!1333 lt!71032)))))

(declare-fun call!14963 () tuple2!2644)

(assert (=> b!136171 (= lt!71032 call!14963)))

(declare-fun bm!14969 () Bool)

(assert (=> bm!14969 (= call!14969 call!14961)))

(declare-fun b!136172 () Bool)

(declare-fun res!65331 () Bool)

(assert (=> b!136172 (=> (not res!65331) (not e!88709))))

(assert (=> b!136172 (= res!65331 call!14971)))

(assert (=> b!136172 (= e!88699 e!88709)))

(declare-fun bm!14970 () Bool)

(assert (=> bm!14970 (= call!14973 call!14966)))

(declare-fun b!136173 () Bool)

(declare-fun lt!71033 () Unit!4275)

(declare-fun lt!71037 () Unit!4275)

(assert (=> b!136173 (= lt!71033 lt!71037)))

(assert (=> b!136173 (= call!14977 call!14965)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!62 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 V!3499 Int) Unit!4275)

(assert (=> b!136173 (= lt!71037 (lemmaChangeZeroKeyThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71048 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) (defaultEntry!2889 newMap!16)))))

(assert (=> b!136173 (= lt!71048 (bvor (extraKeys!2650 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!136173 (= e!88713 (tuple2!2645 true (LongMapFixedSize!1111 (defaultEntry!2889 newMap!16) (mask!7203 newMap!16) (bvor (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) (_size!604 newMap!16) (_keys!4642 newMap!16) (_values!2872 newMap!16) (_vacant!604 newMap!16))))))

(declare-fun b!136174 () Bool)

(declare-fun res!65333 () Bool)

(assert (=> b!136174 (= res!65333 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136174 (=> (not res!65333) (not e!88695))))

(declare-fun b!136175 () Bool)

(declare-fun lt!71053 () tuple2!2644)

(assert (=> b!136175 (= lt!71053 call!14963)))

(assert (=> b!136175 (= e!88703 (tuple2!2645 (_1!1333 lt!71053) (_2!1333 lt!71053)))))

(declare-fun b!136176 () Bool)

(assert (=> b!136176 (= e!88696 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71051)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136177 () Bool)

(assert (=> b!136177 (= e!88714 (not call!14976))))

(declare-fun b!136178 () Bool)

(assert (=> b!136178 (= e!88708 e!88701)))

(declare-fun c!25432 () Bool)

(assert (=> b!136178 (= c!25432 (_1!1333 lt!71054))))

(declare-fun b!136179 () Bool)

(declare-fun res!65335 () Bool)

(assert (=> b!136179 (= res!65335 call!14961)))

(assert (=> b!136179 (=> (not res!65335) (not e!88696))))

(declare-fun b!136180 () Bool)

(declare-fun res!65334 () Bool)

(assert (=> b!136180 (= res!65334 call!14975)))

(assert (=> b!136180 (=> (not res!65334) (not e!88704))))

(declare-fun b!136181 () Bool)

(declare-fun Unit!4281 () Unit!4275)

(assert (=> b!136181 (= e!88707 Unit!4281)))

(declare-fun lt!71050 () Unit!4275)

(assert (=> b!136181 (= lt!71050 call!14955)))

(assert (=> b!136181 (= lt!71034 call!14954)))

(declare-fun res!65341 () Bool)

(assert (=> b!136181 (= res!65341 ((_ is Found!276) lt!71034))))

(assert (=> b!136181 (=> (not res!65341) (not e!88704))))

(assert (=> b!136181 e!88704))

(declare-fun lt!71031 () Unit!4275)

(assert (=> b!136181 (= lt!71031 lt!71050)))

(assert (=> b!136181 false))

(declare-fun bm!14971 () Bool)

(assert (=> bm!14971 (= call!14977 call!14959)))

(declare-fun bm!14972 () Bool)

(assert (=> bm!14972 (= call!14954 call!14966)))

(declare-fun b!136182 () Bool)

(declare-fun res!65339 () Bool)

(assert (=> b!136182 (=> (not res!65339) (not e!88709))))

(assert (=> b!136182 (= res!65339 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14973 () Bool)

(declare-fun updateHelperNewKey!62 (LongMapFixedSize!1110 (_ BitVec 64) V!3499 (_ BitVec 32)) tuple2!2644)

(assert (=> bm!14973 (= call!14963 (updateHelperNewKey!62 newMap!16 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(declare-fun b!136183 () Bool)

(assert (=> b!136183 (= e!88695 (not call!14962))))

(declare-fun b!136184 () Bool)

(declare-fun res!65328 () Bool)

(assert (=> b!136184 (= res!65328 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71046)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136184 (=> (not res!65328) (not e!88697))))

(declare-fun bm!14974 () Bool)

(assert (=> bm!14974 (= call!14968 (map!1416 (_2!1333 lt!71054)))))

(assert (= (and d!42429 c!25441) b!136158))

(assert (= (and d!42429 (not c!25441)) b!136162))

(assert (= (and b!136158 c!25439) b!136173))

(assert (= (and b!136158 (not c!25439)) b!136169))

(assert (= (or b!136173 b!136169) bm!14960))

(assert (= (or b!136173 b!136169) bm!14962))

(assert (= (or b!136173 b!136169) bm!14971))

(assert (= (and b!136162 c!25435) b!136159))

(assert (= (and b!136162 (not c!25435)) b!136170))

(assert (= (and b!136159 c!25433) b!136181))

(assert (= (and b!136159 (not c!25433)) b!136154))

(assert (= (and b!136181 res!65341) b!136180))

(assert (= (and b!136180 res!65334) b!136157))

(assert (= (and b!136154 c!25434) b!136172))

(assert (= (and b!136154 (not c!25434)) b!136168))

(assert (= (and b!136172 res!65331) b!136182))

(assert (= (and b!136182 res!65339) b!136166))

(assert (= (and b!136168 c!25440) b!136156))

(assert (= (and b!136168 (not c!25440)) b!136165))

(assert (= (and b!136156 res!65338) b!136174))

(assert (= (and b!136174 res!65333) b!136183))

(assert (= (or b!136172 b!136156) bm!14968))

(assert (= (or b!136166 b!136183) bm!14963))

(assert (= (or b!136180 bm!14968) bm!14967))

(assert (= (or b!136181 b!136154) bm!14972))

(assert (= (and b!136170 c!25430) b!136171))

(assert (= (and b!136170 (not c!25430)) b!136151))

(assert (= (and b!136151 c!25436) b!136175))

(assert (= (and b!136151 (not c!25436)) b!136167))

(assert (= (and b!136167 c!25431) b!136153))

(assert (= (and b!136167 (not c!25431)) b!136149))

(assert (= (and b!136153 res!65337) b!136179))

(assert (= (and b!136179 res!65335) b!136176))

(assert (= (and b!136149 c!25437) b!136152))

(assert (= (and b!136149 (not c!25437)) b!136164))

(assert (= (and b!136152 res!65332) b!136160))

(assert (= (and b!136160 res!65340) b!136177))

(assert (= (and b!136164 c!25438) b!136150))

(assert (= (and b!136164 (not c!25438)) b!136161))

(assert (= (and b!136150 res!65329) b!136184))

(assert (= (and b!136184 res!65328) b!136148))

(assert (= (or b!136152 b!136150) bm!14969))

(assert (= (or b!136177 b!136148) bm!14964))

(assert (= (or b!136179 bm!14969) bm!14959))

(assert (= (or b!136153 b!136149) bm!14970))

(assert (= (or b!136171 b!136175) bm!14973))

(assert (= (or bm!14972 bm!14970) bm!14966))

(assert (= (or bm!14967 bm!14959) bm!14957))

(assert (= (or bm!14963 bm!14964) bm!14958))

(assert (= (or b!136181 b!136153) bm!14953))

(assert (= (or b!136154 b!136149) bm!14951))

(assert (= (or b!136159 b!136167) bm!14956))

(assert (= (or b!136159 b!136167) bm!14961))

(assert (= (or bm!14962 bm!14956) bm!14952))

(assert (= (or bm!14960 b!136167) bm!14954))

(assert (= (or bm!14971 b!136167) bm!14955))

(assert (= (and d!42429 res!65330) b!136178))

(assert (= (and b!136178 c!25432) b!136147))

(assert (= (and b!136178 (not c!25432)) b!136155))

(assert (= (and b!136147 res!65336) b!136163))

(assert (= (or b!136147 b!136163 b!136155) bm!14974))

(assert (= (or b!136163 b!136155) bm!14965))

(assert (=> bm!14953 m!162081))

(declare-fun m!162159 () Bool)

(assert (=> bm!14953 m!162159))

(assert (=> b!136162 m!162081))

(declare-fun m!162161 () Bool)

(assert (=> b!136162 m!162161))

(declare-fun m!162163 () Bool)

(assert (=> b!136182 m!162163))

(assert (=> b!136169 m!162103))

(declare-fun m!162165 () Bool)

(assert (=> b!136169 m!162165))

(assert (=> bm!14965 m!162089))

(declare-fun m!162167 () Bool)

(assert (=> b!136163 m!162167))

(declare-fun m!162169 () Bool)

(assert (=> b!136157 m!162169))

(declare-fun m!162171 () Bool)

(assert (=> b!136160 m!162171))

(declare-fun m!162173 () Bool)

(assert (=> bm!14957 m!162173))

(assert (=> bm!14958 m!162081))

(declare-fun m!162175 () Bool)

(assert (=> bm!14958 m!162175))

(assert (=> bm!14973 m!162081))

(assert (=> bm!14973 m!162103))

(declare-fun m!162177 () Bool)

(assert (=> bm!14973 m!162177))

(declare-fun m!162179 () Bool)

(assert (=> d!42429 m!162179))

(assert (=> d!42429 m!162087))

(assert (=> bm!14966 m!162081))

(assert (=> bm!14966 m!162161))

(declare-fun m!162181 () Bool)

(assert (=> b!136176 m!162181))

(assert (=> b!136173 m!162103))

(declare-fun m!162183 () Bool)

(assert (=> b!136173 m!162183))

(declare-fun m!162185 () Bool)

(assert (=> bm!14961 m!162185))

(declare-fun m!162187 () Bool)

(assert (=> bm!14961 m!162187))

(declare-fun m!162189 () Bool)

(assert (=> bm!14954 m!162189))

(declare-fun m!162191 () Bool)

(assert (=> bm!14952 m!162191))

(assert (=> bm!14951 m!162081))

(declare-fun m!162193 () Bool)

(assert (=> bm!14951 m!162193))

(declare-fun m!162195 () Bool)

(assert (=> b!136184 m!162195))

(declare-fun m!162197 () Bool)

(assert (=> bm!14974 m!162197))

(declare-fun m!162199 () Bool)

(assert (=> b!136174 m!162199))

(declare-fun m!162201 () Bool)

(assert (=> b!136167 m!162201))

(assert (=> b!136167 m!162081))

(assert (=> b!136167 m!162103))

(declare-fun m!162203 () Bool)

(assert (=> b!136167 m!162203))

(declare-fun m!162205 () Bool)

(assert (=> b!136167 m!162205))

(assert (=> b!136167 m!162081))

(declare-fun m!162207 () Bool)

(assert (=> b!136167 m!162207))

(declare-fun m!162209 () Bool)

(assert (=> b!136167 m!162209))

(assert (=> b!136147 m!162081))

(declare-fun m!162211 () Bool)

(assert (=> b!136147 m!162211))

(declare-fun m!162213 () Bool)

(assert (=> bm!14955 m!162213))

(assert (=> b!135999 d!42429))

(declare-fun d!42431 () Bool)

(declare-fun c!25444 () Bool)

(assert (=> d!42431 (= c!25444 ((_ is ValueCellFull!1101) (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!88717 () V!3499)

(assert (=> d!42431 (= (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!88717)))

(declare-fun b!136189 () Bool)

(declare-fun get!1495 (ValueCell!1101 V!3499) V!3499)

(assert (=> b!136189 (= e!88717 (get!1495 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136190 () Bool)

(declare-fun get!1496 (ValueCell!1101 V!3499) V!3499)

(assert (=> b!136190 (= e!88717 (get!1496 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42431 c!25444) b!136189))

(assert (= (and d!42431 (not c!25444)) b!136190))

(assert (=> b!136189 m!162099))

(assert (=> b!136189 m!162101))

(declare-fun m!162215 () Bool)

(assert (=> b!136189 m!162215))

(assert (=> b!136190 m!162099))

(assert (=> b!136190 m!162101))

(declare-fun m!162217 () Bool)

(assert (=> b!136190 m!162217))

(assert (=> b!135999 d!42431))

(declare-fun d!42433 () Bool)

(assert (=> d!42433 (= (array_inv!1429 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvsge (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!136004 d!42433))

(declare-fun d!42435 () Bool)

(assert (=> d!42435 (= (array_inv!1430 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvsge (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!136004 d!42435))

(declare-fun d!42437 () Bool)

(assert (=> d!42437 (= (map!1416 newMap!16) (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun bs!5706 () Bool)

(assert (= bs!5706 d!42437))

(assert (=> bs!5706 m!162189))

(assert (=> b!135995 d!42437))

(declare-fun b!136233 () Bool)

(declare-fun e!88755 () ListLongMap!1715)

(declare-fun call!14993 () ListLongMap!1715)

(assert (=> b!136233 (= e!88755 call!14993)))

(declare-fun bm!14989 () Bool)

(declare-fun call!14994 () Bool)

(declare-fun lt!71115 () ListLongMap!1715)

(assert (=> bm!14989 (= call!14994 (contains!905 lt!71115 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136234 () Bool)

(declare-fun e!88746 () Bool)

(declare-fun e!88751 () Bool)

(assert (=> b!136234 (= e!88746 e!88751)))

(declare-fun c!25459 () Bool)

(assert (=> b!136234 (= c!25459 (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136235 () Bool)

(assert (=> b!136235 (= e!88751 (not call!14994))))

(declare-fun b!136236 () Bool)

(declare-fun c!25460 () Bool)

(assert (=> b!136236 (= c!25460 (and (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!88750 () ListLongMap!1715)

(assert (=> b!136236 (= e!88750 e!88755)))

(declare-fun call!14992 () ListLongMap!1715)

(declare-fun call!14995 () ListLongMap!1715)

(declare-fun call!14997 () ListLongMap!1715)

(declare-fun bm!14990 () Bool)

(declare-fun call!14998 () ListLongMap!1715)

(declare-fun c!25462 () Bool)

(declare-fun c!25457 () Bool)

(assert (=> bm!14990 (= call!14995 (+!176 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun bm!14991 () Bool)

(assert (=> bm!14991 (= call!14993 call!14995)))

(declare-fun bm!14992 () Bool)

(assert (=> bm!14992 (= call!14997 call!14998)))

(declare-fun b!136237 () Bool)

(declare-fun e!88744 () Unit!4275)

(declare-fun lt!71104 () Unit!4275)

(assert (=> b!136237 (= e!88744 lt!71104)))

(declare-fun lt!71121 () ListLongMap!1715)

(declare-fun getCurrentListMapNoExtraKeys!142 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) Int) ListLongMap!1715)

(assert (=> b!136237 (= lt!71121 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun lt!71105 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71114 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71114 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!71108 () Unit!4275)

(declare-fun addStillContains!93 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> b!136237 (= lt!71108 (addStillContains!93 lt!71121 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71114))))

(assert (=> b!136237 (contains!905 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71114)))

(declare-fun lt!71101 () Unit!4275)

(assert (=> b!136237 (= lt!71101 lt!71108)))

(declare-fun lt!71102 () ListLongMap!1715)

(assert (=> b!136237 (= lt!71102 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun lt!71120 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71122 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71122 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!71106 () Unit!4275)

(declare-fun addApplyDifferent!93 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> b!136237 (= lt!71106 (addApplyDifferent!93 lt!71102 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71122))))

(declare-fun apply!117 (ListLongMap!1715 (_ BitVec 64)) V!3499)

(assert (=> b!136237 (= (apply!117 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71122) (apply!117 lt!71102 lt!71122))))

(declare-fun lt!71116 () Unit!4275)

(assert (=> b!136237 (= lt!71116 lt!71106)))

(declare-fun lt!71112 () ListLongMap!1715)

(assert (=> b!136237 (= lt!71112 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun lt!71107 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71111 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71111 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!71110 () Unit!4275)

(assert (=> b!136237 (= lt!71110 (addApplyDifferent!93 lt!71112 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71111))))

(assert (=> b!136237 (= (apply!117 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71111) (apply!117 lt!71112 lt!71111))))

(declare-fun lt!71109 () Unit!4275)

(assert (=> b!136237 (= lt!71109 lt!71110)))

(declare-fun lt!71103 () ListLongMap!1715)

(assert (=> b!136237 (= lt!71103 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun lt!71117 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71118 () (_ BitVec 64))

(assert (=> b!136237 (= lt!71118 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!136237 (= lt!71104 (addApplyDifferent!93 lt!71103 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71118))))

(assert (=> b!136237 (= (apply!117 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71118) (apply!117 lt!71103 lt!71118))))

(declare-fun bm!14993 () Bool)

(assert (=> bm!14993 (= call!14998 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136239 () Bool)

(declare-fun e!88752 () Bool)

(declare-fun e!88749 () Bool)

(assert (=> b!136239 (= e!88752 e!88749)))

(declare-fun res!65368 () Bool)

(assert (=> b!136239 (=> (not res!65368) (not e!88749))))

(assert (=> b!136239 (= res!65368 (contains!905 lt!71115 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136239 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136240 () Bool)

(declare-fun e!88756 () Bool)

(assert (=> b!136240 (= e!88751 e!88756)))

(declare-fun res!65362 () Bool)

(assert (=> b!136240 (= res!65362 call!14994)))

(assert (=> b!136240 (=> (not res!65362) (not e!88756))))

(declare-fun b!136241 () Bool)

(declare-fun res!65363 () Bool)

(assert (=> b!136241 (=> (not res!65363) (not e!88746))))

(declare-fun e!88745 () Bool)

(assert (=> b!136241 (= res!65363 e!88745)))

(declare-fun c!25461 () Bool)

(assert (=> b!136241 (= c!25461 (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136242 () Bool)

(declare-fun Unit!4282 () Unit!4275)

(assert (=> b!136242 (= e!88744 Unit!4282)))

(declare-fun b!136243 () Bool)

(declare-fun e!88753 () Bool)

(assert (=> b!136243 (= e!88753 (= (apply!117 lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136244 () Bool)

(declare-fun e!88748 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!136244 (= e!88748 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!136245 () Bool)

(declare-fun e!88754 () ListLongMap!1715)

(assert (=> b!136245 (= e!88754 (+!176 call!14995 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136246 () Bool)

(assert (=> b!136246 (= e!88754 e!88750)))

(assert (=> b!136246 (= c!25462 (and (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136247 () Bool)

(assert (=> b!136247 (= e!88745 e!88753)))

(declare-fun res!65364 () Bool)

(declare-fun call!14996 () Bool)

(assert (=> b!136247 (= res!65364 call!14996)))

(assert (=> b!136247 (=> (not res!65364) (not e!88753))))

(declare-fun b!136248 () Bool)

(declare-fun res!65360 () Bool)

(assert (=> b!136248 (=> (not res!65360) (not e!88746))))

(assert (=> b!136248 (= res!65360 e!88752)))

(declare-fun res!65367 () Bool)

(assert (=> b!136248 (=> res!65367 e!88752)))

(assert (=> b!136248 (= res!65367 (not e!88748))))

(declare-fun res!65365 () Bool)

(assert (=> b!136248 (=> (not res!65365) (not e!88748))))

(assert (=> b!136248 (= res!65365 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136249 () Bool)

(declare-fun e!88747 () Bool)

(assert (=> b!136249 (= e!88747 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14994 () Bool)

(assert (=> bm!14994 (= call!14992 call!14997)))

(declare-fun b!136250 () Bool)

(assert (=> b!136250 (= e!88745 (not call!14996))))

(declare-fun bm!14995 () Bool)

(assert (=> bm!14995 (= call!14996 (contains!905 lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42439 () Bool)

(assert (=> d!42439 e!88746))

(declare-fun res!65366 () Bool)

(assert (=> d!42439 (=> (not res!65366) (not e!88746))))

(assert (=> d!42439 (= res!65366 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun lt!71113 () ListLongMap!1715)

(assert (=> d!42439 (= lt!71115 lt!71113)))

(declare-fun lt!71119 () Unit!4275)

(assert (=> d!42439 (= lt!71119 e!88744)))

(declare-fun c!25458 () Bool)

(assert (=> d!42439 (= c!25458 e!88747)))

(declare-fun res!65361 () Bool)

(assert (=> d!42439 (=> (not res!65361) (not e!88747))))

(assert (=> d!42439 (= res!65361 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42439 (= lt!71113 e!88754)))

(assert (=> d!42439 (= c!25457 (and (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!42439 (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992))))))

(assert (=> d!42439 (= (getCurrentListMap!549 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) lt!71115)))

(declare-fun b!136238 () Bool)

(assert (=> b!136238 (= e!88755 call!14992)))

(declare-fun b!136251 () Bool)

(assert (=> b!136251 (= e!88756 (= (apply!117 lt!71115 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136252 () Bool)

(assert (=> b!136252 (= e!88750 call!14993)))

(declare-fun b!136253 () Bool)

(assert (=> b!136253 (= e!88749 (= (apply!117 lt!71115 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136253 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> b!136253 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42439 c!25457) b!136245))

(assert (= (and d!42439 (not c!25457)) b!136246))

(assert (= (and b!136246 c!25462) b!136252))

(assert (= (and b!136246 (not c!25462)) b!136236))

(assert (= (and b!136236 c!25460) b!136233))

(assert (= (and b!136236 (not c!25460)) b!136238))

(assert (= (or b!136233 b!136238) bm!14994))

(assert (= (or b!136252 bm!14994) bm!14992))

(assert (= (or b!136252 b!136233) bm!14991))

(assert (= (or b!136245 bm!14992) bm!14993))

(assert (= (or b!136245 bm!14991) bm!14990))

(assert (= (and d!42439 res!65361) b!136249))

(assert (= (and d!42439 c!25458) b!136237))

(assert (= (and d!42439 (not c!25458)) b!136242))

(assert (= (and d!42439 res!65366) b!136248))

(assert (= (and b!136248 res!65365) b!136244))

(assert (= (and b!136248 (not res!65367)) b!136239))

(assert (= (and b!136239 res!65368) b!136253))

(assert (= (and b!136248 res!65360) b!136241))

(assert (= (and b!136241 c!25461) b!136247))

(assert (= (and b!136241 (not c!25461)) b!136250))

(assert (= (and b!136247 res!65364) b!136243))

(assert (= (or b!136247 b!136250) bm!14995))

(assert (= (and b!136241 res!65363) b!136234))

(assert (= (and b!136234 c!25459) b!136240))

(assert (= (and b!136234 (not c!25459)) b!136235))

(assert (= (and b!136240 res!65362) b!136251))

(assert (= (or b!136240 b!136235) bm!14989))

(declare-fun b_lambda!6079 () Bool)

(assert (=> (not b_lambda!6079) (not b!136253)))

(assert (=> b!136253 t!6208))

(declare-fun b_and!8435 () Bool)

(assert (= b_and!8423 (and (=> t!6208 result!4033) b_and!8435)))

(assert (=> b!136253 t!6210))

(declare-fun b_and!8437 () Bool)

(assert (= b_and!8425 (and (=> t!6210 result!4037) b_and!8437)))

(declare-fun m!162219 () Bool)

(assert (=> b!136245 m!162219))

(declare-fun m!162221 () Bool)

(assert (=> b!136237 m!162221))

(declare-fun m!162223 () Bool)

(assert (=> b!136237 m!162223))

(declare-fun m!162225 () Bool)

(assert (=> b!136237 m!162225))

(declare-fun m!162227 () Bool)

(assert (=> b!136237 m!162227))

(declare-fun m!162229 () Bool)

(assert (=> b!136237 m!162229))

(assert (=> b!136237 m!162221))

(declare-fun m!162231 () Bool)

(assert (=> b!136237 m!162231))

(declare-fun m!162233 () Bool)

(assert (=> b!136237 m!162233))

(declare-fun m!162235 () Bool)

(assert (=> b!136237 m!162235))

(assert (=> b!136237 m!162227))

(declare-fun m!162237 () Bool)

(assert (=> b!136237 m!162237))

(declare-fun m!162239 () Bool)

(assert (=> b!136237 m!162239))

(declare-fun m!162241 () Bool)

(assert (=> b!136237 m!162241))

(declare-fun m!162243 () Bool)

(assert (=> b!136237 m!162243))

(declare-fun m!162245 () Bool)

(assert (=> b!136237 m!162245))

(assert (=> b!136237 m!162239))

(declare-fun m!162247 () Bool)

(assert (=> b!136237 m!162247))

(declare-fun m!162249 () Bool)

(assert (=> b!136237 m!162249))

(assert (=> b!136237 m!162233))

(declare-fun m!162251 () Bool)

(assert (=> b!136237 m!162251))

(declare-fun m!162253 () Bool)

(assert (=> b!136237 m!162253))

(assert (=> b!136239 m!162243))

(assert (=> b!136239 m!162243))

(declare-fun m!162255 () Bool)

(assert (=> b!136239 m!162255))

(assert (=> b!136244 m!162243))

(assert (=> b!136244 m!162243))

(declare-fun m!162257 () Bool)

(assert (=> b!136244 m!162257))

(declare-fun m!162259 () Bool)

(assert (=> b!136243 m!162259))

(declare-fun m!162261 () Bool)

(assert (=> b!136253 m!162261))

(assert (=> b!136253 m!162261))

(assert (=> b!136253 m!162101))

(declare-fun m!162263 () Bool)

(assert (=> b!136253 m!162263))

(assert (=> b!136253 m!162243))

(assert (=> b!136253 m!162101))

(assert (=> b!136253 m!162243))

(declare-fun m!162265 () Bool)

(assert (=> b!136253 m!162265))

(declare-fun m!162267 () Bool)

(assert (=> bm!14995 m!162267))

(declare-fun m!162269 () Bool)

(assert (=> bm!14990 m!162269))

(declare-fun m!162271 () Bool)

(assert (=> bm!14989 m!162271))

(declare-fun m!162273 () Bool)

(assert (=> d!42439 m!162273))

(assert (=> bm!14993 m!162247))

(declare-fun m!162275 () Bool)

(assert (=> b!136251 m!162275))

(assert (=> b!136249 m!162243))

(assert (=> b!136249 m!162243))

(assert (=> b!136249 m!162257))

(assert (=> b!135995 d!42439))

(declare-fun d!42441 () Bool)

(assert (=> d!42441 (= (array_inv!1429 (_keys!4642 newMap!16)) (bvsge (size!2543 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!136009 d!42441))

(declare-fun d!42443 () Bool)

(assert (=> d!42443 (= (array_inv!1430 (_values!2872 newMap!16)) (bvsge (size!2544 (_values!2872 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!136009 d!42443))

(declare-fun d!42445 () Bool)

(declare-fun res!65375 () Bool)

(declare-fun e!88759 () Bool)

(assert (=> d!42445 (=> (not res!65375) (not e!88759))))

(declare-fun simpleValid!93 (LongMapFixedSize!1110) Bool)

(assert (=> d!42445 (= res!65375 (simpleValid!93 newMap!16))))

(assert (=> d!42445 (= (valid!533 newMap!16) e!88759)))

(declare-fun b!136260 () Bool)

(declare-fun res!65376 () Bool)

(assert (=> b!136260 (=> (not res!65376) (not e!88759))))

(declare-fun arrayCountValidKeys!0 (array!4807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!136260 (= res!65376 (= (arrayCountValidKeys!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (_size!604 newMap!16)))))

(declare-fun b!136261 () Bool)

(declare-fun res!65377 () Bool)

(assert (=> b!136261 (=> (not res!65377) (not e!88759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4807 (_ BitVec 32)) Bool)

(assert (=> b!136261 (= res!65377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun b!136262 () Bool)

(declare-datatypes ((List!1725 0))(
  ( (Nil!1722) (Cons!1721 (h!2327 (_ BitVec 64)) (t!6217 List!1725)) )
))
(declare-fun arrayNoDuplicates!0 (array!4807 (_ BitVec 32) List!1725) Bool)

(assert (=> b!136262 (= e!88759 (arrayNoDuplicates!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!42445 res!65375) b!136260))

(assert (= (and b!136260 res!65376) b!136261))

(assert (= (and b!136261 res!65377) b!136262))

(declare-fun m!162277 () Bool)

(assert (=> d!42445 m!162277))

(declare-fun m!162279 () Bool)

(assert (=> b!136260 m!162279))

(declare-fun m!162281 () Bool)

(assert (=> b!136261 m!162281))

(declare-fun m!162283 () Bool)

(assert (=> b!136262 m!162283))

(assert (=> b!136005 d!42445))

(declare-fun d!42447 () Bool)

(assert (=> d!42447 (= (valid!532 thiss!992) (valid!533 (v!3221 (underlying!460 thiss!992))))))

(declare-fun bs!5707 () Bool)

(assert (= bs!5707 d!42447))

(declare-fun m!162285 () Bool)

(assert (=> bs!5707 m!162285))

(assert (=> start!14430 d!42447))

(declare-fun d!42449 () Bool)

(declare-fun res!65382 () Bool)

(declare-fun e!88764 () Bool)

(assert (=> d!42449 (=> res!65382 e!88764)))

(assert (=> d!42449 (= res!65382 (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42449 (= (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!88764)))

(declare-fun b!136267 () Bool)

(declare-fun e!88765 () Bool)

(assert (=> b!136267 (= e!88764 e!88765)))

(declare-fun res!65383 () Bool)

(assert (=> b!136267 (=> (not res!65383) (not e!88765))))

(assert (=> b!136267 (= res!65383 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136268 () Bool)

(assert (=> b!136268 (= e!88765 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!42449 (not res!65382)) b!136267))

(assert (= (and b!136267 res!65383) b!136268))

(assert (=> d!42449 m!162243))

(assert (=> b!136268 m!162081))

(declare-fun m!162287 () Bool)

(assert (=> b!136268 m!162287))

(assert (=> b!136003 d!42449))

(declare-fun d!42451 () Bool)

(declare-fun e!88768 () Bool)

(assert (=> d!42451 e!88768))

(declare-fun c!25465 () Bool)

(assert (=> d!42451 (= c!25465 (and (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!71125 () Unit!4275)

(declare-fun choose!830 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) (_ BitVec 32) Int) Unit!4275)

(assert (=> d!42451 (= lt!71125 (choose!830 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(assert (=> d!42451 (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992))))))

(assert (=> d!42451 (= (lemmaListMapContainsThenArrayContainsFrom!128 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) lt!71125)))

(declare-fun b!136273 () Bool)

(assert (=> b!136273 (= e!88768 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!136274 () Bool)

(assert (=> b!136274 (= e!88768 (ite (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!42451 c!25465) b!136273))

(assert (= (and d!42451 (not c!25465)) b!136274))

(assert (=> d!42451 m!162081))

(declare-fun m!162289 () Bool)

(assert (=> d!42451 m!162289))

(assert (=> d!42451 m!162273))

(assert (=> b!136273 m!162081))

(assert (=> b!136273 m!162083))

(assert (=> b!136003 d!42451))

(declare-fun b!136282 () Bool)

(declare-fun e!88773 () Bool)

(assert (=> b!136282 (= e!88773 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4699 () Bool)

(declare-fun mapRes!4699 () Bool)

(declare-fun tp!11305 () Bool)

(declare-fun e!88774 () Bool)

(assert (=> mapNonEmpty!4699 (= mapRes!4699 (and tp!11305 e!88774))))

(declare-fun mapValue!4699 () ValueCell!1101)

(declare-fun mapKey!4699 () (_ BitVec 32))

(declare-fun mapRest!4699 () (Array (_ BitVec 32) ValueCell!1101))

(assert (=> mapNonEmpty!4699 (= mapRest!4690 (store mapRest!4699 mapKey!4699 mapValue!4699))))

(declare-fun b!136281 () Bool)

(assert (=> b!136281 (= e!88774 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4699 () Bool)

(assert (=> mapIsEmpty!4699 mapRes!4699))

(declare-fun condMapEmpty!4699 () Bool)

(declare-fun mapDefault!4699 () ValueCell!1101)

(assert (=> mapNonEmpty!4690 (= condMapEmpty!4699 (= mapRest!4690 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4699)))))

(assert (=> mapNonEmpty!4690 (= tp!11289 (and e!88773 mapRes!4699))))

(assert (= (and mapNonEmpty!4690 condMapEmpty!4699) mapIsEmpty!4699))

(assert (= (and mapNonEmpty!4690 (not condMapEmpty!4699)) mapNonEmpty!4699))

(assert (= (and mapNonEmpty!4699 ((_ is ValueCellFull!1101) mapValue!4699)) b!136281))

(assert (= (and mapNonEmpty!4690 ((_ is ValueCellFull!1101) mapDefault!4699)) b!136282))

(declare-fun m!162291 () Bool)

(assert (=> mapNonEmpty!4699 m!162291))

(declare-fun b!136284 () Bool)

(declare-fun e!88775 () Bool)

(assert (=> b!136284 (= e!88775 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4700 () Bool)

(declare-fun mapRes!4700 () Bool)

(declare-fun tp!11306 () Bool)

(declare-fun e!88776 () Bool)

(assert (=> mapNonEmpty!4700 (= mapRes!4700 (and tp!11306 e!88776))))

(declare-fun mapKey!4700 () (_ BitVec 32))

(declare-fun mapValue!4700 () ValueCell!1101)

(declare-fun mapRest!4700 () (Array (_ BitVec 32) ValueCell!1101))

(assert (=> mapNonEmpty!4700 (= mapRest!4689 (store mapRest!4700 mapKey!4700 mapValue!4700))))

(declare-fun b!136283 () Bool)

(assert (=> b!136283 (= e!88776 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4700 () Bool)

(assert (=> mapIsEmpty!4700 mapRes!4700))

(declare-fun condMapEmpty!4700 () Bool)

(declare-fun mapDefault!4700 () ValueCell!1101)

(assert (=> mapNonEmpty!4689 (= condMapEmpty!4700 (= mapRest!4689 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4700)))))

(assert (=> mapNonEmpty!4689 (= tp!11290 (and e!88775 mapRes!4700))))

(assert (= (and mapNonEmpty!4689 condMapEmpty!4700) mapIsEmpty!4700))

(assert (= (and mapNonEmpty!4689 (not condMapEmpty!4700)) mapNonEmpty!4700))

(assert (= (and mapNonEmpty!4700 ((_ is ValueCellFull!1101) mapValue!4700)) b!136283))

(assert (= (and mapNonEmpty!4689 ((_ is ValueCellFull!1101) mapDefault!4700)) b!136284))

(declare-fun m!162293 () Bool)

(assert (=> mapNonEmpty!4700 m!162293))

(declare-fun b_lambda!6081 () Bool)

(assert (= b_lambda!6079 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6081)))

(check-sat (not b!136189) (not b!136273) (not b!136162) (not bm!14990) (not bm!14957) (not b!136244) (not bm!14952) (not bm!14993) (not b!136268) (not b!136167) (not b!136249) (not b!136243) (not bm!14951) (not b_lambda!6077) (not mapNonEmpty!4700) (not bm!14958) (not b_lambda!6081) b_and!8435 (not b!136173) tp_is_empty!2889 (not bm!14965) (not mapNonEmpty!4699) (not d!42429) (not d!42437) (not bm!14954) (not bm!14953) (not b!136068) (not b!136190) (not bm!14955) (not b!136251) (not d!42427) (not bm!14961) (not b!136261) (not b!136245) (not b_next!2947) (not b!136070) (not d!42439) (not b!136163) (not bm!14973) (not b!136239) (not b!136253) (not b!136147) (not b!136262) (not d!42451) (not b_next!2945) b_and!8437 (not b!136169) (not bm!14966) (not bm!14995) (not bm!14974) (not bm!14989) (not d!42445) (not d!42447) (not b!136237) (not b!136260))
(check-sat b_and!8435 b_and!8437 (not b_next!2945) (not b_next!2947))
(get-model)

(declare-fun d!42453 () Bool)

(assert (=> d!42453 (= (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136249 d!42453))

(declare-fun d!42455 () Bool)

(declare-fun e!88779 () Bool)

(assert (=> d!42455 e!88779))

(declare-fun res!65386 () Bool)

(assert (=> d!42455 (=> (not res!65386) (not e!88779))))

(assert (=> d!42455 (= res!65386 (and (bvsge (index!3266 lt!71036) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71036) (size!2543 (_keys!4642 newMap!16)))))))

(declare-fun lt!71128 () Unit!4275)

(declare-fun choose!831 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) Int) Unit!4275)

(assert (=> d!42455 (= lt!71128 (choose!831 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42455 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42455 (= (lemmaValidKeyInArrayIsInListMap!123 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (defaultEntry!2889 newMap!16)) lt!71128)))

(declare-fun b!136287 () Bool)

(assert (=> b!136287 (= e!88779 (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))

(assert (= (and d!42455 res!65386) b!136287))

(declare-fun m!162295 () Bool)

(assert (=> d!42455 m!162295))

(declare-fun m!162297 () Bool)

(assert (=> d!42455 m!162297))

(declare-fun m!162299 () Bool)

(assert (=> b!136287 m!162299))

(assert (=> b!136287 m!162185))

(assert (=> b!136287 m!162299))

(assert (=> b!136287 m!162185))

(declare-fun m!162301 () Bool)

(assert (=> b!136287 m!162301))

(assert (=> b!136167 d!42455))

(declare-fun b!136288 () Bool)

(declare-fun e!88791 () ListLongMap!1715)

(declare-fun call!15000 () ListLongMap!1715)

(assert (=> b!136288 (= e!88791 call!15000)))

(declare-fun bm!14996 () Bool)

(declare-fun call!15001 () Bool)

(declare-fun lt!71143 () ListLongMap!1715)

(assert (=> bm!14996 (= call!15001 (contains!905 lt!71143 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136289 () Bool)

(declare-fun e!88782 () Bool)

(declare-fun e!88787 () Bool)

(assert (=> b!136289 (= e!88782 e!88787)))

(declare-fun c!25468 () Bool)

(assert (=> b!136289 (= c!25468 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136290 () Bool)

(assert (=> b!136290 (= e!88787 (not call!15001))))

(declare-fun b!136291 () Bool)

(declare-fun c!25469 () Bool)

(assert (=> b!136291 (= c!25469 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!88786 () ListLongMap!1715)

(assert (=> b!136291 (= e!88786 e!88791)))

(declare-fun call!15004 () ListLongMap!1715)

(declare-fun c!25471 () Bool)

(declare-fun call!15005 () ListLongMap!1715)

(declare-fun c!25466 () Bool)

(declare-fun call!15002 () ListLongMap!1715)

(declare-fun bm!14997 () Bool)

(declare-fun call!14999 () ListLongMap!1715)

(assert (=> bm!14997 (= call!15002 (+!176 (ite c!25466 call!15005 (ite c!25471 call!15004 call!14999)) (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!14998 () Bool)

(assert (=> bm!14998 (= call!15000 call!15002)))

(declare-fun bm!14999 () Bool)

(assert (=> bm!14999 (= call!15004 call!15005)))

(declare-fun b!136292 () Bool)

(declare-fun e!88780 () Unit!4275)

(declare-fun lt!71132 () Unit!4275)

(assert (=> b!136292 (= e!88780 lt!71132)))

(declare-fun lt!71149 () ListLongMap!1715)

(assert (=> b!136292 (= lt!71149 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71133 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71142 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71142 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71136 () Unit!4275)

(assert (=> b!136292 (= lt!71136 (addStillContains!93 lt!71149 lt!71133 (zeroValue!2742 newMap!16) lt!71142))))

(assert (=> b!136292 (contains!905 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) lt!71142)))

(declare-fun lt!71129 () Unit!4275)

(assert (=> b!136292 (= lt!71129 lt!71136)))

(declare-fun lt!71130 () ListLongMap!1715)

(assert (=> b!136292 (= lt!71130 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71148 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71150 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71150 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71134 () Unit!4275)

(assert (=> b!136292 (= lt!71134 (addApplyDifferent!93 lt!71130 lt!71148 (minValue!2742 newMap!16) lt!71150))))

(assert (=> b!136292 (= (apply!117 (+!176 lt!71130 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) lt!71150) (apply!117 lt!71130 lt!71150))))

(declare-fun lt!71144 () Unit!4275)

(assert (=> b!136292 (= lt!71144 lt!71134)))

(declare-fun lt!71140 () ListLongMap!1715)

(assert (=> b!136292 (= lt!71140 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71135 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71135 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71139 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71139 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71138 () Unit!4275)

(assert (=> b!136292 (= lt!71138 (addApplyDifferent!93 lt!71140 lt!71135 (zeroValue!2742 newMap!16) lt!71139))))

(assert (=> b!136292 (= (apply!117 (+!176 lt!71140 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) lt!71139) (apply!117 lt!71140 lt!71139))))

(declare-fun lt!71137 () Unit!4275)

(assert (=> b!136292 (= lt!71137 lt!71138)))

(declare-fun lt!71131 () ListLongMap!1715)

(assert (=> b!136292 (= lt!71131 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71145 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71146 () (_ BitVec 64))

(assert (=> b!136292 (= lt!71146 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!136292 (= lt!71132 (addApplyDifferent!93 lt!71131 lt!71145 (minValue!2742 newMap!16) lt!71146))))

(assert (=> b!136292 (= (apply!117 (+!176 lt!71131 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) lt!71146) (apply!117 lt!71131 lt!71146))))

(declare-fun bm!15000 () Bool)

(assert (=> bm!15000 (= call!15005 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!136294 () Bool)

(declare-fun e!88788 () Bool)

(declare-fun e!88785 () Bool)

(assert (=> b!136294 (= e!88788 e!88785)))

(declare-fun res!65395 () Bool)

(assert (=> b!136294 (=> (not res!65395) (not e!88785))))

(assert (=> b!136294 (= res!65395 (contains!905 lt!71143 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136295 () Bool)

(declare-fun e!88792 () Bool)

(assert (=> b!136295 (= e!88787 e!88792)))

(declare-fun res!65389 () Bool)

(assert (=> b!136295 (= res!65389 call!15001)))

(assert (=> b!136295 (=> (not res!65389) (not e!88792))))

(declare-fun b!136296 () Bool)

(declare-fun res!65390 () Bool)

(assert (=> b!136296 (=> (not res!65390) (not e!88782))))

(declare-fun e!88781 () Bool)

(assert (=> b!136296 (= res!65390 e!88781)))

(declare-fun c!25470 () Bool)

(assert (=> b!136296 (= c!25470 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136297 () Bool)

(declare-fun Unit!4283 () Unit!4275)

(assert (=> b!136297 (= e!88780 Unit!4283)))

(declare-fun b!136298 () Bool)

(declare-fun e!88789 () Bool)

(assert (=> b!136298 (= e!88789 (= (apply!117 lt!71143 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun b!136299 () Bool)

(declare-fun e!88784 () Bool)

(assert (=> b!136299 (= e!88784 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136300 () Bool)

(declare-fun e!88790 () ListLongMap!1715)

(assert (=> b!136300 (= e!88790 (+!176 call!15002 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!136301 () Bool)

(assert (=> b!136301 (= e!88790 e!88786)))

(assert (=> b!136301 (= c!25471 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136302 () Bool)

(assert (=> b!136302 (= e!88781 e!88789)))

(declare-fun res!65391 () Bool)

(declare-fun call!15003 () Bool)

(assert (=> b!136302 (= res!65391 call!15003)))

(assert (=> b!136302 (=> (not res!65391) (not e!88789))))

(declare-fun b!136303 () Bool)

(declare-fun res!65387 () Bool)

(assert (=> b!136303 (=> (not res!65387) (not e!88782))))

(assert (=> b!136303 (= res!65387 e!88788)))

(declare-fun res!65394 () Bool)

(assert (=> b!136303 (=> res!65394 e!88788)))

(assert (=> b!136303 (= res!65394 (not e!88784))))

(declare-fun res!65392 () Bool)

(assert (=> b!136303 (=> (not res!65392) (not e!88784))))

(assert (=> b!136303 (= res!65392 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136304 () Bool)

(declare-fun e!88783 () Bool)

(assert (=> b!136304 (= e!88783 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15001 () Bool)

(assert (=> bm!15001 (= call!14999 call!15004)))

(declare-fun b!136305 () Bool)

(assert (=> b!136305 (= e!88781 (not call!15003))))

(declare-fun bm!15002 () Bool)

(assert (=> bm!15002 (= call!15003 (contains!905 lt!71143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42457 () Bool)

(assert (=> d!42457 e!88782))

(declare-fun res!65393 () Bool)

(assert (=> d!42457 (=> (not res!65393) (not e!88782))))

(assert (=> d!42457 (= res!65393 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71141 () ListLongMap!1715)

(assert (=> d!42457 (= lt!71143 lt!71141)))

(declare-fun lt!71147 () Unit!4275)

(assert (=> d!42457 (= lt!71147 e!88780)))

(declare-fun c!25467 () Bool)

(assert (=> d!42457 (= c!25467 e!88783)))

(declare-fun res!65388 () Bool)

(assert (=> d!42457 (=> (not res!65388) (not e!88783))))

(assert (=> d!42457 (= res!65388 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42457 (= lt!71141 e!88790)))

(assert (=> d!42457 (= c!25466 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42457 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42457 (= (getCurrentListMap!549 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71143)))

(declare-fun b!136293 () Bool)

(assert (=> b!136293 (= e!88791 call!14999)))

(declare-fun b!136306 () Bool)

(assert (=> b!136306 (= e!88792 (= (apply!117 lt!71143 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!136307 () Bool)

(assert (=> b!136307 (= e!88786 call!15000)))

(declare-fun b!136308 () Bool)

(assert (=> b!136308 (= e!88785 (= (apply!117 lt!71143 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))))))))

(assert (=> b!136308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42457 c!25466) b!136300))

(assert (= (and d!42457 (not c!25466)) b!136301))

(assert (= (and b!136301 c!25471) b!136307))

(assert (= (and b!136301 (not c!25471)) b!136291))

(assert (= (and b!136291 c!25469) b!136288))

(assert (= (and b!136291 (not c!25469)) b!136293))

(assert (= (or b!136288 b!136293) bm!15001))

(assert (= (or b!136307 bm!15001) bm!14999))

(assert (= (or b!136307 b!136288) bm!14998))

(assert (= (or b!136300 bm!14999) bm!15000))

(assert (= (or b!136300 bm!14998) bm!14997))

(assert (= (and d!42457 res!65388) b!136304))

(assert (= (and d!42457 c!25467) b!136292))

(assert (= (and d!42457 (not c!25467)) b!136297))

(assert (= (and d!42457 res!65393) b!136303))

(assert (= (and b!136303 res!65392) b!136299))

(assert (= (and b!136303 (not res!65394)) b!136294))

(assert (= (and b!136294 res!65395) b!136308))

(assert (= (and b!136303 res!65387) b!136296))

(assert (= (and b!136296 c!25470) b!136302))

(assert (= (and b!136296 (not c!25470)) b!136305))

(assert (= (and b!136302 res!65391) b!136298))

(assert (= (or b!136302 b!136305) bm!15002))

(assert (= (and b!136296 res!65390) b!136289))

(assert (= (and b!136289 c!25468) b!136295))

(assert (= (and b!136289 (not c!25468)) b!136290))

(assert (= (and b!136295 res!65389) b!136306))

(assert (= (or b!136295 b!136290) bm!14996))

(declare-fun b_lambda!6083 () Bool)

(assert (=> (not b_lambda!6083) (not b!136308)))

(declare-fun t!6219 () Bool)

(declare-fun tb!2457 () Bool)

(assert (=> (and b!136004 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16)) t!6219) tb!2457))

(declare-fun result!4047 () Bool)

(assert (=> tb!2457 (= result!4047 tp_is_empty!2889)))

(assert (=> b!136308 t!6219))

(declare-fun b_and!8439 () Bool)

(assert (= b_and!8435 (and (=> t!6219 result!4047) b_and!8439)))

(declare-fun t!6221 () Bool)

(declare-fun tb!2459 () Bool)

(assert (=> (and b!136009 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 newMap!16)) t!6221) tb!2459))

(declare-fun result!4049 () Bool)

(assert (= result!4049 result!4047))

(assert (=> b!136308 t!6221))

(declare-fun b_and!8441 () Bool)

(assert (= b_and!8437 (and (=> t!6221 result!4049) b_and!8441)))

(declare-fun m!162303 () Bool)

(assert (=> b!136300 m!162303))

(declare-fun m!162305 () Bool)

(assert (=> b!136292 m!162305))

(declare-fun m!162307 () Bool)

(assert (=> b!136292 m!162307))

(declare-fun m!162309 () Bool)

(assert (=> b!136292 m!162309))

(declare-fun m!162311 () Bool)

(assert (=> b!136292 m!162311))

(declare-fun m!162313 () Bool)

(assert (=> b!136292 m!162313))

(assert (=> b!136292 m!162305))

(declare-fun m!162315 () Bool)

(assert (=> b!136292 m!162315))

(declare-fun m!162317 () Bool)

(assert (=> b!136292 m!162317))

(declare-fun m!162319 () Bool)

(assert (=> b!136292 m!162319))

(assert (=> b!136292 m!162311))

(declare-fun m!162321 () Bool)

(assert (=> b!136292 m!162321))

(declare-fun m!162323 () Bool)

(assert (=> b!136292 m!162323))

(declare-fun m!162325 () Bool)

(assert (=> b!136292 m!162325))

(declare-fun m!162327 () Bool)

(assert (=> b!136292 m!162327))

(declare-fun m!162329 () Bool)

(assert (=> b!136292 m!162329))

(assert (=> b!136292 m!162323))

(declare-fun m!162331 () Bool)

(assert (=> b!136292 m!162331))

(declare-fun m!162333 () Bool)

(assert (=> b!136292 m!162333))

(assert (=> b!136292 m!162317))

(declare-fun m!162335 () Bool)

(assert (=> b!136292 m!162335))

(declare-fun m!162337 () Bool)

(assert (=> b!136292 m!162337))

(assert (=> b!136294 m!162327))

(assert (=> b!136294 m!162327))

(declare-fun m!162339 () Bool)

(assert (=> b!136294 m!162339))

(assert (=> b!136299 m!162327))

(assert (=> b!136299 m!162327))

(declare-fun m!162341 () Bool)

(assert (=> b!136299 m!162341))

(declare-fun m!162343 () Bool)

(assert (=> b!136298 m!162343))

(declare-fun m!162345 () Bool)

(assert (=> b!136308 m!162345))

(assert (=> b!136308 m!162345))

(declare-fun m!162347 () Bool)

(assert (=> b!136308 m!162347))

(declare-fun m!162349 () Bool)

(assert (=> b!136308 m!162349))

(assert (=> b!136308 m!162327))

(assert (=> b!136308 m!162347))

(assert (=> b!136308 m!162327))

(declare-fun m!162351 () Bool)

(assert (=> b!136308 m!162351))

(declare-fun m!162353 () Bool)

(assert (=> bm!15002 m!162353))

(declare-fun m!162355 () Bool)

(assert (=> bm!14997 m!162355))

(declare-fun m!162357 () Bool)

(assert (=> bm!14996 m!162357))

(assert (=> d!42457 m!162297))

(assert (=> bm!15000 m!162331))

(declare-fun m!162359 () Bool)

(assert (=> b!136306 m!162359))

(assert (=> b!136304 m!162327))

(assert (=> b!136304 m!162327))

(assert (=> b!136304 m!162341))

(assert (=> b!136167 d!42457))

(declare-fun d!42459 () Bool)

(declare-fun e!88795 () Bool)

(assert (=> d!42459 e!88795))

(declare-fun res!65398 () Bool)

(assert (=> d!42459 (=> (not res!65398) (not e!88795))))

(assert (=> d!42459 (= res!65398 (and (bvsge (index!3266 lt!71036) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71036) (size!2544 (_values!2872 newMap!16)))))))

(declare-fun lt!71153 () Unit!4275)

(declare-fun choose!832 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) (_ BitVec 64) V!3499 Int) Unit!4275)

(assert (=> d!42459 (= lt!71153 (choose!832 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42459 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42459 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)) lt!71153)))

(declare-fun b!136311 () Bool)

(assert (=> b!136311 (= e!88795 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))))))

(assert (= (and d!42459 res!65398) b!136311))

(assert (=> d!42459 m!162081))

(assert (=> d!42459 m!162103))

(declare-fun m!162361 () Bool)

(assert (=> d!42459 m!162361))

(assert (=> d!42459 m!162297))

(assert (=> b!136311 m!162189))

(assert (=> b!136311 m!162189))

(declare-fun m!162363 () Bool)

(assert (=> b!136311 m!162363))

(assert (=> b!136311 m!162209))

(assert (=> b!136311 m!162201))

(assert (=> b!136167 d!42459))

(declare-fun d!42461 () Bool)

(declare-fun e!88796 () Bool)

(assert (=> d!42461 e!88796))

(declare-fun res!65399 () Bool)

(assert (=> d!42461 (=> res!65399 e!88796)))

(declare-fun lt!71156 () Bool)

(assert (=> d!42461 (= res!65399 (not lt!71156))))

(declare-fun lt!71154 () Bool)

(assert (=> d!42461 (= lt!71156 lt!71154)))

(declare-fun lt!71157 () Unit!4275)

(declare-fun e!88797 () Unit!4275)

(assert (=> d!42461 (= lt!71157 e!88797)))

(declare-fun c!25472 () Bool)

(assert (=> d!42461 (= c!25472 lt!71154)))

(assert (=> d!42461 (= lt!71154 (containsKey!177 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42461 (= (contains!905 call!14970 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71156)))

(declare-fun b!136312 () Bool)

(declare-fun lt!71155 () Unit!4275)

(assert (=> b!136312 (= e!88797 lt!71155)))

(assert (=> b!136312 (= lt!71155 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136312 (isDefined!126 (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136313 () Bool)

(declare-fun Unit!4284 () Unit!4275)

(assert (=> b!136313 (= e!88797 Unit!4284)))

(declare-fun b!136314 () Bool)

(assert (=> b!136314 (= e!88796 (isDefined!126 (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (= (and d!42461 c!25472) b!136312))

(assert (= (and d!42461 (not c!25472)) b!136313))

(assert (= (and d!42461 (not res!65399)) b!136314))

(assert (=> d!42461 m!162081))

(declare-fun m!162365 () Bool)

(assert (=> d!42461 m!162365))

(assert (=> b!136312 m!162081))

(declare-fun m!162367 () Bool)

(assert (=> b!136312 m!162367))

(assert (=> b!136312 m!162081))

(declare-fun m!162369 () Bool)

(assert (=> b!136312 m!162369))

(assert (=> b!136312 m!162369))

(declare-fun m!162371 () Bool)

(assert (=> b!136312 m!162371))

(assert (=> b!136314 m!162081))

(assert (=> b!136314 m!162369))

(assert (=> b!136314 m!162369))

(assert (=> b!136314 m!162371))

(assert (=> b!136167 d!42461))

(declare-fun d!42463 () Bool)

(declare-fun e!88798 () Bool)

(assert (=> d!42463 e!88798))

(declare-fun res!65400 () Bool)

(assert (=> d!42463 (=> res!65400 e!88798)))

(declare-fun lt!71160 () Bool)

(assert (=> d!42463 (= res!65400 (not lt!71160))))

(declare-fun lt!71158 () Bool)

(assert (=> d!42463 (= lt!71160 lt!71158)))

(declare-fun lt!71161 () Unit!4275)

(declare-fun e!88799 () Unit!4275)

(assert (=> d!42463 (= lt!71161 e!88799)))

(declare-fun c!25473 () Bool)

(assert (=> d!42463 (= c!25473 lt!71158)))

(assert (=> d!42463 (= lt!71158 (containsKey!177 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42463 (= (contains!905 lt!71115 #b1000000000000000000000000000000000000000000000000000000000000000) lt!71160)))

(declare-fun b!136315 () Bool)

(declare-fun lt!71159 () Unit!4275)

(assert (=> b!136315 (= e!88799 lt!71159)))

(assert (=> b!136315 (= lt!71159 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136315 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136316 () Bool)

(declare-fun Unit!4285 () Unit!4275)

(assert (=> b!136316 (= e!88799 Unit!4285)))

(declare-fun b!136317 () Bool)

(assert (=> b!136317 (= e!88798 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42463 c!25473) b!136315))

(assert (= (and d!42463 (not c!25473)) b!136316))

(assert (= (and d!42463 (not res!65400)) b!136317))

(declare-fun m!162373 () Bool)

(assert (=> d!42463 m!162373))

(declare-fun m!162375 () Bool)

(assert (=> b!136315 m!162375))

(declare-fun m!162377 () Bool)

(assert (=> b!136315 m!162377))

(assert (=> b!136315 m!162377))

(declare-fun m!162379 () Bool)

(assert (=> b!136315 m!162379))

(assert (=> b!136317 m!162377))

(assert (=> b!136317 m!162377))

(assert (=> b!136317 m!162379))

(assert (=> bm!14989 d!42463))

(declare-fun b!136318 () Bool)

(declare-fun e!88811 () ListLongMap!1715)

(declare-fun call!15007 () ListLongMap!1715)

(assert (=> b!136318 (= e!88811 call!15007)))

(declare-fun bm!15003 () Bool)

(declare-fun call!15008 () Bool)

(declare-fun lt!71176 () ListLongMap!1715)

(assert (=> bm!15003 (= call!15008 (contains!905 lt!71176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136319 () Bool)

(declare-fun e!88802 () Bool)

(declare-fun e!88807 () Bool)

(assert (=> b!136319 (= e!88802 e!88807)))

(declare-fun c!25476 () Bool)

(assert (=> b!136319 (= c!25476 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136320 () Bool)

(assert (=> b!136320 (= e!88807 (not call!15008))))

(declare-fun b!136321 () Bool)

(declare-fun c!25477 () Bool)

(assert (=> b!136321 (= c!25477 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!88806 () ListLongMap!1715)

(assert (=> b!136321 (= e!88806 e!88811)))

(declare-fun call!15012 () ListLongMap!1715)

(declare-fun c!25474 () Bool)

(declare-fun call!15011 () ListLongMap!1715)

(declare-fun call!15006 () ListLongMap!1715)

(declare-fun c!25479 () Bool)

(declare-fun bm!15004 () Bool)

(declare-fun call!15009 () ListLongMap!1715)

(assert (=> bm!15004 (= call!15009 (+!176 (ite c!25474 call!15012 (ite c!25479 call!15011 call!15006)) (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!15005 () Bool)

(assert (=> bm!15005 (= call!15007 call!15009)))

(declare-fun bm!15006 () Bool)

(assert (=> bm!15006 (= call!15011 call!15012)))

(declare-fun b!136322 () Bool)

(declare-fun e!88800 () Unit!4275)

(declare-fun lt!71165 () Unit!4275)

(assert (=> b!136322 (= e!88800 lt!71165)))

(declare-fun lt!71182 () ListLongMap!1715)

(assert (=> b!136322 (= lt!71182 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71166 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71175 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71175 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71169 () Unit!4275)

(assert (=> b!136322 (= lt!71169 (addStillContains!93 lt!71182 lt!71166 (zeroValue!2742 newMap!16) lt!71175))))

(assert (=> b!136322 (contains!905 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) lt!71175)))

(declare-fun lt!71162 () Unit!4275)

(assert (=> b!136322 (= lt!71162 lt!71169)))

(declare-fun lt!71163 () ListLongMap!1715)

(assert (=> b!136322 (= lt!71163 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71181 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71181 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71183 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71183 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71167 () Unit!4275)

(assert (=> b!136322 (= lt!71167 (addApplyDifferent!93 lt!71163 lt!71181 (minValue!2742 newMap!16) lt!71183))))

(assert (=> b!136322 (= (apply!117 (+!176 lt!71163 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) lt!71183) (apply!117 lt!71163 lt!71183))))

(declare-fun lt!71177 () Unit!4275)

(assert (=> b!136322 (= lt!71177 lt!71167)))

(declare-fun lt!71173 () ListLongMap!1715)

(assert (=> b!136322 (= lt!71173 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71168 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71172 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71172 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71171 () Unit!4275)

(assert (=> b!136322 (= lt!71171 (addApplyDifferent!93 lt!71173 lt!71168 (zeroValue!2742 newMap!16) lt!71172))))

(assert (=> b!136322 (= (apply!117 (+!176 lt!71173 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) lt!71172) (apply!117 lt!71173 lt!71172))))

(declare-fun lt!71170 () Unit!4275)

(assert (=> b!136322 (= lt!71170 lt!71171)))

(declare-fun lt!71164 () ListLongMap!1715)

(assert (=> b!136322 (= lt!71164 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71178 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71178 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71179 () (_ BitVec 64))

(assert (=> b!136322 (= lt!71179 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!136322 (= lt!71165 (addApplyDifferent!93 lt!71164 lt!71178 (minValue!2742 newMap!16) lt!71179))))

(assert (=> b!136322 (= (apply!117 (+!176 lt!71164 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) lt!71179) (apply!117 lt!71164 lt!71179))))

(declare-fun bm!15007 () Bool)

(assert (=> bm!15007 (= call!15012 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!136324 () Bool)

(declare-fun e!88808 () Bool)

(declare-fun e!88805 () Bool)

(assert (=> b!136324 (= e!88808 e!88805)))

(declare-fun res!65409 () Bool)

(assert (=> b!136324 (=> (not res!65409) (not e!88805))))

(assert (=> b!136324 (= res!65409 (contains!905 lt!71176 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136325 () Bool)

(declare-fun e!88812 () Bool)

(assert (=> b!136325 (= e!88807 e!88812)))

(declare-fun res!65403 () Bool)

(assert (=> b!136325 (= res!65403 call!15008)))

(assert (=> b!136325 (=> (not res!65403) (not e!88812))))

(declare-fun b!136326 () Bool)

(declare-fun res!65404 () Bool)

(assert (=> b!136326 (=> (not res!65404) (not e!88802))))

(declare-fun e!88801 () Bool)

(assert (=> b!136326 (= res!65404 e!88801)))

(declare-fun c!25478 () Bool)

(assert (=> b!136326 (= c!25478 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136327 () Bool)

(declare-fun Unit!4286 () Unit!4275)

(assert (=> b!136327 (= e!88800 Unit!4286)))

(declare-fun b!136328 () Bool)

(declare-fun e!88809 () Bool)

(assert (=> b!136328 (= e!88809 (= (apply!117 lt!71176 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun b!136329 () Bool)

(declare-fun e!88804 () Bool)

(assert (=> b!136329 (= e!88804 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136330 () Bool)

(declare-fun e!88810 () ListLongMap!1715)

(assert (=> b!136330 (= e!88810 (+!176 call!15009 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!136331 () Bool)

(assert (=> b!136331 (= e!88810 e!88806)))

(assert (=> b!136331 (= c!25479 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136332 () Bool)

(assert (=> b!136332 (= e!88801 e!88809)))

(declare-fun res!65405 () Bool)

(declare-fun call!15010 () Bool)

(assert (=> b!136332 (= res!65405 call!15010)))

(assert (=> b!136332 (=> (not res!65405) (not e!88809))))

(declare-fun b!136333 () Bool)

(declare-fun res!65401 () Bool)

(assert (=> b!136333 (=> (not res!65401) (not e!88802))))

(assert (=> b!136333 (= res!65401 e!88808)))

(declare-fun res!65408 () Bool)

(assert (=> b!136333 (=> res!65408 e!88808)))

(assert (=> b!136333 (= res!65408 (not e!88804))))

(declare-fun res!65406 () Bool)

(assert (=> b!136333 (=> (not res!65406) (not e!88804))))

(assert (=> b!136333 (= res!65406 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136334 () Bool)

(declare-fun e!88803 () Bool)

(assert (=> b!136334 (= e!88803 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15008 () Bool)

(assert (=> bm!15008 (= call!15006 call!15011)))

(declare-fun b!136335 () Bool)

(assert (=> b!136335 (= e!88801 (not call!15010))))

(declare-fun bm!15009 () Bool)

(assert (=> bm!15009 (= call!15010 (contains!905 lt!71176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42465 () Bool)

(assert (=> d!42465 e!88802))

(declare-fun res!65407 () Bool)

(assert (=> d!42465 (=> (not res!65407) (not e!88802))))

(assert (=> d!42465 (= res!65407 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71174 () ListLongMap!1715)

(assert (=> d!42465 (= lt!71176 lt!71174)))

(declare-fun lt!71180 () Unit!4275)

(assert (=> d!42465 (= lt!71180 e!88800)))

(declare-fun c!25475 () Bool)

(assert (=> d!42465 (= c!25475 e!88803)))

(declare-fun res!65402 () Bool)

(assert (=> d!42465 (=> (not res!65402) (not e!88803))))

(assert (=> d!42465 (= res!65402 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42465 (= lt!71174 e!88810)))

(assert (=> d!42465 (= c!25474 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42465 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42465 (= (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71176)))

(declare-fun b!136323 () Bool)

(assert (=> b!136323 (= e!88811 call!15006)))

(declare-fun b!136336 () Bool)

(assert (=> b!136336 (= e!88812 (= (apply!117 lt!71176 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!136337 () Bool)

(assert (=> b!136337 (= e!88806 call!15007)))

(declare-fun b!136338 () Bool)

(assert (=> b!136338 (= e!88805 (= (apply!117 lt!71176 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (_values!2872 newMap!16))))))

(assert (=> b!136338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42465 c!25474) b!136330))

(assert (= (and d!42465 (not c!25474)) b!136331))

(assert (= (and b!136331 c!25479) b!136337))

(assert (= (and b!136331 (not c!25479)) b!136321))

(assert (= (and b!136321 c!25477) b!136318))

(assert (= (and b!136321 (not c!25477)) b!136323))

(assert (= (or b!136318 b!136323) bm!15008))

(assert (= (or b!136337 bm!15008) bm!15006))

(assert (= (or b!136337 b!136318) bm!15005))

(assert (= (or b!136330 bm!15006) bm!15007))

(assert (= (or b!136330 bm!15005) bm!15004))

(assert (= (and d!42465 res!65402) b!136334))

(assert (= (and d!42465 c!25475) b!136322))

(assert (= (and d!42465 (not c!25475)) b!136327))

(assert (= (and d!42465 res!65407) b!136333))

(assert (= (and b!136333 res!65406) b!136329))

(assert (= (and b!136333 (not res!65408)) b!136324))

(assert (= (and b!136324 res!65409) b!136338))

(assert (= (and b!136333 res!65401) b!136326))

(assert (= (and b!136326 c!25478) b!136332))

(assert (= (and b!136326 (not c!25478)) b!136335))

(assert (= (and b!136332 res!65405) b!136328))

(assert (= (or b!136332 b!136335) bm!15009))

(assert (= (and b!136326 res!65404) b!136319))

(assert (= (and b!136319 c!25476) b!136325))

(assert (= (and b!136319 (not c!25476)) b!136320))

(assert (= (and b!136325 res!65403) b!136336))

(assert (= (or b!136325 b!136320) bm!15003))

(declare-fun b_lambda!6085 () Bool)

(assert (=> (not b_lambda!6085) (not b!136338)))

(assert (=> b!136338 t!6219))

(declare-fun b_and!8443 () Bool)

(assert (= b_and!8439 (and (=> t!6219 result!4047) b_and!8443)))

(assert (=> b!136338 t!6221))

(declare-fun b_and!8445 () Bool)

(assert (= b_and!8441 (and (=> t!6221 result!4049) b_and!8445)))

(declare-fun m!162381 () Bool)

(assert (=> b!136330 m!162381))

(declare-fun m!162383 () Bool)

(assert (=> b!136322 m!162383))

(declare-fun m!162385 () Bool)

(assert (=> b!136322 m!162385))

(declare-fun m!162387 () Bool)

(assert (=> b!136322 m!162387))

(declare-fun m!162389 () Bool)

(assert (=> b!136322 m!162389))

(declare-fun m!162391 () Bool)

(assert (=> b!136322 m!162391))

(assert (=> b!136322 m!162383))

(declare-fun m!162393 () Bool)

(assert (=> b!136322 m!162393))

(declare-fun m!162395 () Bool)

(assert (=> b!136322 m!162395))

(declare-fun m!162397 () Bool)

(assert (=> b!136322 m!162397))

(assert (=> b!136322 m!162389))

(declare-fun m!162399 () Bool)

(assert (=> b!136322 m!162399))

(declare-fun m!162401 () Bool)

(assert (=> b!136322 m!162401))

(declare-fun m!162403 () Bool)

(assert (=> b!136322 m!162403))

(assert (=> b!136322 m!162327))

(declare-fun m!162405 () Bool)

(assert (=> b!136322 m!162405))

(assert (=> b!136322 m!162401))

(declare-fun m!162407 () Bool)

(assert (=> b!136322 m!162407))

(declare-fun m!162409 () Bool)

(assert (=> b!136322 m!162409))

(assert (=> b!136322 m!162395))

(declare-fun m!162411 () Bool)

(assert (=> b!136322 m!162411))

(declare-fun m!162413 () Bool)

(assert (=> b!136322 m!162413))

(assert (=> b!136324 m!162327))

(assert (=> b!136324 m!162327))

(declare-fun m!162415 () Bool)

(assert (=> b!136324 m!162415))

(assert (=> b!136329 m!162327))

(assert (=> b!136329 m!162327))

(assert (=> b!136329 m!162341))

(declare-fun m!162417 () Bool)

(assert (=> b!136328 m!162417))

(declare-fun m!162419 () Bool)

(assert (=> b!136338 m!162419))

(assert (=> b!136338 m!162419))

(assert (=> b!136338 m!162347))

(declare-fun m!162421 () Bool)

(assert (=> b!136338 m!162421))

(assert (=> b!136338 m!162327))

(assert (=> b!136338 m!162347))

(assert (=> b!136338 m!162327))

(declare-fun m!162423 () Bool)

(assert (=> b!136338 m!162423))

(declare-fun m!162425 () Bool)

(assert (=> bm!15009 m!162425))

(declare-fun m!162427 () Bool)

(assert (=> bm!15004 m!162427))

(declare-fun m!162429 () Bool)

(assert (=> bm!15003 m!162429))

(assert (=> d!42465 m!162297))

(assert (=> bm!15007 m!162407))

(declare-fun m!162431 () Bool)

(assert (=> b!136336 m!162431))

(assert (=> b!136334 m!162327))

(assert (=> b!136334 m!162327))

(assert (=> b!136334 m!162341))

(assert (=> bm!14954 d!42465))

(declare-fun d!42467 () Bool)

(declare-fun e!88813 () Bool)

(assert (=> d!42467 e!88813))

(declare-fun res!65410 () Bool)

(assert (=> d!42467 (=> res!65410 e!88813)))

(declare-fun lt!71186 () Bool)

(assert (=> d!42467 (= res!65410 (not lt!71186))))

(declare-fun lt!71184 () Bool)

(assert (=> d!42467 (= lt!71186 lt!71184)))

(declare-fun lt!71187 () Unit!4275)

(declare-fun e!88814 () Unit!4275)

(assert (=> d!42467 (= lt!71187 e!88814)))

(declare-fun c!25480 () Bool)

(assert (=> d!42467 (= c!25480 lt!71184)))

(assert (=> d!42467 (= lt!71184 (containsKey!177 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42467 (= (contains!905 lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000) lt!71186)))

(declare-fun b!136339 () Bool)

(declare-fun lt!71185 () Unit!4275)

(assert (=> b!136339 (= e!88814 lt!71185)))

(assert (=> b!136339 (= lt!71185 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136339 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136340 () Bool)

(declare-fun Unit!4287 () Unit!4275)

(assert (=> b!136340 (= e!88814 Unit!4287)))

(declare-fun b!136341 () Bool)

(assert (=> b!136341 (= e!88813 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42467 c!25480) b!136339))

(assert (= (and d!42467 (not c!25480)) b!136340))

(assert (= (and d!42467 (not res!65410)) b!136341))

(declare-fun m!162433 () Bool)

(assert (=> d!42467 m!162433))

(declare-fun m!162435 () Bool)

(assert (=> b!136339 m!162435))

(declare-fun m!162437 () Bool)

(assert (=> b!136339 m!162437))

(assert (=> b!136339 m!162437))

(declare-fun m!162439 () Bool)

(assert (=> b!136339 m!162439))

(assert (=> b!136341 m!162437))

(assert (=> b!136341 m!162437))

(assert (=> b!136341 m!162439))

(assert (=> bm!14995 d!42467))

(assert (=> bm!14965 d!42437))

(declare-fun d!42469 () Bool)

(declare-fun res!65411 () Bool)

(declare-fun e!88815 () Bool)

(assert (=> d!42469 (=> (not res!65411) (not e!88815))))

(assert (=> d!42469 (= res!65411 (simpleValid!93 (v!3221 (underlying!460 thiss!992))))))

(assert (=> d!42469 (= (valid!533 (v!3221 (underlying!460 thiss!992))) e!88815)))

(declare-fun b!136342 () Bool)

(declare-fun res!65412 () Bool)

(assert (=> b!136342 (=> (not res!65412) (not e!88815))))

(assert (=> b!136342 (= res!65412 (= (arrayCountValidKeys!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))) (_size!604 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136343 () Bool)

(declare-fun res!65413 () Bool)

(assert (=> b!136343 (=> (not res!65413) (not e!88815))))

(assert (=> b!136343 (= res!65413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136344 () Bool)

(assert (=> b!136344 (= e!88815 (arrayNoDuplicates!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!42469 res!65411) b!136342))

(assert (= (and b!136342 res!65412) b!136343))

(assert (= (and b!136343 res!65413) b!136344))

(declare-fun m!162441 () Bool)

(assert (=> d!42469 m!162441))

(declare-fun m!162443 () Bool)

(assert (=> b!136342 m!162443))

(declare-fun m!162445 () Bool)

(assert (=> b!136343 m!162445))

(declare-fun m!162447 () Bool)

(assert (=> b!136344 m!162447))

(assert (=> d!42447 d!42469))

(declare-fun d!42471 () Bool)

(declare-fun e!88818 () Bool)

(assert (=> d!42471 e!88818))

(declare-fun res!65419 () Bool)

(assert (=> d!42471 (=> (not res!65419) (not e!88818))))

(declare-fun lt!71198 () ListLongMap!1715)

(assert (=> d!42471 (= res!65419 (contains!905 lt!71198 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!71197 () List!1723)

(assert (=> d!42471 (= lt!71198 (ListLongMap!1716 lt!71197))))

(declare-fun lt!71196 () Unit!4275)

(declare-fun lt!71199 () Unit!4275)

(assert (=> d!42471 (= lt!71196 lt!71199)))

(assert (=> d!42471 (= (getValueByKey!173 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!178 (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!88 (List!1723 (_ BitVec 64) V!3499) Unit!4275)

(assert (=> d!42471 (= lt!71199 (lemmaContainsTupThenGetReturnValue!88 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!91 (List!1723 (_ BitVec 64) V!3499) List!1723)

(assert (=> d!42471 (= lt!71197 (insertStrictlySorted!91 (toList!873 (ite c!25441 call!14958 call!14970)) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!42471 (= (+!176 (ite c!25441 call!14958 call!14970) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!71198)))

(declare-fun b!136349 () Bool)

(declare-fun res!65418 () Bool)

(assert (=> b!136349 (=> (not res!65418) (not e!88818))))

(assert (=> b!136349 (= res!65418 (= (getValueByKey!173 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!178 (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!136350 () Bool)

(declare-fun contains!907 (List!1723 tuple2!2642) Bool)

(assert (=> b!136350 (= e!88818 (contains!907 (toList!873 lt!71198) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!42471 res!65419) b!136349))

(assert (= (and b!136349 res!65418) b!136350))

(declare-fun m!162449 () Bool)

(assert (=> d!42471 m!162449))

(declare-fun m!162451 () Bool)

(assert (=> d!42471 m!162451))

(declare-fun m!162453 () Bool)

(assert (=> d!42471 m!162453))

(declare-fun m!162455 () Bool)

(assert (=> d!42471 m!162455))

(declare-fun m!162457 () Bool)

(assert (=> b!136349 m!162457))

(declare-fun m!162459 () Bool)

(assert (=> b!136350 m!162459))

(assert (=> bm!14955 d!42471))

(declare-fun d!42473 () Bool)

(assert (=> d!42473 (isDefined!126 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun lt!71202 () Unit!4275)

(declare-fun choose!833 (List!1723 (_ BitVec 64)) Unit!4275)

(assert (=> d!42473 (= lt!71202 (choose!833 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!88821 () Bool)

(assert (=> d!42473 e!88821))

(declare-fun res!65422 () Bool)

(assert (=> d!42473 (=> (not res!65422) (not e!88821))))

(declare-fun isStrictlySorted!323 (List!1723) Bool)

(assert (=> d!42473 (= res!65422 (isStrictlySorted!323 (toList!873 lt!70951)))))

(assert (=> d!42473 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71202)))

(declare-fun b!136353 () Bool)

(assert (=> b!136353 (= e!88821 (containsKey!177 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42473 res!65422) b!136353))

(assert (=> d!42473 m!162081))

(assert (=> d!42473 m!162155))

(assert (=> d!42473 m!162155))

(assert (=> d!42473 m!162157))

(assert (=> d!42473 m!162081))

(declare-fun m!162461 () Bool)

(assert (=> d!42473 m!162461))

(declare-fun m!162463 () Bool)

(assert (=> d!42473 m!162463))

(assert (=> b!136353 m!162081))

(assert (=> b!136353 m!162151))

(assert (=> b!136068 d!42473))

(declare-fun d!42475 () Bool)

(declare-fun isEmpty!412 (Option!179) Bool)

(assert (=> d!42475 (= (isDefined!126 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) (not (isEmpty!412 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun bs!5708 () Bool)

(assert (= bs!5708 d!42475))

(assert (=> bs!5708 m!162155))

(declare-fun m!162465 () Bool)

(assert (=> bs!5708 m!162465))

(assert (=> b!136068 d!42475))

(declare-fun b!136362 () Bool)

(declare-fun e!88826 () Option!179)

(assert (=> b!136362 (= e!88826 (Some!178 (_2!1332 (h!2325 (toList!873 lt!70951)))))))

(declare-fun d!42477 () Bool)

(declare-fun c!25485 () Bool)

(assert (=> d!42477 (= c!25485 (and ((_ is Cons!1719) (toList!873 lt!70951)) (= (_1!1332 (h!2325 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42477 (= (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!88826)))

(declare-fun b!136363 () Bool)

(declare-fun e!88827 () Option!179)

(assert (=> b!136363 (= e!88826 e!88827)))

(declare-fun c!25486 () Bool)

(assert (=> b!136363 (= c!25486 (and ((_ is Cons!1719) (toList!873 lt!70951)) (not (= (_1!1332 (h!2325 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun b!136364 () Bool)

(assert (=> b!136364 (= e!88827 (getValueByKey!173 (t!6211 (toList!873 lt!70951)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136365 () Bool)

(assert (=> b!136365 (= e!88827 None!177)))

(assert (= (and d!42477 c!25485) b!136362))

(assert (= (and d!42477 (not c!25485)) b!136363))

(assert (= (and b!136363 c!25486) b!136364))

(assert (= (and b!136363 (not c!25486)) b!136365))

(assert (=> b!136364 m!162081))

(declare-fun m!162467 () Bool)

(assert (=> b!136364 m!162467))

(assert (=> b!136068 d!42477))

(declare-fun d!42479 () Bool)

(declare-fun get!1497 (Option!179) V!3499)

(assert (=> d!42479 (= (apply!117 lt!71115 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5709 () Bool)

(assert (= bs!5709 d!42479))

(assert (=> bs!5709 m!162377))

(assert (=> bs!5709 m!162377))

(declare-fun m!162469 () Bool)

(assert (=> bs!5709 m!162469))

(assert (=> b!136251 d!42479))

(declare-fun d!42481 () Bool)

(declare-fun e!88849 () Bool)

(assert (=> d!42481 e!88849))

(declare-fun res!65447 () Bool)

(assert (=> d!42481 (=> (not res!65447) (not e!88849))))

(declare-fun lt!71291 () tuple2!2644)

(assert (=> d!42481 (= res!65447 (_1!1333 lt!71291))))

(assert (=> d!42481 (= lt!71291 (tuple2!2645 true (LongMapFixedSize!1111 (defaultEntry!2889 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (bvadd (_size!604 newMap!16) #b00000000000000000000000000000001) (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (_vacant!604 newMap!16))))))

(declare-fun lt!71274 () Unit!4275)

(declare-fun lt!71265 () Unit!4275)

(assert (=> d!42481 (= lt!71274 lt!71265)))

(declare-fun lt!71282 () array!4809)

(declare-fun lt!71268 () array!4807)

(assert (=> d!42481 (contains!905 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(assert (=> d!42481 (= lt!71265 (lemmaValidKeyInArrayIsInListMap!123 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42481 (= lt!71282 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))))))

(assert (=> d!42481 (= lt!71268 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun lt!71289 () Unit!4275)

(declare-fun lt!71277 () Unit!4275)

(assert (=> d!42481 (= lt!71289 lt!71277)))

(declare-fun lt!71283 () array!4807)

(assert (=> d!42481 (= (arrayCountValidKeys!0 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4807 (_ BitVec 32)) Unit!4275)

(assert (=> d!42481 (= lt!71277 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(assert (=> d!42481 (= lt!71283 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun lt!71275 () Unit!4275)

(declare-fun lt!71272 () Unit!4275)

(assert (=> d!42481 (= lt!71275 lt!71272)))

(declare-fun lt!71271 () array!4807)

(assert (=> d!42481 (arrayContainsKey!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4807 (_ BitVec 64) (_ BitVec 32)) Unit!4275)

(assert (=> d!42481 (= lt!71272 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(assert (=> d!42481 (= lt!71271 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun lt!71281 () Unit!4275)

(declare-fun lt!71288 () Unit!4275)

(assert (=> d!42481 (= lt!71281 lt!71288)))

(assert (=> d!42481 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!43 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) (_ BitVec 64) V!3499 Int) Unit!4275)

(assert (=> d!42481 (= lt!71288 (lemmaAddValidKeyToArrayThenAddPairToListMap!43 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71267 () Unit!4275)

(declare-fun lt!71269 () Unit!4275)

(assert (=> d!42481 (= lt!71267 lt!71269)))

(assert (=> d!42481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (mask!7203 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4807 (_ BitVec 32) (_ BitVec 32)) Unit!4275)

(assert (=> d!42481 (= lt!71269 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (mask!7203 newMap!16)))))

(declare-fun lt!71280 () Unit!4275)

(declare-fun lt!71279 () Unit!4275)

(assert (=> d!42481 (= lt!71280 lt!71279)))

(assert (=> d!42481 (= (arrayCountValidKeys!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4807 (_ BitVec 32) (_ BitVec 64)) Unit!4275)

(assert (=> d!42481 (= lt!71279 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun lt!71285 () Unit!4275)

(declare-fun lt!71263 () Unit!4275)

(assert (=> d!42481 (= lt!71285 lt!71263)))

(declare-fun lt!71264 () List!1725)

(declare-fun lt!71286 () (_ BitVec 32))

(assert (=> d!42481 (arrayNoDuplicates!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) lt!71286 lt!71264)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4807 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1725) Unit!4275)

(assert (=> d!42481 (= lt!71263 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) lt!71286 lt!71264))))

(assert (=> d!42481 (= lt!71264 Nil!1722)))

(assert (=> d!42481 (= lt!71286 #b00000000000000000000000000000000)))

(declare-fun lt!71273 () Unit!4275)

(declare-fun e!88847 () Unit!4275)

(assert (=> d!42481 (= lt!71273 e!88847)))

(declare-fun c!25498 () Bool)

(assert (=> d!42481 (= c!25498 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!71270 () Unit!4275)

(declare-fun e!88846 () Unit!4275)

(assert (=> d!42481 (= lt!71270 e!88846)))

(declare-fun c!25496 () Bool)

(assert (=> d!42481 (= c!25496 (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42481 (valid!533 newMap!16)))

(assert (=> d!42481 (= (updateHelperNewKey!62 newMap!16 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))) lt!71291)))

(declare-fun b!136400 () Bool)

(declare-fun lt!71287 () Unit!4275)

(assert (=> b!136400 (= e!88846 lt!71287)))

(assert (=> b!136400 (= lt!71287 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71290 () SeekEntryResult!276)

(declare-fun call!15022 () SeekEntryResult!276)

(assert (=> b!136400 (= lt!71290 call!15022)))

(declare-fun c!25495 () Bool)

(assert (=> b!136400 (= c!25495 ((_ is MissingZero!276) lt!71290))))

(declare-fun e!88844 () Bool)

(assert (=> b!136400 e!88844))

(declare-fun bm!15018 () Bool)

(declare-fun call!15021 () Bool)

(declare-fun call!15024 () Bool)

(assert (=> bm!15018 (= call!15021 call!15024)))

(declare-fun b!136401 () Bool)

(declare-fun Unit!4288 () Unit!4275)

(assert (=> b!136401 (= e!88847 Unit!4288)))

(declare-fun lt!71276 () Unit!4275)

(declare-fun lemmaArrayContainsKeyThenInListMap!43 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) (_ BitVec 32) Int) Unit!4275)

(assert (=> b!136401 (= lt!71276 (lemmaArrayContainsKeyThenInListMap!43 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(assert (=> b!136401 (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))

(declare-fun lt!71292 () Unit!4275)

(assert (=> b!136401 (= lt!71292 lt!71276)))

(assert (=> b!136401 false))

(declare-fun b!136402 () Bool)

(declare-fun e!88850 () Bool)

(declare-fun e!88845 () Bool)

(assert (=> b!136402 (= e!88850 e!88845)))

(declare-fun res!65448 () Bool)

(assert (=> b!136402 (= res!65448 call!15021)))

(assert (=> b!136402 (=> (not res!65448) (not e!88845))))

(declare-fun b!136403 () Bool)

(declare-fun e!88851 () Bool)

(declare-fun lt!71278 () SeekEntryResult!276)

(assert (=> b!136403 (= e!88851 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71278)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136404 () Bool)

(declare-fun res!65443 () Bool)

(declare-fun e!88848 () Bool)

(assert (=> b!136404 (=> (not res!65443) (not e!88848))))

(assert (=> b!136404 (= res!65443 call!15021)))

(assert (=> b!136404 (= e!88844 e!88848)))

(declare-fun b!136405 () Bool)

(declare-fun res!65444 () Bool)

(assert (=> b!136405 (=> (not res!65444) (not e!88849))))

(assert (=> b!136405 (= res!65444 (valid!533 (_2!1333 lt!71291)))))

(declare-fun bm!15019 () Bool)

(declare-fun call!15023 () Bool)

(assert (=> bm!15019 (= call!15023 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!136406 () Bool)

(declare-fun Unit!4289 () Unit!4275)

(assert (=> b!136406 (= e!88846 Unit!4289)))

(declare-fun lt!71266 () Unit!4275)

(assert (=> b!136406 (= lt!71266 (lemmaInListMapThenSeekEntryOrOpenFindsIt!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(assert (=> b!136406 (= lt!71278 call!15022)))

(declare-fun res!65446 () Bool)

(assert (=> b!136406 (= res!65446 ((_ is Found!276) lt!71278))))

(assert (=> b!136406 (=> (not res!65446) (not e!88851))))

(assert (=> b!136406 e!88851))

(declare-fun lt!71284 () Unit!4275)

(assert (=> b!136406 (= lt!71284 lt!71266)))

(assert (=> b!136406 false))

(declare-fun b!136407 () Bool)

(assert (=> b!136407 (= e!88845 (not call!15023))))

(declare-fun b!136408 () Bool)

(assert (=> b!136408 (= e!88850 ((_ is Undefined!276) lt!71290))))

(declare-fun b!136409 () Bool)

(declare-fun c!25497 () Bool)

(assert (=> b!136409 (= c!25497 ((_ is MissingVacant!276) lt!71290))))

(assert (=> b!136409 (= e!88844 e!88850)))

(declare-fun b!136410 () Bool)

(declare-fun Unit!4290 () Unit!4275)

(assert (=> b!136410 (= e!88847 Unit!4290)))

(declare-fun bm!15020 () Bool)

(assert (=> bm!15020 (= call!15022 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun bm!15021 () Bool)

(assert (=> bm!15021 (= call!15024 (inRange!0 (ite c!25496 (index!3266 lt!71278) (ite c!25495 (index!3265 lt!71290) (index!3268 lt!71290))) (mask!7203 newMap!16)))))

(declare-fun b!136411 () Bool)

(assert (=> b!136411 (= e!88849 (= (map!1416 (_2!1333 lt!71291)) (+!176 (map!1416 newMap!16) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!136412 () Bool)

(declare-fun res!65449 () Bool)

(assert (=> b!136412 (= res!65449 call!15024)))

(assert (=> b!136412 (=> (not res!65449) (not e!88851))))

(declare-fun b!136413 () Bool)

(assert (=> b!136413 (= e!88848 (not call!15023))))

(declare-fun b!136414 () Bool)

(declare-fun res!65441 () Bool)

(assert (=> b!136414 (=> (not res!65441) (not e!88849))))

(assert (=> b!136414 (= res!65441 (contains!905 (map!1416 (_2!1333 lt!71291)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136415 () Bool)

(declare-fun res!65442 () Bool)

(assert (=> b!136415 (= res!65442 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71290)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136415 (=> (not res!65442) (not e!88845))))

(declare-fun b!136416 () Bool)

(declare-fun res!65445 () Bool)

(assert (=> b!136416 (=> (not res!65445) (not e!88848))))

(assert (=> b!136416 (= res!65445 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71290)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!42481 c!25496) b!136406))

(assert (= (and d!42481 (not c!25496)) b!136400))

(assert (= (and b!136406 res!65446) b!136412))

(assert (= (and b!136412 res!65449) b!136403))

(assert (= (and b!136400 c!25495) b!136404))

(assert (= (and b!136400 (not c!25495)) b!136409))

(assert (= (and b!136404 res!65443) b!136416))

(assert (= (and b!136416 res!65445) b!136413))

(assert (= (and b!136409 c!25497) b!136402))

(assert (= (and b!136409 (not c!25497)) b!136408))

(assert (= (and b!136402 res!65448) b!136415))

(assert (= (and b!136415 res!65442) b!136407))

(assert (= (or b!136404 b!136402) bm!15018))

(assert (= (or b!136413 b!136407) bm!15019))

(assert (= (or b!136412 bm!15018) bm!15021))

(assert (= (or b!136406 b!136400) bm!15020))

(assert (= (and d!42481 c!25498) b!136401))

(assert (= (and d!42481 (not c!25498)) b!136410))

(assert (= (and d!42481 res!65447) b!136405))

(assert (= (and b!136405 res!65444) b!136414))

(assert (= (and b!136414 res!65441) b!136411))

(assert (=> bm!15019 m!162081))

(assert (=> bm!15019 m!162175))

(declare-fun m!162471 () Bool)

(assert (=> b!136403 m!162471))

(assert (=> b!136406 m!162081))

(assert (=> b!136406 m!162159))

(declare-fun m!162473 () Bool)

(assert (=> b!136411 m!162473))

(assert (=> b!136411 m!162089))

(assert (=> b!136411 m!162089))

(declare-fun m!162475 () Bool)

(assert (=> b!136411 m!162475))

(assert (=> bm!15020 m!162081))

(assert (=> bm!15020 m!162161))

(declare-fun m!162477 () Bool)

(assert (=> bm!15021 m!162477))

(declare-fun m!162479 () Bool)

(assert (=> b!136416 m!162479))

(assert (=> b!136401 m!162081))

(declare-fun m!162481 () Bool)

(assert (=> b!136401 m!162481))

(assert (=> b!136401 m!162189))

(assert (=> b!136401 m!162189))

(assert (=> b!136401 m!162081))

(declare-fun m!162483 () Bool)

(assert (=> b!136401 m!162483))

(declare-fun m!162485 () Bool)

(assert (=> b!136415 m!162485))

(assert (=> b!136414 m!162473))

(assert (=> b!136414 m!162473))

(assert (=> b!136414 m!162081))

(declare-fun m!162487 () Bool)

(assert (=> b!136414 m!162487))

(assert (=> b!136400 m!162081))

(assert (=> b!136400 m!162193))

(assert (=> d!42481 m!162081))

(declare-fun m!162489 () Bool)

(assert (=> d!42481 m!162489))

(assert (=> d!42481 m!162081))

(declare-fun m!162491 () Bool)

(assert (=> d!42481 m!162491))

(declare-fun m!162493 () Bool)

(assert (=> d!42481 m!162493))

(assert (=> d!42481 m!162279))

(assert (=> d!42481 m!162087))

(declare-fun m!162495 () Bool)

(assert (=> d!42481 m!162495))

(declare-fun m!162497 () Bool)

(assert (=> d!42481 m!162497))

(assert (=> d!42481 m!162081))

(declare-fun m!162499 () Bool)

(assert (=> d!42481 m!162499))

(declare-fun m!162501 () Bool)

(assert (=> d!42481 m!162501))

(declare-fun m!162503 () Bool)

(assert (=> d!42481 m!162503))

(declare-fun m!162505 () Bool)

(assert (=> d!42481 m!162505))

(assert (=> d!42481 m!162081))

(declare-fun m!162507 () Bool)

(assert (=> d!42481 m!162507))

(declare-fun m!162509 () Bool)

(assert (=> d!42481 m!162509))

(assert (=> d!42481 m!162189))

(assert (=> d!42481 m!162081))

(assert (=> d!42481 m!162175))

(assert (=> d!42481 m!162189))

(assert (=> d!42481 m!162363))

(declare-fun m!162511 () Bool)

(assert (=> d!42481 m!162511))

(assert (=> d!42481 m!162503))

(declare-fun m!162513 () Bool)

(assert (=> d!42481 m!162513))

(assert (=> d!42481 m!162189))

(assert (=> d!42481 m!162081))

(assert (=> d!42481 m!162483))

(assert (=> d!42481 m!162081))

(assert (=> d!42481 m!162103))

(declare-fun m!162515 () Bool)

(assert (=> d!42481 m!162515))

(assert (=> d!42481 m!162511))

(declare-fun m!162517 () Bool)

(assert (=> d!42481 m!162517))

(declare-fun m!162519 () Bool)

(assert (=> d!42481 m!162519))

(declare-fun m!162521 () Bool)

(assert (=> d!42481 m!162521))

(assert (=> d!42481 m!162081))

(declare-fun m!162523 () Bool)

(assert (=> d!42481 m!162523))

(declare-fun m!162525 () Bool)

(assert (=> b!136405 m!162525))

(assert (=> bm!14973 d!42481))

(declare-fun b!136429 () Bool)

(declare-fun c!25506 () Bool)

(declare-fun lt!71299 () (_ BitVec 64))

(assert (=> b!136429 (= c!25506 (= lt!71299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!88858 () SeekEntryResult!276)

(declare-fun e!88859 () SeekEntryResult!276)

(assert (=> b!136429 (= e!88858 e!88859)))

(declare-fun b!136430 () Bool)

(declare-fun lt!71300 () SeekEntryResult!276)

(assert (=> b!136430 (= e!88858 (Found!276 (index!3267 lt!71300)))))

(declare-fun b!136431 () Bool)

(assert (=> b!136431 (= e!88859 (MissingZero!276 (index!3267 lt!71300)))))

(declare-fun b!136432 () Bool)

(declare-fun e!88860 () SeekEntryResult!276)

(assert (=> b!136432 (= e!88860 e!88858)))

(assert (=> b!136432 (= lt!71299 (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71300)))))

(declare-fun c!25505 () Bool)

(assert (=> b!136432 (= c!25505 (= lt!71299 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun lt!71301 () SeekEntryResult!276)

(declare-fun d!42483 () Bool)

(assert (=> d!42483 (and (or ((_ is Undefined!276) lt!71301) (not ((_ is Found!276) lt!71301)) (and (bvsge (index!3266 lt!71301) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71301) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71301) ((_ is Found!276) lt!71301) (not ((_ is MissingZero!276) lt!71301)) (and (bvsge (index!3265 lt!71301) #b00000000000000000000000000000000) (bvslt (index!3265 lt!71301) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71301) ((_ is Found!276) lt!71301) ((_ is MissingZero!276) lt!71301) (not ((_ is MissingVacant!276) lt!71301)) (and (bvsge (index!3268 lt!71301) #b00000000000000000000000000000000) (bvslt (index!3268 lt!71301) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71301) (ite ((_ is Found!276) lt!71301) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71301)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite ((_ is MissingZero!276) lt!71301) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71301)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!276) lt!71301) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71301)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42483 (= lt!71301 e!88860)))

(declare-fun c!25507 () Bool)

(assert (=> d!42483 (= c!25507 (and ((_ is Intermediate!276) lt!71300) (undefined!1088 lt!71300)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4807 (_ BitVec 32)) SeekEntryResult!276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!42483 (= lt!71300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (=> d!42483 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42483 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)) lt!71301)))

(declare-fun b!136433 () Bool)

(assert (=> b!136433 (= e!88860 Undefined!276)))

(declare-fun b!136434 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4807 (_ BitVec 32)) SeekEntryResult!276)

(assert (=> b!136434 (= e!88859 (seekKeyOrZeroReturnVacant!0 (x!15804 lt!71300) (index!3267 lt!71300) (index!3267 lt!71300) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (= (and d!42483 c!25507) b!136433))

(assert (= (and d!42483 (not c!25507)) b!136432))

(assert (= (and b!136432 c!25505) b!136430))

(assert (= (and b!136432 (not c!25505)) b!136429))

(assert (= (and b!136429 c!25506) b!136431))

(assert (= (and b!136429 (not c!25506)) b!136434))

(declare-fun m!162527 () Bool)

(assert (=> b!136432 m!162527))

(assert (=> d!42483 m!162081))

(declare-fun m!162529 () Bool)

(assert (=> d!42483 m!162529))

(declare-fun m!162531 () Bool)

(assert (=> d!42483 m!162531))

(declare-fun m!162533 () Bool)

(assert (=> d!42483 m!162533))

(assert (=> d!42483 m!162529))

(assert (=> d!42483 m!162081))

(declare-fun m!162535 () Bool)

(assert (=> d!42483 m!162535))

(assert (=> d!42483 m!162297))

(declare-fun m!162537 () Bool)

(assert (=> d!42483 m!162537))

(assert (=> b!136434 m!162081))

(declare-fun m!162539 () Bool)

(assert (=> b!136434 m!162539))

(assert (=> bm!14966 d!42483))

(declare-fun d!42485 () Bool)

(declare-fun e!88861 () Bool)

(assert (=> d!42485 e!88861))

(declare-fun res!65451 () Bool)

(assert (=> d!42485 (=> (not res!65451) (not e!88861))))

(declare-fun lt!71304 () ListLongMap!1715)

(assert (=> d!42485 (= res!65451 (contains!905 lt!71304 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun lt!71303 () List!1723)

(assert (=> d!42485 (= lt!71304 (ListLongMap!1716 lt!71303))))

(declare-fun lt!71302 () Unit!4275)

(declare-fun lt!71305 () Unit!4275)

(assert (=> d!42485 (= lt!71302 lt!71305)))

(assert (=> d!42485 (= (getValueByKey!173 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (Some!178 (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42485 (= lt!71305 (lemmaContainsTupThenGetReturnValue!88 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42485 (= lt!71303 (insertStrictlySorted!91 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42485 (= (+!176 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71304)))

(declare-fun b!136435 () Bool)

(declare-fun res!65450 () Bool)

(assert (=> b!136435 (=> (not res!65450) (not e!88861))))

(assert (=> b!136435 (= res!65450 (= (getValueByKey!173 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (Some!178 (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!136436 () Bool)

(assert (=> b!136436 (= e!88861 (contains!907 (toList!873 lt!71304) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (= (and d!42485 res!65451) b!136435))

(assert (= (and b!136435 res!65450) b!136436))

(declare-fun m!162541 () Bool)

(assert (=> d!42485 m!162541))

(declare-fun m!162543 () Bool)

(assert (=> d!42485 m!162543))

(declare-fun m!162545 () Bool)

(assert (=> d!42485 m!162545))

(declare-fun m!162547 () Bool)

(assert (=> d!42485 m!162547))

(declare-fun m!162549 () Bool)

(assert (=> b!136435 m!162549))

(declare-fun m!162551 () Bool)

(assert (=> b!136436 m!162551))

(assert (=> bm!14990 d!42485))

(assert (=> b!136070 d!42475))

(assert (=> b!136070 d!42477))

(declare-fun d!42487 () Bool)

(assert (=> d!42487 (= (apply!117 lt!71115 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1497 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5710 () Bool)

(assert (= bs!5710 d!42487))

(assert (=> bs!5710 m!162243))

(declare-fun m!162553 () Bool)

(assert (=> bs!5710 m!162553))

(assert (=> bs!5710 m!162553))

(declare-fun m!162555 () Bool)

(assert (=> bs!5710 m!162555))

(assert (=> b!136253 d!42487))

(declare-fun d!42489 () Bool)

(declare-fun c!25508 () Bool)

(assert (=> d!42489 (= c!25508 ((_ is ValueCellFull!1101) (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!88862 () V!3499)

(assert (=> d!42489 (= (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!88862)))

(declare-fun b!136437 () Bool)

(assert (=> b!136437 (= e!88862 (get!1495 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136438 () Bool)

(assert (=> b!136438 (= e!88862 (get!1496 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42489 c!25508) b!136437))

(assert (= (and d!42489 (not c!25508)) b!136438))

(assert (=> b!136437 m!162261))

(assert (=> b!136437 m!162101))

(declare-fun m!162557 () Bool)

(assert (=> b!136437 m!162557))

(assert (=> b!136438 m!162261))

(assert (=> b!136438 m!162101))

(declare-fun m!162559 () Bool)

(assert (=> b!136438 m!162559))

(assert (=> b!136253 d!42489))

(declare-fun d!42491 () Bool)

(assert (=> d!42491 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71308 () Unit!4275)

(declare-fun choose!834 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 V!3499 Int) Unit!4275)

(assert (=> d!42491 (= lt!71308 (choose!834 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42491 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42491 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)) lt!71308)))

(declare-fun bs!5711 () Bool)

(assert (= bs!5711 d!42491))

(assert (=> bs!5711 m!162103))

(declare-fun m!162561 () Bool)

(assert (=> bs!5711 m!162561))

(assert (=> bs!5711 m!162189))

(assert (=> bs!5711 m!162189))

(declare-fun m!162563 () Bool)

(assert (=> bs!5711 m!162563))

(assert (=> bs!5711 m!162297))

(assert (=> bs!5711 m!162103))

(declare-fun m!162565 () Bool)

(assert (=> bs!5711 m!162565))

(assert (=> b!136169 d!42491))

(declare-fun d!42493 () Bool)

(assert (=> d!42493 (= (inRange!0 (ite c!25435 (ite c!25433 (index!3266 lt!71034) (ite c!25434 (index!3265 lt!71043) (index!3268 lt!71043))) (ite c!25431 (index!3266 lt!71051) (ite c!25437 (index!3265 lt!71046) (index!3268 lt!71046)))) (mask!7203 newMap!16)) (and (bvsge (ite c!25435 (ite c!25433 (index!3266 lt!71034) (ite c!25434 (index!3265 lt!71043) (index!3268 lt!71043))) (ite c!25431 (index!3266 lt!71051) (ite c!25437 (index!3265 lt!71046) (index!3268 lt!71046)))) #b00000000000000000000000000000000) (bvslt (ite c!25435 (ite c!25433 (index!3266 lt!71034) (ite c!25434 (index!3265 lt!71043) (index!3268 lt!71043))) (ite c!25431 (index!3266 lt!71051) (ite c!25437 (index!3265 lt!71046) (index!3268 lt!71046)))) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14957 d!42493))

(declare-fun d!42495 () Bool)

(assert (=> d!42495 (= (map!1416 (_2!1333 lt!71054)) (getCurrentListMap!549 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun bs!5712 () Bool)

(assert (= bs!5712 d!42495))

(declare-fun m!162567 () Bool)

(assert (=> bs!5712 m!162567))

(assert (=> bm!14974 d!42495))

(declare-fun d!42497 () Bool)

(declare-fun e!88863 () Bool)

(assert (=> d!42497 e!88863))

(declare-fun res!65452 () Bool)

(assert (=> d!42497 (=> res!65452 e!88863)))

(declare-fun lt!71311 () Bool)

(assert (=> d!42497 (= res!65452 (not lt!71311))))

(declare-fun lt!71309 () Bool)

(assert (=> d!42497 (= lt!71311 lt!71309)))

(declare-fun lt!71312 () Unit!4275)

(declare-fun e!88864 () Unit!4275)

(assert (=> d!42497 (= lt!71312 e!88864)))

(declare-fun c!25509 () Bool)

(assert (=> d!42497 (= c!25509 lt!71309)))

(assert (=> d!42497 (= lt!71309 (containsKey!177 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(assert (=> d!42497 (= (contains!905 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71114) lt!71311)))

(declare-fun b!136439 () Bool)

(declare-fun lt!71310 () Unit!4275)

(assert (=> b!136439 (= e!88864 lt!71310)))

(assert (=> b!136439 (= lt!71310 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(assert (=> b!136439 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(declare-fun b!136440 () Bool)

(declare-fun Unit!4291 () Unit!4275)

(assert (=> b!136440 (= e!88864 Unit!4291)))

(declare-fun b!136441 () Bool)

(assert (=> b!136441 (= e!88863 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114)))))

(assert (= (and d!42497 c!25509) b!136439))

(assert (= (and d!42497 (not c!25509)) b!136440))

(assert (= (and d!42497 (not res!65452)) b!136441))

(declare-fun m!162569 () Bool)

(assert (=> d!42497 m!162569))

(declare-fun m!162571 () Bool)

(assert (=> b!136439 m!162571))

(declare-fun m!162573 () Bool)

(assert (=> b!136439 m!162573))

(assert (=> b!136439 m!162573))

(declare-fun m!162575 () Bool)

(assert (=> b!136439 m!162575))

(assert (=> b!136441 m!162573))

(assert (=> b!136441 m!162573))

(assert (=> b!136441 m!162575))

(assert (=> b!136237 d!42497))

(declare-fun d!42499 () Bool)

(declare-fun e!88865 () Bool)

(assert (=> d!42499 e!88865))

(declare-fun res!65454 () Bool)

(assert (=> d!42499 (=> (not res!65454) (not e!88865))))

(declare-fun lt!71315 () ListLongMap!1715)

(assert (=> d!42499 (= res!65454 (contains!905 lt!71315 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71314 () List!1723)

(assert (=> d!42499 (= lt!71315 (ListLongMap!1716 lt!71314))))

(declare-fun lt!71313 () Unit!4275)

(declare-fun lt!71316 () Unit!4275)

(assert (=> d!42499 (= lt!71313 lt!71316)))

(assert (=> d!42499 (= (getValueByKey!173 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42499 (= lt!71316 (lemmaContainsTupThenGetReturnValue!88 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42499 (= lt!71314 (insertStrictlySorted!91 (toList!873 lt!71121) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42499 (= (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71315)))

(declare-fun b!136442 () Bool)

(declare-fun res!65453 () Bool)

(assert (=> b!136442 (=> (not res!65453) (not e!88865))))

(assert (=> b!136442 (= res!65453 (= (getValueByKey!173 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136443 () Bool)

(assert (=> b!136443 (= e!88865 (contains!907 (toList!873 lt!71315) (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42499 res!65454) b!136442))

(assert (= (and b!136442 res!65453) b!136443))

(declare-fun m!162577 () Bool)

(assert (=> d!42499 m!162577))

(declare-fun m!162579 () Bool)

(assert (=> d!42499 m!162579))

(declare-fun m!162581 () Bool)

(assert (=> d!42499 m!162581))

(declare-fun m!162583 () Bool)

(assert (=> d!42499 m!162583))

(declare-fun m!162585 () Bool)

(assert (=> b!136442 m!162585))

(declare-fun m!162587 () Bool)

(assert (=> b!136443 m!162587))

(assert (=> b!136237 d!42499))

(declare-fun b!136468 () Bool)

(declare-fun e!88885 () Bool)

(assert (=> b!136468 (= e!88885 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136468 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!136469 () Bool)

(declare-fun res!65466 () Bool)

(declare-fun e!88880 () Bool)

(assert (=> b!136469 (=> (not res!65466) (not e!88880))))

(declare-fun lt!71331 () ListLongMap!1715)

(assert (=> b!136469 (= res!65466 (not (contains!905 lt!71331 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136470 () Bool)

(declare-fun e!88884 () ListLongMap!1715)

(declare-fun e!88883 () ListLongMap!1715)

(assert (=> b!136470 (= e!88884 e!88883)))

(declare-fun c!25520 () Bool)

(assert (=> b!136470 (= c!25520 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!136471 () Bool)

(declare-fun e!88881 () Bool)

(assert (=> b!136471 (= e!88881 (= lt!71331 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136472 () Bool)

(declare-fun e!88886 () Bool)

(assert (=> b!136472 (= e!88880 e!88886)))

(declare-fun c!25518 () Bool)

(assert (=> b!136472 (= c!25518 e!88885)))

(declare-fun res!65464 () Bool)

(assert (=> b!136472 (=> (not res!65464) (not e!88885))))

(assert (=> b!136472 (= res!65464 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun d!42501 () Bool)

(assert (=> d!42501 e!88880))

(declare-fun res!65463 () Bool)

(assert (=> d!42501 (=> (not res!65463) (not e!88880))))

(assert (=> d!42501 (= res!65463 (not (contains!905 lt!71331 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42501 (= lt!71331 e!88884)))

(declare-fun c!25519 () Bool)

(assert (=> d!42501 (= c!25519 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42501 (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992))))))

(assert (=> d!42501 (= (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) lt!71331)))

(declare-fun b!136473 () Bool)

(declare-fun lt!71332 () Unit!4275)

(declare-fun lt!71335 () Unit!4275)

(assert (=> b!136473 (= lt!71332 lt!71335)))

(declare-fun lt!71334 () ListLongMap!1715)

(declare-fun lt!71333 () (_ BitVec 64))

(declare-fun lt!71337 () (_ BitVec 64))

(declare-fun lt!71336 () V!3499)

(assert (=> b!136473 (not (contains!905 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336)) lt!71333))))

(declare-fun addStillNotContains!62 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> b!136473 (= lt!71335 (addStillNotContains!62 lt!71334 lt!71337 lt!71336 lt!71333))))

(assert (=> b!136473 (= lt!71333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!136473 (= lt!71336 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136473 (= lt!71337 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!15027 () ListLongMap!1715)

(assert (=> b!136473 (= lt!71334 call!15027)))

(assert (=> b!136473 (= e!88883 (+!176 call!15027 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!136474 () Bool)

(declare-fun e!88882 () Bool)

(assert (=> b!136474 (= e!88886 e!88882)))

(assert (=> b!136474 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun res!65465 () Bool)

(assert (=> b!136474 (= res!65465 (contains!905 lt!71331 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136474 (=> (not res!65465) (not e!88882))))

(declare-fun b!136475 () Bool)

(declare-fun isEmpty!413 (ListLongMap!1715) Bool)

(assert (=> b!136475 (= e!88881 (isEmpty!413 lt!71331))))

(declare-fun bm!15024 () Bool)

(assert (=> bm!15024 (= call!15027 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136476 () Bool)

(assert (=> b!136476 (= e!88884 (ListLongMap!1716 Nil!1720))))

(declare-fun b!136477 () Bool)

(assert (=> b!136477 (= e!88886 e!88881)))

(declare-fun c!25521 () Bool)

(assert (=> b!136477 (= c!25521 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136478 () Bool)

(assert (=> b!136478 (= e!88883 call!15027)))

(declare-fun b!136479 () Bool)

(assert (=> b!136479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> b!136479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> b!136479 (= e!88882 (= (apply!117 lt!71331 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!42501 c!25519) b!136476))

(assert (= (and d!42501 (not c!25519)) b!136470))

(assert (= (and b!136470 c!25520) b!136473))

(assert (= (and b!136470 (not c!25520)) b!136478))

(assert (= (or b!136473 b!136478) bm!15024))

(assert (= (and d!42501 res!65463) b!136469))

(assert (= (and b!136469 res!65466) b!136472))

(assert (= (and b!136472 res!65464) b!136468))

(assert (= (and b!136472 c!25518) b!136474))

(assert (= (and b!136472 (not c!25518)) b!136477))

(assert (= (and b!136474 res!65465) b!136479))

(assert (= (and b!136477 c!25521) b!136471))

(assert (= (and b!136477 (not c!25521)) b!136475))

(declare-fun b_lambda!6087 () Bool)

(assert (=> (not b_lambda!6087) (not b!136473)))

(assert (=> b!136473 t!6208))

(declare-fun b_and!8447 () Bool)

(assert (= b_and!8443 (and (=> t!6208 result!4033) b_and!8447)))

(assert (=> b!136473 t!6210))

(declare-fun b_and!8449 () Bool)

(assert (= b_and!8445 (and (=> t!6210 result!4037) b_and!8449)))

(declare-fun b_lambda!6089 () Bool)

(assert (=> (not b_lambda!6089) (not b!136479)))

(assert (=> b!136479 t!6208))

(declare-fun b_and!8451 () Bool)

(assert (= b_and!8447 (and (=> t!6208 result!4033) b_and!8451)))

(assert (=> b!136479 t!6210))

(declare-fun b_and!8453 () Bool)

(assert (= b_and!8449 (and (=> t!6210 result!4037) b_and!8453)))

(assert (=> b!136468 m!162243))

(assert (=> b!136468 m!162243))

(assert (=> b!136468 m!162257))

(assert (=> b!136474 m!162243))

(assert (=> b!136474 m!162243))

(declare-fun m!162589 () Bool)

(assert (=> b!136474 m!162589))

(declare-fun m!162591 () Bool)

(assert (=> b!136473 m!162591))

(declare-fun m!162593 () Bool)

(assert (=> b!136473 m!162593))

(declare-fun m!162595 () Bool)

(assert (=> b!136473 m!162595))

(assert (=> b!136473 m!162261))

(assert (=> b!136473 m!162243))

(assert (=> b!136473 m!162593))

(assert (=> b!136473 m!162261))

(assert (=> b!136473 m!162101))

(assert (=> b!136473 m!162263))

(declare-fun m!162597 () Bool)

(assert (=> b!136473 m!162597))

(assert (=> b!136473 m!162101))

(assert (=> b!136470 m!162243))

(assert (=> b!136470 m!162243))

(assert (=> b!136470 m!162257))

(assert (=> b!136479 m!162243))

(declare-fun m!162599 () Bool)

(assert (=> b!136479 m!162599))

(assert (=> b!136479 m!162261))

(assert (=> b!136479 m!162101))

(assert (=> b!136479 m!162263))

(assert (=> b!136479 m!162101))

(assert (=> b!136479 m!162261))

(assert (=> b!136479 m!162243))

(declare-fun m!162601 () Bool)

(assert (=> d!42501 m!162601))

(assert (=> d!42501 m!162273))

(declare-fun m!162603 () Bool)

(assert (=> b!136471 m!162603))

(assert (=> bm!15024 m!162603))

(declare-fun m!162605 () Bool)

(assert (=> b!136475 m!162605))

(declare-fun m!162607 () Bool)

(assert (=> b!136469 m!162607))

(assert (=> b!136237 d!42501))

(declare-fun d!42503 () Bool)

(assert (=> d!42503 (= (apply!117 lt!71103 lt!71118) (get!1497 (getValueByKey!173 (toList!873 lt!71103) lt!71118)))))

(declare-fun bs!5713 () Bool)

(assert (= bs!5713 d!42503))

(declare-fun m!162609 () Bool)

(assert (=> bs!5713 m!162609))

(assert (=> bs!5713 m!162609))

(declare-fun m!162611 () Bool)

(assert (=> bs!5713 m!162611))

(assert (=> b!136237 d!42503))

(declare-fun d!42505 () Bool)

(declare-fun e!88887 () Bool)

(assert (=> d!42505 e!88887))

(declare-fun res!65468 () Bool)

(assert (=> d!42505 (=> (not res!65468) (not e!88887))))

(declare-fun lt!71340 () ListLongMap!1715)

(assert (=> d!42505 (= res!65468 (contains!905 lt!71340 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71339 () List!1723)

(assert (=> d!42505 (= lt!71340 (ListLongMap!1716 lt!71339))))

(declare-fun lt!71338 () Unit!4275)

(declare-fun lt!71341 () Unit!4275)

(assert (=> d!42505 (= lt!71338 lt!71341)))

(assert (=> d!42505 (= (getValueByKey!173 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42505 (= lt!71341 (lemmaContainsTupThenGetReturnValue!88 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42505 (= lt!71339 (insertStrictlySorted!91 (toList!873 lt!71102) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42505 (= (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71340)))

(declare-fun b!136480 () Bool)

(declare-fun res!65467 () Bool)

(assert (=> b!136480 (=> (not res!65467) (not e!88887))))

(assert (=> b!136480 (= res!65467 (= (getValueByKey!173 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136481 () Bool)

(assert (=> b!136481 (= e!88887 (contains!907 (toList!873 lt!71340) (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42505 res!65468) b!136480))

(assert (= (and b!136480 res!65467) b!136481))

(declare-fun m!162613 () Bool)

(assert (=> d!42505 m!162613))

(declare-fun m!162615 () Bool)

(assert (=> d!42505 m!162615))

(declare-fun m!162617 () Bool)

(assert (=> d!42505 m!162617))

(declare-fun m!162619 () Bool)

(assert (=> d!42505 m!162619))

(declare-fun m!162621 () Bool)

(assert (=> b!136480 m!162621))

(declare-fun m!162623 () Bool)

(assert (=> b!136481 m!162623))

(assert (=> b!136237 d!42505))

(declare-fun d!42507 () Bool)

(declare-fun e!88888 () Bool)

(assert (=> d!42507 e!88888))

(declare-fun res!65470 () Bool)

(assert (=> d!42507 (=> (not res!65470) (not e!88888))))

(declare-fun lt!71344 () ListLongMap!1715)

(assert (=> d!42507 (= res!65470 (contains!905 lt!71344 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71343 () List!1723)

(assert (=> d!42507 (= lt!71344 (ListLongMap!1716 lt!71343))))

(declare-fun lt!71342 () Unit!4275)

(declare-fun lt!71345 () Unit!4275)

(assert (=> d!42507 (= lt!71342 lt!71345)))

(assert (=> d!42507 (= (getValueByKey!173 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42507 (= lt!71345 (lemmaContainsTupThenGetReturnValue!88 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42507 (= lt!71343 (insertStrictlySorted!91 (toList!873 lt!71103) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42507 (= (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71344)))

(declare-fun b!136482 () Bool)

(declare-fun res!65469 () Bool)

(assert (=> b!136482 (=> (not res!65469) (not e!88888))))

(assert (=> b!136482 (= res!65469 (= (getValueByKey!173 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136483 () Bool)

(assert (=> b!136483 (= e!88888 (contains!907 (toList!873 lt!71344) (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42507 res!65470) b!136482))

(assert (= (and b!136482 res!65469) b!136483))

(declare-fun m!162625 () Bool)

(assert (=> d!42507 m!162625))

(declare-fun m!162627 () Bool)

(assert (=> d!42507 m!162627))

(declare-fun m!162629 () Bool)

(assert (=> d!42507 m!162629))

(declare-fun m!162631 () Bool)

(assert (=> d!42507 m!162631))

(declare-fun m!162633 () Bool)

(assert (=> b!136482 m!162633))

(declare-fun m!162635 () Bool)

(assert (=> b!136483 m!162635))

(assert (=> b!136237 d!42507))

(declare-fun d!42509 () Bool)

(assert (=> d!42509 (= (apply!117 lt!71112 lt!71111) (get!1497 (getValueByKey!173 (toList!873 lt!71112) lt!71111)))))

(declare-fun bs!5714 () Bool)

(assert (= bs!5714 d!42509))

(declare-fun m!162637 () Bool)

(assert (=> bs!5714 m!162637))

(assert (=> bs!5714 m!162637))

(declare-fun m!162639 () Bool)

(assert (=> bs!5714 m!162639))

(assert (=> b!136237 d!42509))

(declare-fun d!42511 () Bool)

(assert (=> d!42511 (= (apply!117 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71111) (apply!117 lt!71112 lt!71111))))

(declare-fun lt!71348 () Unit!4275)

(declare-fun choose!835 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> d!42511 (= lt!71348 (choose!835 lt!71112 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71111))))

(declare-fun e!88891 () Bool)

(assert (=> d!42511 e!88891))

(declare-fun res!65473 () Bool)

(assert (=> d!42511 (=> (not res!65473) (not e!88891))))

(assert (=> d!42511 (= res!65473 (contains!905 lt!71112 lt!71111))))

(assert (=> d!42511 (= (addApplyDifferent!93 lt!71112 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71111) lt!71348)))

(declare-fun b!136487 () Bool)

(assert (=> b!136487 (= e!88891 (not (= lt!71111 lt!71107)))))

(assert (= (and d!42511 res!65473) b!136487))

(declare-fun m!162641 () Bool)

(assert (=> d!42511 m!162641))

(assert (=> d!42511 m!162221))

(assert (=> d!42511 m!162221))

(assert (=> d!42511 m!162231))

(declare-fun m!162643 () Bool)

(assert (=> d!42511 m!162643))

(assert (=> d!42511 m!162253))

(assert (=> b!136237 d!42511))

(declare-fun d!42513 () Bool)

(assert (=> d!42513 (= (apply!117 lt!71102 lt!71122) (get!1497 (getValueByKey!173 (toList!873 lt!71102) lt!71122)))))

(declare-fun bs!5715 () Bool)

(assert (= bs!5715 d!42513))

(declare-fun m!162645 () Bool)

(assert (=> bs!5715 m!162645))

(assert (=> bs!5715 m!162645))

(declare-fun m!162647 () Bool)

(assert (=> bs!5715 m!162647))

(assert (=> b!136237 d!42513))

(declare-fun d!42515 () Bool)

(assert (=> d!42515 (= (apply!117 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71118) (apply!117 lt!71103 lt!71118))))

(declare-fun lt!71349 () Unit!4275)

(assert (=> d!42515 (= lt!71349 (choose!835 lt!71103 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71118))))

(declare-fun e!88892 () Bool)

(assert (=> d!42515 e!88892))

(declare-fun res!65474 () Bool)

(assert (=> d!42515 (=> (not res!65474) (not e!88892))))

(assert (=> d!42515 (= res!65474 (contains!905 lt!71103 lt!71118))))

(assert (=> d!42515 (= (addApplyDifferent!93 lt!71103 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71118) lt!71349)))

(declare-fun b!136488 () Bool)

(assert (=> b!136488 (= e!88892 (not (= lt!71118 lt!71117)))))

(assert (= (and d!42515 res!65474) b!136488))

(declare-fun m!162649 () Bool)

(assert (=> d!42515 m!162649))

(assert (=> d!42515 m!162233))

(assert (=> d!42515 m!162233))

(assert (=> d!42515 m!162235))

(declare-fun m!162651 () Bool)

(assert (=> d!42515 m!162651))

(assert (=> d!42515 m!162229))

(assert (=> b!136237 d!42515))

(declare-fun d!42517 () Bool)

(assert (=> d!42517 (= (apply!117 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71118) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71118)))))

(declare-fun bs!5716 () Bool)

(assert (= bs!5716 d!42517))

(declare-fun m!162653 () Bool)

(assert (=> bs!5716 m!162653))

(assert (=> bs!5716 m!162653))

(declare-fun m!162655 () Bool)

(assert (=> bs!5716 m!162655))

(assert (=> b!136237 d!42517))

(declare-fun d!42519 () Bool)

(assert (=> d!42519 (contains!905 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71114)))

(declare-fun lt!71352 () Unit!4275)

(declare-fun choose!836 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> d!42519 (= lt!71352 (choose!836 lt!71121 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71114))))

(assert (=> d!42519 (contains!905 lt!71121 lt!71114)))

(assert (=> d!42519 (= (addStillContains!93 lt!71121 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71114) lt!71352)))

(declare-fun bs!5717 () Bool)

(assert (= bs!5717 d!42519))

(assert (=> bs!5717 m!162239))

(assert (=> bs!5717 m!162239))

(assert (=> bs!5717 m!162241))

(declare-fun m!162657 () Bool)

(assert (=> bs!5717 m!162657))

(declare-fun m!162659 () Bool)

(assert (=> bs!5717 m!162659))

(assert (=> b!136237 d!42519))

(declare-fun d!42521 () Bool)

(assert (=> d!42521 (= (apply!117 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71122) (apply!117 lt!71102 lt!71122))))

(declare-fun lt!71353 () Unit!4275)

(assert (=> d!42521 (= lt!71353 (choose!835 lt!71102 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71122))))

(declare-fun e!88893 () Bool)

(assert (=> d!42521 e!88893))

(declare-fun res!65475 () Bool)

(assert (=> d!42521 (=> (not res!65475) (not e!88893))))

(assert (=> d!42521 (= res!65475 (contains!905 lt!71102 lt!71122))))

(assert (=> d!42521 (= (addApplyDifferent!93 lt!71102 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71122) lt!71353)))

(declare-fun b!136490 () Bool)

(assert (=> b!136490 (= e!88893 (not (= lt!71122 lt!71120)))))

(assert (= (and d!42521 res!65475) b!136490))

(declare-fun m!162661 () Bool)

(assert (=> d!42521 m!162661))

(assert (=> d!42521 m!162227))

(assert (=> d!42521 m!162227))

(assert (=> d!42521 m!162237))

(declare-fun m!162663 () Bool)

(assert (=> d!42521 m!162663))

(assert (=> d!42521 m!162249))

(assert (=> b!136237 d!42521))

(declare-fun d!42523 () Bool)

(declare-fun e!88894 () Bool)

(assert (=> d!42523 e!88894))

(declare-fun res!65477 () Bool)

(assert (=> d!42523 (=> (not res!65477) (not e!88894))))

(declare-fun lt!71356 () ListLongMap!1715)

(assert (=> d!42523 (= res!65477 (contains!905 lt!71356 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71355 () List!1723)

(assert (=> d!42523 (= lt!71356 (ListLongMap!1716 lt!71355))))

(declare-fun lt!71354 () Unit!4275)

(declare-fun lt!71357 () Unit!4275)

(assert (=> d!42523 (= lt!71354 lt!71357)))

(assert (=> d!42523 (= (getValueByKey!173 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42523 (= lt!71357 (lemmaContainsTupThenGetReturnValue!88 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42523 (= lt!71355 (insertStrictlySorted!91 (toList!873 lt!71112) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42523 (= (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71356)))

(declare-fun b!136491 () Bool)

(declare-fun res!65476 () Bool)

(assert (=> b!136491 (=> (not res!65476) (not e!88894))))

(assert (=> b!136491 (= res!65476 (= (getValueByKey!173 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136492 () Bool)

(assert (=> b!136492 (= e!88894 (contains!907 (toList!873 lt!71356) (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42523 res!65477) b!136491))

(assert (= (and b!136491 res!65476) b!136492))

(declare-fun m!162665 () Bool)

(assert (=> d!42523 m!162665))

(declare-fun m!162667 () Bool)

(assert (=> d!42523 m!162667))

(declare-fun m!162669 () Bool)

(assert (=> d!42523 m!162669))

(declare-fun m!162671 () Bool)

(assert (=> d!42523 m!162671))

(declare-fun m!162673 () Bool)

(assert (=> b!136491 m!162673))

(declare-fun m!162675 () Bool)

(assert (=> b!136492 m!162675))

(assert (=> b!136237 d!42523))

(declare-fun d!42525 () Bool)

(assert (=> d!42525 (= (apply!117 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71122) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71122)))))

(declare-fun bs!5718 () Bool)

(assert (= bs!5718 d!42525))

(declare-fun m!162677 () Bool)

(assert (=> bs!5718 m!162677))

(assert (=> bs!5718 m!162677))

(declare-fun m!162679 () Bool)

(assert (=> bs!5718 m!162679))

(assert (=> b!136237 d!42525))

(declare-fun d!42527 () Bool)

(assert (=> d!42527 (= (apply!117 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71111) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71111)))))

(declare-fun bs!5719 () Bool)

(assert (= bs!5719 d!42527))

(declare-fun m!162681 () Bool)

(assert (=> bs!5719 m!162681))

(assert (=> bs!5719 m!162681))

(declare-fun m!162683 () Bool)

(assert (=> bs!5719 m!162683))

(assert (=> b!136237 d!42527))

(declare-fun d!42529 () Bool)

(declare-fun res!65478 () Bool)

(declare-fun e!88895 () Bool)

(assert (=> d!42529 (=> res!65478 e!88895)))

(assert (=> d!42529 (= res!65478 (= (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42529 (= (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000) e!88895)))

(declare-fun b!136493 () Bool)

(declare-fun e!88896 () Bool)

(assert (=> b!136493 (= e!88895 e!88896)))

(declare-fun res!65479 () Bool)

(assert (=> b!136493 (=> (not res!65479) (not e!88896))))

(assert (=> b!136493 (= res!65479 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136494 () Bool)

(assert (=> b!136494 (= e!88896 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!42529 (not res!65478)) b!136493))

(assert (= (and b!136493 res!65479) b!136494))

(assert (=> d!42529 m!162327))

(assert (=> b!136494 m!162081))

(declare-fun m!162685 () Bool)

(assert (=> b!136494 m!162685))

(assert (=> bm!14958 d!42529))

(assert (=> bm!14993 d!42501))

(declare-fun d!42531 () Bool)

(declare-fun e!88897 () Bool)

(assert (=> d!42531 e!88897))

(declare-fun res!65480 () Bool)

(assert (=> d!42531 (=> res!65480 e!88897)))

(declare-fun lt!71360 () Bool)

(assert (=> d!42531 (= res!65480 (not lt!71360))))

(declare-fun lt!71358 () Bool)

(assert (=> d!42531 (= lt!71360 lt!71358)))

(declare-fun lt!71361 () Unit!4275)

(declare-fun e!88898 () Unit!4275)

(assert (=> d!42531 (= lt!71361 e!88898)))

(declare-fun c!25522 () Bool)

(assert (=> d!42531 (= c!25522 lt!71358)))

(assert (=> d!42531 (= lt!71358 (containsKey!177 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42531 (= (contains!905 call!14968 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71360)))

(declare-fun b!136495 () Bool)

(declare-fun lt!71359 () Unit!4275)

(assert (=> b!136495 (= e!88898 lt!71359)))

(assert (=> b!136495 (= lt!71359 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136495 (isDefined!126 (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136496 () Bool)

(declare-fun Unit!4292 () Unit!4275)

(assert (=> b!136496 (= e!88898 Unit!4292)))

(declare-fun b!136497 () Bool)

(assert (=> b!136497 (= e!88897 (isDefined!126 (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (= (and d!42531 c!25522) b!136495))

(assert (= (and d!42531 (not c!25522)) b!136496))

(assert (= (and d!42531 (not res!65480)) b!136497))

(assert (=> d!42531 m!162081))

(declare-fun m!162687 () Bool)

(assert (=> d!42531 m!162687))

(assert (=> b!136495 m!162081))

(declare-fun m!162689 () Bool)

(assert (=> b!136495 m!162689))

(assert (=> b!136495 m!162081))

(declare-fun m!162691 () Bool)

(assert (=> b!136495 m!162691))

(assert (=> b!136495 m!162691))

(declare-fun m!162693 () Bool)

(assert (=> b!136495 m!162693))

(assert (=> b!136497 m!162081))

(assert (=> b!136497 m!162691))

(assert (=> b!136497 m!162691))

(assert (=> b!136497 m!162693))

(assert (=> b!136147 d!42531))

(declare-fun d!42533 () Bool)

(declare-fun e!88899 () Bool)

(assert (=> d!42533 e!88899))

(declare-fun res!65481 () Bool)

(assert (=> d!42533 (=> res!65481 e!88899)))

(declare-fun lt!71364 () Bool)

(assert (=> d!42533 (= res!65481 (not lt!71364))))

(declare-fun lt!71362 () Bool)

(assert (=> d!42533 (= lt!71364 lt!71362)))

(declare-fun lt!71365 () Unit!4275)

(declare-fun e!88900 () Unit!4275)

(assert (=> d!42533 (= lt!71365 e!88900)))

(declare-fun c!25523 () Bool)

(assert (=> d!42533 (= c!25523 lt!71362)))

(assert (=> d!42533 (= lt!71362 (containsKey!177 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!42533 (= (contains!905 lt!71115 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!71364)))

(declare-fun b!136498 () Bool)

(declare-fun lt!71363 () Unit!4275)

(assert (=> b!136498 (= e!88900 lt!71363)))

(assert (=> b!136498 (= lt!71363 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136498 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!136499 () Bool)

(declare-fun Unit!4293 () Unit!4275)

(assert (=> b!136499 (= e!88900 Unit!4293)))

(declare-fun b!136500 () Bool)

(assert (=> b!136500 (= e!88899 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!42533 c!25523) b!136498))

(assert (= (and d!42533 (not c!25523)) b!136499))

(assert (= (and d!42533 (not res!65481)) b!136500))

(assert (=> d!42533 m!162243))

(declare-fun m!162695 () Bool)

(assert (=> d!42533 m!162695))

(assert (=> b!136498 m!162243))

(declare-fun m!162697 () Bool)

(assert (=> b!136498 m!162697))

(assert (=> b!136498 m!162243))

(assert (=> b!136498 m!162553))

(assert (=> b!136498 m!162553))

(declare-fun m!162699 () Bool)

(assert (=> b!136498 m!162699))

(assert (=> b!136500 m!162243))

(assert (=> b!136500 m!162553))

(assert (=> b!136500 m!162553))

(assert (=> b!136500 m!162699))

(assert (=> b!136239 d!42533))

(declare-fun b!136510 () Bool)

(declare-fun res!65493 () Bool)

(declare-fun e!88903 () Bool)

(assert (=> b!136510 (=> (not res!65493) (not e!88903))))

(declare-fun size!2547 (LongMapFixedSize!1110) (_ BitVec 32))

(assert (=> b!136510 (= res!65493 (bvsge (size!2547 newMap!16) (_size!604 newMap!16)))))

(declare-fun b!136511 () Bool)

(declare-fun res!65490 () Bool)

(assert (=> b!136511 (=> (not res!65490) (not e!88903))))

(assert (=> b!136511 (= res!65490 (= (size!2547 newMap!16) (bvadd (_size!604 newMap!16) (bvsdiv (bvadd (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!136512 () Bool)

(assert (=> b!136512 (= e!88903 (and (bvsge (extraKeys!2650 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2650 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!604 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!136509 () Bool)

(declare-fun res!65492 () Bool)

(assert (=> b!136509 (=> (not res!65492) (not e!88903))))

(assert (=> b!136509 (= res!65492 (and (= (size!2544 (_values!2872 newMap!16)) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001)) (= (size!2543 (_keys!4642 newMap!16)) (size!2544 (_values!2872 newMap!16))) (bvsge (_size!604 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!604 newMap!16) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!42535 () Bool)

(declare-fun res!65491 () Bool)

(assert (=> d!42535 (=> (not res!65491) (not e!88903))))

(assert (=> d!42535 (= res!65491 (validMask!0 (mask!7203 newMap!16)))))

(assert (=> d!42535 (= (simpleValid!93 newMap!16) e!88903)))

(assert (= (and d!42535 res!65491) b!136509))

(assert (= (and b!136509 res!65492) b!136510))

(assert (= (and b!136510 res!65493) b!136511))

(assert (= (and b!136511 res!65490) b!136512))

(declare-fun m!162701 () Bool)

(assert (=> b!136510 m!162701))

(assert (=> b!136511 m!162701))

(assert (=> d!42535 m!162297))

(assert (=> d!42445 d!42535))

(declare-fun d!42537 () Bool)

(declare-fun res!65498 () Bool)

(declare-fun e!88908 () Bool)

(assert (=> d!42537 (=> res!65498 e!88908)))

(assert (=> d!42537 (= res!65498 (and ((_ is Cons!1719) (toList!873 lt!70951)) (= (_1!1332 (h!2325 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42537 (= (containsKey!177 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!88908)))

(declare-fun b!136517 () Bool)

(declare-fun e!88909 () Bool)

(assert (=> b!136517 (= e!88908 e!88909)))

(declare-fun res!65499 () Bool)

(assert (=> b!136517 (=> (not res!65499) (not e!88909))))

(assert (=> b!136517 (= res!65499 (and (or (not ((_ is Cons!1719) (toList!873 lt!70951))) (bvsle (_1!1332 (h!2325 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) ((_ is Cons!1719) (toList!873 lt!70951)) (bvslt (_1!1332 (h!2325 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(declare-fun b!136518 () Bool)

(assert (=> b!136518 (= e!88909 (containsKey!177 (t!6211 (toList!873 lt!70951)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42537 (not res!65498)) b!136517))

(assert (= (and b!136517 res!65499) b!136518))

(assert (=> b!136518 m!162081))

(declare-fun m!162703 () Bool)

(assert (=> b!136518 m!162703))

(assert (=> d!42427 d!42537))

(assert (=> d!42437 d!42465))

(declare-fun b!136527 () Bool)

(declare-fun e!88915 () (_ BitVec 32))

(declare-fun e!88914 () (_ BitVec 32))

(assert (=> b!136527 (= e!88915 e!88914)))

(declare-fun c!25528 () Bool)

(assert (=> b!136527 (= c!25528 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136528 () Bool)

(declare-fun call!15030 () (_ BitVec 32))

(assert (=> b!136528 (= e!88914 call!15030)))

(declare-fun b!136529 () Bool)

(assert (=> b!136529 (= e!88915 #b00000000000000000000000000000000)))

(declare-fun bm!15027 () Bool)

(assert (=> bm!15027 (= call!15030 (arrayCountValidKeys!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136530 () Bool)

(assert (=> b!136530 (= e!88914 (bvadd #b00000000000000000000000000000001 call!15030))))

(declare-fun d!42539 () Bool)

(declare-fun lt!71368 () (_ BitVec 32))

(assert (=> d!42539 (and (bvsge lt!71368 #b00000000000000000000000000000000) (bvsle lt!71368 (bvsub (size!2543 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!42539 (= lt!71368 e!88915)))

(declare-fun c!25529 () Bool)

(assert (=> d!42539 (= c!25529 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42539 (and (bvsle #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2543 (_keys!4642 newMap!16)) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42539 (= (arrayCountValidKeys!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) lt!71368)))

(assert (= (and d!42539 c!25529) b!136529))

(assert (= (and d!42539 (not c!25529)) b!136527))

(assert (= (and b!136527 c!25528) b!136530))

(assert (= (and b!136527 (not c!25528)) b!136528))

(assert (= (or b!136530 b!136528) bm!15027))

(assert (=> b!136527 m!162327))

(assert (=> b!136527 m!162327))

(assert (=> b!136527 m!162341))

(declare-fun m!162705 () Bool)

(assert (=> bm!15027 m!162705))

(assert (=> b!136260 d!42539))

(declare-fun d!42541 () Bool)

(declare-fun res!65500 () Bool)

(declare-fun e!88916 () Bool)

(assert (=> d!42541 (=> res!65500 e!88916)))

(assert (=> d!42541 (= res!65500 (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42541 (= (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!88916)))

(declare-fun b!136531 () Bool)

(declare-fun e!88917 () Bool)

(assert (=> b!136531 (= e!88916 e!88917)))

(declare-fun res!65501 () Bool)

(assert (=> b!136531 (=> (not res!65501) (not e!88917))))

(assert (=> b!136531 (= res!65501 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136532 () Bool)

(assert (=> b!136532 (= e!88917 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!42541 (not res!65500)) b!136531))

(assert (= (and b!136531 res!65501) b!136532))

(declare-fun m!162707 () Bool)

(assert (=> d!42541 m!162707))

(assert (=> b!136532 m!162081))

(declare-fun m!162709 () Bool)

(assert (=> b!136532 m!162709))

(assert (=> b!136268 d!42541))

(declare-fun d!42543 () Bool)

(declare-fun e!88928 () Bool)

(assert (=> d!42543 e!88928))

(declare-fun c!25534 () Bool)

(declare-fun lt!71374 () SeekEntryResult!276)

(assert (=> d!42543 (= c!25534 ((_ is MissingZero!276) lt!71374))))

(assert (=> d!42543 (= lt!71374 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun lt!71373 () Unit!4275)

(declare-fun choose!837 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) Int) Unit!4275)

(assert (=> d!42543 (= lt!71373 (choose!837 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42543 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42543 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)) lt!71373)))

(declare-fun call!15035 () Bool)

(declare-fun bm!15032 () Bool)

(assert (=> bm!15032 (= call!15035 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!136549 () Bool)

(assert (=> b!136549 (and (bvsge (index!3265 lt!71374) #b00000000000000000000000000000000) (bvslt (index!3265 lt!71374) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65510 () Bool)

(assert (=> b!136549 (= res!65510 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71374)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!88926 () Bool)

(assert (=> b!136549 (=> (not res!65510) (not e!88926))))

(declare-fun b!136550 () Bool)

(declare-fun res!65512 () Bool)

(declare-fun e!88929 () Bool)

(assert (=> b!136550 (=> (not res!65512) (not e!88929))))

(assert (=> b!136550 (= res!65512 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71374)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136550 (and (bvsge (index!3268 lt!71374) #b00000000000000000000000000000000) (bvslt (index!3268 lt!71374) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136551 () Bool)

(assert (=> b!136551 (= e!88926 (not call!15035))))

(declare-fun b!136552 () Bool)

(assert (=> b!136552 (= e!88928 e!88926)))

(declare-fun res!65513 () Bool)

(declare-fun call!15036 () Bool)

(assert (=> b!136552 (= res!65513 call!15036)))

(assert (=> b!136552 (=> (not res!65513) (not e!88926))))

(declare-fun b!136553 () Bool)

(assert (=> b!136553 (= e!88929 (not call!15035))))

(declare-fun bm!15033 () Bool)

(assert (=> bm!15033 (= call!15036 (inRange!0 (ite c!25534 (index!3265 lt!71374) (index!3268 lt!71374)) (mask!7203 newMap!16)))))

(declare-fun b!136554 () Bool)

(declare-fun e!88927 () Bool)

(assert (=> b!136554 (= e!88927 ((_ is Undefined!276) lt!71374))))

(declare-fun b!136555 () Bool)

(assert (=> b!136555 (= e!88928 e!88927)))

(declare-fun c!25535 () Bool)

(assert (=> b!136555 (= c!25535 ((_ is MissingVacant!276) lt!71374))))

(declare-fun b!136556 () Bool)

(declare-fun res!65511 () Bool)

(assert (=> b!136556 (=> (not res!65511) (not e!88929))))

(assert (=> b!136556 (= res!65511 call!15036)))

(assert (=> b!136556 (= e!88927 e!88929)))

(assert (= (and d!42543 c!25534) b!136552))

(assert (= (and d!42543 (not c!25534)) b!136555))

(assert (= (and b!136552 res!65513) b!136549))

(assert (= (and b!136549 res!65510) b!136551))

(assert (= (and b!136555 c!25535) b!136556))

(assert (= (and b!136555 (not c!25535)) b!136554))

(assert (= (and b!136556 res!65511) b!136550))

(assert (= (and b!136550 res!65512) b!136553))

(assert (= (or b!136552 b!136556) bm!15033))

(assert (= (or b!136551 b!136553) bm!15032))

(declare-fun m!162711 () Bool)

(assert (=> bm!15033 m!162711))

(declare-fun m!162713 () Bool)

(assert (=> b!136550 m!162713))

(assert (=> d!42543 m!162081))

(assert (=> d!42543 m!162161))

(assert (=> d!42543 m!162081))

(declare-fun m!162715 () Bool)

(assert (=> d!42543 m!162715))

(assert (=> d!42543 m!162297))

(assert (=> bm!15032 m!162081))

(assert (=> bm!15032 m!162175))

(declare-fun m!162717 () Bool)

(assert (=> b!136549 m!162717))

(assert (=> bm!14951 d!42543))

(declare-fun b!136565 () Bool)

(declare-fun e!88937 () Bool)

(declare-fun call!15039 () Bool)

(assert (=> b!136565 (= e!88937 call!15039)))

(declare-fun b!136566 () Bool)

(declare-fun e!88936 () Bool)

(assert (=> b!136566 (= e!88937 e!88936)))

(declare-fun lt!71383 () (_ BitVec 64))

(assert (=> b!136566 (= lt!71383 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71382 () Unit!4275)

(assert (=> b!136566 (= lt!71382 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000))))

(assert (=> b!136566 (arrayContainsKey!0 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000)))

(declare-fun lt!71381 () Unit!4275)

(assert (=> b!136566 (= lt!71381 lt!71382)))

(declare-fun res!65519 () Bool)

(assert (=> b!136566 (= res!65519 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (_keys!4642 newMap!16) (mask!7203 newMap!16)) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!136566 (=> (not res!65519) (not e!88936))))

(declare-fun bm!15036 () Bool)

(assert (=> bm!15036 (= call!15039 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun d!42545 () Bool)

(declare-fun res!65518 () Bool)

(declare-fun e!88938 () Bool)

(assert (=> d!42545 (=> res!65518 e!88938)))

(assert (=> d!42545 (= res!65518 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 newMap!16) (mask!7203 newMap!16)) e!88938)))

(declare-fun b!136567 () Bool)

(assert (=> b!136567 (= e!88938 e!88937)))

(declare-fun c!25538 () Bool)

(assert (=> b!136567 (= c!25538 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136568 () Bool)

(assert (=> b!136568 (= e!88936 call!15039)))

(assert (= (and d!42545 (not res!65518)) b!136567))

(assert (= (and b!136567 c!25538) b!136566))

(assert (= (and b!136567 (not c!25538)) b!136565))

(assert (= (and b!136566 res!65519) b!136568))

(assert (= (or b!136568 b!136565) bm!15036))

(assert (=> b!136566 m!162327))

(declare-fun m!162719 () Bool)

(assert (=> b!136566 m!162719))

(declare-fun m!162721 () Bool)

(assert (=> b!136566 m!162721))

(assert (=> b!136566 m!162327))

(declare-fun m!162723 () Bool)

(assert (=> b!136566 m!162723))

(declare-fun m!162725 () Bool)

(assert (=> bm!15036 m!162725))

(assert (=> b!136567 m!162327))

(assert (=> b!136567 m!162327))

(assert (=> b!136567 m!162341))

(assert (=> b!136261 d!42545))

(declare-fun d!42547 () Bool)

(assert (=> d!42547 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71386 () Unit!4275)

(declare-fun choose!838 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 V!3499 Int) Unit!4275)

(assert (=> d!42547 (= lt!71386 (choose!838 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71048 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42547 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42547 (= (lemmaChangeZeroKeyThenAddPairToListMap!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71048 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) (defaultEntry!2889 newMap!16)) lt!71386)))

(declare-fun bs!5720 () Bool)

(assert (= bs!5720 d!42547))

(assert (=> bs!5720 m!162189))

(assert (=> bs!5720 m!162103))

(declare-fun m!162727 () Bool)

(assert (=> bs!5720 m!162727))

(assert (=> bs!5720 m!162103))

(declare-fun m!162729 () Bool)

(assert (=> bs!5720 m!162729))

(assert (=> bs!5720 m!162297))

(assert (=> bs!5720 m!162189))

(declare-fun m!162731 () Bool)

(assert (=> bs!5720 m!162731))

(assert (=> b!136173 d!42547))

(declare-fun d!42549 () Bool)

(declare-fun e!88939 () Bool)

(assert (=> d!42549 e!88939))

(declare-fun res!65520 () Bool)

(assert (=> d!42549 (=> res!65520 e!88939)))

(declare-fun lt!71389 () Bool)

(assert (=> d!42549 (= res!65520 (not lt!71389))))

(declare-fun lt!71387 () Bool)

(assert (=> d!42549 (= lt!71389 lt!71387)))

(declare-fun lt!71390 () Unit!4275)

(declare-fun e!88940 () Unit!4275)

(assert (=> d!42549 (= lt!71390 e!88940)))

(declare-fun c!25539 () Bool)

(assert (=> d!42549 (= c!25539 lt!71387)))

(assert (=> d!42549 (= lt!71387 (containsKey!177 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(assert (=> d!42549 (= (contains!905 call!14967 (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))) lt!71389)))

(declare-fun b!136569 () Bool)

(declare-fun lt!71388 () Unit!4275)

(assert (=> b!136569 (= e!88940 lt!71388)))

(assert (=> b!136569 (= lt!71388 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(assert (=> b!136569 (isDefined!126 (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(declare-fun b!136570 () Bool)

(declare-fun Unit!4294 () Unit!4275)

(assert (=> b!136570 (= e!88940 Unit!4294)))

(declare-fun b!136571 () Bool)

(assert (=> b!136571 (= e!88939 (isDefined!126 (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))))

(assert (= (and d!42549 c!25539) b!136569))

(assert (= (and d!42549 (not c!25539)) b!136570))

(assert (= (and d!42549 (not res!65520)) b!136571))

(declare-fun m!162733 () Bool)

(assert (=> d!42549 m!162733))

(declare-fun m!162735 () Bool)

(assert (=> b!136569 m!162735))

(declare-fun m!162737 () Bool)

(assert (=> b!136569 m!162737))

(assert (=> b!136569 m!162737))

(declare-fun m!162739 () Bool)

(assert (=> b!136569 m!162739))

(assert (=> b!136571 m!162737))

(assert (=> b!136571 m!162737))

(assert (=> b!136571 m!162739))

(assert (=> bm!14961 d!42549))

(declare-fun b!136582 () Bool)

(declare-fun e!88950 () Bool)

(declare-fun contains!908 (List!1725 (_ BitVec 64)) Bool)

(assert (=> b!136582 (= e!88950 (contains!908 Nil!1722 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136583 () Bool)

(declare-fun e!88952 () Bool)

(declare-fun e!88951 () Bool)

(assert (=> b!136583 (= e!88952 e!88951)))

(declare-fun c!25542 () Bool)

(assert (=> b!136583 (= c!25542 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!42551 () Bool)

(declare-fun res!65527 () Bool)

(declare-fun e!88949 () Bool)

(assert (=> d!42551 (=> res!65527 e!88949)))

(assert (=> d!42551 (= res!65527 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42551 (= (arrayNoDuplicates!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 Nil!1722) e!88949)))

(declare-fun bm!15039 () Bool)

(declare-fun call!15042 () Bool)

(assert (=> bm!15039 (= call!15042 (arrayNoDuplicates!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25542 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722)))))

(declare-fun b!136584 () Bool)

(assert (=> b!136584 (= e!88949 e!88952)))

(declare-fun res!65528 () Bool)

(assert (=> b!136584 (=> (not res!65528) (not e!88952))))

(assert (=> b!136584 (= res!65528 (not e!88950))))

(declare-fun res!65529 () Bool)

(assert (=> b!136584 (=> (not res!65529) (not e!88950))))

(assert (=> b!136584 (= res!65529 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136585 () Bool)

(assert (=> b!136585 (= e!88951 call!15042)))

(declare-fun b!136586 () Bool)

(assert (=> b!136586 (= e!88951 call!15042)))

(assert (= (and d!42551 (not res!65527)) b!136584))

(assert (= (and b!136584 res!65529) b!136582))

(assert (= (and b!136584 res!65528) b!136583))

(assert (= (and b!136583 c!25542) b!136586))

(assert (= (and b!136583 (not c!25542)) b!136585))

(assert (= (or b!136586 b!136585) bm!15039))

(assert (=> b!136582 m!162327))

(assert (=> b!136582 m!162327))

(declare-fun m!162741 () Bool)

(assert (=> b!136582 m!162741))

(assert (=> b!136583 m!162327))

(assert (=> b!136583 m!162327))

(assert (=> b!136583 m!162341))

(assert (=> bm!15039 m!162327))

(declare-fun m!162743 () Bool)

(assert (=> bm!15039 m!162743))

(assert (=> b!136584 m!162327))

(assert (=> b!136584 m!162327))

(assert (=> b!136584 m!162341))

(assert (=> b!136262 d!42551))

(declare-fun d!42553 () Bool)

(assert (=> d!42553 (= (apply!117 lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5721 () Bool)

(assert (= bs!5721 d!42553))

(assert (=> bs!5721 m!162437))

(assert (=> bs!5721 m!162437))

(declare-fun m!162745 () Bool)

(assert (=> bs!5721 m!162745))

(assert (=> b!136243 d!42553))

(assert (=> b!136162 d!42483))

(declare-fun d!42555 () Bool)

(declare-fun res!65530 () Bool)

(declare-fun e!88953 () Bool)

(assert (=> d!42555 (=> (not res!65530) (not e!88953))))

(assert (=> d!42555 (= res!65530 (simpleValid!93 (_2!1333 lt!71054)))))

(assert (=> d!42555 (= (valid!533 (_2!1333 lt!71054)) e!88953)))

(declare-fun b!136587 () Bool)

(declare-fun res!65531 () Bool)

(assert (=> b!136587 (=> (not res!65531) (not e!88953))))

(assert (=> b!136587 (= res!65531 (= (arrayCountValidKeys!0 (_keys!4642 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))) (_size!604 (_2!1333 lt!71054))))))

(declare-fun b!136588 () Bool)

(declare-fun res!65532 () Bool)

(assert (=> b!136588 (=> (not res!65532) (not e!88953))))

(assert (=> b!136588 (= res!65532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054))))))

(declare-fun b!136589 () Bool)

(assert (=> b!136589 (= e!88953 (arrayNoDuplicates!0 (_keys!4642 (_2!1333 lt!71054)) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!42555 res!65530) b!136587))

(assert (= (and b!136587 res!65531) b!136588))

(assert (= (and b!136588 res!65532) b!136589))

(declare-fun m!162747 () Bool)

(assert (=> d!42555 m!162747))

(declare-fun m!162749 () Bool)

(assert (=> b!136587 m!162749))

(declare-fun m!162751 () Bool)

(assert (=> b!136588 m!162751))

(declare-fun m!162753 () Bool)

(assert (=> b!136589 m!162753))

(assert (=> d!42429 d!42555))

(assert (=> d!42429 d!42445))

(assert (=> b!136244 d!42453))

(declare-fun d!42557 () Bool)

(declare-fun e!88954 () Bool)

(assert (=> d!42557 e!88954))

(declare-fun res!65534 () Bool)

(assert (=> d!42557 (=> (not res!65534) (not e!88954))))

(declare-fun lt!71393 () ListLongMap!1715)

(assert (=> d!42557 (= res!65534 (contains!905 lt!71393 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71392 () List!1723)

(assert (=> d!42557 (= lt!71393 (ListLongMap!1716 lt!71392))))

(declare-fun lt!71391 () Unit!4275)

(declare-fun lt!71394 () Unit!4275)

(assert (=> d!42557 (= lt!71391 lt!71394)))

(assert (=> d!42557 (= (getValueByKey!173 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42557 (= lt!71394 (lemmaContainsTupThenGetReturnValue!88 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42557 (= lt!71392 (insertStrictlySorted!91 (toList!873 call!14960) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42557 (= (+!176 call!14960 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71393)))

(declare-fun b!136590 () Bool)

(declare-fun res!65533 () Bool)

(assert (=> b!136590 (=> (not res!65533) (not e!88954))))

(assert (=> b!136590 (= res!65533 (= (getValueByKey!173 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!136591 () Bool)

(assert (=> b!136591 (= e!88954 (contains!907 (toList!873 lt!71393) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!42557 res!65534) b!136590))

(assert (= (and b!136590 res!65533) b!136591))

(declare-fun m!162755 () Bool)

(assert (=> d!42557 m!162755))

(declare-fun m!162757 () Bool)

(assert (=> d!42557 m!162757))

(declare-fun m!162759 () Bool)

(assert (=> d!42557 m!162759))

(declare-fun m!162761 () Bool)

(assert (=> d!42557 m!162761))

(declare-fun m!162763 () Bool)

(assert (=> b!136590 m!162763))

(declare-fun m!162765 () Bool)

(assert (=> b!136591 m!162765))

(assert (=> b!136163 d!42557))

(declare-fun d!42559 () Bool)

(assert (=> d!42559 (= (get!1495 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3220 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136189 d!42559))

(declare-fun d!42561 () Bool)

(declare-fun e!88957 () Bool)

(assert (=> d!42561 e!88957))

(declare-fun c!25545 () Bool)

(assert (=> d!42561 (= c!25545 (and (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!42561 true))

(declare-fun _$29!159 () Unit!4275)

(assert (=> d!42561 (= (choose!830 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) _$29!159)))

(declare-fun b!136596 () Bool)

(assert (=> b!136596 (= e!88957 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!136597 () Bool)

(assert (=> b!136597 (= e!88957 (ite (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!42561 c!25545) b!136596))

(assert (= (and d!42561 (not c!25545)) b!136597))

(assert (=> b!136596 m!162081))

(assert (=> b!136596 m!162083))

(assert (=> d!42451 d!42561))

(declare-fun d!42563 () Bool)

(assert (=> d!42563 (= (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992)))) (and (or (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000001111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000011111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000001111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000011111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000001111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000011111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000001111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000011111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000001111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000011111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000001111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000011111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000001111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000011111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000001111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000011111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000111111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00001111111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00011111111111111111111111111111) (= (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!42451 d!42563))

(declare-fun d!42565 () Bool)

(declare-fun e!88958 () Bool)

(assert (=> d!42565 e!88958))

(declare-fun res!65536 () Bool)

(assert (=> d!42565 (=> (not res!65536) (not e!88958))))

(declare-fun lt!71397 () ListLongMap!1715)

(assert (=> d!42565 (= res!65536 (contains!905 lt!71397 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71396 () List!1723)

(assert (=> d!42565 (= lt!71397 (ListLongMap!1716 lt!71396))))

(declare-fun lt!71395 () Unit!4275)

(declare-fun lt!71398 () Unit!4275)

(assert (=> d!42565 (= lt!71395 lt!71398)))

(assert (=> d!42565 (= (getValueByKey!173 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42565 (= lt!71398 (lemmaContainsTupThenGetReturnValue!88 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42565 (= lt!71396 (insertStrictlySorted!91 (toList!873 call!14995) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42565 (= (+!176 call!14995 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71397)))

(declare-fun b!136598 () Bool)

(declare-fun res!65535 () Bool)

(assert (=> b!136598 (=> (not res!65535) (not e!88958))))

(assert (=> b!136598 (= res!65535 (= (getValueByKey!173 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136599 () Bool)

(assert (=> b!136599 (= e!88958 (contains!907 (toList!873 lt!71397) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42565 res!65536) b!136598))

(assert (= (and b!136598 res!65535) b!136599))

(declare-fun m!162767 () Bool)

(assert (=> d!42565 m!162767))

(declare-fun m!162769 () Bool)

(assert (=> d!42565 m!162769))

(declare-fun m!162771 () Bool)

(assert (=> d!42565 m!162771))

(declare-fun m!162773 () Bool)

(assert (=> d!42565 m!162773))

(declare-fun m!162775 () Bool)

(assert (=> b!136598 m!162775))

(declare-fun m!162777 () Bool)

(assert (=> b!136599 m!162777))

(assert (=> b!136245 d!42565))

(declare-fun d!42567 () Bool)

(assert (=> d!42567 (= (get!1496 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136190 d!42567))

(assert (=> d!42439 d!42563))

(declare-fun b!136600 () Bool)

(declare-fun e!88970 () ListLongMap!1715)

(declare-fun call!15044 () ListLongMap!1715)

(assert (=> b!136600 (= e!88970 call!15044)))

(declare-fun bm!15040 () Bool)

(declare-fun call!15045 () Bool)

(declare-fun lt!71413 () ListLongMap!1715)

(assert (=> bm!15040 (= call!15045 (contains!905 lt!71413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136601 () Bool)

(declare-fun e!88961 () Bool)

(declare-fun e!88966 () Bool)

(assert (=> b!136601 (= e!88961 e!88966)))

(declare-fun c!25548 () Bool)

(assert (=> b!136601 (= c!25548 (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136602 () Bool)

(assert (=> b!136602 (= e!88966 (not call!15045))))

(declare-fun c!25549 () Bool)

(declare-fun b!136603 () Bool)

(assert (=> b!136603 (= c!25549 (and (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!88965 () ListLongMap!1715)

(assert (=> b!136603 (= e!88965 e!88970)))

(declare-fun call!15043 () ListLongMap!1715)

(declare-fun call!15046 () ListLongMap!1715)

(declare-fun call!15048 () ListLongMap!1715)

(declare-fun call!15049 () ListLongMap!1715)

(declare-fun c!25546 () Bool)

(declare-fun bm!15041 () Bool)

(declare-fun c!25551 () Bool)

(assert (=> bm!15041 (= call!15046 (+!176 (ite c!25546 call!15049 (ite c!25551 call!15048 call!15043)) (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(declare-fun bm!15042 () Bool)

(assert (=> bm!15042 (= call!15044 call!15046)))

(declare-fun bm!15043 () Bool)

(assert (=> bm!15043 (= call!15048 call!15049)))

(declare-fun b!136604 () Bool)

(declare-fun e!88959 () Unit!4275)

(declare-fun lt!71402 () Unit!4275)

(assert (=> b!136604 (= e!88959 lt!71402)))

(declare-fun lt!71419 () ListLongMap!1715)

(assert (=> b!136604 (= lt!71419 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71403 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71412 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71412 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71406 () Unit!4275)

(assert (=> b!136604 (= lt!71406 (addStillContains!93 lt!71419 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71412))))

(assert (=> b!136604 (contains!905 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71412)))

(declare-fun lt!71399 () Unit!4275)

(assert (=> b!136604 (= lt!71399 lt!71406)))

(declare-fun lt!71400 () ListLongMap!1715)

(assert (=> b!136604 (= lt!71400 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71418 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71420 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71420 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71404 () Unit!4275)

(assert (=> b!136604 (= lt!71404 (addApplyDifferent!93 lt!71400 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71420))))

(assert (=> b!136604 (= (apply!117 (+!176 lt!71400 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71420) (apply!117 lt!71400 lt!71420))))

(declare-fun lt!71414 () Unit!4275)

(assert (=> b!136604 (= lt!71414 lt!71404)))

(declare-fun lt!71410 () ListLongMap!1715)

(assert (=> b!136604 (= lt!71410 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71405 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71409 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71409 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71408 () Unit!4275)

(assert (=> b!136604 (= lt!71408 (addApplyDifferent!93 lt!71410 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71409))))

(assert (=> b!136604 (= (apply!117 (+!176 lt!71410 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71409) (apply!117 lt!71410 lt!71409))))

(declare-fun lt!71407 () Unit!4275)

(assert (=> b!136604 (= lt!71407 lt!71408)))

(declare-fun lt!71401 () ListLongMap!1715)

(assert (=> b!136604 (= lt!71401 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71415 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71416 () (_ BitVec 64))

(assert (=> b!136604 (= lt!71416 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!136604 (= lt!71402 (addApplyDifferent!93 lt!71401 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71416))))

(assert (=> b!136604 (= (apply!117 (+!176 lt!71401 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71416) (apply!117 lt!71401 lt!71416))))

(declare-fun bm!15044 () Bool)

(assert (=> bm!15044 (= call!15049 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!136606 () Bool)

(declare-fun e!88967 () Bool)

(declare-fun e!88964 () Bool)

(assert (=> b!136606 (= e!88967 e!88964)))

(declare-fun res!65545 () Bool)

(assert (=> b!136606 (=> (not res!65545) (not e!88964))))

(assert (=> b!136606 (= res!65545 (contains!905 lt!71413 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136607 () Bool)

(declare-fun e!88971 () Bool)

(assert (=> b!136607 (= e!88966 e!88971)))

(declare-fun res!65539 () Bool)

(assert (=> b!136607 (= res!65539 call!15045)))

(assert (=> b!136607 (=> (not res!65539) (not e!88971))))

(declare-fun b!136608 () Bool)

(declare-fun res!65540 () Bool)

(assert (=> b!136608 (=> (not res!65540) (not e!88961))))

(declare-fun e!88960 () Bool)

(assert (=> b!136608 (= res!65540 e!88960)))

(declare-fun c!25550 () Bool)

(assert (=> b!136608 (= c!25550 (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136609 () Bool)

(declare-fun Unit!4295 () Unit!4275)

(assert (=> b!136609 (= e!88959 Unit!4295)))

(declare-fun e!88968 () Bool)

(declare-fun b!136610 () Bool)

(assert (=> b!136610 (= e!88968 (= (apply!117 lt!71413 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))

(declare-fun b!136611 () Bool)

(declare-fun e!88963 () Bool)

(assert (=> b!136611 (= e!88963 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136612 () Bool)

(declare-fun e!88969 () ListLongMap!1715)

(assert (=> b!136612 (= e!88969 (+!176 call!15046 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))

(declare-fun b!136613 () Bool)

(assert (=> b!136613 (= e!88969 e!88965)))

(assert (=> b!136613 (= c!25551 (and (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136614 () Bool)

(assert (=> b!136614 (= e!88960 e!88968)))

(declare-fun res!65541 () Bool)

(declare-fun call!15047 () Bool)

(assert (=> b!136614 (= res!65541 call!15047)))

(assert (=> b!136614 (=> (not res!65541) (not e!88968))))

(declare-fun b!136615 () Bool)

(declare-fun res!65537 () Bool)

(assert (=> b!136615 (=> (not res!65537) (not e!88961))))

(assert (=> b!136615 (= res!65537 e!88967)))

(declare-fun res!65544 () Bool)

(assert (=> b!136615 (=> res!65544 e!88967)))

(assert (=> b!136615 (= res!65544 (not e!88963))))

(declare-fun res!65542 () Bool)

(assert (=> b!136615 (=> (not res!65542) (not e!88963))))

(assert (=> b!136615 (= res!65542 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136616 () Bool)

(declare-fun e!88962 () Bool)

(assert (=> b!136616 (= e!88962 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15045 () Bool)

(assert (=> bm!15045 (= call!15043 call!15048)))

(declare-fun b!136617 () Bool)

(assert (=> b!136617 (= e!88960 (not call!15047))))

(declare-fun bm!15046 () Bool)

(assert (=> bm!15046 (= call!15047 (contains!905 lt!71413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42569 () Bool)

(assert (=> d!42569 e!88961))

(declare-fun res!65543 () Bool)

(assert (=> d!42569 (=> (not res!65543) (not e!88961))))

(assert (=> d!42569 (= res!65543 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71411 () ListLongMap!1715)

(assert (=> d!42569 (= lt!71413 lt!71411)))

(declare-fun lt!71417 () Unit!4275)

(assert (=> d!42569 (= lt!71417 e!88959)))

(declare-fun c!25547 () Bool)

(assert (=> d!42569 (= c!25547 e!88962)))

(declare-fun res!65538 () Bool)

(assert (=> d!42569 (=> (not res!65538) (not e!88962))))

(assert (=> d!42569 (= res!65538 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42569 (= lt!71411 e!88969)))

(assert (=> d!42569 (= c!25546 (and (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42569 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42569 (= (getCurrentListMap!549 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71413)))

(declare-fun b!136605 () Bool)

(assert (=> b!136605 (= e!88970 call!15043)))

(declare-fun b!136618 () Bool)

(assert (=> b!136618 (= e!88971 (= (apply!117 lt!71413 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))

(declare-fun b!136619 () Bool)

(assert (=> b!136619 (= e!88965 call!15044)))

(declare-fun b!136620 () Bool)

(assert (=> b!136620 (= e!88964 (= (apply!117 lt!71413 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040))))))

(assert (=> b!136620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42569 c!25546) b!136612))

(assert (= (and d!42569 (not c!25546)) b!136613))

(assert (= (and b!136613 c!25551) b!136619))

(assert (= (and b!136613 (not c!25551)) b!136603))

(assert (= (and b!136603 c!25549) b!136600))

(assert (= (and b!136603 (not c!25549)) b!136605))

(assert (= (or b!136600 b!136605) bm!15045))

(assert (= (or b!136619 bm!15045) bm!15043))

(assert (= (or b!136619 b!136600) bm!15042))

(assert (= (or b!136612 bm!15043) bm!15044))

(assert (= (or b!136612 bm!15042) bm!15041))

(assert (= (and d!42569 res!65538) b!136616))

(assert (= (and d!42569 c!25547) b!136604))

(assert (= (and d!42569 (not c!25547)) b!136609))

(assert (= (and d!42569 res!65543) b!136615))

(assert (= (and b!136615 res!65542) b!136611))

(assert (= (and b!136615 (not res!65544)) b!136606))

(assert (= (and b!136606 res!65545) b!136620))

(assert (= (and b!136615 res!65537) b!136608))

(assert (= (and b!136608 c!25550) b!136614))

(assert (= (and b!136608 (not c!25550)) b!136617))

(assert (= (and b!136614 res!65541) b!136610))

(assert (= (or b!136614 b!136617) bm!15046))

(assert (= (and b!136608 res!65540) b!136601))

(assert (= (and b!136601 c!25548) b!136607))

(assert (= (and b!136601 (not c!25548)) b!136602))

(assert (= (and b!136607 res!65539) b!136618))

(assert (= (or b!136607 b!136602) bm!15040))

(declare-fun b_lambda!6091 () Bool)

(assert (=> (not b_lambda!6091) (not b!136620)))

(assert (=> b!136620 t!6219))

(declare-fun b_and!8455 () Bool)

(assert (= b_and!8451 (and (=> t!6219 result!4047) b_and!8455)))

(assert (=> b!136620 t!6221))

(declare-fun b_and!8457 () Bool)

(assert (= b_and!8453 (and (=> t!6221 result!4049) b_and!8457)))

(declare-fun m!162779 () Bool)

(assert (=> b!136612 m!162779))

(declare-fun m!162781 () Bool)

(assert (=> b!136604 m!162781))

(declare-fun m!162783 () Bool)

(assert (=> b!136604 m!162783))

(declare-fun m!162785 () Bool)

(assert (=> b!136604 m!162785))

(declare-fun m!162787 () Bool)

(assert (=> b!136604 m!162787))

(declare-fun m!162789 () Bool)

(assert (=> b!136604 m!162789))

(assert (=> b!136604 m!162781))

(declare-fun m!162791 () Bool)

(assert (=> b!136604 m!162791))

(declare-fun m!162793 () Bool)

(assert (=> b!136604 m!162793))

(declare-fun m!162795 () Bool)

(assert (=> b!136604 m!162795))

(assert (=> b!136604 m!162787))

(declare-fun m!162797 () Bool)

(assert (=> b!136604 m!162797))

(declare-fun m!162799 () Bool)

(assert (=> b!136604 m!162799))

(declare-fun m!162801 () Bool)

(assert (=> b!136604 m!162801))

(assert (=> b!136604 m!162327))

(declare-fun m!162803 () Bool)

(assert (=> b!136604 m!162803))

(assert (=> b!136604 m!162799))

(declare-fun m!162805 () Bool)

(assert (=> b!136604 m!162805))

(declare-fun m!162807 () Bool)

(assert (=> b!136604 m!162807))

(assert (=> b!136604 m!162793))

(declare-fun m!162809 () Bool)

(assert (=> b!136604 m!162809))

(declare-fun m!162811 () Bool)

(assert (=> b!136604 m!162811))

(assert (=> b!136606 m!162327))

(assert (=> b!136606 m!162327))

(declare-fun m!162813 () Bool)

(assert (=> b!136606 m!162813))

(assert (=> b!136611 m!162327))

(assert (=> b!136611 m!162327))

(assert (=> b!136611 m!162341))

(declare-fun m!162815 () Bool)

(assert (=> b!136610 m!162815))

(declare-fun m!162817 () Bool)

(assert (=> b!136620 m!162817))

(assert (=> b!136620 m!162817))

(assert (=> b!136620 m!162347))

(declare-fun m!162819 () Bool)

(assert (=> b!136620 m!162819))

(assert (=> b!136620 m!162327))

(assert (=> b!136620 m!162347))

(assert (=> b!136620 m!162327))

(declare-fun m!162821 () Bool)

(assert (=> b!136620 m!162821))

(declare-fun m!162823 () Bool)

(assert (=> bm!15046 m!162823))

(declare-fun m!162825 () Bool)

(assert (=> bm!15041 m!162825))

(declare-fun m!162827 () Bool)

(assert (=> bm!15040 m!162827))

(assert (=> d!42569 m!162297))

(assert (=> bm!15044 m!162805))

(declare-fun m!162829 () Bool)

(assert (=> b!136618 m!162829))

(assert (=> b!136616 m!162327))

(assert (=> b!136616 m!162327))

(assert (=> b!136616 m!162341))

(assert (=> bm!14952 d!42569))

(declare-fun d!42571 () Bool)

(declare-fun e!88974 () Bool)

(assert (=> d!42571 e!88974))

(declare-fun res!65550 () Bool)

(assert (=> d!42571 (=> (not res!65550) (not e!88974))))

(declare-fun lt!71425 () SeekEntryResult!276)

(assert (=> d!42571 (= res!65550 ((_ is Found!276) lt!71425))))

(assert (=> d!42571 (= lt!71425 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun lt!71426 () Unit!4275)

(declare-fun choose!839 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) Int) Unit!4275)

(assert (=> d!42571 (= lt!71426 (choose!839 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42571 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42571 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!62 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)) lt!71426)))

(declare-fun b!136625 () Bool)

(declare-fun res!65551 () Bool)

(assert (=> b!136625 (=> (not res!65551) (not e!88974))))

(assert (=> b!136625 (= res!65551 (inRange!0 (index!3266 lt!71425) (mask!7203 newMap!16)))))

(declare-fun b!136626 () Bool)

(assert (=> b!136626 (= e!88974 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71425)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136626 (and (bvsge (index!3266 lt!71425) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71425) (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42571 res!65550) b!136625))

(assert (= (and b!136625 res!65551) b!136626))

(assert (=> d!42571 m!162081))

(assert (=> d!42571 m!162161))

(assert (=> d!42571 m!162081))

(declare-fun m!162831 () Bool)

(assert (=> d!42571 m!162831))

(assert (=> d!42571 m!162297))

(declare-fun m!162833 () Bool)

(assert (=> b!136625 m!162833))

(declare-fun m!162835 () Bool)

(assert (=> b!136626 m!162835))

(assert (=> bm!14953 d!42571))

(assert (=> b!136273 d!42449))

(declare-fun b!136628 () Bool)

(declare-fun e!88975 () Bool)

(assert (=> b!136628 (= e!88975 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4701 () Bool)

(declare-fun mapRes!4701 () Bool)

(declare-fun tp!11307 () Bool)

(declare-fun e!88976 () Bool)

(assert (=> mapNonEmpty!4701 (= mapRes!4701 (and tp!11307 e!88976))))

(declare-fun mapValue!4701 () ValueCell!1101)

(declare-fun mapRest!4701 () (Array (_ BitVec 32) ValueCell!1101))

(declare-fun mapKey!4701 () (_ BitVec 32))

(assert (=> mapNonEmpty!4701 (= mapRest!4700 (store mapRest!4701 mapKey!4701 mapValue!4701))))

(declare-fun b!136627 () Bool)

(assert (=> b!136627 (= e!88976 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4701 () Bool)

(assert (=> mapIsEmpty!4701 mapRes!4701))

(declare-fun condMapEmpty!4701 () Bool)

(declare-fun mapDefault!4701 () ValueCell!1101)

(assert (=> mapNonEmpty!4700 (= condMapEmpty!4701 (= mapRest!4700 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4701)))))

(assert (=> mapNonEmpty!4700 (= tp!11306 (and e!88975 mapRes!4701))))

(assert (= (and mapNonEmpty!4700 condMapEmpty!4701) mapIsEmpty!4701))

(assert (= (and mapNonEmpty!4700 (not condMapEmpty!4701)) mapNonEmpty!4701))

(assert (= (and mapNonEmpty!4701 ((_ is ValueCellFull!1101) mapValue!4701)) b!136627))

(assert (= (and mapNonEmpty!4700 ((_ is ValueCellFull!1101) mapDefault!4701)) b!136628))

(declare-fun m!162837 () Bool)

(assert (=> mapNonEmpty!4701 m!162837))

(declare-fun b!136630 () Bool)

(declare-fun e!88977 () Bool)

(assert (=> b!136630 (= e!88977 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4702 () Bool)

(declare-fun mapRes!4702 () Bool)

(declare-fun tp!11308 () Bool)

(declare-fun e!88978 () Bool)

(assert (=> mapNonEmpty!4702 (= mapRes!4702 (and tp!11308 e!88978))))

(declare-fun mapValue!4702 () ValueCell!1101)

(declare-fun mapRest!4702 () (Array (_ BitVec 32) ValueCell!1101))

(declare-fun mapKey!4702 () (_ BitVec 32))

(assert (=> mapNonEmpty!4702 (= mapRest!4699 (store mapRest!4702 mapKey!4702 mapValue!4702))))

(declare-fun b!136629 () Bool)

(assert (=> b!136629 (= e!88978 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4702 () Bool)

(assert (=> mapIsEmpty!4702 mapRes!4702))

(declare-fun condMapEmpty!4702 () Bool)

(declare-fun mapDefault!4702 () ValueCell!1101)

(assert (=> mapNonEmpty!4699 (= condMapEmpty!4702 (= mapRest!4699 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4702)))))

(assert (=> mapNonEmpty!4699 (= tp!11305 (and e!88977 mapRes!4702))))

(assert (= (and mapNonEmpty!4699 condMapEmpty!4702) mapIsEmpty!4702))

(assert (= (and mapNonEmpty!4699 (not condMapEmpty!4702)) mapNonEmpty!4702))

(assert (= (and mapNonEmpty!4702 ((_ is ValueCellFull!1101) mapValue!4702)) b!136629))

(assert (= (and mapNonEmpty!4699 ((_ is ValueCellFull!1101) mapDefault!4702)) b!136630))

(declare-fun m!162839 () Bool)

(assert (=> mapNonEmpty!4702 m!162839))

(declare-fun b_lambda!6093 () Bool)

(assert (= b_lambda!6083 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6093)))

(declare-fun b_lambda!6095 () Bool)

(assert (= b_lambda!6089 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6095)))

(declare-fun b_lambda!6097 () Bool)

(assert (= b_lambda!6087 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6097)))

(declare-fun b_lambda!6099 () Bool)

(assert (= b_lambda!6091 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6099)))

(declare-fun b_lambda!6101 () Bool)

(assert (= b_lambda!6085 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6101)))

(check-sat (not d!42475) (not b!136300) (not b_lambda!6097) (not d!42519) (not bm!15020) (not b!136492) (not b!136350) (not b!136322) (not d!42473) (not b!136511) (not bm!15039) (not b!136606) (not b!136437) (not b!136312) (not bm!15040) (not b!136400) (not b!136439) (not d!42491) (not b!136510) (not b!136590) (not b_lambda!6077) (not b!136495) (not d!42481) (not b!136571) (not b_lambda!6081) (not b!136500) (not b!136497) (not b!136299) (not d!42533) (not d!42465) (not b!136414) (not bm!15003) (not d!42467) (not b!136311) (not b!136616) (not b!136330) tp_is_empty!2889 (not d!42455) (not b!136315) (not bm!15036) (not b!136479) (not b!136406) (not d!42479) (not b!136494) (not b!136317) (not d!42457) (not b!136411) (not b!136475) (not d!42505) (not d!42495) (not b!136470) (not b!136591) (not b!136442) (not d!42531) (not d!42535) (not b!136612) (not bm!14996) (not d!42485) (not b!136480) (not b!136435) (not bm!15004) (not b!136304) (not b!136481) (not d!42515) (not b!136588) (not mapNonEmpty!4701) (not b!136491) (not d!42463) (not b!136443) (not b!136569) (not b!136611) (not d!42527) (not bm!15032) (not b!136329) (not b!136598) (not b!136324) (not b!136532) (not d!42509) (not b!136434) (not bm!15007) (not b!136287) (not b_lambda!6101) (not b!136401) (not d!42517) (not b!136527) (not b!136482) (not b!136334) (not d!42501) b_and!8455 (not d!42543) (not b!136344) (not d!42555) (not d!42487) (not b!136498) (not b_next!2947) (not b!136328) (not b_lambda!6093) (not b!136405) (not d!42571) (not b!136314) (not bm!15009) (not d!42483) (not d!42469) (not b!136364) (not d!42547) (not d!42553) (not b!136596) (not d!42459) (not b!136468) (not bm!15046) (not b_lambda!6095) (not b!136599) (not b!136469) (not d!42513) (not d!42507) (not b!136610) (not b!136584) (not b!136483) (not b!136582) (not b!136566) (not b_next!2945) (not b_lambda!6099) (not d!42565) (not d!42523) (not bm!15041) (not d!42511) (not b!136471) (not b!136343) (not bm!14997) (not b!136474) (not bm!15027) (not b!136604) (not b!136441) (not b!136292) (not bm!15024) (not d!42525) (not d!42549) (not bm!15021) (not d!42471) (not d!42557) (not b!136625) (not b!136341) (not b!136308) (not b!136339) (not b!136306) (not mapNonEmpty!4702) (not d!42503) (not b!136473) (not b!136587) (not b!136618) (not b!136620) (not bm!15002) (not d!42521) (not b!136298) (not d!42499) (not b!136438) (not b!136518) (not b!136583) (not b!136294) (not b!136342) (not b!136349) (not b!136589) (not bm!15033) (not b!136567) (not bm!15019) (not b!136338) (not d!42497) (not b!136353) b_and!8457 (not bm!15000) (not d!42461) (not bm!15044) (not d!42569) (not b!136336) (not b!136436))
(check-sat b_and!8455 b_and!8457 (not b_next!2945) (not b_next!2947))
(get-model)

(declare-fun d!42573 () Bool)

(assert (=> d!42573 (= (apply!117 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71111) (apply!117 lt!71112 lt!71111))))

(assert (=> d!42573 true))

(declare-fun _$34!988 () Unit!4275)

(assert (=> d!42573 (= (choose!835 lt!71112 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71111) _$34!988)))

(declare-fun bs!5722 () Bool)

(assert (= bs!5722 d!42573))

(assert (=> bs!5722 m!162221))

(assert (=> bs!5722 m!162221))

(assert (=> bs!5722 m!162231))

(assert (=> bs!5722 m!162253))

(assert (=> d!42511 d!42573))

(assert (=> d!42511 d!42509))

(declare-fun d!42575 () Bool)

(declare-fun e!88979 () Bool)

(assert (=> d!42575 e!88979))

(declare-fun res!65552 () Bool)

(assert (=> d!42575 (=> res!65552 e!88979)))

(declare-fun lt!71429 () Bool)

(assert (=> d!42575 (= res!65552 (not lt!71429))))

(declare-fun lt!71427 () Bool)

(assert (=> d!42575 (= lt!71429 lt!71427)))

(declare-fun lt!71430 () Unit!4275)

(declare-fun e!88980 () Unit!4275)

(assert (=> d!42575 (= lt!71430 e!88980)))

(declare-fun c!25552 () Bool)

(assert (=> d!42575 (= c!25552 lt!71427)))

(assert (=> d!42575 (= lt!71427 (containsKey!177 (toList!873 lt!71112) lt!71111))))

(assert (=> d!42575 (= (contains!905 lt!71112 lt!71111) lt!71429)))

(declare-fun b!136632 () Bool)

(declare-fun lt!71428 () Unit!4275)

(assert (=> b!136632 (= e!88980 lt!71428)))

(assert (=> b!136632 (= lt!71428 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71112) lt!71111))))

(assert (=> b!136632 (isDefined!126 (getValueByKey!173 (toList!873 lt!71112) lt!71111))))

(declare-fun b!136633 () Bool)

(declare-fun Unit!4296 () Unit!4275)

(assert (=> b!136633 (= e!88980 Unit!4296)))

(declare-fun b!136634 () Bool)

(assert (=> b!136634 (= e!88979 (isDefined!126 (getValueByKey!173 (toList!873 lt!71112) lt!71111)))))

(assert (= (and d!42575 c!25552) b!136632))

(assert (= (and d!42575 (not c!25552)) b!136633))

(assert (= (and d!42575 (not res!65552)) b!136634))

(declare-fun m!162841 () Bool)

(assert (=> d!42575 m!162841))

(declare-fun m!162843 () Bool)

(assert (=> b!136632 m!162843))

(assert (=> b!136632 m!162637))

(assert (=> b!136632 m!162637))

(declare-fun m!162845 () Bool)

(assert (=> b!136632 m!162845))

(assert (=> b!136634 m!162637))

(assert (=> b!136634 m!162637))

(assert (=> b!136634 m!162845))

(assert (=> d!42511 d!42575))

(assert (=> d!42511 d!42527))

(assert (=> d!42511 d!42523))

(assert (=> b!136353 d!42537))

(assert (=> b!136406 d!42571))

(declare-fun d!42577 () Bool)

(assert (=> d!42577 (= (size!2547 newMap!16) (bvadd (_size!604 newMap!16) (bvsdiv (bvadd (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!136510 d!42577))

(declare-fun b!136635 () Bool)

(declare-fun e!88981 () Option!179)

(assert (=> b!136635 (= e!88981 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71304)))))))

(declare-fun d!42579 () Bool)

(declare-fun c!25553 () Bool)

(assert (=> d!42579 (= c!25553 (and ((_ is Cons!1719) (toList!873 lt!71304)) (= (_1!1332 (h!2325 (toList!873 lt!71304))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (=> d!42579 (= (getValueByKey!173 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) e!88981)))

(declare-fun b!136636 () Bool)

(declare-fun e!88982 () Option!179)

(assert (=> b!136636 (= e!88981 e!88982)))

(declare-fun c!25554 () Bool)

(assert (=> b!136636 (= c!25554 (and ((_ is Cons!1719) (toList!873 lt!71304)) (not (= (_1!1332 (h!2325 (toList!873 lt!71304))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun b!136637 () Bool)

(assert (=> b!136637 (= e!88982 (getValueByKey!173 (t!6211 (toList!873 lt!71304)) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136638 () Bool)

(assert (=> b!136638 (= e!88982 None!177)))

(assert (= (and d!42579 c!25553) b!136635))

(assert (= (and d!42579 (not c!25553)) b!136636))

(assert (= (and b!136636 c!25554) b!136637))

(assert (= (and b!136636 (not c!25554)) b!136638))

(declare-fun m!162847 () Bool)

(assert (=> b!136637 m!162847))

(assert (=> b!136435 d!42579))

(declare-fun d!42581 () Bool)

(assert (=> d!42581 (= (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!412 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5723 () Bool)

(assert (= bs!5723 d!42581))

(assert (=> bs!5723 m!162437))

(declare-fun m!162849 () Bool)

(assert (=> bs!5723 m!162849))

(assert (=> b!136341 d!42581))

(declare-fun b!136639 () Bool)

(declare-fun e!88983 () Option!179)

(assert (=> b!136639 (= e!88983 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71115)))))))

(declare-fun d!42583 () Bool)

(declare-fun c!25555 () Bool)

(assert (=> d!42583 (= c!25555 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42583 (= (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000) e!88983)))

(declare-fun b!136640 () Bool)

(declare-fun e!88984 () Option!179)

(assert (=> b!136640 (= e!88983 e!88984)))

(declare-fun c!25556 () Bool)

(assert (=> b!136640 (= c!25556 (and ((_ is Cons!1719) (toList!873 lt!71115)) (not (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!136641 () Bool)

(assert (=> b!136641 (= e!88984 (getValueByKey!173 (t!6211 (toList!873 lt!71115)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136642 () Bool)

(assert (=> b!136642 (= e!88984 None!177)))

(assert (= (and d!42583 c!25555) b!136639))

(assert (= (and d!42583 (not c!25555)) b!136640))

(assert (= (and b!136640 c!25556) b!136641))

(assert (= (and b!136640 (not c!25556)) b!136642))

(declare-fun m!162851 () Bool)

(assert (=> b!136641 m!162851))

(assert (=> b!136341 d!42583))

(declare-fun d!42585 () Bool)

(declare-fun e!88985 () Bool)

(assert (=> d!42585 e!88985))

(declare-fun res!65553 () Bool)

(assert (=> d!42585 (=> res!65553 e!88985)))

(declare-fun lt!71433 () Bool)

(assert (=> d!42585 (= res!65553 (not lt!71433))))

(declare-fun lt!71431 () Bool)

(assert (=> d!42585 (= lt!71433 lt!71431)))

(declare-fun lt!71434 () Unit!4275)

(declare-fun e!88986 () Unit!4275)

(assert (=> d!42585 (= lt!71434 e!88986)))

(declare-fun c!25557 () Bool)

(assert (=> d!42585 (= c!25557 lt!71431)))

(assert (=> d!42585 (= lt!71431 (containsKey!177 (toList!873 lt!71413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42585 (= (contains!905 lt!71413 #b0000000000000000000000000000000000000000000000000000000000000000) lt!71433)))

(declare-fun b!136643 () Bool)

(declare-fun lt!71432 () Unit!4275)

(assert (=> b!136643 (= e!88986 lt!71432)))

(assert (=> b!136643 (= lt!71432 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136643 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136644 () Bool)

(declare-fun Unit!4297 () Unit!4275)

(assert (=> b!136644 (= e!88986 Unit!4297)))

(declare-fun b!136645 () Bool)

(assert (=> b!136645 (= e!88985 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42585 c!25557) b!136643))

(assert (= (and d!42585 (not c!25557)) b!136644))

(assert (= (and d!42585 (not res!65553)) b!136645))

(declare-fun m!162853 () Bool)

(assert (=> d!42585 m!162853))

(declare-fun m!162855 () Bool)

(assert (=> b!136643 m!162855))

(declare-fun m!162857 () Bool)

(assert (=> b!136643 m!162857))

(assert (=> b!136643 m!162857))

(declare-fun m!162859 () Bool)

(assert (=> b!136643 m!162859))

(assert (=> b!136645 m!162857))

(assert (=> b!136645 m!162857))

(assert (=> b!136645 m!162859))

(assert (=> bm!15046 d!42585))

(assert (=> d!42571 d!42483))

(declare-fun d!42587 () Bool)

(declare-fun e!88989 () Bool)

(assert (=> d!42587 e!88989))

(declare-fun res!65558 () Bool)

(assert (=> d!42587 (=> (not res!65558) (not e!88989))))

(declare-fun lt!71437 () SeekEntryResult!276)

(assert (=> d!42587 (= res!65558 ((_ is Found!276) lt!71437))))

(assert (=> d!42587 (= lt!71437 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (=> d!42587 true))

(declare-fun _$33!117 () Unit!4275)

(assert (=> d!42587 (= (choose!839 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)) _$33!117)))

(declare-fun b!136650 () Bool)

(declare-fun res!65559 () Bool)

(assert (=> b!136650 (=> (not res!65559) (not e!88989))))

(assert (=> b!136650 (= res!65559 (inRange!0 (index!3266 lt!71437) (mask!7203 newMap!16)))))

(declare-fun b!136651 () Bool)

(assert (=> b!136651 (= e!88989 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71437)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42587 res!65558) b!136650))

(assert (= (and b!136650 res!65559) b!136651))

(assert (=> d!42587 m!162081))

(assert (=> d!42587 m!162161))

(declare-fun m!162861 () Bool)

(assert (=> b!136650 m!162861))

(declare-fun m!162863 () Bool)

(assert (=> b!136651 m!162863))

(assert (=> d!42571 d!42587))

(declare-fun d!42589 () Bool)

(assert (=> d!42589 (= (validMask!0 (mask!7203 newMap!16)) (and (or (= (mask!7203 newMap!16) #b00000000000000000000000000000111) (= (mask!7203 newMap!16) #b00000000000000000000000000001111) (= (mask!7203 newMap!16) #b00000000000000000000000000011111) (= (mask!7203 newMap!16) #b00000000000000000000000000111111) (= (mask!7203 newMap!16) #b00000000000000000000000001111111) (= (mask!7203 newMap!16) #b00000000000000000000000011111111) (= (mask!7203 newMap!16) #b00000000000000000000000111111111) (= (mask!7203 newMap!16) #b00000000000000000000001111111111) (= (mask!7203 newMap!16) #b00000000000000000000011111111111) (= (mask!7203 newMap!16) #b00000000000000000000111111111111) (= (mask!7203 newMap!16) #b00000000000000000001111111111111) (= (mask!7203 newMap!16) #b00000000000000000011111111111111) (= (mask!7203 newMap!16) #b00000000000000000111111111111111) (= (mask!7203 newMap!16) #b00000000000000001111111111111111) (= (mask!7203 newMap!16) #b00000000000000011111111111111111) (= (mask!7203 newMap!16) #b00000000000000111111111111111111) (= (mask!7203 newMap!16) #b00000000000001111111111111111111) (= (mask!7203 newMap!16) #b00000000000011111111111111111111) (= (mask!7203 newMap!16) #b00000000000111111111111111111111) (= (mask!7203 newMap!16) #b00000000001111111111111111111111) (= (mask!7203 newMap!16) #b00000000011111111111111111111111) (= (mask!7203 newMap!16) #b00000000111111111111111111111111) (= (mask!7203 newMap!16) #b00000001111111111111111111111111) (= (mask!7203 newMap!16) #b00000011111111111111111111111111) (= (mask!7203 newMap!16) #b00000111111111111111111111111111) (= (mask!7203 newMap!16) #b00001111111111111111111111111111) (= (mask!7203 newMap!16) #b00011111111111111111111111111111) (= (mask!7203 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7203 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!42571 d!42589))

(declare-fun b!136652 () Bool)

(declare-fun e!88995 () Bool)

(assert (=> b!136652 (= e!88995 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136652 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!136653 () Bool)

(declare-fun res!65563 () Bool)

(declare-fun e!88990 () Bool)

(assert (=> b!136653 (=> (not res!65563) (not e!88990))))

(declare-fun lt!71438 () ListLongMap!1715)

(assert (=> b!136653 (= res!65563 (not (contains!905 lt!71438 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136654 () Bool)

(declare-fun e!88994 () ListLongMap!1715)

(declare-fun e!88993 () ListLongMap!1715)

(assert (=> b!136654 (= e!88994 e!88993)))

(declare-fun c!25560 () Bool)

(assert (=> b!136654 (= c!25560 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136655 () Bool)

(declare-fun e!88991 () Bool)

(assert (=> b!136655 (= e!88991 (= lt!71438 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16))))))

(declare-fun b!136656 () Bool)

(declare-fun e!88996 () Bool)

(assert (=> b!136656 (= e!88990 e!88996)))

(declare-fun c!25558 () Bool)

(assert (=> b!136656 (= c!25558 e!88995)))

(declare-fun res!65561 () Bool)

(assert (=> b!136656 (=> (not res!65561) (not e!88995))))

(assert (=> b!136656 (= res!65561 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun d!42591 () Bool)

(assert (=> d!42591 e!88990))

(declare-fun res!65560 () Bool)

(assert (=> d!42591 (=> (not res!65560) (not e!88990))))

(assert (=> d!42591 (= res!65560 (not (contains!905 lt!71438 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42591 (= lt!71438 e!88994)))

(declare-fun c!25559 () Bool)

(assert (=> d!42591 (= c!25559 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42591 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42591 (= (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71438)))

(declare-fun b!136657 () Bool)

(declare-fun lt!71439 () Unit!4275)

(declare-fun lt!71442 () Unit!4275)

(assert (=> b!136657 (= lt!71439 lt!71442)))

(declare-fun lt!71443 () V!3499)

(declare-fun lt!71444 () (_ BitVec 64))

(declare-fun lt!71441 () ListLongMap!1715)

(declare-fun lt!71440 () (_ BitVec 64))

(assert (=> b!136657 (not (contains!905 (+!176 lt!71441 (tuple2!2643 lt!71444 lt!71443)) lt!71440))))

(assert (=> b!136657 (= lt!71442 (addStillNotContains!62 lt!71441 lt!71444 lt!71443 lt!71440))))

(assert (=> b!136657 (= lt!71440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!136657 (= lt!71443 (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136657 (= lt!71444 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!15050 () ListLongMap!1715)

(assert (=> b!136657 (= lt!71441 call!15050)))

(assert (=> b!136657 (= e!88993 (+!176 call!15050 (tuple2!2643 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!136658 () Bool)

(declare-fun e!88992 () Bool)

(assert (=> b!136658 (= e!88996 e!88992)))

(assert (=> b!136658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65562 () Bool)

(assert (=> b!136658 (= res!65562 (contains!905 lt!71438 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136658 (=> (not res!65562) (not e!88992))))

(declare-fun b!136659 () Bool)

(assert (=> b!136659 (= e!88991 (isEmpty!413 lt!71438))))

(declare-fun bm!15047 () Bool)

(assert (=> bm!15047 (= call!15050 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16)))))

(declare-fun b!136660 () Bool)

(assert (=> b!136660 (= e!88994 (ListLongMap!1716 Nil!1720))))

(declare-fun b!136661 () Bool)

(assert (=> b!136661 (= e!88996 e!88991)))

(declare-fun c!25561 () Bool)

(assert (=> b!136661 (= c!25561 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136662 () Bool)

(assert (=> b!136662 (= e!88993 call!15050)))

(declare-fun b!136663 () Bool)

(assert (=> b!136663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> b!136663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (_values!2872 newMap!16))))))

(assert (=> b!136663 (= e!88992 (= (apply!117 lt!71438 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!42591 c!25559) b!136660))

(assert (= (and d!42591 (not c!25559)) b!136654))

(assert (= (and b!136654 c!25560) b!136657))

(assert (= (and b!136654 (not c!25560)) b!136662))

(assert (= (or b!136657 b!136662) bm!15047))

(assert (= (and d!42591 res!65560) b!136653))

(assert (= (and b!136653 res!65563) b!136656))

(assert (= (and b!136656 res!65561) b!136652))

(assert (= (and b!136656 c!25558) b!136658))

(assert (= (and b!136656 (not c!25558)) b!136661))

(assert (= (and b!136658 res!65562) b!136663))

(assert (= (and b!136661 c!25561) b!136655))

(assert (= (and b!136661 (not c!25561)) b!136659))

(declare-fun b_lambda!6103 () Bool)

(assert (=> (not b_lambda!6103) (not b!136657)))

(assert (=> b!136657 t!6219))

(declare-fun b_and!8459 () Bool)

(assert (= b_and!8455 (and (=> t!6219 result!4047) b_and!8459)))

(assert (=> b!136657 t!6221))

(declare-fun b_and!8461 () Bool)

(assert (= b_and!8457 (and (=> t!6221 result!4049) b_and!8461)))

(declare-fun b_lambda!6105 () Bool)

(assert (=> (not b_lambda!6105) (not b!136663)))

(assert (=> b!136663 t!6219))

(declare-fun b_and!8463 () Bool)

(assert (= b_and!8459 (and (=> t!6219 result!4047) b_and!8463)))

(assert (=> b!136663 t!6221))

(declare-fun b_and!8465 () Bool)

(assert (= b_and!8461 (and (=> t!6221 result!4049) b_and!8465)))

(assert (=> b!136652 m!162327))

(assert (=> b!136652 m!162327))

(assert (=> b!136652 m!162341))

(assert (=> b!136658 m!162327))

(assert (=> b!136658 m!162327))

(declare-fun m!162865 () Bool)

(assert (=> b!136658 m!162865))

(declare-fun m!162867 () Bool)

(assert (=> b!136657 m!162867))

(declare-fun m!162869 () Bool)

(assert (=> b!136657 m!162869))

(declare-fun m!162871 () Bool)

(assert (=> b!136657 m!162871))

(assert (=> b!136657 m!162419))

(assert (=> b!136657 m!162327))

(assert (=> b!136657 m!162869))

(assert (=> b!136657 m!162419))

(assert (=> b!136657 m!162347))

(assert (=> b!136657 m!162421))

(declare-fun m!162873 () Bool)

(assert (=> b!136657 m!162873))

(assert (=> b!136657 m!162347))

(assert (=> b!136654 m!162327))

(assert (=> b!136654 m!162327))

(assert (=> b!136654 m!162341))

(assert (=> b!136663 m!162327))

(declare-fun m!162875 () Bool)

(assert (=> b!136663 m!162875))

(assert (=> b!136663 m!162419))

(assert (=> b!136663 m!162347))

(assert (=> b!136663 m!162421))

(assert (=> b!136663 m!162347))

(assert (=> b!136663 m!162419))

(assert (=> b!136663 m!162327))

(declare-fun m!162877 () Bool)

(assert (=> d!42591 m!162877))

(assert (=> d!42591 m!162297))

(declare-fun m!162879 () Bool)

(assert (=> b!136655 m!162879))

(assert (=> bm!15047 m!162879))

(declare-fun m!162881 () Bool)

(assert (=> b!136659 m!162881))

(declare-fun m!162883 () Bool)

(assert (=> b!136653 m!162883))

(assert (=> bm!15007 d!42591))

(declare-fun b!136664 () Bool)

(declare-fun e!88998 () Bool)

(assert (=> b!136664 (= e!88998 (contains!908 Nil!1722 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!136665 () Bool)

(declare-fun e!89000 () Bool)

(declare-fun e!88999 () Bool)

(assert (=> b!136665 (= e!89000 e!88999)))

(declare-fun c!25562 () Bool)

(assert (=> b!136665 (= c!25562 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!42593 () Bool)

(declare-fun res!65564 () Bool)

(declare-fun e!88997 () Bool)

(assert (=> d!42593 (=> res!65564 e!88997)))

(assert (=> d!42593 (= res!65564 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42593 (= (arrayNoDuplicates!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000 Nil!1722) e!88997)))

(declare-fun bm!15048 () Bool)

(declare-fun call!15051 () Bool)

(assert (=> bm!15048 (= call!15051 (arrayNoDuplicates!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25562 (Cons!1721 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000) Nil!1722) Nil!1722)))))

(declare-fun b!136666 () Bool)

(assert (=> b!136666 (= e!88997 e!89000)))

(declare-fun res!65565 () Bool)

(assert (=> b!136666 (=> (not res!65565) (not e!89000))))

(assert (=> b!136666 (= res!65565 (not e!88998))))

(declare-fun res!65566 () Bool)

(assert (=> b!136666 (=> (not res!65566) (not e!88998))))

(assert (=> b!136666 (= res!65566 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!136667 () Bool)

(assert (=> b!136667 (= e!88999 call!15051)))

(declare-fun b!136668 () Bool)

(assert (=> b!136668 (= e!88999 call!15051)))

(assert (= (and d!42593 (not res!65564)) b!136666))

(assert (= (and b!136666 res!65566) b!136664))

(assert (= (and b!136666 res!65565) b!136665))

(assert (= (and b!136665 c!25562) b!136668))

(assert (= (and b!136665 (not c!25562)) b!136667))

(assert (= (or b!136668 b!136667) bm!15048))

(declare-fun m!162885 () Bool)

(assert (=> b!136664 m!162885))

(assert (=> b!136664 m!162885))

(declare-fun m!162887 () Bool)

(assert (=> b!136664 m!162887))

(assert (=> b!136665 m!162885))

(assert (=> b!136665 m!162885))

(declare-fun m!162889 () Bool)

(assert (=> b!136665 m!162889))

(assert (=> bm!15048 m!162885))

(declare-fun m!162891 () Bool)

(assert (=> bm!15048 m!162891))

(assert (=> b!136666 m!162885))

(assert (=> b!136666 m!162885))

(assert (=> b!136666 m!162889))

(assert (=> b!136344 d!42593))

(declare-fun d!42595 () Bool)

(declare-fun res!65567 () Bool)

(declare-fun e!89001 () Bool)

(assert (=> d!42595 (=> res!65567 e!89001)))

(assert (=> d!42595 (= res!65567 (= (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42595 (= (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!89001)))

(declare-fun b!136669 () Bool)

(declare-fun e!89002 () Bool)

(assert (=> b!136669 (= e!89001 e!89002)))

(declare-fun res!65568 () Bool)

(assert (=> b!136669 (=> (not res!65568) (not e!89002))))

(assert (=> b!136669 (= res!65568 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136670 () Bool)

(assert (=> b!136670 (= e!89002 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!42595 (not res!65567)) b!136669))

(assert (= (and b!136669 res!65568) b!136670))

(declare-fun m!162893 () Bool)

(assert (=> d!42595 m!162893))

(assert (=> b!136670 m!162081))

(declare-fun m!162895 () Bool)

(assert (=> b!136670 m!162895))

(assert (=> b!136532 d!42595))

(assert (=> b!136400 d!42543))

(declare-fun d!42597 () Bool)

(declare-fun e!89003 () Bool)

(assert (=> d!42597 e!89003))

(declare-fun res!65570 () Bool)

(assert (=> d!42597 (=> (not res!65570) (not e!89003))))

(declare-fun lt!71447 () ListLongMap!1715)

(assert (=> d!42597 (= res!65570 (contains!905 lt!71447 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71446 () List!1723)

(assert (=> d!42597 (= lt!71447 (ListLongMap!1716 lt!71446))))

(declare-fun lt!71445 () Unit!4275)

(declare-fun lt!71448 () Unit!4275)

(assert (=> d!42597 (= lt!71445 lt!71448)))

(assert (=> d!42597 (= (getValueByKey!173 lt!71446 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42597 (= lt!71448 (lemmaContainsTupThenGetReturnValue!88 lt!71446 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42597 (= lt!71446 (insertStrictlySorted!91 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42597 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71447)))

(declare-fun b!136671 () Bool)

(declare-fun res!65569 () Bool)

(assert (=> b!136671 (=> (not res!65569) (not e!89003))))

(assert (=> b!136671 (= res!65569 (= (getValueByKey!173 (toList!873 lt!71447) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!136672 () Bool)

(assert (=> b!136672 (= e!89003 (contains!907 (toList!873 lt!71447) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!42597 res!65570) b!136671))

(assert (= (and b!136671 res!65569) b!136672))

(declare-fun m!162897 () Bool)

(assert (=> d!42597 m!162897))

(declare-fun m!162899 () Bool)

(assert (=> d!42597 m!162899))

(declare-fun m!162901 () Bool)

(assert (=> d!42597 m!162901))

(declare-fun m!162903 () Bool)

(assert (=> d!42597 m!162903))

(declare-fun m!162905 () Bool)

(assert (=> b!136671 m!162905))

(declare-fun m!162907 () Bool)

(assert (=> b!136672 m!162907))

(assert (=> d!42481 d!42597))

(declare-fun d!42599 () Bool)

(declare-fun e!89006 () Bool)

(assert (=> d!42599 e!89006))

(declare-fun res!65573 () Bool)

(assert (=> d!42599 (=> (not res!65573) (not e!89006))))

(assert (=> d!42599 (= res!65573 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 (_keys!4642 newMap!16))) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2544 (_values!2872 newMap!16)))))))

(declare-fun lt!71451 () Unit!4275)

(declare-fun choose!840 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 32) (_ BitVec 64) V!3499 Int) Unit!4275)

(assert (=> d!42599 (= lt!71451 (choose!840 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42599 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42599 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!43 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)) lt!71451)))

(declare-fun b!136675 () Bool)

(assert (=> b!136675 (= e!89006 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))))))

(assert (= (and d!42599 res!65573) b!136675))

(assert (=> d!42599 m!162081))

(assert (=> d!42599 m!162103))

(declare-fun m!162909 () Bool)

(assert (=> d!42599 m!162909))

(assert (=> d!42599 m!162297))

(assert (=> b!136675 m!162501))

(assert (=> b!136675 m!162189))

(assert (=> b!136675 m!162363))

(assert (=> b!136675 m!162517))

(assert (=> b!136675 m!162189))

(assert (=> b!136675 m!162495))

(assert (=> d!42481 d!42599))

(declare-fun d!42601 () Bool)

(declare-fun e!89009 () Bool)

(assert (=> d!42601 e!89009))

(declare-fun res!65576 () Bool)

(assert (=> d!42601 (=> (not res!65576) (not e!89009))))

(assert (=> d!42601 (= res!65576 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 (_keys!4642 newMap!16)))))))

(declare-fun lt!71454 () Unit!4275)

(declare-fun choose!41 (array!4807 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1725) Unit!4275)

(assert (=> d!42601 (= lt!71454 (choose!41 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) lt!71286 lt!71264))))

(assert (=> d!42601 (bvslt (size!2543 (_keys!4642 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!42601 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) lt!71286 lt!71264) lt!71454)))

(declare-fun b!136678 () Bool)

(assert (=> b!136678 (= e!89009 (arrayNoDuplicates!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) lt!71286 lt!71264))))

(assert (= (and d!42601 res!65576) b!136678))

(assert (=> d!42601 m!162081))

(declare-fun m!162911 () Bool)

(assert (=> d!42601 m!162911))

(assert (=> b!136678 m!162501))

(assert (=> b!136678 m!162505))

(assert (=> d!42481 d!42601))

(assert (=> d!42481 d!42445))

(declare-fun b!136679 () Bool)

(declare-fun e!89011 () (_ BitVec 32))

(declare-fun e!89010 () (_ BitVec 32))

(assert (=> b!136679 (= e!89011 e!89010)))

(declare-fun c!25563 () Bool)

(assert (=> b!136679 (= c!25563 (validKeyInArray!0 (select (arr!2273 lt!71283) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(declare-fun b!136680 () Bool)

(declare-fun call!15052 () (_ BitVec 32))

(assert (=> b!136680 (= e!89010 call!15052)))

(declare-fun b!136681 () Bool)

(assert (=> b!136681 (= e!89011 #b00000000000000000000000000000000)))

(declare-fun bm!15049 () Bool)

(assert (=> bm!15049 (= call!15052 (arrayCountValidKeys!0 lt!71283 (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)))))

(declare-fun b!136682 () Bool)

(assert (=> b!136682 (= e!89010 (bvadd #b00000000000000000000000000000001 call!15052))))

(declare-fun d!42603 () Bool)

(declare-fun lt!71455 () (_ BitVec 32))

(assert (=> d!42603 (and (bvsge lt!71455 #b00000000000000000000000000000000) (bvsle lt!71455 (bvsub (size!2543 lt!71283) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(assert (=> d!42603 (= lt!71455 e!89011)))

(declare-fun c!25564 () Bool)

(assert (=> d!42603 (= c!25564 (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)))))

(assert (=> d!42603 (and (bvsle (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)) (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001) (size!2543 lt!71283)))))

(assert (=> d!42603 (= (arrayCountValidKeys!0 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)) lt!71455)))

(assert (= (and d!42603 c!25564) b!136681))

(assert (= (and d!42603 (not c!25564)) b!136679))

(assert (= (and b!136679 c!25563) b!136682))

(assert (= (and b!136679 (not c!25563)) b!136680))

(assert (= (or b!136682 b!136680) bm!15049))

(declare-fun m!162913 () Bool)

(assert (=> b!136679 m!162913))

(assert (=> b!136679 m!162913))

(declare-fun m!162915 () Bool)

(assert (=> b!136679 m!162915))

(declare-fun m!162917 () Bool)

(assert (=> bm!15049 m!162917))

(assert (=> d!42481 d!42603))

(declare-fun d!42605 () Bool)

(declare-fun e!89014 () Bool)

(assert (=> d!42605 e!89014))

(declare-fun res!65579 () Bool)

(assert (=> d!42605 (=> (not res!65579) (not e!89014))))

(assert (=> d!42605 (= res!65579 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 (_keys!4642 newMap!16)))))))

(declare-fun lt!71458 () Unit!4275)

(declare-fun choose!102 ((_ BitVec 64) array!4807 (_ BitVec 32) (_ BitVec 32)) Unit!4275)

(assert (=> d!42605 (= lt!71458 (choose!102 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (mask!7203 newMap!16)))))

(assert (=> d!42605 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42605 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (mask!7203 newMap!16)) lt!71458)))

(declare-fun b!136685 () Bool)

(assert (=> b!136685 (= e!89014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (mask!7203 newMap!16)))))

(assert (= (and d!42605 res!65579) b!136685))

(assert (=> d!42605 m!162081))

(declare-fun m!162919 () Bool)

(assert (=> d!42605 m!162919))

(assert (=> d!42605 m!162297))

(assert (=> b!136685 m!162501))

(assert (=> b!136685 m!162497))

(assert (=> d!42481 d!42605))

(assert (=> d!42481 d!42539))

(declare-fun b!136686 () Bool)

(declare-fun e!89016 () (_ BitVec 32))

(declare-fun e!89015 () (_ BitVec 32))

(assert (=> b!136686 (= e!89016 e!89015)))

(declare-fun c!25565 () Bool)

(assert (=> b!136686 (= c!25565 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!136687 () Bool)

(declare-fun call!15053 () (_ BitVec 32))

(assert (=> b!136687 (= e!89015 call!15053)))

(declare-fun b!136688 () Bool)

(assert (=> b!136688 (= e!89016 #b00000000000000000000000000000000)))

(declare-fun bm!15050 () Bool)

(assert (=> bm!15050 (= call!15053 (arrayCountValidKeys!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136689 () Bool)

(assert (=> b!136689 (= e!89015 (bvadd #b00000000000000000000000000000001 call!15053))))

(declare-fun lt!71459 () (_ BitVec 32))

(declare-fun d!42607 () Bool)

(assert (=> d!42607 (and (bvsge lt!71459 #b00000000000000000000000000000000) (bvsle lt!71459 (bvsub (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!42607 (= lt!71459 e!89016)))

(declare-fun c!25566 () Bool)

(assert (=> d!42607 (= c!25566 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42607 (and (bvsle #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2543 (_keys!4642 newMap!16)) (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(assert (=> d!42607 (= (arrayCountValidKeys!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) lt!71459)))

(assert (= (and d!42607 c!25566) b!136688))

(assert (= (and d!42607 (not c!25566)) b!136686))

(assert (= (and b!136686 c!25565) b!136689))

(assert (= (and b!136686 (not c!25565)) b!136687))

(assert (= (or b!136689 b!136687) bm!15050))

(declare-fun m!162921 () Bool)

(assert (=> b!136686 m!162921))

(assert (=> b!136686 m!162921))

(declare-fun m!162923 () Bool)

(assert (=> b!136686 m!162923))

(declare-fun m!162925 () Bool)

(assert (=> bm!15050 m!162925))

(assert (=> d!42481 d!42607))

(declare-fun d!42609 () Bool)

(declare-fun res!65580 () Bool)

(declare-fun e!89017 () Bool)

(assert (=> d!42609 (=> res!65580 e!89017)))

(assert (=> d!42609 (= res!65580 (= (select (arr!2273 lt!71271) #b00000000000000000000000000000000) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42609 (= (arrayContainsKey!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000) e!89017)))

(declare-fun b!136690 () Bool)

(declare-fun e!89018 () Bool)

(assert (=> b!136690 (= e!89017 e!89018)))

(declare-fun res!65581 () Bool)

(assert (=> b!136690 (=> (not res!65581) (not e!89018))))

(assert (=> b!136690 (= res!65581 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 lt!71271)))))

(declare-fun b!136691 () Bool)

(assert (=> b!136691 (= e!89018 (arrayContainsKey!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!42609 (not res!65580)) b!136690))

(assert (= (and b!136690 res!65581) b!136691))

(declare-fun m!162927 () Bool)

(assert (=> d!42609 m!162927))

(assert (=> b!136691 m!162081))

(declare-fun m!162929 () Bool)

(assert (=> b!136691 m!162929))

(assert (=> d!42481 d!42609))

(declare-fun d!42611 () Bool)

(declare-fun e!89019 () Bool)

(assert (=> d!42611 e!89019))

(declare-fun res!65582 () Bool)

(assert (=> d!42611 (=> res!65582 e!89019)))

(declare-fun lt!71462 () Bool)

(assert (=> d!42611 (= res!65582 (not lt!71462))))

(declare-fun lt!71460 () Bool)

(assert (=> d!42611 (= lt!71462 lt!71460)))

(declare-fun lt!71463 () Unit!4275)

(declare-fun e!89020 () Unit!4275)

(assert (=> d!42611 (= lt!71463 e!89020)))

(declare-fun c!25567 () Bool)

(assert (=> d!42611 (= c!25567 lt!71460)))

(assert (=> d!42611 (= lt!71460 (containsKey!177 (toList!873 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(assert (=> d!42611 (= (contains!905 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))) lt!71462)))

(declare-fun b!136692 () Bool)

(declare-fun lt!71461 () Unit!4275)

(assert (=> b!136692 (= e!89020 lt!71461)))

(assert (=> b!136692 (= lt!71461 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(assert (=> b!136692 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(declare-fun b!136693 () Bool)

(declare-fun Unit!4298 () Unit!4275)

(assert (=> b!136693 (= e!89020 Unit!4298)))

(declare-fun b!136694 () Bool)

(assert (=> b!136694 (= e!89019 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))))

(assert (= (and d!42611 c!25567) b!136692))

(assert (= (and d!42611 (not c!25567)) b!136693))

(assert (= (and d!42611 (not res!65582)) b!136694))

(assert (=> d!42611 m!162503))

(declare-fun m!162931 () Bool)

(assert (=> d!42611 m!162931))

(assert (=> b!136692 m!162503))

(declare-fun m!162933 () Bool)

(assert (=> b!136692 m!162933))

(assert (=> b!136692 m!162503))

(declare-fun m!162935 () Bool)

(assert (=> b!136692 m!162935))

(assert (=> b!136692 m!162935))

(declare-fun m!162937 () Bool)

(assert (=> b!136692 m!162937))

(assert (=> b!136694 m!162503))

(assert (=> b!136694 m!162935))

(assert (=> b!136694 m!162935))

(assert (=> b!136694 m!162937))

(assert (=> d!42481 d!42611))

(declare-fun d!42613 () Bool)

(declare-fun e!89021 () Bool)

(assert (=> d!42613 e!89021))

(declare-fun res!65583 () Bool)

(assert (=> d!42613 (=> res!65583 e!89021)))

(declare-fun lt!71466 () Bool)

(assert (=> d!42613 (= res!65583 (not lt!71466))))

(declare-fun lt!71464 () Bool)

(assert (=> d!42613 (= lt!71466 lt!71464)))

(declare-fun lt!71467 () Unit!4275)

(declare-fun e!89022 () Unit!4275)

(assert (=> d!42613 (= lt!71467 e!89022)))

(declare-fun c!25568 () Bool)

(assert (=> d!42613 (= c!25568 lt!71464)))

(assert (=> d!42613 (= lt!71464 (containsKey!177 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42613 (= (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71466)))

(declare-fun b!136695 () Bool)

(declare-fun lt!71465 () Unit!4275)

(assert (=> b!136695 (= e!89022 lt!71465)))

(assert (=> b!136695 (= lt!71465 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136695 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136696 () Bool)

(declare-fun Unit!4299 () Unit!4275)

(assert (=> b!136696 (= e!89022 Unit!4299)))

(declare-fun b!136697 () Bool)

(assert (=> b!136697 (= e!89021 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (= (and d!42613 c!25568) b!136695))

(assert (= (and d!42613 (not c!25568)) b!136696))

(assert (= (and d!42613 (not res!65583)) b!136697))

(assert (=> d!42613 m!162081))

(declare-fun m!162939 () Bool)

(assert (=> d!42613 m!162939))

(assert (=> b!136695 m!162081))

(declare-fun m!162941 () Bool)

(assert (=> b!136695 m!162941))

(assert (=> b!136695 m!162081))

(declare-fun m!162943 () Bool)

(assert (=> b!136695 m!162943))

(assert (=> b!136695 m!162943))

(declare-fun m!162945 () Bool)

(assert (=> b!136695 m!162945))

(assert (=> b!136697 m!162081))

(assert (=> b!136697 m!162943))

(assert (=> b!136697 m!162943))

(assert (=> b!136697 m!162945))

(assert (=> d!42481 d!42613))

(declare-fun d!42615 () Bool)

(declare-fun e!89028 () Bool)

(assert (=> d!42615 e!89028))

(declare-fun res!65595 () Bool)

(assert (=> d!42615 (=> (not res!65595) (not e!89028))))

(assert (=> d!42615 (= res!65595 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 (_keys!4642 newMap!16)))))))

(declare-fun lt!71470 () Unit!4275)

(declare-fun choose!1 (array!4807 (_ BitVec 32) (_ BitVec 64)) Unit!4275)

(assert (=> d!42615 (= lt!71470 (choose!1 (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!89027 () Bool)

(assert (=> d!42615 e!89027))

(declare-fun res!65594 () Bool)

(assert (=> d!42615 (=> (not res!65594) (not e!89027))))

(assert (=> d!42615 (= res!65594 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 (_keys!4642 newMap!16)))))))

(assert (=> d!42615 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4642 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71470)))

(declare-fun b!136707 () Bool)

(declare-fun res!65592 () Bool)

(assert (=> b!136707 (=> (not res!65592) (not e!89027))))

(assert (=> b!136707 (= res!65592 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136708 () Bool)

(assert (=> b!136708 (= e!89027 (bvslt (size!2543 (_keys!4642 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!136706 () Bool)

(declare-fun res!65593 () Bool)

(assert (=> b!136706 (=> (not res!65593) (not e!89027))))

(assert (=> b!136706 (= res!65593 (not (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))))

(declare-fun b!136709 () Bool)

(assert (=> b!136709 (= e!89028 (= (arrayCountValidKeys!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4642 newMap!16) #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) #b00000000000000000000000000000001)))))

(assert (= (and d!42615 res!65594) b!136706))

(assert (= (and b!136706 res!65593) b!136707))

(assert (= (and b!136707 res!65592) b!136708))

(assert (= (and d!42615 res!65595) b!136709))

(assert (=> d!42615 m!162081))

(declare-fun m!162947 () Bool)

(assert (=> d!42615 m!162947))

(assert (=> b!136707 m!162081))

(declare-fun m!162949 () Bool)

(assert (=> b!136707 m!162949))

(declare-fun m!162951 () Bool)

(assert (=> b!136706 m!162951))

(assert (=> b!136706 m!162951))

(declare-fun m!162953 () Bool)

(assert (=> b!136706 m!162953))

(assert (=> b!136709 m!162501))

(assert (=> b!136709 m!162519))

(assert (=> b!136709 m!162279))

(assert (=> d!42481 d!42615))

(assert (=> d!42481 d!42465))

(declare-fun d!42617 () Bool)

(declare-fun e!89029 () Bool)

(assert (=> d!42617 e!89029))

(declare-fun res!65596 () Bool)

(assert (=> d!42617 (=> (not res!65596) (not e!89029))))

(assert (=> d!42617 (= res!65596 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 lt!71268))))))

(declare-fun lt!71471 () Unit!4275)

(assert (=> d!42617 (= lt!71471 (choose!831 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (defaultEntry!2889 newMap!16)))))

(assert (=> d!42617 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42617 (= (lemmaValidKeyInArrayIsInListMap!123 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (defaultEntry!2889 newMap!16)) lt!71471)))

(declare-fun b!136710 () Bool)

(assert (=> b!136710 (= e!89029 (contains!905 (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 lt!71268) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(assert (= (and d!42617 res!65596) b!136710))

(declare-fun m!162955 () Bool)

(assert (=> d!42617 m!162955))

(assert (=> d!42617 m!162297))

(assert (=> b!136710 m!162511))

(declare-fun m!162957 () Bool)

(assert (=> b!136710 m!162957))

(assert (=> b!136710 m!162511))

(assert (=> b!136710 m!162957))

(declare-fun m!162959 () Bool)

(assert (=> b!136710 m!162959))

(assert (=> d!42481 d!42617))

(assert (=> d!42481 d!42529))

(declare-fun d!42619 () Bool)

(assert (=> d!42619 (arrayContainsKey!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!71474 () Unit!4275)

(declare-fun choose!13 (array!4807 (_ BitVec 64) (_ BitVec 32)) Unit!4275)

(assert (=> d!42619 (= lt!71474 (choose!13 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(assert (=> d!42619 (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000)))

(assert (=> d!42619 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!71271 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))) lt!71474)))

(declare-fun bs!5724 () Bool)

(assert (= bs!5724 d!42619))

(assert (=> bs!5724 m!162081))

(assert (=> bs!5724 m!162499))

(assert (=> bs!5724 m!162081))

(declare-fun m!162961 () Bool)

(assert (=> bs!5724 m!162961))

(assert (=> d!42481 d!42619))

(declare-fun b!136711 () Bool)

(declare-fun e!89031 () Bool)

(assert (=> b!136711 (= e!89031 (contains!908 lt!71264 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) lt!71286)))))

(declare-fun b!136712 () Bool)

(declare-fun e!89033 () Bool)

(declare-fun e!89032 () Bool)

(assert (=> b!136712 (= e!89033 e!89032)))

(declare-fun c!25569 () Bool)

(assert (=> b!136712 (= c!25569 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) lt!71286)))))

(declare-fun d!42621 () Bool)

(declare-fun res!65597 () Bool)

(declare-fun e!89030 () Bool)

(assert (=> d!42621 (=> res!65597 e!89030)))

(assert (=> d!42621 (= res!65597 (bvsge lt!71286 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(assert (=> d!42621 (= (arrayNoDuplicates!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) lt!71286 lt!71264) e!89030)))

(declare-fun call!15054 () Bool)

(declare-fun bm!15051 () Bool)

(assert (=> bm!15051 (= call!15054 (arrayNoDuplicates!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (bvadd lt!71286 #b00000000000000000000000000000001) (ite c!25569 (Cons!1721 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) lt!71286) lt!71264) lt!71264)))))

(declare-fun b!136713 () Bool)

(assert (=> b!136713 (= e!89030 e!89033)))

(declare-fun res!65598 () Bool)

(assert (=> b!136713 (=> (not res!65598) (not e!89033))))

(assert (=> b!136713 (= res!65598 (not e!89031))))

(declare-fun res!65599 () Bool)

(assert (=> b!136713 (=> (not res!65599) (not e!89031))))

(assert (=> b!136713 (= res!65599 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) lt!71286)))))

(declare-fun b!136714 () Bool)

(assert (=> b!136714 (= e!89032 call!15054)))

(declare-fun b!136715 () Bool)

(assert (=> b!136715 (= e!89032 call!15054)))

(assert (= (and d!42621 (not res!65597)) b!136713))

(assert (= (and b!136713 res!65599) b!136711))

(assert (= (and b!136713 res!65598) b!136712))

(assert (= (and b!136712 c!25569) b!136715))

(assert (= (and b!136712 (not c!25569)) b!136714))

(assert (= (or b!136715 b!136714) bm!15051))

(declare-fun m!162963 () Bool)

(assert (=> b!136711 m!162963))

(assert (=> b!136711 m!162963))

(declare-fun m!162965 () Bool)

(assert (=> b!136711 m!162965))

(assert (=> b!136712 m!162963))

(assert (=> b!136712 m!162963))

(declare-fun m!162967 () Bool)

(assert (=> b!136712 m!162967))

(assert (=> bm!15051 m!162963))

(declare-fun m!162969 () Bool)

(assert (=> bm!15051 m!162969))

(assert (=> b!136713 m!162963))

(assert (=> b!136713 m!162963))

(assert (=> b!136713 m!162967))

(assert (=> d!42481 d!42621))

(declare-fun b!136716 () Bool)

(declare-fun e!89035 () Bool)

(declare-fun call!15055 () Bool)

(assert (=> b!136716 (= e!89035 call!15055)))

(declare-fun b!136717 () Bool)

(declare-fun e!89034 () Bool)

(assert (=> b!136717 (= e!89035 e!89034)))

(declare-fun lt!71477 () (_ BitVec 64))

(assert (=> b!136717 (= lt!71477 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!71476 () Unit!4275)

(assert (=> b!136717 (= lt!71476 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) lt!71477 #b00000000000000000000000000000000))))

(assert (=> b!136717 (arrayContainsKey!0 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) lt!71477 #b00000000000000000000000000000000)))

(declare-fun lt!71475 () Unit!4275)

(assert (=> b!136717 (= lt!71475 lt!71476)))

(declare-fun res!65601 () Bool)

(assert (=> b!136717 (= res!65601 (= (seekEntryOrOpen!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000) (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (mask!7203 newMap!16)) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!136717 (=> (not res!65601) (not e!89034))))

(declare-fun bm!15052 () Bool)

(assert (=> bm!15052 (= call!15055 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (mask!7203 newMap!16)))))

(declare-fun d!42623 () Bool)

(declare-fun res!65600 () Bool)

(declare-fun e!89036 () Bool)

(assert (=> d!42623 (=> res!65600 e!89036)))

(assert (=> d!42623 (= res!65600 (bvsge #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(assert (=> d!42623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (mask!7203 newMap!16)) e!89036)))

(declare-fun b!136718 () Bool)

(assert (=> b!136718 (= e!89036 e!89035)))

(declare-fun c!25570 () Bool)

(assert (=> b!136718 (= c!25570 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!136719 () Bool)

(assert (=> b!136719 (= e!89034 call!15055)))

(assert (= (and d!42623 (not res!65600)) b!136718))

(assert (= (and b!136718 c!25570) b!136717))

(assert (= (and b!136718 (not c!25570)) b!136716))

(assert (= (and b!136717 res!65601) b!136719))

(assert (= (or b!136719 b!136716) bm!15052))

(assert (=> b!136717 m!162921))

(declare-fun m!162971 () Bool)

(assert (=> b!136717 m!162971))

(declare-fun m!162973 () Bool)

(assert (=> b!136717 m!162973))

(assert (=> b!136717 m!162921))

(declare-fun m!162975 () Bool)

(assert (=> b!136717 m!162975))

(declare-fun m!162977 () Bool)

(assert (=> bm!15052 m!162977))

(assert (=> b!136718 m!162921))

(assert (=> b!136718 m!162921))

(assert (=> b!136718 m!162923))

(assert (=> d!42481 d!42623))

(declare-fun b!136720 () Bool)

(declare-fun e!89048 () ListLongMap!1715)

(declare-fun call!15057 () ListLongMap!1715)

(assert (=> b!136720 (= e!89048 call!15057)))

(declare-fun bm!15053 () Bool)

(declare-fun call!15058 () Bool)

(declare-fun lt!71492 () ListLongMap!1715)

(assert (=> bm!15053 (= call!15058 (contains!905 lt!71492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136721 () Bool)

(declare-fun e!89039 () Bool)

(declare-fun e!89044 () Bool)

(assert (=> b!136721 (= e!89039 e!89044)))

(declare-fun c!25573 () Bool)

(assert (=> b!136721 (= c!25573 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136722 () Bool)

(assert (=> b!136722 (= e!89044 (not call!15058))))

(declare-fun b!136723 () Bool)

(declare-fun c!25574 () Bool)

(assert (=> b!136723 (= c!25574 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89043 () ListLongMap!1715)

(assert (=> b!136723 (= e!89043 e!89048)))

(declare-fun call!15062 () ListLongMap!1715)

(declare-fun c!25576 () Bool)

(declare-fun c!25571 () Bool)

(declare-fun call!15059 () ListLongMap!1715)

(declare-fun bm!15054 () Bool)

(declare-fun call!15056 () ListLongMap!1715)

(declare-fun call!15061 () ListLongMap!1715)

(assert (=> bm!15054 (= call!15059 (+!176 (ite c!25571 call!15062 (ite c!25576 call!15061 call!15056)) (ite (or c!25571 c!25576) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!15055 () Bool)

(assert (=> bm!15055 (= call!15057 call!15059)))

(declare-fun bm!15056 () Bool)

(assert (=> bm!15056 (= call!15061 call!15062)))

(declare-fun b!136724 () Bool)

(declare-fun e!89037 () Unit!4275)

(declare-fun lt!71481 () Unit!4275)

(assert (=> b!136724 (= e!89037 lt!71481)))

(declare-fun lt!71498 () ListLongMap!1715)

(assert (=> b!136724 (= lt!71498 (getCurrentListMapNoExtraKeys!142 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71482 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71491 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71491 (select (arr!2273 lt!71268) #b00000000000000000000000000000000))))

(declare-fun lt!71485 () Unit!4275)

(assert (=> b!136724 (= lt!71485 (addStillContains!93 lt!71498 lt!71482 (zeroValue!2742 newMap!16) lt!71491))))

(assert (=> b!136724 (contains!905 (+!176 lt!71498 (tuple2!2643 lt!71482 (zeroValue!2742 newMap!16))) lt!71491)))

(declare-fun lt!71478 () Unit!4275)

(assert (=> b!136724 (= lt!71478 lt!71485)))

(declare-fun lt!71479 () ListLongMap!1715)

(assert (=> b!136724 (= lt!71479 (getCurrentListMapNoExtraKeys!142 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71497 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71497 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71499 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71499 (select (arr!2273 lt!71268) #b00000000000000000000000000000000))))

(declare-fun lt!71483 () Unit!4275)

(assert (=> b!136724 (= lt!71483 (addApplyDifferent!93 lt!71479 lt!71497 (minValue!2742 newMap!16) lt!71499))))

(assert (=> b!136724 (= (apply!117 (+!176 lt!71479 (tuple2!2643 lt!71497 (minValue!2742 newMap!16))) lt!71499) (apply!117 lt!71479 lt!71499))))

(declare-fun lt!71493 () Unit!4275)

(assert (=> b!136724 (= lt!71493 lt!71483)))

(declare-fun lt!71489 () ListLongMap!1715)

(assert (=> b!136724 (= lt!71489 (getCurrentListMapNoExtraKeys!142 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71484 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71488 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71488 (select (arr!2273 lt!71268) #b00000000000000000000000000000000))))

(declare-fun lt!71487 () Unit!4275)

(assert (=> b!136724 (= lt!71487 (addApplyDifferent!93 lt!71489 lt!71484 (zeroValue!2742 newMap!16) lt!71488))))

(assert (=> b!136724 (= (apply!117 (+!176 lt!71489 (tuple2!2643 lt!71484 (zeroValue!2742 newMap!16))) lt!71488) (apply!117 lt!71489 lt!71488))))

(declare-fun lt!71486 () Unit!4275)

(assert (=> b!136724 (= lt!71486 lt!71487)))

(declare-fun lt!71480 () ListLongMap!1715)

(assert (=> b!136724 (= lt!71480 (getCurrentListMapNoExtraKeys!142 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71494 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71494 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71495 () (_ BitVec 64))

(assert (=> b!136724 (= lt!71495 (select (arr!2273 lt!71268) #b00000000000000000000000000000000))))

(assert (=> b!136724 (= lt!71481 (addApplyDifferent!93 lt!71480 lt!71494 (minValue!2742 newMap!16) lt!71495))))

(assert (=> b!136724 (= (apply!117 (+!176 lt!71480 (tuple2!2643 lt!71494 (minValue!2742 newMap!16))) lt!71495) (apply!117 lt!71480 lt!71495))))

(declare-fun bm!15057 () Bool)

(assert (=> bm!15057 (= call!15062 (getCurrentListMapNoExtraKeys!142 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!136726 () Bool)

(declare-fun e!89045 () Bool)

(declare-fun e!89042 () Bool)

(assert (=> b!136726 (= e!89045 e!89042)))

(declare-fun res!65610 () Bool)

(assert (=> b!136726 (=> (not res!65610) (not e!89042))))

(assert (=> b!136726 (= res!65610 (contains!905 lt!71492 (select (arr!2273 lt!71268) #b00000000000000000000000000000000)))))

(assert (=> b!136726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 lt!71268)))))

(declare-fun b!136727 () Bool)

(declare-fun e!89049 () Bool)

(assert (=> b!136727 (= e!89044 e!89049)))

(declare-fun res!65604 () Bool)

(assert (=> b!136727 (= res!65604 call!15058)))

(assert (=> b!136727 (=> (not res!65604) (not e!89049))))

(declare-fun b!136728 () Bool)

(declare-fun res!65605 () Bool)

(assert (=> b!136728 (=> (not res!65605) (not e!89039))))

(declare-fun e!89038 () Bool)

(assert (=> b!136728 (= res!65605 e!89038)))

(declare-fun c!25575 () Bool)

(assert (=> b!136728 (= c!25575 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136729 () Bool)

(declare-fun Unit!4300 () Unit!4275)

(assert (=> b!136729 (= e!89037 Unit!4300)))

(declare-fun b!136730 () Bool)

(declare-fun e!89046 () Bool)

(assert (=> b!136730 (= e!89046 (= (apply!117 lt!71492 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun b!136731 () Bool)

(declare-fun e!89041 () Bool)

(assert (=> b!136731 (= e!89041 (validKeyInArray!0 (select (arr!2273 lt!71268) #b00000000000000000000000000000000)))))

(declare-fun b!136732 () Bool)

(declare-fun e!89047 () ListLongMap!1715)

(assert (=> b!136732 (= e!89047 (+!176 call!15059 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!136733 () Bool)

(assert (=> b!136733 (= e!89047 e!89043)))

(assert (=> b!136733 (= c!25576 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136734 () Bool)

(assert (=> b!136734 (= e!89038 e!89046)))

(declare-fun res!65606 () Bool)

(declare-fun call!15060 () Bool)

(assert (=> b!136734 (= res!65606 call!15060)))

(assert (=> b!136734 (=> (not res!65606) (not e!89046))))

(declare-fun b!136735 () Bool)

(declare-fun res!65602 () Bool)

(assert (=> b!136735 (=> (not res!65602) (not e!89039))))

(assert (=> b!136735 (= res!65602 e!89045)))

(declare-fun res!65609 () Bool)

(assert (=> b!136735 (=> res!65609 e!89045)))

(assert (=> b!136735 (= res!65609 (not e!89041))))

(declare-fun res!65607 () Bool)

(assert (=> b!136735 (=> (not res!65607) (not e!89041))))

(assert (=> b!136735 (= res!65607 (bvslt #b00000000000000000000000000000000 (size!2543 lt!71268)))))

(declare-fun b!136736 () Bool)

(declare-fun e!89040 () Bool)

(assert (=> b!136736 (= e!89040 (validKeyInArray!0 (select (arr!2273 lt!71268) #b00000000000000000000000000000000)))))

(declare-fun bm!15058 () Bool)

(assert (=> bm!15058 (= call!15056 call!15061)))

(declare-fun b!136737 () Bool)

(assert (=> b!136737 (= e!89038 (not call!15060))))

(declare-fun bm!15059 () Bool)

(assert (=> bm!15059 (= call!15060 (contains!905 lt!71492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42625 () Bool)

(assert (=> d!42625 e!89039))

(declare-fun res!65608 () Bool)

(assert (=> d!42625 (=> (not res!65608) (not e!89039))))

(assert (=> d!42625 (= res!65608 (or (bvsge #b00000000000000000000000000000000 (size!2543 lt!71268)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 lt!71268)))))))

(declare-fun lt!71490 () ListLongMap!1715)

(assert (=> d!42625 (= lt!71492 lt!71490)))

(declare-fun lt!71496 () Unit!4275)

(assert (=> d!42625 (= lt!71496 e!89037)))

(declare-fun c!25572 () Bool)

(assert (=> d!42625 (= c!25572 e!89040)))

(declare-fun res!65603 () Bool)

(assert (=> d!42625 (=> (not res!65603) (not e!89040))))

(assert (=> d!42625 (= res!65603 (bvslt #b00000000000000000000000000000000 (size!2543 lt!71268)))))

(assert (=> d!42625 (= lt!71490 e!89047)))

(assert (=> d!42625 (= c!25571 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42625 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42625 (= (getCurrentListMap!549 lt!71268 lt!71282 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71492)))

(declare-fun b!136725 () Bool)

(assert (=> b!136725 (= e!89048 call!15056)))

(declare-fun b!136738 () Bool)

(assert (=> b!136738 (= e!89049 (= (apply!117 lt!71492 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!136739 () Bool)

(assert (=> b!136739 (= e!89043 call!15057)))

(declare-fun b!136740 () Bool)

(assert (=> b!136740 (= e!89042 (= (apply!117 lt!71492 (select (arr!2273 lt!71268) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 lt!71282) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 lt!71282)))))

(assert (=> b!136740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 lt!71268)))))

(assert (= (and d!42625 c!25571) b!136732))

(assert (= (and d!42625 (not c!25571)) b!136733))

(assert (= (and b!136733 c!25576) b!136739))

(assert (= (and b!136733 (not c!25576)) b!136723))

(assert (= (and b!136723 c!25574) b!136720))

(assert (= (and b!136723 (not c!25574)) b!136725))

(assert (= (or b!136720 b!136725) bm!15058))

(assert (= (or b!136739 bm!15058) bm!15056))

(assert (= (or b!136739 b!136720) bm!15055))

(assert (= (or b!136732 bm!15056) bm!15057))

(assert (= (or b!136732 bm!15055) bm!15054))

(assert (= (and d!42625 res!65603) b!136736))

(assert (= (and d!42625 c!25572) b!136724))

(assert (= (and d!42625 (not c!25572)) b!136729))

(assert (= (and d!42625 res!65608) b!136735))

(assert (= (and b!136735 res!65607) b!136731))

(assert (= (and b!136735 (not res!65609)) b!136726))

(assert (= (and b!136726 res!65610) b!136740))

(assert (= (and b!136735 res!65602) b!136728))

(assert (= (and b!136728 c!25575) b!136734))

(assert (= (and b!136728 (not c!25575)) b!136737))

(assert (= (and b!136734 res!65606) b!136730))

(assert (= (or b!136734 b!136737) bm!15059))

(assert (= (and b!136728 res!65605) b!136721))

(assert (= (and b!136721 c!25573) b!136727))

(assert (= (and b!136721 (not c!25573)) b!136722))

(assert (= (and b!136727 res!65604) b!136738))

(assert (= (or b!136727 b!136722) bm!15053))

(declare-fun b_lambda!6107 () Bool)

(assert (=> (not b_lambda!6107) (not b!136740)))

(assert (=> b!136740 t!6219))

(declare-fun b_and!8467 () Bool)

(assert (= b_and!8463 (and (=> t!6219 result!4047) b_and!8467)))

(assert (=> b!136740 t!6221))

(declare-fun b_and!8469 () Bool)

(assert (= b_and!8465 (and (=> t!6221 result!4049) b_and!8469)))

(declare-fun m!162979 () Bool)

(assert (=> b!136732 m!162979))

(declare-fun m!162981 () Bool)

(assert (=> b!136724 m!162981))

(declare-fun m!162983 () Bool)

(assert (=> b!136724 m!162983))

(declare-fun m!162985 () Bool)

(assert (=> b!136724 m!162985))

(declare-fun m!162987 () Bool)

(assert (=> b!136724 m!162987))

(declare-fun m!162989 () Bool)

(assert (=> b!136724 m!162989))

(assert (=> b!136724 m!162981))

(declare-fun m!162991 () Bool)

(assert (=> b!136724 m!162991))

(declare-fun m!162993 () Bool)

(assert (=> b!136724 m!162993))

(declare-fun m!162995 () Bool)

(assert (=> b!136724 m!162995))

(assert (=> b!136724 m!162987))

(declare-fun m!162997 () Bool)

(assert (=> b!136724 m!162997))

(declare-fun m!162999 () Bool)

(assert (=> b!136724 m!162999))

(declare-fun m!163001 () Bool)

(assert (=> b!136724 m!163001))

(declare-fun m!163003 () Bool)

(assert (=> b!136724 m!163003))

(declare-fun m!163005 () Bool)

(assert (=> b!136724 m!163005))

(assert (=> b!136724 m!162999))

(declare-fun m!163007 () Bool)

(assert (=> b!136724 m!163007))

(declare-fun m!163009 () Bool)

(assert (=> b!136724 m!163009))

(assert (=> b!136724 m!162993))

(declare-fun m!163011 () Bool)

(assert (=> b!136724 m!163011))

(declare-fun m!163013 () Bool)

(assert (=> b!136724 m!163013))

(assert (=> b!136726 m!163003))

(assert (=> b!136726 m!163003))

(declare-fun m!163015 () Bool)

(assert (=> b!136726 m!163015))

(assert (=> b!136731 m!163003))

(assert (=> b!136731 m!163003))

(declare-fun m!163017 () Bool)

(assert (=> b!136731 m!163017))

(declare-fun m!163019 () Bool)

(assert (=> b!136730 m!163019))

(declare-fun m!163021 () Bool)

(assert (=> b!136740 m!163021))

(assert (=> b!136740 m!163021))

(assert (=> b!136740 m!162347))

(declare-fun m!163023 () Bool)

(assert (=> b!136740 m!163023))

(assert (=> b!136740 m!163003))

(assert (=> b!136740 m!162347))

(assert (=> b!136740 m!163003))

(declare-fun m!163025 () Bool)

(assert (=> b!136740 m!163025))

(declare-fun m!163027 () Bool)

(assert (=> bm!15059 m!163027))

(declare-fun m!163029 () Bool)

(assert (=> bm!15054 m!163029))

(declare-fun m!163031 () Bool)

(assert (=> bm!15053 m!163031))

(assert (=> d!42625 m!162297))

(assert (=> bm!15057 m!163007))

(declare-fun m!163033 () Bool)

(assert (=> b!136738 m!163033))

(assert (=> b!136736 m!163003))

(assert (=> b!136736 m!163003))

(assert (=> b!136736 m!163017))

(assert (=> d!42481 d!42625))

(declare-fun b!136741 () Bool)

(declare-fun e!89061 () ListLongMap!1715)

(declare-fun call!15064 () ListLongMap!1715)

(assert (=> b!136741 (= e!89061 call!15064)))

(declare-fun bm!15060 () Bool)

(declare-fun call!15065 () Bool)

(declare-fun lt!71514 () ListLongMap!1715)

(assert (=> bm!15060 (= call!15065 (contains!905 lt!71514 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136742 () Bool)

(declare-fun e!89052 () Bool)

(declare-fun e!89057 () Bool)

(assert (=> b!136742 (= e!89052 e!89057)))

(declare-fun c!25579 () Bool)

(assert (=> b!136742 (= c!25579 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136743 () Bool)

(assert (=> b!136743 (= e!89057 (not call!15065))))

(declare-fun b!136744 () Bool)

(declare-fun c!25580 () Bool)

(assert (=> b!136744 (= c!25580 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89056 () ListLongMap!1715)

(assert (=> b!136744 (= e!89056 e!89061)))

(declare-fun call!15069 () ListLongMap!1715)

(declare-fun bm!15061 () Bool)

(declare-fun call!15063 () ListLongMap!1715)

(declare-fun call!15068 () ListLongMap!1715)

(declare-fun call!15066 () ListLongMap!1715)

(declare-fun c!25582 () Bool)

(declare-fun c!25577 () Bool)

(assert (=> bm!15061 (= call!15066 (+!176 (ite c!25577 call!15069 (ite c!25582 call!15068 call!15063)) (ite (or c!25577 c!25582) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!15062 () Bool)

(assert (=> bm!15062 (= call!15064 call!15066)))

(declare-fun bm!15063 () Bool)

(assert (=> bm!15063 (= call!15068 call!15069)))

(declare-fun b!136745 () Bool)

(declare-fun e!89050 () Unit!4275)

(declare-fun lt!71503 () Unit!4275)

(assert (=> b!136745 (= e!89050 lt!71503)))

(declare-fun lt!71520 () ListLongMap!1715)

(assert (=> b!136745 (= lt!71520 (getCurrentListMapNoExtraKeys!142 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71504 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71513 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71513 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!71507 () Unit!4275)

(assert (=> b!136745 (= lt!71507 (addStillContains!93 lt!71520 lt!71504 (zeroValue!2742 newMap!16) lt!71513))))

(assert (=> b!136745 (contains!905 (+!176 lt!71520 (tuple2!2643 lt!71504 (zeroValue!2742 newMap!16))) lt!71513)))

(declare-fun lt!71500 () Unit!4275)

(assert (=> b!136745 (= lt!71500 lt!71507)))

(declare-fun lt!71501 () ListLongMap!1715)

(assert (=> b!136745 (= lt!71501 (getCurrentListMapNoExtraKeys!142 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71519 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71521 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71521 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!71505 () Unit!4275)

(assert (=> b!136745 (= lt!71505 (addApplyDifferent!93 lt!71501 lt!71519 (minValue!2742 newMap!16) lt!71521))))

(assert (=> b!136745 (= (apply!117 (+!176 lt!71501 (tuple2!2643 lt!71519 (minValue!2742 newMap!16))) lt!71521) (apply!117 lt!71501 lt!71521))))

(declare-fun lt!71515 () Unit!4275)

(assert (=> b!136745 (= lt!71515 lt!71505)))

(declare-fun lt!71511 () ListLongMap!1715)

(assert (=> b!136745 (= lt!71511 (getCurrentListMapNoExtraKeys!142 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71506 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71510 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71510 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!71509 () Unit!4275)

(assert (=> b!136745 (= lt!71509 (addApplyDifferent!93 lt!71511 lt!71506 (zeroValue!2742 newMap!16) lt!71510))))

(assert (=> b!136745 (= (apply!117 (+!176 lt!71511 (tuple2!2643 lt!71506 (zeroValue!2742 newMap!16))) lt!71510) (apply!117 lt!71511 lt!71510))))

(declare-fun lt!71508 () Unit!4275)

(assert (=> b!136745 (= lt!71508 lt!71509)))

(declare-fun lt!71502 () ListLongMap!1715)

(assert (=> b!136745 (= lt!71502 (getCurrentListMapNoExtraKeys!142 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71516 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71516 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71517 () (_ BitVec 64))

(assert (=> b!136745 (= lt!71517 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!136745 (= lt!71503 (addApplyDifferent!93 lt!71502 lt!71516 (minValue!2742 newMap!16) lt!71517))))

(assert (=> b!136745 (= (apply!117 (+!176 lt!71502 (tuple2!2643 lt!71516 (minValue!2742 newMap!16))) lt!71517) (apply!117 lt!71502 lt!71517))))

(declare-fun bm!15064 () Bool)

(assert (=> bm!15064 (= call!15069 (getCurrentListMapNoExtraKeys!142 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!136747 () Bool)

(declare-fun e!89058 () Bool)

(declare-fun e!89055 () Bool)

(assert (=> b!136747 (= e!89058 e!89055)))

(declare-fun res!65619 () Bool)

(assert (=> b!136747 (=> (not res!65619) (not e!89055))))

(assert (=> b!136747 (= res!65619 (contains!905 lt!71514 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!136747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun b!136748 () Bool)

(declare-fun e!89062 () Bool)

(assert (=> b!136748 (= e!89057 e!89062)))

(declare-fun res!65613 () Bool)

(assert (=> b!136748 (= res!65613 call!15065)))

(assert (=> b!136748 (=> (not res!65613) (not e!89062))))

(declare-fun b!136749 () Bool)

(declare-fun res!65614 () Bool)

(assert (=> b!136749 (=> (not res!65614) (not e!89052))))

(declare-fun e!89051 () Bool)

(assert (=> b!136749 (= res!65614 e!89051)))

(declare-fun c!25581 () Bool)

(assert (=> b!136749 (= c!25581 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!136750 () Bool)

(declare-fun Unit!4301 () Unit!4275)

(assert (=> b!136750 (= e!89050 Unit!4301)))

(declare-fun b!136751 () Bool)

(declare-fun e!89059 () Bool)

(assert (=> b!136751 (= e!89059 (= (apply!117 lt!71514 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun e!89054 () Bool)

(declare-fun b!136752 () Bool)

(assert (=> b!136752 (= e!89054 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!136753 () Bool)

(declare-fun e!89060 () ListLongMap!1715)

(assert (=> b!136753 (= e!89060 (+!176 call!15066 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!136754 () Bool)

(assert (=> b!136754 (= e!89060 e!89056)))

(assert (=> b!136754 (= c!25582 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!136755 () Bool)

(assert (=> b!136755 (= e!89051 e!89059)))

(declare-fun res!65615 () Bool)

(declare-fun call!15067 () Bool)

(assert (=> b!136755 (= res!65615 call!15067)))

(assert (=> b!136755 (=> (not res!65615) (not e!89059))))

(declare-fun b!136756 () Bool)

(declare-fun res!65611 () Bool)

(assert (=> b!136756 (=> (not res!65611) (not e!89052))))

(assert (=> b!136756 (= res!65611 e!89058)))

(declare-fun res!65618 () Bool)

(assert (=> b!136756 (=> res!65618 e!89058)))

(assert (=> b!136756 (= res!65618 (not e!89054))))

(declare-fun res!65616 () Bool)

(assert (=> b!136756 (=> (not res!65616) (not e!89054))))

(assert (=> b!136756 (= res!65616 (bvslt #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun e!89053 () Bool)

(declare-fun b!136757 () Bool)

(assert (=> b!136757 (= e!89053 (validKeyInArray!0 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!15065 () Bool)

(assert (=> bm!15065 (= call!15063 call!15068)))

(declare-fun b!136758 () Bool)

(assert (=> b!136758 (= e!89051 (not call!15067))))

(declare-fun bm!15066 () Bool)

(assert (=> bm!15066 (= call!15067 (contains!905 lt!71514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42627 () Bool)

(assert (=> d!42627 e!89052))

(declare-fun res!65617 () Bool)

(assert (=> d!42627 (=> (not res!65617) (not e!89052))))

(assert (=> d!42627 (= res!65617 (or (bvsge #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))))

(declare-fun lt!71512 () ListLongMap!1715)

(assert (=> d!42627 (= lt!71514 lt!71512)))

(declare-fun lt!71518 () Unit!4275)

(assert (=> d!42627 (= lt!71518 e!89050)))

(declare-fun c!25578 () Bool)

(assert (=> d!42627 (= c!25578 e!89053)))

(declare-fun res!65612 () Bool)

(assert (=> d!42627 (=> (not res!65612) (not e!89053))))

(assert (=> d!42627 (= res!65612 (bvslt #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(assert (=> d!42627 (= lt!71512 e!89060)))

(assert (=> d!42627 (= c!25577 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42627 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42627 (= (getCurrentListMap!549 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71514)))

(declare-fun b!136746 () Bool)

(assert (=> b!136746 (= e!89061 call!15063)))

(declare-fun b!136759 () Bool)

(assert (=> b!136759 (= e!89062 (= (apply!117 lt!71514 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!136760 () Bool)

(assert (=> b!136760 (= e!89056 call!15064)))

(declare-fun b!136761 () Bool)

(assert (=> b!136761 (= e!89055 (= (apply!117 lt!71514 (select (arr!2273 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16)))) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))))))))

(assert (=> b!136761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (array!4808 (store (arr!2273 (_keys!4642 newMap!16)) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (size!2543 (_keys!4642 newMap!16))))))))

(assert (= (and d!42627 c!25577) b!136753))

(assert (= (and d!42627 (not c!25577)) b!136754))

(assert (= (and b!136754 c!25582) b!136760))

(assert (= (and b!136754 (not c!25582)) b!136744))

(assert (= (and b!136744 c!25580) b!136741))

(assert (= (and b!136744 (not c!25580)) b!136746))

(assert (= (or b!136741 b!136746) bm!15065))

(assert (= (or b!136760 bm!15065) bm!15063))

(assert (= (or b!136760 b!136741) bm!15062))

(assert (= (or b!136753 bm!15063) bm!15064))

(assert (= (or b!136753 bm!15062) bm!15061))

(assert (= (and d!42627 res!65612) b!136757))

(assert (= (and d!42627 c!25578) b!136745))

(assert (= (and d!42627 (not c!25578)) b!136750))

(assert (= (and d!42627 res!65617) b!136756))

(assert (= (and b!136756 res!65616) b!136752))

(assert (= (and b!136756 (not res!65618)) b!136747))

(assert (= (and b!136747 res!65619) b!136761))

(assert (= (and b!136756 res!65611) b!136749))

(assert (= (and b!136749 c!25581) b!136755))

(assert (= (and b!136749 (not c!25581)) b!136758))

(assert (= (and b!136755 res!65615) b!136751))

(assert (= (or b!136755 b!136758) bm!15066))

(assert (= (and b!136749 res!65614) b!136742))

(assert (= (and b!136742 c!25579) b!136748))

(assert (= (and b!136742 (not c!25579)) b!136743))

(assert (= (and b!136748 res!65613) b!136759))

(assert (= (or b!136748 b!136743) bm!15060))

(declare-fun b_lambda!6109 () Bool)

(assert (=> (not b_lambda!6109) (not b!136761)))

(assert (=> b!136761 t!6219))

(declare-fun b_and!8471 () Bool)

(assert (= b_and!8467 (and (=> t!6219 result!4047) b_and!8471)))

(assert (=> b!136761 t!6221))

(declare-fun b_and!8473 () Bool)

(assert (= b_and!8469 (and (=> t!6221 result!4049) b_and!8473)))

(declare-fun m!163035 () Bool)

(assert (=> b!136753 m!163035))

(declare-fun m!163037 () Bool)

(assert (=> b!136745 m!163037))

(declare-fun m!163039 () Bool)

(assert (=> b!136745 m!163039))

(declare-fun m!163041 () Bool)

(assert (=> b!136745 m!163041))

(declare-fun m!163043 () Bool)

(assert (=> b!136745 m!163043))

(declare-fun m!163045 () Bool)

(assert (=> b!136745 m!163045))

(assert (=> b!136745 m!163037))

(declare-fun m!163047 () Bool)

(assert (=> b!136745 m!163047))

(declare-fun m!163049 () Bool)

(assert (=> b!136745 m!163049))

(declare-fun m!163051 () Bool)

(assert (=> b!136745 m!163051))

(assert (=> b!136745 m!163043))

(declare-fun m!163053 () Bool)

(assert (=> b!136745 m!163053))

(declare-fun m!163055 () Bool)

(assert (=> b!136745 m!163055))

(declare-fun m!163057 () Bool)

(assert (=> b!136745 m!163057))

(assert (=> b!136745 m!162921))

(declare-fun m!163059 () Bool)

(assert (=> b!136745 m!163059))

(assert (=> b!136745 m!163055))

(declare-fun m!163061 () Bool)

(assert (=> b!136745 m!163061))

(declare-fun m!163063 () Bool)

(assert (=> b!136745 m!163063))

(assert (=> b!136745 m!163049))

(declare-fun m!163065 () Bool)

(assert (=> b!136745 m!163065))

(declare-fun m!163067 () Bool)

(assert (=> b!136745 m!163067))

(assert (=> b!136747 m!162921))

(assert (=> b!136747 m!162921))

(declare-fun m!163069 () Bool)

(assert (=> b!136747 m!163069))

(assert (=> b!136752 m!162921))

(assert (=> b!136752 m!162921))

(assert (=> b!136752 m!162923))

(declare-fun m!163071 () Bool)

(assert (=> b!136751 m!163071))

(declare-fun m!163073 () Bool)

(assert (=> b!136761 m!163073))

(assert (=> b!136761 m!163073))

(assert (=> b!136761 m!162347))

(declare-fun m!163075 () Bool)

(assert (=> b!136761 m!163075))

(assert (=> b!136761 m!162921))

(assert (=> b!136761 m!162347))

(assert (=> b!136761 m!162921))

(declare-fun m!163077 () Bool)

(assert (=> b!136761 m!163077))

(declare-fun m!163079 () Bool)

(assert (=> bm!15066 m!163079))

(declare-fun m!163081 () Bool)

(assert (=> bm!15061 m!163081))

(declare-fun m!163083 () Bool)

(assert (=> bm!15060 m!163083))

(assert (=> d!42627 m!162297))

(assert (=> bm!15064 m!163061))

(declare-fun m!163085 () Bool)

(assert (=> b!136759 m!163085))

(assert (=> b!136757 m!162921))

(assert (=> b!136757 m!162921))

(assert (=> b!136757 m!162923))

(assert (=> d!42481 d!42627))

(declare-fun d!42629 () Bool)

(assert (=> d!42629 (= (arrayCountValidKeys!0 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (bvadd (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!71524 () Unit!4275)

(declare-fun choose!2 (array!4807 (_ BitVec 32)) Unit!4275)

(assert (=> d!42629 (= lt!71524 (choose!2 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))))))

(declare-fun e!89065 () Bool)

(assert (=> d!42629 e!89065))

(declare-fun res!65624 () Bool)

(assert (=> d!42629 (=> (not res!65624) (not e!89065))))

(assert (=> d!42629 (= res!65624 (and (bvsge (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) #b00000000000000000000000000000000) (bvslt (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)) (size!2543 lt!71283))))))

(assert (=> d!42629 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!71283 (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036))) lt!71524)))

(declare-fun b!136766 () Bool)

(declare-fun res!65625 () Bool)

(assert (=> b!136766 (=> (not res!65625) (not e!89065))))

(assert (=> b!136766 (= res!65625 (validKeyInArray!0 (select (arr!2273 lt!71283) (ite c!25430 (index!3268 lt!71036) (index!3265 lt!71036)))))))

(declare-fun b!136767 () Bool)

(assert (=> b!136767 (= e!89065 (bvslt (size!2543 lt!71283) #b01111111111111111111111111111111))))

(assert (= (and d!42629 res!65624) b!136766))

(assert (= (and b!136766 res!65625) b!136767))

(assert (=> d!42629 m!162509))

(declare-fun m!163087 () Bool)

(assert (=> d!42629 m!163087))

(assert (=> b!136766 m!162913))

(assert (=> b!136766 m!162913))

(assert (=> b!136766 m!162915))

(assert (=> d!42481 d!42629))

(declare-fun d!42631 () Bool)

(assert (=> d!42631 (= (apply!117 lt!71143 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1497 (getValueByKey!173 (toList!873 lt!71143) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5725 () Bool)

(assert (= bs!5725 d!42631))

(assert (=> bs!5725 m!162327))

(declare-fun m!163089 () Bool)

(assert (=> bs!5725 m!163089))

(assert (=> bs!5725 m!163089))

(declare-fun m!163091 () Bool)

(assert (=> bs!5725 m!163091))

(assert (=> b!136308 d!42631))

(declare-fun c!25583 () Bool)

(declare-fun d!42633 () Bool)

(assert (=> d!42633 (= c!25583 ((_ is ValueCellFull!1101) (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun e!89066 () V!3499)

(assert (=> d!42633 (= (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!89066)))

(declare-fun b!136768 () Bool)

(assert (=> b!136768 (= e!89066 (get!1495 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136769 () Bool)

(assert (=> b!136769 (= e!89066 (get!1496 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42633 c!25583) b!136768))

(assert (= (and d!42633 (not c!25583)) b!136769))

(assert (=> b!136768 m!162345))

(assert (=> b!136768 m!162347))

(declare-fun m!163093 () Bool)

(assert (=> b!136768 m!163093))

(assert (=> b!136769 m!162345))

(assert (=> b!136769 m!162347))

(declare-fun m!163095 () Bool)

(assert (=> b!136769 m!163095))

(assert (=> b!136308 d!42633))

(declare-fun d!42635 () Bool)

(assert (=> d!42635 (= (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71122)) (v!3225 (getValueByKey!173 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71122)))))

(assert (=> d!42525 d!42635))

(declare-fun b!136770 () Bool)

(declare-fun e!89067 () Option!179)

(assert (=> b!136770 (= e!89067 (Some!178 (_2!1332 (h!2325 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun d!42637 () Bool)

(declare-fun c!25584 () Bool)

(assert (=> d!42637 (= c!25584 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71122)))))

(assert (=> d!42637 (= (getValueByKey!173 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71122) e!89067)))

(declare-fun b!136771 () Bool)

(declare-fun e!89068 () Option!179)

(assert (=> b!136771 (= e!89067 e!89068)))

(declare-fun c!25585 () Bool)

(assert (=> b!136771 (= c!25585 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (not (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71122))))))

(declare-fun b!136772 () Bool)

(assert (=> b!136772 (= e!89068 (getValueByKey!173 (t!6211 (toList!873 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71122))))

(declare-fun b!136773 () Bool)

(assert (=> b!136773 (= e!89068 None!177)))

(assert (= (and d!42637 c!25584) b!136770))

(assert (= (and d!42637 (not c!25584)) b!136771))

(assert (= (and b!136771 c!25585) b!136772))

(assert (= (and b!136771 (not c!25585)) b!136773))

(declare-fun m!163097 () Bool)

(assert (=> b!136772 m!163097))

(assert (=> d!42525 d!42637))

(declare-fun d!42639 () Bool)

(assert (=> d!42639 (= (apply!117 lt!71176 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1497 (getValueByKey!173 (toList!873 lt!71176) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5726 () Bool)

(assert (= bs!5726 d!42639))

(assert (=> bs!5726 m!162327))

(declare-fun m!163099 () Bool)

(assert (=> bs!5726 m!163099))

(assert (=> bs!5726 m!163099))

(declare-fun m!163101 () Bool)

(assert (=> bs!5726 m!163101))

(assert (=> b!136338 d!42639))

(declare-fun d!42641 () Bool)

(declare-fun c!25586 () Bool)

(assert (=> d!42641 (= c!25586 ((_ is ValueCellFull!1101) (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!89069 () V!3499)

(assert (=> d!42641 (= (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!89069)))

(declare-fun b!136774 () Bool)

(assert (=> b!136774 (= e!89069 (get!1495 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136775 () Bool)

(assert (=> b!136775 (= e!89069 (get!1496 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42641 c!25586) b!136774))

(assert (= (and d!42641 (not c!25586)) b!136775))

(assert (=> b!136774 m!162419))

(assert (=> b!136774 m!162347))

(declare-fun m!163103 () Bool)

(assert (=> b!136774 m!163103))

(assert (=> b!136775 m!162419))

(assert (=> b!136775 m!162347))

(declare-fun m!163105 () Bool)

(assert (=> b!136775 m!163105))

(assert (=> b!136338 d!42641))

(declare-fun d!42643 () Bool)

(declare-fun e!89070 () Bool)

(assert (=> d!42643 e!89070))

(declare-fun res!65626 () Bool)

(assert (=> d!42643 (=> res!65626 e!89070)))

(declare-fun lt!71527 () Bool)

(assert (=> d!42643 (= res!65626 (not lt!71527))))

(declare-fun lt!71525 () Bool)

(assert (=> d!42643 (= lt!71527 lt!71525)))

(declare-fun lt!71528 () Unit!4275)

(declare-fun e!89071 () Unit!4275)

(assert (=> d!42643 (= lt!71528 e!89071)))

(declare-fun c!25587 () Bool)

(assert (=> d!42643 (= c!25587 lt!71525)))

(assert (=> d!42643 (= lt!71525 (containsKey!177 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42643 (= (contains!905 lt!71304 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71527)))

(declare-fun b!136776 () Bool)

(declare-fun lt!71526 () Unit!4275)

(assert (=> b!136776 (= e!89071 lt!71526)))

(assert (=> b!136776 (= lt!71526 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!136776 (isDefined!126 (getValueByKey!173 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136777 () Bool)

(declare-fun Unit!4302 () Unit!4275)

(assert (=> b!136777 (= e!89071 Unit!4302)))

(declare-fun b!136778 () Bool)

(assert (=> b!136778 (= e!89070 (isDefined!126 (getValueByKey!173 (toList!873 lt!71304) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (= (and d!42643 c!25587) b!136776))

(assert (= (and d!42643 (not c!25587)) b!136777))

(assert (= (and d!42643 (not res!65626)) b!136778))

(declare-fun m!163107 () Bool)

(assert (=> d!42643 m!163107))

(declare-fun m!163109 () Bool)

(assert (=> b!136776 m!163109))

(assert (=> b!136776 m!162549))

(assert (=> b!136776 m!162549))

(declare-fun m!163111 () Bool)

(assert (=> b!136776 m!163111))

(assert (=> b!136778 m!162549))

(assert (=> b!136778 m!162549))

(assert (=> b!136778 m!163111))

(assert (=> d!42485 d!42643))

(declare-fun b!136779 () Bool)

(declare-fun e!89072 () Option!179)

(assert (=> b!136779 (= e!89072 (Some!178 (_2!1332 (h!2325 lt!71303))))))

(declare-fun d!42645 () Bool)

(declare-fun c!25588 () Bool)

(assert (=> d!42645 (= c!25588 (and ((_ is Cons!1719) lt!71303) (= (_1!1332 (h!2325 lt!71303)) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (=> d!42645 (= (getValueByKey!173 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) e!89072)))

(declare-fun b!136780 () Bool)

(declare-fun e!89073 () Option!179)

(assert (=> b!136780 (= e!89072 e!89073)))

(declare-fun c!25589 () Bool)

(assert (=> b!136780 (= c!25589 (and ((_ is Cons!1719) lt!71303) (not (= (_1!1332 (h!2325 lt!71303)) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun b!136781 () Bool)

(assert (=> b!136781 (= e!89073 (getValueByKey!173 (t!6211 lt!71303) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136782 () Bool)

(assert (=> b!136782 (= e!89073 None!177)))

(assert (= (and d!42645 c!25588) b!136779))

(assert (= (and d!42645 (not c!25588)) b!136780))

(assert (= (and b!136780 c!25589) b!136781))

(assert (= (and b!136780 (not c!25589)) b!136782))

(declare-fun m!163113 () Bool)

(assert (=> b!136781 m!163113))

(assert (=> d!42485 d!42645))

(declare-fun d!42647 () Bool)

(assert (=> d!42647 (= (getValueByKey!173 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (Some!178 (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun lt!71531 () Unit!4275)

(declare-fun choose!841 (List!1723 (_ BitVec 64) V!3499) Unit!4275)

(assert (=> d!42647 (= lt!71531 (choose!841 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun e!89076 () Bool)

(assert (=> d!42647 e!89076))

(declare-fun res!65631 () Bool)

(assert (=> d!42647 (=> (not res!65631) (not e!89076))))

(assert (=> d!42647 (= res!65631 (isStrictlySorted!323 lt!71303))))

(assert (=> d!42647 (= (lemmaContainsTupThenGetReturnValue!88 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71531)))

(declare-fun b!136787 () Bool)

(declare-fun res!65632 () Bool)

(assert (=> b!136787 (=> (not res!65632) (not e!89076))))

(assert (=> b!136787 (= res!65632 (containsKey!177 lt!71303 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136788 () Bool)

(assert (=> b!136788 (= e!89076 (contains!907 lt!71303 (tuple2!2643 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (= (and d!42647 res!65631) b!136787))

(assert (= (and b!136787 res!65632) b!136788))

(assert (=> d!42647 m!162543))

(declare-fun m!163115 () Bool)

(assert (=> d!42647 m!163115))

(declare-fun m!163117 () Bool)

(assert (=> d!42647 m!163117))

(declare-fun m!163119 () Bool)

(assert (=> b!136787 m!163119))

(declare-fun m!163121 () Bool)

(assert (=> b!136788 m!163121))

(assert (=> d!42485 d!42647))

(declare-fun bm!15073 () Bool)

(declare-fun call!15076 () List!1723)

(declare-fun call!15078 () List!1723)

(assert (=> bm!15073 (= call!15076 call!15078)))

(declare-fun b!136809 () Bool)

(declare-fun e!89089 () List!1723)

(declare-fun call!15077 () List!1723)

(assert (=> b!136809 (= e!89089 call!15077)))

(declare-fun b!136810 () Bool)

(declare-fun e!89088 () List!1723)

(assert (=> b!136810 (= e!89088 call!15076)))

(declare-fun b!136811 () Bool)

(declare-fun e!89091 () List!1723)

(assert (=> b!136811 (= e!89091 call!15078)))

(declare-fun b!136812 () Bool)

(declare-fun e!89087 () List!1723)

(declare-fun c!25599 () Bool)

(declare-fun c!25598 () Bool)

(assert (=> b!136812 (= e!89087 (ite c!25599 (t!6211 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (ite c!25598 (Cons!1719 (h!2325 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (t!6211 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))))) Nil!1720)))))

(declare-fun lt!71534 () List!1723)

(declare-fun e!89090 () Bool)

(declare-fun b!136813 () Bool)

(assert (=> b!136813 (= e!89090 (contains!907 lt!71534 (tuple2!2643 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun bm!15074 () Bool)

(assert (=> bm!15074 (= call!15078 call!15077)))

(declare-fun bm!15075 () Bool)

(declare-fun c!25600 () Bool)

(declare-fun $colon$colon!93 (List!1723 tuple2!2642) List!1723)

(assert (=> bm!15075 (= call!15077 ($colon$colon!93 e!89087 (ite c!25600 (h!2325 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (tuple2!2643 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun c!25601 () Bool)

(assert (=> bm!15075 (= c!25601 c!25600)))

(declare-fun b!136814 () Bool)

(assert (=> b!136814 (= e!89087 (insertStrictlySorted!91 (t!6211 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun d!42649 () Bool)

(assert (=> d!42649 e!89090))

(declare-fun res!65637 () Bool)

(assert (=> d!42649 (=> (not res!65637) (not e!89090))))

(assert (=> d!42649 (= res!65637 (isStrictlySorted!323 lt!71534))))

(assert (=> d!42649 (= lt!71534 e!89089)))

(assert (=> d!42649 (= c!25600 (and ((_ is Cons!1719) (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (bvslt (_1!1332 (h!2325 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (=> d!42649 (isStrictlySorted!323 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))))))

(assert (=> d!42649 (= (insertStrictlySorted!91 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (_2!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71534)))

(declare-fun b!136815 () Bool)

(assert (=> b!136815 (= c!25598 (and ((_ is Cons!1719) (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (bvsgt (_1!1332 (h!2325 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(assert (=> b!136815 (= e!89091 e!89088)))

(declare-fun b!136816 () Bool)

(declare-fun res!65638 () Bool)

(assert (=> b!136816 (=> (not res!65638) (not e!89090))))

(assert (=> b!136816 (= res!65638 (containsKey!177 lt!71534 (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136817 () Bool)

(assert (=> b!136817 (= e!89089 e!89091)))

(assert (=> b!136817 (= c!25599 (and ((_ is Cons!1719) (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992)))) (= (_1!1332 (h!2325 (toList!873 (ite c!25457 call!14998 (ite c!25462 call!14997 call!14992))))) (_1!1332 (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!136818 () Bool)

(assert (=> b!136818 (= e!89088 call!15076)))

(assert (= (and d!42649 c!25600) b!136809))

(assert (= (and d!42649 (not c!25600)) b!136817))

(assert (= (and b!136817 c!25599) b!136811))

(assert (= (and b!136817 (not c!25599)) b!136815))

(assert (= (and b!136815 c!25598) b!136818))

(assert (= (and b!136815 (not c!25598)) b!136810))

(assert (= (or b!136818 b!136810) bm!15073))

(assert (= (or b!136811 bm!15073) bm!15074))

(assert (= (or b!136809 bm!15074) bm!15075))

(assert (= (and bm!15075 c!25601) b!136814))

(assert (= (and bm!15075 (not c!25601)) b!136812))

(assert (= (and d!42649 res!65637) b!136816))

(assert (= (and b!136816 res!65638) b!136813))

(declare-fun m!163123 () Bool)

(assert (=> b!136814 m!163123))

(declare-fun m!163125 () Bool)

(assert (=> bm!15075 m!163125))

(declare-fun m!163127 () Bool)

(assert (=> d!42649 m!163127))

(declare-fun m!163129 () Bool)

(assert (=> d!42649 m!163129))

(declare-fun m!163131 () Bool)

(assert (=> b!136816 m!163131))

(declare-fun m!163133 () Bool)

(assert (=> b!136813 m!163133))

(assert (=> d!42485 d!42649))

(declare-fun d!42651 () Bool)

(assert (=> d!42651 (= (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!136567 d!42651))

(assert (=> d!42465 d!42589))

(declare-fun d!42653 () Bool)

(declare-fun res!65639 () Bool)

(declare-fun e!89092 () Bool)

(assert (=> d!42653 (=> res!65639 e!89092)))

(assert (=> d!42653 (= res!65639 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42653 (= (containsKey!177 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000) e!89092)))

(declare-fun b!136819 () Bool)

(declare-fun e!89093 () Bool)

(assert (=> b!136819 (= e!89092 e!89093)))

(declare-fun res!65640 () Bool)

(assert (=> b!136819 (=> (not res!65640) (not e!89093))))

(assert (=> b!136819 (= res!65640 (and (or (not ((_ is Cons!1719) (toList!873 lt!71115))) (bvsle (_1!1332 (h!2325 (toList!873 lt!71115))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1719) (toList!873 lt!71115)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136820 () Bool)

(assert (=> b!136820 (= e!89093 (containsKey!177 (t!6211 (toList!873 lt!71115)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!42653 (not res!65639)) b!136819))

(assert (= (and b!136819 res!65640) b!136820))

(declare-fun m!163135 () Bool)

(assert (=> b!136820 m!163135))

(assert (=> d!42463 d!42653))

(assert (=> b!136611 d!42651))

(declare-fun d!42655 () Bool)

(declare-fun res!65641 () Bool)

(declare-fun e!89094 () Bool)

(assert (=> d!42655 (=> res!65641 e!89094)))

(assert (=> d!42655 (= res!65641 (and ((_ is Cons!1719) (toList!873 call!14970)) (= (_1!1332 (h!2325 (toList!873 call!14970))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42655 (= (containsKey!177 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89094)))

(declare-fun b!136821 () Bool)

(declare-fun e!89095 () Bool)

(assert (=> b!136821 (= e!89094 e!89095)))

(declare-fun res!65642 () Bool)

(assert (=> b!136821 (=> (not res!65642) (not e!89095))))

(assert (=> b!136821 (= res!65642 (and (or (not ((_ is Cons!1719) (toList!873 call!14970))) (bvsle (_1!1332 (h!2325 (toList!873 call!14970))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) ((_ is Cons!1719) (toList!873 call!14970)) (bvslt (_1!1332 (h!2325 (toList!873 call!14970))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(declare-fun b!136822 () Bool)

(assert (=> b!136822 (= e!89095 (containsKey!177 (t!6211 (toList!873 call!14970)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42655 (not res!65641)) b!136821))

(assert (= (and b!136821 res!65642) b!136822))

(assert (=> b!136822 m!162081))

(declare-fun m!163137 () Bool)

(assert (=> b!136822 m!163137))

(assert (=> d!42461 d!42655))

(declare-fun b!136823 () Bool)

(declare-fun e!89101 () Bool)

(assert (=> b!136823 (= e!89101 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136823 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!136824 () Bool)

(declare-fun res!65646 () Bool)

(declare-fun e!89096 () Bool)

(assert (=> b!136824 (=> (not res!65646) (not e!89096))))

(declare-fun lt!71535 () ListLongMap!1715)

(assert (=> b!136824 (= res!65646 (not (contains!905 lt!71535 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136825 () Bool)

(declare-fun e!89100 () ListLongMap!1715)

(declare-fun e!89099 () ListLongMap!1715)

(assert (=> b!136825 (= e!89100 e!89099)))

(declare-fun c!25604 () Bool)

(assert (=> b!136825 (= c!25604 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136826 () Bool)

(declare-fun e!89097 () Bool)

(assert (=> b!136826 (= e!89097 (= lt!71535 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16))))))

(declare-fun b!136827 () Bool)

(declare-fun e!89102 () Bool)

(assert (=> b!136827 (= e!89096 e!89102)))

(declare-fun c!25602 () Bool)

(assert (=> b!136827 (= c!25602 e!89101)))

(declare-fun res!65644 () Bool)

(assert (=> b!136827 (=> (not res!65644) (not e!89101))))

(assert (=> b!136827 (= res!65644 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun d!42657 () Bool)

(assert (=> d!42657 e!89096))

(declare-fun res!65643 () Bool)

(assert (=> d!42657 (=> (not res!65643) (not e!89096))))

(assert (=> d!42657 (= res!65643 (not (contains!905 lt!71535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42657 (= lt!71535 e!89100)))

(declare-fun c!25603 () Bool)

(assert (=> d!42657 (= c!25603 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42657 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42657 (= (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71535)))

(declare-fun b!136828 () Bool)

(declare-fun lt!71536 () Unit!4275)

(declare-fun lt!71539 () Unit!4275)

(assert (=> b!136828 (= lt!71536 lt!71539)))

(declare-fun lt!71541 () (_ BitVec 64))

(declare-fun lt!71540 () V!3499)

(declare-fun lt!71538 () ListLongMap!1715)

(declare-fun lt!71537 () (_ BitVec 64))

(assert (=> b!136828 (not (contains!905 (+!176 lt!71538 (tuple2!2643 lt!71541 lt!71540)) lt!71537))))

(assert (=> b!136828 (= lt!71539 (addStillNotContains!62 lt!71538 lt!71541 lt!71540 lt!71537))))

(assert (=> b!136828 (= lt!71537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!136828 (= lt!71540 (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136828 (= lt!71541 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!15079 () ListLongMap!1715)

(assert (=> b!136828 (= lt!71538 call!15079)))

(assert (=> b!136828 (= e!89099 (+!176 call!15079 (tuple2!2643 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!136829 () Bool)

(declare-fun e!89098 () Bool)

(assert (=> b!136829 (= e!89102 e!89098)))

(assert (=> b!136829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65645 () Bool)

(assert (=> b!136829 (= res!65645 (contains!905 lt!71535 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136829 (=> (not res!65645) (not e!89098))))

(declare-fun b!136830 () Bool)

(assert (=> b!136830 (= e!89097 (isEmpty!413 lt!71535))))

(declare-fun bm!15076 () Bool)

(assert (=> bm!15076 (= call!15079 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16)))))

(declare-fun b!136831 () Bool)

(assert (=> b!136831 (= e!89100 (ListLongMap!1716 Nil!1720))))

(declare-fun b!136832 () Bool)

(assert (=> b!136832 (= e!89102 e!89097)))

(declare-fun c!25605 () Bool)

(assert (=> b!136832 (= c!25605 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136833 () Bool)

(assert (=> b!136833 (= e!89099 call!15079)))

(declare-fun b!136834 () Bool)

(assert (=> b!136834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> b!136834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))))))))

(assert (=> b!136834 (= e!89098 (= (apply!117 lt!71535 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!42657 c!25603) b!136831))

(assert (= (and d!42657 (not c!25603)) b!136825))

(assert (= (and b!136825 c!25604) b!136828))

(assert (= (and b!136825 (not c!25604)) b!136833))

(assert (= (or b!136828 b!136833) bm!15076))

(assert (= (and d!42657 res!65643) b!136824))

(assert (= (and b!136824 res!65646) b!136827))

(assert (= (and b!136827 res!65644) b!136823))

(assert (= (and b!136827 c!25602) b!136829))

(assert (= (and b!136827 (not c!25602)) b!136832))

(assert (= (and b!136829 res!65645) b!136834))

(assert (= (and b!136832 c!25605) b!136826))

(assert (= (and b!136832 (not c!25605)) b!136830))

(declare-fun b_lambda!6111 () Bool)

(assert (=> (not b_lambda!6111) (not b!136828)))

(assert (=> b!136828 t!6219))

(declare-fun b_and!8475 () Bool)

(assert (= b_and!8471 (and (=> t!6219 result!4047) b_and!8475)))

(assert (=> b!136828 t!6221))

(declare-fun b_and!8477 () Bool)

(assert (= b_and!8473 (and (=> t!6221 result!4049) b_and!8477)))

(declare-fun b_lambda!6113 () Bool)

(assert (=> (not b_lambda!6113) (not b!136834)))

(assert (=> b!136834 t!6219))

(declare-fun b_and!8479 () Bool)

(assert (= b_and!8475 (and (=> t!6219 result!4047) b_and!8479)))

(assert (=> b!136834 t!6221))

(declare-fun b_and!8481 () Bool)

(assert (= b_and!8477 (and (=> t!6221 result!4049) b_and!8481)))

(assert (=> b!136823 m!162327))

(assert (=> b!136823 m!162327))

(assert (=> b!136823 m!162341))

(assert (=> b!136829 m!162327))

(assert (=> b!136829 m!162327))

(declare-fun m!163139 () Bool)

(assert (=> b!136829 m!163139))

(declare-fun m!163141 () Bool)

(assert (=> b!136828 m!163141))

(declare-fun m!163143 () Bool)

(assert (=> b!136828 m!163143))

(declare-fun m!163145 () Bool)

(assert (=> b!136828 m!163145))

(assert (=> b!136828 m!162345))

(assert (=> b!136828 m!162327))

(assert (=> b!136828 m!163143))

(assert (=> b!136828 m!162345))

(assert (=> b!136828 m!162347))

(assert (=> b!136828 m!162349))

(declare-fun m!163147 () Bool)

(assert (=> b!136828 m!163147))

(assert (=> b!136828 m!162347))

(assert (=> b!136825 m!162327))

(assert (=> b!136825 m!162327))

(assert (=> b!136825 m!162341))

(assert (=> b!136834 m!162327))

(declare-fun m!163149 () Bool)

(assert (=> b!136834 m!163149))

(assert (=> b!136834 m!162345))

(assert (=> b!136834 m!162347))

(assert (=> b!136834 m!162349))

(assert (=> b!136834 m!162347))

(assert (=> b!136834 m!162345))

(assert (=> b!136834 m!162327))

(declare-fun m!163151 () Bool)

(assert (=> d!42657 m!163151))

(assert (=> d!42657 m!162297))

(declare-fun m!163153 () Bool)

(assert (=> b!136826 m!163153))

(assert (=> bm!15076 m!163153))

(declare-fun m!163155 () Bool)

(assert (=> b!136830 m!163155))

(declare-fun m!163157 () Bool)

(assert (=> b!136824 m!163157))

(assert (=> bm!15000 d!42657))

(declare-fun d!42659 () Bool)

(declare-fun e!89103 () Bool)

(assert (=> d!42659 e!89103))

(declare-fun res!65647 () Bool)

(assert (=> d!42659 (=> res!65647 e!89103)))

(declare-fun lt!71544 () Bool)

(assert (=> d!42659 (= res!65647 (not lt!71544))))

(declare-fun lt!71542 () Bool)

(assert (=> d!42659 (= lt!71544 lt!71542)))

(declare-fun lt!71545 () Unit!4275)

(declare-fun e!89104 () Unit!4275)

(assert (=> d!42659 (= lt!71545 e!89104)))

(declare-fun c!25606 () Bool)

(assert (=> d!42659 (= c!25606 lt!71542)))

(assert (=> d!42659 (= lt!71542 (containsKey!177 (toList!873 lt!71331) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!42659 (= (contains!905 lt!71331 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!71544)))

(declare-fun b!136835 () Bool)

(declare-fun lt!71543 () Unit!4275)

(assert (=> b!136835 (= e!89104 lt!71543)))

(assert (=> b!136835 (= lt!71543 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71331) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136835 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!136836 () Bool)

(declare-fun Unit!4303 () Unit!4275)

(assert (=> b!136836 (= e!89104 Unit!4303)))

(declare-fun b!136837 () Bool)

(assert (=> b!136837 (= e!89103 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!42659 c!25606) b!136835))

(assert (= (and d!42659 (not c!25606)) b!136836))

(assert (= (and d!42659 (not res!65647)) b!136837))

(assert (=> d!42659 m!162243))

(declare-fun m!163159 () Bool)

(assert (=> d!42659 m!163159))

(assert (=> b!136835 m!162243))

(declare-fun m!163161 () Bool)

(assert (=> b!136835 m!163161))

(assert (=> b!136835 m!162243))

(declare-fun m!163163 () Bool)

(assert (=> b!136835 m!163163))

(assert (=> b!136835 m!163163))

(declare-fun m!163165 () Bool)

(assert (=> b!136835 m!163165))

(assert (=> b!136837 m!162243))

(assert (=> b!136837 m!163163))

(assert (=> b!136837 m!163163))

(assert (=> b!136837 m!163165))

(assert (=> b!136474 d!42659))

(assert (=> b!136583 d!42651))

(assert (=> d!42473 d!42475))

(assert (=> d!42473 d!42477))

(declare-fun d!42661 () Bool)

(assert (=> d!42661 (isDefined!126 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42661 true))

(declare-fun _$12!409 () Unit!4275)

(assert (=> d!42661 (= (choose!833 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) _$12!409)))

(declare-fun bs!5727 () Bool)

(assert (= bs!5727 d!42661))

(assert (=> bs!5727 m!162081))

(assert (=> bs!5727 m!162155))

(assert (=> bs!5727 m!162155))

(assert (=> bs!5727 m!162157))

(assert (=> d!42473 d!42661))

(declare-fun d!42663 () Bool)

(declare-fun res!65652 () Bool)

(declare-fun e!89109 () Bool)

(assert (=> d!42663 (=> res!65652 e!89109)))

(assert (=> d!42663 (= res!65652 (or ((_ is Nil!1720) (toList!873 lt!70951)) ((_ is Nil!1720) (t!6211 (toList!873 lt!70951)))))))

(assert (=> d!42663 (= (isStrictlySorted!323 (toList!873 lt!70951)) e!89109)))

(declare-fun b!136842 () Bool)

(declare-fun e!89110 () Bool)

(assert (=> b!136842 (= e!89109 e!89110)))

(declare-fun res!65653 () Bool)

(assert (=> b!136842 (=> (not res!65653) (not e!89110))))

(assert (=> b!136842 (= res!65653 (bvslt (_1!1332 (h!2325 (toList!873 lt!70951))) (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951))))))))

(declare-fun b!136843 () Bool)

(assert (=> b!136843 (= e!89110 (isStrictlySorted!323 (t!6211 (toList!873 lt!70951))))))

(assert (= (and d!42663 (not res!65652)) b!136842))

(assert (= (and b!136842 res!65653) b!136843))

(declare-fun m!163167 () Bool)

(assert (=> b!136843 m!163167))

(assert (=> d!42473 d!42663))

(declare-fun d!42665 () Bool)

(assert (=> d!42665 (= (inRange!0 (index!3266 lt!71425) (mask!7203 newMap!16)) (and (bvsge (index!3266 lt!71425) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71425) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!136625 d!42665))

(assert (=> bm!15020 d!42483))

(declare-fun b!136844 () Bool)

(declare-fun e!89112 () Bool)

(declare-fun call!15080 () Bool)

(assert (=> b!136844 (= e!89112 call!15080)))

(declare-fun b!136845 () Bool)

(declare-fun e!89111 () Bool)

(assert (=> b!136845 (= e!89112 e!89111)))

(declare-fun lt!71548 () (_ BitVec 64))

(assert (=> b!136845 (= lt!71548 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000))))

(declare-fun lt!71547 () Unit!4275)

(assert (=> b!136845 (= lt!71547 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4642 (_2!1333 lt!71054)) lt!71548 #b00000000000000000000000000000000))))

(assert (=> b!136845 (arrayContainsKey!0 (_keys!4642 (_2!1333 lt!71054)) lt!71548 #b00000000000000000000000000000000)))

(declare-fun lt!71546 () Unit!4275)

(assert (=> b!136845 (= lt!71546 lt!71547)))

(declare-fun res!65655 () Bool)

(assert (=> b!136845 (= res!65655 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000) (_keys!4642 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054))) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!136845 (=> (not res!65655) (not e!89111))))

(declare-fun bm!15077 () Bool)

(assert (=> bm!15077 (= call!15080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4642 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054))))))

(declare-fun d!42667 () Bool)

(declare-fun res!65654 () Bool)

(declare-fun e!89113 () Bool)

(assert (=> d!42667 (=> res!65654 e!89113)))

(assert (=> d!42667 (= res!65654 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (=> d!42667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054))) e!89113)))

(declare-fun b!136846 () Bool)

(assert (=> b!136846 (= e!89113 e!89112)))

(declare-fun c!25607 () Bool)

(assert (=> b!136846 (= c!25607 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun b!136847 () Bool)

(assert (=> b!136847 (= e!89111 call!15080)))

(assert (= (and d!42667 (not res!65654)) b!136846))

(assert (= (and b!136846 c!25607) b!136845))

(assert (= (and b!136846 (not c!25607)) b!136844))

(assert (= (and b!136845 res!65655) b!136847))

(assert (= (or b!136847 b!136844) bm!15077))

(declare-fun m!163169 () Bool)

(assert (=> b!136845 m!163169))

(declare-fun m!163171 () Bool)

(assert (=> b!136845 m!163171))

(declare-fun m!163173 () Bool)

(assert (=> b!136845 m!163173))

(assert (=> b!136845 m!163169))

(declare-fun m!163175 () Bool)

(assert (=> b!136845 m!163175))

(declare-fun m!163177 () Bool)

(assert (=> bm!15077 m!163177))

(assert (=> b!136846 m!163169))

(assert (=> b!136846 m!163169))

(declare-fun m!163179 () Bool)

(assert (=> b!136846 m!163179))

(assert (=> b!136588 d!42667))

(assert (=> b!136470 d!42453))

(declare-fun d!42669 () Bool)

(assert (=> d!42669 (= (get!1496 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136438 d!42669))

(declare-fun d!42671 () Bool)

(declare-fun e!89114 () Bool)

(assert (=> d!42671 e!89114))

(declare-fun res!65657 () Bool)

(assert (=> d!42671 (=> (not res!65657) (not e!89114))))

(declare-fun lt!71551 () ListLongMap!1715)

(assert (=> d!42671 (= res!65657 (contains!905 lt!71551 (_1!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(declare-fun lt!71550 () List!1723)

(assert (=> d!42671 (= lt!71551 (ListLongMap!1716 lt!71550))))

(declare-fun lt!71549 () Unit!4275)

(declare-fun lt!71552 () Unit!4275)

(assert (=> d!42671 (= lt!71549 lt!71552)))

(assert (=> d!42671 (= (getValueByKey!173 lt!71550 (_1!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42671 (= lt!71552 (lemmaContainsTupThenGetReturnValue!88 lt!71550 (_1!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42671 (= lt!71550 (insertStrictlySorted!91 (toList!873 lt!71419) (_1!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42671 (= (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71551)))

(declare-fun b!136848 () Bool)

(declare-fun res!65656 () Bool)

(assert (=> b!136848 (=> (not res!65656) (not e!89114))))

(assert (=> b!136848 (= res!65656 (= (getValueByKey!173 (toList!873 lt!71551) (_1!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))))))))

(declare-fun b!136849 () Bool)

(assert (=> b!136849 (= e!89114 (contains!907 (toList!873 lt!71551) (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))))))

(assert (= (and d!42671 res!65657) b!136848))

(assert (= (and b!136848 res!65656) b!136849))

(declare-fun m!163181 () Bool)

(assert (=> d!42671 m!163181))

(declare-fun m!163183 () Bool)

(assert (=> d!42671 m!163183))

(declare-fun m!163185 () Bool)

(assert (=> d!42671 m!163185))

(declare-fun m!163187 () Bool)

(assert (=> d!42671 m!163187))

(declare-fun m!163189 () Bool)

(assert (=> b!136848 m!163189))

(declare-fun m!163191 () Bool)

(assert (=> b!136849 m!163191))

(assert (=> b!136604 d!42671))

(declare-fun d!42673 () Bool)

(declare-fun e!89115 () Bool)

(assert (=> d!42673 e!89115))

(declare-fun res!65659 () Bool)

(assert (=> d!42673 (=> (not res!65659) (not e!89115))))

(declare-fun lt!71555 () ListLongMap!1715)

(assert (=> d!42673 (= res!65659 (contains!905 lt!71555 (_1!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(declare-fun lt!71554 () List!1723)

(assert (=> d!42673 (= lt!71555 (ListLongMap!1716 lt!71554))))

(declare-fun lt!71553 () Unit!4275)

(declare-fun lt!71556 () Unit!4275)

(assert (=> d!42673 (= lt!71553 lt!71556)))

(assert (=> d!42673 (= (getValueByKey!173 lt!71554 (_1!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42673 (= lt!71556 (lemmaContainsTupThenGetReturnValue!88 lt!71554 (_1!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42673 (= lt!71554 (insertStrictlySorted!91 (toList!873 lt!71410) (_1!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))))))

(assert (=> d!42673 (= (+!176 lt!71410 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71555)))

(declare-fun b!136850 () Bool)

(declare-fun res!65658 () Bool)

(assert (=> b!136850 (=> (not res!65658) (not e!89115))))

(assert (=> b!136850 (= res!65658 (= (getValueByKey!173 (toList!873 lt!71555) (_1!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))))))))

(declare-fun b!136851 () Bool)

(assert (=> b!136851 (= e!89115 (contains!907 (toList!873 lt!71555) (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))))))

(assert (= (and d!42673 res!65659) b!136850))

(assert (= (and b!136850 res!65658) b!136851))

(declare-fun m!163193 () Bool)

(assert (=> d!42673 m!163193))

(declare-fun m!163195 () Bool)

(assert (=> d!42673 m!163195))

(declare-fun m!163197 () Bool)

(assert (=> d!42673 m!163197))

(declare-fun m!163199 () Bool)

(assert (=> d!42673 m!163199))

(declare-fun m!163201 () Bool)

(assert (=> b!136850 m!163201))

(declare-fun m!163203 () Bool)

(assert (=> b!136851 m!163203))

(assert (=> b!136604 d!42673))

(declare-fun d!42675 () Bool)

(assert (=> d!42675 (= (apply!117 (+!176 lt!71410 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71409) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71410 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) lt!71409)))))

(declare-fun bs!5728 () Bool)

(assert (= bs!5728 d!42675))

(declare-fun m!163205 () Bool)

(assert (=> bs!5728 m!163205))

(assert (=> bs!5728 m!163205))

(declare-fun m!163207 () Bool)

(assert (=> bs!5728 m!163207))

(assert (=> b!136604 d!42675))

(declare-fun d!42677 () Bool)

(declare-fun e!89116 () Bool)

(assert (=> d!42677 e!89116))

(declare-fun res!65661 () Bool)

(assert (=> d!42677 (=> (not res!65661) (not e!89116))))

(declare-fun lt!71559 () ListLongMap!1715)

(assert (=> d!42677 (= res!65661 (contains!905 lt!71559 (_1!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(declare-fun lt!71558 () List!1723)

(assert (=> d!42677 (= lt!71559 (ListLongMap!1716 lt!71558))))

(declare-fun lt!71557 () Unit!4275)

(declare-fun lt!71560 () Unit!4275)

(assert (=> d!42677 (= lt!71557 lt!71560)))

(assert (=> d!42677 (= (getValueByKey!173 lt!71558 (_1!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42677 (= lt!71560 (lemmaContainsTupThenGetReturnValue!88 lt!71558 (_1!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42677 (= lt!71558 (insertStrictlySorted!91 (toList!873 lt!71401) (_1!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42677 (= (+!176 lt!71401 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71559)))

(declare-fun b!136852 () Bool)

(declare-fun res!65660 () Bool)

(assert (=> b!136852 (=> (not res!65660) (not e!89116))))

(assert (=> b!136852 (= res!65660 (= (getValueByKey!173 (toList!873 lt!71559) (_1!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(declare-fun b!136853 () Bool)

(assert (=> b!136853 (= e!89116 (contains!907 (toList!873 lt!71559) (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))

(assert (= (and d!42677 res!65661) b!136852))

(assert (= (and b!136852 res!65660) b!136853))

(declare-fun m!163209 () Bool)

(assert (=> d!42677 m!163209))

(declare-fun m!163211 () Bool)

(assert (=> d!42677 m!163211))

(declare-fun m!163213 () Bool)

(assert (=> d!42677 m!163213))

(declare-fun m!163215 () Bool)

(assert (=> d!42677 m!163215))

(declare-fun m!163217 () Bool)

(assert (=> b!136852 m!163217))

(declare-fun m!163219 () Bool)

(assert (=> b!136853 m!163219))

(assert (=> b!136604 d!42677))

(declare-fun d!42679 () Bool)

(declare-fun e!89117 () Bool)

(assert (=> d!42679 e!89117))

(declare-fun res!65662 () Bool)

(assert (=> d!42679 (=> res!65662 e!89117)))

(declare-fun lt!71563 () Bool)

(assert (=> d!42679 (= res!65662 (not lt!71563))))

(declare-fun lt!71561 () Bool)

(assert (=> d!42679 (= lt!71563 lt!71561)))

(declare-fun lt!71564 () Unit!4275)

(declare-fun e!89118 () Unit!4275)

(assert (=> d!42679 (= lt!71564 e!89118)))

(declare-fun c!25608 () Bool)

(assert (=> d!42679 (= c!25608 lt!71561)))

(assert (=> d!42679 (= lt!71561 (containsKey!177 (toList!873 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) lt!71412))))

(assert (=> d!42679 (= (contains!905 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71412) lt!71563)))

(declare-fun b!136854 () Bool)

(declare-fun lt!71562 () Unit!4275)

(assert (=> b!136854 (= e!89118 lt!71562)))

(assert (=> b!136854 (= lt!71562 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) lt!71412))))

(assert (=> b!136854 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) lt!71412))))

(declare-fun b!136855 () Bool)

(declare-fun Unit!4304 () Unit!4275)

(assert (=> b!136855 (= e!89118 Unit!4304)))

(declare-fun b!136856 () Bool)

(assert (=> b!136856 (= e!89117 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))))) lt!71412)))))

(assert (= (and d!42679 c!25608) b!136854))

(assert (= (and d!42679 (not c!25608)) b!136855))

(assert (= (and d!42679 (not res!65662)) b!136856))

(declare-fun m!163221 () Bool)

(assert (=> d!42679 m!163221))

(declare-fun m!163223 () Bool)

(assert (=> b!136854 m!163223))

(declare-fun m!163225 () Bool)

(assert (=> b!136854 m!163225))

(assert (=> b!136854 m!163225))

(declare-fun m!163227 () Bool)

(assert (=> b!136854 m!163227))

(assert (=> b!136856 m!163225))

(assert (=> b!136856 m!163225))

(assert (=> b!136856 m!163227))

(assert (=> b!136604 d!42679))

(declare-fun b!136857 () Bool)

(declare-fun e!89124 () Bool)

(assert (=> b!136857 (= e!89124 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136857 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!136858 () Bool)

(declare-fun res!65666 () Bool)

(declare-fun e!89119 () Bool)

(assert (=> b!136858 (=> (not res!65666) (not e!89119))))

(declare-fun lt!71565 () ListLongMap!1715)

(assert (=> b!136858 (= res!65666 (not (contains!905 lt!71565 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136859 () Bool)

(declare-fun e!89123 () ListLongMap!1715)

(declare-fun e!89122 () ListLongMap!1715)

(assert (=> b!136859 (= e!89123 e!89122)))

(declare-fun c!25611 () Bool)

(assert (=> b!136859 (= c!25611 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136860 () Bool)

(declare-fun e!89120 () Bool)

(assert (=> b!136860 (= e!89120 (= lt!71565 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16))))))

(declare-fun b!136861 () Bool)

(declare-fun e!89125 () Bool)

(assert (=> b!136861 (= e!89119 e!89125)))

(declare-fun c!25609 () Bool)

(assert (=> b!136861 (= c!25609 e!89124)))

(declare-fun res!65664 () Bool)

(assert (=> b!136861 (=> (not res!65664) (not e!89124))))

(assert (=> b!136861 (= res!65664 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun d!42681 () Bool)

(assert (=> d!42681 e!89119))

(declare-fun res!65663 () Bool)

(assert (=> d!42681 (=> (not res!65663) (not e!89119))))

(assert (=> d!42681 (= res!65663 (not (contains!905 lt!71565 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42681 (= lt!71565 e!89123)))

(declare-fun c!25610 () Bool)

(assert (=> d!42681 (= c!25610 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42681 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42681 (= (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71565)))

(declare-fun b!136862 () Bool)

(declare-fun lt!71566 () Unit!4275)

(declare-fun lt!71569 () Unit!4275)

(assert (=> b!136862 (= lt!71566 lt!71569)))

(declare-fun lt!71570 () V!3499)

(declare-fun lt!71568 () ListLongMap!1715)

(declare-fun lt!71567 () (_ BitVec 64))

(declare-fun lt!71571 () (_ BitVec 64))

(assert (=> b!136862 (not (contains!905 (+!176 lt!71568 (tuple2!2643 lt!71571 lt!71570)) lt!71567))))

(assert (=> b!136862 (= lt!71569 (addStillNotContains!62 lt!71568 lt!71571 lt!71570 lt!71567))))

(assert (=> b!136862 (= lt!71567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!136862 (= lt!71570 (get!1493 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136862 (= lt!71571 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!15081 () ListLongMap!1715)

(assert (=> b!136862 (= lt!71568 call!15081)))

(assert (=> b!136862 (= e!89122 (+!176 call!15081 (tuple2!2643 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (get!1493 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!136863 () Bool)

(declare-fun e!89121 () Bool)

(assert (=> b!136863 (= e!89125 e!89121)))

(assert (=> b!136863 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65665 () Bool)

(assert (=> b!136863 (= res!65665 (contains!905 lt!71565 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136863 (=> (not res!65665) (not e!89121))))

(declare-fun b!136864 () Bool)

(assert (=> b!136864 (= e!89120 (isEmpty!413 lt!71565))))

(declare-fun bm!15078 () Bool)

(assert (=> bm!15078 (= call!15081 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040) (mask!7203 newMap!16) (ite c!25441 (ite c!25439 lt!71048 lt!71052) (extraKeys!2650 newMap!16)) (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2889 newMap!16)))))

(declare-fun b!136865 () Bool)

(assert (=> b!136865 (= e!89123 (ListLongMap!1716 Nil!1720))))

(declare-fun b!136866 () Bool)

(assert (=> b!136866 (= e!89125 e!89120)))

(declare-fun c!25612 () Bool)

(assert (=> b!136866 (= c!25612 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!136867 () Bool)

(assert (=> b!136867 (= e!89122 call!15081)))

(declare-fun b!136868 () Bool)

(assert (=> b!136868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> b!136868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040))))))

(assert (=> b!136868 (= e!89121 (= (apply!117 lt!71565 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!42681 c!25610) b!136865))

(assert (= (and d!42681 (not c!25610)) b!136859))

(assert (= (and b!136859 c!25611) b!136862))

(assert (= (and b!136859 (not c!25611)) b!136867))

(assert (= (or b!136862 b!136867) bm!15078))

(assert (= (and d!42681 res!65663) b!136858))

(assert (= (and b!136858 res!65666) b!136861))

(assert (= (and b!136861 res!65664) b!136857))

(assert (= (and b!136861 c!25609) b!136863))

(assert (= (and b!136861 (not c!25609)) b!136866))

(assert (= (and b!136863 res!65665) b!136868))

(assert (= (and b!136866 c!25612) b!136860))

(assert (= (and b!136866 (not c!25612)) b!136864))

(declare-fun b_lambda!6115 () Bool)

(assert (=> (not b_lambda!6115) (not b!136862)))

(assert (=> b!136862 t!6219))

(declare-fun b_and!8483 () Bool)

(assert (= b_and!8479 (and (=> t!6219 result!4047) b_and!8483)))

(assert (=> b!136862 t!6221))

(declare-fun b_and!8485 () Bool)

(assert (= b_and!8481 (and (=> t!6221 result!4049) b_and!8485)))

(declare-fun b_lambda!6117 () Bool)

(assert (=> (not b_lambda!6117) (not b!136868)))

(assert (=> b!136868 t!6219))

(declare-fun b_and!8487 () Bool)

(assert (= b_and!8483 (and (=> t!6219 result!4047) b_and!8487)))

(assert (=> b!136868 t!6221))

(declare-fun b_and!8489 () Bool)

(assert (= b_and!8485 (and (=> t!6221 result!4049) b_and!8489)))

(assert (=> b!136857 m!162327))

(assert (=> b!136857 m!162327))

(assert (=> b!136857 m!162341))

(assert (=> b!136863 m!162327))

(assert (=> b!136863 m!162327))

(declare-fun m!163229 () Bool)

(assert (=> b!136863 m!163229))

(declare-fun m!163231 () Bool)

(assert (=> b!136862 m!163231))

(declare-fun m!163233 () Bool)

(assert (=> b!136862 m!163233))

(declare-fun m!163235 () Bool)

(assert (=> b!136862 m!163235))

(assert (=> b!136862 m!162817))

(assert (=> b!136862 m!162327))

(assert (=> b!136862 m!163233))

(assert (=> b!136862 m!162817))

(assert (=> b!136862 m!162347))

(assert (=> b!136862 m!162819))

(declare-fun m!163237 () Bool)

(assert (=> b!136862 m!163237))

(assert (=> b!136862 m!162347))

(assert (=> b!136859 m!162327))

(assert (=> b!136859 m!162327))

(assert (=> b!136859 m!162341))

(assert (=> b!136868 m!162327))

(declare-fun m!163239 () Bool)

(assert (=> b!136868 m!163239))

(assert (=> b!136868 m!162817))

(assert (=> b!136868 m!162347))

(assert (=> b!136868 m!162819))

(assert (=> b!136868 m!162347))

(assert (=> b!136868 m!162817))

(assert (=> b!136868 m!162327))

(declare-fun m!163241 () Bool)

(assert (=> d!42681 m!163241))

(assert (=> d!42681 m!162297))

(declare-fun m!163243 () Bool)

(assert (=> b!136860 m!163243))

(assert (=> bm!15078 m!163243))

(declare-fun m!163245 () Bool)

(assert (=> b!136864 m!163245))

(declare-fun m!163247 () Bool)

(assert (=> b!136858 m!163247))

(assert (=> b!136604 d!42681))

(declare-fun d!42683 () Bool)

(assert (=> d!42683 (= (apply!117 (+!176 lt!71401 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71416) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71401 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) lt!71416)))))

(declare-fun bs!5729 () Bool)

(assert (= bs!5729 d!42683))

(declare-fun m!163249 () Bool)

(assert (=> bs!5729 m!163249))

(assert (=> bs!5729 m!163249))

(declare-fun m!163251 () Bool)

(assert (=> bs!5729 m!163251))

(assert (=> b!136604 d!42683))

(declare-fun d!42685 () Bool)

(declare-fun e!89126 () Bool)

(assert (=> d!42685 e!89126))

(declare-fun res!65668 () Bool)

(assert (=> d!42685 (=> (not res!65668) (not e!89126))))

(declare-fun lt!71574 () ListLongMap!1715)

(assert (=> d!42685 (= res!65668 (contains!905 lt!71574 (_1!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(declare-fun lt!71573 () List!1723)

(assert (=> d!42685 (= lt!71574 (ListLongMap!1716 lt!71573))))

(declare-fun lt!71572 () Unit!4275)

(declare-fun lt!71575 () Unit!4275)

(assert (=> d!42685 (= lt!71572 lt!71575)))

(assert (=> d!42685 (= (getValueByKey!173 lt!71573 (_1!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42685 (= lt!71575 (lemmaContainsTupThenGetReturnValue!88 lt!71573 (_1!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42685 (= lt!71573 (insertStrictlySorted!91 (toList!873 lt!71400) (_1!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42685 (= (+!176 lt!71400 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71574)))

(declare-fun b!136869 () Bool)

(declare-fun res!65667 () Bool)

(assert (=> b!136869 (=> (not res!65667) (not e!89126))))

(assert (=> b!136869 (= res!65667 (= (getValueByKey!173 (toList!873 lt!71574) (_1!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(declare-fun b!136870 () Bool)

(assert (=> b!136870 (= e!89126 (contains!907 (toList!873 lt!71574) (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))

(assert (= (and d!42685 res!65668) b!136869))

(assert (= (and b!136869 res!65667) b!136870))

(declare-fun m!163253 () Bool)

(assert (=> d!42685 m!163253))

(declare-fun m!163255 () Bool)

(assert (=> d!42685 m!163255))

(declare-fun m!163257 () Bool)

(assert (=> d!42685 m!163257))

(declare-fun m!163259 () Bool)

(assert (=> d!42685 m!163259))

(declare-fun m!163261 () Bool)

(assert (=> b!136869 m!163261))

(declare-fun m!163263 () Bool)

(assert (=> b!136870 m!163263))

(assert (=> b!136604 d!42685))

(declare-fun d!42687 () Bool)

(assert (=> d!42687 (= (apply!117 (+!176 lt!71401 (tuple2!2643 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71416) (apply!117 lt!71401 lt!71416))))

(declare-fun lt!71576 () Unit!4275)

(assert (=> d!42687 (= lt!71576 (choose!835 lt!71401 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71416))))

(declare-fun e!89127 () Bool)

(assert (=> d!42687 e!89127))

(declare-fun res!65669 () Bool)

(assert (=> d!42687 (=> (not res!65669) (not e!89127))))

(assert (=> d!42687 (= res!65669 (contains!905 lt!71401 lt!71416))))

(assert (=> d!42687 (= (addApplyDifferent!93 lt!71401 lt!71415 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71416) lt!71576)))

(declare-fun b!136871 () Bool)

(assert (=> b!136871 (= e!89127 (not (= lt!71416 lt!71415)))))

(assert (= (and d!42687 res!65669) b!136871))

(declare-fun m!163265 () Bool)

(assert (=> d!42687 m!163265))

(assert (=> d!42687 m!162793))

(assert (=> d!42687 m!162793))

(assert (=> d!42687 m!162795))

(declare-fun m!163267 () Bool)

(assert (=> d!42687 m!163267))

(assert (=> d!42687 m!162789))

(assert (=> b!136604 d!42687))

(declare-fun d!42689 () Bool)

(assert (=> d!42689 (= (apply!117 (+!176 lt!71400 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71420) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71400 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) lt!71420)))))

(declare-fun bs!5730 () Bool)

(assert (= bs!5730 d!42689))

(declare-fun m!163269 () Bool)

(assert (=> bs!5730 m!163269))

(assert (=> bs!5730 m!163269))

(declare-fun m!163271 () Bool)

(assert (=> bs!5730 m!163271))

(assert (=> b!136604 d!42689))

(declare-fun d!42691 () Bool)

(assert (=> d!42691 (= (apply!117 lt!71410 lt!71409) (get!1497 (getValueByKey!173 (toList!873 lt!71410) lt!71409)))))

(declare-fun bs!5731 () Bool)

(assert (= bs!5731 d!42691))

(declare-fun m!163273 () Bool)

(assert (=> bs!5731 m!163273))

(assert (=> bs!5731 m!163273))

(declare-fun m!163275 () Bool)

(assert (=> bs!5731 m!163275))

(assert (=> b!136604 d!42691))

(declare-fun d!42693 () Bool)

(assert (=> d!42693 (contains!905 (+!176 lt!71419 (tuple2!2643 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71412)))

(declare-fun lt!71577 () Unit!4275)

(assert (=> d!42693 (= lt!71577 (choose!836 lt!71419 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71412))))

(assert (=> d!42693 (contains!905 lt!71419 lt!71412)))

(assert (=> d!42693 (= (addStillContains!93 lt!71419 lt!71403 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71412) lt!71577)))

(declare-fun bs!5732 () Bool)

(assert (= bs!5732 d!42693))

(assert (=> bs!5732 m!162799))

(assert (=> bs!5732 m!162799))

(assert (=> bs!5732 m!162801))

(declare-fun m!163277 () Bool)

(assert (=> bs!5732 m!163277))

(declare-fun m!163279 () Bool)

(assert (=> bs!5732 m!163279))

(assert (=> b!136604 d!42693))

(declare-fun d!42695 () Bool)

(assert (=> d!42695 (= (apply!117 lt!71400 lt!71420) (get!1497 (getValueByKey!173 (toList!873 lt!71400) lt!71420)))))

(declare-fun bs!5733 () Bool)

(assert (= bs!5733 d!42695))

(declare-fun m!163281 () Bool)

(assert (=> bs!5733 m!163281))

(assert (=> bs!5733 m!163281))

(declare-fun m!163283 () Bool)

(assert (=> bs!5733 m!163283))

(assert (=> b!136604 d!42695))

(declare-fun d!42697 () Bool)

(assert (=> d!42697 (= (apply!117 (+!176 lt!71400 (tuple2!2643 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71420) (apply!117 lt!71400 lt!71420))))

(declare-fun lt!71578 () Unit!4275)

(assert (=> d!42697 (= lt!71578 (choose!835 lt!71400 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71420))))

(declare-fun e!89128 () Bool)

(assert (=> d!42697 e!89128))

(declare-fun res!65670 () Bool)

(assert (=> d!42697 (=> (not res!65670) (not e!89128))))

(assert (=> d!42697 (= res!65670 (contains!905 lt!71400 lt!71420))))

(assert (=> d!42697 (= (addApplyDifferent!93 lt!71400 lt!71418 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)) lt!71420) lt!71578)))

(declare-fun b!136872 () Bool)

(assert (=> b!136872 (= e!89128 (not (= lt!71420 lt!71418)))))

(assert (= (and d!42697 res!65670) b!136872))

(declare-fun m!163285 () Bool)

(assert (=> d!42697 m!163285))

(assert (=> d!42697 m!162787))

(assert (=> d!42697 m!162787))

(assert (=> d!42697 m!162797))

(declare-fun m!163287 () Bool)

(assert (=> d!42697 m!163287))

(assert (=> d!42697 m!162807))

(assert (=> b!136604 d!42697))

(declare-fun d!42699 () Bool)

(assert (=> d!42699 (= (apply!117 (+!176 lt!71410 (tuple2!2643 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)))) lt!71409) (apply!117 lt!71410 lt!71409))))

(declare-fun lt!71579 () Unit!4275)

(assert (=> d!42699 (= lt!71579 (choose!835 lt!71410 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71409))))

(declare-fun e!89129 () Bool)

(assert (=> d!42699 e!89129))

(declare-fun res!65671 () Bool)

(assert (=> d!42699 (=> (not res!65671) (not e!89129))))

(assert (=> d!42699 (= res!65671 (contains!905 lt!71410 lt!71409))))

(assert (=> d!42699 (= (addApplyDifferent!93 lt!71410 lt!71405 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16)) lt!71409) lt!71579)))

(declare-fun b!136873 () Bool)

(assert (=> b!136873 (= e!89129 (not (= lt!71409 lt!71405)))))

(assert (= (and d!42699 res!65671) b!136873))

(declare-fun m!163289 () Bool)

(assert (=> d!42699 m!163289))

(assert (=> d!42699 m!162781))

(assert (=> d!42699 m!162781))

(assert (=> d!42699 m!162791))

(declare-fun m!163291 () Bool)

(assert (=> d!42699 m!163291))

(assert (=> d!42699 m!162811))

(assert (=> b!136604 d!42699))

(declare-fun d!42701 () Bool)

(assert (=> d!42701 (= (apply!117 lt!71401 lt!71416) (get!1497 (getValueByKey!173 (toList!873 lt!71401) lt!71416)))))

(declare-fun bs!5734 () Bool)

(assert (= bs!5734 d!42701))

(declare-fun m!163293 () Bool)

(assert (=> bs!5734 m!163293))

(assert (=> bs!5734 m!163293))

(declare-fun m!163295 () Bool)

(assert (=> bs!5734 m!163295))

(assert (=> b!136604 d!42701))

(declare-fun d!42703 () Bool)

(declare-fun res!65672 () Bool)

(declare-fun e!89130 () Bool)

(assert (=> d!42703 (=> res!65672 e!89130)))

(assert (=> d!42703 (= res!65672 (and ((_ is Cons!1719) (toList!873 call!14967)) (= (_1!1332 (h!2325 (toList!873 call!14967))) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))))

(assert (=> d!42703 (= (containsKey!177 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))) e!89130)))

(declare-fun b!136874 () Bool)

(declare-fun e!89131 () Bool)

(assert (=> b!136874 (= e!89130 e!89131)))

(declare-fun res!65673 () Bool)

(assert (=> b!136874 (=> (not res!65673) (not e!89131))))

(assert (=> b!136874 (= res!65673 (and (or (not ((_ is Cons!1719) (toList!873 call!14967))) (bvsle (_1!1332 (h!2325 (toList!873 call!14967))) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))) ((_ is Cons!1719) (toList!873 call!14967)) (bvslt (_1!1332 (h!2325 (toList!873 call!14967))) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))))

(declare-fun b!136875 () Bool)

(assert (=> b!136875 (= e!89131 (containsKey!177 (t!6211 (toList!873 call!14967)) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(assert (= (and d!42703 (not res!65672)) b!136874))

(assert (= (and b!136874 res!65673) b!136875))

(declare-fun m!163297 () Bool)

(assert (=> b!136875 m!163297))

(assert (=> d!42549 d!42703))

(declare-fun d!42705 () Bool)

(declare-fun e!89132 () Bool)

(assert (=> d!42705 e!89132))

(declare-fun res!65674 () Bool)

(assert (=> d!42705 (=> res!65674 e!89132)))

(declare-fun lt!71582 () Bool)

(assert (=> d!42705 (= res!65674 (not lt!71582))))

(declare-fun lt!71580 () Bool)

(assert (=> d!42705 (= lt!71582 lt!71580)))

(declare-fun lt!71583 () Unit!4275)

(declare-fun e!89133 () Unit!4275)

(assert (=> d!42705 (= lt!71583 e!89133)))

(declare-fun c!25613 () Bool)

(assert (=> d!42705 (= c!25613 lt!71580)))

(assert (=> d!42705 (= lt!71580 (containsKey!177 (toList!873 lt!71331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42705 (= (contains!905 lt!71331 #b0000000000000000000000000000000000000000000000000000000000000000) lt!71582)))

(declare-fun b!136876 () Bool)

(declare-fun lt!71581 () Unit!4275)

(assert (=> b!136876 (= e!89133 lt!71581)))

(assert (=> b!136876 (= lt!71581 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136876 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136877 () Bool)

(declare-fun Unit!4305 () Unit!4275)

(assert (=> b!136877 (= e!89133 Unit!4305)))

(declare-fun b!136878 () Bool)

(assert (=> b!136878 (= e!89132 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42705 c!25613) b!136876))

(assert (= (and d!42705 (not c!25613)) b!136877))

(assert (= (and d!42705 (not res!65674)) b!136878))

(declare-fun m!163299 () Bool)

(assert (=> d!42705 m!163299))

(declare-fun m!163301 () Bool)

(assert (=> b!136876 m!163301))

(declare-fun m!163303 () Bool)

(assert (=> b!136876 m!163303))

(assert (=> b!136876 m!163303))

(declare-fun m!163305 () Bool)

(assert (=> b!136876 m!163305))

(assert (=> b!136878 m!163303))

(assert (=> b!136878 m!163303))

(assert (=> b!136878 m!163305))

(assert (=> d!42501 d!42705))

(assert (=> d!42501 d!42563))

(assert (=> d!42521 d!42525))

(assert (=> d!42521 d!42505))

(declare-fun d!42707 () Bool)

(declare-fun e!89134 () Bool)

(assert (=> d!42707 e!89134))

(declare-fun res!65675 () Bool)

(assert (=> d!42707 (=> res!65675 e!89134)))

(declare-fun lt!71586 () Bool)

(assert (=> d!42707 (= res!65675 (not lt!71586))))

(declare-fun lt!71584 () Bool)

(assert (=> d!42707 (= lt!71586 lt!71584)))

(declare-fun lt!71587 () Unit!4275)

(declare-fun e!89135 () Unit!4275)

(assert (=> d!42707 (= lt!71587 e!89135)))

(declare-fun c!25614 () Bool)

(assert (=> d!42707 (= c!25614 lt!71584)))

(assert (=> d!42707 (= lt!71584 (containsKey!177 (toList!873 lt!71102) lt!71122))))

(assert (=> d!42707 (= (contains!905 lt!71102 lt!71122) lt!71586)))

(declare-fun b!136879 () Bool)

(declare-fun lt!71585 () Unit!4275)

(assert (=> b!136879 (= e!89135 lt!71585)))

(assert (=> b!136879 (= lt!71585 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71102) lt!71122))))

(assert (=> b!136879 (isDefined!126 (getValueByKey!173 (toList!873 lt!71102) lt!71122))))

(declare-fun b!136880 () Bool)

(declare-fun Unit!4306 () Unit!4275)

(assert (=> b!136880 (= e!89135 Unit!4306)))

(declare-fun b!136881 () Bool)

(assert (=> b!136881 (= e!89134 (isDefined!126 (getValueByKey!173 (toList!873 lt!71102) lt!71122)))))

(assert (= (and d!42707 c!25614) b!136879))

(assert (= (and d!42707 (not c!25614)) b!136880))

(assert (= (and d!42707 (not res!65675)) b!136881))

(declare-fun m!163307 () Bool)

(assert (=> d!42707 m!163307))

(declare-fun m!163309 () Bool)

(assert (=> b!136879 m!163309))

(assert (=> b!136879 m!162645))

(assert (=> b!136879 m!162645))

(declare-fun m!163311 () Bool)

(assert (=> b!136879 m!163311))

(assert (=> b!136881 m!162645))

(assert (=> b!136881 m!162645))

(assert (=> b!136881 m!163311))

(assert (=> d!42521 d!42707))

(assert (=> d!42521 d!42513))

(declare-fun d!42709 () Bool)

(assert (=> d!42709 (= (apply!117 (+!176 lt!71102 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71122) (apply!117 lt!71102 lt!71122))))

(assert (=> d!42709 true))

(declare-fun _$34!989 () Unit!4275)

(assert (=> d!42709 (= (choose!835 lt!71102 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71122) _$34!989)))

(declare-fun bs!5735 () Bool)

(assert (= bs!5735 d!42709))

(assert (=> bs!5735 m!162227))

(assert (=> bs!5735 m!162227))

(assert (=> bs!5735 m!162237))

(assert (=> bs!5735 m!162249))

(assert (=> d!42521 d!42709))

(declare-fun d!42711 () Bool)

(assert (=> d!42711 (= (apply!117 lt!71176 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5736 () Bool)

(assert (= bs!5736 d!42711))

(declare-fun m!163313 () Bool)

(assert (=> bs!5736 m!163313))

(assert (=> bs!5736 m!163313))

(declare-fun m!163315 () Bool)

(assert (=> bs!5736 m!163315))

(assert (=> b!136328 d!42711))

(declare-fun d!42713 () Bool)

(declare-fun lt!71590 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!134 (List!1723) (InoxSet tuple2!2642))

(assert (=> d!42713 (= lt!71590 (select (content!134 (toList!873 lt!71304)) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89141 () Bool)

(assert (=> d!42713 (= lt!71590 e!89141)))

(declare-fun res!65681 () Bool)

(assert (=> d!42713 (=> (not res!65681) (not e!89141))))

(assert (=> d!42713 (= res!65681 ((_ is Cons!1719) (toList!873 lt!71304)))))

(assert (=> d!42713 (= (contains!907 (toList!873 lt!71304) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71590)))

(declare-fun b!136886 () Bool)

(declare-fun e!89140 () Bool)

(assert (=> b!136886 (= e!89141 e!89140)))

(declare-fun res!65680 () Bool)

(assert (=> b!136886 (=> res!65680 e!89140)))

(assert (=> b!136886 (= res!65680 (= (h!2325 (toList!873 lt!71304)) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136887 () Bool)

(assert (=> b!136887 (= e!89140 (contains!907 (t!6211 (toList!873 lt!71304)) (ite (or c!25457 c!25462) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (= (and d!42713 res!65681) b!136886))

(assert (= (and b!136886 (not res!65680)) b!136887))

(declare-fun m!163317 () Bool)

(assert (=> d!42713 m!163317))

(declare-fun m!163319 () Bool)

(assert (=> d!42713 m!163319))

(declare-fun m!163321 () Bool)

(assert (=> b!136887 m!163321))

(assert (=> b!136436 d!42713))

(declare-fun d!42715 () Bool)

(assert (=> d!42715 (= (apply!117 lt!71413 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5737 () Bool)

(assert (= bs!5737 d!42715))

(declare-fun m!163323 () Bool)

(assert (=> bs!5737 m!163323))

(assert (=> bs!5737 m!163323))

(declare-fun m!163325 () Bool)

(assert (=> bs!5737 m!163325))

(assert (=> b!136618 d!42715))

(declare-fun b!136888 () Bool)

(declare-fun e!89142 () Option!179)

(assert (=> b!136888 (= e!89142 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71340)))))))

(declare-fun c!25615 () Bool)

(declare-fun d!42717 () Bool)

(assert (=> d!42717 (= c!25615 (and ((_ is Cons!1719) (toList!873 lt!71340)) (= (_1!1332 (h!2325 (toList!873 lt!71340))) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42717 (= (getValueByKey!173 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89142)))

(declare-fun b!136889 () Bool)

(declare-fun e!89143 () Option!179)

(assert (=> b!136889 (= e!89142 e!89143)))

(declare-fun c!25616 () Bool)

(assert (=> b!136889 (= c!25616 (and ((_ is Cons!1719) (toList!873 lt!71340)) (not (= (_1!1332 (h!2325 (toList!873 lt!71340))) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!136890 () Bool)

(assert (=> b!136890 (= e!89143 (getValueByKey!173 (t!6211 (toList!873 lt!71340)) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136891 () Bool)

(assert (=> b!136891 (= e!89143 None!177)))

(assert (= (and d!42717 c!25615) b!136888))

(assert (= (and d!42717 (not c!25615)) b!136889))

(assert (= (and b!136889 c!25616) b!136890))

(assert (= (and b!136889 (not c!25616)) b!136891))

(declare-fun m!163327 () Bool)

(assert (=> b!136890 m!163327))

(assert (=> b!136480 d!42717))

(assert (=> b!136511 d!42577))

(declare-fun d!42719 () Bool)

(declare-fun e!89144 () Bool)

(assert (=> d!42719 e!89144))

(declare-fun res!65682 () Bool)

(assert (=> d!42719 (=> res!65682 e!89144)))

(declare-fun lt!71593 () Bool)

(assert (=> d!42719 (= res!65682 (not lt!71593))))

(declare-fun lt!71591 () Bool)

(assert (=> d!42719 (= lt!71593 lt!71591)))

(declare-fun lt!71594 () Unit!4275)

(declare-fun e!89145 () Unit!4275)

(assert (=> d!42719 (= lt!71594 e!89145)))

(declare-fun c!25617 () Bool)

(assert (=> d!42719 (= c!25617 lt!71591)))

(assert (=> d!42719 (= lt!71591 (containsKey!177 (toList!873 lt!71176) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!42719 (= (contains!905 lt!71176 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) lt!71593)))

(declare-fun b!136892 () Bool)

(declare-fun lt!71592 () Unit!4275)

(assert (=> b!136892 (= e!89145 lt!71592)))

(assert (=> b!136892 (= lt!71592 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71176) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!136892 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!136893 () Bool)

(declare-fun Unit!4307 () Unit!4275)

(assert (=> b!136893 (= e!89145 Unit!4307)))

(declare-fun b!136894 () Bool)

(assert (=> b!136894 (= e!89144 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!42719 c!25617) b!136892))

(assert (= (and d!42719 (not c!25617)) b!136893))

(assert (= (and d!42719 (not res!65682)) b!136894))

(assert (=> d!42719 m!162327))

(declare-fun m!163329 () Bool)

(assert (=> d!42719 m!163329))

(assert (=> b!136892 m!162327))

(declare-fun m!163331 () Bool)

(assert (=> b!136892 m!163331))

(assert (=> b!136892 m!162327))

(assert (=> b!136892 m!163099))

(assert (=> b!136892 m!163099))

(declare-fun m!163333 () Bool)

(assert (=> b!136892 m!163333))

(assert (=> b!136894 m!162327))

(assert (=> b!136894 m!163099))

(assert (=> b!136894 m!163099))

(assert (=> b!136894 m!163333))

(assert (=> b!136324 d!42719))

(declare-fun d!42721 () Bool)

(declare-fun e!89146 () Bool)

(assert (=> d!42721 e!89146))

(declare-fun res!65683 () Bool)

(assert (=> d!42721 (=> res!65683 e!89146)))

(declare-fun lt!71597 () Bool)

(assert (=> d!42721 (= res!65683 (not lt!71597))))

(declare-fun lt!71595 () Bool)

(assert (=> d!42721 (= lt!71597 lt!71595)))

(declare-fun lt!71598 () Unit!4275)

(declare-fun e!89147 () Unit!4275)

(assert (=> d!42721 (= lt!71598 e!89147)))

(declare-fun c!25618 () Bool)

(assert (=> d!42721 (= c!25618 lt!71595)))

(assert (=> d!42721 (= lt!71595 (containsKey!177 (toList!873 lt!71143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42721 (= (contains!905 lt!71143 #b1000000000000000000000000000000000000000000000000000000000000000) lt!71597)))

(declare-fun b!136895 () Bool)

(declare-fun lt!71596 () Unit!4275)

(assert (=> b!136895 (= e!89147 lt!71596)))

(assert (=> b!136895 (= lt!71596 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136895 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136896 () Bool)

(declare-fun Unit!4308 () Unit!4275)

(assert (=> b!136896 (= e!89147 Unit!4308)))

(declare-fun b!136897 () Bool)

(assert (=> b!136897 (= e!89146 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42721 c!25618) b!136895))

(assert (= (and d!42721 (not c!25618)) b!136896))

(assert (= (and d!42721 (not res!65683)) b!136897))

(declare-fun m!163335 () Bool)

(assert (=> d!42721 m!163335))

(declare-fun m!163337 () Bool)

(assert (=> b!136895 m!163337))

(declare-fun m!163339 () Bool)

(assert (=> b!136895 m!163339))

(assert (=> b!136895 m!163339))

(declare-fun m!163341 () Bool)

(assert (=> b!136895 m!163341))

(assert (=> b!136897 m!163339))

(assert (=> b!136897 m!163339))

(assert (=> b!136897 m!163341))

(assert (=> bm!14996 d!42721))

(declare-fun b!136910 () Bool)

(declare-fun e!89155 () SeekEntryResult!276)

(assert (=> b!136910 (= e!89155 Undefined!276)))

(declare-fun lt!71604 () SeekEntryResult!276)

(declare-fun d!42723 () Bool)

(assert (=> d!42723 (and (or ((_ is Undefined!276) lt!71604) (not ((_ is Found!276) lt!71604)) (and (bvsge (index!3266 lt!71604) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71604) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71604) ((_ is Found!276) lt!71604) (not ((_ is MissingVacant!276) lt!71604)) (not (= (index!3268 lt!71604) (index!3267 lt!71300))) (and (bvsge (index!3268 lt!71604) #b00000000000000000000000000000000) (bvslt (index!3268 lt!71604) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71604) (ite ((_ is Found!276) lt!71604) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71604)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (and ((_ is MissingVacant!276) lt!71604) (= (index!3268 lt!71604) (index!3267 lt!71300)) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71604)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!42723 (= lt!71604 e!89155)))

(declare-fun c!25625 () Bool)

(assert (=> d!42723 (= c!25625 (bvsge (x!15804 lt!71300) #b01111111111111111111111111111110))))

(declare-fun lt!71603 () (_ BitVec 64))

(assert (=> d!42723 (= lt!71603 (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71300)))))

(assert (=> d!42723 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42723 (= (seekKeyOrZeroReturnVacant!0 (x!15804 lt!71300) (index!3267 lt!71300) (index!3267 lt!71300) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)) lt!71604)))

(declare-fun b!136911 () Bool)

(declare-fun c!25627 () Bool)

(assert (=> b!136911 (= c!25627 (= lt!71603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!89154 () SeekEntryResult!276)

(declare-fun e!89156 () SeekEntryResult!276)

(assert (=> b!136911 (= e!89154 e!89156)))

(declare-fun b!136912 () Bool)

(assert (=> b!136912 (= e!89156 (MissingVacant!276 (index!3267 lt!71300)))))

(declare-fun b!136913 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!136913 (= e!89156 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15804 lt!71300) #b00000000000000000000000000000001) (nextIndex!0 (index!3267 lt!71300) (x!15804 lt!71300) (mask!7203 newMap!16)) (index!3267 lt!71300) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun b!136914 () Bool)

(assert (=> b!136914 (= e!89154 (Found!276 (index!3267 lt!71300)))))

(declare-fun b!136915 () Bool)

(assert (=> b!136915 (= e!89155 e!89154)))

(declare-fun c!25626 () Bool)

(assert (=> b!136915 (= c!25626 (= lt!71603 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42723 c!25625) b!136910))

(assert (= (and d!42723 (not c!25625)) b!136915))

(assert (= (and b!136915 c!25626) b!136914))

(assert (= (and b!136915 (not c!25626)) b!136911))

(assert (= (and b!136911 c!25627) b!136912))

(assert (= (and b!136911 (not c!25627)) b!136913))

(declare-fun m!163343 () Bool)

(assert (=> d!42723 m!163343))

(declare-fun m!163345 () Bool)

(assert (=> d!42723 m!163345))

(assert (=> d!42723 m!162527))

(assert (=> d!42723 m!162297))

(declare-fun m!163347 () Bool)

(assert (=> b!136913 m!163347))

(assert (=> b!136913 m!163347))

(assert (=> b!136913 m!162081))

(declare-fun m!163349 () Bool)

(assert (=> b!136913 m!163349))

(assert (=> b!136434 d!42723))

(assert (=> b!136616 d!42651))

(declare-fun d!42725 () Bool)

(assert (=> d!42725 (= (get!1497 (getValueByKey!173 (toList!873 lt!71112) lt!71111)) (v!3225 (getValueByKey!173 (toList!873 lt!71112) lt!71111)))))

(assert (=> d!42509 d!42725))

(declare-fun b!136916 () Bool)

(declare-fun e!89157 () Option!179)

(assert (=> b!136916 (= e!89157 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71112)))))))

(declare-fun d!42727 () Bool)

(declare-fun c!25628 () Bool)

(assert (=> d!42727 (= c!25628 (and ((_ is Cons!1719) (toList!873 lt!71112)) (= (_1!1332 (h!2325 (toList!873 lt!71112))) lt!71111)))))

(assert (=> d!42727 (= (getValueByKey!173 (toList!873 lt!71112) lt!71111) e!89157)))

(declare-fun b!136917 () Bool)

(declare-fun e!89158 () Option!179)

(assert (=> b!136917 (= e!89157 e!89158)))

(declare-fun c!25629 () Bool)

(assert (=> b!136917 (= c!25629 (and ((_ is Cons!1719) (toList!873 lt!71112)) (not (= (_1!1332 (h!2325 (toList!873 lt!71112))) lt!71111))))))

(declare-fun b!136918 () Bool)

(assert (=> b!136918 (= e!89158 (getValueByKey!173 (t!6211 (toList!873 lt!71112)) lt!71111))))

(declare-fun b!136919 () Bool)

(assert (=> b!136919 (= e!89158 None!177)))

(assert (= (and d!42727 c!25628) b!136916))

(assert (= (and d!42727 (not c!25628)) b!136917))

(assert (= (and b!136917 c!25629) b!136918))

(assert (= (and b!136917 (not c!25629)) b!136919))

(declare-fun m!163351 () Bool)

(assert (=> b!136918 m!163351))

(assert (=> d!42509 d!42727))

(declare-fun d!42729 () Bool)

(declare-fun e!89159 () Bool)

(assert (=> d!42729 e!89159))

(declare-fun res!65685 () Bool)

(assert (=> d!42729 (=> (not res!65685) (not e!89159))))

(declare-fun lt!71607 () ListLongMap!1715)

(assert (=> d!42729 (= res!65685 (contains!905 lt!71607 (_1!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(declare-fun lt!71606 () List!1723)

(assert (=> d!42729 (= lt!71607 (ListLongMap!1716 lt!71606))))

(declare-fun lt!71605 () Unit!4275)

(declare-fun lt!71608 () Unit!4275)

(assert (=> d!42729 (= lt!71605 lt!71608)))

(assert (=> d!42729 (= (getValueByKey!173 lt!71606 (_1!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!42729 (= lt!71608 (lemmaContainsTupThenGetReturnValue!88 lt!71606 (_1!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (_2!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!42729 (= lt!71606 (insertStrictlySorted!91 (toList!873 (ite c!25466 call!15005 (ite c!25471 call!15004 call!14999))) (_1!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (_2!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!42729 (= (+!176 (ite c!25466 call!15005 (ite c!25471 call!15004 call!14999)) (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) lt!71607)))

(declare-fun b!136920 () Bool)

(declare-fun res!65684 () Bool)

(assert (=> b!136920 (=> (not res!65684) (not e!89159))))

(assert (=> b!136920 (= res!65684 (= (getValueByKey!173 (toList!873 lt!71607) (_1!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))))

(declare-fun b!136921 () Bool)

(assert (=> b!136921 (= e!89159 (contains!907 (toList!873 lt!71607) (ite (or c!25466 c!25471) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (= (and d!42729 res!65685) b!136920))

(assert (= (and b!136920 res!65684) b!136921))

(declare-fun m!163353 () Bool)

(assert (=> d!42729 m!163353))

(declare-fun m!163355 () Bool)

(assert (=> d!42729 m!163355))

(declare-fun m!163357 () Bool)

(assert (=> d!42729 m!163357))

(declare-fun m!163359 () Bool)

(assert (=> d!42729 m!163359))

(declare-fun m!163361 () Bool)

(assert (=> b!136920 m!163361))

(declare-fun m!163363 () Bool)

(assert (=> b!136921 m!163363))

(assert (=> bm!14997 d!42729))

(declare-fun d!42731 () Bool)

(assert (=> d!42731 (= (inRange!0 (ite c!25534 (index!3265 lt!71374) (index!3268 lt!71374)) (mask!7203 newMap!16)) (and (bvsge (ite c!25534 (index!3265 lt!71374) (index!3268 lt!71374)) #b00000000000000000000000000000000) (bvslt (ite c!25534 (index!3265 lt!71374) (index!3268 lt!71374)) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15033 d!42731))

(assert (=> d!42535 d!42589))

(assert (=> d!42457 d!42589))

(declare-fun d!42733 () Bool)

(declare-fun e!89160 () Bool)

(assert (=> d!42733 e!89160))

(declare-fun res!65687 () Bool)

(assert (=> d!42733 (=> (not res!65687) (not e!89160))))

(declare-fun lt!71611 () ListLongMap!1715)

(assert (=> d!42733 (= res!65687 (contains!905 lt!71611 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(declare-fun lt!71610 () List!1723)

(assert (=> d!42733 (= lt!71611 (ListLongMap!1716 lt!71610))))

(declare-fun lt!71609 () Unit!4275)

(declare-fun lt!71612 () Unit!4275)

(assert (=> d!42733 (= lt!71609 lt!71612)))

(assert (=> d!42733 (= (getValueByKey!173 lt!71610 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42733 (= lt!71612 (lemmaContainsTupThenGetReturnValue!88 lt!71610 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42733 (= lt!71610 (insertStrictlySorted!91 (toList!873 call!15046) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (=> d!42733 (= (+!176 call!15046 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))) lt!71611)))

(declare-fun b!136922 () Bool)

(declare-fun res!65686 () Bool)

(assert (=> b!136922 (=> (not res!65686) (not e!89160))))

(assert (=> b!136922 (= res!65686 (= (getValueByKey!173 (toList!873 lt!71611) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(declare-fun b!136923 () Bool)

(assert (=> b!136923 (= e!89160 (contains!907 (toList!873 lt!71611) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))

(assert (= (and d!42733 res!65687) b!136922))

(assert (= (and b!136922 res!65686) b!136923))

(declare-fun m!163365 () Bool)

(assert (=> d!42733 m!163365))

(declare-fun m!163367 () Bool)

(assert (=> d!42733 m!163367))

(declare-fun m!163369 () Bool)

(assert (=> d!42733 m!163369))

(declare-fun m!163371 () Bool)

(assert (=> d!42733 m!163371))

(declare-fun m!163373 () Bool)

(assert (=> b!136922 m!163373))

(declare-fun m!163375 () Bool)

(assert (=> b!136923 m!163375))

(assert (=> b!136612 d!42733))

(declare-fun d!42735 () Bool)

(assert (=> d!42735 (isDefined!126 (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(declare-fun lt!71613 () Unit!4275)

(assert (=> d!42735 (= lt!71613 (choose!833 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(declare-fun e!89161 () Bool)

(assert (=> d!42735 e!89161))

(declare-fun res!65688 () Bool)

(assert (=> d!42735 (=> (not res!65688) (not e!89161))))

(assert (=> d!42735 (= res!65688 (isStrictlySorted!323 (toList!873 call!14967)))))

(assert (=> d!42735 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))) lt!71613)))

(declare-fun b!136924 () Bool)

(assert (=> b!136924 (= e!89161 (containsKey!177 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(assert (= (and d!42735 res!65688) b!136924))

(assert (=> d!42735 m!162737))

(assert (=> d!42735 m!162737))

(assert (=> d!42735 m!162739))

(declare-fun m!163377 () Bool)

(assert (=> d!42735 m!163377))

(declare-fun m!163379 () Bool)

(assert (=> d!42735 m!163379))

(assert (=> b!136924 m!162733))

(assert (=> b!136569 d!42735))

(declare-fun d!42737 () Bool)

(assert (=> d!42737 (= (isDefined!126 (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))) (not (isEmpty!412 (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))))

(declare-fun bs!5738 () Bool)

(assert (= bs!5738 d!42737))

(assert (=> bs!5738 m!162737))

(declare-fun m!163381 () Bool)

(assert (=> bs!5738 m!163381))

(assert (=> b!136569 d!42737))

(declare-fun b!136925 () Bool)

(declare-fun e!89162 () Option!179)

(assert (=> b!136925 (= e!89162 (Some!178 (_2!1332 (h!2325 (toList!873 call!14967)))))))

(declare-fun d!42739 () Bool)

(declare-fun c!25630 () Bool)

(assert (=> d!42739 (= c!25630 (and ((_ is Cons!1719) (toList!873 call!14967)) (= (_1!1332 (h!2325 (toList!873 call!14967))) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))))

(assert (=> d!42739 (= (getValueByKey!173 (toList!873 call!14967) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))) e!89162)))

(declare-fun b!136926 () Bool)

(declare-fun e!89163 () Option!179)

(assert (=> b!136926 (= e!89162 e!89163)))

(declare-fun c!25631 () Bool)

(assert (=> b!136926 (= c!25631 (and ((_ is Cons!1719) (toList!873 call!14967)) (not (= (_1!1332 (h!2325 (toList!873 call!14967))) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))))

(declare-fun b!136927 () Bool)

(assert (=> b!136927 (= e!89163 (getValueByKey!173 (t!6211 (toList!873 call!14967)) (ite c!25435 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(declare-fun b!136928 () Bool)

(assert (=> b!136928 (= e!89163 None!177)))

(assert (= (and d!42739 c!25630) b!136925))

(assert (= (and d!42739 (not c!25630)) b!136926))

(assert (= (and b!136926 c!25631) b!136927))

(assert (= (and b!136926 (not c!25631)) b!136928))

(declare-fun m!163383 () Bool)

(assert (=> b!136927 m!163383))

(assert (=> b!136569 d!42739))

(declare-fun d!42741 () Bool)

(declare-fun e!89164 () Bool)

(assert (=> d!42741 e!89164))

(declare-fun res!65689 () Bool)

(assert (=> d!42741 (=> res!65689 e!89164)))

(declare-fun lt!71616 () Bool)

(assert (=> d!42741 (= res!65689 (not lt!71616))))

(declare-fun lt!71614 () Bool)

(assert (=> d!42741 (= lt!71616 lt!71614)))

(declare-fun lt!71617 () Unit!4275)

(declare-fun e!89165 () Unit!4275)

(assert (=> d!42741 (= lt!71617 e!89165)))

(declare-fun c!25632 () Bool)

(assert (=> d!42741 (= c!25632 lt!71614)))

(assert (=> d!42741 (= lt!71614 (containsKey!177 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42741 (= (contains!905 lt!71340 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71616)))

(declare-fun b!136929 () Bool)

(declare-fun lt!71615 () Unit!4275)

(assert (=> b!136929 (= e!89165 lt!71615)))

(assert (=> b!136929 (= lt!71615 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> b!136929 (isDefined!126 (getValueByKey!173 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136930 () Bool)

(declare-fun Unit!4309 () Unit!4275)

(assert (=> b!136930 (= e!89165 Unit!4309)))

(declare-fun b!136931 () Bool)

(assert (=> b!136931 (= e!89164 (isDefined!126 (getValueByKey!173 (toList!873 lt!71340) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42741 c!25632) b!136929))

(assert (= (and d!42741 (not c!25632)) b!136930))

(assert (= (and d!42741 (not res!65689)) b!136931))

(declare-fun m!163385 () Bool)

(assert (=> d!42741 m!163385))

(declare-fun m!163387 () Bool)

(assert (=> b!136929 m!163387))

(assert (=> b!136929 m!162621))

(assert (=> b!136929 m!162621))

(declare-fun m!163389 () Bool)

(assert (=> b!136929 m!163389))

(assert (=> b!136931 m!162621))

(assert (=> b!136931 m!162621))

(assert (=> b!136931 m!163389))

(assert (=> d!42505 d!42741))

(declare-fun b!136932 () Bool)

(declare-fun e!89166 () Option!179)

(assert (=> b!136932 (= e!89166 (Some!178 (_2!1332 (h!2325 lt!71339))))))

(declare-fun c!25633 () Bool)

(declare-fun d!42743 () Bool)

(assert (=> d!42743 (= c!25633 (and ((_ is Cons!1719) lt!71339) (= (_1!1332 (h!2325 lt!71339)) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42743 (= (getValueByKey!173 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89166)))

(declare-fun b!136933 () Bool)

(declare-fun e!89167 () Option!179)

(assert (=> b!136933 (= e!89166 e!89167)))

(declare-fun c!25634 () Bool)

(assert (=> b!136933 (= c!25634 (and ((_ is Cons!1719) lt!71339) (not (= (_1!1332 (h!2325 lt!71339)) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!136934 () Bool)

(assert (=> b!136934 (= e!89167 (getValueByKey!173 (t!6211 lt!71339) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136935 () Bool)

(assert (=> b!136935 (= e!89167 None!177)))

(assert (= (and d!42743 c!25633) b!136932))

(assert (= (and d!42743 (not c!25633)) b!136933))

(assert (= (and b!136933 c!25634) b!136934))

(assert (= (and b!136933 (not c!25634)) b!136935))

(declare-fun m!163391 () Bool)

(assert (=> b!136934 m!163391))

(assert (=> d!42505 d!42743))

(declare-fun d!42745 () Bool)

(assert (=> d!42745 (= (getValueByKey!173 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71618 () Unit!4275)

(assert (=> d!42745 (= lt!71618 (choose!841 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89168 () Bool)

(assert (=> d!42745 e!89168))

(declare-fun res!65690 () Bool)

(assert (=> d!42745 (=> (not res!65690) (not e!89168))))

(assert (=> d!42745 (= res!65690 (isStrictlySorted!323 lt!71339))))

(assert (=> d!42745 (= (lemmaContainsTupThenGetReturnValue!88 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71618)))

(declare-fun b!136936 () Bool)

(declare-fun res!65691 () Bool)

(assert (=> b!136936 (=> (not res!65691) (not e!89168))))

(assert (=> b!136936 (= res!65691 (containsKey!177 lt!71339 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136937 () Bool)

(assert (=> b!136937 (= e!89168 (contains!907 lt!71339 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42745 res!65690) b!136936))

(assert (= (and b!136936 res!65691) b!136937))

(assert (=> d!42745 m!162615))

(declare-fun m!163393 () Bool)

(assert (=> d!42745 m!163393))

(declare-fun m!163395 () Bool)

(assert (=> d!42745 m!163395))

(declare-fun m!163397 () Bool)

(assert (=> b!136936 m!163397))

(declare-fun m!163399 () Bool)

(assert (=> b!136937 m!163399))

(assert (=> d!42505 d!42745))

(declare-fun bm!15079 () Bool)

(declare-fun call!15082 () List!1723)

(declare-fun call!15084 () List!1723)

(assert (=> bm!15079 (= call!15082 call!15084)))

(declare-fun b!136938 () Bool)

(declare-fun e!89171 () List!1723)

(declare-fun call!15083 () List!1723)

(assert (=> b!136938 (= e!89171 call!15083)))

(declare-fun b!136939 () Bool)

(declare-fun e!89170 () List!1723)

(assert (=> b!136939 (= e!89170 call!15082)))

(declare-fun b!136940 () Bool)

(declare-fun e!89173 () List!1723)

(assert (=> b!136940 (= e!89173 call!15084)))

(declare-fun e!89169 () List!1723)

(declare-fun b!136941 () Bool)

(declare-fun c!25636 () Bool)

(declare-fun c!25635 () Bool)

(assert (=> b!136941 (= e!89169 (ite c!25636 (t!6211 (toList!873 lt!71102)) (ite c!25635 (Cons!1719 (h!2325 (toList!873 lt!71102)) (t!6211 (toList!873 lt!71102))) Nil!1720)))))

(declare-fun b!136942 () Bool)

(declare-fun e!89172 () Bool)

(declare-fun lt!71619 () List!1723)

(assert (=> b!136942 (= e!89172 (contains!907 lt!71619 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun bm!15080 () Bool)

(assert (=> bm!15080 (= call!15084 call!15083)))

(declare-fun c!25637 () Bool)

(declare-fun bm!15081 () Bool)

(assert (=> bm!15081 (= call!15083 ($colon$colon!93 e!89169 (ite c!25637 (h!2325 (toList!873 lt!71102)) (tuple2!2643 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun c!25638 () Bool)

(assert (=> bm!15081 (= c!25638 c!25637)))

(declare-fun b!136943 () Bool)

(assert (=> b!136943 (= e!89169 (insertStrictlySorted!91 (t!6211 (toList!873 lt!71102)) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun d!42747 () Bool)

(assert (=> d!42747 e!89172))

(declare-fun res!65692 () Bool)

(assert (=> d!42747 (=> (not res!65692) (not e!89172))))

(assert (=> d!42747 (= res!65692 (isStrictlySorted!323 lt!71619))))

(assert (=> d!42747 (= lt!71619 e!89171)))

(assert (=> d!42747 (= c!25637 (and ((_ is Cons!1719) (toList!873 lt!71102)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71102))) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42747 (isStrictlySorted!323 (toList!873 lt!71102))))

(assert (=> d!42747 (= (insertStrictlySorted!91 (toList!873 lt!71102) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71619)))

(declare-fun b!136944 () Bool)

(assert (=> b!136944 (= c!25635 (and ((_ is Cons!1719) (toList!873 lt!71102)) (bvsgt (_1!1332 (h!2325 (toList!873 lt!71102))) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!136944 (= e!89173 e!89170)))

(declare-fun b!136945 () Bool)

(declare-fun res!65693 () Bool)

(assert (=> b!136945 (=> (not res!65693) (not e!89172))))

(assert (=> b!136945 (= res!65693 (containsKey!177 lt!71619 (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!136946 () Bool)

(assert (=> b!136946 (= e!89171 e!89173)))

(assert (=> b!136946 (= c!25636 (and ((_ is Cons!1719) (toList!873 lt!71102)) (= (_1!1332 (h!2325 (toList!873 lt!71102))) (_1!1332 (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!136947 () Bool)

(assert (=> b!136947 (= e!89170 call!15082)))

(assert (= (and d!42747 c!25637) b!136938))

(assert (= (and d!42747 (not c!25637)) b!136946))

(assert (= (and b!136946 c!25636) b!136940))

(assert (= (and b!136946 (not c!25636)) b!136944))

(assert (= (and b!136944 c!25635) b!136947))

(assert (= (and b!136944 (not c!25635)) b!136939))

(assert (= (or b!136947 b!136939) bm!15079))

(assert (= (or b!136940 bm!15079) bm!15080))

(assert (= (or b!136938 bm!15080) bm!15081))

(assert (= (and bm!15081 c!25638) b!136943))

(assert (= (and bm!15081 (not c!25638)) b!136941))

(assert (= (and d!42747 res!65692) b!136945))

(assert (= (and b!136945 res!65693) b!136942))

(declare-fun m!163401 () Bool)

(assert (=> b!136943 m!163401))

(declare-fun m!163403 () Bool)

(assert (=> bm!15081 m!163403))

(declare-fun m!163405 () Bool)

(assert (=> d!42747 m!163405))

(declare-fun m!163407 () Bool)

(assert (=> d!42747 m!163407))

(declare-fun m!163409 () Bool)

(assert (=> b!136945 m!163409))

(declare-fun m!163411 () Bool)

(assert (=> b!136942 m!163411))

(assert (=> d!42505 d!42747))

(declare-fun d!42749 () Bool)

(assert (=> d!42749 (= (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114)) (not (isEmpty!412 (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))))

(declare-fun bs!5739 () Bool)

(assert (= bs!5739 d!42749))

(assert (=> bs!5739 m!162573))

(declare-fun m!163413 () Bool)

(assert (=> bs!5739 m!163413))

(assert (=> b!136441 d!42749))

(declare-fun b!136948 () Bool)

(declare-fun e!89174 () Option!179)

(assert (=> b!136948 (= e!89174 (Some!178 (_2!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun c!25639 () Bool)

(declare-fun d!42751 () Bool)

(assert (=> d!42751 (= c!25639 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71114)))))

(assert (=> d!42751 (= (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114) e!89174)))

(declare-fun b!136949 () Bool)

(declare-fun e!89175 () Option!179)

(assert (=> b!136949 (= e!89174 e!89175)))

(declare-fun c!25640 () Bool)

(assert (=> b!136949 (= c!25640 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (not (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71114))))))

(declare-fun b!136950 () Bool)

(assert (=> b!136950 (= e!89175 (getValueByKey!173 (t!6211 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71114))))

(declare-fun b!136951 () Bool)

(assert (=> b!136951 (= e!89175 None!177)))

(assert (= (and d!42751 c!25639) b!136948))

(assert (= (and d!42751 (not c!25639)) b!136949))

(assert (= (and b!136949 c!25640) b!136950))

(assert (= (and b!136949 (not c!25640)) b!136951))

(declare-fun m!163415 () Bool)

(assert (=> b!136950 m!163415))

(assert (=> b!136441 d!42751))

(assert (=> d!42515 d!42503))

(assert (=> d!42515 d!42507))

(declare-fun d!42753 () Bool)

(declare-fun e!89176 () Bool)

(assert (=> d!42753 e!89176))

(declare-fun res!65694 () Bool)

(assert (=> d!42753 (=> res!65694 e!89176)))

(declare-fun lt!71622 () Bool)

(assert (=> d!42753 (= res!65694 (not lt!71622))))

(declare-fun lt!71620 () Bool)

(assert (=> d!42753 (= lt!71622 lt!71620)))

(declare-fun lt!71623 () Unit!4275)

(declare-fun e!89177 () Unit!4275)

(assert (=> d!42753 (= lt!71623 e!89177)))

(declare-fun c!25641 () Bool)

(assert (=> d!42753 (= c!25641 lt!71620)))

(assert (=> d!42753 (= lt!71620 (containsKey!177 (toList!873 lt!71103) lt!71118))))

(assert (=> d!42753 (= (contains!905 lt!71103 lt!71118) lt!71622)))

(declare-fun b!136952 () Bool)

(declare-fun lt!71621 () Unit!4275)

(assert (=> b!136952 (= e!89177 lt!71621)))

(assert (=> b!136952 (= lt!71621 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71103) lt!71118))))

(assert (=> b!136952 (isDefined!126 (getValueByKey!173 (toList!873 lt!71103) lt!71118))))

(declare-fun b!136953 () Bool)

(declare-fun Unit!4310 () Unit!4275)

(assert (=> b!136953 (= e!89177 Unit!4310)))

(declare-fun b!136954 () Bool)

(assert (=> b!136954 (= e!89176 (isDefined!126 (getValueByKey!173 (toList!873 lt!71103) lt!71118)))))

(assert (= (and d!42753 c!25641) b!136952))

(assert (= (and d!42753 (not c!25641)) b!136953))

(assert (= (and d!42753 (not res!65694)) b!136954))

(declare-fun m!163417 () Bool)

(assert (=> d!42753 m!163417))

(declare-fun m!163419 () Bool)

(assert (=> b!136952 m!163419))

(assert (=> b!136952 m!162609))

(assert (=> b!136952 m!162609))

(declare-fun m!163421 () Bool)

(assert (=> b!136952 m!163421))

(assert (=> b!136954 m!162609))

(assert (=> b!136954 m!162609))

(assert (=> b!136954 m!163421))

(assert (=> d!42515 d!42753))

(assert (=> d!42515 d!42517))

(declare-fun d!42755 () Bool)

(assert (=> d!42755 (= (apply!117 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71118) (apply!117 lt!71103 lt!71118))))

(assert (=> d!42755 true))

(declare-fun _$34!990 () Unit!4275)

(assert (=> d!42755 (= (choose!835 lt!71103 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71118) _$34!990)))

(declare-fun bs!5740 () Bool)

(assert (= bs!5740 d!42755))

(assert (=> bs!5740 m!162233))

(assert (=> bs!5740 m!162233))

(assert (=> bs!5740 m!162235))

(assert (=> bs!5740 m!162229))

(assert (=> d!42515 d!42755))

(declare-fun d!42757 () Bool)

(declare-fun e!89178 () Bool)

(assert (=> d!42757 e!89178))

(declare-fun res!65695 () Bool)

(assert (=> d!42757 (=> res!65695 e!89178)))

(declare-fun lt!71626 () Bool)

(assert (=> d!42757 (= res!65695 (not lt!71626))))

(declare-fun lt!71624 () Bool)

(assert (=> d!42757 (= lt!71626 lt!71624)))

(declare-fun lt!71627 () Unit!4275)

(declare-fun e!89179 () Unit!4275)

(assert (=> d!42757 (= lt!71627 e!89179)))

(declare-fun c!25642 () Bool)

(assert (=> d!42757 (= c!25642 lt!71624)))

(assert (=> d!42757 (= lt!71624 (containsKey!177 (toList!873 (map!1416 (_2!1333 lt!71291))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!42757 (= (contains!905 (map!1416 (_2!1333 lt!71291)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71626)))

(declare-fun b!136955 () Bool)

(declare-fun lt!71625 () Unit!4275)

(assert (=> b!136955 (= e!89179 lt!71625)))

(assert (=> b!136955 (= lt!71625 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (map!1416 (_2!1333 lt!71291))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> b!136955 (isDefined!126 (getValueByKey!173 (toList!873 (map!1416 (_2!1333 lt!71291))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!136956 () Bool)

(declare-fun Unit!4311 () Unit!4275)

(assert (=> b!136956 (= e!89179 Unit!4311)))

(declare-fun b!136957 () Bool)

(assert (=> b!136957 (= e!89178 (isDefined!126 (getValueByKey!173 (toList!873 (map!1416 (_2!1333 lt!71291))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (= (and d!42757 c!25642) b!136955))

(assert (= (and d!42757 (not c!25642)) b!136956))

(assert (= (and d!42757 (not res!65695)) b!136957))

(assert (=> d!42757 m!162081))

(declare-fun m!163423 () Bool)

(assert (=> d!42757 m!163423))

(assert (=> b!136955 m!162081))

(declare-fun m!163425 () Bool)

(assert (=> b!136955 m!163425))

(assert (=> b!136955 m!162081))

(declare-fun m!163427 () Bool)

(assert (=> b!136955 m!163427))

(assert (=> b!136955 m!163427))

(declare-fun m!163429 () Bool)

(assert (=> b!136955 m!163429))

(assert (=> b!136957 m!162081))

(assert (=> b!136957 m!163427))

(assert (=> b!136957 m!163427))

(assert (=> b!136957 m!163429))

(assert (=> b!136414 d!42757))

(declare-fun d!42759 () Bool)

(assert (=> d!42759 (= (map!1416 (_2!1333 lt!71291)) (getCurrentListMap!549 (_keys!4642 (_2!1333 lt!71291)) (_values!2872 (_2!1333 lt!71291)) (mask!7203 (_2!1333 lt!71291)) (extraKeys!2650 (_2!1333 lt!71291)) (zeroValue!2742 (_2!1333 lt!71291)) (minValue!2742 (_2!1333 lt!71291)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71291))))))

(declare-fun bs!5741 () Bool)

(assert (= bs!5741 d!42759))

(declare-fun m!163431 () Bool)

(assert (=> bs!5741 m!163431))

(assert (=> b!136414 d!42759))

(declare-fun d!42761 () Bool)

(declare-fun e!89180 () Bool)

(assert (=> d!42761 e!89180))

(declare-fun res!65696 () Bool)

(assert (=> d!42761 (=> res!65696 e!89180)))

(declare-fun lt!71630 () Bool)

(assert (=> d!42761 (= res!65696 (not lt!71630))))

(declare-fun lt!71628 () Bool)

(assert (=> d!42761 (= lt!71630 lt!71628)))

(declare-fun lt!71631 () Unit!4275)

(declare-fun e!89181 () Unit!4275)

(assert (=> d!42761 (= lt!71631 e!89181)))

(declare-fun c!25643 () Bool)

(assert (=> d!42761 (= c!25643 lt!71628)))

(assert (=> d!42761 (= lt!71628 (containsKey!177 (toList!873 lt!71176) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42761 (= (contains!905 lt!71176 #b0000000000000000000000000000000000000000000000000000000000000000) lt!71630)))

(declare-fun b!136958 () Bool)

(declare-fun lt!71629 () Unit!4275)

(assert (=> b!136958 (= e!89181 lt!71629)))

(assert (=> b!136958 (= lt!71629 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71176) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!136958 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!136959 () Bool)

(declare-fun Unit!4312 () Unit!4275)

(assert (=> b!136959 (= e!89181 Unit!4312)))

(declare-fun b!136960 () Bool)

(assert (=> b!136960 (= e!89180 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42761 c!25643) b!136958))

(assert (= (and d!42761 (not c!25643)) b!136959))

(assert (= (and d!42761 (not res!65696)) b!136960))

(declare-fun m!163433 () Bool)

(assert (=> d!42761 m!163433))

(declare-fun m!163435 () Bool)

(assert (=> b!136958 m!163435))

(assert (=> b!136958 m!163313))

(assert (=> b!136958 m!163313))

(declare-fun m!163437 () Bool)

(assert (=> b!136958 m!163437))

(assert (=> b!136960 m!163313))

(assert (=> b!136960 m!163313))

(assert (=> b!136960 m!163437))

(assert (=> bm!15009 d!42761))

(declare-fun d!42763 () Bool)

(declare-fun isEmpty!414 (List!1723) Bool)

(assert (=> d!42763 (= (isEmpty!413 lt!71331) (isEmpty!414 (toList!873 lt!71331)))))

(declare-fun bs!5742 () Bool)

(assert (= bs!5742 d!42763))

(declare-fun m!163439 () Bool)

(assert (=> bs!5742 m!163439))

(assert (=> b!136475 d!42763))

(declare-fun d!42765 () Bool)

(declare-fun res!65697 () Bool)

(declare-fun e!89182 () Bool)

(assert (=> d!42765 (=> res!65697 e!89182)))

(assert (=> d!42765 (= res!65697 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42765 (= (containsKey!177 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000) e!89182)))

(declare-fun b!136961 () Bool)

(declare-fun e!89183 () Bool)

(assert (=> b!136961 (= e!89182 e!89183)))

(declare-fun res!65698 () Bool)

(assert (=> b!136961 (=> (not res!65698) (not e!89183))))

(assert (=> b!136961 (= res!65698 (and (or (not ((_ is Cons!1719) (toList!873 lt!71115))) (bvsle (_1!1332 (h!2325 (toList!873 lt!71115))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1719) (toList!873 lt!71115)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71115))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136962 () Bool)

(assert (=> b!136962 (= e!89183 (containsKey!177 (t!6211 (toList!873 lt!71115)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!42765 (not res!65697)) b!136961))

(assert (= (and b!136961 res!65698) b!136962))

(declare-fun m!163441 () Bool)

(assert (=> b!136962 m!163441))

(assert (=> d!42467 d!42765))

(declare-fun b!136964 () Bool)

(declare-fun res!65702 () Bool)

(declare-fun e!89184 () Bool)

(assert (=> b!136964 (=> (not res!65702) (not e!89184))))

(assert (=> b!136964 (= res!65702 (bvsge (size!2547 (v!3221 (underlying!460 thiss!992))) (_size!604 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136965 () Bool)

(declare-fun res!65699 () Bool)

(assert (=> b!136965 (=> (not res!65699) (not e!89184))))

(assert (=> b!136965 (= res!65699 (= (size!2547 (v!3221 (underlying!460 thiss!992))) (bvadd (_size!604 (v!3221 (underlying!460 thiss!992))) (bvsdiv (bvadd (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!136966 () Bool)

(assert (=> b!136966 (= e!89184 (and (bvsge (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!604 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!136963 () Bool)

(declare-fun res!65701 () Bool)

(assert (=> b!136963 (=> (not res!65701) (not e!89184))))

(assert (=> b!136963 (= res!65701 (and (= (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001)) (= (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992))))) (bvsge (_size!604 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!604 (v!3221 (underlying!460 thiss!992))) (bvadd (mask!7203 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!42767 () Bool)

(declare-fun res!65700 () Bool)

(assert (=> d!42767 (=> (not res!65700) (not e!89184))))

(assert (=> d!42767 (= res!65700 (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992)))))))

(assert (=> d!42767 (= (simpleValid!93 (v!3221 (underlying!460 thiss!992))) e!89184)))

(assert (= (and d!42767 res!65700) b!136963))

(assert (= (and b!136963 res!65701) b!136964))

(assert (= (and b!136964 res!65702) b!136965))

(assert (= (and b!136965 res!65699) b!136966))

(declare-fun m!163443 () Bool)

(assert (=> b!136964 m!163443))

(assert (=> b!136965 m!163443))

(assert (=> d!42767 m!162273))

(assert (=> d!42469 d!42767))

(declare-fun b!136967 () Bool)

(declare-fun e!89186 () Bool)

(assert (=> b!136967 (= e!89186 (contains!908 Nil!1722 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun b!136968 () Bool)

(declare-fun e!89188 () Bool)

(declare-fun e!89187 () Bool)

(assert (=> b!136968 (= e!89188 e!89187)))

(declare-fun c!25644 () Bool)

(assert (=> b!136968 (= c!25644 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun d!42769 () Bool)

(declare-fun res!65703 () Bool)

(declare-fun e!89185 () Bool)

(assert (=> d!42769 (=> res!65703 e!89185)))

(assert (=> d!42769 (= res!65703 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (=> d!42769 (= (arrayNoDuplicates!0 (_keys!4642 (_2!1333 lt!71054)) #b00000000000000000000000000000000 Nil!1722) e!89185)))

(declare-fun bm!15082 () Bool)

(declare-fun call!15085 () Bool)

(assert (=> bm!15082 (= call!15085 (arrayNoDuplicates!0 (_keys!4642 (_2!1333 lt!71054)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25644 (Cons!1721 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000) Nil!1722) Nil!1722)))))

(declare-fun b!136969 () Bool)

(assert (=> b!136969 (= e!89185 e!89188)))

(declare-fun res!65704 () Bool)

(assert (=> b!136969 (=> (not res!65704) (not e!89188))))

(assert (=> b!136969 (= res!65704 (not e!89186))))

(declare-fun res!65705 () Bool)

(assert (=> b!136969 (=> (not res!65705) (not e!89186))))

(assert (=> b!136969 (= res!65705 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun b!136970 () Bool)

(assert (=> b!136970 (= e!89187 call!15085)))

(declare-fun b!136971 () Bool)

(assert (=> b!136971 (= e!89187 call!15085)))

(assert (= (and d!42769 (not res!65703)) b!136969))

(assert (= (and b!136969 res!65705) b!136967))

(assert (= (and b!136969 res!65704) b!136968))

(assert (= (and b!136968 c!25644) b!136971))

(assert (= (and b!136968 (not c!25644)) b!136970))

(assert (= (or b!136971 b!136970) bm!15082))

(assert (=> b!136967 m!163169))

(assert (=> b!136967 m!163169))

(declare-fun m!163445 () Bool)

(assert (=> b!136967 m!163445))

(assert (=> b!136968 m!163169))

(assert (=> b!136968 m!163169))

(assert (=> b!136968 m!163179))

(assert (=> bm!15082 m!163169))

(declare-fun m!163447 () Bool)

(assert (=> bm!15082 m!163447))

(assert (=> b!136969 m!163169))

(assert (=> b!136969 m!163169))

(assert (=> b!136969 m!163179))

(assert (=> b!136589 d!42769))

(declare-fun d!42771 () Bool)

(assert (=> d!42771 (= (isEmpty!412 (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) (not ((_ is Some!178) (getValueByKey!173 (toList!873 lt!70951) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(assert (=> d!42475 d!42771))

(declare-fun b!136972 () Bool)

(declare-fun e!89190 () Bool)

(assert (=> b!136972 (= e!89190 (contains!908 (ite c!25542 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722) (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136973 () Bool)

(declare-fun e!89192 () Bool)

(declare-fun e!89191 () Bool)

(assert (=> b!136973 (= e!89192 e!89191)))

(declare-fun c!25645 () Bool)

(assert (=> b!136973 (= c!25645 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!42773 () Bool)

(declare-fun res!65706 () Bool)

(declare-fun e!89189 () Bool)

(assert (=> d!42773 (=> res!65706 e!89189)))

(assert (=> d!42773 (= res!65706 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42773 (= (arrayNoDuplicates!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!25542 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722)) e!89189)))

(declare-fun bm!15083 () Bool)

(declare-fun call!15086 () Bool)

(assert (=> bm!15083 (= call!15086 (arrayNoDuplicates!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!25645 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!25542 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722)) (ite c!25542 (Cons!1721 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) Nil!1722) Nil!1722))))))

(declare-fun b!136974 () Bool)

(assert (=> b!136974 (= e!89189 e!89192)))

(declare-fun res!65707 () Bool)

(assert (=> b!136974 (=> (not res!65707) (not e!89192))))

(assert (=> b!136974 (= res!65707 (not e!89190))))

(declare-fun res!65708 () Bool)

(assert (=> b!136974 (=> (not res!65708) (not e!89190))))

(assert (=> b!136974 (= res!65708 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!136975 () Bool)

(assert (=> b!136975 (= e!89191 call!15086)))

(declare-fun b!136976 () Bool)

(assert (=> b!136976 (= e!89191 call!15086)))

(assert (= (and d!42773 (not res!65706)) b!136974))

(assert (= (and b!136974 res!65708) b!136972))

(assert (= (and b!136974 res!65707) b!136973))

(assert (= (and b!136973 c!25645) b!136976))

(assert (= (and b!136973 (not c!25645)) b!136975))

(assert (= (or b!136976 b!136975) bm!15083))

(declare-fun m!163449 () Bool)

(assert (=> b!136972 m!163449))

(assert (=> b!136972 m!163449))

(declare-fun m!163451 () Bool)

(assert (=> b!136972 m!163451))

(assert (=> b!136973 m!163449))

(assert (=> b!136973 m!163449))

(declare-fun m!163453 () Bool)

(assert (=> b!136973 m!163453))

(assert (=> bm!15083 m!163449))

(declare-fun m!163455 () Bool)

(assert (=> bm!15083 m!163455))

(assert (=> b!136974 m!163449))

(assert (=> b!136974 m!163449))

(assert (=> b!136974 m!163453))

(assert (=> bm!15039 d!42773))

(assert (=> d!42519 d!42497))

(assert (=> d!42519 d!42499))

(declare-fun d!42775 () Bool)

(assert (=> d!42775 (contains!905 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71114)))

(assert (=> d!42775 true))

(declare-fun _$35!386 () Unit!4275)

(assert (=> d!42775 (= (choose!836 lt!71121 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) lt!71114) _$35!386)))

(declare-fun bs!5743 () Bool)

(assert (= bs!5743 d!42775))

(assert (=> bs!5743 m!162239))

(assert (=> bs!5743 m!162239))

(assert (=> bs!5743 m!162241))

(assert (=> d!42519 d!42775))

(declare-fun d!42777 () Bool)

(declare-fun e!89193 () Bool)

(assert (=> d!42777 e!89193))

(declare-fun res!65709 () Bool)

(assert (=> d!42777 (=> res!65709 e!89193)))

(declare-fun lt!71634 () Bool)

(assert (=> d!42777 (= res!65709 (not lt!71634))))

(declare-fun lt!71632 () Bool)

(assert (=> d!42777 (= lt!71634 lt!71632)))

(declare-fun lt!71635 () Unit!4275)

(declare-fun e!89194 () Unit!4275)

(assert (=> d!42777 (= lt!71635 e!89194)))

(declare-fun c!25646 () Bool)

(assert (=> d!42777 (= c!25646 lt!71632)))

(assert (=> d!42777 (= lt!71632 (containsKey!177 (toList!873 lt!71121) lt!71114))))

(assert (=> d!42777 (= (contains!905 lt!71121 lt!71114) lt!71634)))

(declare-fun b!136978 () Bool)

(declare-fun lt!71633 () Unit!4275)

(assert (=> b!136978 (= e!89194 lt!71633)))

(assert (=> b!136978 (= lt!71633 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71121) lt!71114))))

(assert (=> b!136978 (isDefined!126 (getValueByKey!173 (toList!873 lt!71121) lt!71114))))

(declare-fun b!136979 () Bool)

(declare-fun Unit!4313 () Unit!4275)

(assert (=> b!136979 (= e!89194 Unit!4313)))

(declare-fun b!136980 () Bool)

(assert (=> b!136980 (= e!89193 (isDefined!126 (getValueByKey!173 (toList!873 lt!71121) lt!71114)))))

(assert (= (and d!42777 c!25646) b!136978))

(assert (= (and d!42777 (not c!25646)) b!136979))

(assert (= (and d!42777 (not res!65709)) b!136980))

(declare-fun m!163457 () Bool)

(assert (=> d!42777 m!163457))

(declare-fun m!163459 () Bool)

(assert (=> b!136978 m!163459))

(declare-fun m!163461 () Bool)

(assert (=> b!136978 m!163461))

(assert (=> b!136978 m!163461))

(declare-fun m!163463 () Bool)

(assert (=> b!136978 m!163463))

(assert (=> b!136980 m!163461))

(assert (=> b!136980 m!163461))

(assert (=> b!136980 m!163463))

(assert (=> d!42519 d!42777))

(declare-fun d!42779 () Bool)

(assert (=> d!42779 (= (inRange!0 (ite c!25496 (index!3266 lt!71278) (ite c!25495 (index!3265 lt!71290) (index!3268 lt!71290))) (mask!7203 newMap!16)) (and (bvsge (ite c!25496 (index!3266 lt!71278) (ite c!25495 (index!3265 lt!71290) (index!3268 lt!71290))) #b00000000000000000000000000000000) (bvslt (ite c!25496 (index!3266 lt!71278) (ite c!25495 (index!3265 lt!71290) (index!3268 lt!71290))) (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15021 d!42779))

(declare-fun d!42781 () Bool)

(assert (=> d!42781 (= (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!412 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5744 () Bool)

(assert (= bs!5744 d!42781))

(assert (=> bs!5744 m!162553))

(declare-fun m!163465 () Bool)

(assert (=> bs!5744 m!163465))

(assert (=> b!136500 d!42781))

(declare-fun b!136981 () Bool)

(declare-fun e!89195 () Option!179)

(assert (=> b!136981 (= e!89195 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71115)))))))

(declare-fun d!42783 () Bool)

(declare-fun c!25647 () Bool)

(assert (=> d!42783 (= c!25647 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!42783 (= (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!89195)))

(declare-fun b!136982 () Bool)

(declare-fun e!89196 () Option!179)

(assert (=> b!136982 (= e!89195 e!89196)))

(declare-fun c!25648 () Bool)

(assert (=> b!136982 (= c!25648 (and ((_ is Cons!1719) (toList!873 lt!71115)) (not (= (_1!1332 (h!2325 (toList!873 lt!71115))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!136983 () Bool)

(assert (=> b!136983 (= e!89196 (getValueByKey!173 (t!6211 (toList!873 lt!71115)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!136984 () Bool)

(assert (=> b!136984 (= e!89196 None!177)))

(assert (= (and d!42783 c!25647) b!136981))

(assert (= (and d!42783 (not c!25647)) b!136982))

(assert (= (and b!136982 c!25648) b!136983))

(assert (= (and b!136982 (not c!25648)) b!136984))

(assert (=> b!136983 m!162243))

(declare-fun m!163467 () Bool)

(assert (=> b!136983 m!163467))

(assert (=> b!136500 d!42783))

(declare-fun b!136985 () Bool)

(declare-fun e!89202 () Bool)

(assert (=> b!136985 (= e!89202 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!136985 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!136986 () Bool)

(declare-fun res!65713 () Bool)

(declare-fun e!89197 () Bool)

(assert (=> b!136986 (=> (not res!65713) (not e!89197))))

(declare-fun lt!71636 () ListLongMap!1715)

(assert (=> b!136986 (= res!65713 (not (contains!905 lt!71636 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!136987 () Bool)

(declare-fun e!89201 () ListLongMap!1715)

(declare-fun e!89200 () ListLongMap!1715)

(assert (=> b!136987 (= e!89201 e!89200)))

(declare-fun c!25651 () Bool)

(assert (=> b!136987 (= c!25651 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun e!89198 () Bool)

(declare-fun b!136988 () Bool)

(assert (=> b!136988 (= e!89198 (= lt!71636 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136989 () Bool)

(declare-fun e!89203 () Bool)

(assert (=> b!136989 (= e!89197 e!89203)))

(declare-fun c!25649 () Bool)

(assert (=> b!136989 (= c!25649 e!89202)))

(declare-fun res!65711 () Bool)

(assert (=> b!136989 (=> (not res!65711) (not e!89202))))

(assert (=> b!136989 (= res!65711 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun d!42785 () Bool)

(assert (=> d!42785 e!89197))

(declare-fun res!65710 () Bool)

(assert (=> d!42785 (=> (not res!65710) (not e!89197))))

(assert (=> d!42785 (= res!65710 (not (contains!905 lt!71636 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42785 (= lt!71636 e!89201)))

(declare-fun c!25650 () Bool)

(assert (=> d!42785 (= c!25650 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42785 (validMask!0 (mask!7203 (v!3221 (underlying!460 thiss!992))))))

(assert (=> d!42785 (= (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))) lt!71636)))

(declare-fun b!136990 () Bool)

(declare-fun lt!71637 () Unit!4275)

(declare-fun lt!71640 () Unit!4275)

(assert (=> b!136990 (= lt!71637 lt!71640)))

(declare-fun lt!71639 () ListLongMap!1715)

(declare-fun lt!71641 () V!3499)

(declare-fun lt!71642 () (_ BitVec 64))

(declare-fun lt!71638 () (_ BitVec 64))

(assert (=> b!136990 (not (contains!905 (+!176 lt!71639 (tuple2!2643 lt!71642 lt!71641)) lt!71638))))

(assert (=> b!136990 (= lt!71640 (addStillNotContains!62 lt!71639 lt!71642 lt!71641 lt!71638))))

(assert (=> b!136990 (= lt!71638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!136990 (= lt!71641 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136990 (= lt!71642 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!15087 () ListLongMap!1715)

(assert (=> b!136990 (= lt!71639 call!15087)))

(assert (=> b!136990 (= e!89200 (+!176 call!15087 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!136991 () Bool)

(declare-fun e!89199 () Bool)

(assert (=> b!136991 (= e!89203 e!89199)))

(assert (=> b!136991 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun res!65712 () Bool)

(assert (=> b!136991 (= res!65712 (contains!905 lt!71636 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!136991 (=> (not res!65712) (not e!89199))))

(declare-fun b!136992 () Bool)

(assert (=> b!136992 (= e!89198 (isEmpty!413 lt!71636))))

(declare-fun bm!15084 () Bool)

(assert (=> bm!15084 (= call!15087 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (_values!2872 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992))) (extraKeys!2650 (v!3221 (underlying!460 thiss!992))) (zeroValue!2742 (v!3221 (underlying!460 thiss!992))) (minValue!2742 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun b!136993 () Bool)

(assert (=> b!136993 (= e!89201 (ListLongMap!1716 Nil!1720))))

(declare-fun b!136994 () Bool)

(assert (=> b!136994 (= e!89203 e!89198)))

(declare-fun c!25652 () Bool)

(assert (=> b!136994 (= c!25652 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!136995 () Bool)

(assert (=> b!136995 (= e!89200 call!15087)))

(declare-fun b!136996 () Bool)

(assert (=> b!136996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> b!136996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2544 (_values!2872 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> b!136996 (= e!89199 (= (apply!117 lt!71636 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!42785 c!25650) b!136993))

(assert (= (and d!42785 (not c!25650)) b!136987))

(assert (= (and b!136987 c!25651) b!136990))

(assert (= (and b!136987 (not c!25651)) b!136995))

(assert (= (or b!136990 b!136995) bm!15084))

(assert (= (and d!42785 res!65710) b!136986))

(assert (= (and b!136986 res!65713) b!136989))

(assert (= (and b!136989 res!65711) b!136985))

(assert (= (and b!136989 c!25649) b!136991))

(assert (= (and b!136989 (not c!25649)) b!136994))

(assert (= (and b!136991 res!65712) b!136996))

(assert (= (and b!136994 c!25652) b!136988))

(assert (= (and b!136994 (not c!25652)) b!136992))

(declare-fun b_lambda!6119 () Bool)

(assert (=> (not b_lambda!6119) (not b!136990)))

(assert (=> b!136990 t!6208))

(declare-fun b_and!8491 () Bool)

(assert (= b_and!8487 (and (=> t!6208 result!4033) b_and!8491)))

(assert (=> b!136990 t!6210))

(declare-fun b_and!8493 () Bool)

(assert (= b_and!8489 (and (=> t!6210 result!4037) b_and!8493)))

(declare-fun b_lambda!6121 () Bool)

(assert (=> (not b_lambda!6121) (not b!136996)))

(assert (=> b!136996 t!6208))

(declare-fun b_and!8495 () Bool)

(assert (= b_and!8491 (and (=> t!6208 result!4033) b_and!8495)))

(assert (=> b!136996 t!6210))

(declare-fun b_and!8497 () Bool)

(assert (= b_and!8493 (and (=> t!6210 result!4037) b_and!8497)))

(assert (=> b!136985 m!162707))

(assert (=> b!136985 m!162707))

(declare-fun m!163469 () Bool)

(assert (=> b!136985 m!163469))

(assert (=> b!136991 m!162707))

(assert (=> b!136991 m!162707))

(declare-fun m!163471 () Bool)

(assert (=> b!136991 m!163471))

(declare-fun m!163473 () Bool)

(assert (=> b!136990 m!163473))

(declare-fun m!163475 () Bool)

(assert (=> b!136990 m!163475))

(declare-fun m!163477 () Bool)

(assert (=> b!136990 m!163477))

(declare-fun m!163479 () Bool)

(assert (=> b!136990 m!163479))

(assert (=> b!136990 m!162707))

(assert (=> b!136990 m!163475))

(assert (=> b!136990 m!163479))

(assert (=> b!136990 m!162101))

(declare-fun m!163481 () Bool)

(assert (=> b!136990 m!163481))

(declare-fun m!163483 () Bool)

(assert (=> b!136990 m!163483))

(assert (=> b!136990 m!162101))

(assert (=> b!136987 m!162707))

(assert (=> b!136987 m!162707))

(assert (=> b!136987 m!163469))

(assert (=> b!136996 m!162707))

(declare-fun m!163485 () Bool)

(assert (=> b!136996 m!163485))

(assert (=> b!136996 m!163479))

(assert (=> b!136996 m!162101))

(assert (=> b!136996 m!163481))

(assert (=> b!136996 m!162101))

(assert (=> b!136996 m!163479))

(assert (=> b!136996 m!162707))

(declare-fun m!163487 () Bool)

(assert (=> d!42785 m!163487))

(assert (=> d!42785 m!162273))

(declare-fun m!163489 () Bool)

(assert (=> b!136988 m!163489))

(assert (=> bm!15084 m!163489))

(declare-fun m!163491 () Bool)

(assert (=> b!136992 m!163491))

(declare-fun m!163493 () Bool)

(assert (=> b!136986 m!163493))

(assert (=> b!136471 d!42785))

(declare-fun d!42787 () Bool)

(assert (=> d!42787 (= (isDefined!126 (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) (not (isEmpty!412 (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun bs!5745 () Bool)

(assert (= bs!5745 d!42787))

(assert (=> bs!5745 m!162691))

(declare-fun m!163495 () Bool)

(assert (=> bs!5745 m!163495))

(assert (=> b!136497 d!42787))

(declare-fun b!136997 () Bool)

(declare-fun e!89204 () Option!179)

(assert (=> b!136997 (= e!89204 (Some!178 (_2!1332 (h!2325 (toList!873 call!14968)))))))

(declare-fun c!25653 () Bool)

(declare-fun d!42789 () Bool)

(assert (=> d!42789 (= c!25653 (and ((_ is Cons!1719) (toList!873 call!14968)) (= (_1!1332 (h!2325 (toList!873 call!14968))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42789 (= (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89204)))

(declare-fun b!136998 () Bool)

(declare-fun e!89205 () Option!179)

(assert (=> b!136998 (= e!89204 e!89205)))

(declare-fun c!25654 () Bool)

(assert (=> b!136998 (= c!25654 (and ((_ is Cons!1719) (toList!873 call!14968)) (not (= (_1!1332 (h!2325 (toList!873 call!14968))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun b!136999 () Bool)

(assert (=> b!136999 (= e!89205 (getValueByKey!173 (t!6211 (toList!873 call!14968)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!137000 () Bool)

(assert (=> b!137000 (= e!89205 None!177)))

(assert (= (and d!42789 c!25653) b!136997))

(assert (= (and d!42789 (not c!25653)) b!136998))

(assert (= (and b!136998 c!25654) b!136999))

(assert (= (and b!136998 (not c!25654)) b!137000))

(assert (=> b!136999 m!162081))

(declare-fun m!163497 () Bool)

(assert (=> b!136999 m!163497))

(assert (=> b!136497 d!42789))

(declare-fun d!42791 () Bool)

(declare-fun e!89206 () Bool)

(assert (=> d!42791 e!89206))

(declare-fun res!65714 () Bool)

(assert (=> d!42791 (=> res!65714 e!89206)))

(declare-fun lt!71645 () Bool)

(assert (=> d!42791 (= res!65714 (not lt!71645))))

(declare-fun lt!71643 () Bool)

(assert (=> d!42791 (= lt!71645 lt!71643)))

(declare-fun lt!71646 () Unit!4275)

(declare-fun e!89207 () Unit!4275)

(assert (=> d!42791 (= lt!71646 e!89207)))

(declare-fun c!25655 () Bool)

(assert (=> d!42791 (= c!25655 lt!71643)))

(assert (=> d!42791 (= lt!71643 (containsKey!177 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!42791 (= (contains!905 lt!71198 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!71645)))

(declare-fun b!137001 () Bool)

(declare-fun lt!71644 () Unit!4275)

(assert (=> b!137001 (= e!89207 lt!71644)))

(assert (=> b!137001 (= lt!71644 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!137001 (isDefined!126 (getValueByKey!173 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137002 () Bool)

(declare-fun Unit!4314 () Unit!4275)

(assert (=> b!137002 (= e!89207 Unit!4314)))

(declare-fun b!137003 () Bool)

(assert (=> b!137003 (= e!89206 (isDefined!126 (getValueByKey!173 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!42791 c!25655) b!137001))

(assert (= (and d!42791 (not c!25655)) b!137002))

(assert (= (and d!42791 (not res!65714)) b!137003))

(declare-fun m!163499 () Bool)

(assert (=> d!42791 m!163499))

(declare-fun m!163501 () Bool)

(assert (=> b!137001 m!163501))

(assert (=> b!137001 m!162457))

(assert (=> b!137001 m!162457))

(declare-fun m!163503 () Bool)

(assert (=> b!137001 m!163503))

(assert (=> b!137003 m!162457))

(assert (=> b!137003 m!162457))

(assert (=> b!137003 m!163503))

(assert (=> d!42471 d!42791))

(declare-fun b!137004 () Bool)

(declare-fun e!89208 () Option!179)

(assert (=> b!137004 (= e!89208 (Some!178 (_2!1332 (h!2325 lt!71197))))))

(declare-fun c!25656 () Bool)

(declare-fun d!42793 () Bool)

(assert (=> d!42793 (= c!25656 (and ((_ is Cons!1719) lt!71197) (= (_1!1332 (h!2325 lt!71197)) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!42793 (= (getValueByKey!173 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!89208)))

(declare-fun b!137005 () Bool)

(declare-fun e!89209 () Option!179)

(assert (=> b!137005 (= e!89208 e!89209)))

(declare-fun c!25657 () Bool)

(assert (=> b!137005 (= c!25657 (and ((_ is Cons!1719) lt!71197) (not (= (_1!1332 (h!2325 lt!71197)) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!137006 () Bool)

(assert (=> b!137006 (= e!89209 (getValueByKey!173 (t!6211 lt!71197) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137007 () Bool)

(assert (=> b!137007 (= e!89209 None!177)))

(assert (= (and d!42793 c!25656) b!137004))

(assert (= (and d!42793 (not c!25656)) b!137005))

(assert (= (and b!137005 c!25657) b!137006))

(assert (= (and b!137005 (not c!25657)) b!137007))

(declare-fun m!163505 () Bool)

(assert (=> b!137006 m!163505))

(assert (=> d!42471 d!42793))

(declare-fun d!42795 () Bool)

(assert (=> d!42795 (= (getValueByKey!173 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!178 (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!71647 () Unit!4275)

(assert (=> d!42795 (= lt!71647 (choose!841 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!89210 () Bool)

(assert (=> d!42795 e!89210))

(declare-fun res!65715 () Bool)

(assert (=> d!42795 (=> (not res!65715) (not e!89210))))

(assert (=> d!42795 (= res!65715 (isStrictlySorted!323 lt!71197))))

(assert (=> d!42795 (= (lemmaContainsTupThenGetReturnValue!88 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!71647)))

(declare-fun b!137008 () Bool)

(declare-fun res!65716 () Bool)

(assert (=> b!137008 (=> (not res!65716) (not e!89210))))

(assert (=> b!137008 (= res!65716 (containsKey!177 lt!71197 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137009 () Bool)

(assert (=> b!137009 (= e!89210 (contains!907 lt!71197 (tuple2!2643 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!42795 res!65715) b!137008))

(assert (= (and b!137008 res!65716) b!137009))

(assert (=> d!42795 m!162451))

(declare-fun m!163507 () Bool)

(assert (=> d!42795 m!163507))

(declare-fun m!163509 () Bool)

(assert (=> d!42795 m!163509))

(declare-fun m!163511 () Bool)

(assert (=> b!137008 m!163511))

(declare-fun m!163513 () Bool)

(assert (=> b!137009 m!163513))

(assert (=> d!42471 d!42795))

(declare-fun bm!15085 () Bool)

(declare-fun call!15088 () List!1723)

(declare-fun call!15090 () List!1723)

(assert (=> bm!15085 (= call!15088 call!15090)))

(declare-fun b!137010 () Bool)

(declare-fun e!89213 () List!1723)

(declare-fun call!15089 () List!1723)

(assert (=> b!137010 (= e!89213 call!15089)))

(declare-fun b!137011 () Bool)

(declare-fun e!89212 () List!1723)

(assert (=> b!137011 (= e!89212 call!15088)))

(declare-fun b!137012 () Bool)

(declare-fun e!89215 () List!1723)

(assert (=> b!137012 (= e!89215 call!15090)))

(declare-fun b!137013 () Bool)

(declare-fun c!25659 () Bool)

(declare-fun c!25658 () Bool)

(declare-fun e!89211 () List!1723)

(assert (=> b!137013 (= e!89211 (ite c!25659 (t!6211 (toList!873 (ite c!25441 call!14958 call!14970))) (ite c!25658 (Cons!1719 (h!2325 (toList!873 (ite c!25441 call!14958 call!14970))) (t!6211 (toList!873 (ite c!25441 call!14958 call!14970)))) Nil!1720)))))

(declare-fun e!89214 () Bool)

(declare-fun lt!71648 () List!1723)

(declare-fun b!137014 () Bool)

(assert (=> b!137014 (= e!89214 (contains!907 lt!71648 (tuple2!2643 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun bm!15086 () Bool)

(assert (=> bm!15086 (= call!15090 call!15089)))

(declare-fun bm!15087 () Bool)

(declare-fun c!25660 () Bool)

(assert (=> bm!15087 (= call!15089 ($colon$colon!93 e!89211 (ite c!25660 (h!2325 (toList!873 (ite c!25441 call!14958 call!14970))) (tuple2!2643 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!25661 () Bool)

(assert (=> bm!15087 (= c!25661 c!25660)))

(declare-fun b!137015 () Bool)

(assert (=> b!137015 (= e!89211 (insertStrictlySorted!91 (t!6211 (toList!873 (ite c!25441 call!14958 call!14970))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!42797 () Bool)

(assert (=> d!42797 e!89214))

(declare-fun res!65717 () Bool)

(assert (=> d!42797 (=> (not res!65717) (not e!89214))))

(assert (=> d!42797 (= res!65717 (isStrictlySorted!323 lt!71648))))

(assert (=> d!42797 (= lt!71648 e!89213)))

(assert (=> d!42797 (= c!25660 (and ((_ is Cons!1719) (toList!873 (ite c!25441 call!14958 call!14970))) (bvslt (_1!1332 (h!2325 (toList!873 (ite c!25441 call!14958 call!14970)))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!42797 (isStrictlySorted!323 (toList!873 (ite c!25441 call!14958 call!14970)))))

(assert (=> d!42797 (= (insertStrictlySorted!91 (toList!873 (ite c!25441 call!14958 call!14970)) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!71648)))

(declare-fun b!137016 () Bool)

(assert (=> b!137016 (= c!25658 (and ((_ is Cons!1719) (toList!873 (ite c!25441 call!14958 call!14970))) (bvsgt (_1!1332 (h!2325 (toList!873 (ite c!25441 call!14958 call!14970)))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!137016 (= e!89215 e!89212)))

(declare-fun b!137017 () Bool)

(declare-fun res!65718 () Bool)

(assert (=> b!137017 (=> (not res!65718) (not e!89214))))

(assert (=> b!137017 (= res!65718 (containsKey!177 lt!71648 (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137018 () Bool)

(assert (=> b!137018 (= e!89213 e!89215)))

(assert (=> b!137018 (= c!25659 (and ((_ is Cons!1719) (toList!873 (ite c!25441 call!14958 call!14970))) (= (_1!1332 (h!2325 (toList!873 (ite c!25441 call!14958 call!14970)))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!137019 () Bool)

(assert (=> b!137019 (= e!89212 call!15088)))

(assert (= (and d!42797 c!25660) b!137010))

(assert (= (and d!42797 (not c!25660)) b!137018))

(assert (= (and b!137018 c!25659) b!137012))

(assert (= (and b!137018 (not c!25659)) b!137016))

(assert (= (and b!137016 c!25658) b!137019))

(assert (= (and b!137016 (not c!25658)) b!137011))

(assert (= (or b!137019 b!137011) bm!15085))

(assert (= (or b!137012 bm!15085) bm!15086))

(assert (= (or b!137010 bm!15086) bm!15087))

(assert (= (and bm!15087 c!25661) b!137015))

(assert (= (and bm!15087 (not c!25661)) b!137013))

(assert (= (and d!42797 res!65717) b!137017))

(assert (= (and b!137017 res!65718) b!137014))

(declare-fun m!163515 () Bool)

(assert (=> b!137015 m!163515))

(declare-fun m!163517 () Bool)

(assert (=> bm!15087 m!163517))

(declare-fun m!163519 () Bool)

(assert (=> d!42797 m!163519))

(declare-fun m!163521 () Bool)

(assert (=> d!42797 m!163521))

(declare-fun m!163523 () Bool)

(assert (=> b!137017 m!163523))

(declare-fun m!163525 () Bool)

(assert (=> b!137014 m!163525))

(assert (=> d!42471 d!42797))

(declare-fun b!137020 () Bool)

(declare-fun e!89217 () (_ BitVec 32))

(declare-fun e!89216 () (_ BitVec 32))

(assert (=> b!137020 (= e!89217 e!89216)))

(declare-fun c!25662 () Bool)

(assert (=> b!137020 (= c!25662 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!137021 () Bool)

(declare-fun call!15091 () (_ BitVec 32))

(assert (=> b!137021 (= e!89216 call!15091)))

(declare-fun b!137022 () Bool)

(assert (=> b!137022 (= e!89217 #b00000000000000000000000000000000)))

(declare-fun bm!15088 () Bool)

(assert (=> bm!15088 (= call!15091 (arrayCountValidKeys!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137023 () Bool)

(assert (=> b!137023 (= e!89216 (bvadd #b00000000000000000000000000000001 call!15091))))

(declare-fun d!42799 () Bool)

(declare-fun lt!71649 () (_ BitVec 32))

(assert (=> d!42799 (and (bvsge lt!71649 #b00000000000000000000000000000000) (bvsle lt!71649 (bvsub (size!2543 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!42799 (= lt!71649 e!89217)))

(declare-fun c!25663 () Bool)

(assert (=> d!42799 (= c!25663 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42799 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2543 (_keys!4642 newMap!16)) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42799 (= (arrayCountValidKeys!0 (_keys!4642 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))) lt!71649)))

(assert (= (and d!42799 c!25663) b!137022))

(assert (= (and d!42799 (not c!25663)) b!137020))

(assert (= (and b!137020 c!25662) b!137023))

(assert (= (and b!137020 (not c!25662)) b!137021))

(assert (= (or b!137023 b!137021) bm!15088))

(assert (=> b!137020 m!163449))

(assert (=> b!137020 m!163449))

(assert (=> b!137020 m!163453))

(declare-fun m!163527 () Bool)

(assert (=> bm!15088 m!163527))

(assert (=> bm!15027 d!42799))

(declare-fun b!137024 () Bool)

(declare-fun e!89218 () Option!179)

(assert (=> b!137024 (= e!89218 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71397)))))))

(declare-fun d!42801 () Bool)

(declare-fun c!25664 () Bool)

(assert (=> d!42801 (= c!25664 (and ((_ is Cons!1719) (toList!873 lt!71397)) (= (_1!1332 (h!2325 (toList!873 lt!71397))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42801 (= (getValueByKey!173 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89218)))

(declare-fun b!137025 () Bool)

(declare-fun e!89219 () Option!179)

(assert (=> b!137025 (= e!89218 e!89219)))

(declare-fun c!25665 () Bool)

(assert (=> b!137025 (= c!25665 (and ((_ is Cons!1719) (toList!873 lt!71397)) (not (= (_1!1332 (h!2325 (toList!873 lt!71397))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137026 () Bool)

(assert (=> b!137026 (= e!89219 (getValueByKey!173 (t!6211 (toList!873 lt!71397)) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137027 () Bool)

(assert (=> b!137027 (= e!89219 None!177)))

(assert (= (and d!42801 c!25664) b!137024))

(assert (= (and d!42801 (not c!25664)) b!137025))

(assert (= (and b!137025 c!25665) b!137026))

(assert (= (and b!137025 (not c!25665)) b!137027))

(declare-fun m!163529 () Bool)

(assert (=> b!137026 m!163529))

(assert (=> b!136598 d!42801))

(declare-fun d!42803 () Bool)

(declare-fun e!89220 () Bool)

(assert (=> d!42803 e!89220))

(declare-fun res!65720 () Bool)

(assert (=> d!42803 (=> (not res!65720) (not e!89220))))

(declare-fun lt!71652 () ListLongMap!1715)

(assert (=> d!42803 (= res!65720 (contains!905 lt!71652 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun lt!71651 () List!1723)

(assert (=> d!42803 (= lt!71652 (ListLongMap!1716 lt!71651))))

(declare-fun lt!71650 () Unit!4275)

(declare-fun lt!71653 () Unit!4275)

(assert (=> d!42803 (= lt!71650 lt!71653)))

(assert (=> d!42803 (= (getValueByKey!173 lt!71651 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42803 (= lt!71653 (lemmaContainsTupThenGetReturnValue!88 lt!71651 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42803 (= lt!71651 (insertStrictlySorted!91 (toList!873 call!15002) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42803 (= (+!176 call!15002 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) lt!71652)))

(declare-fun b!137028 () Bool)

(declare-fun res!65719 () Bool)

(assert (=> b!137028 (=> (not res!65719) (not e!89220))))

(assert (=> b!137028 (= res!65719 (= (getValueByKey!173 (toList!873 lt!71652) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(declare-fun b!137029 () Bool)

(assert (=> b!137029 (= e!89220 (contains!907 (toList!873 lt!71652) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(assert (= (and d!42803 res!65720) b!137028))

(assert (= (and b!137028 res!65719) b!137029))

(declare-fun m!163531 () Bool)

(assert (=> d!42803 m!163531))

(declare-fun m!163533 () Bool)

(assert (=> d!42803 m!163533))

(declare-fun m!163535 () Bool)

(assert (=> d!42803 m!163535))

(declare-fun m!163537 () Bool)

(assert (=> d!42803 m!163537))

(declare-fun m!163539 () Bool)

(assert (=> b!137028 m!163539))

(declare-fun m!163541 () Bool)

(assert (=> b!137029 m!163541))

(assert (=> b!136300 d!42803))

(assert (=> b!136329 d!42651))

(assert (=> d!42569 d!42589))

(declare-fun d!42805 () Bool)

(declare-fun e!89221 () Bool)

(assert (=> d!42805 e!89221))

(declare-fun res!65722 () Bool)

(assert (=> d!42805 (=> (not res!65722) (not e!89221))))

(declare-fun lt!71656 () ListLongMap!1715)

(assert (=> d!42805 (= res!65722 (contains!905 lt!71656 (_1!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(declare-fun lt!71655 () List!1723)

(assert (=> d!42805 (= lt!71656 (ListLongMap!1716 lt!71655))))

(declare-fun lt!71654 () Unit!4275)

(declare-fun lt!71657 () Unit!4275)

(assert (=> d!42805 (= lt!71654 lt!71657)))

(assert (=> d!42805 (= (getValueByKey!173 lt!71655 (_1!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))) (Some!178 (_2!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(assert (=> d!42805 (= lt!71657 (lemmaContainsTupThenGetReturnValue!88 lt!71655 (_1!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (_2!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(assert (=> d!42805 (= lt!71655 (insertStrictlySorted!91 (toList!873 (ite c!25546 call!15049 (ite c!25551 call!15048 call!15043))) (_1!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) (_2!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))))))

(assert (=> d!42805 (= (+!176 (ite c!25546 call!15049 (ite c!25551 call!15048 call!15043)) (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))) lt!71656)))

(declare-fun b!137030 () Bool)

(declare-fun res!65721 () Bool)

(assert (=> b!137030 (=> (not res!65721) (not e!89221))))

(assert (=> b!137030 (= res!65721 (= (getValueByKey!173 (toList!873 lt!71656) (_1!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16)))))) (Some!178 (_2!1332 (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))))

(declare-fun b!137031 () Bool)

(assert (=> b!137031 (= e!89221 (contains!907 (toList!873 lt!71656) (ite (or c!25546 c!25551) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!25441 c!25439) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2742 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!25441 (ite c!25439 (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2742 newMap!16))))))))

(assert (= (and d!42805 res!65722) b!137030))

(assert (= (and b!137030 res!65721) b!137031))

(declare-fun m!163543 () Bool)

(assert (=> d!42805 m!163543))

(declare-fun m!163545 () Bool)

(assert (=> d!42805 m!163545))

(declare-fun m!163547 () Bool)

(assert (=> d!42805 m!163547))

(declare-fun m!163549 () Bool)

(assert (=> d!42805 m!163549))

(declare-fun m!163551 () Bool)

(assert (=> b!137030 m!163551))

(declare-fun m!163553 () Bool)

(assert (=> b!137031 m!163553))

(assert (=> bm!15041 d!42805))

(declare-fun d!42807 () Bool)

(assert (=> d!42807 (= (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!412 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5746 () Bool)

(assert (= bs!5746 d!42807))

(assert (=> bs!5746 m!162377))

(declare-fun m!163555 () Bool)

(assert (=> bs!5746 m!163555))

(assert (=> b!136317 d!42807))

(declare-fun b!137032 () Bool)

(declare-fun e!89222 () Option!179)

(assert (=> b!137032 (= e!89222 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71115)))))))

(declare-fun d!42809 () Bool)

(declare-fun c!25666 () Bool)

(assert (=> d!42809 (= c!25666 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42809 (= (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000) e!89222)))

(declare-fun b!137033 () Bool)

(declare-fun e!89223 () Option!179)

(assert (=> b!137033 (= e!89222 e!89223)))

(declare-fun c!25667 () Bool)

(assert (=> b!137033 (= c!25667 (and ((_ is Cons!1719) (toList!873 lt!71115)) (not (= (_1!1332 (h!2325 (toList!873 lt!71115))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137034 () Bool)

(assert (=> b!137034 (= e!89223 (getValueByKey!173 (t!6211 (toList!873 lt!71115)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137035 () Bool)

(assert (=> b!137035 (= e!89223 None!177)))

(assert (= (and d!42809 c!25666) b!137032))

(assert (= (and d!42809 (not c!25666)) b!137033))

(assert (= (and b!137033 c!25667) b!137034))

(assert (= (and b!137033 (not c!25667)) b!137035))

(declare-fun m!163557 () Bool)

(assert (=> b!137034 m!163557))

(assert (=> b!136317 d!42809))

(declare-fun d!42811 () Bool)

(declare-fun lt!71658 () Bool)

(assert (=> d!42811 (= lt!71658 (select (content!134 (toList!873 lt!71340)) (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun e!89225 () Bool)

(assert (=> d!42811 (= lt!71658 e!89225)))

(declare-fun res!65724 () Bool)

(assert (=> d!42811 (=> (not res!65724) (not e!89225))))

(assert (=> d!42811 (= res!65724 ((_ is Cons!1719) (toList!873 lt!71340)))))

(assert (=> d!42811 (= (contains!907 (toList!873 lt!71340) (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71658)))

(declare-fun b!137036 () Bool)

(declare-fun e!89224 () Bool)

(assert (=> b!137036 (= e!89225 e!89224)))

(declare-fun res!65723 () Bool)

(assert (=> b!137036 (=> res!65723 e!89224)))

(assert (=> b!137036 (= res!65723 (= (h!2325 (toList!873 lt!71340)) (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137037 () Bool)

(assert (=> b!137037 (= e!89224 (contains!907 (t!6211 (toList!873 lt!71340)) (tuple2!2643 lt!71120 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42811 res!65724) b!137036))

(assert (= (and b!137036 (not res!65723)) b!137037))

(declare-fun m!163559 () Bool)

(assert (=> d!42811 m!163559))

(declare-fun m!163561 () Bool)

(assert (=> d!42811 m!163561))

(declare-fun m!163563 () Bool)

(assert (=> b!137037 m!163563))

(assert (=> b!136481 d!42811))

(declare-fun d!42813 () Bool)

(assert (=> d!42813 (= (isDefined!126 (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) (not (isEmpty!412 (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun bs!5747 () Bool)

(assert (= bs!5747 d!42813))

(assert (=> bs!5747 m!162369))

(declare-fun m!163565 () Bool)

(assert (=> bs!5747 m!163565))

(assert (=> b!136314 d!42813))

(declare-fun b!137038 () Bool)

(declare-fun e!89226 () Option!179)

(assert (=> b!137038 (= e!89226 (Some!178 (_2!1332 (h!2325 (toList!873 call!14970)))))))

(declare-fun d!42815 () Bool)

(declare-fun c!25668 () Bool)

(assert (=> d!42815 (= c!25668 (and ((_ is Cons!1719) (toList!873 call!14970)) (= (_1!1332 (h!2325 (toList!873 call!14970))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42815 (= (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89226)))

(declare-fun b!137039 () Bool)

(declare-fun e!89227 () Option!179)

(assert (=> b!137039 (= e!89226 e!89227)))

(declare-fun c!25669 () Bool)

(assert (=> b!137039 (= c!25669 (and ((_ is Cons!1719) (toList!873 call!14970)) (not (= (_1!1332 (h!2325 (toList!873 call!14970))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun b!137040 () Bool)

(assert (=> b!137040 (= e!89227 (getValueByKey!173 (t!6211 (toList!873 call!14970)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!137041 () Bool)

(assert (=> b!137041 (= e!89227 None!177)))

(assert (= (and d!42815 c!25668) b!137038))

(assert (= (and d!42815 (not c!25668)) b!137039))

(assert (= (and b!137039 c!25669) b!137040))

(assert (= (and b!137039 (not c!25669)) b!137041))

(assert (=> b!137040 m!162081))

(declare-fun m!163567 () Bool)

(assert (=> b!137040 m!163567))

(assert (=> b!136314 d!42815))

(assert (=> d!42543 d!42483))

(declare-fun b!137058 () Bool)

(declare-fun res!65733 () Bool)

(declare-fun e!89239 () Bool)

(assert (=> b!137058 (=> (not res!65733) (not e!89239))))

(declare-fun call!15096 () Bool)

(assert (=> b!137058 (= res!65733 call!15096)))

(declare-fun e!89238 () Bool)

(assert (=> b!137058 (= e!89238 e!89239)))

(declare-fun b!137059 () Bool)

(declare-fun e!89237 () Bool)

(declare-fun call!15097 () Bool)

(assert (=> b!137059 (= e!89237 (not call!15097))))

(declare-fun b!137060 () Bool)

(declare-fun res!65736 () Bool)

(assert (=> b!137060 (=> (not res!65736) (not e!89239))))

(declare-fun lt!71661 () SeekEntryResult!276)

(assert (=> b!137060 (= res!65736 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!25675 () Bool)

(declare-fun bm!15093 () Bool)

(assert (=> bm!15093 (= call!15096 (inRange!0 (ite c!25675 (index!3265 lt!71661) (index!3268 lt!71661)) (mask!7203 newMap!16)))))

(declare-fun b!137061 () Bool)

(assert (=> b!137061 (= e!89239 (not call!15097))))

(declare-fun b!137062 () Bool)

(declare-fun res!65735 () Bool)

(assert (=> b!137062 (= res!65735 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137062 (=> (not res!65735) (not e!89237))))

(declare-fun bm!15094 () Bool)

(assert (=> bm!15094 (= call!15097 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!137063 () Bool)

(assert (=> b!137063 (= e!89238 ((_ is Undefined!276) lt!71661))))

(declare-fun d!42817 () Bool)

(declare-fun e!89236 () Bool)

(assert (=> d!42817 e!89236))

(assert (=> d!42817 (= c!25675 ((_ is MissingZero!276) lt!71661))))

(assert (=> d!42817 (= lt!71661 (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (=> d!42817 true))

(declare-fun _$34!993 () Unit!4275)

(assert (=> d!42817 (= (choose!837 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (defaultEntry!2889 newMap!16)) _$34!993)))

(declare-fun b!137064 () Bool)

(assert (=> b!137064 (= e!89236 e!89238)))

(declare-fun c!25674 () Bool)

(assert (=> b!137064 (= c!25674 ((_ is MissingVacant!276) lt!71661))))

(declare-fun b!137065 () Bool)

(assert (=> b!137065 (= e!89236 e!89237)))

(declare-fun res!65734 () Bool)

(assert (=> b!137065 (= res!65734 call!15096)))

(assert (=> b!137065 (=> (not res!65734) (not e!89237))))

(assert (= (and d!42817 c!25675) b!137065))

(assert (= (and d!42817 (not c!25675)) b!137064))

(assert (= (and b!137065 res!65734) b!137062))

(assert (= (and b!137062 res!65735) b!137059))

(assert (= (and b!137064 c!25674) b!137058))

(assert (= (and b!137064 (not c!25674)) b!137063))

(assert (= (and b!137058 res!65733) b!137060))

(assert (= (and b!137060 res!65736) b!137061))

(assert (= (or b!137065 b!137058) bm!15093))

(assert (= (or b!137059 b!137061) bm!15094))

(assert (=> bm!15094 m!162081))

(assert (=> bm!15094 m!162175))

(assert (=> d!42817 m!162081))

(assert (=> d!42817 m!162161))

(declare-fun m!163569 () Bool)

(assert (=> bm!15093 m!163569))

(declare-fun m!163571 () Bool)

(assert (=> b!137062 m!163571))

(declare-fun m!163573 () Bool)

(assert (=> b!137060 m!163573))

(assert (=> d!42543 d!42817))

(assert (=> d!42543 d!42589))

(declare-fun d!42819 () Bool)

(assert (=> d!42819 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (array!4810 (store (arr!2274 (_values!2872 newMap!16)) (index!3266 lt!71036) (ValueCellFull!1101 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2544 (_values!2872 newMap!16))) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(assert (=> d!42819 true))

(declare-fun _$5!137 () Unit!4275)

(assert (=> d!42819 (= (choose!832 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)) _$5!137)))

(declare-fun bs!5748 () Bool)

(assert (= bs!5748 d!42819))

(assert (=> bs!5748 m!162189))

(assert (=> bs!5748 m!162189))

(assert (=> bs!5748 m!162363))

(assert (=> bs!5748 m!162209))

(assert (=> bs!5748 m!162201))

(assert (=> d!42459 d!42819))

(assert (=> d!42459 d!42589))

(declare-fun d!42821 () Bool)

(declare-fun res!65737 () Bool)

(declare-fun e!89240 () Bool)

(assert (=> d!42821 (=> (not res!65737) (not e!89240))))

(assert (=> d!42821 (= res!65737 (simpleValid!93 (_2!1333 lt!71291)))))

(assert (=> d!42821 (= (valid!533 (_2!1333 lt!71291)) e!89240)))

(declare-fun b!137066 () Bool)

(declare-fun res!65738 () Bool)

(assert (=> b!137066 (=> (not res!65738) (not e!89240))))

(assert (=> b!137066 (= res!65738 (= (arrayCountValidKeys!0 (_keys!4642 (_2!1333 lt!71291)) #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71291)))) (_size!604 (_2!1333 lt!71291))))))

(declare-fun b!137067 () Bool)

(declare-fun res!65739 () Bool)

(assert (=> b!137067 (=> (not res!65739) (not e!89240))))

(assert (=> b!137067 (= res!65739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 (_2!1333 lt!71291)) (mask!7203 (_2!1333 lt!71291))))))

(declare-fun b!137068 () Bool)

(assert (=> b!137068 (= e!89240 (arrayNoDuplicates!0 (_keys!4642 (_2!1333 lt!71291)) #b00000000000000000000000000000000 Nil!1722))))

(assert (= (and d!42821 res!65737) b!137066))

(assert (= (and b!137066 res!65738) b!137067))

(assert (= (and b!137067 res!65739) b!137068))

(declare-fun m!163575 () Bool)

(assert (=> d!42821 m!163575))

(declare-fun m!163577 () Bool)

(assert (=> b!137066 m!163577))

(declare-fun m!163579 () Bool)

(assert (=> b!137067 m!163579))

(declare-fun m!163581 () Bool)

(assert (=> b!137068 m!163581))

(assert (=> b!136405 d!42821))

(declare-fun b!137069 () Bool)

(declare-fun e!89241 () Option!179)

(assert (=> b!137069 (= e!89241 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71356)))))))

(declare-fun d!42823 () Bool)

(declare-fun c!25676 () Bool)

(assert (=> d!42823 (= c!25676 (and ((_ is Cons!1719) (toList!873 lt!71356)) (= (_1!1332 (h!2325 (toList!873 lt!71356))) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42823 (= (getValueByKey!173 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89241)))

(declare-fun b!137070 () Bool)

(declare-fun e!89242 () Option!179)

(assert (=> b!137070 (= e!89241 e!89242)))

(declare-fun c!25677 () Bool)

(assert (=> b!137070 (= c!25677 (and ((_ is Cons!1719) (toList!873 lt!71356)) (not (= (_1!1332 (h!2325 (toList!873 lt!71356))) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137071 () Bool)

(assert (=> b!137071 (= e!89242 (getValueByKey!173 (t!6211 (toList!873 lt!71356)) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137072 () Bool)

(assert (=> b!137072 (= e!89242 None!177)))

(assert (= (and d!42823 c!25676) b!137069))

(assert (= (and d!42823 (not c!25676)) b!137070))

(assert (= (and b!137070 c!25677) b!137071))

(assert (= (and b!137070 (not c!25677)) b!137072))

(declare-fun m!163583 () Bool)

(assert (=> b!137071 m!163583))

(assert (=> b!136491 d!42823))

(assert (=> b!136304 d!42651))

(declare-fun d!42825 () Bool)

(declare-fun e!89243 () Bool)

(assert (=> d!42825 e!89243))

(declare-fun res!65740 () Bool)

(assert (=> d!42825 (=> res!65740 e!89243)))

(declare-fun lt!71664 () Bool)

(assert (=> d!42825 (= res!65740 (not lt!71664))))

(declare-fun lt!71662 () Bool)

(assert (=> d!42825 (= lt!71664 lt!71662)))

(declare-fun lt!71665 () Unit!4275)

(declare-fun e!89244 () Unit!4275)

(assert (=> d!42825 (= lt!71665 e!89244)))

(declare-fun c!25678 () Bool)

(assert (=> d!42825 (= c!25678 lt!71662)))

(assert (=> d!42825 (= lt!71662 (containsKey!177 (toList!873 lt!71413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!42825 (= (contains!905 lt!71413 #b1000000000000000000000000000000000000000000000000000000000000000) lt!71664)))

(declare-fun b!137073 () Bool)

(declare-fun lt!71663 () Unit!4275)

(assert (=> b!137073 (= e!89244 lt!71663)))

(assert (=> b!137073 (= lt!71663 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137073 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137074 () Bool)

(declare-fun Unit!4315 () Unit!4275)

(assert (=> b!137074 (= e!89244 Unit!4315)))

(declare-fun b!137075 () Bool)

(assert (=> b!137075 (= e!89243 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42825 c!25678) b!137073))

(assert (= (and d!42825 (not c!25678)) b!137074))

(assert (= (and d!42825 (not res!65740)) b!137075))

(declare-fun m!163585 () Bool)

(assert (=> d!42825 m!163585))

(declare-fun m!163587 () Bool)

(assert (=> b!137073 m!163587))

(assert (=> b!137073 m!163323))

(assert (=> b!137073 m!163323))

(declare-fun m!163589 () Bool)

(assert (=> b!137073 m!163589))

(assert (=> b!137075 m!163323))

(assert (=> b!137075 m!163323))

(assert (=> b!137075 m!163589))

(assert (=> bm!15040 d!42825))

(declare-fun d!42827 () Bool)

(assert (=> d!42827 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!71666 () Unit!4275)

(assert (=> d!42827 (= lt!71666 (choose!833 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!89245 () Bool)

(assert (=> d!42827 e!89245))

(declare-fun res!65741 () Bool)

(assert (=> d!42827 (=> (not res!65741) (not e!89245))))

(assert (=> d!42827 (= res!65741 (isStrictlySorted!323 (toList!873 lt!71115)))))

(assert (=> d!42827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000) lt!71666)))

(declare-fun b!137076 () Bool)

(assert (=> b!137076 (= e!89245 (containsKey!177 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!42827 res!65741) b!137076))

(assert (=> d!42827 m!162437))

(assert (=> d!42827 m!162437))

(assert (=> d!42827 m!162439))

(declare-fun m!163591 () Bool)

(assert (=> d!42827 m!163591))

(declare-fun m!163593 () Bool)

(assert (=> d!42827 m!163593))

(assert (=> b!137076 m!162433))

(assert (=> b!136339 d!42827))

(assert (=> b!136339 d!42581))

(assert (=> b!136339 d!42583))

(assert (=> b!136311 d!42597))

(assert (=> b!136311 d!42465))

(assert (=> b!136311 d!42457))

(declare-fun b!137077 () Bool)

(declare-fun e!89257 () ListLongMap!1715)

(declare-fun call!15099 () ListLongMap!1715)

(assert (=> b!137077 (= e!89257 call!15099)))

(declare-fun bm!15095 () Bool)

(declare-fun call!15100 () Bool)

(declare-fun lt!71681 () ListLongMap!1715)

(assert (=> bm!15095 (= call!15100 (contains!905 lt!71681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137078 () Bool)

(declare-fun e!89248 () Bool)

(declare-fun e!89253 () Bool)

(assert (=> b!137078 (= e!89248 e!89253)))

(declare-fun c!25681 () Bool)

(assert (=> b!137078 (= c!25681 (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137079 () Bool)

(assert (=> b!137079 (= e!89253 (not call!15100))))

(declare-fun b!137080 () Bool)

(declare-fun c!25682 () Bool)

(assert (=> b!137080 (= c!25682 (and (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89252 () ListLongMap!1715)

(assert (=> b!137080 (= e!89252 e!89257)))

(declare-fun c!25679 () Bool)

(declare-fun call!15098 () ListLongMap!1715)

(declare-fun bm!15096 () Bool)

(declare-fun call!15101 () ListLongMap!1715)

(declare-fun c!25684 () Bool)

(declare-fun call!15104 () ListLongMap!1715)

(declare-fun call!15103 () ListLongMap!1715)

(assert (=> bm!15096 (= call!15101 (+!176 (ite c!25679 call!15104 (ite c!25684 call!15103 call!15098)) (ite (or c!25679 c!25684) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 (_2!1333 lt!71054))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (_2!1333 lt!71054))))))))

(declare-fun bm!15097 () Bool)

(assert (=> bm!15097 (= call!15099 call!15101)))

(declare-fun bm!15098 () Bool)

(assert (=> bm!15098 (= call!15103 call!15104)))

(declare-fun b!137081 () Bool)

(declare-fun e!89246 () Unit!4275)

(declare-fun lt!71670 () Unit!4275)

(assert (=> b!137081 (= e!89246 lt!71670)))

(declare-fun lt!71687 () ListLongMap!1715)

(assert (=> b!137081 (= lt!71687 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun lt!71671 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71680 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71680 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000))))

(declare-fun lt!71674 () Unit!4275)

(assert (=> b!137081 (= lt!71674 (addStillContains!93 lt!71687 lt!71671 (zeroValue!2742 (_2!1333 lt!71054)) lt!71680))))

(assert (=> b!137081 (contains!905 (+!176 lt!71687 (tuple2!2643 lt!71671 (zeroValue!2742 (_2!1333 lt!71054)))) lt!71680)))

(declare-fun lt!71667 () Unit!4275)

(assert (=> b!137081 (= lt!71667 lt!71674)))

(declare-fun lt!71668 () ListLongMap!1715)

(assert (=> b!137081 (= lt!71668 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun lt!71686 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71688 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71688 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000))))

(declare-fun lt!71672 () Unit!4275)

(assert (=> b!137081 (= lt!71672 (addApplyDifferent!93 lt!71668 lt!71686 (minValue!2742 (_2!1333 lt!71054)) lt!71688))))

(assert (=> b!137081 (= (apply!117 (+!176 lt!71668 (tuple2!2643 lt!71686 (minValue!2742 (_2!1333 lt!71054)))) lt!71688) (apply!117 lt!71668 lt!71688))))

(declare-fun lt!71682 () Unit!4275)

(assert (=> b!137081 (= lt!71682 lt!71672)))

(declare-fun lt!71678 () ListLongMap!1715)

(assert (=> b!137081 (= lt!71678 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun lt!71673 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71677 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71677 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000))))

(declare-fun lt!71676 () Unit!4275)

(assert (=> b!137081 (= lt!71676 (addApplyDifferent!93 lt!71678 lt!71673 (zeroValue!2742 (_2!1333 lt!71054)) lt!71677))))

(assert (=> b!137081 (= (apply!117 (+!176 lt!71678 (tuple2!2643 lt!71673 (zeroValue!2742 (_2!1333 lt!71054)))) lt!71677) (apply!117 lt!71678 lt!71677))))

(declare-fun lt!71675 () Unit!4275)

(assert (=> b!137081 (= lt!71675 lt!71676)))

(declare-fun lt!71669 () ListLongMap!1715)

(assert (=> b!137081 (= lt!71669 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun lt!71683 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71683 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71684 () (_ BitVec 64))

(assert (=> b!137081 (= lt!71684 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000))))

(assert (=> b!137081 (= lt!71670 (addApplyDifferent!93 lt!71669 lt!71683 (minValue!2742 (_2!1333 lt!71054)) lt!71684))))

(assert (=> b!137081 (= (apply!117 (+!176 lt!71669 (tuple2!2643 lt!71683 (minValue!2742 (_2!1333 lt!71054)))) lt!71684) (apply!117 lt!71669 lt!71684))))

(declare-fun bm!15099 () Bool)

(assert (=> bm!15099 (= call!15104 (getCurrentListMapNoExtraKeys!142 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))))))

(declare-fun b!137083 () Bool)

(declare-fun e!89254 () Bool)

(declare-fun e!89251 () Bool)

(assert (=> b!137083 (= e!89254 e!89251)))

(declare-fun res!65750 () Bool)

(assert (=> b!137083 (=> (not res!65750) (not e!89251))))

(assert (=> b!137083 (= res!65750 (contains!905 lt!71681 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(assert (=> b!137083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(declare-fun b!137084 () Bool)

(declare-fun e!89258 () Bool)

(assert (=> b!137084 (= e!89253 e!89258)))

(declare-fun res!65744 () Bool)

(assert (=> b!137084 (= res!65744 call!15100)))

(assert (=> b!137084 (=> (not res!65744) (not e!89258))))

(declare-fun b!137085 () Bool)

(declare-fun res!65745 () Bool)

(assert (=> b!137085 (=> (not res!65745) (not e!89248))))

(declare-fun e!89247 () Bool)

(assert (=> b!137085 (= res!65745 e!89247)))

(declare-fun c!25683 () Bool)

(assert (=> b!137085 (= c!25683 (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!137086 () Bool)

(declare-fun Unit!4316 () Unit!4275)

(assert (=> b!137086 (= e!89246 Unit!4316)))

(declare-fun b!137087 () Bool)

(declare-fun e!89255 () Bool)

(assert (=> b!137087 (= e!89255 (= (apply!117 lt!71681 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 (_2!1333 lt!71054))))))

(declare-fun b!137088 () Bool)

(declare-fun e!89250 () Bool)

(assert (=> b!137088 (= e!89250 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun b!137089 () Bool)

(declare-fun e!89256 () ListLongMap!1715)

(assert (=> b!137089 (= e!89256 (+!176 call!15101 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (_2!1333 lt!71054)))))))

(declare-fun b!137090 () Bool)

(assert (=> b!137090 (= e!89256 e!89252)))

(assert (=> b!137090 (= c!25684 (and (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137091 () Bool)

(assert (=> b!137091 (= e!89247 e!89255)))

(declare-fun res!65746 () Bool)

(declare-fun call!15102 () Bool)

(assert (=> b!137091 (= res!65746 call!15102)))

(assert (=> b!137091 (=> (not res!65746) (not e!89255))))

(declare-fun b!137092 () Bool)

(declare-fun res!65742 () Bool)

(assert (=> b!137092 (=> (not res!65742) (not e!89248))))

(assert (=> b!137092 (= res!65742 e!89254)))

(declare-fun res!65749 () Bool)

(assert (=> b!137092 (=> res!65749 e!89254)))

(assert (=> b!137092 (= res!65749 (not e!89250))))

(declare-fun res!65747 () Bool)

(assert (=> b!137092 (=> (not res!65747) (not e!89250))))

(assert (=> b!137092 (= res!65747 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(declare-fun b!137093 () Bool)

(declare-fun e!89249 () Bool)

(assert (=> b!137093 (= e!89249 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun bm!15100 () Bool)

(assert (=> bm!15100 (= call!15098 call!15103)))

(declare-fun b!137094 () Bool)

(assert (=> b!137094 (= e!89247 (not call!15102))))

(declare-fun bm!15101 () Bool)

(assert (=> bm!15101 (= call!15102 (contains!905 lt!71681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42829 () Bool)

(assert (=> d!42829 e!89248))

(declare-fun res!65748 () Bool)

(assert (=> d!42829 (=> (not res!65748) (not e!89248))))

(assert (=> d!42829 (= res!65748 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))))

(declare-fun lt!71679 () ListLongMap!1715)

(assert (=> d!42829 (= lt!71681 lt!71679)))

(declare-fun lt!71685 () Unit!4275)

(assert (=> d!42829 (= lt!71685 e!89246)))

(declare-fun c!25680 () Bool)

(assert (=> d!42829 (= c!25680 e!89249)))

(declare-fun res!65743 () Bool)

(assert (=> d!42829 (=> (not res!65743) (not e!89249))))

(assert (=> d!42829 (= res!65743 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (=> d!42829 (= lt!71679 e!89256)))

(assert (=> d!42829 (= c!25679 (and (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42829 (validMask!0 (mask!7203 (_2!1333 lt!71054)))))

(assert (=> d!42829 (= (getCurrentListMap!549 (_keys!4642 (_2!1333 lt!71054)) (_values!2872 (_2!1333 lt!71054)) (mask!7203 (_2!1333 lt!71054)) (extraKeys!2650 (_2!1333 lt!71054)) (zeroValue!2742 (_2!1333 lt!71054)) (minValue!2742 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (defaultEntry!2889 (_2!1333 lt!71054))) lt!71681)))

(declare-fun b!137082 () Bool)

(assert (=> b!137082 (= e!89257 call!15098)))

(declare-fun b!137095 () Bool)

(assert (=> b!137095 (= e!89258 (= (apply!117 lt!71681 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 (_2!1333 lt!71054))))))

(declare-fun b!137096 () Bool)

(assert (=> b!137096 (= e!89252 call!15099)))

(declare-fun b!137097 () Bool)

(assert (=> b!137097 (= e!89251 (= (apply!117 lt!71681 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (_values!2872 (_2!1333 lt!71054))) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 (_2!1333 lt!71054)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!137097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (_values!2872 (_2!1333 lt!71054)))))))

(assert (=> b!137097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (= (and d!42829 c!25679) b!137089))

(assert (= (and d!42829 (not c!25679)) b!137090))

(assert (= (and b!137090 c!25684) b!137096))

(assert (= (and b!137090 (not c!25684)) b!137080))

(assert (= (and b!137080 c!25682) b!137077))

(assert (= (and b!137080 (not c!25682)) b!137082))

(assert (= (or b!137077 b!137082) bm!15100))

(assert (= (or b!137096 bm!15100) bm!15098))

(assert (= (or b!137096 b!137077) bm!15097))

(assert (= (or b!137089 bm!15098) bm!15099))

(assert (= (or b!137089 bm!15097) bm!15096))

(assert (= (and d!42829 res!65743) b!137093))

(assert (= (and d!42829 c!25680) b!137081))

(assert (= (and d!42829 (not c!25680)) b!137086))

(assert (= (and d!42829 res!65748) b!137092))

(assert (= (and b!137092 res!65747) b!137088))

(assert (= (and b!137092 (not res!65749)) b!137083))

(assert (= (and b!137083 res!65750) b!137097))

(assert (= (and b!137092 res!65742) b!137085))

(assert (= (and b!137085 c!25683) b!137091))

(assert (= (and b!137085 (not c!25683)) b!137094))

(assert (= (and b!137091 res!65746) b!137087))

(assert (= (or b!137091 b!137094) bm!15101))

(assert (= (and b!137085 res!65745) b!137078))

(assert (= (and b!137078 c!25681) b!137084))

(assert (= (and b!137078 (not c!25681)) b!137079))

(assert (= (and b!137084 res!65744) b!137095))

(assert (= (or b!137084 b!137079) bm!15095))

(declare-fun b_lambda!6123 () Bool)

(assert (=> (not b_lambda!6123) (not b!137097)))

(declare-fun tb!2461 () Bool)

(declare-fun t!6223 () Bool)

(assert (=> (and b!136004 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 (_2!1333 lt!71054))) t!6223) tb!2461))

(declare-fun result!4051 () Bool)

(assert (=> tb!2461 (= result!4051 tp_is_empty!2889)))

(assert (=> b!137097 t!6223))

(declare-fun b_and!8499 () Bool)

(assert (= b_and!8495 (and (=> t!6223 result!4051) b_and!8499)))

(declare-fun t!6225 () Bool)

(declare-fun tb!2463 () Bool)

(assert (=> (and b!136009 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (_2!1333 lt!71054))) t!6225) tb!2463))

(declare-fun result!4053 () Bool)

(assert (= result!4053 result!4051))

(assert (=> b!137097 t!6225))

(declare-fun b_and!8501 () Bool)

(assert (= b_and!8497 (and (=> t!6225 result!4053) b_and!8501)))

(declare-fun m!163595 () Bool)

(assert (=> b!137089 m!163595))

(declare-fun m!163597 () Bool)

(assert (=> b!137081 m!163597))

(declare-fun m!163599 () Bool)

(assert (=> b!137081 m!163599))

(declare-fun m!163601 () Bool)

(assert (=> b!137081 m!163601))

(declare-fun m!163603 () Bool)

(assert (=> b!137081 m!163603))

(declare-fun m!163605 () Bool)

(assert (=> b!137081 m!163605))

(assert (=> b!137081 m!163597))

(declare-fun m!163607 () Bool)

(assert (=> b!137081 m!163607))

(declare-fun m!163609 () Bool)

(assert (=> b!137081 m!163609))

(declare-fun m!163611 () Bool)

(assert (=> b!137081 m!163611))

(assert (=> b!137081 m!163603))

(declare-fun m!163613 () Bool)

(assert (=> b!137081 m!163613))

(declare-fun m!163615 () Bool)

(assert (=> b!137081 m!163615))

(declare-fun m!163617 () Bool)

(assert (=> b!137081 m!163617))

(assert (=> b!137081 m!163169))

(declare-fun m!163619 () Bool)

(assert (=> b!137081 m!163619))

(assert (=> b!137081 m!163615))

(declare-fun m!163621 () Bool)

(assert (=> b!137081 m!163621))

(declare-fun m!163623 () Bool)

(assert (=> b!137081 m!163623))

(assert (=> b!137081 m!163609))

(declare-fun m!163625 () Bool)

(assert (=> b!137081 m!163625))

(declare-fun m!163627 () Bool)

(assert (=> b!137081 m!163627))

(assert (=> b!137083 m!163169))

(assert (=> b!137083 m!163169))

(declare-fun m!163629 () Bool)

(assert (=> b!137083 m!163629))

(assert (=> b!137088 m!163169))

(assert (=> b!137088 m!163169))

(assert (=> b!137088 m!163179))

(declare-fun m!163631 () Bool)

(assert (=> b!137087 m!163631))

(declare-fun m!163633 () Bool)

(assert (=> b!137097 m!163633))

(assert (=> b!137097 m!163633))

(declare-fun m!163635 () Bool)

(assert (=> b!137097 m!163635))

(declare-fun m!163637 () Bool)

(assert (=> b!137097 m!163637))

(assert (=> b!137097 m!163169))

(assert (=> b!137097 m!163635))

(assert (=> b!137097 m!163169))

(declare-fun m!163639 () Bool)

(assert (=> b!137097 m!163639))

(declare-fun m!163641 () Bool)

(assert (=> bm!15101 m!163641))

(declare-fun m!163643 () Bool)

(assert (=> bm!15096 m!163643))

(declare-fun m!163645 () Bool)

(assert (=> bm!15095 m!163645))

(declare-fun m!163647 () Bool)

(assert (=> d!42829 m!163647))

(assert (=> bm!15099 m!163621))

(declare-fun m!163649 () Bool)

(assert (=> b!137095 m!163649))

(assert (=> b!137093 m!163169))

(assert (=> b!137093 m!163169))

(assert (=> b!137093 m!163179))

(assert (=> d!42495 d!42829))

(declare-fun d!42831 () Bool)

(assert (=> d!42831 (= (get!1497 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3225 (getValueByKey!173 (toList!873 lt!71115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42553 d!42831))

(assert (=> d!42553 d!42583))

(declare-fun d!42833 () Bool)

(assert (=> d!42833 (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))

(declare-fun lt!71691 () Unit!4275)

(declare-fun choose!842 (array!4807 array!4809 (_ BitVec 32) (_ BitVec 32) V!3499 V!3499 (_ BitVec 64) (_ BitVec 32) Int) Unit!4275)

(assert (=> d!42833 (= lt!71691 (choose!842 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(assert (=> d!42833 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42833 (= (lemmaArrayContainsKeyThenInListMap!43 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71691)))

(declare-fun bs!5749 () Bool)

(assert (= bs!5749 d!42833))

(assert (=> bs!5749 m!162189))

(assert (=> bs!5749 m!162189))

(assert (=> bs!5749 m!162081))

(assert (=> bs!5749 m!162483))

(assert (=> bs!5749 m!162081))

(declare-fun m!163651 () Bool)

(assert (=> bs!5749 m!163651))

(assert (=> bs!5749 m!162297))

(assert (=> b!136401 d!42833))

(assert (=> b!136401 d!42613))

(assert (=> b!136401 d!42465))

(declare-fun d!42835 () Bool)

(declare-fun e!89259 () Bool)

(assert (=> d!42835 e!89259))

(declare-fun res!65751 () Bool)

(assert (=> d!42835 (=> res!65751 e!89259)))

(declare-fun lt!71694 () Bool)

(assert (=> d!42835 (= res!65751 (not lt!71694))))

(declare-fun lt!71692 () Bool)

(assert (=> d!42835 (= lt!71694 lt!71692)))

(declare-fun lt!71695 () Unit!4275)

(declare-fun e!89260 () Unit!4275)

(assert (=> d!42835 (= lt!71695 e!89260)))

(declare-fun c!25685 () Bool)

(assert (=> d!42835 (= c!25685 lt!71692)))

(assert (=> d!42835 (= lt!71692 (containsKey!177 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42835 (= (contains!905 lt!71397 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71694)))

(declare-fun b!137098 () Bool)

(declare-fun lt!71693 () Unit!4275)

(assert (=> b!137098 (= e!89260 lt!71693)))

(assert (=> b!137098 (= lt!71693 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> b!137098 (isDefined!126 (getValueByKey!173 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137099 () Bool)

(declare-fun Unit!4317 () Unit!4275)

(assert (=> b!137099 (= e!89260 Unit!4317)))

(declare-fun b!137100 () Bool)

(assert (=> b!137100 (= e!89259 (isDefined!126 (getValueByKey!173 (toList!873 lt!71397) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42835 c!25685) b!137098))

(assert (= (and d!42835 (not c!25685)) b!137099))

(assert (= (and d!42835 (not res!65751)) b!137100))

(declare-fun m!163653 () Bool)

(assert (=> d!42835 m!163653))

(declare-fun m!163655 () Bool)

(assert (=> b!137098 m!163655))

(assert (=> b!137098 m!162775))

(assert (=> b!137098 m!162775))

(declare-fun m!163657 () Bool)

(assert (=> b!137098 m!163657))

(assert (=> b!137100 m!162775))

(assert (=> b!137100 m!162775))

(assert (=> b!137100 m!163657))

(assert (=> d!42565 d!42835))

(declare-fun b!137101 () Bool)

(declare-fun e!89261 () Option!179)

(assert (=> b!137101 (= e!89261 (Some!178 (_2!1332 (h!2325 lt!71396))))))

(declare-fun d!42837 () Bool)

(declare-fun c!25686 () Bool)

(assert (=> d!42837 (= c!25686 (and ((_ is Cons!1719) lt!71396) (= (_1!1332 (h!2325 lt!71396)) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42837 (= (getValueByKey!173 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89261)))

(declare-fun b!137102 () Bool)

(declare-fun e!89262 () Option!179)

(assert (=> b!137102 (= e!89261 e!89262)))

(declare-fun c!25687 () Bool)

(assert (=> b!137102 (= c!25687 (and ((_ is Cons!1719) lt!71396) (not (= (_1!1332 (h!2325 lt!71396)) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137103 () Bool)

(assert (=> b!137103 (= e!89262 (getValueByKey!173 (t!6211 lt!71396) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137104 () Bool)

(assert (=> b!137104 (= e!89262 None!177)))

(assert (= (and d!42837 c!25686) b!137101))

(assert (= (and d!42837 (not c!25686)) b!137102))

(assert (= (and b!137102 c!25687) b!137103))

(assert (= (and b!137102 (not c!25687)) b!137104))

(declare-fun m!163659 () Bool)

(assert (=> b!137103 m!163659))

(assert (=> d!42565 d!42837))

(declare-fun d!42839 () Bool)

(assert (=> d!42839 (= (getValueByKey!173 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71696 () Unit!4275)

(assert (=> d!42839 (= lt!71696 (choose!841 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89263 () Bool)

(assert (=> d!42839 e!89263))

(declare-fun res!65752 () Bool)

(assert (=> d!42839 (=> (not res!65752) (not e!89263))))

(assert (=> d!42839 (= res!65752 (isStrictlySorted!323 lt!71396))))

(assert (=> d!42839 (= (lemmaContainsTupThenGetReturnValue!88 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71696)))

(declare-fun b!137105 () Bool)

(declare-fun res!65753 () Bool)

(assert (=> b!137105 (=> (not res!65753) (not e!89263))))

(assert (=> b!137105 (= res!65753 (containsKey!177 lt!71396 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137106 () Bool)

(assert (=> b!137106 (= e!89263 (contains!907 lt!71396 (tuple2!2643 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42839 res!65752) b!137105))

(assert (= (and b!137105 res!65753) b!137106))

(assert (=> d!42839 m!162769))

(declare-fun m!163661 () Bool)

(assert (=> d!42839 m!163661))

(declare-fun m!163663 () Bool)

(assert (=> d!42839 m!163663))

(declare-fun m!163665 () Bool)

(assert (=> b!137105 m!163665))

(declare-fun m!163667 () Bool)

(assert (=> b!137106 m!163667))

(assert (=> d!42565 d!42839))

(declare-fun bm!15102 () Bool)

(declare-fun call!15105 () List!1723)

(declare-fun call!15107 () List!1723)

(assert (=> bm!15102 (= call!15105 call!15107)))

(declare-fun b!137107 () Bool)

(declare-fun e!89266 () List!1723)

(declare-fun call!15106 () List!1723)

(assert (=> b!137107 (= e!89266 call!15106)))

(declare-fun b!137108 () Bool)

(declare-fun e!89265 () List!1723)

(assert (=> b!137108 (= e!89265 call!15105)))

(declare-fun b!137109 () Bool)

(declare-fun e!89268 () List!1723)

(assert (=> b!137109 (= e!89268 call!15107)))

(declare-fun c!25689 () Bool)

(declare-fun b!137110 () Bool)

(declare-fun e!89264 () List!1723)

(declare-fun c!25688 () Bool)

(assert (=> b!137110 (= e!89264 (ite c!25689 (t!6211 (toList!873 call!14995)) (ite c!25688 (Cons!1719 (h!2325 (toList!873 call!14995)) (t!6211 (toList!873 call!14995))) Nil!1720)))))

(declare-fun b!137111 () Bool)

(declare-fun e!89267 () Bool)

(declare-fun lt!71697 () List!1723)

(assert (=> b!137111 (= e!89267 (contains!907 lt!71697 (tuple2!2643 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun bm!15103 () Bool)

(assert (=> bm!15103 (= call!15107 call!15106)))

(declare-fun bm!15104 () Bool)

(declare-fun c!25690 () Bool)

(assert (=> bm!15104 (= call!15106 ($colon$colon!93 e!89264 (ite c!25690 (h!2325 (toList!873 call!14995)) (tuple2!2643 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun c!25691 () Bool)

(assert (=> bm!15104 (= c!25691 c!25690)))

(declare-fun b!137112 () Bool)

(assert (=> b!137112 (= e!89264 (insertStrictlySorted!91 (t!6211 (toList!873 call!14995)) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun d!42841 () Bool)

(assert (=> d!42841 e!89267))

(declare-fun res!65754 () Bool)

(assert (=> d!42841 (=> (not res!65754) (not e!89267))))

(assert (=> d!42841 (= res!65754 (isStrictlySorted!323 lt!71697))))

(assert (=> d!42841 (= lt!71697 e!89266)))

(assert (=> d!42841 (= c!25690 (and ((_ is Cons!1719) (toList!873 call!14995)) (bvslt (_1!1332 (h!2325 (toList!873 call!14995))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42841 (isStrictlySorted!323 (toList!873 call!14995))))

(assert (=> d!42841 (= (insertStrictlySorted!91 (toList!873 call!14995) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71697)))

(declare-fun b!137113 () Bool)

(assert (=> b!137113 (= c!25688 (and ((_ is Cons!1719) (toList!873 call!14995)) (bvsgt (_1!1332 (h!2325 (toList!873 call!14995))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!137113 (= e!89268 e!89265)))

(declare-fun b!137114 () Bool)

(declare-fun res!65755 () Bool)

(assert (=> b!137114 (=> (not res!65755) (not e!89267))))

(assert (=> b!137114 (= res!65755 (containsKey!177 lt!71697 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137115 () Bool)

(assert (=> b!137115 (= e!89266 e!89268)))

(assert (=> b!137115 (= c!25689 (and ((_ is Cons!1719) (toList!873 call!14995)) (= (_1!1332 (h!2325 (toList!873 call!14995))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!137116 () Bool)

(assert (=> b!137116 (= e!89265 call!15105)))

(assert (= (and d!42841 c!25690) b!137107))

(assert (= (and d!42841 (not c!25690)) b!137115))

(assert (= (and b!137115 c!25689) b!137109))

(assert (= (and b!137115 (not c!25689)) b!137113))

(assert (= (and b!137113 c!25688) b!137116))

(assert (= (and b!137113 (not c!25688)) b!137108))

(assert (= (or b!137116 b!137108) bm!15102))

(assert (= (or b!137109 bm!15102) bm!15103))

(assert (= (or b!137107 bm!15103) bm!15104))

(assert (= (and bm!15104 c!25691) b!137112))

(assert (= (and bm!15104 (not c!25691)) b!137110))

(assert (= (and d!42841 res!65754) b!137114))

(assert (= (and b!137114 res!65755) b!137111))

(declare-fun m!163669 () Bool)

(assert (=> b!137112 m!163669))

(declare-fun m!163671 () Bool)

(assert (=> bm!15104 m!163671))

(declare-fun m!163673 () Bool)

(assert (=> d!42841 m!163673))

(declare-fun m!163675 () Bool)

(assert (=> d!42841 m!163675))

(declare-fun m!163677 () Bool)

(assert (=> b!137114 m!163677))

(declare-fun m!163679 () Bool)

(assert (=> b!137111 m!163679))

(assert (=> d!42565 d!42841))

(declare-fun d!42843 () Bool)

(assert (=> d!42843 (= (apply!117 lt!71143 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5750 () Bool)

(assert (= bs!5750 d!42843))

(assert (=> bs!5750 m!163339))

(assert (=> bs!5750 m!163339))

(declare-fun m!163681 () Bool)

(assert (=> bs!5750 m!163681))

(assert (=> b!136306 d!42843))

(declare-fun d!42845 () Bool)

(declare-fun e!89269 () Bool)

(assert (=> d!42845 e!89269))

(declare-fun res!65756 () Bool)

(assert (=> d!42845 (=> res!65756 e!89269)))

(declare-fun lt!71700 () Bool)

(assert (=> d!42845 (= res!65756 (not lt!71700))))

(declare-fun lt!71698 () Bool)

(assert (=> d!42845 (= lt!71700 lt!71698)))

(declare-fun lt!71701 () Unit!4275)

(declare-fun e!89270 () Unit!4275)

(assert (=> d!42845 (= lt!71701 e!89270)))

(declare-fun c!25692 () Bool)

(assert (=> d!42845 (= c!25692 lt!71698)))

(assert (=> d!42845 (= lt!71698 (containsKey!177 (toList!873 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) lt!71175))))

(assert (=> d!42845 (= (contains!905 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) lt!71175) lt!71700)))

(declare-fun b!137117 () Bool)

(declare-fun lt!71699 () Unit!4275)

(assert (=> b!137117 (= e!89270 lt!71699)))

(assert (=> b!137117 (= lt!71699 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) lt!71175))))

(assert (=> b!137117 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) lt!71175))))

(declare-fun b!137118 () Bool)

(declare-fun Unit!4318 () Unit!4275)

(assert (=> b!137118 (= e!89270 Unit!4318)))

(declare-fun b!137119 () Bool)

(assert (=> b!137119 (= e!89269 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) lt!71175)))))

(assert (= (and d!42845 c!25692) b!137117))

(assert (= (and d!42845 (not c!25692)) b!137118))

(assert (= (and d!42845 (not res!65756)) b!137119))

(declare-fun m!163683 () Bool)

(assert (=> d!42845 m!163683))

(declare-fun m!163685 () Bool)

(assert (=> b!137117 m!163685))

(declare-fun m!163687 () Bool)

(assert (=> b!137117 m!163687))

(assert (=> b!137117 m!163687))

(declare-fun m!163689 () Bool)

(assert (=> b!137117 m!163689))

(assert (=> b!137119 m!163687))

(assert (=> b!137119 m!163687))

(assert (=> b!137119 m!163689))

(assert (=> b!136322 d!42845))

(declare-fun d!42847 () Bool)

(assert (=> d!42847 (= (apply!117 (+!176 lt!71173 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) lt!71172) (apply!117 lt!71173 lt!71172))))

(declare-fun lt!71702 () Unit!4275)

(assert (=> d!42847 (= lt!71702 (choose!835 lt!71173 lt!71168 (zeroValue!2742 newMap!16) lt!71172))))

(declare-fun e!89271 () Bool)

(assert (=> d!42847 e!89271))

(declare-fun res!65757 () Bool)

(assert (=> d!42847 (=> (not res!65757) (not e!89271))))

(assert (=> d!42847 (= res!65757 (contains!905 lt!71173 lt!71172))))

(assert (=> d!42847 (= (addApplyDifferent!93 lt!71173 lt!71168 (zeroValue!2742 newMap!16) lt!71172) lt!71702)))

(declare-fun b!137120 () Bool)

(assert (=> b!137120 (= e!89271 (not (= lt!71172 lt!71168)))))

(assert (= (and d!42847 res!65757) b!137120))

(declare-fun m!163691 () Bool)

(assert (=> d!42847 m!163691))

(assert (=> d!42847 m!162383))

(assert (=> d!42847 m!162383))

(assert (=> d!42847 m!162393))

(declare-fun m!163693 () Bool)

(assert (=> d!42847 m!163693))

(assert (=> d!42847 m!162413))

(assert (=> b!136322 d!42847))

(declare-fun d!42849 () Bool)

(assert (=> d!42849 (= (apply!117 lt!71173 lt!71172) (get!1497 (getValueByKey!173 (toList!873 lt!71173) lt!71172)))))

(declare-fun bs!5751 () Bool)

(assert (= bs!5751 d!42849))

(declare-fun m!163695 () Bool)

(assert (=> bs!5751 m!163695))

(assert (=> bs!5751 m!163695))

(declare-fun m!163697 () Bool)

(assert (=> bs!5751 m!163697))

(assert (=> b!136322 d!42849))

(declare-fun d!42851 () Bool)

(declare-fun e!89272 () Bool)

(assert (=> d!42851 e!89272))

(declare-fun res!65759 () Bool)

(assert (=> d!42851 (=> (not res!65759) (not e!89272))))

(declare-fun lt!71705 () ListLongMap!1715)

(assert (=> d!42851 (= res!65759 (contains!905 lt!71705 (_1!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))))))

(declare-fun lt!71704 () List!1723)

(assert (=> d!42851 (= lt!71705 (ListLongMap!1716 lt!71704))))

(declare-fun lt!71703 () Unit!4275)

(declare-fun lt!71706 () Unit!4275)

(assert (=> d!42851 (= lt!71703 lt!71706)))

(assert (=> d!42851 (= (getValueByKey!173 lt!71704 (_1!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))))))

(assert (=> d!42851 (= lt!71706 (lemmaContainsTupThenGetReturnValue!88 lt!71704 (_1!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))))))

(assert (=> d!42851 (= lt!71704 (insertStrictlySorted!91 (toList!873 lt!71164) (_1!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))))))

(assert (=> d!42851 (= (+!176 lt!71164 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) lt!71705)))

(declare-fun b!137121 () Bool)

(declare-fun res!65758 () Bool)

(assert (=> b!137121 (=> (not res!65758) (not e!89272))))

(assert (=> b!137121 (= res!65758 (= (getValueByKey!173 (toList!873 lt!71705) (_1!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))))))))

(declare-fun b!137122 () Bool)

(assert (=> b!137122 (= e!89272 (contains!907 (toList!873 lt!71705) (tuple2!2643 lt!71178 (minValue!2742 newMap!16))))))

(assert (= (and d!42851 res!65759) b!137121))

(assert (= (and b!137121 res!65758) b!137122))

(declare-fun m!163699 () Bool)

(assert (=> d!42851 m!163699))

(declare-fun m!163701 () Bool)

(assert (=> d!42851 m!163701))

(declare-fun m!163703 () Bool)

(assert (=> d!42851 m!163703))

(declare-fun m!163705 () Bool)

(assert (=> d!42851 m!163705))

(declare-fun m!163707 () Bool)

(assert (=> b!137121 m!163707))

(declare-fun m!163709 () Bool)

(assert (=> b!137122 m!163709))

(assert (=> b!136322 d!42851))

(declare-fun d!42853 () Bool)

(assert (=> d!42853 (= (apply!117 (+!176 lt!71164 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) lt!71179) (apply!117 lt!71164 lt!71179))))

(declare-fun lt!71707 () Unit!4275)

(assert (=> d!42853 (= lt!71707 (choose!835 lt!71164 lt!71178 (minValue!2742 newMap!16) lt!71179))))

(declare-fun e!89273 () Bool)

(assert (=> d!42853 e!89273))

(declare-fun res!65760 () Bool)

(assert (=> d!42853 (=> (not res!65760) (not e!89273))))

(assert (=> d!42853 (= res!65760 (contains!905 lt!71164 lt!71179))))

(assert (=> d!42853 (= (addApplyDifferent!93 lt!71164 lt!71178 (minValue!2742 newMap!16) lt!71179) lt!71707)))

(declare-fun b!137123 () Bool)

(assert (=> b!137123 (= e!89273 (not (= lt!71179 lt!71178)))))

(assert (= (and d!42853 res!65760) b!137123))

(declare-fun m!163711 () Bool)

(assert (=> d!42853 m!163711))

(assert (=> d!42853 m!162395))

(assert (=> d!42853 m!162395))

(assert (=> d!42853 m!162397))

(declare-fun m!163713 () Bool)

(assert (=> d!42853 m!163713))

(assert (=> d!42853 m!162391))

(assert (=> b!136322 d!42853))

(declare-fun d!42855 () Bool)

(assert (=> d!42855 (= (apply!117 lt!71163 lt!71183) (get!1497 (getValueByKey!173 (toList!873 lt!71163) lt!71183)))))

(declare-fun bs!5752 () Bool)

(assert (= bs!5752 d!42855))

(declare-fun m!163715 () Bool)

(assert (=> bs!5752 m!163715))

(assert (=> bs!5752 m!163715))

(declare-fun m!163717 () Bool)

(assert (=> bs!5752 m!163717))

(assert (=> b!136322 d!42855))

(declare-fun d!42857 () Bool)

(assert (=> d!42857 (= (apply!117 (+!176 lt!71164 (tuple2!2643 lt!71178 (minValue!2742 newMap!16))) lt!71179) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71164 (tuple2!2643 lt!71178 (minValue!2742 newMap!16)))) lt!71179)))))

(declare-fun bs!5753 () Bool)

(assert (= bs!5753 d!42857))

(declare-fun m!163719 () Bool)

(assert (=> bs!5753 m!163719))

(assert (=> bs!5753 m!163719))

(declare-fun m!163721 () Bool)

(assert (=> bs!5753 m!163721))

(assert (=> b!136322 d!42857))

(declare-fun d!42859 () Bool)

(assert (=> d!42859 (contains!905 (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) lt!71175)))

(declare-fun lt!71708 () Unit!4275)

(assert (=> d!42859 (= lt!71708 (choose!836 lt!71182 lt!71166 (zeroValue!2742 newMap!16) lt!71175))))

(assert (=> d!42859 (contains!905 lt!71182 lt!71175)))

(assert (=> d!42859 (= (addStillContains!93 lt!71182 lt!71166 (zeroValue!2742 newMap!16) lt!71175) lt!71708)))

(declare-fun bs!5754 () Bool)

(assert (= bs!5754 d!42859))

(assert (=> bs!5754 m!162401))

(assert (=> bs!5754 m!162401))

(assert (=> bs!5754 m!162403))

(declare-fun m!163723 () Bool)

(assert (=> bs!5754 m!163723))

(declare-fun m!163725 () Bool)

(assert (=> bs!5754 m!163725))

(assert (=> b!136322 d!42859))

(declare-fun d!42861 () Bool)

(assert (=> d!42861 (= (apply!117 (+!176 lt!71163 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) lt!71183) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71163 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))) lt!71183)))))

(declare-fun bs!5755 () Bool)

(assert (= bs!5755 d!42861))

(declare-fun m!163727 () Bool)

(assert (=> bs!5755 m!163727))

(assert (=> bs!5755 m!163727))

(declare-fun m!163729 () Bool)

(assert (=> bs!5755 m!163729))

(assert (=> b!136322 d!42861))

(declare-fun d!42863 () Bool)

(declare-fun e!89274 () Bool)

(assert (=> d!42863 e!89274))

(declare-fun res!65762 () Bool)

(assert (=> d!42863 (=> (not res!65762) (not e!89274))))

(declare-fun lt!71711 () ListLongMap!1715)

(assert (=> d!42863 (= res!65762 (contains!905 lt!71711 (_1!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))))))

(declare-fun lt!71710 () List!1723)

(assert (=> d!42863 (= lt!71711 (ListLongMap!1716 lt!71710))))

(declare-fun lt!71709 () Unit!4275)

(declare-fun lt!71712 () Unit!4275)

(assert (=> d!42863 (= lt!71709 lt!71712)))

(assert (=> d!42863 (= (getValueByKey!173 lt!71710 (_1!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42863 (= lt!71712 (lemmaContainsTupThenGetReturnValue!88 lt!71710 (_1!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42863 (= lt!71710 (insertStrictlySorted!91 (toList!873 lt!71173) (_1!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42863 (= (+!176 lt!71173 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) lt!71711)))

(declare-fun b!137124 () Bool)

(declare-fun res!65761 () Bool)

(assert (=> b!137124 (=> (not res!65761) (not e!89274))))

(assert (=> b!137124 (= res!65761 (= (getValueByKey!173 (toList!873 lt!71711) (_1!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))))))))

(declare-fun b!137125 () Bool)

(assert (=> b!137125 (= e!89274 (contains!907 (toList!873 lt!71711) (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))))))

(assert (= (and d!42863 res!65762) b!137124))

(assert (= (and b!137124 res!65761) b!137125))

(declare-fun m!163731 () Bool)

(assert (=> d!42863 m!163731))

(declare-fun m!163733 () Bool)

(assert (=> d!42863 m!163733))

(declare-fun m!163735 () Bool)

(assert (=> d!42863 m!163735))

(declare-fun m!163737 () Bool)

(assert (=> d!42863 m!163737))

(declare-fun m!163739 () Bool)

(assert (=> b!137124 m!163739))

(declare-fun m!163741 () Bool)

(assert (=> b!137125 m!163741))

(assert (=> b!136322 d!42863))

(assert (=> b!136322 d!42591))

(declare-fun d!42865 () Bool)

(assert (=> d!42865 (= (apply!117 (+!176 lt!71163 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) lt!71183) (apply!117 lt!71163 lt!71183))))

(declare-fun lt!71713 () Unit!4275)

(assert (=> d!42865 (= lt!71713 (choose!835 lt!71163 lt!71181 (minValue!2742 newMap!16) lt!71183))))

(declare-fun e!89275 () Bool)

(assert (=> d!42865 e!89275))

(declare-fun res!65763 () Bool)

(assert (=> d!42865 (=> (not res!65763) (not e!89275))))

(assert (=> d!42865 (= res!65763 (contains!905 lt!71163 lt!71183))))

(assert (=> d!42865 (= (addApplyDifferent!93 lt!71163 lt!71181 (minValue!2742 newMap!16) lt!71183) lt!71713)))

(declare-fun b!137126 () Bool)

(assert (=> b!137126 (= e!89275 (not (= lt!71183 lt!71181)))))

(assert (= (and d!42865 res!65763) b!137126))

(declare-fun m!163743 () Bool)

(assert (=> d!42865 m!163743))

(assert (=> d!42865 m!162389))

(assert (=> d!42865 m!162389))

(assert (=> d!42865 m!162399))

(declare-fun m!163745 () Bool)

(assert (=> d!42865 m!163745))

(assert (=> d!42865 m!162409))

(assert (=> b!136322 d!42865))

(declare-fun d!42867 () Bool)

(declare-fun e!89276 () Bool)

(assert (=> d!42867 e!89276))

(declare-fun res!65765 () Bool)

(assert (=> d!42867 (=> (not res!65765) (not e!89276))))

(declare-fun lt!71716 () ListLongMap!1715)

(assert (=> d!42867 (= res!65765 (contains!905 lt!71716 (_1!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))))))

(declare-fun lt!71715 () List!1723)

(assert (=> d!42867 (= lt!71716 (ListLongMap!1716 lt!71715))))

(declare-fun lt!71714 () Unit!4275)

(declare-fun lt!71717 () Unit!4275)

(assert (=> d!42867 (= lt!71714 lt!71717)))

(assert (=> d!42867 (= (getValueByKey!173 lt!71715 (_1!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))))))

(assert (=> d!42867 (= lt!71717 (lemmaContainsTupThenGetReturnValue!88 lt!71715 (_1!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))))))

(assert (=> d!42867 (= lt!71715 (insertStrictlySorted!91 (toList!873 lt!71163) (_1!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))))))

(assert (=> d!42867 (= (+!176 lt!71163 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))) lt!71716)))

(declare-fun b!137127 () Bool)

(declare-fun res!65764 () Bool)

(assert (=> b!137127 (=> (not res!65764) (not e!89276))))

(assert (=> b!137127 (= res!65764 (= (getValueByKey!173 (toList!873 lt!71716) (_1!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71181 (minValue!2742 newMap!16))))))))

(declare-fun b!137128 () Bool)

(assert (=> b!137128 (= e!89276 (contains!907 (toList!873 lt!71716) (tuple2!2643 lt!71181 (minValue!2742 newMap!16))))))

(assert (= (and d!42867 res!65765) b!137127))

(assert (= (and b!137127 res!65764) b!137128))

(declare-fun m!163747 () Bool)

(assert (=> d!42867 m!163747))

(declare-fun m!163749 () Bool)

(assert (=> d!42867 m!163749))

(declare-fun m!163751 () Bool)

(assert (=> d!42867 m!163751))

(declare-fun m!163753 () Bool)

(assert (=> d!42867 m!163753))

(declare-fun m!163755 () Bool)

(assert (=> b!137127 m!163755))

(declare-fun m!163757 () Bool)

(assert (=> b!137128 m!163757))

(assert (=> b!136322 d!42867))

(declare-fun d!42869 () Bool)

(assert (=> d!42869 (= (apply!117 lt!71164 lt!71179) (get!1497 (getValueByKey!173 (toList!873 lt!71164) lt!71179)))))

(declare-fun bs!5756 () Bool)

(assert (= bs!5756 d!42869))

(declare-fun m!163759 () Bool)

(assert (=> bs!5756 m!163759))

(assert (=> bs!5756 m!163759))

(declare-fun m!163761 () Bool)

(assert (=> bs!5756 m!163761))

(assert (=> b!136322 d!42869))

(declare-fun d!42871 () Bool)

(assert (=> d!42871 (= (apply!117 (+!176 lt!71173 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16))) lt!71172) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71173 (tuple2!2643 lt!71168 (zeroValue!2742 newMap!16)))) lt!71172)))))

(declare-fun bs!5757 () Bool)

(assert (= bs!5757 d!42871))

(declare-fun m!163763 () Bool)

(assert (=> bs!5757 m!163763))

(assert (=> bs!5757 m!163763))

(declare-fun m!163765 () Bool)

(assert (=> bs!5757 m!163765))

(assert (=> b!136322 d!42871))

(declare-fun d!42873 () Bool)

(declare-fun e!89277 () Bool)

(assert (=> d!42873 e!89277))

(declare-fun res!65767 () Bool)

(assert (=> d!42873 (=> (not res!65767) (not e!89277))))

(declare-fun lt!71720 () ListLongMap!1715)

(assert (=> d!42873 (= res!65767 (contains!905 lt!71720 (_1!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))))))

(declare-fun lt!71719 () List!1723)

(assert (=> d!42873 (= lt!71720 (ListLongMap!1716 lt!71719))))

(declare-fun lt!71718 () Unit!4275)

(declare-fun lt!71721 () Unit!4275)

(assert (=> d!42873 (= lt!71718 lt!71721)))

(assert (=> d!42873 (= (getValueByKey!173 lt!71719 (_1!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42873 (= lt!71721 (lemmaContainsTupThenGetReturnValue!88 lt!71719 (_1!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42873 (= lt!71719 (insertStrictlySorted!91 (toList!873 lt!71182) (_1!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42873 (= (+!176 lt!71182 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))) lt!71720)))

(declare-fun b!137129 () Bool)

(declare-fun res!65766 () Bool)

(assert (=> b!137129 (=> (not res!65766) (not e!89277))))

(assert (=> b!137129 (= res!65766 (= (getValueByKey!173 (toList!873 lt!71720) (_1!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))))))))

(declare-fun b!137130 () Bool)

(assert (=> b!137130 (= e!89277 (contains!907 (toList!873 lt!71720) (tuple2!2643 lt!71166 (zeroValue!2742 newMap!16))))))

(assert (= (and d!42873 res!65767) b!137129))

(assert (= (and b!137129 res!65766) b!137130))

(declare-fun m!163767 () Bool)

(assert (=> d!42873 m!163767))

(declare-fun m!163769 () Bool)

(assert (=> d!42873 m!163769))

(declare-fun m!163771 () Bool)

(assert (=> d!42873 m!163771))

(declare-fun m!163773 () Bool)

(assert (=> d!42873 m!163773))

(declare-fun m!163775 () Bool)

(assert (=> b!137129 m!163775))

(declare-fun m!163777 () Bool)

(assert (=> b!137130 m!163777))

(assert (=> b!136322 d!42873))

(declare-fun d!42875 () Bool)

(assert (=> d!42875 (= (apply!117 lt!71331 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1497 (getValueByKey!173 (toList!873 lt!71331) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5758 () Bool)

(assert (= bs!5758 d!42875))

(assert (=> bs!5758 m!162243))

(assert (=> bs!5758 m!163163))

(assert (=> bs!5758 m!163163))

(declare-fun m!163779 () Bool)

(assert (=> bs!5758 m!163779))

(assert (=> b!136479 d!42875))

(assert (=> b!136479 d!42489))

(declare-fun d!42877 () Bool)

(assert (=> d!42877 (= (get!1497 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3225 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!42487 d!42877))

(assert (=> d!42487 d!42783))

(declare-fun b!137131 () Bool)

(declare-fun e!89279 () (_ BitVec 32))

(declare-fun e!89278 () (_ BitVec 32))

(assert (=> b!137131 (= e!89279 e!89278)))

(declare-fun c!25693 () Bool)

(assert (=> b!137131 (= c!25693 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!137132 () Bool)

(declare-fun call!15108 () (_ BitVec 32))

(assert (=> b!137132 (= e!89278 call!15108)))

(declare-fun b!137133 () Bool)

(assert (=> b!137133 (= e!89279 #b00000000000000000000000000000000)))

(declare-fun bm!15105 () Bool)

(assert (=> bm!15105 (= call!15108 (arrayCountValidKeys!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137134 () Bool)

(assert (=> b!137134 (= e!89278 (bvadd #b00000000000000000000000000000001 call!15108))))

(declare-fun d!42879 () Bool)

(declare-fun lt!71722 () (_ BitVec 32))

(assert (=> d!42879 (and (bvsge lt!71722 #b00000000000000000000000000000000) (bvsle lt!71722 (bvsub (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!42879 (= lt!71722 e!89279)))

(declare-fun c!25694 () Bool)

(assert (=> d!42879 (= c!25694 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42879 (and (bvsle #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!42879 (= (arrayCountValidKeys!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))) lt!71722)))

(assert (= (and d!42879 c!25694) b!137133))

(assert (= (and d!42879 (not c!25694)) b!137131))

(assert (= (and b!137131 c!25693) b!137134))

(assert (= (and b!137131 (not c!25693)) b!137132))

(assert (= (or b!137134 b!137132) bm!15105))

(assert (=> b!137131 m!162885))

(assert (=> b!137131 m!162885))

(assert (=> b!137131 m!162889))

(declare-fun m!163781 () Bool)

(assert (=> bm!15105 m!163781))

(assert (=> b!136342 d!42879))

(declare-fun b!137135 () Bool)

(declare-fun e!89280 () Option!179)

(assert (=> b!137135 (= e!89280 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71198)))))))

(declare-fun c!25695 () Bool)

(declare-fun d!42881 () Bool)

(assert (=> d!42881 (= c!25695 (and ((_ is Cons!1719) (toList!873 lt!71198)) (= (_1!1332 (h!2325 (toList!873 lt!71198))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!42881 (= (getValueByKey!173 (toList!873 lt!71198) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!89280)))

(declare-fun b!137136 () Bool)

(declare-fun e!89281 () Option!179)

(assert (=> b!137136 (= e!89280 e!89281)))

(declare-fun c!25696 () Bool)

(assert (=> b!137136 (= c!25696 (and ((_ is Cons!1719) (toList!873 lt!71198)) (not (= (_1!1332 (h!2325 (toList!873 lt!71198))) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!137137 () Bool)

(assert (=> b!137137 (= e!89281 (getValueByKey!173 (t!6211 (toList!873 lt!71198)) (_1!1332 (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137138 () Bool)

(assert (=> b!137138 (= e!89281 None!177)))

(assert (= (and d!42881 c!25695) b!137135))

(assert (= (and d!42881 (not c!25695)) b!137136))

(assert (= (and b!137136 c!25696) b!137137))

(assert (= (and b!137136 (not c!25696)) b!137138))

(declare-fun m!163783 () Bool)

(assert (=> b!137137 m!163783))

(assert (=> b!136349 d!42881))

(declare-fun d!42883 () Bool)

(declare-fun e!89282 () Bool)

(assert (=> d!42883 e!89282))

(declare-fun res!65768 () Bool)

(assert (=> d!42883 (=> res!65768 e!89282)))

(declare-fun lt!71725 () Bool)

(assert (=> d!42883 (= res!65768 (not lt!71725))))

(declare-fun lt!71723 () Bool)

(assert (=> d!42883 (= lt!71725 lt!71723)))

(declare-fun lt!71726 () Unit!4275)

(declare-fun e!89283 () Unit!4275)

(assert (=> d!42883 (= lt!71726 e!89283)))

(declare-fun c!25697 () Bool)

(assert (=> d!42883 (= c!25697 lt!71723)))

(assert (=> d!42883 (= lt!71723 (containsKey!177 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42883 (= (contains!905 lt!71356 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71725)))

(declare-fun b!137139 () Bool)

(declare-fun lt!71724 () Unit!4275)

(assert (=> b!137139 (= e!89283 lt!71724)))

(assert (=> b!137139 (= lt!71724 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> b!137139 (isDefined!126 (getValueByKey!173 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137140 () Bool)

(declare-fun Unit!4319 () Unit!4275)

(assert (=> b!137140 (= e!89283 Unit!4319)))

(declare-fun b!137141 () Bool)

(assert (=> b!137141 (= e!89282 (isDefined!126 (getValueByKey!173 (toList!873 lt!71356) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42883 c!25697) b!137139))

(assert (= (and d!42883 (not c!25697)) b!137140))

(assert (= (and d!42883 (not res!65768)) b!137141))

(declare-fun m!163785 () Bool)

(assert (=> d!42883 m!163785))

(declare-fun m!163787 () Bool)

(assert (=> b!137139 m!163787))

(assert (=> b!137139 m!162673))

(assert (=> b!137139 m!162673))

(declare-fun m!163789 () Bool)

(assert (=> b!137139 m!163789))

(assert (=> b!137141 m!162673))

(assert (=> b!137141 m!162673))

(assert (=> b!137141 m!163789))

(assert (=> d!42523 d!42883))

(declare-fun b!137142 () Bool)

(declare-fun e!89284 () Option!179)

(assert (=> b!137142 (= e!89284 (Some!178 (_2!1332 (h!2325 lt!71355))))))

(declare-fun d!42885 () Bool)

(declare-fun c!25698 () Bool)

(assert (=> d!42885 (= c!25698 (and ((_ is Cons!1719) lt!71355) (= (_1!1332 (h!2325 lt!71355)) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42885 (= (getValueByKey!173 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89284)))

(declare-fun b!137143 () Bool)

(declare-fun e!89285 () Option!179)

(assert (=> b!137143 (= e!89284 e!89285)))

(declare-fun c!25699 () Bool)

(assert (=> b!137143 (= c!25699 (and ((_ is Cons!1719) lt!71355) (not (= (_1!1332 (h!2325 lt!71355)) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137144 () Bool)

(assert (=> b!137144 (= e!89285 (getValueByKey!173 (t!6211 lt!71355) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137145 () Bool)

(assert (=> b!137145 (= e!89285 None!177)))

(assert (= (and d!42885 c!25698) b!137142))

(assert (= (and d!42885 (not c!25698)) b!137143))

(assert (= (and b!137143 c!25699) b!137144))

(assert (= (and b!137143 (not c!25699)) b!137145))

(declare-fun m!163791 () Bool)

(assert (=> b!137144 m!163791))

(assert (=> d!42523 d!42885))

(declare-fun d!42887 () Bool)

(assert (=> d!42887 (= (getValueByKey!173 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71727 () Unit!4275)

(assert (=> d!42887 (= lt!71727 (choose!841 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89286 () Bool)

(assert (=> d!42887 e!89286))

(declare-fun res!65769 () Bool)

(assert (=> d!42887 (=> (not res!65769) (not e!89286))))

(assert (=> d!42887 (= res!65769 (isStrictlySorted!323 lt!71355))))

(assert (=> d!42887 (= (lemmaContainsTupThenGetReturnValue!88 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71727)))

(declare-fun b!137146 () Bool)

(declare-fun res!65770 () Bool)

(assert (=> b!137146 (=> (not res!65770) (not e!89286))))

(assert (=> b!137146 (= res!65770 (containsKey!177 lt!71355 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137147 () Bool)

(assert (=> b!137147 (= e!89286 (contains!907 lt!71355 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42887 res!65769) b!137146))

(assert (= (and b!137146 res!65770) b!137147))

(assert (=> d!42887 m!162667))

(declare-fun m!163793 () Bool)

(assert (=> d!42887 m!163793))

(declare-fun m!163795 () Bool)

(assert (=> d!42887 m!163795))

(declare-fun m!163797 () Bool)

(assert (=> b!137146 m!163797))

(declare-fun m!163799 () Bool)

(assert (=> b!137147 m!163799))

(assert (=> d!42523 d!42887))

(declare-fun bm!15106 () Bool)

(declare-fun call!15109 () List!1723)

(declare-fun call!15111 () List!1723)

(assert (=> bm!15106 (= call!15109 call!15111)))

(declare-fun b!137148 () Bool)

(declare-fun e!89289 () List!1723)

(declare-fun call!15110 () List!1723)

(assert (=> b!137148 (= e!89289 call!15110)))

(declare-fun b!137149 () Bool)

(declare-fun e!89288 () List!1723)

(assert (=> b!137149 (= e!89288 call!15109)))

(declare-fun b!137150 () Bool)

(declare-fun e!89291 () List!1723)

(assert (=> b!137150 (= e!89291 call!15111)))

(declare-fun c!25700 () Bool)

(declare-fun c!25701 () Bool)

(declare-fun b!137151 () Bool)

(declare-fun e!89287 () List!1723)

(assert (=> b!137151 (= e!89287 (ite c!25701 (t!6211 (toList!873 lt!71112)) (ite c!25700 (Cons!1719 (h!2325 (toList!873 lt!71112)) (t!6211 (toList!873 lt!71112))) Nil!1720)))))

(declare-fun lt!71728 () List!1723)

(declare-fun e!89290 () Bool)

(declare-fun b!137152 () Bool)

(assert (=> b!137152 (= e!89290 (contains!907 lt!71728 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun bm!15107 () Bool)

(assert (=> bm!15107 (= call!15111 call!15110)))

(declare-fun c!25702 () Bool)

(declare-fun bm!15108 () Bool)

(assert (=> bm!15108 (= call!15110 ($colon$colon!93 e!89287 (ite c!25702 (h!2325 (toList!873 lt!71112)) (tuple2!2643 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun c!25703 () Bool)

(assert (=> bm!15108 (= c!25703 c!25702)))

(declare-fun b!137153 () Bool)

(assert (=> b!137153 (= e!89287 (insertStrictlySorted!91 (t!6211 (toList!873 lt!71112)) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun d!42889 () Bool)

(assert (=> d!42889 e!89290))

(declare-fun res!65771 () Bool)

(assert (=> d!42889 (=> (not res!65771) (not e!89290))))

(assert (=> d!42889 (= res!65771 (isStrictlySorted!323 lt!71728))))

(assert (=> d!42889 (= lt!71728 e!89289)))

(assert (=> d!42889 (= c!25702 (and ((_ is Cons!1719) (toList!873 lt!71112)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71112))) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42889 (isStrictlySorted!323 (toList!873 lt!71112))))

(assert (=> d!42889 (= (insertStrictlySorted!91 (toList!873 lt!71112) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71728)))

(declare-fun b!137154 () Bool)

(assert (=> b!137154 (= c!25700 (and ((_ is Cons!1719) (toList!873 lt!71112)) (bvsgt (_1!1332 (h!2325 (toList!873 lt!71112))) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!137154 (= e!89291 e!89288)))

(declare-fun b!137155 () Bool)

(declare-fun res!65772 () Bool)

(assert (=> b!137155 (=> (not res!65772) (not e!89290))))

(assert (=> b!137155 (= res!65772 (containsKey!177 lt!71728 (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137156 () Bool)

(assert (=> b!137156 (= e!89289 e!89291)))

(assert (=> b!137156 (= c!25701 (and ((_ is Cons!1719) (toList!873 lt!71112)) (= (_1!1332 (h!2325 (toList!873 lt!71112))) (_1!1332 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!137157 () Bool)

(assert (=> b!137157 (= e!89288 call!15109)))

(assert (= (and d!42889 c!25702) b!137148))

(assert (= (and d!42889 (not c!25702)) b!137156))

(assert (= (and b!137156 c!25701) b!137150))

(assert (= (and b!137156 (not c!25701)) b!137154))

(assert (= (and b!137154 c!25700) b!137157))

(assert (= (and b!137154 (not c!25700)) b!137149))

(assert (= (or b!137157 b!137149) bm!15106))

(assert (= (or b!137150 bm!15106) bm!15107))

(assert (= (or b!137148 bm!15107) bm!15108))

(assert (= (and bm!15108 c!25703) b!137153))

(assert (= (and bm!15108 (not c!25703)) b!137151))

(assert (= (and d!42889 res!65771) b!137155))

(assert (= (and b!137155 res!65772) b!137152))

(declare-fun m!163801 () Bool)

(assert (=> b!137153 m!163801))

(declare-fun m!163803 () Bool)

(assert (=> bm!15108 m!163803))

(declare-fun m!163805 () Bool)

(assert (=> d!42889 m!163805))

(declare-fun m!163807 () Bool)

(assert (=> d!42889 m!163807))

(declare-fun m!163809 () Bool)

(assert (=> b!137155 m!163809))

(declare-fun m!163811 () Bool)

(assert (=> b!137152 m!163811))

(assert (=> d!42523 d!42889))

(declare-fun d!42891 () Bool)

(assert (=> d!42891 (= (apply!117 (+!176 lt!71130 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) lt!71150) (apply!117 lt!71130 lt!71150))))

(declare-fun lt!71729 () Unit!4275)

(assert (=> d!42891 (= lt!71729 (choose!835 lt!71130 lt!71148 (minValue!2742 newMap!16) lt!71150))))

(declare-fun e!89292 () Bool)

(assert (=> d!42891 e!89292))

(declare-fun res!65773 () Bool)

(assert (=> d!42891 (=> (not res!65773) (not e!89292))))

(assert (=> d!42891 (= res!65773 (contains!905 lt!71130 lt!71150))))

(assert (=> d!42891 (= (addApplyDifferent!93 lt!71130 lt!71148 (minValue!2742 newMap!16) lt!71150) lt!71729)))

(declare-fun b!137158 () Bool)

(assert (=> b!137158 (= e!89292 (not (= lt!71150 lt!71148)))))

(assert (= (and d!42891 res!65773) b!137158))

(declare-fun m!163813 () Bool)

(assert (=> d!42891 m!163813))

(assert (=> d!42891 m!162311))

(assert (=> d!42891 m!162311))

(assert (=> d!42891 m!162321))

(declare-fun m!163815 () Bool)

(assert (=> d!42891 m!163815))

(assert (=> d!42891 m!162333))

(assert (=> b!136292 d!42891))

(declare-fun d!42893 () Bool)

(declare-fun e!89293 () Bool)

(assert (=> d!42893 e!89293))

(declare-fun res!65774 () Bool)

(assert (=> d!42893 (=> res!65774 e!89293)))

(declare-fun lt!71732 () Bool)

(assert (=> d!42893 (= res!65774 (not lt!71732))))

(declare-fun lt!71730 () Bool)

(assert (=> d!42893 (= lt!71732 lt!71730)))

(declare-fun lt!71733 () Unit!4275)

(declare-fun e!89294 () Unit!4275)

(assert (=> d!42893 (= lt!71733 e!89294)))

(declare-fun c!25704 () Bool)

(assert (=> d!42893 (= c!25704 lt!71730)))

(assert (=> d!42893 (= lt!71730 (containsKey!177 (toList!873 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) lt!71142))))

(assert (=> d!42893 (= (contains!905 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) lt!71142) lt!71732)))

(declare-fun b!137159 () Bool)

(declare-fun lt!71731 () Unit!4275)

(assert (=> b!137159 (= e!89294 lt!71731)))

(assert (=> b!137159 (= lt!71731 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) lt!71142))))

(assert (=> b!137159 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) lt!71142))))

(declare-fun b!137160 () Bool)

(declare-fun Unit!4320 () Unit!4275)

(assert (=> b!137160 (= e!89294 Unit!4320)))

(declare-fun b!137161 () Bool)

(assert (=> b!137161 (= e!89293 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) lt!71142)))))

(assert (= (and d!42893 c!25704) b!137159))

(assert (= (and d!42893 (not c!25704)) b!137160))

(assert (= (and d!42893 (not res!65774)) b!137161))

(declare-fun m!163817 () Bool)

(assert (=> d!42893 m!163817))

(declare-fun m!163819 () Bool)

(assert (=> b!137159 m!163819))

(declare-fun m!163821 () Bool)

(assert (=> b!137159 m!163821))

(assert (=> b!137159 m!163821))

(declare-fun m!163823 () Bool)

(assert (=> b!137159 m!163823))

(assert (=> b!137161 m!163821))

(assert (=> b!137161 m!163821))

(assert (=> b!137161 m!163823))

(assert (=> b!136292 d!42893))

(declare-fun d!42895 () Bool)

(assert (=> d!42895 (= (apply!117 (+!176 lt!71131 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) lt!71146) (apply!117 lt!71131 lt!71146))))

(declare-fun lt!71734 () Unit!4275)

(assert (=> d!42895 (= lt!71734 (choose!835 lt!71131 lt!71145 (minValue!2742 newMap!16) lt!71146))))

(declare-fun e!89295 () Bool)

(assert (=> d!42895 e!89295))

(declare-fun res!65775 () Bool)

(assert (=> d!42895 (=> (not res!65775) (not e!89295))))

(assert (=> d!42895 (= res!65775 (contains!905 lt!71131 lt!71146))))

(assert (=> d!42895 (= (addApplyDifferent!93 lt!71131 lt!71145 (minValue!2742 newMap!16) lt!71146) lt!71734)))

(declare-fun b!137162 () Bool)

(assert (=> b!137162 (= e!89295 (not (= lt!71146 lt!71145)))))

(assert (= (and d!42895 res!65775) b!137162))

(declare-fun m!163825 () Bool)

(assert (=> d!42895 m!163825))

(assert (=> d!42895 m!162317))

(assert (=> d!42895 m!162317))

(assert (=> d!42895 m!162319))

(declare-fun m!163827 () Bool)

(assert (=> d!42895 m!163827))

(assert (=> d!42895 m!162313))

(assert (=> b!136292 d!42895))

(declare-fun d!42897 () Bool)

(assert (=> d!42897 (= (apply!117 (+!176 lt!71140 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) lt!71139) (apply!117 lt!71140 lt!71139))))

(declare-fun lt!71735 () Unit!4275)

(assert (=> d!42897 (= lt!71735 (choose!835 lt!71140 lt!71135 (zeroValue!2742 newMap!16) lt!71139))))

(declare-fun e!89296 () Bool)

(assert (=> d!42897 e!89296))

(declare-fun res!65776 () Bool)

(assert (=> d!42897 (=> (not res!65776) (not e!89296))))

(assert (=> d!42897 (= res!65776 (contains!905 lt!71140 lt!71139))))

(assert (=> d!42897 (= (addApplyDifferent!93 lt!71140 lt!71135 (zeroValue!2742 newMap!16) lt!71139) lt!71735)))

(declare-fun b!137163 () Bool)

(assert (=> b!137163 (= e!89296 (not (= lt!71139 lt!71135)))))

(assert (= (and d!42897 res!65776) b!137163))

(declare-fun m!163829 () Bool)

(assert (=> d!42897 m!163829))

(assert (=> d!42897 m!162305))

(assert (=> d!42897 m!162305))

(assert (=> d!42897 m!162315))

(declare-fun m!163831 () Bool)

(assert (=> d!42897 m!163831))

(assert (=> d!42897 m!162337))

(assert (=> b!136292 d!42897))

(declare-fun d!42899 () Bool)

(declare-fun e!89297 () Bool)

(assert (=> d!42899 e!89297))

(declare-fun res!65778 () Bool)

(assert (=> d!42899 (=> (not res!65778) (not e!89297))))

(declare-fun lt!71738 () ListLongMap!1715)

(assert (=> d!42899 (= res!65778 (contains!905 lt!71738 (_1!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))))))

(declare-fun lt!71737 () List!1723)

(assert (=> d!42899 (= lt!71738 (ListLongMap!1716 lt!71737))))

(declare-fun lt!71736 () Unit!4275)

(declare-fun lt!71739 () Unit!4275)

(assert (=> d!42899 (= lt!71736 lt!71739)))

(assert (=> d!42899 (= (getValueByKey!173 lt!71737 (_1!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42899 (= lt!71739 (lemmaContainsTupThenGetReturnValue!88 lt!71737 (_1!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42899 (= lt!71737 (insertStrictlySorted!91 (toList!873 lt!71149) (_1!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42899 (= (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) lt!71738)))

(declare-fun b!137164 () Bool)

(declare-fun res!65777 () Bool)

(assert (=> b!137164 (=> (not res!65777) (not e!89297))))

(assert (=> b!137164 (= res!65777 (= (getValueByKey!173 (toList!873 lt!71738) (_1!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))))))))

(declare-fun b!137165 () Bool)

(assert (=> b!137165 (= e!89297 (contains!907 (toList!873 lt!71738) (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))))))

(assert (= (and d!42899 res!65778) b!137164))

(assert (= (and b!137164 res!65777) b!137165))

(declare-fun m!163833 () Bool)

(assert (=> d!42899 m!163833))

(declare-fun m!163835 () Bool)

(assert (=> d!42899 m!163835))

(declare-fun m!163837 () Bool)

(assert (=> d!42899 m!163837))

(declare-fun m!163839 () Bool)

(assert (=> d!42899 m!163839))

(declare-fun m!163841 () Bool)

(assert (=> b!137164 m!163841))

(declare-fun m!163843 () Bool)

(assert (=> b!137165 m!163843))

(assert (=> b!136292 d!42899))

(declare-fun d!42901 () Bool)

(assert (=> d!42901 (= (apply!117 (+!176 lt!71131 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) lt!71146) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71131 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))) lt!71146)))))

(declare-fun bs!5759 () Bool)

(assert (= bs!5759 d!42901))

(declare-fun m!163845 () Bool)

(assert (=> bs!5759 m!163845))

(assert (=> bs!5759 m!163845))

(declare-fun m!163847 () Bool)

(assert (=> bs!5759 m!163847))

(assert (=> b!136292 d!42901))

(declare-fun d!42903 () Bool)

(assert (=> d!42903 (= (apply!117 (+!176 lt!71140 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) lt!71139) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71140 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))) lt!71139)))))

(declare-fun bs!5760 () Bool)

(assert (= bs!5760 d!42903))

(declare-fun m!163849 () Bool)

(assert (=> bs!5760 m!163849))

(assert (=> bs!5760 m!163849))

(declare-fun m!163851 () Bool)

(assert (=> bs!5760 m!163851))

(assert (=> b!136292 d!42903))

(assert (=> b!136292 d!42657))

(declare-fun d!42905 () Bool)

(declare-fun e!89298 () Bool)

(assert (=> d!42905 e!89298))

(declare-fun res!65780 () Bool)

(assert (=> d!42905 (=> (not res!65780) (not e!89298))))

(declare-fun lt!71742 () ListLongMap!1715)

(assert (=> d!42905 (= res!65780 (contains!905 lt!71742 (_1!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))))))

(declare-fun lt!71741 () List!1723)

(assert (=> d!42905 (= lt!71742 (ListLongMap!1716 lt!71741))))

(declare-fun lt!71740 () Unit!4275)

(declare-fun lt!71743 () Unit!4275)

(assert (=> d!42905 (= lt!71740 lt!71743)))

(assert (=> d!42905 (= (getValueByKey!173 lt!71741 (_1!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))))))

(assert (=> d!42905 (= lt!71743 (lemmaContainsTupThenGetReturnValue!88 lt!71741 (_1!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))))))

(assert (=> d!42905 (= lt!71741 (insertStrictlySorted!91 (toList!873 lt!71130) (_1!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))))))

(assert (=> d!42905 (= (+!176 lt!71130 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) lt!71742)))

(declare-fun b!137166 () Bool)

(declare-fun res!65779 () Bool)

(assert (=> b!137166 (=> (not res!65779) (not e!89298))))

(assert (=> b!137166 (= res!65779 (= (getValueByKey!173 (toList!873 lt!71742) (_1!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))))))))

(declare-fun b!137167 () Bool)

(assert (=> b!137167 (= e!89298 (contains!907 (toList!873 lt!71742) (tuple2!2643 lt!71148 (minValue!2742 newMap!16))))))

(assert (= (and d!42905 res!65780) b!137166))

(assert (= (and b!137166 res!65779) b!137167))

(declare-fun m!163853 () Bool)

(assert (=> d!42905 m!163853))

(declare-fun m!163855 () Bool)

(assert (=> d!42905 m!163855))

(declare-fun m!163857 () Bool)

(assert (=> d!42905 m!163857))

(declare-fun m!163859 () Bool)

(assert (=> d!42905 m!163859))

(declare-fun m!163861 () Bool)

(assert (=> b!137166 m!163861))

(declare-fun m!163863 () Bool)

(assert (=> b!137167 m!163863))

(assert (=> b!136292 d!42905))

(declare-fun d!42907 () Bool)

(assert (=> d!42907 (contains!905 (+!176 lt!71149 (tuple2!2643 lt!71133 (zeroValue!2742 newMap!16))) lt!71142)))

(declare-fun lt!71744 () Unit!4275)

(assert (=> d!42907 (= lt!71744 (choose!836 lt!71149 lt!71133 (zeroValue!2742 newMap!16) lt!71142))))

(assert (=> d!42907 (contains!905 lt!71149 lt!71142)))

(assert (=> d!42907 (= (addStillContains!93 lt!71149 lt!71133 (zeroValue!2742 newMap!16) lt!71142) lt!71744)))

(declare-fun bs!5761 () Bool)

(assert (= bs!5761 d!42907))

(assert (=> bs!5761 m!162323))

(assert (=> bs!5761 m!162323))

(assert (=> bs!5761 m!162325))

(declare-fun m!163865 () Bool)

(assert (=> bs!5761 m!163865))

(declare-fun m!163867 () Bool)

(assert (=> bs!5761 m!163867))

(assert (=> b!136292 d!42907))

(declare-fun d!42909 () Bool)

(assert (=> d!42909 (= (apply!117 lt!71131 lt!71146) (get!1497 (getValueByKey!173 (toList!873 lt!71131) lt!71146)))))

(declare-fun bs!5762 () Bool)

(assert (= bs!5762 d!42909))

(declare-fun m!163869 () Bool)

(assert (=> bs!5762 m!163869))

(assert (=> bs!5762 m!163869))

(declare-fun m!163871 () Bool)

(assert (=> bs!5762 m!163871))

(assert (=> b!136292 d!42909))

(declare-fun d!42911 () Bool)

(assert (=> d!42911 (= (apply!117 (+!176 lt!71130 (tuple2!2643 lt!71148 (minValue!2742 newMap!16))) lt!71150) (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71130 (tuple2!2643 lt!71148 (minValue!2742 newMap!16)))) lt!71150)))))

(declare-fun bs!5763 () Bool)

(assert (= bs!5763 d!42911))

(declare-fun m!163873 () Bool)

(assert (=> bs!5763 m!163873))

(assert (=> bs!5763 m!163873))

(declare-fun m!163875 () Bool)

(assert (=> bs!5763 m!163875))

(assert (=> b!136292 d!42911))

(declare-fun d!42913 () Bool)

(assert (=> d!42913 (= (apply!117 lt!71130 lt!71150) (get!1497 (getValueByKey!173 (toList!873 lt!71130) lt!71150)))))

(declare-fun bs!5764 () Bool)

(assert (= bs!5764 d!42913))

(declare-fun m!163877 () Bool)

(assert (=> bs!5764 m!163877))

(assert (=> bs!5764 m!163877))

(declare-fun m!163879 () Bool)

(assert (=> bs!5764 m!163879))

(assert (=> b!136292 d!42913))

(declare-fun d!42915 () Bool)

(declare-fun e!89299 () Bool)

(assert (=> d!42915 e!89299))

(declare-fun res!65782 () Bool)

(assert (=> d!42915 (=> (not res!65782) (not e!89299))))

(declare-fun lt!71747 () ListLongMap!1715)

(assert (=> d!42915 (= res!65782 (contains!905 lt!71747 (_1!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))))))

(declare-fun lt!71746 () List!1723)

(assert (=> d!42915 (= lt!71747 (ListLongMap!1716 lt!71746))))

(declare-fun lt!71745 () Unit!4275)

(declare-fun lt!71748 () Unit!4275)

(assert (=> d!42915 (= lt!71745 lt!71748)))

(assert (=> d!42915 (= (getValueByKey!173 lt!71746 (_1!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42915 (= lt!71748 (lemmaContainsTupThenGetReturnValue!88 lt!71746 (_1!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42915 (= lt!71746 (insertStrictlySorted!91 (toList!873 lt!71140) (_1!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))))))

(assert (=> d!42915 (= (+!176 lt!71140 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))) lt!71747)))

(declare-fun b!137168 () Bool)

(declare-fun res!65781 () Bool)

(assert (=> b!137168 (=> (not res!65781) (not e!89299))))

(assert (=> b!137168 (= res!65781 (= (getValueByKey!173 (toList!873 lt!71747) (_1!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))))))))

(declare-fun b!137169 () Bool)

(assert (=> b!137169 (= e!89299 (contains!907 (toList!873 lt!71747) (tuple2!2643 lt!71135 (zeroValue!2742 newMap!16))))))

(assert (= (and d!42915 res!65782) b!137168))

(assert (= (and b!137168 res!65781) b!137169))

(declare-fun m!163881 () Bool)

(assert (=> d!42915 m!163881))

(declare-fun m!163883 () Bool)

(assert (=> d!42915 m!163883))

(declare-fun m!163885 () Bool)

(assert (=> d!42915 m!163885))

(declare-fun m!163887 () Bool)

(assert (=> d!42915 m!163887))

(declare-fun m!163889 () Bool)

(assert (=> b!137168 m!163889))

(declare-fun m!163891 () Bool)

(assert (=> b!137169 m!163891))

(assert (=> b!136292 d!42915))

(declare-fun d!42917 () Bool)

(declare-fun e!89300 () Bool)

(assert (=> d!42917 e!89300))

(declare-fun res!65784 () Bool)

(assert (=> d!42917 (=> (not res!65784) (not e!89300))))

(declare-fun lt!71751 () ListLongMap!1715)

(assert (=> d!42917 (= res!65784 (contains!905 lt!71751 (_1!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))))))

(declare-fun lt!71750 () List!1723)

(assert (=> d!42917 (= lt!71751 (ListLongMap!1716 lt!71750))))

(declare-fun lt!71749 () Unit!4275)

(declare-fun lt!71752 () Unit!4275)

(assert (=> d!42917 (= lt!71749 lt!71752)))

(assert (=> d!42917 (= (getValueByKey!173 lt!71750 (_1!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))))))

(assert (=> d!42917 (= lt!71752 (lemmaContainsTupThenGetReturnValue!88 lt!71750 (_1!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))))))

(assert (=> d!42917 (= lt!71750 (insertStrictlySorted!91 (toList!873 lt!71131) (_1!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))))))

(assert (=> d!42917 (= (+!176 lt!71131 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))) lt!71751)))

(declare-fun b!137170 () Bool)

(declare-fun res!65783 () Bool)

(assert (=> b!137170 (=> (not res!65783) (not e!89300))))

(assert (=> b!137170 (= res!65783 (= (getValueByKey!173 (toList!873 lt!71751) (_1!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 lt!71145 (minValue!2742 newMap!16))))))))

(declare-fun b!137171 () Bool)

(assert (=> b!137171 (= e!89300 (contains!907 (toList!873 lt!71751) (tuple2!2643 lt!71145 (minValue!2742 newMap!16))))))

(assert (= (and d!42917 res!65784) b!137170))

(assert (= (and b!137170 res!65783) b!137171))

(declare-fun m!163893 () Bool)

(assert (=> d!42917 m!163893))

(declare-fun m!163895 () Bool)

(assert (=> d!42917 m!163895))

(declare-fun m!163897 () Bool)

(assert (=> d!42917 m!163897))

(declare-fun m!163899 () Bool)

(assert (=> d!42917 m!163899))

(declare-fun m!163901 () Bool)

(assert (=> b!137170 m!163901))

(declare-fun m!163903 () Bool)

(assert (=> b!137171 m!163903))

(assert (=> b!136292 d!42917))

(declare-fun d!42919 () Bool)

(assert (=> d!42919 (= (apply!117 lt!71140 lt!71139) (get!1497 (getValueByKey!173 (toList!873 lt!71140) lt!71139)))))

(declare-fun bs!5765 () Bool)

(assert (= bs!5765 d!42919))

(declare-fun m!163905 () Bool)

(assert (=> bs!5765 m!163905))

(assert (=> bs!5765 m!163905))

(declare-fun m!163907 () Bool)

(assert (=> bs!5765 m!163907))

(assert (=> b!136292 d!42919))

(declare-fun d!42921 () Bool)

(assert (=> d!42921 (= (apply!117 lt!71176 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5766 () Bool)

(assert (= bs!5766 d!42921))

(declare-fun m!163909 () Bool)

(assert (=> bs!5766 m!163909))

(assert (=> bs!5766 m!163909))

(declare-fun m!163911 () Bool)

(assert (=> bs!5766 m!163911))

(assert (=> b!136336 d!42921))

(assert (=> bm!15024 d!42785))

(declare-fun d!42923 () Bool)

(assert (=> d!42923 (arrayContainsKey!0 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000)))

(declare-fun lt!71753 () Unit!4275)

(assert (=> d!42923 (= lt!71753 (choose!13 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000))))

(assert (=> d!42923 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!42923 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000) lt!71753)))

(declare-fun bs!5767 () Bool)

(assert (= bs!5767 d!42923))

(assert (=> bs!5767 m!162721))

(declare-fun m!163913 () Bool)

(assert (=> bs!5767 m!163913))

(assert (=> b!136566 d!42923))

(declare-fun d!42925 () Bool)

(declare-fun res!65785 () Bool)

(declare-fun e!89301 () Bool)

(assert (=> d!42925 (=> res!65785 e!89301)))

(assert (=> d!42925 (= res!65785 (= (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) lt!71383))))

(assert (=> d!42925 (= (arrayContainsKey!0 (_keys!4642 newMap!16) lt!71383 #b00000000000000000000000000000000) e!89301)))

(declare-fun b!137172 () Bool)

(declare-fun e!89302 () Bool)

(assert (=> b!137172 (= e!89301 e!89302)))

(declare-fun res!65786 () Bool)

(assert (=> b!137172 (=> (not res!65786) (not e!89302))))

(assert (=> b!137172 (= res!65786 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137173 () Bool)

(assert (=> b!137173 (= e!89302 (arrayContainsKey!0 (_keys!4642 newMap!16) lt!71383 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!42925 (not res!65785)) b!137172))

(assert (= (and b!137172 res!65786) b!137173))

(assert (=> d!42925 m!162327))

(declare-fun m!163915 () Bool)

(assert (=> b!137173 m!163915))

(assert (=> b!136566 d!42925))

(declare-fun b!137174 () Bool)

(declare-fun c!25706 () Bool)

(declare-fun lt!71754 () (_ BitVec 64))

(assert (=> b!137174 (= c!25706 (= lt!71754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!89303 () SeekEntryResult!276)

(declare-fun e!89304 () SeekEntryResult!276)

(assert (=> b!137174 (= e!89303 e!89304)))

(declare-fun b!137175 () Bool)

(declare-fun lt!71755 () SeekEntryResult!276)

(assert (=> b!137175 (= e!89303 (Found!276 (index!3267 lt!71755)))))

(declare-fun b!137176 () Bool)

(assert (=> b!137176 (= e!89304 (MissingZero!276 (index!3267 lt!71755)))))

(declare-fun b!137177 () Bool)

(declare-fun e!89305 () SeekEntryResult!276)

(assert (=> b!137177 (= e!89305 e!89303)))

(assert (=> b!137177 (= lt!71754 (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71755)))))

(declare-fun c!25705 () Bool)

(assert (=> b!137177 (= c!25705 (= lt!71754 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!42927 () Bool)

(declare-fun lt!71756 () SeekEntryResult!276)

(assert (=> d!42927 (and (or ((_ is Undefined!276) lt!71756) (not ((_ is Found!276) lt!71756)) (and (bvsge (index!3266 lt!71756) #b00000000000000000000000000000000) (bvslt (index!3266 lt!71756) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71756) ((_ is Found!276) lt!71756) (not ((_ is MissingZero!276) lt!71756)) (and (bvsge (index!3265 lt!71756) #b00000000000000000000000000000000) (bvslt (index!3265 lt!71756) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71756) ((_ is Found!276) lt!71756) ((_ is MissingZero!276) lt!71756) (not ((_ is MissingVacant!276) lt!71756)) (and (bvsge (index!3268 lt!71756) #b00000000000000000000000000000000) (bvslt (index!3268 lt!71756) (size!2543 (_keys!4642 newMap!16))))) (or ((_ is Undefined!276) lt!71756) (ite ((_ is Found!276) lt!71756) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71756)) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!276) lt!71756) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3265 lt!71756)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!276) lt!71756) (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3268 lt!71756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42927 (= lt!71756 e!89305)))

(declare-fun c!25707 () Bool)

(assert (=> d!42927 (= c!25707 (and ((_ is Intermediate!276) lt!71755) (undefined!1088 lt!71755)))))

(assert (=> d!42927 (= lt!71755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (mask!7203 newMap!16)) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (=> d!42927 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42927 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (_keys!4642 newMap!16) (mask!7203 newMap!16)) lt!71756)))

(declare-fun b!137178 () Bool)

(assert (=> b!137178 (= e!89305 Undefined!276)))

(declare-fun b!137179 () Bool)

(assert (=> b!137179 (= e!89304 (seekKeyOrZeroReturnVacant!0 (x!15804 lt!71755) (index!3267 lt!71755) (index!3267 lt!71755) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(assert (= (and d!42927 c!25707) b!137178))

(assert (= (and d!42927 (not c!25707)) b!137177))

(assert (= (and b!137177 c!25705) b!137175))

(assert (= (and b!137177 (not c!25705)) b!137174))

(assert (= (and b!137174 c!25706) b!137176))

(assert (= (and b!137174 (not c!25706)) b!137179))

(declare-fun m!163917 () Bool)

(assert (=> b!137177 m!163917))

(assert (=> d!42927 m!162327))

(declare-fun m!163919 () Bool)

(assert (=> d!42927 m!163919))

(declare-fun m!163921 () Bool)

(assert (=> d!42927 m!163921))

(declare-fun m!163923 () Bool)

(assert (=> d!42927 m!163923))

(assert (=> d!42927 m!163919))

(assert (=> d!42927 m!162327))

(declare-fun m!163925 () Bool)

(assert (=> d!42927 m!163925))

(assert (=> d!42927 m!162297))

(declare-fun m!163927 () Bool)

(assert (=> d!42927 m!163927))

(assert (=> b!137179 m!162327))

(declare-fun m!163929 () Bool)

(assert (=> b!137179 m!163929))

(assert (=> b!136566 d!42927))

(declare-fun b!137180 () Bool)

(declare-fun e!89317 () ListLongMap!1715)

(declare-fun call!15113 () ListLongMap!1715)

(assert (=> b!137180 (= e!89317 call!15113)))

(declare-fun bm!15109 () Bool)

(declare-fun call!15114 () Bool)

(declare-fun lt!71771 () ListLongMap!1715)

(assert (=> bm!15109 (= call!15114 (contains!905 lt!71771 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137181 () Bool)

(declare-fun e!89308 () Bool)

(declare-fun e!89313 () Bool)

(assert (=> b!137181 (= e!89308 e!89313)))

(declare-fun c!25710 () Bool)

(assert (=> b!137181 (= c!25710 (not (= (bvand lt!71052 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137182 () Bool)

(assert (=> b!137182 (= e!89313 (not call!15114))))

(declare-fun b!137183 () Bool)

(declare-fun c!25711 () Bool)

(assert (=> b!137183 (= c!25711 (and (not (= (bvand lt!71052 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!71052 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89312 () ListLongMap!1715)

(assert (=> b!137183 (= e!89312 e!89317)))

(declare-fun call!15112 () ListLongMap!1715)

(declare-fun call!15117 () ListLongMap!1715)

(declare-fun c!25713 () Bool)

(declare-fun bm!15110 () Bool)

(declare-fun call!15115 () ListLongMap!1715)

(declare-fun c!25708 () Bool)

(declare-fun call!15118 () ListLongMap!1715)

(assert (=> bm!15110 (= call!15115 (+!176 (ite c!25708 call!15118 (ite c!25713 call!15117 call!15112)) (ite (or c!25708 c!25713) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15111 () Bool)

(assert (=> bm!15111 (= call!15113 call!15115)))

(declare-fun bm!15112 () Bool)

(assert (=> bm!15112 (= call!15117 call!15118)))

(declare-fun b!137184 () Bool)

(declare-fun e!89306 () Unit!4275)

(declare-fun lt!71760 () Unit!4275)

(assert (=> b!137184 (= e!89306 lt!71760)))

(declare-fun lt!71777 () ListLongMap!1715)

(assert (=> b!137184 (= lt!71777 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71761 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71770 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71770 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71764 () Unit!4275)

(assert (=> b!137184 (= lt!71764 (addStillContains!93 lt!71777 lt!71761 (zeroValue!2742 newMap!16) lt!71770))))

(assert (=> b!137184 (contains!905 (+!176 lt!71777 (tuple2!2643 lt!71761 (zeroValue!2742 newMap!16))) lt!71770)))

(declare-fun lt!71757 () Unit!4275)

(assert (=> b!137184 (= lt!71757 lt!71764)))

(declare-fun lt!71758 () ListLongMap!1715)

(assert (=> b!137184 (= lt!71758 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71776 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71778 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71778 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71762 () Unit!4275)

(assert (=> b!137184 (= lt!71762 (addApplyDifferent!93 lt!71758 lt!71776 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!71778))))

(assert (=> b!137184 (= (apply!117 (+!176 lt!71758 (tuple2!2643 lt!71776 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71778) (apply!117 lt!71758 lt!71778))))

(declare-fun lt!71772 () Unit!4275)

(assert (=> b!137184 (= lt!71772 lt!71762)))

(declare-fun lt!71768 () ListLongMap!1715)

(assert (=> b!137184 (= lt!71768 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71763 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71767 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71767 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71766 () Unit!4275)

(assert (=> b!137184 (= lt!71766 (addApplyDifferent!93 lt!71768 lt!71763 (zeroValue!2742 newMap!16) lt!71767))))

(assert (=> b!137184 (= (apply!117 (+!176 lt!71768 (tuple2!2643 lt!71763 (zeroValue!2742 newMap!16))) lt!71767) (apply!117 lt!71768 lt!71767))))

(declare-fun lt!71765 () Unit!4275)

(assert (=> b!137184 (= lt!71765 lt!71766)))

(declare-fun lt!71759 () ListLongMap!1715)

(assert (=> b!137184 (= lt!71759 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71773 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71773 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71774 () (_ BitVec 64))

(assert (=> b!137184 (= lt!71774 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!137184 (= lt!71760 (addApplyDifferent!93 lt!71759 lt!71773 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!71774))))

(assert (=> b!137184 (= (apply!117 (+!176 lt!71759 (tuple2!2643 lt!71773 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71774) (apply!117 lt!71759 lt!71774))))

(declare-fun bm!15113 () Bool)

(assert (=> bm!15113 (= call!15118 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!137186 () Bool)

(declare-fun e!89314 () Bool)

(declare-fun e!89311 () Bool)

(assert (=> b!137186 (= e!89314 e!89311)))

(declare-fun res!65795 () Bool)

(assert (=> b!137186 (=> (not res!65795) (not e!89311))))

(assert (=> b!137186 (= res!65795 (contains!905 lt!71771 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!137186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137187 () Bool)

(declare-fun e!89318 () Bool)

(assert (=> b!137187 (= e!89313 e!89318)))

(declare-fun res!65789 () Bool)

(assert (=> b!137187 (= res!65789 call!15114)))

(assert (=> b!137187 (=> (not res!65789) (not e!89318))))

(declare-fun b!137188 () Bool)

(declare-fun res!65790 () Bool)

(assert (=> b!137188 (=> (not res!65790) (not e!89308))))

(declare-fun e!89307 () Bool)

(assert (=> b!137188 (= res!65790 e!89307)))

(declare-fun c!25712 () Bool)

(assert (=> b!137188 (= c!25712 (not (= (bvand lt!71052 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!137189 () Bool)

(declare-fun Unit!4321 () Unit!4275)

(assert (=> b!137189 (= e!89306 Unit!4321)))

(declare-fun b!137190 () Bool)

(declare-fun e!89315 () Bool)

(assert (=> b!137190 (= e!89315 (= (apply!117 lt!71771 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun b!137191 () Bool)

(declare-fun e!89310 () Bool)

(assert (=> b!137191 (= e!89310 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!89316 () ListLongMap!1715)

(declare-fun b!137192 () Bool)

(assert (=> b!137192 (= e!89316 (+!176 call!15115 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!137193 () Bool)

(assert (=> b!137193 (= e!89316 e!89312)))

(assert (=> b!137193 (= c!25713 (and (not (= (bvand lt!71052 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!71052 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137194 () Bool)

(assert (=> b!137194 (= e!89307 e!89315)))

(declare-fun res!65791 () Bool)

(declare-fun call!15116 () Bool)

(assert (=> b!137194 (= res!65791 call!15116)))

(assert (=> b!137194 (=> (not res!65791) (not e!89315))))

(declare-fun b!137195 () Bool)

(declare-fun res!65787 () Bool)

(assert (=> b!137195 (=> (not res!65787) (not e!89308))))

(assert (=> b!137195 (= res!65787 e!89314)))

(declare-fun res!65794 () Bool)

(assert (=> b!137195 (=> res!65794 e!89314)))

(assert (=> b!137195 (= res!65794 (not e!89310))))

(declare-fun res!65792 () Bool)

(assert (=> b!137195 (=> (not res!65792) (not e!89310))))

(assert (=> b!137195 (= res!65792 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137196 () Bool)

(declare-fun e!89309 () Bool)

(assert (=> b!137196 (= e!89309 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15114 () Bool)

(assert (=> bm!15114 (= call!15112 call!15117)))

(declare-fun b!137197 () Bool)

(assert (=> b!137197 (= e!89307 (not call!15116))))

(declare-fun bm!15115 () Bool)

(assert (=> bm!15115 (= call!15116 (contains!905 lt!71771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42929 () Bool)

(assert (=> d!42929 e!89308))

(declare-fun res!65793 () Bool)

(assert (=> d!42929 (=> (not res!65793) (not e!89308))))

(assert (=> d!42929 (= res!65793 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71769 () ListLongMap!1715)

(assert (=> d!42929 (= lt!71771 lt!71769)))

(declare-fun lt!71775 () Unit!4275)

(assert (=> d!42929 (= lt!71775 e!89306)))

(declare-fun c!25709 () Bool)

(assert (=> d!42929 (= c!25709 e!89309)))

(declare-fun res!65788 () Bool)

(assert (=> d!42929 (=> (not res!65788) (not e!89309))))

(assert (=> d!42929 (= res!65788 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42929 (= lt!71769 e!89316)))

(assert (=> d!42929 (= c!25708 (and (not (= (bvand lt!71052 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!71052 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42929 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42929 (= (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71771)))

(declare-fun b!137185 () Bool)

(assert (=> b!137185 (= e!89317 call!15112)))

(declare-fun b!137198 () Bool)

(assert (=> b!137198 (= e!89318 (= (apply!117 lt!71771 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137199 () Bool)

(assert (=> b!137199 (= e!89312 call!15113)))

(declare-fun b!137200 () Bool)

(assert (=> b!137200 (= e!89311 (= (apply!117 lt!71771 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!137200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (_values!2872 newMap!16))))))

(assert (=> b!137200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42929 c!25708) b!137192))

(assert (= (and d!42929 (not c!25708)) b!137193))

(assert (= (and b!137193 c!25713) b!137199))

(assert (= (and b!137193 (not c!25713)) b!137183))

(assert (= (and b!137183 c!25711) b!137180))

(assert (= (and b!137183 (not c!25711)) b!137185))

(assert (= (or b!137180 b!137185) bm!15114))

(assert (= (or b!137199 bm!15114) bm!15112))

(assert (= (or b!137199 b!137180) bm!15111))

(assert (= (or b!137192 bm!15112) bm!15113))

(assert (= (or b!137192 bm!15111) bm!15110))

(assert (= (and d!42929 res!65788) b!137196))

(assert (= (and d!42929 c!25709) b!137184))

(assert (= (and d!42929 (not c!25709)) b!137189))

(assert (= (and d!42929 res!65793) b!137195))

(assert (= (and b!137195 res!65792) b!137191))

(assert (= (and b!137195 (not res!65794)) b!137186))

(assert (= (and b!137186 res!65795) b!137200))

(assert (= (and b!137195 res!65787) b!137188))

(assert (= (and b!137188 c!25712) b!137194))

(assert (= (and b!137188 (not c!25712)) b!137197))

(assert (= (and b!137194 res!65791) b!137190))

(assert (= (or b!137194 b!137197) bm!15115))

(assert (= (and b!137188 res!65790) b!137181))

(assert (= (and b!137181 c!25710) b!137187))

(assert (= (and b!137181 (not c!25710)) b!137182))

(assert (= (and b!137187 res!65789) b!137198))

(assert (= (or b!137187 b!137182) bm!15109))

(declare-fun b_lambda!6125 () Bool)

(assert (=> (not b_lambda!6125) (not b!137200)))

(assert (=> b!137200 t!6219))

(declare-fun b_and!8503 () Bool)

(assert (= b_and!8499 (and (=> t!6219 result!4047) b_and!8503)))

(assert (=> b!137200 t!6221))

(declare-fun b_and!8505 () Bool)

(assert (= b_and!8501 (and (=> t!6221 result!4049) b_and!8505)))

(declare-fun m!163931 () Bool)

(assert (=> b!137192 m!163931))

(declare-fun m!163933 () Bool)

(assert (=> b!137184 m!163933))

(assert (=> b!137184 m!162103))

(declare-fun m!163935 () Bool)

(assert (=> b!137184 m!163935))

(declare-fun m!163937 () Bool)

(assert (=> b!137184 m!163937))

(declare-fun m!163939 () Bool)

(assert (=> b!137184 m!163939))

(declare-fun m!163941 () Bool)

(assert (=> b!137184 m!163941))

(assert (=> b!137184 m!163933))

(declare-fun m!163943 () Bool)

(assert (=> b!137184 m!163943))

(declare-fun m!163945 () Bool)

(assert (=> b!137184 m!163945))

(declare-fun m!163947 () Bool)

(assert (=> b!137184 m!163947))

(assert (=> b!137184 m!163939))

(declare-fun m!163949 () Bool)

(assert (=> b!137184 m!163949))

(declare-fun m!163951 () Bool)

(assert (=> b!137184 m!163951))

(declare-fun m!163953 () Bool)

(assert (=> b!137184 m!163953))

(assert (=> b!137184 m!162327))

(assert (=> b!137184 m!162103))

(declare-fun m!163955 () Bool)

(assert (=> b!137184 m!163955))

(assert (=> b!137184 m!163951))

(assert (=> b!137184 m!162103))

(declare-fun m!163957 () Bool)

(assert (=> b!137184 m!163957))

(declare-fun m!163959 () Bool)

(assert (=> b!137184 m!163959))

(assert (=> b!137184 m!163945))

(declare-fun m!163961 () Bool)

(assert (=> b!137184 m!163961))

(declare-fun m!163963 () Bool)

(assert (=> b!137184 m!163963))

(assert (=> b!137186 m!162327))

(assert (=> b!137186 m!162327))

(declare-fun m!163965 () Bool)

(assert (=> b!137186 m!163965))

(assert (=> b!137191 m!162327))

(assert (=> b!137191 m!162327))

(assert (=> b!137191 m!162341))

(declare-fun m!163967 () Bool)

(assert (=> b!137190 m!163967))

(assert (=> b!137200 m!162419))

(assert (=> b!137200 m!162419))

(assert (=> b!137200 m!162347))

(assert (=> b!137200 m!162421))

(assert (=> b!137200 m!162327))

(assert (=> b!137200 m!162347))

(assert (=> b!137200 m!162327))

(declare-fun m!163969 () Bool)

(assert (=> b!137200 m!163969))

(declare-fun m!163971 () Bool)

(assert (=> bm!15115 m!163971))

(declare-fun m!163973 () Bool)

(assert (=> bm!15110 m!163973))

(declare-fun m!163975 () Bool)

(assert (=> bm!15109 m!163975))

(assert (=> d!42929 m!162297))

(assert (=> bm!15113 m!162103))

(assert (=> bm!15113 m!163957))

(declare-fun m!163977 () Bool)

(assert (=> b!137198 m!163977))

(assert (=> b!137196 m!162327))

(assert (=> b!137196 m!162327))

(assert (=> b!137196 m!162341))

(assert (=> d!42491 d!42929))

(declare-fun d!42931 () Bool)

(declare-fun e!89319 () Bool)

(assert (=> d!42931 e!89319))

(declare-fun res!65797 () Bool)

(assert (=> d!42931 (=> (not res!65797) (not e!89319))))

(declare-fun lt!71781 () ListLongMap!1715)

(assert (=> d!42931 (= res!65797 (contains!905 lt!71781 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71780 () List!1723)

(assert (=> d!42931 (= lt!71781 (ListLongMap!1716 lt!71780))))

(declare-fun lt!71779 () Unit!4275)

(declare-fun lt!71782 () Unit!4275)

(assert (=> d!42931 (= lt!71779 lt!71782)))

(assert (=> d!42931 (= (getValueByKey!173 lt!71780 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42931 (= lt!71782 (lemmaContainsTupThenGetReturnValue!88 lt!71780 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42931 (= lt!71780 (insertStrictlySorted!91 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42931 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71781)))

(declare-fun b!137201 () Bool)

(declare-fun res!65796 () Bool)

(assert (=> b!137201 (=> (not res!65796) (not e!89319))))

(assert (=> b!137201 (= res!65796 (= (getValueByKey!173 (toList!873 lt!71781) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137202 () Bool)

(assert (=> b!137202 (= e!89319 (contains!907 (toList!873 lt!71781) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!42931 res!65797) b!137201))

(assert (= (and b!137201 res!65796) b!137202))

(declare-fun m!163979 () Bool)

(assert (=> d!42931 m!163979))

(declare-fun m!163981 () Bool)

(assert (=> d!42931 m!163981))

(declare-fun m!163983 () Bool)

(assert (=> d!42931 m!163983))

(declare-fun m!163985 () Bool)

(assert (=> d!42931 m!163985))

(declare-fun m!163987 () Bool)

(assert (=> b!137201 m!163987))

(declare-fun m!163989 () Bool)

(assert (=> b!137202 m!163989))

(assert (=> d!42491 d!42931))

(assert (=> d!42491 d!42465))

(declare-fun d!42933 () Bool)

(assert (=> d!42933 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(assert (=> d!42933 true))

(declare-fun _$8!121 () Unit!4275)

(assert (=> d!42933 (= (choose!834 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71052 (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2889 newMap!16)) _$8!121)))

(declare-fun bs!5768 () Bool)

(assert (= bs!5768 d!42933))

(assert (=> bs!5768 m!162189))

(assert (=> bs!5768 m!162189))

(assert (=> bs!5768 m!162563))

(assert (=> bs!5768 m!162103))

(assert (=> bs!5768 m!162561))

(assert (=> d!42491 d!42933))

(assert (=> d!42491 d!42589))

(assert (=> b!136584 d!42651))

(declare-fun b!137203 () Bool)

(declare-fun e!89320 () Option!179)

(assert (=> b!137203 (= e!89320 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71315)))))))

(declare-fun c!25714 () Bool)

(declare-fun d!42935 () Bool)

(assert (=> d!42935 (= c!25714 (and ((_ is Cons!1719) (toList!873 lt!71315)) (= (_1!1332 (h!2325 (toList!873 lt!71315))) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42935 (= (getValueByKey!173 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89320)))

(declare-fun b!137204 () Bool)

(declare-fun e!89321 () Option!179)

(assert (=> b!137204 (= e!89320 e!89321)))

(declare-fun c!25715 () Bool)

(assert (=> b!137204 (= c!25715 (and ((_ is Cons!1719) (toList!873 lt!71315)) (not (= (_1!1332 (h!2325 (toList!873 lt!71315))) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137205 () Bool)

(assert (=> b!137205 (= e!89321 (getValueByKey!173 (t!6211 (toList!873 lt!71315)) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137206 () Bool)

(assert (=> b!137206 (= e!89321 None!177)))

(assert (= (and d!42935 c!25714) b!137203))

(assert (= (and d!42935 (not c!25714)) b!137204))

(assert (= (and b!137204 c!25715) b!137205))

(assert (= (and b!137204 (not c!25715)) b!137206))

(declare-fun m!163991 () Bool)

(assert (=> b!137205 m!163991))

(assert (=> b!136442 d!42935))

(assert (=> b!136411 d!42759))

(declare-fun d!42937 () Bool)

(declare-fun e!89322 () Bool)

(assert (=> d!42937 e!89322))

(declare-fun res!65799 () Bool)

(assert (=> d!42937 (=> (not res!65799) (not e!89322))))

(declare-fun lt!71785 () ListLongMap!1715)

(assert (=> d!42937 (= res!65799 (contains!905 lt!71785 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71784 () List!1723)

(assert (=> d!42937 (= lt!71785 (ListLongMap!1716 lt!71784))))

(declare-fun lt!71783 () Unit!4275)

(declare-fun lt!71786 () Unit!4275)

(assert (=> d!42937 (= lt!71783 lt!71786)))

(assert (=> d!42937 (= (getValueByKey!173 lt!71784 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42937 (= lt!71786 (lemmaContainsTupThenGetReturnValue!88 lt!71784 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42937 (= lt!71784 (insertStrictlySorted!91 (toList!873 (map!1416 newMap!16)) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42937 (= (+!176 (map!1416 newMap!16) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71785)))

(declare-fun b!137207 () Bool)

(declare-fun res!65798 () Bool)

(assert (=> b!137207 (=> (not res!65798) (not e!89322))))

(assert (=> b!137207 (= res!65798 (= (getValueByKey!173 (toList!873 lt!71785) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137208 () Bool)

(assert (=> b!137208 (= e!89322 (contains!907 (toList!873 lt!71785) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!42937 res!65799) b!137207))

(assert (= (and b!137207 res!65798) b!137208))

(declare-fun m!163993 () Bool)

(assert (=> d!42937 m!163993))

(declare-fun m!163995 () Bool)

(assert (=> d!42937 m!163995))

(declare-fun m!163997 () Bool)

(assert (=> d!42937 m!163997))

(declare-fun m!163999 () Bool)

(assert (=> d!42937 m!163999))

(declare-fun m!164001 () Bool)

(assert (=> b!137207 m!164001))

(declare-fun m!164003 () Bool)

(assert (=> b!137208 m!164003))

(assert (=> b!136411 d!42937))

(assert (=> b!136411 d!42437))

(assert (=> b!136596 d!42449))

(declare-fun d!42939 () Bool)

(declare-fun e!89336 () Bool)

(assert (=> d!42939 e!89336))

(declare-fun c!25723 () Bool)

(declare-fun lt!71791 () SeekEntryResult!276)

(assert (=> d!42939 (= c!25723 (and ((_ is Intermediate!276) lt!71791) (undefined!1088 lt!71791)))))

(declare-fun e!89334 () SeekEntryResult!276)

(assert (=> d!42939 (= lt!71791 e!89334)))

(declare-fun c!25722 () Bool)

(assert (=> d!42939 (= c!25722 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!71792 () (_ BitVec 64))

(assert (=> d!42939 (= lt!71792 (select (arr!2273 (_keys!4642 newMap!16)) (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16))))))

(assert (=> d!42939 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)) lt!71791)))

(declare-fun b!137227 () Bool)

(assert (=> b!137227 (= e!89336 (bvsge (x!15804 lt!71791) #b01111111111111111111111111111110))))

(declare-fun b!137228 () Bool)

(assert (=> b!137228 (and (bvsge (index!3267 lt!71791) #b00000000000000000000000000000000) (bvslt (index!3267 lt!71791) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65808 () Bool)

(assert (=> b!137228 (= res!65808 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71791)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!89335 () Bool)

(assert (=> b!137228 (=> res!65808 e!89335)))

(declare-fun e!89337 () Bool)

(assert (=> b!137228 (= e!89337 e!89335)))

(declare-fun e!89333 () SeekEntryResult!276)

(declare-fun b!137229 () Bool)

(assert (=> b!137229 (= e!89333 (Intermediate!276 false (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!137230 () Bool)

(assert (=> b!137230 (and (bvsge (index!3267 lt!71791) #b00000000000000000000000000000000) (bvslt (index!3267 lt!71791) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun res!65807 () Bool)

(assert (=> b!137230 (= res!65807 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137230 (=> res!65807 e!89335)))

(declare-fun b!137231 () Bool)

(assert (=> b!137231 (= e!89334 e!89333)))

(declare-fun c!25724 () Bool)

(assert (=> b!137231 (= c!25724 (or (= lt!71792 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) (= (bvadd lt!71792 lt!71792) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!137232 () Bool)

(assert (=> b!137232 (= e!89336 e!89337)))

(declare-fun res!65806 () Bool)

(assert (=> b!137232 (= res!65806 (and ((_ is Intermediate!276) lt!71791) (not (undefined!1088 lt!71791)) (bvslt (x!15804 lt!71791) #b01111111111111111111111111111110) (bvsge (x!15804 lt!71791) #b00000000000000000000000000000000) (bvsge (x!15804 lt!71791) #b00000000000000000000000000000000)))))

(assert (=> b!137232 (=> (not res!65806) (not e!89337))))

(declare-fun b!137233 () Bool)

(assert (=> b!137233 (and (bvsge (index!3267 lt!71791) #b00000000000000000000000000000000) (bvslt (index!3267 lt!71791) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> b!137233 (= e!89335 (= (select (arr!2273 (_keys!4642 newMap!16)) (index!3267 lt!71791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137234 () Bool)

(assert (=> b!137234 (= e!89333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) #b00000000000000000000000000000000 (mask!7203 newMap!16)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun b!137235 () Bool)

(assert (=> b!137235 (= e!89334 (Intermediate!276 true (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) #b00000000000000000000000000000000))))

(assert (= (and d!42939 c!25722) b!137235))

(assert (= (and d!42939 (not c!25722)) b!137231))

(assert (= (and b!137231 c!25724) b!137229))

(assert (= (and b!137231 (not c!25724)) b!137234))

(assert (= (and d!42939 c!25723) b!137227))

(assert (= (and d!42939 (not c!25723)) b!137232))

(assert (= (and b!137232 res!65806) b!137228))

(assert (= (and b!137228 (not res!65808)) b!137230))

(assert (= (and b!137230 (not res!65807)) b!137233))

(declare-fun m!164005 () Bool)

(assert (=> b!137228 m!164005))

(assert (=> b!137230 m!164005))

(assert (=> b!137233 m!164005))

(assert (=> d!42939 m!162529))

(declare-fun m!164007 () Bool)

(assert (=> d!42939 m!164007))

(assert (=> d!42939 m!162297))

(assert (=> b!137234 m!162529))

(declare-fun m!164009 () Bool)

(assert (=> b!137234 m!164009))

(assert (=> b!137234 m!164009))

(assert (=> b!137234 m!162081))

(declare-fun m!164011 () Bool)

(assert (=> b!137234 m!164011))

(assert (=> d!42483 d!42939))

(declare-fun d!42941 () Bool)

(declare-fun lt!71798 () (_ BitVec 32))

(declare-fun lt!71797 () (_ BitVec 32))

(assert (=> d!42941 (= lt!71798 (bvmul (bvxor lt!71797 (bvlshr lt!71797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!42941 (= lt!71797 ((_ extract 31 0) (bvand (bvxor (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvlshr (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!42941 (and (bvsge (mask!7203 newMap!16) #b00000000000000000000000000000000) (let ((res!65809 (let ((h!2328 ((_ extract 31 0) (bvand (bvxor (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvlshr (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15908 (bvmul (bvxor h!2328 (bvlshr h!2328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15908 (bvlshr x!15908 #b00000000000000000000000000001101)) (mask!7203 newMap!16)))))) (and (bvslt res!65809 (bvadd (mask!7203 newMap!16) #b00000000000000000000000000000001)) (bvsge res!65809 #b00000000000000000000000000000000))))))

(assert (=> d!42941 (= (toIndex!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (mask!7203 newMap!16)) (bvand (bvxor lt!71798 (bvlshr lt!71798 #b00000000000000000000000000001101)) (mask!7203 newMap!16)))))

(assert (=> d!42483 d!42941))

(assert (=> d!42483 d!42589))

(assert (=> b!136334 d!42651))

(declare-fun d!42943 () Bool)

(assert (=> d!42943 (= (get!1497 (getValueByKey!173 (toList!873 lt!71103) lt!71118)) (v!3225 (getValueByKey!173 (toList!873 lt!71103) lt!71118)))))

(assert (=> d!42503 d!42943))

(declare-fun b!137236 () Bool)

(declare-fun e!89338 () Option!179)

(assert (=> b!137236 (= e!89338 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71103)))))))

(declare-fun d!42945 () Bool)

(declare-fun c!25725 () Bool)

(assert (=> d!42945 (= c!25725 (and ((_ is Cons!1719) (toList!873 lt!71103)) (= (_1!1332 (h!2325 (toList!873 lt!71103))) lt!71118)))))

(assert (=> d!42945 (= (getValueByKey!173 (toList!873 lt!71103) lt!71118) e!89338)))

(declare-fun b!137237 () Bool)

(declare-fun e!89339 () Option!179)

(assert (=> b!137237 (= e!89338 e!89339)))

(declare-fun c!25726 () Bool)

(assert (=> b!137237 (= c!25726 (and ((_ is Cons!1719) (toList!873 lt!71103)) (not (= (_1!1332 (h!2325 (toList!873 lt!71103))) lt!71118))))))

(declare-fun b!137238 () Bool)

(assert (=> b!137238 (= e!89339 (getValueByKey!173 (t!6211 (toList!873 lt!71103)) lt!71118))))

(declare-fun b!137239 () Bool)

(assert (=> b!137239 (= e!89339 None!177)))

(assert (= (and d!42945 c!25725) b!137236))

(assert (= (and d!42945 (not c!25725)) b!137237))

(assert (= (and b!137237 c!25726) b!137238))

(assert (= (and b!137237 (not c!25726)) b!137239))

(declare-fun m!164013 () Bool)

(assert (=> b!137238 m!164013))

(assert (=> d!42503 d!42945))

(declare-fun d!42947 () Bool)

(declare-fun res!65810 () Bool)

(declare-fun e!89340 () Bool)

(assert (=> d!42947 (=> res!65810 e!89340)))

(assert (=> d!42947 (= res!65810 (and ((_ is Cons!1719) (t!6211 (toList!873 lt!70951))) (= (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951)))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42947 (= (containsKey!177 (t!6211 (toList!873 lt!70951)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89340)))

(declare-fun b!137240 () Bool)

(declare-fun e!89341 () Bool)

(assert (=> b!137240 (= e!89340 e!89341)))

(declare-fun res!65811 () Bool)

(assert (=> b!137240 (=> (not res!65811) (not e!89341))))

(assert (=> b!137240 (= res!65811 (and (or (not ((_ is Cons!1719) (t!6211 (toList!873 lt!70951)))) (bvsle (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951)))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) ((_ is Cons!1719) (t!6211 (toList!873 lt!70951))) (bvslt (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951)))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(declare-fun b!137241 () Bool)

(assert (=> b!137241 (= e!89341 (containsKey!177 (t!6211 (t!6211 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!42947 (not res!65810)) b!137240))

(assert (= (and b!137240 res!65811) b!137241))

(assert (=> b!137241 m!162081))

(declare-fun m!164015 () Bool)

(assert (=> b!137241 m!164015))

(assert (=> b!136518 d!42947))

(assert (=> bm!15044 d!42681))

(declare-fun d!42949 () Bool)

(assert (=> d!42949 (= (get!1497 (getValueByKey!173 (toList!873 lt!71102) lt!71122)) (v!3225 (getValueByKey!173 (toList!873 lt!71102) lt!71122)))))

(assert (=> d!42513 d!42949))

(declare-fun b!137242 () Bool)

(declare-fun e!89342 () Option!179)

(assert (=> b!137242 (= e!89342 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71102)))))))

(declare-fun d!42951 () Bool)

(declare-fun c!25727 () Bool)

(assert (=> d!42951 (= c!25727 (and ((_ is Cons!1719) (toList!873 lt!71102)) (= (_1!1332 (h!2325 (toList!873 lt!71102))) lt!71122)))))

(assert (=> d!42951 (= (getValueByKey!173 (toList!873 lt!71102) lt!71122) e!89342)))

(declare-fun b!137243 () Bool)

(declare-fun e!89343 () Option!179)

(assert (=> b!137243 (= e!89342 e!89343)))

(declare-fun c!25728 () Bool)

(assert (=> b!137243 (= c!25728 (and ((_ is Cons!1719) (toList!873 lt!71102)) (not (= (_1!1332 (h!2325 (toList!873 lt!71102))) lt!71122))))))

(declare-fun b!137244 () Bool)

(assert (=> b!137244 (= e!89343 (getValueByKey!173 (t!6211 (toList!873 lt!71102)) lt!71122))))

(declare-fun b!137245 () Bool)

(assert (=> b!137245 (= e!89343 None!177)))

(assert (= (and d!42951 c!25727) b!137242))

(assert (= (and d!42951 (not c!25727)) b!137243))

(assert (= (and b!137243 c!25728) b!137244))

(assert (= (and b!137243 (not c!25728)) b!137245))

(declare-fun m!164017 () Bool)

(assert (=> b!137244 m!164017))

(assert (=> d!42513 d!42951))

(declare-fun b!137246 () Bool)

(declare-fun e!89344 () Option!179)

(assert (=> b!137246 (= e!89344 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71393)))))))

(declare-fun d!42953 () Bool)

(declare-fun c!25729 () Bool)

(assert (=> d!42953 (= c!25729 (and ((_ is Cons!1719) (toList!873 lt!71393)) (= (_1!1332 (h!2325 (toList!873 lt!71393))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!42953 (= (getValueByKey!173 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!89344)))

(declare-fun b!137247 () Bool)

(declare-fun e!89345 () Option!179)

(assert (=> b!137247 (= e!89344 e!89345)))

(declare-fun c!25730 () Bool)

(assert (=> b!137247 (= c!25730 (and ((_ is Cons!1719) (toList!873 lt!71393)) (not (= (_1!1332 (h!2325 (toList!873 lt!71393))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!137248 () Bool)

(assert (=> b!137248 (= e!89345 (getValueByKey!173 (t!6211 (toList!873 lt!71393)) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137249 () Bool)

(assert (=> b!137249 (= e!89345 None!177)))

(assert (= (and d!42953 c!25729) b!137246))

(assert (= (and d!42953 (not c!25729)) b!137247))

(assert (= (and b!137247 c!25730) b!137248))

(assert (= (and b!137247 (not c!25730)) b!137249))

(declare-fun m!164019 () Bool)

(assert (=> b!137248 m!164019))

(assert (=> b!136590 d!42953))

(assert (=> b!136299 d!42651))

(declare-fun d!42955 () Bool)

(declare-fun e!89346 () Bool)

(assert (=> d!42955 e!89346))

(declare-fun res!65813 () Bool)

(assert (=> d!42955 (=> (not res!65813) (not e!89346))))

(declare-fun lt!71801 () ListLongMap!1715)

(assert (=> d!42955 (= res!65813 (contains!905 lt!71801 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun lt!71800 () List!1723)

(assert (=> d!42955 (= lt!71801 (ListLongMap!1716 lt!71800))))

(declare-fun lt!71799 () Unit!4275)

(declare-fun lt!71802 () Unit!4275)

(assert (=> d!42955 (= lt!71799 lt!71802)))

(assert (=> d!42955 (= (getValueByKey!173 lt!71800 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42955 (= lt!71802 (lemmaContainsTupThenGetReturnValue!88 lt!71800 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42955 (= lt!71800 (insertStrictlySorted!91 (toList!873 call!15009) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (=> d!42955 (= (+!176 call!15009 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))) lt!71801)))

(declare-fun b!137250 () Bool)

(declare-fun res!65812 () Bool)

(assert (=> b!137250 (=> (not res!65812) (not e!89346))))

(assert (=> b!137250 (= res!65812 (= (getValueByKey!173 (toList!873 lt!71801) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (Some!178 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(declare-fun b!137251 () Bool)

(assert (=> b!137251 (= e!89346 (contains!907 (toList!873 lt!71801) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(assert (= (and d!42955 res!65813) b!137250))

(assert (= (and b!137250 res!65812) b!137251))

(declare-fun m!164021 () Bool)

(assert (=> d!42955 m!164021))

(declare-fun m!164023 () Bool)

(assert (=> d!42955 m!164023))

(declare-fun m!164025 () Bool)

(assert (=> d!42955 m!164025))

(declare-fun m!164027 () Bool)

(assert (=> d!42955 m!164027))

(declare-fun m!164029 () Bool)

(assert (=> b!137250 m!164029))

(declare-fun m!164031 () Bool)

(assert (=> b!137251 m!164031))

(assert (=> b!136330 d!42955))

(declare-fun d!42957 () Bool)

(declare-fun lt!71803 () Bool)

(assert (=> d!42957 (= lt!71803 (select (content!134 (toList!873 lt!71397)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun e!89348 () Bool)

(assert (=> d!42957 (= lt!71803 e!89348)))

(declare-fun res!65815 () Bool)

(assert (=> d!42957 (=> (not res!65815) (not e!89348))))

(assert (=> d!42957 (= res!65815 ((_ is Cons!1719) (toList!873 lt!71397)))))

(assert (=> d!42957 (= (contains!907 (toList!873 lt!71397) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71803)))

(declare-fun b!137252 () Bool)

(declare-fun e!89347 () Bool)

(assert (=> b!137252 (= e!89348 e!89347)))

(declare-fun res!65814 () Bool)

(assert (=> b!137252 (=> res!65814 e!89347)))

(assert (=> b!137252 (= res!65814 (= (h!2325 (toList!873 lt!71397)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137253 () Bool)

(assert (=> b!137253 (= e!89347 (contains!907 (t!6211 (toList!873 lt!71397)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42957 res!65815) b!137252))

(assert (= (and b!137252 (not res!65814)) b!137253))

(declare-fun m!164033 () Bool)

(assert (=> d!42957 m!164033))

(declare-fun m!164035 () Bool)

(assert (=> d!42957 m!164035))

(declare-fun m!164037 () Bool)

(assert (=> b!137253 m!164037))

(assert (=> b!136599 d!42957))

(assert (=> b!136468 d!42453))

(declare-fun d!42959 () Bool)

(declare-fun e!89349 () Bool)

(assert (=> d!42959 e!89349))

(declare-fun res!65817 () Bool)

(assert (=> d!42959 (=> (not res!65817) (not e!89349))))

(declare-fun lt!71806 () ListLongMap!1715)

(assert (=> d!42959 (= res!65817 (contains!905 lt!71806 (_1!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71805 () List!1723)

(assert (=> d!42959 (= lt!71806 (ListLongMap!1716 lt!71805))))

(declare-fun lt!71804 () Unit!4275)

(declare-fun lt!71807 () Unit!4275)

(assert (=> d!42959 (= lt!71804 lt!71807)))

(assert (=> d!42959 (= (getValueByKey!173 lt!71805 (_1!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42959 (= lt!71807 (lemmaContainsTupThenGetReturnValue!88 lt!71805 (_1!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42959 (= lt!71805 (insertStrictlySorted!91 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (_1!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42959 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71806)))

(declare-fun b!137254 () Bool)

(declare-fun res!65816 () Bool)

(assert (=> b!137254 (=> (not res!65816) (not e!89349))))

(assert (=> b!137254 (= res!65816 (= (getValueByKey!173 (toList!873 lt!71806) (_1!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137255 () Bool)

(assert (=> b!137255 (= e!89349 (contains!907 (toList!873 lt!71806) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!42959 res!65817) b!137254))

(assert (= (and b!137254 res!65816) b!137255))

(declare-fun m!164039 () Bool)

(assert (=> d!42959 m!164039))

(declare-fun m!164041 () Bool)

(assert (=> d!42959 m!164041))

(declare-fun m!164043 () Bool)

(assert (=> d!42959 m!164043))

(declare-fun m!164045 () Bool)

(assert (=> d!42959 m!164045))

(declare-fun m!164047 () Bool)

(assert (=> b!137254 m!164047))

(declare-fun m!164049 () Bool)

(assert (=> b!137255 m!164049))

(assert (=> d!42547 d!42959))

(declare-fun b!137256 () Bool)

(declare-fun e!89361 () ListLongMap!1715)

(declare-fun call!15120 () ListLongMap!1715)

(assert (=> b!137256 (= e!89361 call!15120)))

(declare-fun bm!15116 () Bool)

(declare-fun call!15121 () Bool)

(declare-fun lt!71822 () ListLongMap!1715)

(assert (=> bm!15116 (= call!15121 (contains!905 lt!71822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137257 () Bool)

(declare-fun e!89352 () Bool)

(declare-fun e!89357 () Bool)

(assert (=> b!137257 (= e!89352 e!89357)))

(declare-fun c!25733 () Bool)

(assert (=> b!137257 (= c!25733 (not (= (bvand lt!71048 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137258 () Bool)

(assert (=> b!137258 (= e!89357 (not call!15121))))

(declare-fun b!137259 () Bool)

(declare-fun c!25734 () Bool)

(assert (=> b!137259 (= c!25734 (and (not (= (bvand lt!71048 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!71048 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89356 () ListLongMap!1715)

(assert (=> b!137259 (= e!89356 e!89361)))

(declare-fun call!15119 () ListLongMap!1715)

(declare-fun call!15122 () ListLongMap!1715)

(declare-fun c!25736 () Bool)

(declare-fun bm!15117 () Bool)

(declare-fun c!25731 () Bool)

(declare-fun call!15125 () ListLongMap!1715)

(declare-fun call!15124 () ListLongMap!1715)

(assert (=> bm!15117 (= call!15122 (+!176 (ite c!25731 call!15125 (ite c!25736 call!15124 call!15119)) (ite (or c!25731 c!25736) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!15118 () Bool)

(assert (=> bm!15118 (= call!15120 call!15122)))

(declare-fun bm!15119 () Bool)

(assert (=> bm!15119 (= call!15124 call!15125)))

(declare-fun b!137260 () Bool)

(declare-fun e!89350 () Unit!4275)

(declare-fun lt!71811 () Unit!4275)

(assert (=> b!137260 (= e!89350 lt!71811)))

(declare-fun lt!71828 () ListLongMap!1715)

(assert (=> b!137260 (= lt!71828 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71812 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71821 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71821 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71815 () Unit!4275)

(assert (=> b!137260 (= lt!71815 (addStillContains!93 lt!71828 lt!71812 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!71821))))

(assert (=> b!137260 (contains!905 (+!176 lt!71828 (tuple2!2643 lt!71812 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71821)))

(declare-fun lt!71808 () Unit!4275)

(assert (=> b!137260 (= lt!71808 lt!71815)))

(declare-fun lt!71809 () ListLongMap!1715)

(assert (=> b!137260 (= lt!71809 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71827 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71827 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71829 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71829 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71813 () Unit!4275)

(assert (=> b!137260 (= lt!71813 (addApplyDifferent!93 lt!71809 lt!71827 (minValue!2742 newMap!16) lt!71829))))

(assert (=> b!137260 (= (apply!117 (+!176 lt!71809 (tuple2!2643 lt!71827 (minValue!2742 newMap!16))) lt!71829) (apply!117 lt!71809 lt!71829))))

(declare-fun lt!71823 () Unit!4275)

(assert (=> b!137260 (= lt!71823 lt!71813)))

(declare-fun lt!71819 () ListLongMap!1715)

(assert (=> b!137260 (= lt!71819 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71814 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71818 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71818 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71817 () Unit!4275)

(assert (=> b!137260 (= lt!71817 (addApplyDifferent!93 lt!71819 lt!71814 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!71818))))

(assert (=> b!137260 (= (apply!117 (+!176 lt!71819 (tuple2!2643 lt!71814 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71818) (apply!117 lt!71819 lt!71818))))

(declare-fun lt!71816 () Unit!4275)

(assert (=> b!137260 (= lt!71816 lt!71817)))

(declare-fun lt!71810 () ListLongMap!1715)

(assert (=> b!137260 (= lt!71810 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71824 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71825 () (_ BitVec 64))

(assert (=> b!137260 (= lt!71825 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!137260 (= lt!71811 (addApplyDifferent!93 lt!71810 lt!71824 (minValue!2742 newMap!16) lt!71825))))

(assert (=> b!137260 (= (apply!117 (+!176 lt!71810 (tuple2!2643 lt!71824 (minValue!2742 newMap!16))) lt!71825) (apply!117 lt!71810 lt!71825))))

(declare-fun bm!15120 () Bool)

(assert (=> bm!15120 (= call!15125 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!137262 () Bool)

(declare-fun e!89358 () Bool)

(declare-fun e!89355 () Bool)

(assert (=> b!137262 (= e!89358 e!89355)))

(declare-fun res!65826 () Bool)

(assert (=> b!137262 (=> (not res!65826) (not e!89355))))

(assert (=> b!137262 (= res!65826 (contains!905 lt!71822 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!137262 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137263 () Bool)

(declare-fun e!89362 () Bool)

(assert (=> b!137263 (= e!89357 e!89362)))

(declare-fun res!65820 () Bool)

(assert (=> b!137263 (= res!65820 call!15121)))

(assert (=> b!137263 (=> (not res!65820) (not e!89362))))

(declare-fun b!137264 () Bool)

(declare-fun res!65821 () Bool)

(assert (=> b!137264 (=> (not res!65821) (not e!89352))))

(declare-fun e!89351 () Bool)

(assert (=> b!137264 (= res!65821 e!89351)))

(declare-fun c!25735 () Bool)

(assert (=> b!137264 (= c!25735 (not (= (bvand lt!71048 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!137265 () Bool)

(declare-fun Unit!4322 () Unit!4275)

(assert (=> b!137265 (= e!89350 Unit!4322)))

(declare-fun b!137266 () Bool)

(declare-fun e!89359 () Bool)

(assert (=> b!137266 (= e!89359 (= (apply!117 lt!71822 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!137267 () Bool)

(declare-fun e!89354 () Bool)

(assert (=> b!137267 (= e!89354 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!137268 () Bool)

(declare-fun e!89360 () ListLongMap!1715)

(assert (=> b!137268 (= e!89360 (+!176 call!15122 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!137269 () Bool)

(assert (=> b!137269 (= e!89360 e!89356)))

(assert (=> b!137269 (= c!25736 (and (not (= (bvand lt!71048 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!71048 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137270 () Bool)

(assert (=> b!137270 (= e!89351 e!89359)))

(declare-fun res!65822 () Bool)

(declare-fun call!15123 () Bool)

(assert (=> b!137270 (= res!65822 call!15123)))

(assert (=> b!137270 (=> (not res!65822) (not e!89359))))

(declare-fun b!137271 () Bool)

(declare-fun res!65818 () Bool)

(assert (=> b!137271 (=> (not res!65818) (not e!89352))))

(assert (=> b!137271 (= res!65818 e!89358)))

(declare-fun res!65825 () Bool)

(assert (=> b!137271 (=> res!65825 e!89358)))

(assert (=> b!137271 (= res!65825 (not e!89354))))

(declare-fun res!65823 () Bool)

(assert (=> b!137271 (=> (not res!65823) (not e!89354))))

(assert (=> b!137271 (= res!65823 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137272 () Bool)

(declare-fun e!89353 () Bool)

(assert (=> b!137272 (= e!89353 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15121 () Bool)

(assert (=> bm!15121 (= call!15119 call!15124)))

(declare-fun b!137273 () Bool)

(assert (=> b!137273 (= e!89351 (not call!15123))))

(declare-fun bm!15122 () Bool)

(assert (=> bm!15122 (= call!15123 (contains!905 lt!71822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42961 () Bool)

(assert (=> d!42961 e!89352))

(declare-fun res!65824 () Bool)

(assert (=> d!42961 (=> (not res!65824) (not e!89352))))

(assert (=> d!42961 (= res!65824 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71820 () ListLongMap!1715)

(assert (=> d!42961 (= lt!71822 lt!71820)))

(declare-fun lt!71826 () Unit!4275)

(assert (=> d!42961 (= lt!71826 e!89350)))

(declare-fun c!25732 () Bool)

(assert (=> d!42961 (= c!25732 e!89353)))

(declare-fun res!65819 () Bool)

(assert (=> d!42961 (=> (not res!65819) (not e!89353))))

(assert (=> d!42961 (= res!65819 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42961 (= lt!71820 e!89360)))

(assert (=> d!42961 (= c!25731 (and (not (= (bvand lt!71048 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!71048 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42961 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42961 (= (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71822)))

(declare-fun b!137261 () Bool)

(assert (=> b!137261 (= e!89361 call!15119)))

(declare-fun b!137274 () Bool)

(assert (=> b!137274 (= e!89362 (= (apply!117 lt!71822 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!137275 () Bool)

(assert (=> b!137275 (= e!89356 call!15120)))

(declare-fun b!137276 () Bool)

(assert (=> b!137276 (= e!89355 (= (apply!117 lt!71822 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 (_values!2872 newMap!16)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!137276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 (_values!2872 newMap!16))))))

(assert (=> b!137276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42961 c!25731) b!137268))

(assert (= (and d!42961 (not c!25731)) b!137269))

(assert (= (and b!137269 c!25736) b!137275))

(assert (= (and b!137269 (not c!25736)) b!137259))

(assert (= (and b!137259 c!25734) b!137256))

(assert (= (and b!137259 (not c!25734)) b!137261))

(assert (= (or b!137256 b!137261) bm!15121))

(assert (= (or b!137275 bm!15121) bm!15119))

(assert (= (or b!137275 b!137256) bm!15118))

(assert (= (or b!137268 bm!15119) bm!15120))

(assert (= (or b!137268 bm!15118) bm!15117))

(assert (= (and d!42961 res!65819) b!137272))

(assert (= (and d!42961 c!25732) b!137260))

(assert (= (and d!42961 (not c!25732)) b!137265))

(assert (= (and d!42961 res!65824) b!137271))

(assert (= (and b!137271 res!65823) b!137267))

(assert (= (and b!137271 (not res!65825)) b!137262))

(assert (= (and b!137262 res!65826) b!137276))

(assert (= (and b!137271 res!65818) b!137264))

(assert (= (and b!137264 c!25735) b!137270))

(assert (= (and b!137264 (not c!25735)) b!137273))

(assert (= (and b!137270 res!65822) b!137266))

(assert (= (or b!137270 b!137273) bm!15122))

(assert (= (and b!137264 res!65821) b!137257))

(assert (= (and b!137257 c!25733) b!137263))

(assert (= (and b!137257 (not c!25733)) b!137258))

(assert (= (and b!137263 res!65820) b!137274))

(assert (= (or b!137263 b!137258) bm!15116))

(declare-fun b_lambda!6127 () Bool)

(assert (=> (not b_lambda!6127) (not b!137276)))

(assert (=> b!137276 t!6219))

(declare-fun b_and!8507 () Bool)

(assert (= b_and!8503 (and (=> t!6219 result!4047) b_and!8507)))

(assert (=> b!137276 t!6221))

(declare-fun b_and!8509 () Bool)

(assert (= b_and!8505 (and (=> t!6221 result!4049) b_and!8509)))

(declare-fun m!164051 () Bool)

(assert (=> b!137268 m!164051))

(declare-fun m!164053 () Bool)

(assert (=> b!137260 m!164053))

(declare-fun m!164055 () Bool)

(assert (=> b!137260 m!164055))

(assert (=> b!137260 m!162103))

(declare-fun m!164057 () Bool)

(assert (=> b!137260 m!164057))

(declare-fun m!164059 () Bool)

(assert (=> b!137260 m!164059))

(declare-fun m!164061 () Bool)

(assert (=> b!137260 m!164061))

(assert (=> b!137260 m!164053))

(declare-fun m!164063 () Bool)

(assert (=> b!137260 m!164063))

(declare-fun m!164065 () Bool)

(assert (=> b!137260 m!164065))

(declare-fun m!164067 () Bool)

(assert (=> b!137260 m!164067))

(assert (=> b!137260 m!164059))

(declare-fun m!164069 () Bool)

(assert (=> b!137260 m!164069))

(declare-fun m!164071 () Bool)

(assert (=> b!137260 m!164071))

(declare-fun m!164073 () Bool)

(assert (=> b!137260 m!164073))

(assert (=> b!137260 m!162327))

(declare-fun m!164075 () Bool)

(assert (=> b!137260 m!164075))

(assert (=> b!137260 m!164071))

(assert (=> b!137260 m!162103))

(declare-fun m!164077 () Bool)

(assert (=> b!137260 m!164077))

(declare-fun m!164079 () Bool)

(assert (=> b!137260 m!164079))

(assert (=> b!137260 m!164065))

(assert (=> b!137260 m!162103))

(declare-fun m!164081 () Bool)

(assert (=> b!137260 m!164081))

(declare-fun m!164083 () Bool)

(assert (=> b!137260 m!164083))

(assert (=> b!137262 m!162327))

(assert (=> b!137262 m!162327))

(declare-fun m!164085 () Bool)

(assert (=> b!137262 m!164085))

(assert (=> b!137267 m!162327))

(assert (=> b!137267 m!162327))

(assert (=> b!137267 m!162341))

(declare-fun m!164087 () Bool)

(assert (=> b!137266 m!164087))

(assert (=> b!137276 m!162419))

(assert (=> b!137276 m!162419))

(assert (=> b!137276 m!162347))

(assert (=> b!137276 m!162421))

(assert (=> b!137276 m!162327))

(assert (=> b!137276 m!162347))

(assert (=> b!137276 m!162327))

(declare-fun m!164089 () Bool)

(assert (=> b!137276 m!164089))

(declare-fun m!164091 () Bool)

(assert (=> bm!15122 m!164091))

(declare-fun m!164093 () Bool)

(assert (=> bm!15117 m!164093))

(declare-fun m!164095 () Bool)

(assert (=> bm!15116 m!164095))

(assert (=> d!42961 m!162297))

(assert (=> bm!15120 m!162103))

(assert (=> bm!15120 m!164077))

(declare-fun m!164097 () Bool)

(assert (=> b!137274 m!164097))

(assert (=> b!137272 m!162327))

(assert (=> b!137272 m!162327))

(assert (=> b!137272 m!162341))

(assert (=> d!42547 d!42961))

(declare-fun d!42963 () Bool)

(assert (=> d!42963 (= (+!176 (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!549 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) lt!71048 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(assert (=> d!42963 true))

(declare-fun _$7!119 () Unit!4275)

(assert (=> d!42963 (= (choose!838 (_keys!4642 newMap!16) (_values!2872 newMap!16) (mask!7203 newMap!16) (extraKeys!2650 newMap!16) lt!71048 (zeroValue!2742 newMap!16) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2742 newMap!16) (defaultEntry!2889 newMap!16)) _$7!119)))

(declare-fun bs!5769 () Bool)

(assert (= bs!5769 d!42963))

(assert (=> bs!5769 m!162189))

(assert (=> bs!5769 m!162189))

(assert (=> bs!5769 m!162731))

(assert (=> bs!5769 m!162103))

(assert (=> bs!5769 m!162729))

(assert (=> d!42547 d!42963))

(assert (=> d!42547 d!42465))

(assert (=> d!42547 d!42589))

(declare-fun d!42965 () Bool)

(declare-fun e!89363 () Bool)

(assert (=> d!42965 e!89363))

(declare-fun res!65827 () Bool)

(assert (=> d!42965 (=> res!65827 e!89363)))

(declare-fun lt!71832 () Bool)

(assert (=> d!42965 (= res!65827 (not lt!71832))))

(declare-fun lt!71830 () Bool)

(assert (=> d!42965 (= lt!71832 lt!71830)))

(declare-fun lt!71833 () Unit!4275)

(declare-fun e!89364 () Unit!4275)

(assert (=> d!42965 (= lt!71833 e!89364)))

(declare-fun c!25737 () Bool)

(assert (=> d!42965 (= c!25737 lt!71830)))

(assert (=> d!42965 (= lt!71830 (containsKey!177 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))

(assert (=> d!42965 (= (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))) lt!71832)))

(declare-fun b!137277 () Bool)

(declare-fun lt!71831 () Unit!4275)

(assert (=> b!137277 (= e!89364 lt!71831)))

(assert (=> b!137277 (= lt!71831 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))

(assert (=> b!137277 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036))))))

(declare-fun b!137278 () Bool)

(declare-fun Unit!4323 () Unit!4275)

(assert (=> b!137278 (= e!89364 Unit!4323)))

(declare-fun b!137279 () Bool)

(assert (=> b!137279 (= e!89363 (isDefined!126 (getValueByKey!173 (toList!873 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16))) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))))

(assert (= (and d!42965 c!25737) b!137277))

(assert (= (and d!42965 (not c!25737)) b!137278))

(assert (= (and d!42965 (not res!65827)) b!137279))

(assert (=> d!42965 m!162185))

(declare-fun m!164099 () Bool)

(assert (=> d!42965 m!164099))

(assert (=> b!137277 m!162185))

(declare-fun m!164101 () Bool)

(assert (=> b!137277 m!164101))

(assert (=> b!137277 m!162185))

(declare-fun m!164103 () Bool)

(assert (=> b!137277 m!164103))

(assert (=> b!137277 m!164103))

(declare-fun m!164105 () Bool)

(assert (=> b!137277 m!164105))

(assert (=> b!137279 m!162185))

(assert (=> b!137279 m!164103))

(assert (=> b!137279 m!164103))

(assert (=> b!137279 m!164105))

(assert (=> b!136287 d!42965))

(declare-fun b!137280 () Bool)

(declare-fun e!89376 () ListLongMap!1715)

(declare-fun call!15127 () ListLongMap!1715)

(assert (=> b!137280 (= e!89376 call!15127)))

(declare-fun bm!15123 () Bool)

(declare-fun call!15128 () Bool)

(declare-fun lt!71848 () ListLongMap!1715)

(assert (=> bm!15123 (= call!15128 (contains!905 lt!71848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137281 () Bool)

(declare-fun e!89367 () Bool)

(declare-fun e!89372 () Bool)

(assert (=> b!137281 (= e!89367 e!89372)))

(declare-fun c!25740 () Bool)

(assert (=> b!137281 (= c!25740 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137282 () Bool)

(assert (=> b!137282 (= e!89372 (not call!15128))))

(declare-fun b!137283 () Bool)

(declare-fun c!25741 () Bool)

(assert (=> b!137283 (= c!25741 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!89371 () ListLongMap!1715)

(assert (=> b!137283 (= e!89371 e!89376)))

(declare-fun call!15129 () ListLongMap!1715)

(declare-fun c!25743 () Bool)

(declare-fun c!25738 () Bool)

(declare-fun call!15132 () ListLongMap!1715)

(declare-fun call!15131 () ListLongMap!1715)

(declare-fun call!15126 () ListLongMap!1715)

(declare-fun bm!15124 () Bool)

(assert (=> bm!15124 (= call!15129 (+!176 (ite c!25738 call!15132 (ite c!25743 call!15131 call!15126)) (ite (or c!25738 c!25743) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(declare-fun bm!15125 () Bool)

(assert (=> bm!15125 (= call!15127 call!15129)))

(declare-fun bm!15126 () Bool)

(assert (=> bm!15126 (= call!15131 call!15132)))

(declare-fun b!137284 () Bool)

(declare-fun e!89365 () Unit!4275)

(declare-fun lt!71837 () Unit!4275)

(assert (=> b!137284 (= e!89365 lt!71837)))

(declare-fun lt!71854 () ListLongMap!1715)

(assert (=> b!137284 (= lt!71854 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71838 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71847 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71847 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71841 () Unit!4275)

(assert (=> b!137284 (= lt!71841 (addStillContains!93 lt!71854 lt!71838 (zeroValue!2742 newMap!16) lt!71847))))

(assert (=> b!137284 (contains!905 (+!176 lt!71854 (tuple2!2643 lt!71838 (zeroValue!2742 newMap!16))) lt!71847)))

(declare-fun lt!71834 () Unit!4275)

(assert (=> b!137284 (= lt!71834 lt!71841)))

(declare-fun lt!71835 () ListLongMap!1715)

(assert (=> b!137284 (= lt!71835 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71853 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71853 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71855 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71855 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71839 () Unit!4275)

(assert (=> b!137284 (= lt!71839 (addApplyDifferent!93 lt!71835 lt!71853 (minValue!2742 newMap!16) lt!71855))))

(assert (=> b!137284 (= (apply!117 (+!176 lt!71835 (tuple2!2643 lt!71853 (minValue!2742 newMap!16))) lt!71855) (apply!117 lt!71835 lt!71855))))

(declare-fun lt!71849 () Unit!4275)

(assert (=> b!137284 (= lt!71849 lt!71839)))

(declare-fun lt!71845 () ListLongMap!1715)

(assert (=> b!137284 (= lt!71845 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71840 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71844 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71844 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!71843 () Unit!4275)

(assert (=> b!137284 (= lt!71843 (addApplyDifferent!93 lt!71845 lt!71840 (zeroValue!2742 newMap!16) lt!71844))))

(assert (=> b!137284 (= (apply!117 (+!176 lt!71845 (tuple2!2643 lt!71840 (zeroValue!2742 newMap!16))) lt!71844) (apply!117 lt!71845 lt!71844))))

(declare-fun lt!71842 () Unit!4275)

(assert (=> b!137284 (= lt!71842 lt!71843)))

(declare-fun lt!71836 () ListLongMap!1715)

(assert (=> b!137284 (= lt!71836 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun lt!71850 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71850 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71851 () (_ BitVec 64))

(assert (=> b!137284 (= lt!71851 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!137284 (= lt!71837 (addApplyDifferent!93 lt!71836 lt!71850 (minValue!2742 newMap!16) lt!71851))))

(assert (=> b!137284 (= (apply!117 (+!176 lt!71836 (tuple2!2643 lt!71850 (minValue!2742 newMap!16))) lt!71851) (apply!117 lt!71836 lt!71851))))

(declare-fun bm!15127 () Bool)

(assert (=> bm!15127 (= call!15132 (getCurrentListMapNoExtraKeys!142 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)))))

(declare-fun b!137286 () Bool)

(declare-fun e!89373 () Bool)

(declare-fun e!89370 () Bool)

(assert (=> b!137286 (= e!89373 e!89370)))

(declare-fun res!65836 () Bool)

(assert (=> b!137286 (=> (not res!65836) (not e!89370))))

(assert (=> b!137286 (= res!65836 (contains!905 lt!71848 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!137286 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137287 () Bool)

(declare-fun e!89377 () Bool)

(assert (=> b!137287 (= e!89372 e!89377)))

(declare-fun res!65830 () Bool)

(assert (=> b!137287 (= res!65830 call!15128)))

(assert (=> b!137287 (=> (not res!65830) (not e!89377))))

(declare-fun b!137288 () Bool)

(declare-fun res!65831 () Bool)

(assert (=> b!137288 (=> (not res!65831) (not e!89367))))

(declare-fun e!89366 () Bool)

(assert (=> b!137288 (= res!65831 e!89366)))

(declare-fun c!25742 () Bool)

(assert (=> b!137288 (= c!25742 (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!137289 () Bool)

(declare-fun Unit!4324 () Unit!4275)

(assert (=> b!137289 (= e!89365 Unit!4324)))

(declare-fun b!137290 () Bool)

(declare-fun e!89374 () Bool)

(assert (=> b!137290 (= e!89374 (= (apply!117 lt!71848 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2742 newMap!16)))))

(declare-fun b!137291 () Bool)

(declare-fun e!89369 () Bool)

(assert (=> b!137291 (= e!89369 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!137292 () Bool)

(declare-fun e!89375 () ListLongMap!1715)

(assert (=> b!137292 (= e!89375 (+!176 call!15129 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))

(declare-fun b!137293 () Bool)

(assert (=> b!137293 (= e!89375 e!89371)))

(assert (=> b!137293 (= c!25743 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!137294 () Bool)

(assert (=> b!137294 (= e!89366 e!89374)))

(declare-fun res!65832 () Bool)

(declare-fun call!15130 () Bool)

(assert (=> b!137294 (= res!65832 call!15130)))

(assert (=> b!137294 (=> (not res!65832) (not e!89374))))

(declare-fun b!137295 () Bool)

(declare-fun res!65828 () Bool)

(assert (=> b!137295 (=> (not res!65828) (not e!89367))))

(assert (=> b!137295 (= res!65828 e!89373)))

(declare-fun res!65835 () Bool)

(assert (=> b!137295 (=> res!65835 e!89373)))

(assert (=> b!137295 (= res!65835 (not e!89369))))

(declare-fun res!65833 () Bool)

(assert (=> b!137295 (=> (not res!65833) (not e!89369))))

(assert (=> b!137295 (= res!65833 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137296 () Bool)

(declare-fun e!89368 () Bool)

(assert (=> b!137296 (= e!89368 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15128 () Bool)

(assert (=> bm!15128 (= call!15126 call!15131)))

(declare-fun b!137297 () Bool)

(assert (=> b!137297 (= e!89366 (not call!15130))))

(declare-fun bm!15129 () Bool)

(assert (=> bm!15129 (= call!15130 (contains!905 lt!71848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!42967 () Bool)

(assert (=> d!42967 e!89367))

(declare-fun res!65834 () Bool)

(assert (=> d!42967 (=> (not res!65834) (not e!89367))))

(assert (=> d!42967 (= res!65834 (or (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))))

(declare-fun lt!71846 () ListLongMap!1715)

(assert (=> d!42967 (= lt!71848 lt!71846)))

(declare-fun lt!71852 () Unit!4275)

(assert (=> d!42967 (= lt!71852 e!89365)))

(declare-fun c!25739 () Bool)

(assert (=> d!42967 (= c!25739 e!89368)))

(declare-fun res!65829 () Bool)

(assert (=> d!42967 (=> (not res!65829) (not e!89368))))

(assert (=> d!42967 (= res!65829 (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!42967 (= lt!71846 e!89375)))

(assert (=> d!42967 (= c!25738 (and (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2650 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!42967 (validMask!0 (mask!7203 newMap!16))))

(assert (=> d!42967 (= (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) lt!71848)))

(declare-fun b!137285 () Bool)

(assert (=> b!137285 (= e!89376 call!15126)))

(declare-fun b!137298 () Bool)

(assert (=> b!137298 (= e!89377 (= (apply!117 lt!71848 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2742 newMap!16)))))

(declare-fun b!137299 () Bool)

(assert (=> b!137299 (= e!89371 call!15127)))

(declare-fun b!137300 () Bool)

(assert (=> b!137300 (= e!89370 (= (apply!117 lt!71848 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1493 (select (arr!2274 lt!71040) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!137300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2544 lt!71040)))))

(assert (=> b!137300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2543 (_keys!4642 newMap!16))))))

(assert (= (and d!42967 c!25738) b!137292))

(assert (= (and d!42967 (not c!25738)) b!137293))

(assert (= (and b!137293 c!25743) b!137299))

(assert (= (and b!137293 (not c!25743)) b!137283))

(assert (= (and b!137283 c!25741) b!137280))

(assert (= (and b!137283 (not c!25741)) b!137285))

(assert (= (or b!137280 b!137285) bm!15128))

(assert (= (or b!137299 bm!15128) bm!15126))

(assert (= (or b!137299 b!137280) bm!15125))

(assert (= (or b!137292 bm!15126) bm!15127))

(assert (= (or b!137292 bm!15125) bm!15124))

(assert (= (and d!42967 res!65829) b!137296))

(assert (= (and d!42967 c!25739) b!137284))

(assert (= (and d!42967 (not c!25739)) b!137289))

(assert (= (and d!42967 res!65834) b!137295))

(assert (= (and b!137295 res!65833) b!137291))

(assert (= (and b!137295 (not res!65835)) b!137286))

(assert (= (and b!137286 res!65836) b!137300))

(assert (= (and b!137295 res!65828) b!137288))

(assert (= (and b!137288 c!25742) b!137294))

(assert (= (and b!137288 (not c!25742)) b!137297))

(assert (= (and b!137294 res!65832) b!137290))

(assert (= (or b!137294 b!137297) bm!15129))

(assert (= (and b!137288 res!65831) b!137281))

(assert (= (and b!137281 c!25740) b!137287))

(assert (= (and b!137281 (not c!25740)) b!137282))

(assert (= (and b!137287 res!65830) b!137298))

(assert (= (or b!137287 b!137282) bm!15123))

(declare-fun b_lambda!6129 () Bool)

(assert (=> (not b_lambda!6129) (not b!137300)))

(assert (=> b!137300 t!6219))

(declare-fun b_and!8511 () Bool)

(assert (= b_and!8507 (and (=> t!6219 result!4047) b_and!8511)))

(assert (=> b!137300 t!6221))

(declare-fun b_and!8513 () Bool)

(assert (= b_and!8509 (and (=> t!6221 result!4049) b_and!8513)))

(declare-fun m!164107 () Bool)

(assert (=> b!137292 m!164107))

(declare-fun m!164109 () Bool)

(assert (=> b!137284 m!164109))

(declare-fun m!164111 () Bool)

(assert (=> b!137284 m!164111))

(declare-fun m!164113 () Bool)

(assert (=> b!137284 m!164113))

(declare-fun m!164115 () Bool)

(assert (=> b!137284 m!164115))

(declare-fun m!164117 () Bool)

(assert (=> b!137284 m!164117))

(assert (=> b!137284 m!164109))

(declare-fun m!164119 () Bool)

(assert (=> b!137284 m!164119))

(declare-fun m!164121 () Bool)

(assert (=> b!137284 m!164121))

(declare-fun m!164123 () Bool)

(assert (=> b!137284 m!164123))

(assert (=> b!137284 m!164115))

(declare-fun m!164125 () Bool)

(assert (=> b!137284 m!164125))

(declare-fun m!164127 () Bool)

(assert (=> b!137284 m!164127))

(declare-fun m!164129 () Bool)

(assert (=> b!137284 m!164129))

(assert (=> b!137284 m!162327))

(declare-fun m!164131 () Bool)

(assert (=> b!137284 m!164131))

(assert (=> b!137284 m!164127))

(declare-fun m!164133 () Bool)

(assert (=> b!137284 m!164133))

(declare-fun m!164135 () Bool)

(assert (=> b!137284 m!164135))

(assert (=> b!137284 m!164121))

(declare-fun m!164137 () Bool)

(assert (=> b!137284 m!164137))

(declare-fun m!164139 () Bool)

(assert (=> b!137284 m!164139))

(assert (=> b!137286 m!162327))

(assert (=> b!137286 m!162327))

(declare-fun m!164141 () Bool)

(assert (=> b!137286 m!164141))

(assert (=> b!137291 m!162327))

(assert (=> b!137291 m!162327))

(assert (=> b!137291 m!162341))

(declare-fun m!164143 () Bool)

(assert (=> b!137290 m!164143))

(declare-fun m!164145 () Bool)

(assert (=> b!137300 m!164145))

(assert (=> b!137300 m!164145))

(assert (=> b!137300 m!162347))

(declare-fun m!164147 () Bool)

(assert (=> b!137300 m!164147))

(assert (=> b!137300 m!162327))

(assert (=> b!137300 m!162347))

(assert (=> b!137300 m!162327))

(declare-fun m!164149 () Bool)

(assert (=> b!137300 m!164149))

(declare-fun m!164151 () Bool)

(assert (=> bm!15129 m!164151))

(declare-fun m!164153 () Bool)

(assert (=> bm!15124 m!164153))

(declare-fun m!164155 () Bool)

(assert (=> bm!15123 m!164155))

(assert (=> d!42967 m!162297))

(assert (=> bm!15127 m!164133))

(declare-fun m!164157 () Bool)

(assert (=> b!137298 m!164157))

(assert (=> b!137296 m!162327))

(assert (=> b!137296 m!162327))

(assert (=> b!137296 m!162341))

(assert (=> b!136287 d!42967))

(declare-fun d!42969 () Bool)

(assert (=> d!42969 (= (apply!117 lt!71413 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) (get!1497 (getValueByKey!173 (toList!873 lt!71413) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5770 () Bool)

(assert (= bs!5770 d!42969))

(assert (=> bs!5770 m!162327))

(declare-fun m!164159 () Bool)

(assert (=> bs!5770 m!164159))

(assert (=> bs!5770 m!164159))

(declare-fun m!164161 () Bool)

(assert (=> bs!5770 m!164161))

(assert (=> b!136620 d!42969))

(declare-fun d!42971 () Bool)

(declare-fun c!25744 () Bool)

(assert (=> d!42971 (= c!25744 ((_ is ValueCellFull!1101) (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000)))))

(declare-fun e!89378 () V!3499)

(assert (=> d!42971 (= (get!1493 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!89378)))

(declare-fun b!137301 () Bool)

(assert (=> b!137301 (= e!89378 (get!1495 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!137302 () Bool)

(assert (=> b!137302 (= e!89378 (get!1496 (select (arr!2274 (ite (or c!25441 c!25435) (_values!2872 newMap!16) lt!71040)) #b00000000000000000000000000000000) (dynLambda!429 (defaultEntry!2889 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!42971 c!25744) b!137301))

(assert (= (and d!42971 (not c!25744)) b!137302))

(assert (=> b!137301 m!162817))

(assert (=> b!137301 m!162347))

(declare-fun m!164163 () Bool)

(assert (=> b!137301 m!164163))

(assert (=> b!137302 m!162817))

(assert (=> b!137302 m!162347))

(declare-fun m!164165 () Bool)

(assert (=> b!137302 m!164165))

(assert (=> b!136620 d!42971))

(declare-fun b!137303 () Bool)

(declare-fun e!89379 () Option!179)

(assert (=> b!137303 (= e!89379 (Some!178 (_2!1332 (h!2325 (toList!873 lt!71344)))))))

(declare-fun d!42973 () Bool)

(declare-fun c!25745 () Bool)

(assert (=> d!42973 (= c!25745 (and ((_ is Cons!1719) (toList!873 lt!71344)) (= (_1!1332 (h!2325 (toList!873 lt!71344))) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42973 (= (getValueByKey!173 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89379)))

(declare-fun b!137304 () Bool)

(declare-fun e!89380 () Option!179)

(assert (=> b!137304 (= e!89379 e!89380)))

(declare-fun c!25746 () Bool)

(assert (=> b!137304 (= c!25746 (and ((_ is Cons!1719) (toList!873 lt!71344)) (not (= (_1!1332 (h!2325 (toList!873 lt!71344))) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137305 () Bool)

(assert (=> b!137305 (= e!89380 (getValueByKey!173 (t!6211 (toList!873 lt!71344)) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137306 () Bool)

(assert (=> b!137306 (= e!89380 None!177)))

(assert (= (and d!42973 c!25745) b!137303))

(assert (= (and d!42973 (not c!25745)) b!137304))

(assert (= (and b!137304 c!25746) b!137305))

(assert (= (and b!137304 (not c!25746)) b!137306))

(declare-fun m!164167 () Bool)

(assert (=> b!137305 m!164167))

(assert (=> b!136482 d!42973))

(assert (=> b!136527 d!42651))

(declare-fun d!42975 () Bool)

(declare-fun res!65837 () Bool)

(declare-fun e!89381 () Bool)

(assert (=> d!42975 (=> res!65837 e!89381)))

(assert (=> d!42975 (= res!65837 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71114)))))

(assert (=> d!42975 (= (containsKey!177 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114) e!89381)))

(declare-fun b!137307 () Bool)

(declare-fun e!89382 () Bool)

(assert (=> b!137307 (= e!89381 e!89382)))

(declare-fun res!65838 () Bool)

(assert (=> b!137307 (=> (not res!65838) (not e!89382))))

(assert (=> b!137307 (= res!65838 (and (or (not ((_ is Cons!1719) (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) (bvsle (_1!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71114)) ((_ is Cons!1719) (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (bvslt (_1!1332 (h!2325 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71114)))))

(declare-fun b!137308 () Bool)

(assert (=> b!137308 (= e!89382 (containsKey!177 (t!6211 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71114))))

(assert (= (and d!42975 (not res!65837)) b!137307))

(assert (= (and b!137307 res!65838) b!137308))

(declare-fun m!164169 () Bool)

(assert (=> b!137308 m!164169))

(assert (=> d!42497 d!42975))

(declare-fun d!42977 () Bool)

(declare-fun e!89383 () Bool)

(assert (=> d!42977 e!89383))

(declare-fun res!65839 () Bool)

(assert (=> d!42977 (=> res!65839 e!89383)))

(declare-fun lt!71858 () Bool)

(assert (=> d!42977 (= res!65839 (not lt!71858))))

(declare-fun lt!71856 () Bool)

(assert (=> d!42977 (= lt!71858 lt!71856)))

(declare-fun lt!71859 () Unit!4275)

(declare-fun e!89384 () Unit!4275)

(assert (=> d!42977 (= lt!71859 e!89384)))

(declare-fun c!25747 () Bool)

(assert (=> d!42977 (= c!25747 lt!71856)))

(assert (=> d!42977 (= lt!71856 (containsKey!177 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!42977 (= (contains!905 lt!71315 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71858)))

(declare-fun b!137309 () Bool)

(declare-fun lt!71857 () Unit!4275)

(assert (=> b!137309 (= e!89384 lt!71857)))

(assert (=> b!137309 (= lt!71857 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> b!137309 (isDefined!126 (getValueByKey!173 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137310 () Bool)

(declare-fun Unit!4325 () Unit!4275)

(assert (=> b!137310 (= e!89384 Unit!4325)))

(declare-fun b!137311 () Bool)

(assert (=> b!137311 (= e!89383 (isDefined!126 (getValueByKey!173 (toList!873 lt!71315) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42977 c!25747) b!137309))

(assert (= (and d!42977 (not c!25747)) b!137310))

(assert (= (and d!42977 (not res!65839)) b!137311))

(declare-fun m!164171 () Bool)

(assert (=> d!42977 m!164171))

(declare-fun m!164173 () Bool)

(assert (=> b!137309 m!164173))

(assert (=> b!137309 m!162585))

(assert (=> b!137309 m!162585))

(declare-fun m!164175 () Bool)

(assert (=> b!137309 m!164175))

(assert (=> b!137311 m!162585))

(assert (=> b!137311 m!162585))

(assert (=> b!137311 m!164175))

(assert (=> d!42499 d!42977))

(declare-fun b!137312 () Bool)

(declare-fun e!89385 () Option!179)

(assert (=> b!137312 (= e!89385 (Some!178 (_2!1332 (h!2325 lt!71314))))))

(declare-fun c!25748 () Bool)

(declare-fun d!42979 () Bool)

(assert (=> d!42979 (= c!25748 (and ((_ is Cons!1719) lt!71314) (= (_1!1332 (h!2325 lt!71314)) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42979 (= (getValueByKey!173 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89385)))

(declare-fun b!137313 () Bool)

(declare-fun e!89386 () Option!179)

(assert (=> b!137313 (= e!89385 e!89386)))

(declare-fun c!25749 () Bool)

(assert (=> b!137313 (= c!25749 (and ((_ is Cons!1719) lt!71314) (not (= (_1!1332 (h!2325 lt!71314)) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137314 () Bool)

(assert (=> b!137314 (= e!89386 (getValueByKey!173 (t!6211 lt!71314) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137315 () Bool)

(assert (=> b!137315 (= e!89386 None!177)))

(assert (= (and d!42979 c!25748) b!137312))

(assert (= (and d!42979 (not c!25748)) b!137313))

(assert (= (and b!137313 c!25749) b!137314))

(assert (= (and b!137313 (not c!25749)) b!137315))

(declare-fun m!164177 () Bool)

(assert (=> b!137314 m!164177))

(assert (=> d!42499 d!42979))

(declare-fun d!42981 () Bool)

(assert (=> d!42981 (= (getValueByKey!173 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71860 () Unit!4275)

(assert (=> d!42981 (= lt!71860 (choose!841 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89387 () Bool)

(assert (=> d!42981 e!89387))

(declare-fun res!65840 () Bool)

(assert (=> d!42981 (=> (not res!65840) (not e!89387))))

(assert (=> d!42981 (= res!65840 (isStrictlySorted!323 lt!71314))))

(assert (=> d!42981 (= (lemmaContainsTupThenGetReturnValue!88 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71860)))

(declare-fun b!137316 () Bool)

(declare-fun res!65841 () Bool)

(assert (=> b!137316 (=> (not res!65841) (not e!89387))))

(assert (=> b!137316 (= res!65841 (containsKey!177 lt!71314 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137317 () Bool)

(assert (=> b!137317 (= e!89387 (contains!907 lt!71314 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!42981 res!65840) b!137316))

(assert (= (and b!137316 res!65841) b!137317))

(assert (=> d!42981 m!162579))

(declare-fun m!164179 () Bool)

(assert (=> d!42981 m!164179))

(declare-fun m!164181 () Bool)

(assert (=> d!42981 m!164181))

(declare-fun m!164183 () Bool)

(assert (=> b!137316 m!164183))

(declare-fun m!164185 () Bool)

(assert (=> b!137317 m!164185))

(assert (=> d!42499 d!42981))

(declare-fun bm!15130 () Bool)

(declare-fun call!15133 () List!1723)

(declare-fun call!15135 () List!1723)

(assert (=> bm!15130 (= call!15133 call!15135)))

(declare-fun b!137318 () Bool)

(declare-fun e!89390 () List!1723)

(declare-fun call!15134 () List!1723)

(assert (=> b!137318 (= e!89390 call!15134)))

(declare-fun b!137319 () Bool)

(declare-fun e!89389 () List!1723)

(assert (=> b!137319 (= e!89389 call!15133)))

(declare-fun b!137320 () Bool)

(declare-fun e!89392 () List!1723)

(assert (=> b!137320 (= e!89392 call!15135)))

(declare-fun c!25750 () Bool)

(declare-fun b!137321 () Bool)

(declare-fun e!89388 () List!1723)

(declare-fun c!25751 () Bool)

(assert (=> b!137321 (= e!89388 (ite c!25751 (t!6211 (toList!873 lt!71121)) (ite c!25750 (Cons!1719 (h!2325 (toList!873 lt!71121)) (t!6211 (toList!873 lt!71121))) Nil!1720)))))

(declare-fun b!137322 () Bool)

(declare-fun lt!71861 () List!1723)

(declare-fun e!89391 () Bool)

(assert (=> b!137322 (= e!89391 (contains!907 lt!71861 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun bm!15131 () Bool)

(assert (=> bm!15131 (= call!15135 call!15134)))

(declare-fun c!25752 () Bool)

(declare-fun bm!15132 () Bool)

(assert (=> bm!15132 (= call!15134 ($colon$colon!93 e!89388 (ite c!25752 (h!2325 (toList!873 lt!71121)) (tuple2!2643 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun c!25753 () Bool)

(assert (=> bm!15132 (= c!25753 c!25752)))

(declare-fun b!137323 () Bool)

(assert (=> b!137323 (= e!89388 (insertStrictlySorted!91 (t!6211 (toList!873 lt!71121)) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun d!42983 () Bool)

(assert (=> d!42983 e!89391))

(declare-fun res!65842 () Bool)

(assert (=> d!42983 (=> (not res!65842) (not e!89391))))

(assert (=> d!42983 (= res!65842 (isStrictlySorted!323 lt!71861))))

(assert (=> d!42983 (= lt!71861 e!89390)))

(assert (=> d!42983 (= c!25752 (and ((_ is Cons!1719) (toList!873 lt!71121)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71121))) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!42983 (isStrictlySorted!323 (toList!873 lt!71121))))

(assert (=> d!42983 (= (insertStrictlySorted!91 (toList!873 lt!71121) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71861)))

(declare-fun b!137324 () Bool)

(assert (=> b!137324 (= c!25750 (and ((_ is Cons!1719) (toList!873 lt!71121)) (bvsgt (_1!1332 (h!2325 (toList!873 lt!71121))) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!137324 (= e!89392 e!89389)))

(declare-fun b!137325 () Bool)

(declare-fun res!65843 () Bool)

(assert (=> b!137325 (=> (not res!65843) (not e!89391))))

(assert (=> b!137325 (= res!65843 (containsKey!177 lt!71861 (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137326 () Bool)

(assert (=> b!137326 (= e!89390 e!89392)))

(assert (=> b!137326 (= c!25751 (and ((_ is Cons!1719) (toList!873 lt!71121)) (= (_1!1332 (h!2325 (toList!873 lt!71121))) (_1!1332 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!137327 () Bool)

(assert (=> b!137327 (= e!89389 call!15133)))

(assert (= (and d!42983 c!25752) b!137318))

(assert (= (and d!42983 (not c!25752)) b!137326))

(assert (= (and b!137326 c!25751) b!137320))

(assert (= (and b!137326 (not c!25751)) b!137324))

(assert (= (and b!137324 c!25750) b!137327))

(assert (= (and b!137324 (not c!25750)) b!137319))

(assert (= (or b!137327 b!137319) bm!15130))

(assert (= (or b!137320 bm!15130) bm!15131))

(assert (= (or b!137318 bm!15131) bm!15132))

(assert (= (and bm!15132 c!25753) b!137323))

(assert (= (and bm!15132 (not c!25753)) b!137321))

(assert (= (and d!42983 res!65842) b!137325))

(assert (= (and b!137325 res!65843) b!137322))

(declare-fun m!164187 () Bool)

(assert (=> b!137323 m!164187))

(declare-fun m!164189 () Bool)

(assert (=> bm!15132 m!164189))

(declare-fun m!164191 () Bool)

(assert (=> d!42983 m!164191))

(declare-fun m!164193 () Bool)

(assert (=> d!42983 m!164193))

(declare-fun m!164195 () Bool)

(assert (=> b!137325 m!164195))

(declare-fun m!164197 () Bool)

(assert (=> b!137322 m!164197))

(assert (=> d!42499 d!42983))

(declare-fun d!42985 () Bool)

(assert (=> d!42985 (= (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71118)) (v!3225 (getValueByKey!173 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71118)))))

(assert (=> d!42517 d!42985))

(declare-fun e!89393 () Option!179)

(declare-fun b!137328 () Bool)

(assert (=> b!137328 (= e!89393 (Some!178 (_2!1332 (h!2325 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun c!25754 () Bool)

(declare-fun d!42987 () Bool)

(assert (=> d!42987 (= c!25754 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71118)))))

(assert (=> d!42987 (= (getValueByKey!173 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71118) e!89393)))

(declare-fun b!137329 () Bool)

(declare-fun e!89394 () Option!179)

(assert (=> b!137329 (= e!89393 e!89394)))

(declare-fun c!25755 () Bool)

(assert (=> b!137329 (= c!25755 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) (not (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71118))))))

(declare-fun b!137330 () Bool)

(assert (=> b!137330 (= e!89394 (getValueByKey!173 (t!6211 (toList!873 (+!176 lt!71103 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71118))))

(declare-fun b!137331 () Bool)

(assert (=> b!137331 (= e!89394 None!177)))

(assert (= (and d!42987 c!25754) b!137328))

(assert (= (and d!42987 (not c!25754)) b!137329))

(assert (= (and b!137329 c!25755) b!137330))

(assert (= (and b!137329 (not c!25755)) b!137331))

(declare-fun m!164199 () Bool)

(assert (=> b!137330 m!164199))

(assert (=> d!42517 d!42987))

(assert (=> bm!15019 d!42529))

(declare-fun b!137333 () Bool)

(declare-fun res!65847 () Bool)

(declare-fun e!89395 () Bool)

(assert (=> b!137333 (=> (not res!65847) (not e!89395))))

(assert (=> b!137333 (= res!65847 (bvsge (size!2547 (_2!1333 lt!71054)) (_size!604 (_2!1333 lt!71054))))))

(declare-fun b!137334 () Bool)

(declare-fun res!65844 () Bool)

(assert (=> b!137334 (=> (not res!65844) (not e!89395))))

(assert (=> b!137334 (= res!65844 (= (size!2547 (_2!1333 lt!71054)) (bvadd (_size!604 (_2!1333 lt!71054)) (bvsdiv (bvadd (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!137335 () Bool)

(assert (=> b!137335 (= e!89395 (and (bvsge (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000000) (bvsle (extraKeys!2650 (_2!1333 lt!71054)) #b00000000000000000000000000000011) (bvsge (_vacant!604 (_2!1333 lt!71054)) #b00000000000000000000000000000000)))))

(declare-fun b!137332 () Bool)

(declare-fun res!65846 () Bool)

(assert (=> b!137332 (=> (not res!65846) (not e!89395))))

(assert (=> b!137332 (= res!65846 (and (= (size!2544 (_values!2872 (_2!1333 lt!71054))) (bvadd (mask!7203 (_2!1333 lt!71054)) #b00000000000000000000000000000001)) (= (size!2543 (_keys!4642 (_2!1333 lt!71054))) (size!2544 (_values!2872 (_2!1333 lt!71054)))) (bvsge (_size!604 (_2!1333 lt!71054)) #b00000000000000000000000000000000) (bvsle (_size!604 (_2!1333 lt!71054)) (bvadd (mask!7203 (_2!1333 lt!71054)) #b00000000000000000000000000000001))))))

(declare-fun d!42989 () Bool)

(declare-fun res!65845 () Bool)

(assert (=> d!42989 (=> (not res!65845) (not e!89395))))

(assert (=> d!42989 (= res!65845 (validMask!0 (mask!7203 (_2!1333 lt!71054))))))

(assert (=> d!42989 (= (simpleValid!93 (_2!1333 lt!71054)) e!89395)))

(assert (= (and d!42989 res!65845) b!137332))

(assert (= (and b!137332 res!65846) b!137333))

(assert (= (and b!137333 res!65847) b!137334))

(assert (= (and b!137334 res!65844) b!137335))

(declare-fun m!164201 () Bool)

(assert (=> b!137333 m!164201))

(assert (=> b!137334 m!164201))

(assert (=> d!42989 m!163647))

(assert (=> d!42555 d!42989))

(declare-fun b!137336 () Bool)

(declare-fun e!89396 () Option!179)

(assert (=> b!137336 (= e!89396 (Some!178 (_2!1332 (h!2325 (t!6211 (toList!873 lt!70951))))))))

(declare-fun d!42991 () Bool)

(declare-fun c!25756 () Bool)

(assert (=> d!42991 (= c!25756 (and ((_ is Cons!1719) (t!6211 (toList!873 lt!70951))) (= (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951)))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!42991 (= (getValueByKey!173 (t!6211 (toList!873 lt!70951)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89396)))

(declare-fun b!137337 () Bool)

(declare-fun e!89397 () Option!179)

(assert (=> b!137337 (= e!89396 e!89397)))

(declare-fun c!25757 () Bool)

(assert (=> b!137337 (= c!25757 (and ((_ is Cons!1719) (t!6211 (toList!873 lt!70951))) (not (= (_1!1332 (h!2325 (t!6211 (toList!873 lt!70951)))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))))

(declare-fun b!137338 () Bool)

(assert (=> b!137338 (= e!89397 (getValueByKey!173 (t!6211 (t!6211 (toList!873 lt!70951))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun b!137339 () Bool)

(assert (=> b!137339 (= e!89397 None!177)))

(assert (= (and d!42991 c!25756) b!137336))

(assert (= (and d!42991 (not c!25756)) b!137337))

(assert (= (and b!137337 c!25757) b!137338))

(assert (= (and b!137337 (not c!25757)) b!137339))

(assert (=> b!137338 m!162081))

(declare-fun m!164203 () Bool)

(assert (=> b!137338 m!164203))

(assert (=> b!136364 d!42991))

(declare-fun lt!71862 () Bool)

(declare-fun d!42993 () Bool)

(assert (=> d!42993 (= lt!71862 (select (content!134 (toList!873 lt!71356)) (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun e!89399 () Bool)

(assert (=> d!42993 (= lt!71862 e!89399)))

(declare-fun res!65849 () Bool)

(assert (=> d!42993 (=> (not res!65849) (not e!89399))))

(assert (=> d!42993 (= res!65849 ((_ is Cons!1719) (toList!873 lt!71356)))))

(assert (=> d!42993 (= (contains!907 (toList!873 lt!71356) (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71862)))

(declare-fun b!137340 () Bool)

(declare-fun e!89398 () Bool)

(assert (=> b!137340 (= e!89399 e!89398)))

(declare-fun res!65848 () Bool)

(assert (=> b!137340 (=> res!65848 e!89398)))

(assert (=> b!137340 (= res!65848 (= (h!2325 (toList!873 lt!71356)) (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137341 () Bool)

(assert (=> b!137341 (= e!89398 (contains!907 (t!6211 (toList!873 lt!71356)) (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!42993 res!65849) b!137340))

(assert (= (and b!137340 (not res!65848)) b!137341))

(declare-fun m!164205 () Bool)

(assert (=> d!42993 m!164205))

(declare-fun m!164207 () Bool)

(assert (=> d!42993 m!164207))

(declare-fun m!164209 () Bool)

(assert (=> b!137341 m!164209))

(assert (=> b!136492 d!42993))

(declare-fun d!42995 () Bool)

(assert (=> d!42995 (= (get!1497 (getValueByKey!173 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71111)) (v!3225 (getValueByKey!173 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71111)))))

(assert (=> d!42527 d!42995))

(declare-fun b!137342 () Bool)

(declare-fun e!89400 () Option!179)

(assert (=> b!137342 (= e!89400 (Some!178 (_2!1332 (h!2325 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))))

(declare-fun c!25758 () Bool)

(declare-fun d!42997 () Bool)

(assert (=> d!42997 (= c!25758 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71111)))))

(assert (=> d!42997 (= (getValueByKey!173 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71111) e!89400)))

(declare-fun b!137343 () Bool)

(declare-fun e!89401 () Option!179)

(assert (=> b!137343 (= e!89400 e!89401)))

(declare-fun c!25759 () Bool)

(assert (=> b!137343 (= c!25759 (and ((_ is Cons!1719) (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) (not (= (_1!1332 (h!2325 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))))) lt!71111))))))

(declare-fun b!137344 () Bool)

(assert (=> b!137344 (= e!89401 (getValueByKey!173 (t!6211 (toList!873 (+!176 lt!71112 (tuple2!2643 lt!71107 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))) lt!71111))))

(declare-fun b!137345 () Bool)

(assert (=> b!137345 (= e!89401 None!177)))

(assert (= (and d!42997 c!25758) b!137342))

(assert (= (and d!42997 (not c!25758)) b!137343))

(assert (= (and b!137343 c!25759) b!137344))

(assert (= (and b!137343 (not c!25759)) b!137345))

(declare-fun m!164211 () Bool)

(assert (=> b!137344 m!164211))

(assert (=> d!42527 d!42997))

(declare-fun d!42999 () Bool)

(declare-fun e!89402 () Bool)

(assert (=> d!42999 e!89402))

(declare-fun res!65850 () Bool)

(assert (=> d!42999 (=> res!65850 e!89402)))

(declare-fun lt!71865 () Bool)

(assert (=> d!42999 (= res!65850 (not lt!71865))))

(declare-fun lt!71863 () Bool)

(assert (=> d!42999 (= lt!71865 lt!71863)))

(declare-fun lt!71866 () Unit!4275)

(declare-fun e!89403 () Unit!4275)

(assert (=> d!42999 (= lt!71866 e!89403)))

(declare-fun c!25760 () Bool)

(assert (=> d!42999 (= c!25760 lt!71863)))

(assert (=> d!42999 (= lt!71863 (containsKey!177 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!42999 (= (contains!905 lt!71393 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!71865)))

(declare-fun b!137346 () Bool)

(declare-fun lt!71864 () Unit!4275)

(assert (=> b!137346 (= e!89403 lt!71864)))

(assert (=> b!137346 (= lt!71864 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!137346 (isDefined!126 (getValueByKey!173 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137347 () Bool)

(declare-fun Unit!4326 () Unit!4275)

(assert (=> b!137347 (= e!89403 Unit!4326)))

(declare-fun b!137348 () Bool)

(assert (=> b!137348 (= e!89402 (isDefined!126 (getValueByKey!173 (toList!873 lt!71393) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!42999 c!25760) b!137346))

(assert (= (and d!42999 (not c!25760)) b!137347))

(assert (= (and d!42999 (not res!65850)) b!137348))

(declare-fun m!164213 () Bool)

(assert (=> d!42999 m!164213))

(declare-fun m!164215 () Bool)

(assert (=> b!137346 m!164215))

(assert (=> b!137346 m!162763))

(assert (=> b!137346 m!162763))

(declare-fun m!164217 () Bool)

(assert (=> b!137346 m!164217))

(assert (=> b!137348 m!162763))

(assert (=> b!137348 m!162763))

(assert (=> b!137348 m!164217))

(assert (=> d!42557 d!42999))

(declare-fun b!137349 () Bool)

(declare-fun e!89404 () Option!179)

(assert (=> b!137349 (= e!89404 (Some!178 (_2!1332 (h!2325 lt!71392))))))

(declare-fun d!43001 () Bool)

(declare-fun c!25761 () Bool)

(assert (=> d!43001 (= c!25761 (and ((_ is Cons!1719) lt!71392) (= (_1!1332 (h!2325 lt!71392)) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43001 (= (getValueByKey!173 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!89404)))

(declare-fun b!137350 () Bool)

(declare-fun e!89405 () Option!179)

(assert (=> b!137350 (= e!89404 e!89405)))

(declare-fun c!25762 () Bool)

(assert (=> b!137350 (= c!25762 (and ((_ is Cons!1719) lt!71392) (not (= (_1!1332 (h!2325 lt!71392)) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!137351 () Bool)

(assert (=> b!137351 (= e!89405 (getValueByKey!173 (t!6211 lt!71392) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137352 () Bool)

(assert (=> b!137352 (= e!89405 None!177)))

(assert (= (and d!43001 c!25761) b!137349))

(assert (= (and d!43001 (not c!25761)) b!137350))

(assert (= (and b!137350 c!25762) b!137351))

(assert (= (and b!137350 (not c!25762)) b!137352))

(declare-fun m!164219 () Bool)

(assert (=> b!137351 m!164219))

(assert (=> d!42557 d!43001))

(declare-fun d!43003 () Bool)

(assert (=> d!43003 (= (getValueByKey!173 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71867 () Unit!4275)

(assert (=> d!43003 (= lt!71867 (choose!841 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!89406 () Bool)

(assert (=> d!43003 e!89406))

(declare-fun res!65851 () Bool)

(assert (=> d!43003 (=> (not res!65851) (not e!89406))))

(assert (=> d!43003 (= res!65851 (isStrictlySorted!323 lt!71392))))

(assert (=> d!43003 (= (lemmaContainsTupThenGetReturnValue!88 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!71867)))

(declare-fun b!137353 () Bool)

(declare-fun res!65852 () Bool)

(assert (=> b!137353 (=> (not res!65852) (not e!89406))))

(assert (=> b!137353 (= res!65852 (containsKey!177 lt!71392 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137354 () Bool)

(assert (=> b!137354 (= e!89406 (contains!907 lt!71392 (tuple2!2643 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!43003 res!65851) b!137353))

(assert (= (and b!137353 res!65852) b!137354))

(assert (=> d!43003 m!162757))

(declare-fun m!164221 () Bool)

(assert (=> d!43003 m!164221))

(declare-fun m!164223 () Bool)

(assert (=> d!43003 m!164223))

(declare-fun m!164225 () Bool)

(assert (=> b!137353 m!164225))

(declare-fun m!164227 () Bool)

(assert (=> b!137354 m!164227))

(assert (=> d!42557 d!43003))

(declare-fun bm!15133 () Bool)

(declare-fun call!15136 () List!1723)

(declare-fun call!15138 () List!1723)

(assert (=> bm!15133 (= call!15136 call!15138)))

(declare-fun b!137355 () Bool)

(declare-fun e!89409 () List!1723)

(declare-fun call!15137 () List!1723)

(assert (=> b!137355 (= e!89409 call!15137)))

(declare-fun b!137356 () Bool)

(declare-fun e!89408 () List!1723)

(assert (=> b!137356 (= e!89408 call!15136)))

(declare-fun b!137357 () Bool)

(declare-fun e!89411 () List!1723)

(assert (=> b!137357 (= e!89411 call!15138)))

(declare-fun c!25764 () Bool)

(declare-fun c!25763 () Bool)

(declare-fun e!89407 () List!1723)

(declare-fun b!137358 () Bool)

(assert (=> b!137358 (= e!89407 (ite c!25764 (t!6211 (toList!873 call!14960)) (ite c!25763 (Cons!1719 (h!2325 (toList!873 call!14960)) (t!6211 (toList!873 call!14960))) Nil!1720)))))

(declare-fun lt!71868 () List!1723)

(declare-fun b!137359 () Bool)

(declare-fun e!89410 () Bool)

(assert (=> b!137359 (= e!89410 (contains!907 lt!71868 (tuple2!2643 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!15134 () Bool)

(assert (=> bm!15134 (= call!15138 call!15137)))

(declare-fun bm!15135 () Bool)

(declare-fun c!25765 () Bool)

(assert (=> bm!15135 (= call!15137 ($colon$colon!93 e!89407 (ite c!25765 (h!2325 (toList!873 call!14960)) (tuple2!2643 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!25766 () Bool)

(assert (=> bm!15135 (= c!25766 c!25765)))

(declare-fun b!137360 () Bool)

(assert (=> b!137360 (= e!89407 (insertStrictlySorted!91 (t!6211 (toList!873 call!14960)) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!43005 () Bool)

(assert (=> d!43005 e!89410))

(declare-fun res!65853 () Bool)

(assert (=> d!43005 (=> (not res!65853) (not e!89410))))

(assert (=> d!43005 (= res!65853 (isStrictlySorted!323 lt!71868))))

(assert (=> d!43005 (= lt!71868 e!89409)))

(assert (=> d!43005 (= c!25765 (and ((_ is Cons!1719) (toList!873 call!14960)) (bvslt (_1!1332 (h!2325 (toList!873 call!14960))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!43005 (isStrictlySorted!323 (toList!873 call!14960))))

(assert (=> d!43005 (= (insertStrictlySorted!91 (toList!873 call!14960) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!71868)))

(declare-fun b!137361 () Bool)

(assert (=> b!137361 (= c!25763 (and ((_ is Cons!1719) (toList!873 call!14960)) (bvsgt (_1!1332 (h!2325 (toList!873 call!14960))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!137361 (= e!89411 e!89408)))

(declare-fun b!137362 () Bool)

(declare-fun res!65854 () Bool)

(assert (=> b!137362 (=> (not res!65854) (not e!89410))))

(assert (=> b!137362 (= res!65854 (containsKey!177 lt!71868 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137363 () Bool)

(assert (=> b!137363 (= e!89409 e!89411)))

(assert (=> b!137363 (= c!25764 (and ((_ is Cons!1719) (toList!873 call!14960)) (= (_1!1332 (h!2325 (toList!873 call!14960))) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137364 () Bool)

(assert (=> b!137364 (= e!89408 call!15136)))

(assert (= (and d!43005 c!25765) b!137355))

(assert (= (and d!43005 (not c!25765)) b!137363))

(assert (= (and b!137363 c!25764) b!137357))

(assert (= (and b!137363 (not c!25764)) b!137361))

(assert (= (and b!137361 c!25763) b!137364))

(assert (= (and b!137361 (not c!25763)) b!137356))

(assert (= (or b!137364 b!137356) bm!15133))

(assert (= (or b!137357 bm!15133) bm!15134))

(assert (= (or b!137355 bm!15134) bm!15135))

(assert (= (and bm!15135 c!25766) b!137360))

(assert (= (and bm!15135 (not c!25766)) b!137358))

(assert (= (and d!43005 res!65853) b!137362))

(assert (= (and b!137362 res!65854) b!137359))

(declare-fun m!164229 () Bool)

(assert (=> b!137360 m!164229))

(declare-fun m!164231 () Bool)

(assert (=> bm!15135 m!164231))

(declare-fun m!164233 () Bool)

(assert (=> d!43005 m!164233))

(declare-fun m!164235 () Bool)

(assert (=> d!43005 m!164235))

(declare-fun m!164237 () Bool)

(assert (=> b!137362 m!164237))

(declare-fun m!164239 () Bool)

(assert (=> b!137359 m!164239))

(assert (=> d!42557 d!43005))

(declare-fun d!43007 () Bool)

(declare-fun e!89412 () Bool)

(assert (=> d!43007 e!89412))

(declare-fun res!65855 () Bool)

(assert (=> d!43007 (=> res!65855 e!89412)))

(declare-fun lt!71871 () Bool)

(assert (=> d!43007 (= res!65855 (not lt!71871))))

(declare-fun lt!71869 () Bool)

(assert (=> d!43007 (= lt!71871 lt!71869)))

(declare-fun lt!71872 () Unit!4275)

(declare-fun e!89413 () Unit!4275)

(assert (=> d!43007 (= lt!71872 e!89413)))

(declare-fun c!25767 () Bool)

(assert (=> d!43007 (= c!25767 lt!71869)))

(assert (=> d!43007 (= lt!71869 (containsKey!177 (toList!873 lt!71143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43007 (= (contains!905 lt!71143 #b0000000000000000000000000000000000000000000000000000000000000000) lt!71871)))

(declare-fun b!137365 () Bool)

(declare-fun lt!71870 () Unit!4275)

(assert (=> b!137365 (= e!89413 lt!71870)))

(assert (=> b!137365 (= lt!71870 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137365 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137366 () Bool)

(declare-fun Unit!4327 () Unit!4275)

(assert (=> b!137366 (= e!89413 Unit!4327)))

(declare-fun b!137367 () Bool)

(assert (=> b!137367 (= e!89412 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43007 c!25767) b!137365))

(assert (= (and d!43007 (not c!25767)) b!137366))

(assert (= (and d!43007 (not res!65855)) b!137367))

(declare-fun m!164241 () Bool)

(assert (=> d!43007 m!164241))

(declare-fun m!164243 () Bool)

(assert (=> b!137365 m!164243))

(declare-fun m!164245 () Bool)

(assert (=> b!137365 m!164245))

(assert (=> b!137365 m!164245))

(declare-fun m!164247 () Bool)

(assert (=> b!137365 m!164247))

(assert (=> b!137367 m!164245))

(assert (=> b!137367 m!164245))

(assert (=> b!137367 m!164247))

(assert (=> bm!15002 d!43007))

(declare-fun d!43009 () Bool)

(declare-fun res!65856 () Bool)

(declare-fun e!89414 () Bool)

(assert (=> d!43009 (=> res!65856 e!89414)))

(assert (=> d!43009 (= res!65856 (and ((_ is Cons!1719) (toList!873 call!14968)) (= (_1!1332 (h!2325 (toList!873 call!14968))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(assert (=> d!43009 (= (containsKey!177 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) e!89414)))

(declare-fun b!137368 () Bool)

(declare-fun e!89415 () Bool)

(assert (=> b!137368 (= e!89414 e!89415)))

(declare-fun res!65857 () Bool)

(assert (=> b!137368 (=> (not res!65857) (not e!89415))))

(assert (=> b!137368 (= res!65857 (and (or (not ((_ is Cons!1719) (toList!873 call!14968))) (bvsle (_1!1332 (h!2325 (toList!873 call!14968))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))) ((_ is Cons!1719) (toList!873 call!14968)) (bvslt (_1!1332 (h!2325 (toList!873 call!14968))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355))))))

(declare-fun b!137369 () Bool)

(assert (=> b!137369 (= e!89415 (containsKey!177 (t!6211 (toList!873 call!14968)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!43009 (not res!65856)) b!137368))

(assert (= (and b!137368 res!65857) b!137369))

(assert (=> b!137369 m!162081))

(declare-fun m!164249 () Bool)

(assert (=> b!137369 m!164249))

(assert (=> d!42531 d!43009))

(declare-fun d!43011 () Bool)

(declare-fun res!65858 () Bool)

(declare-fun e!89416 () Bool)

(assert (=> d!43011 (=> res!65858 e!89416)))

(assert (=> d!43011 (= res!65858 (and ((_ is Cons!1719) (toList!873 lt!71115)) (= (_1!1332 (h!2325 (toList!873 lt!71115))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!43011 (= (containsKey!177 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!89416)))

(declare-fun b!137370 () Bool)

(declare-fun e!89417 () Bool)

(assert (=> b!137370 (= e!89416 e!89417)))

(declare-fun res!65859 () Bool)

(assert (=> b!137370 (=> (not res!65859) (not e!89417))))

(assert (=> b!137370 (= res!65859 (and (or (not ((_ is Cons!1719) (toList!873 lt!71115))) (bvsle (_1!1332 (h!2325 (toList!873 lt!71115))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1719) (toList!873 lt!71115)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71115))) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!137371 () Bool)

(assert (=> b!137371 (= e!89417 (containsKey!177 (t!6211 (toList!873 lt!71115)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!43011 (not res!65858)) b!137370))

(assert (= (and b!137370 res!65859) b!137371))

(assert (=> b!137371 m!162243))

(declare-fun m!164251 () Bool)

(assert (=> b!137371 m!164251))

(assert (=> d!42533 d!43011))

(assert (=> b!136571 d!42737))

(assert (=> b!136571 d!42739))

(declare-fun b!137372 () Bool)

(declare-fun e!89419 () Bool)

(declare-fun call!15139 () Bool)

(assert (=> b!137372 (= e!89419 call!15139)))

(declare-fun b!137373 () Bool)

(declare-fun e!89418 () Bool)

(assert (=> b!137373 (= e!89419 e!89418)))

(declare-fun lt!71875 () (_ BitVec 64))

(assert (=> b!137373 (= lt!71875 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!71874 () Unit!4275)

(assert (=> b!137373 (= lt!71874 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) lt!71875 #b00000000000000000000000000000000))))

(assert (=> b!137373 (arrayContainsKey!0 (_keys!4642 (v!3221 (underlying!460 thiss!992))) lt!71875 #b00000000000000000000000000000000)))

(declare-fun lt!71873 () Unit!4275)

(assert (=> b!137373 (= lt!71873 lt!71874)))

(declare-fun res!65861 () Bool)

(assert (=> b!137373 (= res!65861 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000) (_keys!4642 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992)))) (Found!276 #b00000000000000000000000000000000)))))

(assert (=> b!137373 (=> (not res!65861) (not e!89418))))

(declare-fun bm!15136 () Bool)

(assert (=> bm!15136 (= call!15139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4642 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992)))))))

(declare-fun d!43013 () Bool)

(declare-fun res!65860 () Bool)

(declare-fun e!89420 () Bool)

(assert (=> d!43013 (=> res!65860 e!89420)))

(assert (=> d!43013 (= res!65860 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (v!3221 (underlying!460 thiss!992))))))))

(assert (=> d!43013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4642 (v!3221 (underlying!460 thiss!992))) (mask!7203 (v!3221 (underlying!460 thiss!992)))) e!89420)))

(declare-fun b!137374 () Bool)

(assert (=> b!137374 (= e!89420 e!89419)))

(declare-fun c!25768 () Bool)

(assert (=> b!137374 (= c!25768 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!137375 () Bool)

(assert (=> b!137375 (= e!89418 call!15139)))

(assert (= (and d!43013 (not res!65860)) b!137374))

(assert (= (and b!137374 c!25768) b!137373))

(assert (= (and b!137374 (not c!25768)) b!137372))

(assert (= (and b!137373 res!65861) b!137375))

(assert (= (or b!137375 b!137372) bm!15136))

(assert (=> b!137373 m!162885))

(declare-fun m!164253 () Bool)

(assert (=> b!137373 m!164253))

(declare-fun m!164255 () Bool)

(assert (=> b!137373 m!164255))

(assert (=> b!137373 m!162885))

(declare-fun m!164257 () Bool)

(assert (=> b!137373 m!164257))

(declare-fun m!164259 () Bool)

(assert (=> bm!15136 m!164259))

(assert (=> b!137374 m!162885))

(assert (=> b!137374 m!162885))

(assert (=> b!137374 m!162889))

(assert (=> b!136343 d!43013))

(declare-fun d!43015 () Bool)

(declare-fun e!89421 () Bool)

(assert (=> d!43015 e!89421))

(declare-fun res!65862 () Bool)

(assert (=> d!43015 (=> res!65862 e!89421)))

(declare-fun lt!71878 () Bool)

(assert (=> d!43015 (= res!65862 (not lt!71878))))

(declare-fun lt!71876 () Bool)

(assert (=> d!43015 (= lt!71878 lt!71876)))

(declare-fun lt!71879 () Unit!4275)

(declare-fun e!89422 () Unit!4275)

(assert (=> d!43015 (= lt!71879 e!89422)))

(declare-fun c!25769 () Bool)

(assert (=> d!43015 (= c!25769 lt!71876)))

(assert (=> d!43015 (= lt!71876 (containsKey!177 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> d!43015 (= (contains!905 lt!71344 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71878)))

(declare-fun b!137376 () Bool)

(declare-fun lt!71877 () Unit!4275)

(assert (=> b!137376 (= e!89422 lt!71877)))

(assert (=> b!137376 (= lt!71877 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(assert (=> b!137376 (isDefined!126 (getValueByKey!173 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137377 () Bool)

(declare-fun Unit!4328 () Unit!4275)

(assert (=> b!137377 (= e!89422 Unit!4328)))

(declare-fun b!137378 () Bool)

(assert (=> b!137378 (= e!89421 (isDefined!126 (getValueByKey!173 (toList!873 lt!71344) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!43015 c!25769) b!137376))

(assert (= (and d!43015 (not c!25769)) b!137377))

(assert (= (and d!43015 (not res!65862)) b!137378))

(declare-fun m!164261 () Bool)

(assert (=> d!43015 m!164261))

(declare-fun m!164263 () Bool)

(assert (=> b!137376 m!164263))

(assert (=> b!137376 m!162633))

(assert (=> b!137376 m!162633))

(declare-fun m!164265 () Bool)

(assert (=> b!137376 m!164265))

(assert (=> b!137378 m!162633))

(assert (=> b!137378 m!162633))

(assert (=> b!137378 m!164265))

(assert (=> d!42507 d!43015))

(declare-fun b!137379 () Bool)

(declare-fun e!89423 () Option!179)

(assert (=> b!137379 (= e!89423 (Some!178 (_2!1332 (h!2325 lt!71343))))))

(declare-fun d!43017 () Bool)

(declare-fun c!25770 () Bool)

(assert (=> d!43017 (= c!25770 (and ((_ is Cons!1719) lt!71343) (= (_1!1332 (h!2325 lt!71343)) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!43017 (= (getValueByKey!173 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) e!89423)))

(declare-fun b!137380 () Bool)

(declare-fun e!89424 () Option!179)

(assert (=> b!137380 (= e!89423 e!89424)))

(declare-fun c!25771 () Bool)

(assert (=> b!137380 (= c!25771 (and ((_ is Cons!1719) lt!71343) (not (= (_1!1332 (h!2325 lt!71343)) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun b!137381 () Bool)

(assert (=> b!137381 (= e!89424 (getValueByKey!173 (t!6211 lt!71343) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137382 () Bool)

(assert (=> b!137382 (= e!89424 None!177)))

(assert (= (and d!43017 c!25770) b!137379))

(assert (= (and d!43017 (not c!25770)) b!137380))

(assert (= (and b!137380 c!25771) b!137381))

(assert (= (and b!137380 (not c!25771)) b!137382))

(declare-fun m!164267 () Bool)

(assert (=> b!137381 m!164267))

(assert (=> d!42507 d!43017))

(declare-fun d!43019 () Bool)

(assert (=> d!43019 (= (getValueByKey!173 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) (Some!178 (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun lt!71880 () Unit!4275)

(assert (=> d!43019 (= lt!71880 (choose!841 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun e!89425 () Bool)

(assert (=> d!43019 e!89425))

(declare-fun res!65863 () Bool)

(assert (=> d!43019 (=> (not res!65863) (not e!89425))))

(assert (=> d!43019 (= res!65863 (isStrictlySorted!323 lt!71343))))

(assert (=> d!43019 (= (lemmaContainsTupThenGetReturnValue!88 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71880)))

(declare-fun b!137383 () Bool)

(declare-fun res!65864 () Bool)

(assert (=> b!137383 (=> (not res!65864) (not e!89425))))

(assert (=> b!137383 (= res!65864 (containsKey!177 lt!71343 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137384 () Bool)

(assert (=> b!137384 (= e!89425 (contains!907 lt!71343 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (= (and d!43019 res!65863) b!137383))

(assert (= (and b!137383 res!65864) b!137384))

(assert (=> d!43019 m!162627))

(declare-fun m!164269 () Bool)

(assert (=> d!43019 m!164269))

(declare-fun m!164271 () Bool)

(assert (=> d!43019 m!164271))

(declare-fun m!164273 () Bool)

(assert (=> b!137383 m!164273))

(declare-fun m!164275 () Bool)

(assert (=> b!137384 m!164275))

(assert (=> d!42507 d!43019))

(declare-fun bm!15137 () Bool)

(declare-fun call!15140 () List!1723)

(declare-fun call!15142 () List!1723)

(assert (=> bm!15137 (= call!15140 call!15142)))

(declare-fun b!137385 () Bool)

(declare-fun e!89428 () List!1723)

(declare-fun call!15141 () List!1723)

(assert (=> b!137385 (= e!89428 call!15141)))

(declare-fun b!137386 () Bool)

(declare-fun e!89427 () List!1723)

(assert (=> b!137386 (= e!89427 call!15140)))

(declare-fun b!137387 () Bool)

(declare-fun e!89430 () List!1723)

(assert (=> b!137387 (= e!89430 call!15142)))

(declare-fun c!25773 () Bool)

(declare-fun b!137388 () Bool)

(declare-fun c!25772 () Bool)

(declare-fun e!89426 () List!1723)

(assert (=> b!137388 (= e!89426 (ite c!25773 (t!6211 (toList!873 lt!71103)) (ite c!25772 (Cons!1719 (h!2325 (toList!873 lt!71103)) (t!6211 (toList!873 lt!71103))) Nil!1720)))))

(declare-fun lt!71881 () List!1723)

(declare-fun e!89429 () Bool)

(declare-fun b!137389 () Bool)

(assert (=> b!137389 (= e!89429 (contains!907 lt!71881 (tuple2!2643 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun bm!15138 () Bool)

(assert (=> bm!15138 (= call!15142 call!15141)))

(declare-fun c!25774 () Bool)

(declare-fun bm!15139 () Bool)

(assert (=> bm!15139 (= call!15141 ($colon$colon!93 e!89426 (ite c!25774 (h!2325 (toList!873 lt!71103)) (tuple2!2643 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))))

(declare-fun c!25775 () Bool)

(assert (=> bm!15139 (= c!25775 c!25774)))

(declare-fun b!137390 () Bool)

(assert (=> b!137390 (= e!89426 (insertStrictlySorted!91 (t!6211 (toList!873 lt!71103)) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun d!43021 () Bool)

(assert (=> d!43021 e!89429))

(declare-fun res!65865 () Bool)

(assert (=> d!43021 (=> (not res!65865) (not e!89429))))

(assert (=> d!43021 (= res!65865 (isStrictlySorted!323 lt!71881))))

(assert (=> d!43021 (= lt!71881 e!89428)))

(assert (=> d!43021 (= c!25774 (and ((_ is Cons!1719) (toList!873 lt!71103)) (bvslt (_1!1332 (h!2325 (toList!873 lt!71103))) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!43021 (isStrictlySorted!323 (toList!873 lt!71103))))

(assert (=> d!43021 (= (insertStrictlySorted!91 (toList!873 lt!71103) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) (_2!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71881)))

(declare-fun b!137391 () Bool)

(assert (=> b!137391 (= c!25772 (and ((_ is Cons!1719) (toList!873 lt!71103)) (bvsgt (_1!1332 (h!2325 (toList!873 lt!71103))) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> b!137391 (= e!89430 e!89427)))

(declare-fun b!137392 () Bool)

(declare-fun res!65866 () Bool)

(assert (=> b!137392 (=> (not res!65866) (not e!89429))))

(assert (=> b!137392 (= res!65866 (containsKey!177 lt!71881 (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992)))))))))

(declare-fun b!137393 () Bool)

(assert (=> b!137393 (= e!89428 e!89430)))

(assert (=> b!137393 (= c!25773 (and ((_ is Cons!1719) (toList!873 lt!71103)) (= (_1!1332 (h!2325 (toList!873 lt!71103))) (_1!1332 (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(declare-fun b!137394 () Bool)

(assert (=> b!137394 (= e!89427 call!15140)))

(assert (= (and d!43021 c!25774) b!137385))

(assert (= (and d!43021 (not c!25774)) b!137393))

(assert (= (and b!137393 c!25773) b!137387))

(assert (= (and b!137393 (not c!25773)) b!137391))

(assert (= (and b!137391 c!25772) b!137394))

(assert (= (and b!137391 (not c!25772)) b!137386))

(assert (= (or b!137394 b!137386) bm!15137))

(assert (= (or b!137387 bm!15137) bm!15138))

(assert (= (or b!137385 bm!15138) bm!15139))

(assert (= (and bm!15139 c!25775) b!137390))

(assert (= (and bm!15139 (not c!25775)) b!137388))

(assert (= (and d!43021 res!65865) b!137392))

(assert (= (and b!137392 res!65866) b!137389))

(declare-fun m!164277 () Bool)

(assert (=> b!137390 m!164277))

(declare-fun m!164279 () Bool)

(assert (=> bm!15139 m!164279))

(declare-fun m!164281 () Bool)

(assert (=> d!43021 m!164281))

(declare-fun m!164283 () Bool)

(assert (=> d!43021 m!164283))

(declare-fun m!164285 () Bool)

(assert (=> b!137392 m!164285))

(declare-fun m!164287 () Bool)

(assert (=> b!137389 m!164287))

(assert (=> d!42507 d!43021))

(declare-fun lt!71882 () Bool)

(declare-fun d!43023 () Bool)

(assert (=> d!43023 (= lt!71882 (select (content!134 (toList!873 lt!71198)) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!89432 () Bool)

(assert (=> d!43023 (= lt!71882 e!89432)))

(declare-fun res!65868 () Bool)

(assert (=> d!43023 (=> (not res!65868) (not e!89432))))

(assert (=> d!43023 (= res!65868 ((_ is Cons!1719) (toList!873 lt!71198)))))

(assert (=> d!43023 (= (contains!907 (toList!873 lt!71198) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!71882)))

(declare-fun b!137395 () Bool)

(declare-fun e!89431 () Bool)

(assert (=> b!137395 (= e!89432 e!89431)))

(declare-fun res!65867 () Bool)

(assert (=> b!137395 (=> res!65867 e!89431)))

(assert (=> b!137395 (= res!65867 (= (h!2325 (toList!873 lt!71198)) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!137396 () Bool)

(assert (=> b!137396 (= e!89431 (contains!907 (t!6211 (toList!873 lt!71198)) (ite c!25441 (ite c!25439 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!43023 res!65868) b!137395))

(assert (= (and b!137395 (not res!65867)) b!137396))

(declare-fun m!164289 () Bool)

(assert (=> d!43023 m!164289))

(declare-fun m!164291 () Bool)

(assert (=> d!43023 m!164291))

(declare-fun m!164293 () Bool)

(assert (=> b!137396 m!164293))

(assert (=> b!136350 d!43023))

(declare-fun d!43025 () Bool)

(declare-fun e!89433 () Bool)

(assert (=> d!43025 e!89433))

(declare-fun res!65870 () Bool)

(assert (=> d!43025 (=> (not res!65870) (not e!89433))))

(declare-fun lt!71885 () ListLongMap!1715)

(assert (=> d!43025 (= res!65870 (contains!905 lt!71885 (_1!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(declare-fun lt!71884 () List!1723)

(assert (=> d!43025 (= lt!71885 (ListLongMap!1716 lt!71884))))

(declare-fun lt!71883 () Unit!4275)

(declare-fun lt!71886 () Unit!4275)

(assert (=> d!43025 (= lt!71883 lt!71886)))

(assert (=> d!43025 (= (getValueByKey!173 lt!71884 (_1!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!43025 (= lt!71886 (lemmaContainsTupThenGetReturnValue!88 lt!71884 (_1!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (_2!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!43025 (= lt!71884 (insertStrictlySorted!91 (toList!873 (ite c!25474 call!15012 (ite c!25479 call!15011 call!15006))) (_1!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) (_2!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))))))

(assert (=> d!43025 (= (+!176 (ite c!25474 call!15012 (ite c!25479 call!15011 call!15006)) (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))) lt!71885)))

(declare-fun b!137397 () Bool)

(declare-fun res!65869 () Bool)

(assert (=> b!137397 (=> (not res!65869) (not e!89433))))

(assert (=> b!137397 (= res!65869 (= (getValueByKey!173 (toList!873 lt!71885) (_1!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16))))) (Some!178 (_2!1332 (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))))

(declare-fun b!137398 () Bool)

(assert (=> b!137398 (= e!89433 (contains!907 (toList!873 lt!71885) (ite (or c!25474 c!25479) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2742 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2742 newMap!16)))))))

(assert (= (and d!43025 res!65870) b!137397))

(assert (= (and b!137397 res!65869) b!137398))

(declare-fun m!164295 () Bool)

(assert (=> d!43025 m!164295))

(declare-fun m!164297 () Bool)

(assert (=> d!43025 m!164297))

(declare-fun m!164299 () Bool)

(assert (=> d!43025 m!164299))

(declare-fun m!164301 () Bool)

(assert (=> d!43025 m!164301))

(declare-fun m!164303 () Bool)

(assert (=> b!137397 m!164303))

(declare-fun m!164305 () Bool)

(assert (=> b!137398 m!164305))

(assert (=> bm!15004 d!43025))

(declare-fun d!43027 () Bool)

(declare-fun res!65871 () Bool)

(declare-fun e!89434 () Bool)

(assert (=> d!43027 (=> res!65871 e!89434)))

(assert (=> d!43027 (= res!65871 (= (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (=> d!43027 (= (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!89434)))

(declare-fun b!137399 () Bool)

(declare-fun e!89435 () Bool)

(assert (=> b!137399 (= e!89434 e!89435)))

(declare-fun res!65872 () Bool)

(assert (=> b!137399 (=> (not res!65872) (not e!89435))))

(assert (=> b!137399 (= res!65872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(declare-fun b!137400 () Bool)

(assert (=> b!137400 (= e!89435 (arrayContainsKey!0 (_keys!4642 newMap!16) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!43027 (not res!65871)) b!137399))

(assert (= (and b!137399 res!65872) b!137400))

(assert (=> d!43027 m!163449))

(assert (=> b!137400 m!162081))

(declare-fun m!164307 () Bool)

(assert (=> b!137400 m!164307))

(assert (=> b!136494 d!43027))

(declare-fun b!137401 () Bool)

(declare-fun e!89437 () Bool)

(declare-fun call!15143 () Bool)

(assert (=> b!137401 (= e!89437 call!15143)))

(declare-fun b!137402 () Bool)

(declare-fun e!89436 () Bool)

(assert (=> b!137402 (= e!89437 e!89436)))

(declare-fun lt!71889 () (_ BitVec 64))

(assert (=> b!137402 (= lt!71889 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!71888 () Unit!4275)

(assert (=> b!137402 (= lt!71888 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4642 newMap!16) lt!71889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!137402 (arrayContainsKey!0 (_keys!4642 newMap!16) lt!71889 #b00000000000000000000000000000000)))

(declare-fun lt!71887 () Unit!4275)

(assert (=> b!137402 (= lt!71887 lt!71888)))

(declare-fun res!65874 () Bool)

(assert (=> b!137402 (= res!65874 (= (seekEntryOrOpen!0 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4642 newMap!16) (mask!7203 newMap!16)) (Found!276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!137402 (=> (not res!65874) (not e!89436))))

(declare-fun bm!15140 () Bool)

(assert (=> bm!15140 (= call!15143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4642 newMap!16) (mask!7203 newMap!16)))))

(declare-fun d!43029 () Bool)

(declare-fun res!65873 () Bool)

(declare-fun e!89438 () Bool)

(assert (=> d!43029 (=> res!65873 e!89438)))

(assert (=> d!43029 (= res!65873 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 newMap!16))))))

(assert (=> d!43029 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4642 newMap!16) (mask!7203 newMap!16)) e!89438)))

(declare-fun b!137403 () Bool)

(assert (=> b!137403 (= e!89438 e!89437)))

(declare-fun c!25776 () Bool)

(assert (=> b!137403 (= c!25776 (validKeyInArray!0 (select (arr!2273 (_keys!4642 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!137404 () Bool)

(assert (=> b!137404 (= e!89436 call!15143)))

(assert (= (and d!43029 (not res!65873)) b!137403))

(assert (= (and b!137403 c!25776) b!137402))

(assert (= (and b!137403 (not c!25776)) b!137401))

(assert (= (and b!137402 res!65874) b!137404))

(assert (= (or b!137404 b!137401) bm!15140))

(assert (=> b!137402 m!163449))

(declare-fun m!164309 () Bool)

(assert (=> b!137402 m!164309))

(declare-fun m!164311 () Bool)

(assert (=> b!137402 m!164311))

(assert (=> b!137402 m!163449))

(declare-fun m!164313 () Bool)

(assert (=> b!137402 m!164313))

(declare-fun m!164315 () Bool)

(assert (=> bm!15140 m!164315))

(assert (=> b!137403 m!163449))

(assert (=> b!137403 m!163449))

(assert (=> b!137403 m!163453))

(assert (=> bm!15036 d!43029))

(declare-fun d!43031 () Bool)

(assert (=> d!43031 (= (apply!117 lt!71413 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5771 () Bool)

(assert (= bs!5771 d!43031))

(assert (=> bs!5771 m!162857))

(assert (=> bs!5771 m!162857))

(declare-fun m!164317 () Bool)

(assert (=> bs!5771 m!164317))

(assert (=> b!136610 d!43031))

(declare-fun d!43033 () Bool)

(assert (=> d!43033 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(declare-fun lt!71890 () Unit!4275)

(assert (=> d!43033 (= lt!71890 (choose!833 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(declare-fun e!89439 () Bool)

(assert (=> d!43033 e!89439))

(declare-fun res!65875 () Bool)

(assert (=> d!43033 (=> (not res!65875) (not e!89439))))

(assert (=> d!43033 (= res!65875 (isStrictlySorted!323 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))))

(assert (=> d!43033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114) lt!71890)))

(declare-fun b!137405 () Bool)

(assert (=> b!137405 (= e!89439 (containsKey!177 (toList!873 (+!176 lt!71121 (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992)))))) lt!71114))))

(assert (= (and d!43033 res!65875) b!137405))

(assert (=> d!43033 m!162573))

(assert (=> d!43033 m!162573))

(assert (=> d!43033 m!162575))

(declare-fun m!164319 () Bool)

(assert (=> d!43033 m!164319))

(declare-fun m!164321 () Bool)

(assert (=> d!43033 m!164321))

(assert (=> b!137405 m!162569))

(assert (=> b!136439 d!43033))

(assert (=> b!136439 d!42749))

(assert (=> b!136439 d!42751))

(declare-fun lt!71891 () Bool)

(declare-fun d!43035 () Bool)

(assert (=> d!43035 (= lt!71891 (select (content!134 (toList!873 lt!71315)) (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun e!89441 () Bool)

(assert (=> d!43035 (= lt!71891 e!89441)))

(declare-fun res!65877 () Bool)

(assert (=> d!43035 (=> (not res!65877) (not e!89441))))

(assert (=> d!43035 (= res!65877 ((_ is Cons!1719) (toList!873 lt!71315)))))

(assert (=> d!43035 (= (contains!907 (toList!873 lt!71315) (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71891)))

(declare-fun b!137406 () Bool)

(declare-fun e!89440 () Bool)

(assert (=> b!137406 (= e!89441 e!89440)))

(declare-fun res!65876 () Bool)

(assert (=> b!137406 (=> res!65876 e!89440)))

(assert (=> b!137406 (= res!65876 (= (h!2325 (toList!873 lt!71315)) (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137407 () Bool)

(assert (=> b!137407 (= e!89440 (contains!907 (t!6211 (toList!873 lt!71315)) (tuple2!2643 lt!71105 (zeroValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!43035 res!65877) b!137406))

(assert (= (and b!137406 (not res!65876)) b!137407))

(declare-fun m!164323 () Bool)

(assert (=> d!43035 m!164323))

(declare-fun m!164325 () Bool)

(assert (=> d!43035 m!164325))

(declare-fun m!164327 () Bool)

(assert (=> b!137407 m!164327))

(assert (=> b!136443 d!43035))

(declare-fun d!43037 () Bool)

(declare-fun e!89442 () Bool)

(assert (=> d!43037 e!89442))

(declare-fun res!65878 () Bool)

(assert (=> d!43037 (=> res!65878 e!89442)))

(declare-fun lt!71894 () Bool)

(assert (=> d!43037 (= res!65878 (not lt!71894))))

(declare-fun lt!71892 () Bool)

(assert (=> d!43037 (= lt!71894 lt!71892)))

(declare-fun lt!71895 () Unit!4275)

(declare-fun e!89443 () Unit!4275)

(assert (=> d!43037 (= lt!71895 e!89443)))

(declare-fun c!25777 () Bool)

(assert (=> d!43037 (= c!25777 lt!71892)))

(assert (=> d!43037 (= lt!71892 (containsKey!177 (toList!873 lt!71176) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43037 (= (contains!905 lt!71176 #b1000000000000000000000000000000000000000000000000000000000000000) lt!71894)))

(declare-fun b!137408 () Bool)

(declare-fun lt!71893 () Unit!4275)

(assert (=> b!137408 (= e!89443 lt!71893)))

(assert (=> b!137408 (= lt!71893 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71176) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137408 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137409 () Bool)

(declare-fun Unit!4329 () Unit!4275)

(assert (=> b!137409 (= e!89443 Unit!4329)))

(declare-fun b!137410 () Bool)

(assert (=> b!137410 (= e!89442 (isDefined!126 (getValueByKey!173 (toList!873 lt!71176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43037 c!25777) b!137408))

(assert (= (and d!43037 (not c!25777)) b!137409))

(assert (= (and d!43037 (not res!65878)) b!137410))

(declare-fun m!164329 () Bool)

(assert (=> d!43037 m!164329))

(declare-fun m!164331 () Bool)

(assert (=> b!137408 m!164331))

(assert (=> b!137408 m!163909))

(assert (=> b!137408 m!163909))

(declare-fun m!164333 () Bool)

(assert (=> b!137408 m!164333))

(assert (=> b!137410 m!163909))

(assert (=> b!137410 m!163909))

(assert (=> b!137410 m!164333))

(assert (=> bm!15003 d!43037))

(declare-fun d!43039 () Bool)

(declare-fun e!89444 () Bool)

(assert (=> d!43039 e!89444))

(declare-fun res!65879 () Bool)

(assert (=> d!43039 (=> res!65879 e!89444)))

(declare-fun lt!71898 () Bool)

(assert (=> d!43039 (= res!65879 (not lt!71898))))

(declare-fun lt!71896 () Bool)

(assert (=> d!43039 (= lt!71898 lt!71896)))

(declare-fun lt!71899 () Unit!4275)

(declare-fun e!89445 () Unit!4275)

(assert (=> d!43039 (= lt!71899 e!89445)))

(declare-fun c!25778 () Bool)

(assert (=> d!43039 (= c!25778 lt!71896)))

(assert (=> d!43039 (= lt!71896 (containsKey!177 (toList!873 lt!71143) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!43039 (= (contains!905 lt!71143 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) lt!71898)))

(declare-fun b!137411 () Bool)

(declare-fun lt!71897 () Unit!4275)

(assert (=> b!137411 (= e!89445 lt!71897)))

(assert (=> b!137411 (= lt!71897 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71143) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!137411 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!137412 () Bool)

(declare-fun Unit!4330 () Unit!4275)

(assert (=> b!137412 (= e!89445 Unit!4330)))

(declare-fun b!137413 () Bool)

(assert (=> b!137413 (= e!89444 (isDefined!126 (getValueByKey!173 (toList!873 lt!71143) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!43039 c!25778) b!137411))

(assert (= (and d!43039 (not c!25778)) b!137412))

(assert (= (and d!43039 (not res!65879)) b!137413))

(assert (=> d!43039 m!162327))

(declare-fun m!164335 () Bool)

(assert (=> d!43039 m!164335))

(assert (=> b!137411 m!162327))

(declare-fun m!164337 () Bool)

(assert (=> b!137411 m!164337))

(assert (=> b!137411 m!162327))

(assert (=> b!137411 m!163089))

(assert (=> b!137411 m!163089))

(declare-fun m!164339 () Bool)

(assert (=> b!137411 m!164339))

(assert (=> b!137413 m!162327))

(assert (=> b!137413 m!163089))

(assert (=> b!137413 m!163089))

(assert (=> b!137413 m!164339))

(assert (=> b!136294 d!43039))

(assert (=> bm!15032 d!42529))

(declare-fun d!43041 () Bool)

(declare-fun e!89446 () Bool)

(assert (=> d!43041 e!89446))

(declare-fun res!65881 () Bool)

(assert (=> d!43041 (=> (not res!65881) (not e!89446))))

(declare-fun lt!71902 () ListLongMap!1715)

(assert (=> d!43041 (= res!65881 (contains!905 lt!71902 (_1!1332 (tuple2!2643 lt!71337 lt!71336))))))

(declare-fun lt!71901 () List!1723)

(assert (=> d!43041 (= lt!71902 (ListLongMap!1716 lt!71901))))

(declare-fun lt!71900 () Unit!4275)

(declare-fun lt!71903 () Unit!4275)

(assert (=> d!43041 (= lt!71900 lt!71903)))

(assert (=> d!43041 (= (getValueByKey!173 lt!71901 (_1!1332 (tuple2!2643 lt!71337 lt!71336))) (Some!178 (_2!1332 (tuple2!2643 lt!71337 lt!71336))))))

(assert (=> d!43041 (= lt!71903 (lemmaContainsTupThenGetReturnValue!88 lt!71901 (_1!1332 (tuple2!2643 lt!71337 lt!71336)) (_2!1332 (tuple2!2643 lt!71337 lt!71336))))))

(assert (=> d!43041 (= lt!71901 (insertStrictlySorted!91 (toList!873 lt!71334) (_1!1332 (tuple2!2643 lt!71337 lt!71336)) (_2!1332 (tuple2!2643 lt!71337 lt!71336))))))

(assert (=> d!43041 (= (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336)) lt!71902)))

(declare-fun b!137414 () Bool)

(declare-fun res!65880 () Bool)

(assert (=> b!137414 (=> (not res!65880) (not e!89446))))

(assert (=> b!137414 (= res!65880 (= (getValueByKey!173 (toList!873 lt!71902) (_1!1332 (tuple2!2643 lt!71337 lt!71336))) (Some!178 (_2!1332 (tuple2!2643 lt!71337 lt!71336)))))))

(declare-fun b!137415 () Bool)

(assert (=> b!137415 (= e!89446 (contains!907 (toList!873 lt!71902) (tuple2!2643 lt!71337 lt!71336)))))

(assert (= (and d!43041 res!65881) b!137414))

(assert (= (and b!137414 res!65880) b!137415))

(declare-fun m!164341 () Bool)

(assert (=> d!43041 m!164341))

(declare-fun m!164343 () Bool)

(assert (=> d!43041 m!164343))

(declare-fun m!164345 () Bool)

(assert (=> d!43041 m!164345))

(declare-fun m!164347 () Bool)

(assert (=> d!43041 m!164347))

(declare-fun m!164349 () Bool)

(assert (=> b!137414 m!164349))

(declare-fun m!164351 () Bool)

(assert (=> b!137415 m!164351))

(assert (=> b!136473 d!43041))

(assert (=> b!136473 d!42489))

(declare-fun d!43043 () Bool)

(declare-fun e!89447 () Bool)

(assert (=> d!43043 e!89447))

(declare-fun res!65882 () Bool)

(assert (=> d!43043 (=> res!65882 e!89447)))

(declare-fun lt!71906 () Bool)

(assert (=> d!43043 (= res!65882 (not lt!71906))))

(declare-fun lt!71904 () Bool)

(assert (=> d!43043 (= lt!71906 lt!71904)))

(declare-fun lt!71907 () Unit!4275)

(declare-fun e!89448 () Unit!4275)

(assert (=> d!43043 (= lt!71907 e!89448)))

(declare-fun c!25779 () Bool)

(assert (=> d!43043 (= c!25779 lt!71904)))

(assert (=> d!43043 (= lt!71904 (containsKey!177 (toList!873 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336))) lt!71333))))

(assert (=> d!43043 (= (contains!905 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336)) lt!71333) lt!71906)))

(declare-fun b!137416 () Bool)

(declare-fun lt!71905 () Unit!4275)

(assert (=> b!137416 (= e!89448 lt!71905)))

(assert (=> b!137416 (= lt!71905 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336))) lt!71333))))

(assert (=> b!137416 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336))) lt!71333))))

(declare-fun b!137417 () Bool)

(declare-fun Unit!4331 () Unit!4275)

(assert (=> b!137417 (= e!89448 Unit!4331)))

(declare-fun b!137418 () Bool)

(assert (=> b!137418 (= e!89447 (isDefined!126 (getValueByKey!173 (toList!873 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336))) lt!71333)))))

(assert (= (and d!43043 c!25779) b!137416))

(assert (= (and d!43043 (not c!25779)) b!137417))

(assert (= (and d!43043 (not res!65882)) b!137418))

(declare-fun m!164353 () Bool)

(assert (=> d!43043 m!164353))

(declare-fun m!164355 () Bool)

(assert (=> b!137416 m!164355))

(declare-fun m!164357 () Bool)

(assert (=> b!137416 m!164357))

(assert (=> b!137416 m!164357))

(declare-fun m!164359 () Bool)

(assert (=> b!137416 m!164359))

(assert (=> b!137418 m!164357))

(assert (=> b!137418 m!164357))

(assert (=> b!137418 m!164359))

(assert (=> b!136473 d!43043))

(declare-fun d!43045 () Bool)

(assert (=> d!43045 (not (contains!905 (+!176 lt!71334 (tuple2!2643 lt!71337 lt!71336)) lt!71333))))

(declare-fun lt!71910 () Unit!4275)

(declare-fun choose!843 (ListLongMap!1715 (_ BitVec 64) V!3499 (_ BitVec 64)) Unit!4275)

(assert (=> d!43045 (= lt!71910 (choose!843 lt!71334 lt!71337 lt!71336 lt!71333))))

(declare-fun e!89451 () Bool)

(assert (=> d!43045 e!89451))

(declare-fun res!65885 () Bool)

(assert (=> d!43045 (=> (not res!65885) (not e!89451))))

(assert (=> d!43045 (= res!65885 (not (contains!905 lt!71334 lt!71333)))))

(assert (=> d!43045 (= (addStillNotContains!62 lt!71334 lt!71337 lt!71336 lt!71333) lt!71910)))

(declare-fun b!137422 () Bool)

(assert (=> b!137422 (= e!89451 (not (= lt!71337 lt!71333)))))

(assert (= (and d!43045 res!65885) b!137422))

(assert (=> d!43045 m!162593))

(assert (=> d!43045 m!162593))

(assert (=> d!43045 m!162595))

(declare-fun m!164361 () Bool)

(assert (=> d!43045 m!164361))

(declare-fun m!164363 () Bool)

(assert (=> d!43045 m!164363))

(assert (=> b!136473 d!43045))

(declare-fun d!43047 () Bool)

(declare-fun e!89452 () Bool)

(assert (=> d!43047 e!89452))

(declare-fun res!65887 () Bool)

(assert (=> d!43047 (=> (not res!65887) (not e!89452))))

(declare-fun lt!71913 () ListLongMap!1715)

(assert (=> d!43047 (= res!65887 (contains!905 lt!71913 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!71912 () List!1723)

(assert (=> d!43047 (= lt!71913 (ListLongMap!1716 lt!71912))))

(declare-fun lt!71911 () Unit!4275)

(declare-fun lt!71914 () Unit!4275)

(assert (=> d!43047 (= lt!71911 lt!71914)))

(assert (=> d!43047 (= (getValueByKey!173 lt!71912 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43047 (= lt!71914 (lemmaContainsTupThenGetReturnValue!88 lt!71912 (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43047 (= lt!71912 (insertStrictlySorted!91 (toList!873 call!15027) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!43047 (= (+!176 call!15027 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71913)))

(declare-fun b!137423 () Bool)

(declare-fun res!65886 () Bool)

(assert (=> b!137423 (=> (not res!65886) (not e!89452))))

(assert (=> b!137423 (= res!65886 (= (getValueByKey!173 (toList!873 lt!71913) (_1!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!178 (_2!1332 (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!137424 () Bool)

(assert (=> b!137424 (= e!89452 (contains!907 (toList!873 lt!71913) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!43047 res!65887) b!137423))

(assert (= (and b!137423 res!65886) b!137424))

(declare-fun m!164365 () Bool)

(assert (=> d!43047 m!164365))

(declare-fun m!164367 () Bool)

(assert (=> d!43047 m!164367))

(declare-fun m!164369 () Bool)

(assert (=> d!43047 m!164369))

(declare-fun m!164371 () Bool)

(assert (=> d!43047 m!164371))

(declare-fun m!164373 () Bool)

(assert (=> b!137423 m!164373))

(declare-fun m!164375 () Bool)

(assert (=> b!137424 m!164375))

(assert (=> b!136473 d!43047))

(declare-fun d!43049 () Bool)

(declare-fun e!89453 () Bool)

(assert (=> d!43049 e!89453))

(declare-fun res!65888 () Bool)

(assert (=> d!43049 (=> res!65888 e!89453)))

(declare-fun lt!71917 () Bool)

(assert (=> d!43049 (= res!65888 (not lt!71917))))

(declare-fun lt!71915 () Bool)

(assert (=> d!43049 (= lt!71917 lt!71915)))

(declare-fun lt!71918 () Unit!4275)

(declare-fun e!89454 () Unit!4275)

(assert (=> d!43049 (= lt!71918 e!89454)))

(declare-fun c!25780 () Bool)

(assert (=> d!43049 (= c!25780 lt!71915)))

(assert (=> d!43049 (= lt!71915 (containsKey!177 (toList!873 lt!71413) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!43049 (= (contains!905 lt!71413 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) lt!71917)))

(declare-fun b!137425 () Bool)

(declare-fun lt!71916 () Unit!4275)

(assert (=> b!137425 (= e!89454 lt!71916)))

(assert (=> b!137425 (= lt!71916 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71413) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!137425 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!137426 () Bool)

(declare-fun Unit!4332 () Unit!4275)

(assert (=> b!137426 (= e!89454 Unit!4332)))

(declare-fun b!137427 () Bool)

(assert (=> b!137427 (= e!89453 (isDefined!126 (getValueByKey!173 (toList!873 lt!71413) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!43049 c!25780) b!137425))

(assert (= (and d!43049 (not c!25780)) b!137426))

(assert (= (and d!43049 (not res!65888)) b!137427))

(assert (=> d!43049 m!162327))

(declare-fun m!164377 () Bool)

(assert (=> d!43049 m!164377))

(assert (=> b!137425 m!162327))

(declare-fun m!164379 () Bool)

(assert (=> b!137425 m!164379))

(assert (=> b!137425 m!162327))

(assert (=> b!137425 m!164159))

(assert (=> b!137425 m!164159))

(declare-fun m!164381 () Bool)

(assert (=> b!137425 m!164381))

(assert (=> b!137427 m!162327))

(assert (=> b!137427 m!164159))

(assert (=> b!137427 m!164159))

(assert (=> b!137427 m!164381))

(assert (=> b!136606 d!43049))

(declare-fun b!137428 () Bool)

(declare-fun e!89456 () (_ BitVec 32))

(declare-fun e!89455 () (_ BitVec 32))

(assert (=> b!137428 (= e!89456 e!89455)))

(declare-fun c!25781 () Bool)

(assert (=> b!137428 (= c!25781 (validKeyInArray!0 (select (arr!2273 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(declare-fun b!137429 () Bool)

(declare-fun call!15144 () (_ BitVec 32))

(assert (=> b!137429 (= e!89455 call!15144)))

(declare-fun b!137430 () Bool)

(assert (=> b!137430 (= e!89456 #b00000000000000000000000000000000)))

(declare-fun bm!15141 () Bool)

(assert (=> bm!15141 (= call!15144 (arrayCountValidKeys!0 (_keys!4642 (_2!1333 lt!71054)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(declare-fun b!137431 () Bool)

(assert (=> b!137431 (= e!89455 (bvadd #b00000000000000000000000000000001 call!15144))))

(declare-fun d!43051 () Bool)

(declare-fun lt!71919 () (_ BitVec 32))

(assert (=> d!43051 (and (bvsge lt!71919 #b00000000000000000000000000000000) (bvsle lt!71919 (bvsub (size!2543 (_keys!4642 (_2!1333 lt!71054))) #b00000000000000000000000000000000)))))

(assert (=> d!43051 (= lt!71919 e!89456)))

(declare-fun c!25782 () Bool)

(assert (=> d!43051 (= c!25782 (bvsge #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (=> d!43051 (and (bvsle #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2543 (_keys!4642 (_2!1333 lt!71054))) (size!2543 (_keys!4642 (_2!1333 lt!71054)))))))

(assert (=> d!43051 (= (arrayCountValidKeys!0 (_keys!4642 (_2!1333 lt!71054)) #b00000000000000000000000000000000 (size!2543 (_keys!4642 (_2!1333 lt!71054)))) lt!71919)))

(assert (= (and d!43051 c!25782) b!137430))

(assert (= (and d!43051 (not c!25782)) b!137428))

(assert (= (and b!137428 c!25781) b!137431))

(assert (= (and b!137428 (not c!25781)) b!137429))

(assert (= (or b!137431 b!137429) bm!15141))

(assert (=> b!137428 m!163169))

(assert (=> b!137428 m!163169))

(assert (=> b!137428 m!163179))

(declare-fun m!164383 () Bool)

(assert (=> bm!15141 m!164383))

(assert (=> b!136587 d!43051))

(declare-fun d!43053 () Bool)

(declare-fun lt!71922 () Bool)

(declare-fun content!135 (List!1725) (InoxSet (_ BitVec 64)))

(assert (=> d!43053 (= lt!71922 (select (content!135 Nil!1722) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!89461 () Bool)

(assert (=> d!43053 (= lt!71922 e!89461)))

(declare-fun res!65894 () Bool)

(assert (=> d!43053 (=> (not res!65894) (not e!89461))))

(assert (=> d!43053 (= res!65894 ((_ is Cons!1721) Nil!1722))))

(assert (=> d!43053 (= (contains!908 Nil!1722 (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)) lt!71922)))

(declare-fun b!137436 () Bool)

(declare-fun e!89462 () Bool)

(assert (=> b!137436 (= e!89461 e!89462)))

(declare-fun res!65893 () Bool)

(assert (=> b!137436 (=> res!65893 e!89462)))

(assert (=> b!137436 (= res!65893 (= (h!2327 Nil!1722) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!137437 () Bool)

(assert (=> b!137437 (= e!89462 (contains!908 (t!6217 Nil!1722) (select (arr!2273 (_keys!4642 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!43053 res!65894) b!137436))

(assert (= (and b!137436 (not res!65893)) b!137437))

(declare-fun m!164385 () Bool)

(assert (=> d!43053 m!164385))

(assert (=> d!43053 m!162327))

(declare-fun m!164387 () Bool)

(assert (=> d!43053 m!164387))

(assert (=> b!137437 m!162327))

(declare-fun m!164389 () Bool)

(assert (=> b!137437 m!164389))

(assert (=> b!136582 d!43053))

(declare-fun d!43055 () Bool)

(assert (=> d!43055 (= (get!1497 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3225 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42479 d!43055))

(assert (=> d!42479 d!42809))

(declare-fun lt!71923 () Bool)

(declare-fun d!43057 () Bool)

(assert (=> d!43057 (= lt!71923 (select (content!134 (toList!873 lt!71393)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!89464 () Bool)

(assert (=> d!43057 (= lt!71923 e!89464)))

(declare-fun res!65896 () Bool)

(assert (=> d!43057 (=> (not res!65896) (not e!89464))))

(assert (=> d!43057 (= res!65896 ((_ is Cons!1719) (toList!873 lt!71393)))))

(assert (=> d!43057 (= (contains!907 (toList!873 lt!71393) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!71923)))

(declare-fun b!137438 () Bool)

(declare-fun e!89463 () Bool)

(assert (=> b!137438 (= e!89464 e!89463)))

(declare-fun res!65895 () Bool)

(assert (=> b!137438 (=> res!65895 e!89463)))

(assert (=> b!137438 (= res!65895 (= (h!2325 (toList!873 lt!71393)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!137439 () Bool)

(assert (=> b!137439 (= e!89463 (contains!907 (t!6211 (toList!873 lt!71393)) (tuple2!2643 (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355) (get!1493 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) from!355) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!43057 res!65896) b!137438))

(assert (= (and b!137438 (not res!65895)) b!137439))

(declare-fun m!164391 () Bool)

(assert (=> d!43057 m!164391))

(declare-fun m!164393 () Bool)

(assert (=> d!43057 m!164393))

(declare-fun m!164395 () Bool)

(assert (=> b!137439 m!164395))

(assert (=> b!136591 d!43057))

(declare-fun d!43059 () Bool)

(assert (=> d!43059 (= (apply!117 lt!71143 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1497 (getValueByKey!173 (toList!873 lt!71143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5772 () Bool)

(assert (= bs!5772 d!43059))

(assert (=> bs!5772 m!164245))

(assert (=> bs!5772 m!164245))

(declare-fun m!164397 () Bool)

(assert (=> bs!5772 m!164397))

(assert (=> b!136298 d!43059))

(declare-fun d!43061 () Bool)

(assert (=> d!43061 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!71924 () Unit!4275)

(assert (=> d!43061 (= lt!71924 (choose!833 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!89465 () Bool)

(assert (=> d!43061 e!89465))

(declare-fun res!65897 () Bool)

(assert (=> d!43061 (=> (not res!65897) (not e!89465))))

(assert (=> d!43061 (= res!65897 (isStrictlySorted!323 (toList!873 lt!71115)))))

(assert (=> d!43061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!71924)))

(declare-fun b!137440 () Bool)

(assert (=> b!137440 (= e!89465 (containsKey!177 (toList!873 lt!71115) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!43061 res!65897) b!137440))

(assert (=> d!43061 m!162243))

(assert (=> d!43061 m!162553))

(assert (=> d!43061 m!162553))

(assert (=> d!43061 m!162699))

(assert (=> d!43061 m!162243))

(declare-fun m!164399 () Bool)

(assert (=> d!43061 m!164399))

(assert (=> d!43061 m!163593))

(assert (=> b!137440 m!162243))

(assert (=> b!137440 m!162695))

(assert (=> b!136498 d!43061))

(assert (=> b!136498 d!42781))

(assert (=> b!136498 d!42783))

(declare-fun d!43063 () Bool)

(declare-fun e!89466 () Bool)

(assert (=> d!43063 e!89466))

(declare-fun res!65898 () Bool)

(assert (=> d!43063 (=> res!65898 e!89466)))

(declare-fun lt!71927 () Bool)

(assert (=> d!43063 (= res!65898 (not lt!71927))))

(declare-fun lt!71925 () Bool)

(assert (=> d!43063 (= lt!71927 lt!71925)))

(declare-fun lt!71928 () Unit!4275)

(declare-fun e!89467 () Unit!4275)

(assert (=> d!43063 (= lt!71928 e!89467)))

(declare-fun c!25783 () Bool)

(assert (=> d!43063 (= c!25783 lt!71925)))

(assert (=> d!43063 (= lt!71925 (containsKey!177 (toList!873 lt!71331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!43063 (= (contains!905 lt!71331 #b1000000000000000000000000000000000000000000000000000000000000000) lt!71927)))

(declare-fun b!137441 () Bool)

(declare-fun lt!71926 () Unit!4275)

(assert (=> b!137441 (= e!89467 lt!71926)))

(assert (=> b!137441 (= lt!71926 (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!137441 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!137442 () Bool)

(declare-fun Unit!4333 () Unit!4275)

(assert (=> b!137442 (= e!89467 Unit!4333)))

(declare-fun b!137443 () Bool)

(assert (=> b!137443 (= e!89466 (isDefined!126 (getValueByKey!173 (toList!873 lt!71331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43063 c!25783) b!137441))

(assert (= (and d!43063 (not c!25783)) b!137442))

(assert (= (and d!43063 (not res!65898)) b!137443))

(declare-fun m!164401 () Bool)

(assert (=> d!43063 m!164401))

(declare-fun m!164403 () Bool)

(assert (=> b!137441 m!164403))

(declare-fun m!164405 () Bool)

(assert (=> b!137441 m!164405))

(assert (=> b!137441 m!164405))

(declare-fun m!164407 () Bool)

(assert (=> b!137441 m!164407))

(assert (=> b!137443 m!164405))

(assert (=> b!137443 m!164405))

(assert (=> b!137443 m!164407))

(assert (=> b!136469 d!43063))

(declare-fun d!43065 () Bool)

(assert (=> d!43065 (isDefined!126 (getValueByKey!173 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun lt!71929 () Unit!4275)

(assert (=> d!43065 (= lt!71929 (choose!833 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!89468 () Bool)

(assert (=> d!43065 e!89468))

(declare-fun res!65899 () Bool)

(assert (=> d!43065 (=> (not res!65899) (not e!89468))))

(assert (=> d!43065 (= res!65899 (isStrictlySorted!323 (toList!873 call!14968)))))

(assert (=> d!43065 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71929)))

(declare-fun b!137444 () Bool)

(assert (=> b!137444 (= e!89468 (containsKey!177 (toList!873 call!14968) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!43065 res!65899) b!137444))

(assert (=> d!43065 m!162081))

(assert (=> d!43065 m!162691))

(assert (=> d!43065 m!162691))

(assert (=> d!43065 m!162693))

(assert (=> d!43065 m!162081))

(declare-fun m!164409 () Bool)

(assert (=> d!43065 m!164409))

(declare-fun m!164411 () Bool)

(assert (=> d!43065 m!164411))

(assert (=> b!137444 m!162081))

(assert (=> b!137444 m!162687))

(assert (=> b!136495 d!43065))

(assert (=> b!136495 d!42787))

(assert (=> b!136495 d!42789))

(declare-fun d!43067 () Bool)

(assert (=> d!43067 (isDefined!126 (getValueByKey!173 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!71930 () Unit!4275)

(assert (=> d!43067 (= lt!71930 (choose!833 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!89469 () Bool)

(assert (=> d!43067 e!89469))

(declare-fun res!65900 () Bool)

(assert (=> d!43067 (=> (not res!65900) (not e!89469))))

(assert (=> d!43067 (= res!65900 (isStrictlySorted!323 (toList!873 lt!71115)))))

(assert (=> d!43067 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000) lt!71930)))

(declare-fun b!137445 () Bool)

(assert (=> b!137445 (= e!89469 (containsKey!177 (toList!873 lt!71115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!43067 res!65900) b!137445))

(assert (=> d!43067 m!162377))

(assert (=> d!43067 m!162377))

(assert (=> d!43067 m!162379))

(declare-fun m!164413 () Bool)

(assert (=> d!43067 m!164413))

(assert (=> d!43067 m!163593))

(assert (=> b!137445 m!162373))

(assert (=> b!136315 d!43067))

(assert (=> b!136315 d!42807))

(assert (=> b!136315 d!42809))

(declare-fun d!43069 () Bool)

(assert (=> d!43069 (contains!905 (getCurrentListMap!549 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2889 newMap!16)) (select (arr!2273 (_keys!4642 newMap!16)) (index!3266 lt!71036)))))

(assert (=> d!43069 true))

(declare-fun _$16!155 () Unit!4275)

(assert (=> d!43069 (= (choose!831 (_keys!4642 newMap!16) lt!71040 (mask!7203 newMap!16) (extraKeys!2650 newMap!16) (zeroValue!2742 newMap!16) (minValue!2742 newMap!16) (index!3266 lt!71036) (defaultEntry!2889 newMap!16)) _$16!155)))

(declare-fun bs!5773 () Bool)

(assert (= bs!5773 d!43069))

(assert (=> bs!5773 m!162299))

(assert (=> bs!5773 m!162185))

(assert (=> bs!5773 m!162299))

(assert (=> bs!5773 m!162185))

(assert (=> bs!5773 m!162301))

(assert (=> d!42455 d!43069))

(assert (=> d!42455 d!42589))

(declare-fun d!43071 () Bool)

(assert (=> d!43071 (= (get!1495 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!429 (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3220 (select (arr!2274 (_values!2872 (v!3221 (underlying!460 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!136437 d!43071))

(declare-fun d!43073 () Bool)

(assert (=> d!43073 (isDefined!126 (getValueByKey!173 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun lt!71931 () Unit!4275)

(assert (=> d!43073 (= lt!71931 (choose!833 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(declare-fun e!89470 () Bool)

(assert (=> d!43073 e!89470))

(declare-fun res!65901 () Bool)

(assert (=> d!43073 (=> (not res!65901) (not e!89470))))

(assert (=> d!43073 (= res!65901 (isStrictlySorted!323 (toList!873 call!14970)))))

(assert (=> d!43073 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!125 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)) lt!71931)))

(declare-fun b!137446 () Bool)

(assert (=> b!137446 (= e!89470 (containsKey!177 (toList!873 call!14970) (select (arr!2273 (_keys!4642 (v!3221 (underlying!460 thiss!992)))) from!355)))))

(assert (= (and d!43073 res!65901) b!137446))

(assert (=> d!43073 m!162081))

(assert (=> d!43073 m!162369))

(assert (=> d!43073 m!162369))

(assert (=> d!43073 m!162371))

(assert (=> d!43073 m!162081))

(declare-fun m!164415 () Bool)

(assert (=> d!43073 m!164415))

(declare-fun m!164417 () Bool)

(assert (=> d!43073 m!164417))

(assert (=> b!137446 m!162081))

(assert (=> b!137446 m!162365))

(assert (=> b!136312 d!43073))

(assert (=> b!136312 d!42813))

(assert (=> b!136312 d!42815))

(declare-fun d!43075 () Bool)

(declare-fun lt!71932 () Bool)

(assert (=> d!43075 (= lt!71932 (select (content!134 (toList!873 lt!71344)) (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun e!89472 () Bool)

(assert (=> d!43075 (= lt!71932 e!89472)))

(declare-fun res!65903 () Bool)

(assert (=> d!43075 (=> (not res!65903) (not e!89472))))

(assert (=> d!43075 (= res!65903 ((_ is Cons!1719) (toList!873 lt!71344)))))

(assert (=> d!43075 (= (contains!907 (toList!873 lt!71344) (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))) lt!71932)))

(declare-fun b!137447 () Bool)

(declare-fun e!89471 () Bool)

(assert (=> b!137447 (= e!89472 e!89471)))

(declare-fun res!65902 () Bool)

(assert (=> b!137447 (=> res!65902 e!89471)))

(assert (=> b!137447 (= res!65902 (= (h!2325 (toList!873 lt!71344)) (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(declare-fun b!137448 () Bool)

(assert (=> b!137448 (= e!89471 (contains!907 (t!6211 (toList!873 lt!71344)) (tuple2!2643 lt!71117 (minValue!2742 (v!3221 (underlying!460 thiss!992))))))))

(assert (= (and d!43075 res!65903) b!137447))

(assert (= (and b!137447 (not res!65902)) b!137448))

(declare-fun m!164419 () Bool)

(assert (=> d!43075 m!164419))

(declare-fun m!164421 () Bool)

(assert (=> d!43075 m!164421))

(declare-fun m!164423 () Bool)

(assert (=> b!137448 m!164423))

(assert (=> b!136483 d!43075))

(declare-fun b!137450 () Bool)

(declare-fun e!89473 () Bool)

(assert (=> b!137450 (= e!89473 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4703 () Bool)

(declare-fun mapRes!4703 () Bool)

(declare-fun tp!11309 () Bool)

(declare-fun e!89474 () Bool)

(assert (=> mapNonEmpty!4703 (= mapRes!4703 (and tp!11309 e!89474))))

(declare-fun mapValue!4703 () ValueCell!1101)

(declare-fun mapKey!4703 () (_ BitVec 32))

(declare-fun mapRest!4703 () (Array (_ BitVec 32) ValueCell!1101))

(assert (=> mapNonEmpty!4703 (= mapRest!4702 (store mapRest!4703 mapKey!4703 mapValue!4703))))

(declare-fun b!137449 () Bool)

(assert (=> b!137449 (= e!89474 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4703 () Bool)

(assert (=> mapIsEmpty!4703 mapRes!4703))

(declare-fun condMapEmpty!4703 () Bool)

(declare-fun mapDefault!4703 () ValueCell!1101)

(assert (=> mapNonEmpty!4702 (= condMapEmpty!4703 (= mapRest!4702 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4703)))))

(assert (=> mapNonEmpty!4702 (= tp!11308 (and e!89473 mapRes!4703))))

(assert (= (and mapNonEmpty!4702 condMapEmpty!4703) mapIsEmpty!4703))

(assert (= (and mapNonEmpty!4702 (not condMapEmpty!4703)) mapNonEmpty!4703))

(assert (= (and mapNonEmpty!4703 ((_ is ValueCellFull!1101) mapValue!4703)) b!137449))

(assert (= (and mapNonEmpty!4702 ((_ is ValueCellFull!1101) mapDefault!4703)) b!137450))

(declare-fun m!164425 () Bool)

(assert (=> mapNonEmpty!4703 m!164425))

(declare-fun b!137452 () Bool)

(declare-fun e!89475 () Bool)

(assert (=> b!137452 (= e!89475 tp_is_empty!2889)))

(declare-fun mapNonEmpty!4704 () Bool)

(declare-fun mapRes!4704 () Bool)

(declare-fun tp!11310 () Bool)

(declare-fun e!89476 () Bool)

(assert (=> mapNonEmpty!4704 (= mapRes!4704 (and tp!11310 e!89476))))

(declare-fun mapValue!4704 () ValueCell!1101)

(declare-fun mapRest!4704 () (Array (_ BitVec 32) ValueCell!1101))

(declare-fun mapKey!4704 () (_ BitVec 32))

(assert (=> mapNonEmpty!4704 (= mapRest!4701 (store mapRest!4704 mapKey!4704 mapValue!4704))))

(declare-fun b!137451 () Bool)

(assert (=> b!137451 (= e!89476 tp_is_empty!2889)))

(declare-fun mapIsEmpty!4704 () Bool)

(assert (=> mapIsEmpty!4704 mapRes!4704))

(declare-fun condMapEmpty!4704 () Bool)

(declare-fun mapDefault!4704 () ValueCell!1101)

(assert (=> mapNonEmpty!4701 (= condMapEmpty!4704 (= mapRest!4701 ((as const (Array (_ BitVec 32) ValueCell!1101)) mapDefault!4704)))))

(assert (=> mapNonEmpty!4701 (= tp!11307 (and e!89475 mapRes!4704))))

(assert (= (and mapNonEmpty!4701 condMapEmpty!4704) mapIsEmpty!4704))

(assert (= (and mapNonEmpty!4701 (not condMapEmpty!4704)) mapNonEmpty!4704))

(assert (= (and mapNonEmpty!4704 ((_ is ValueCellFull!1101) mapValue!4704)) b!137451))

(assert (= (and mapNonEmpty!4701 ((_ is ValueCellFull!1101) mapDefault!4704)) b!137452))

(declare-fun m!164427 () Bool)

(assert (=> mapNonEmpty!4704 m!164427))

(declare-fun b_lambda!6131 () Bool)

(assert (= b_lambda!6115 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6131)))

(declare-fun b_lambda!6133 () Bool)

(assert (= b_lambda!6103 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6133)))

(declare-fun b_lambda!6135 () Bool)

(assert (= b_lambda!6109 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6135)))

(declare-fun b_lambda!6137 () Bool)

(assert (= b_lambda!6107 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6137)))

(declare-fun b_lambda!6139 () Bool)

(assert (= b_lambda!6113 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6139)))

(declare-fun b_lambda!6141 () Bool)

(assert (= b_lambda!6119 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6141)))

(declare-fun b_lambda!6143 () Bool)

(assert (= b_lambda!6117 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6143)))

(declare-fun b_lambda!6145 () Bool)

(assert (= b_lambda!6127 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6145)))

(declare-fun b_lambda!6147 () Bool)

(assert (= b_lambda!6121 (or (and b!136004 b_free!2945) (and b!136009 b_free!2947 (= (defaultEntry!2889 newMap!16) (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))))) b_lambda!6147)))

(declare-fun b_lambda!6149 () Bool)

(assert (= b_lambda!6125 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6149)))

(declare-fun b_lambda!6151 () Bool)

(assert (= b_lambda!6105 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6151)))

(declare-fun b_lambda!6153 () Bool)

(assert (= b_lambda!6129 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6153)))

(declare-fun b_lambda!6155 () Bool)

(assert (= b_lambda!6111 (or (and b!136004 b_free!2945 (= (defaultEntry!2889 (v!3221 (underlying!460 thiss!992))) (defaultEntry!2889 newMap!16))) (and b!136009 b_free!2947) b_lambda!6155)))

(check-sat (not b!137139) (not b!137205) (not b!137346) (not b!137006) (not b_lambda!6097) (not b!137015) (not d!42921) (not d!42657) (not d!42965) (not b!136653) (not d!42825) (not b!137169) (not d!42599) (not d!42821) (not d!42597) (not b!136957) (not b!137170) (not d!42705) (not d!42735) (not b!137305) (not b!136830) (not b!136864) (not b!136711) (not d!42701) (not b!137309) (not b!137106) (not b!136678) (not b!136862) (not b!136655) (not b!137198) (not b!136868) (not bm!15123) (not b!137403) (not b!137268) (not b!137392) (not d!42955) (not b!136992) (not d!42685) (not d!42989) (not d!42915) (not b!136774) (not b!137367) (not bm!15053) b_and!8513 (not d!42681) (not d!42677) (not d!42919) (not bm!15132) (not d!42711) (not d!43005) (not b!136671) (not d!42933) (not b!136890) (not d!43003) (not mapNonEmpty!4703) (not bm!15139) (not b!137208) (not b!137244) (not b_lambda!6123) (not d!43039) (not b!136881) (not b!137250) (not d!42899) (not b_lambda!6077) (not b!136991) (not b_lambda!6081) (not d!42631) (not b!137428) (not b!136878) (not b!136870) (not d!42745) (not b!137153) (not b!137234) (not b!137146) (not d!42697) (not bm!15064) (not b!137384) (not d!42999) (not d!42873) (not d!42721) (not b!137277) (not d!42761) (not b!136726) (not d!42889) (not b!136637) (not b!136706) (not b!136724) (not d!43049) (not d!42867) (not d!42851) (not b!137083) (not b!137330) (not b!136894) (not b!136663) (not d!42907) (not bm!15057) (not d!42865) (not d!42713) (not b!136950) (not b_lambda!6155) (not d!42807) (not b!137001) (not b!136876) (not b!137014) (not d!42587) (not d!42693) (not bm!15135) (not b!137100) (not b!136787) (not b!136848) (not d!42757) (not b!137418) (not d!42785) (not d!42671) (not d!42575) (not d!42843) (not b!136945) (not bm!15094) (not b!137114) tp_is_empty!2889 (not bm!15066) (not b!136813) (not b!137173) (not b!137026) (not d!42741) (not b!137398) (not b!137129) (not d!43047) (not b_lambda!6139) (not d!42625) (not b!136860) (not d!42967) (not b!137415) (not d!42659) (not d!42871) (not b!137424) (not d!43033) (not d!42787) (not d!42689) (not b!137286) (not b!136931) (not b!136822) (not b_lambda!6143) (not b!136685) (not b_lambda!6131) (not b!137371) (not b!137443) (not d!42707) (not b!137128) (not b_lambda!6153) (not d!42683) (not bm!15117) (not d!42615) (not b!137333) (not b!137279) (not b!137338) (not b!136766) (not bm!15047) (not b!137323) (not b!137073) (not b!137017) (not b!136814) (not b!137200) (not d!43043) (not d!42791) (not b!136983) (not b!137003) (not b!137351) (not b!136978) (not d!42591) (not b_lambda!6141) (not b!137284) (not d!42679) (not b_lambda!6145) (not d!42959) (not b!137344) (not b!137164) (not b!137147) (not b!136643) (not b!136828) (not b!137075) (not bm!15095) (not bm!15140) b_and!8511 (not b!137425) (not d!42845) (not d!42905) (not b!136942) (not b!136929) (not bm!15129) (not b!137127) (not b!137314) (not b!137253) (not b!136829) (not b!137365) (not d!42861) (not b!136736) (not d!42981) (not b!137202) (not d!43069) (not bm!15052) (not b!137267) (not b!137087) (not bm!15105) (not d!42929) (not d!42649) (not b!137383) (not d!42605) (not b!136922) (not bm!15050) (not bm!15076) (not d!42835) (not b!137122) (not b!136781) (not bm!15078) (not d!42859) (not bm!15141) (not mapNonEmpty!4704) (not b!136846) (not b!137441) (not b!137325) (not d!42931) (not b!136686) (not b!136768) (not b!137413) (not b!137190) (not d!42647) (not b!136990) (not bm!15051) (not b!136854) (not b!137359) (not b!136659) (not b!136875) (not b!137444) (not b!136974) (not b!136709) (not b!137184) (not b!136967) (not b!137353) (not bm!15075) (not b!137260) (not b!136824) (not b!137034) (not b!136717) (not b!136921) (not d!42781) (not d!43041) (not d!42611) (not d!42927) (not b!136973) (not b!137131) (not b!137448) (not b!137397) (not d!42917) (not b!136879) (not b!137071) (not b!137376) (not b!137266) (not d!42857) (not d!42775) (not d!42753) (not b!136732) (not b!136692) (not b!136740) (not b!136752) (not b!136943) (not b!136710) (not b!136954) (not b!137374) (not b!136691) (not d!42817) (not b_lambda!6149) (not b_lambda!6135) (not b!137130) (not b!137119) (not b_lambda!6101) (not d!42661) (not b!137207) (not b!137389) (not bm!15060) (not b!137362) (not d!43015) (not d!42755) (not b!136895) (not d!42613) (not d!42869) (not b!136856) (not d!42839) (not d!42895) (not b!136969) (not b!136837) (not d!42847) (not bm!15099) (not d!42983) (not bm!15115) (not b!137066) (not d!42643) (not b_lambda!6147) (not d!42891) (not b!136962) (not b!136985) (not b!136851) (not b!136707) (not d!42909) (not d!43075) (not d!42855) (not b!136964) (not b!136952) (not d!43057) (not b!137445) (not d!42747) (not b!137117) (not d!43063) (not b!136897) (not b!137311) (not b!137317) (not b!136863) (not b!136672) (not b!137272) (not b_lambda!6093) (not bm!15109) (not d!42875) (not d!42729) (not b!136849) (not b!137373) (not d!42759) (not b!137125) (not b!137400) (not b_next!2947) (not b!137238) (not bm!15083) (not b!137248) (not b!136745) (not b!137186) (not bm!15049) (not b!137144) (not b!136757) (not b!137408) (not b!137390) (not b!136769) (not bm!15113) (not d!43037) (not b!137407) (not b!136823) (not b!137414) (not d!42737) (not d!42963) (not d!43021) (not b!136654) (not d!43031) (not b!137334) (not d!42829) (not b!136641) (not d!42619) (not b!137191) (not b!137369) (not b!136972) (not bm!15127) (not d!42733) (not b!136778) (not d!43073) (not d!42699) (not b!136858) (not b!137192) (not d!42961) (not d!42939) (not d!42803) (not b!137031) (not b!136652) (not b!137360) (not bm!15122) (not d!42627) (not d!42893) (not b!136753) (not b!137254) (not b!136645) (not b!137378) (not b!136987) (not d!43023) (not b!136996) (not b_lambda!6095) (not b!137166) (not bm!15059) (not b!137095) (not b!137008) (not b!137121) (not b_lambda!6151) (not d!42573) (not b!136820) (not b!136924) (not b!137009) (not b!137396) (not d!42811) (not d!42813) (not b!136697) (not bm!15116) (not b!136695) (not b!137029) (not b!136775) (not b!136634) (not b!137112) (not b!137291) (not b!136892) (not b!136853) (not d!42695) (not b!137161) (not b!137437) (not d!42853) (not bm!15084) (not b!137316) (not d!42849) (not b!137411) (not d!42993) (not d!42863) (not b!137302) (not b!137354) (not bm!15082) (not b!136776) (not d!42833) (not b!137098) (not b!136887) (not b!136834) (not d!43067) (not d!42887) (not b!136986) (not b_next!2945) (not b!137296) (not b_lambda!6099) (not d!42581) (not b!136980) (not d!42629) (not b!137301) (not b!136960) (not b!137196) (not b!137274) (not b!136825) (not b!137262) (not b!137341) (not d!43007) (not d!42601) (not b!136843) (not d!42585) (not b!136772) (not b!137076) (not bm!15093) (not d!42709) (not bm!15087) (not b!136936) (not b!137290) (not b!136816) (not b!137105) (not b!137167) (not b!136859) (not d!42923) (not b!136658) (not b!136835) (not d!42691) (not b!136788) (not b!136988) (not d!42715) (not d!42687) (not b!136632) (not bm!15081) (not d!42673) (not bm!15077) (not b!136850) (not d!43025) (not bm!15054) (not b!137348) (not b!137416) (not bm!15136) (not b!137405) (not b!136713) (not d!42883) (not d!43019) (not b!136731) (not bm!15061) (not b!137402) (not b!137028) (not b!137093) (not b!137276) (not bm!15108) (not b!137168) (not d!42763) (not b!137255) (not b!136761) (not b!136955) (not d!42937) (not b!136670) (not b!137440) (not d!43045) (not b!137124) (not d!42977) (not b!136759) (not d!42767) (not b!137089) (not d!42795) (not b!136965) (not b!137423) (not b!136694) (not bm!15088) (not d!42617) (not b!137381) (not b!137081) (not b_lambda!6133) (not d!42903) (not b!136650) (not b!136934) (not d!42805) (not b!137251) (not b!136664) (not b!136999) (not b!137298) (not b!137179) (not b!136657) (not bm!15110) (not b!137159) (not d!42969) (not d!43059) (not b_lambda!6137) (not b!136857) (not d!42749) (not bm!15096) (not d!43035) (not d!42957) (not b!136738) (not bm!15048) (not b!137141) (not d!42675) (not d!42901) (not bm!15124) (not b!137152) (not b!137322) (not d!42723) (not b!136968) (not b!136918) (not d!43053) (not d!42797) (not b!136718) (not b!136747) (not b!137020) (not b!137300) (not b!136666) (not d!42913) (not b!136675) (not d!42841) (not b!136958) (not b!136679) (not b!136826) (not b!136913) (not b!137446) (not b!136751) (not bm!15104) (not b!137040) (not b!136923) (not b!137155) (not b!137111) (not b!136927) (not b!136712) (not d!42819) (not b!137137) (not b!136730) (not b!137439) (not b!137067) (not bm!15101) (not d!42777) (not b!137165) (not b!137037) (not b!137201) (not b!137103) (not b!137427) (not d!43061) (not b!137241) (not d!42827) (not b!136845) (not bm!15120) (not b!136869) (not b!136665) (not d!42911) (not b!137030) (not d!42897) (not b!136920) (not b!137097) (not b!136852) (not d!42719) (not b!137308) (not b!137171) (not b!137410) (not b!137088) (not d!43065) (not d!42639) (not b!137292) (not b!137068) (not b!136937))
(check-sat b_and!8511 b_and!8513 (not b_next!2945) (not b_next!2947))
