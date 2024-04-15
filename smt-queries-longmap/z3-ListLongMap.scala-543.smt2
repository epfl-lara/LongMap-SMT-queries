; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14180 () Bool)

(assert start!14180)

(declare-fun b!131609 () Bool)

(declare-fun b_free!2905 () Bool)

(declare-fun b_next!2905 () Bool)

(assert (=> b!131609 (= b_free!2905 (not b_next!2905))))

(declare-fun tp!11153 () Bool)

(declare-fun b_and!8133 () Bool)

(assert (=> b!131609 (= tp!11153 b_and!8133)))

(declare-fun b!131600 () Bool)

(declare-fun b_free!2907 () Bool)

(declare-fun b_next!2907 () Bool)

(assert (=> b!131600 (= b_free!2907 (not b_next!2907))))

(declare-fun tp!11152 () Bool)

(declare-fun b_and!8135 () Bool)

(assert (=> b!131600 (= tp!11152 b_and!8135)))

(declare-fun b!131592 () Bool)

(declare-fun e!85802 () Bool)

(declare-fun e!85811 () Bool)

(declare-fun mapRes!4613 () Bool)

(assert (=> b!131592 (= e!85802 (and e!85811 mapRes!4613))))

(declare-fun condMapEmpty!4614 () Bool)

(declare-datatypes ((V!3473 0))(
  ( (V!3474 (val!1479 Int)) )
))
(declare-datatypes ((array!4743 0))(
  ( (array!4744 (arr!2242 (Array (_ BitVec 32) (_ BitVec 64))) (size!2511 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1091 0))(
  ( (ValueCellFull!1091 (v!3179 V!3473)) (EmptyCell!1091) )
))
(declare-datatypes ((array!4745 0))(
  ( (array!4746 (arr!2243 (Array (_ BitVec 32) ValueCell!1091)) (size!2512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1090 0))(
  ( (LongMapFixedSize!1091 (defaultEntry!2853 Int) (mask!7146 (_ BitVec 32)) (extraKeys!2620 (_ BitVec 32)) (zeroValue!2709 V!3473) (minValue!2709 V!3473) (_size!594 (_ BitVec 32)) (_keys!4599 array!4743) (_values!2836 array!4745) (_vacant!594 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!874 0))(
  ( (Cell!875 (v!3180 LongMapFixedSize!1090)) )
))
(declare-datatypes ((LongMap!874 0))(
  ( (LongMap!875 (underlying!448 Cell!874)) )
))
(declare-fun thiss!992 () LongMap!874)

(declare-fun mapDefault!4613 () ValueCell!1091)

(assert (=> b!131592 (= condMapEmpty!4614 (= (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4613)))))

(declare-fun b!131593 () Bool)

(declare-fun e!85808 () Bool)

(declare-fun e!85803 () Bool)

(assert (=> b!131593 (= e!85808 e!85803)))

(declare-fun b!131594 () Bool)

(declare-fun e!85805 () Bool)

(declare-fun e!85809 () Bool)

(assert (=> b!131594 (= e!85805 e!85809)))

(declare-fun res!63372 () Bool)

(assert (=> b!131594 (=> (not res!63372) (not e!85809))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2578 0))(
  ( (tuple2!2579 (_1!1300 (_ BitVec 64)) (_2!1300 V!3473)) )
))
(declare-datatypes ((List!1706 0))(
  ( (Nil!1703) (Cons!1702 (h!2307 tuple2!2578) (t!6132 List!1706)) )
))
(declare-datatypes ((ListLongMap!1667 0))(
  ( (ListLongMap!1668 (toList!849 List!1706)) )
))
(declare-fun lt!68502 () ListLongMap!1667)

(declare-fun lt!68501 () ListLongMap!1667)

(assert (=> b!131594 (= res!63372 (and (= lt!68502 lt!68501) (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1090)

(declare-fun map!1387 (LongMapFixedSize!1090) ListLongMap!1667)

(assert (=> b!131594 (= lt!68501 (map!1387 newMap!16))))

(declare-fun getCurrentListMap!517 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) ListLongMap!1667)

(assert (=> b!131594 (= lt!68502 (getCurrentListMap!517 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun mapIsEmpty!4613 () Bool)

(declare-fun mapRes!4614 () Bool)

(assert (=> mapIsEmpty!4613 mapRes!4614))

(declare-fun b!131595 () Bool)

(declare-fun res!63368 () Bool)

(declare-fun e!85804 () Bool)

(assert (=> b!131595 (=> (not res!63368) (not e!85804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!131595 (= res!63368 (validMask!0 (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!131596 () Bool)

(declare-fun e!85806 () Bool)

(declare-fun e!85812 () Bool)

(assert (=> b!131596 (= e!85806 (and e!85812 mapRes!4614))))

(declare-fun condMapEmpty!4613 () Bool)

(declare-fun mapDefault!4614 () ValueCell!1091)

(assert (=> b!131596 (= condMapEmpty!4613 (= (arr!2243 (_values!2836 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4614)))))

(declare-fun b!131597 () Bool)

(declare-fun res!63364 () Bool)

(assert (=> b!131597 (=> (not res!63364) (not e!85805))))

(declare-fun valid!525 (LongMapFixedSize!1090) Bool)

(assert (=> b!131597 (= res!63364 (valid!525 newMap!16))))

(declare-fun b!131598 () Bool)

(declare-fun e!85813 () Bool)

(assert (=> b!131598 (= e!85803 e!85813)))

(declare-fun b!131599 () Bool)

(declare-fun e!85816 () Bool)

(declare-fun tp_is_empty!2869 () Bool)

(assert (=> b!131599 (= e!85816 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4613 () Bool)

(declare-fun tp!11154 () Bool)

(declare-fun e!85807 () Bool)

(assert (=> mapNonEmpty!4613 (= mapRes!4613 (and tp!11154 e!85807))))

(declare-fun mapKey!4614 () (_ BitVec 32))

(declare-fun mapValue!4613 () ValueCell!1091)

(declare-fun mapRest!4613 () (Array (_ BitVec 32) ValueCell!1091))

(assert (=> mapNonEmpty!4613 (= (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (store mapRest!4613 mapKey!4614 mapValue!4613))))

(declare-fun e!85814 () Bool)

(declare-fun array_inv!1425 (array!4743) Bool)

(declare-fun array_inv!1426 (array!4745) Bool)

(assert (=> b!131600 (= e!85814 (and tp!11152 tp_is_empty!2869 (array_inv!1425 (_keys!4599 newMap!16)) (array_inv!1426 (_values!2836 newMap!16)) e!85806))))

(declare-fun b!131601 () Bool)

(assert (=> b!131601 (= e!85807 tp_is_empty!2869)))

(declare-fun mapIsEmpty!4614 () Bool)

(assert (=> mapIsEmpty!4614 mapRes!4613))

(declare-fun b!131602 () Bool)

(declare-fun res!63369 () Bool)

(assert (=> b!131602 (=> (not res!63369) (not e!85804))))

(assert (=> b!131602 (= res!63369 (and (= (size!2512 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7146 (v!3180 (underlying!448 thiss!992))))) (= (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (size!2512 (_values!2836 (v!3180 (underlying!448 thiss!992))))) (bvsge (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!131603 () Bool)

(declare-fun res!63365 () Bool)

(assert (=> b!131603 (=> (not res!63365) (not e!85805))))

(assert (=> b!131603 (= res!63365 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun mapNonEmpty!4614 () Bool)

(declare-fun tp!11151 () Bool)

(assert (=> mapNonEmpty!4614 (= mapRes!4614 (and tp!11151 e!85816))))

(declare-fun mapValue!4614 () ValueCell!1091)

(declare-fun mapRest!4614 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapKey!4613 () (_ BitVec 32))

(assert (=> mapNonEmpty!4614 (= (arr!2243 (_values!2836 newMap!16)) (store mapRest!4614 mapKey!4613 mapValue!4614))))

(declare-fun b!131604 () Bool)

(declare-fun res!63366 () Bool)

(assert (=> b!131604 (=> (not res!63366) (not e!85804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4743 (_ BitVec 32)) Bool)

(assert (=> b!131604 (= res!63366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun res!63367 () Bool)

(assert (=> start!14180 (=> (not res!63367) (not e!85805))))

(declare-fun valid!526 (LongMap!874) Bool)

(assert (=> start!14180 (= res!63367 (valid!526 thiss!992))))

(assert (=> start!14180 e!85805))

(assert (=> start!14180 e!85808))

(assert (=> start!14180 true))

(assert (=> start!14180 e!85814))

(declare-fun b!131605 () Bool)

(assert (=> b!131605 (= e!85811 tp_is_empty!2869)))

(declare-fun b!131606 () Bool)

(declare-datatypes ((List!1707 0))(
  ( (Nil!1704) (Cons!1703 (h!2308 (_ BitVec 64)) (t!6133 List!1707)) )
))
(declare-fun arrayNoDuplicates!0 (array!4743 (_ BitVec 32) List!1707) Bool)

(assert (=> b!131606 (= e!85804 (not (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000 Nil!1704)))))

(declare-fun b!131607 () Bool)

(assert (=> b!131607 (= e!85812 tp_is_empty!2869)))

(declare-fun b!131608 () Bool)

(declare-fun res!63371 () Bool)

(assert (=> b!131608 (=> (not res!63371) (not e!85805))))

(assert (=> b!131608 (= res!63371 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7146 newMap!16)) (_size!594 (v!3180 (underlying!448 thiss!992)))))))

(assert (=> b!131609 (= e!85813 (and tp!11153 tp_is_empty!2869 (array_inv!1425 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (array_inv!1426 (_values!2836 (v!3180 (underlying!448 thiss!992)))) e!85802))))

(declare-fun b!131610 () Bool)

(assert (=> b!131610 (= e!85809 e!85804)))

(declare-fun res!63370 () Bool)

(assert (=> b!131610 (=> (not res!63370) (not e!85804))))

(declare-fun contains!883 (ListLongMap!1667 (_ BitVec 64)) Bool)

(assert (=> b!131610 (= res!63370 (contains!883 lt!68501 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2580 0))(
  ( (tuple2!2581 (_1!1301 Bool) (_2!1301 LongMapFixedSize!1090)) )
))
(declare-fun lt!68503 () tuple2!2580)

(declare-fun update!191 (LongMapFixedSize!1090 (_ BitVec 64) V!3473) tuple2!2580)

(declare-fun get!1472 (ValueCell!1091 V!3473) V!3473)

(declare-fun dynLambda!417 (Int (_ BitVec 64)) V!3473)

(assert (=> b!131610 (= lt!68503 (update!191 newMap!16 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!14180 res!63367) b!131603))

(assert (= (and b!131603 res!63365) b!131597))

(assert (= (and b!131597 res!63364) b!131608))

(assert (= (and b!131608 res!63371) b!131594))

(assert (= (and b!131594 res!63372) b!131610))

(assert (= (and b!131610 res!63370) b!131595))

(assert (= (and b!131595 res!63368) b!131602))

(assert (= (and b!131602 res!63369) b!131604))

(assert (= (and b!131604 res!63366) b!131606))

(assert (= (and b!131592 condMapEmpty!4614) mapIsEmpty!4614))

(assert (= (and b!131592 (not condMapEmpty!4614)) mapNonEmpty!4613))

(get-info :version)

(assert (= (and mapNonEmpty!4613 ((_ is ValueCellFull!1091) mapValue!4613)) b!131601))

(assert (= (and b!131592 ((_ is ValueCellFull!1091) mapDefault!4613)) b!131605))

(assert (= b!131609 b!131592))

(assert (= b!131598 b!131609))

(assert (= b!131593 b!131598))

(assert (= start!14180 b!131593))

(assert (= (and b!131596 condMapEmpty!4613) mapIsEmpty!4613))

(assert (= (and b!131596 (not condMapEmpty!4613)) mapNonEmpty!4614))

(assert (= (and mapNonEmpty!4614 ((_ is ValueCellFull!1091) mapValue!4614)) b!131599))

(assert (= (and b!131596 ((_ is ValueCellFull!1091) mapDefault!4614)) b!131607))

(assert (= b!131600 b!131596))

(assert (= start!14180 b!131600))

(declare-fun b_lambda!5853 () Bool)

(assert (=> (not b_lambda!5853) (not b!131610)))

(declare-fun t!6129 () Bool)

(declare-fun tb!2389 () Bool)

(assert (=> (and b!131609 (= (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))) t!6129) tb!2389))

(declare-fun result!3949 () Bool)

(assert (=> tb!2389 (= result!3949 tp_is_empty!2869)))

(assert (=> b!131610 t!6129))

(declare-fun b_and!8137 () Bool)

(assert (= b_and!8133 (and (=> t!6129 result!3949) b_and!8137)))

(declare-fun tb!2391 () Bool)

(declare-fun t!6131 () Bool)

(assert (=> (and b!131600 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))) t!6131) tb!2391))

(declare-fun result!3953 () Bool)

(assert (= result!3953 result!3949))

(assert (=> b!131610 t!6131))

(declare-fun b_and!8139 () Bool)

(assert (= b_and!8135 (and (=> t!6131 result!3953) b_and!8139)))

(declare-fun m!154989 () Bool)

(assert (=> mapNonEmpty!4613 m!154989))

(declare-fun m!154991 () Bool)

(assert (=> b!131609 m!154991))

(declare-fun m!154993 () Bool)

(assert (=> b!131609 m!154993))

(declare-fun m!154995 () Bool)

(assert (=> b!131606 m!154995))

(declare-fun m!154997 () Bool)

(assert (=> b!131594 m!154997))

(declare-fun m!154999 () Bool)

(assert (=> b!131594 m!154999))

(declare-fun m!155001 () Bool)

(assert (=> b!131594 m!155001))

(declare-fun m!155003 () Bool)

(assert (=> mapNonEmpty!4614 m!155003))

(declare-fun m!155005 () Bool)

(assert (=> b!131595 m!155005))

(declare-fun m!155007 () Bool)

(assert (=> b!131610 m!155007))

(declare-fun m!155009 () Bool)

(assert (=> b!131610 m!155009))

(declare-fun m!155011 () Bool)

(assert (=> b!131610 m!155011))

(assert (=> b!131610 m!154997))

(declare-fun m!155013 () Bool)

(assert (=> b!131610 m!155013))

(assert (=> b!131610 m!154997))

(assert (=> b!131610 m!155009))

(assert (=> b!131610 m!154997))

(assert (=> b!131610 m!155011))

(declare-fun m!155015 () Bool)

(assert (=> b!131610 m!155015))

(assert (=> b!131610 m!155007))

(declare-fun m!155017 () Bool)

(assert (=> b!131600 m!155017))

(declare-fun m!155019 () Bool)

(assert (=> b!131600 m!155019))

(declare-fun m!155021 () Bool)

(assert (=> b!131604 m!155021))

(declare-fun m!155023 () Bool)

(assert (=> start!14180 m!155023))

(declare-fun m!155025 () Bool)

(assert (=> b!131597 m!155025))

(check-sat tp_is_empty!2869 (not b!131594) (not b_next!2907) (not b!131610) b_and!8139 (not mapNonEmpty!4613) (not b!131597) (not b!131604) (not start!14180) b_and!8137 (not b!131606) (not b!131609) (not b!131595) (not b_next!2905) (not mapNonEmpty!4614) (not b!131600) (not b_lambda!5853))
(check-sat b_and!8137 b_and!8139 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun b_lambda!5859 () Bool)

(assert (= b_lambda!5853 (or (and b!131609 b_free!2905) (and b!131600 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))))) b_lambda!5859)))

(check-sat (not b!131594) (not b_next!2907) (not b!131610) b_and!8139 (not mapNonEmpty!4613) (not b!131597) (not b!131604) (not start!14180) b_and!8137 (not b!131606) (not b!131609) tp_is_empty!2869 (not b_lambda!5859) (not b!131595) (not b_next!2905) (not mapNonEmpty!4614) (not b!131600))
(check-sat b_and!8137 b_and!8139 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun d!40105 () Bool)

(declare-fun e!85911 () Bool)

(assert (=> d!40105 e!85911))

(declare-fun res!63429 () Bool)

(assert (=> d!40105 (=> res!63429 e!85911)))

(declare-fun lt!68530 () Bool)

(assert (=> d!40105 (= res!63429 (not lt!68530))))

(declare-fun lt!68533 () Bool)

(assert (=> d!40105 (= lt!68530 lt!68533)))

(declare-datatypes ((Unit!4113 0))(
  ( (Unit!4114) )
))
(declare-fun lt!68532 () Unit!4113)

(declare-fun e!85912 () Unit!4113)

(assert (=> d!40105 (= lt!68532 e!85912)))

(declare-fun c!24340 () Bool)

(assert (=> d!40105 (= c!24340 lt!68533)))

(declare-fun containsKey!173 (List!1706 (_ BitVec 64)) Bool)

(assert (=> d!40105 (= lt!68533 (containsKey!173 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!40105 (= (contains!883 lt!68501 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) lt!68530)))

(declare-fun b!131737 () Bool)

(declare-fun lt!68531 () Unit!4113)

(assert (=> b!131737 (= e!85912 lt!68531)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!122 (List!1706 (_ BitVec 64)) Unit!4113)

(assert (=> b!131737 (= lt!68531 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-datatypes ((Option!175 0))(
  ( (Some!174 (v!3186 V!3473)) (None!173) )
))
(declare-fun isDefined!123 (Option!175) Bool)

(declare-fun getValueByKey!169 (List!1706 (_ BitVec 64)) Option!175)

(assert (=> b!131737 (isDefined!123 (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!131738 () Bool)

(declare-fun Unit!4115 () Unit!4113)

(assert (=> b!131738 (= e!85912 Unit!4115)))

(declare-fun b!131739 () Bool)

(assert (=> b!131739 (= e!85911 (isDefined!123 (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!40105 c!24340) b!131737))

(assert (= (and d!40105 (not c!24340)) b!131738))

(assert (= (and d!40105 (not res!63429)) b!131739))

(assert (=> d!40105 m!154997))

(declare-fun m!155103 () Bool)

(assert (=> d!40105 m!155103))

(assert (=> b!131737 m!154997))

(declare-fun m!155105 () Bool)

(assert (=> b!131737 m!155105))

(assert (=> b!131737 m!154997))

(declare-fun m!155107 () Bool)

(assert (=> b!131737 m!155107))

(assert (=> b!131737 m!155107))

(declare-fun m!155109 () Bool)

(assert (=> b!131737 m!155109))

(assert (=> b!131739 m!154997))

(assert (=> b!131739 m!155107))

(assert (=> b!131739 m!155107))

(assert (=> b!131739 m!155109))

(assert (=> b!131610 d!40105))

(declare-fun b!131824 () Bool)

(declare-fun e!85961 () Unit!4113)

(declare-fun Unit!4116 () Unit!4113)

(assert (=> b!131824 (= e!85961 Unit!4116)))

(declare-fun lt!68607 () Unit!4113)

(declare-fun call!14451 () Unit!4113)

(assert (=> b!131824 (= lt!68607 call!14451)))

(declare-datatypes ((SeekEntryResult!277 0))(
  ( (MissingZero!277 (index!3267 (_ BitVec 32))) (Found!277 (index!3268 (_ BitVec 32))) (Intermediate!277 (undefined!1089 Bool) (index!3269 (_ BitVec 32)) (x!15504 (_ BitVec 32))) (Undefined!277) (MissingVacant!277 (index!3270 (_ BitVec 32))) )
))
(declare-fun lt!68589 () SeekEntryResult!277)

(declare-fun call!14432 () SeekEntryResult!277)

(assert (=> b!131824 (= lt!68589 call!14432)))

(declare-fun res!63464 () Bool)

(assert (=> b!131824 (= res!63464 ((_ is Found!277) lt!68589))))

(declare-fun e!85974 () Bool)

(assert (=> b!131824 (=> (not res!63464) (not e!85974))))

(assert (=> b!131824 e!85974))

(declare-fun lt!68591 () Unit!4113)

(assert (=> b!131824 (= lt!68591 lt!68607)))

(assert (=> b!131824 false))

(declare-fun b!131825 () Bool)

(declare-fun c!24371 () Bool)

(declare-fun lt!68611 () SeekEntryResult!277)

(assert (=> b!131825 (= c!24371 ((_ is MissingVacant!277) lt!68611))))

(declare-fun e!85960 () Bool)

(declare-fun e!85977 () Bool)

(assert (=> b!131825 (= e!85960 e!85977)))

(declare-fun b!131826 () Bool)

(declare-fun e!85963 () Bool)

(declare-fun call!14441 () Bool)

(assert (=> b!131826 (= e!85963 (not call!14441))))

(declare-fun bm!14426 () Bool)

(declare-fun call!14444 () ListLongMap!1667)

(declare-fun call!14446 () ListLongMap!1667)

(assert (=> bm!14426 (= call!14444 call!14446)))

(declare-fun b!131827 () Bool)

(assert (=> b!131827 (= e!85977 ((_ is Undefined!277) lt!68611))))

(declare-fun bm!14427 () Bool)

(declare-fun call!14430 () ListLongMap!1667)

(assert (=> bm!14427 (= call!14430 (map!1387 newMap!16))))

(declare-fun call!14442 () ListLongMap!1667)

(declare-fun c!24380 () Bool)

(declare-fun e!85971 () ListLongMap!1667)

(declare-fun b!131828 () Bool)

(assert (=> b!131828 (= e!85971 (ite c!24380 call!14442 call!14444))))

(declare-fun b!131829 () Bool)

(declare-fun lt!68600 () Unit!4113)

(declare-fun lt!68590 () Unit!4113)

(assert (=> b!131829 (= lt!68600 lt!68590)))

(declare-fun call!14449 () ListLongMap!1667)

(assert (=> b!131829 (= call!14449 call!14444)))

(declare-fun lt!68614 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!60 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4113)

(assert (=> b!131829 (= lt!68590 (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68614 (zeroValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)))))

(assert (=> b!131829 (= lt!68614 (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!85972 () tuple2!2580)

(assert (=> b!131829 (= e!85972 (tuple2!2581 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7146 newMap!16) (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (_size!594 newMap!16) (_keys!4599 newMap!16) (_values!2836 newMap!16) (_vacant!594 newMap!16))))))

(declare-fun bm!14429 () Bool)

(declare-fun c!24372 () Bool)

(declare-fun c!24379 () Bool)

(assert (=> bm!14429 (= c!24372 c!24379)))

(declare-fun call!14452 () Bool)

(declare-fun lt!68601 () SeekEntryResult!277)

(declare-fun e!85964 () ListLongMap!1667)

(assert (=> bm!14429 (= call!14452 (contains!883 e!85964 (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601)))))))

(declare-fun call!14436 () ListLongMap!1667)

(declare-fun e!85970 () Bool)

(declare-fun b!131830 () Bool)

(declare-fun +!162 (ListLongMap!1667 tuple2!2578) ListLongMap!1667)

(assert (=> b!131830 (= e!85970 (= call!14436 (+!162 call!14430 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68603 () SeekEntryResult!277)

(declare-fun e!85966 () Bool)

(declare-fun b!131831 () Bool)

(assert (=> b!131831 (= e!85966 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68603)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun call!14434 () ListLongMap!1667)

(declare-fun bm!14430 () Bool)

(declare-fun c!24369 () Bool)

(assert (=> bm!14430 (= call!14434 (+!162 e!85971 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!24373 () Bool)

(assert (=> bm!14430 (= c!24373 c!24369)))

(declare-fun b!131832 () Bool)

(declare-fun e!85973 () Bool)

(assert (=> b!131832 (= e!85973 (= call!14436 call!14430))))

(declare-fun b!131833 () Bool)

(declare-fun res!63458 () Bool)

(assert (=> b!131833 (=> (not res!63458) (not e!85963))))

(declare-fun call!14439 () Bool)

(assert (=> b!131833 (= res!63458 call!14439)))

(declare-fun e!85958 () Bool)

(assert (=> b!131833 (= e!85958 e!85963)))

(declare-fun bm!14431 () Bool)

(declare-fun call!14437 () SeekEntryResult!277)

(assert (=> bm!14431 (= call!14432 call!14437)))

(declare-fun b!131834 () Bool)

(declare-fun e!85968 () Bool)

(declare-fun call!14435 () Bool)

(assert (=> b!131834 (= e!85968 (not call!14435))))

(declare-fun bm!14432 () Bool)

(declare-fun call!14445 () Bool)

(assert (=> bm!14432 (= call!14441 call!14445)))

(declare-fun bm!14433 () Bool)

(declare-fun call!14429 () Bool)

(declare-fun call!14443 () Bool)

(assert (=> bm!14433 (= call!14429 call!14443)))

(declare-fun b!131835 () Bool)

(declare-fun c!24382 () Bool)

(declare-fun lt!68612 () SeekEntryResult!277)

(assert (=> b!131835 (= c!24382 ((_ is MissingVacant!277) lt!68612))))

(declare-fun e!85967 () Bool)

(assert (=> b!131835 (= e!85958 e!85967)))

(declare-fun bm!14434 () Bool)

(declare-fun call!14431 () SeekEntryResult!277)

(assert (=> bm!14434 (= call!14431 call!14437)))

(declare-fun b!131836 () Bool)

(declare-fun res!63463 () Bool)

(assert (=> b!131836 (=> (not res!63463) (not e!85968))))

(assert (=> b!131836 (= res!63463 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3267 lt!68611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!68595 () (_ BitVec 32))

(declare-fun bm!14435 () Bool)

(declare-fun call!14450 () ListLongMap!1667)

(assert (=> bm!14435 (= call!14450 (getCurrentListMap!517 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14436 () Bool)

(declare-fun call!14440 () Bool)

(assert (=> bm!14436 (= call!14439 call!14440)))

(declare-fun bm!14437 () Bool)

(declare-fun call!14447 () ListLongMap!1667)

(assert (=> bm!14437 (= call!14447 call!14450)))

(declare-fun b!131837 () Bool)

(declare-fun res!63459 () Bool)

(assert (=> b!131837 (=> (not res!63459) (not e!85968))))

(assert (=> b!131837 (= res!63459 call!14429)))

(assert (=> b!131837 (= e!85960 e!85968)))

(declare-fun c!24375 () Bool)

(declare-fun c!24376 () Bool)

(declare-fun c!24377 () Bool)

(declare-fun c!24374 () Bool)

(declare-fun call!14433 () Bool)

(declare-fun bm!14438 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14438 (= call!14433 (inRange!0 (ite c!24379 (ite c!24374 (index!3268 lt!68589) (ite c!24377 (index!3267 lt!68612) (index!3270 lt!68612))) (ite c!24376 (index!3268 lt!68603) (ite c!24375 (index!3267 lt!68611) (index!3270 lt!68611)))) (mask!7146 newMap!16)))))

(declare-fun b!131838 () Bool)

(declare-fun lt!68597 () tuple2!2580)

(declare-fun call!14438 () tuple2!2580)

(assert (=> b!131838 (= lt!68597 call!14438)))

(declare-fun e!85975 () tuple2!2580)

(assert (=> b!131838 (= e!85975 (tuple2!2581 (_1!1301 lt!68597) (_2!1301 lt!68597)))))

(declare-fun bm!14439 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4743 (_ BitVec 32)) SeekEntryResult!277)

(assert (=> bm!14439 (= call!14437 (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun bm!14440 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4113)

(assert (=> bm!14440 (= call!14451 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun bm!14441 () Bool)

(assert (=> bm!14441 (= call!14435 call!14445)))

(declare-fun b!131839 () Bool)

(declare-fun e!85957 () Bool)

(assert (=> b!131839 (= e!85967 e!85957)))

(declare-fun res!63469 () Bool)

(assert (=> b!131839 (= res!63469 call!14439)))

(assert (=> b!131839 (=> (not res!63469) (not e!85957))))

(declare-fun bm!14442 () Bool)

(assert (=> bm!14442 (= call!14440 call!14433)))

(declare-fun bm!14443 () Bool)

(declare-fun call!14448 () Unit!4113)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4113)

(assert (=> bm!14443 (= call!14448 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun b!131840 () Bool)

(declare-fun e!85959 () tuple2!2580)

(declare-fun e!85965 () tuple2!2580)

(assert (=> b!131840 (= e!85959 e!85965)))

(assert (=> b!131840 (= lt!68601 (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(assert (=> b!131840 (= c!24379 ((_ is Undefined!277) lt!68601))))

(declare-fun bm!14444 () Bool)

(assert (=> bm!14444 (= call!14449 call!14434)))

(declare-fun b!131841 () Bool)

(assert (=> b!131841 (= e!85967 ((_ is Undefined!277) lt!68612))))

(declare-fun lt!68596 () array!4745)

(declare-fun bm!14445 () Bool)

(assert (=> bm!14445 (= call!14446 (getCurrentListMap!517 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!131842 () Bool)

(declare-fun e!85969 () tuple2!2580)

(assert (=> b!131842 (= e!85969 e!85975)))

(declare-fun c!24370 () Bool)

(assert (=> b!131842 (= c!24370 ((_ is MissingZero!277) lt!68601))))

(declare-fun b!131843 () Bool)

(declare-fun e!85978 () Unit!4113)

(declare-fun Unit!4117 () Unit!4113)

(assert (=> b!131843 (= e!85978 Unit!4117)))

(declare-fun lt!68606 () Unit!4113)

(assert (=> b!131843 (= lt!68606 call!14448)))

(assert (=> b!131843 (= lt!68611 call!14431)))

(assert (=> b!131843 (= c!24375 ((_ is MissingZero!277) lt!68611))))

(assert (=> b!131843 e!85960))

(declare-fun lt!68602 () Unit!4113)

(assert (=> b!131843 (= lt!68602 lt!68606)))

(assert (=> b!131843 false))

(declare-fun b!131844 () Bool)

(assert (=> b!131844 (= e!85959 e!85972)))

(assert (=> b!131844 (= c!24380 (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131845 () Bool)

(assert (=> b!131845 (= e!85974 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68589)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun bm!14446 () Bool)

(assert (=> bm!14446 (= call!14442 call!14450)))

(declare-fun d!40107 () Bool)

(declare-fun e!85976 () Bool)

(assert (=> d!40107 e!85976))

(declare-fun res!63461 () Bool)

(assert (=> d!40107 (=> (not res!63461) (not e!85976))))

(declare-fun lt!68588 () tuple2!2580)

(assert (=> d!40107 (= res!63461 (valid!525 (_2!1301 lt!68588)))))

(assert (=> d!40107 (= lt!68588 e!85959)))

(assert (=> d!40107 (= c!24369 (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (bvneg (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!40107 (valid!525 newMap!16)))

(assert (=> d!40107 (= (update!191 newMap!16 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!68588)))

(declare-fun bm!14428 () Bool)

(assert (=> bm!14428 (= call!14443 call!14433)))

(declare-fun b!131846 () Bool)

(assert (=> b!131846 (= e!85973 e!85970)))

(declare-fun res!63462 () Bool)

(assert (=> b!131846 (= res!63462 (contains!883 call!14436 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!131846 (=> (not res!63462) (not e!85970))))

(declare-fun b!131847 () Bool)

(assert (=> b!131847 (= e!85976 e!85973)))

(declare-fun c!24381 () Bool)

(assert (=> b!131847 (= c!24381 (_1!1301 lt!68588))))

(declare-fun b!131848 () Bool)

(declare-fun lt!68592 () tuple2!2580)

(assert (=> b!131848 (= e!85969 (tuple2!2581 (_1!1301 lt!68592) (_2!1301 lt!68592)))))

(assert (=> b!131848 (= lt!68592 call!14438)))

(declare-fun b!131849 () Bool)

(declare-fun res!63467 () Bool)

(assert (=> b!131849 (= res!63467 call!14440)))

(assert (=> b!131849 (=> (not res!63467) (not e!85974))))

(declare-fun bm!14447 () Bool)

(declare-fun arrayContainsKey!0 (array!4743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14447 (= call!14445 (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!131850 () Bool)

(assert (=> b!131850 (= e!85964 call!14447)))

(declare-fun c!24378 () Bool)

(declare-fun bm!14448 () Bool)

(declare-fun updateHelperNewKey!60 (LongMapFixedSize!1090 (_ BitVec 64) V!3473 (_ BitVec 32)) tuple2!2580)

(assert (=> bm!14448 (= call!14438 (updateHelperNewKey!60 newMap!16 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601))))))

(declare-fun b!131851 () Bool)

(assert (=> b!131851 (= e!85971 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!131852 () Bool)

(declare-fun lt!68608 () Unit!4113)

(assert (=> b!131852 (= e!85978 lt!68608)))

(assert (=> b!131852 (= lt!68608 call!14451)))

(assert (=> b!131852 (= lt!68603 call!14431)))

(declare-fun res!63466 () Bool)

(assert (=> b!131852 (= res!63466 ((_ is Found!277) lt!68603))))

(assert (=> b!131852 (=> (not res!63466) (not e!85966))))

(assert (=> b!131852 e!85966))

(declare-fun b!131853 () Bool)

(declare-fun res!63471 () Bool)

(assert (=> b!131853 (= res!63471 call!14443)))

(assert (=> b!131853 (=> (not res!63471) (not e!85966))))

(declare-fun b!131854 () Bool)

(declare-fun e!85962 () Bool)

(assert (=> b!131854 (= e!85962 (not call!14435))))

(declare-fun b!131855 () Bool)

(declare-fun lt!68593 () Unit!4113)

(declare-fun lt!68599 () Unit!4113)

(assert (=> b!131855 (= lt!68593 lt!68599)))

(assert (=> b!131855 call!14452))

(declare-fun lemmaValidKeyInArrayIsInListMap!119 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) Unit!4113)

(assert (=> b!131855 (= lt!68599 (lemmaValidKeyInArrayIsInListMap!119 (_keys!4599 newMap!16) lt!68596 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (defaultEntry!2853 newMap!16)))))

(assert (=> b!131855 (= lt!68596 (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))))))

(declare-fun lt!68613 () Unit!4113)

(declare-fun lt!68605 () Unit!4113)

(assert (=> b!131855 (= lt!68613 lt!68605)))

(assert (=> b!131855 (= call!14434 call!14447)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4113)

(assert (=> b!131855 (= lt!68605 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68598 () Unit!4113)

(assert (=> b!131855 (= lt!68598 e!85978)))

(assert (=> b!131855 (= c!24376 (contains!883 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!131855 (= e!85975 (tuple2!2581 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (_size!594 newMap!16) (_keys!4599 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))) (_vacant!594 newMap!16))))))

(declare-fun b!131856 () Bool)

(declare-fun lt!68609 () Unit!4113)

(assert (=> b!131856 (= e!85961 lt!68609)))

(assert (=> b!131856 (= lt!68609 call!14448)))

(assert (=> b!131856 (= lt!68612 call!14432)))

(assert (=> b!131856 (= c!24377 ((_ is MissingZero!277) lt!68612))))

(assert (=> b!131856 e!85958))

(declare-fun b!131857 () Bool)

(assert (=> b!131857 (= e!85957 (not call!14441))))

(declare-fun b!131858 () Bool)

(assert (=> b!131858 (= e!85964 call!14446)))

(declare-fun b!131859 () Bool)

(declare-fun lt!68610 () Unit!4113)

(assert (=> b!131859 (= lt!68610 e!85961)))

(assert (=> b!131859 (= c!24374 call!14452)))

(assert (=> b!131859 (= e!85965 (tuple2!2581 false newMap!16))))

(declare-fun b!131860 () Bool)

(declare-fun res!63465 () Bool)

(assert (=> b!131860 (= res!63465 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3270 lt!68612)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131860 (=> (not res!63465) (not e!85957))))

(declare-fun b!131861 () Bool)

(declare-fun res!63468 () Bool)

(assert (=> b!131861 (= res!63468 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3270 lt!68611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131861 (=> (not res!63468) (not e!85962))))

(declare-fun bm!14449 () Bool)

(assert (=> bm!14449 (= call!14436 (map!1387 (_2!1301 lt!68588)))))

(declare-fun b!131862 () Bool)

(assert (=> b!131862 (= e!85977 e!85962)))

(declare-fun res!63460 () Bool)

(assert (=> b!131862 (= res!63460 call!14429)))

(assert (=> b!131862 (=> (not res!63460) (not e!85962))))

(declare-fun b!131863 () Bool)

(assert (=> b!131863 (= c!24378 ((_ is MissingVacant!277) lt!68601))))

(assert (=> b!131863 (= e!85965 e!85969)))

(declare-fun b!131864 () Bool)

(declare-fun res!63470 () Bool)

(assert (=> b!131864 (=> (not res!63470) (not e!85963))))

(assert (=> b!131864 (= res!63470 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3267 lt!68612)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131865 () Bool)

(declare-fun lt!68604 () Unit!4113)

(declare-fun lt!68594 () Unit!4113)

(assert (=> b!131865 (= lt!68604 lt!68594)))

(assert (=> b!131865 (= call!14449 call!14442)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4113)

(assert (=> b!131865 (= lt!68594 (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68595 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> b!131865 (= lt!68595 (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!131865 (= e!85972 (tuple2!2581 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7146 newMap!16) (bvor (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) (zeroValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!594 newMap!16) (_keys!4599 newMap!16) (_values!2836 newMap!16) (_vacant!594 newMap!16))))))

(assert (= (and d!40107 c!24369) b!131844))

(assert (= (and d!40107 (not c!24369)) b!131840))

(assert (= (and b!131844 c!24380) b!131829))

(assert (= (and b!131844 (not c!24380)) b!131865))

(assert (= (or b!131829 b!131865) bm!14426))

(assert (= (or b!131829 b!131865) bm!14446))

(assert (= (or b!131829 b!131865) bm!14444))

(assert (= (and b!131840 c!24379) b!131859))

(assert (= (and b!131840 (not c!24379)) b!131863))

(assert (= (and b!131859 c!24374) b!131824))

(assert (= (and b!131859 (not c!24374)) b!131856))

(assert (= (and b!131824 res!63464) b!131849))

(assert (= (and b!131849 res!63467) b!131845))

(assert (= (and b!131856 c!24377) b!131833))

(assert (= (and b!131856 (not c!24377)) b!131835))

(assert (= (and b!131833 res!63458) b!131864))

(assert (= (and b!131864 res!63470) b!131826))

(assert (= (and b!131835 c!24382) b!131839))

(assert (= (and b!131835 (not c!24382)) b!131841))

(assert (= (and b!131839 res!63469) b!131860))

(assert (= (and b!131860 res!63465) b!131857))

(assert (= (or b!131833 b!131839) bm!14436))

(assert (= (or b!131826 b!131857) bm!14432))

(assert (= (or b!131849 bm!14436) bm!14442))

(assert (= (or b!131824 b!131856) bm!14431))

(assert (= (and b!131863 c!24378) b!131848))

(assert (= (and b!131863 (not c!24378)) b!131842))

(assert (= (and b!131842 c!24370) b!131838))

(assert (= (and b!131842 (not c!24370)) b!131855))

(assert (= (and b!131855 c!24376) b!131852))

(assert (= (and b!131855 (not c!24376)) b!131843))

(assert (= (and b!131852 res!63466) b!131853))

(assert (= (and b!131853 res!63471) b!131831))

(assert (= (and b!131843 c!24375) b!131837))

(assert (= (and b!131843 (not c!24375)) b!131825))

(assert (= (and b!131837 res!63459) b!131836))

(assert (= (and b!131836 res!63463) b!131834))

(assert (= (and b!131825 c!24371) b!131862))

(assert (= (and b!131825 (not c!24371)) b!131827))

(assert (= (and b!131862 res!63460) b!131861))

(assert (= (and b!131861 res!63468) b!131854))

(assert (= (or b!131837 b!131862) bm!14433))

(assert (= (or b!131834 b!131854) bm!14441))

(assert (= (or b!131853 bm!14433) bm!14428))

(assert (= (or b!131852 b!131843) bm!14434))

(assert (= (or b!131848 b!131838) bm!14448))

(assert (= (or bm!14432 bm!14441) bm!14447))

(assert (= (or b!131856 b!131843) bm!14443))

(assert (= (or b!131859 b!131855) bm!14437))

(assert (= (or bm!14431 bm!14434) bm!14439))

(assert (= (or b!131824 b!131852) bm!14440))

(assert (= (or bm!14442 bm!14428) bm!14438))

(assert (= (or b!131859 b!131855) bm!14429))

(assert (= (and bm!14429 c!24372) b!131850))

(assert (= (and bm!14429 (not c!24372)) b!131858))

(assert (= (or bm!14426 b!131858) bm!14445))

(assert (= (or bm!14446 bm!14437) bm!14435))

(assert (= (or bm!14444 b!131855) bm!14430))

(assert (= (and bm!14430 c!24373) b!131828))

(assert (= (and bm!14430 (not c!24373)) b!131851))

(assert (= (and d!40107 res!63461) b!131847))

(assert (= (and b!131847 c!24381) b!131846))

(assert (= (and b!131847 (not c!24381)) b!131832))

(assert (= (and b!131846 res!63462) b!131830))

(assert (= (or b!131830 b!131832) bm!14427))

(assert (= (or b!131846 b!131830 b!131832) bm!14449))

(declare-fun m!155111 () Bool)

(assert (=> bm!14445 m!155111))

(assert (=> bm!14439 m!154997))

(declare-fun m!155113 () Bool)

(assert (=> bm!14439 m!155113))

(declare-fun m!155115 () Bool)

(assert (=> b!131830 m!155115))

(declare-fun m!155117 () Bool)

(assert (=> bm!14429 m!155117))

(declare-fun m!155119 () Bool)

(assert (=> bm!14429 m!155119))

(assert (=> bm!14448 m!154997))

(assert (=> bm!14448 m!155011))

(declare-fun m!155121 () Bool)

(assert (=> bm!14448 m!155121))

(assert (=> b!131865 m!155011))

(declare-fun m!155123 () Bool)

(assert (=> b!131865 m!155123))

(declare-fun m!155125 () Bool)

(assert (=> b!131864 m!155125))

(declare-fun m!155127 () Bool)

(assert (=> d!40107 m!155127))

(assert (=> d!40107 m!155025))

(declare-fun m!155129 () Bool)

(assert (=> b!131861 m!155129))

(assert (=> b!131829 m!155011))

(declare-fun m!155131 () Bool)

(assert (=> b!131829 m!155131))

(declare-fun m!155133 () Bool)

(assert (=> b!131860 m!155133))

(declare-fun m!155135 () Bool)

(assert (=> bm!14438 m!155135))

(declare-fun m!155137 () Bool)

(assert (=> bm!14435 m!155137))

(declare-fun m!155139 () Bool)

(assert (=> bm!14435 m!155139))

(assert (=> bm!14427 m!154999))

(declare-fun m!155141 () Bool)

(assert (=> b!131851 m!155141))

(assert (=> b!131855 m!154997))

(assert (=> b!131855 m!155011))

(declare-fun m!155143 () Bool)

(assert (=> b!131855 m!155143))

(assert (=> b!131855 m!155141))

(assert (=> b!131855 m!154997))

(declare-fun m!155145 () Bool)

(assert (=> b!131855 m!155145))

(assert (=> b!131855 m!155137))

(assert (=> b!131855 m!155141))

(declare-fun m!155147 () Bool)

(assert (=> b!131855 m!155147))

(declare-fun m!155149 () Bool)

(assert (=> bm!14449 m!155149))

(assert (=> bm!14447 m!154997))

(declare-fun m!155151 () Bool)

(assert (=> bm!14447 m!155151))

(declare-fun m!155153 () Bool)

(assert (=> b!131831 m!155153))

(declare-fun m!155155 () Bool)

(assert (=> bm!14430 m!155155))

(assert (=> bm!14440 m!154997))

(declare-fun m!155157 () Bool)

(assert (=> bm!14440 m!155157))

(assert (=> bm!14443 m!154997))

(declare-fun m!155159 () Bool)

(assert (=> bm!14443 m!155159))

(declare-fun m!155161 () Bool)

(assert (=> b!131836 m!155161))

(assert (=> b!131840 m!154997))

(assert (=> b!131840 m!155113))

(declare-fun m!155163 () Bool)

(assert (=> b!131845 m!155163))

(assert (=> b!131846 m!154997))

(declare-fun m!155165 () Bool)

(assert (=> b!131846 m!155165))

(assert (=> b!131610 d!40107))

(declare-fun d!40109 () Bool)

(declare-fun c!24385 () Bool)

(assert (=> d!40109 (= c!24385 ((_ is ValueCellFull!1091) (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!85981 () V!3473)

(assert (=> d!40109 (= (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85981)))

(declare-fun b!131870 () Bool)

(declare-fun get!1473 (ValueCell!1091 V!3473) V!3473)

(assert (=> b!131870 (= e!85981 (get!1473 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!131871 () Bool)

(declare-fun get!1474 (ValueCell!1091 V!3473) V!3473)

(assert (=> b!131871 (= e!85981 (get!1474 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40109 c!24385) b!131870))

(assert (= (and d!40109 (not c!24385)) b!131871))

(assert (=> b!131870 m!155007))

(assert (=> b!131870 m!155009))

(declare-fun m!155167 () Bool)

(assert (=> b!131870 m!155167))

(assert (=> b!131871 m!155007))

(assert (=> b!131871 m!155009))

(declare-fun m!155169 () Bool)

(assert (=> b!131871 m!155169))

(assert (=> b!131610 d!40109))

(declare-fun d!40111 () Bool)

(declare-fun res!63478 () Bool)

(declare-fun e!85984 () Bool)

(assert (=> d!40111 (=> (not res!63478) (not e!85984))))

(declare-fun simpleValid!91 (LongMapFixedSize!1090) Bool)

(assert (=> d!40111 (= res!63478 (simpleValid!91 newMap!16))))

(assert (=> d!40111 (= (valid!525 newMap!16) e!85984)))

(declare-fun b!131878 () Bool)

(declare-fun res!63479 () Bool)

(assert (=> b!131878 (=> (not res!63479) (not e!85984))))

(declare-fun arrayCountValidKeys!0 (array!4743 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!131878 (= res!63479 (= (arrayCountValidKeys!0 (_keys!4599 newMap!16) #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (_size!594 newMap!16)))))

(declare-fun b!131879 () Bool)

(declare-fun res!63480 () Bool)

(assert (=> b!131879 (=> (not res!63480) (not e!85984))))

(assert (=> b!131879 (= res!63480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun b!131880 () Bool)

(assert (=> b!131880 (= e!85984 (arrayNoDuplicates!0 (_keys!4599 newMap!16) #b00000000000000000000000000000000 Nil!1704))))

(assert (= (and d!40111 res!63478) b!131878))

(assert (= (and b!131878 res!63479) b!131879))

(assert (= (and b!131879 res!63480) b!131880))

(declare-fun m!155171 () Bool)

(assert (=> d!40111 m!155171))

(declare-fun m!155173 () Bool)

(assert (=> b!131878 m!155173))

(declare-fun m!155175 () Bool)

(assert (=> b!131879 m!155175))

(declare-fun m!155177 () Bool)

(assert (=> b!131880 m!155177))

(assert (=> b!131597 d!40111))

(declare-fun d!40113 () Bool)

(assert (=> d!40113 (= (map!1387 newMap!16) (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun bs!5452 () Bool)

(assert (= bs!5452 d!40113))

(assert (=> bs!5452 m!155141))

(assert (=> b!131594 d!40113))

(declare-fun b!131923 () Bool)

(declare-fun e!86016 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!131923 (= e!86016 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!40115 () Bool)

(declare-fun e!86023 () Bool)

(assert (=> d!40115 e!86023))

(declare-fun res!63504 () Bool)

(assert (=> d!40115 (=> (not res!63504) (not e!86023))))

(assert (=> d!40115 (= res!63504 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun lt!68668 () ListLongMap!1667)

(declare-fun lt!68671 () ListLongMap!1667)

(assert (=> d!40115 (= lt!68668 lt!68671)))

(declare-fun lt!68660 () Unit!4113)

(declare-fun e!86019 () Unit!4113)

(assert (=> d!40115 (= lt!68660 e!86019)))

(declare-fun c!24400 () Bool)

(declare-fun e!86022 () Bool)

(assert (=> d!40115 (= c!24400 e!86022)))

(declare-fun res!63506 () Bool)

(assert (=> d!40115 (=> (not res!63506) (not e!86022))))

(assert (=> d!40115 (= res!63506 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun e!86012 () ListLongMap!1667)

(assert (=> d!40115 (= lt!68671 e!86012)))

(declare-fun c!24401 () Bool)

(assert (=> d!40115 (= c!24401 (and (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40115 (validMask!0 (mask!7146 (v!3180 (underlying!448 thiss!992))))))

(assert (=> d!40115 (= (getCurrentListMap!517 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))) lt!68668)))

(declare-fun b!131924 () Bool)

(declare-fun e!86018 () Bool)

(declare-fun e!86011 () Bool)

(assert (=> b!131924 (= e!86018 e!86011)))

(declare-fun res!63500 () Bool)

(declare-fun call!14469 () Bool)

(assert (=> b!131924 (= res!63500 call!14469)))

(assert (=> b!131924 (=> (not res!63500) (not e!86011))))

(declare-fun b!131925 () Bool)

(declare-fun e!86014 () Bool)

(declare-fun apply!115 (ListLongMap!1667 (_ BitVec 64)) V!3473)

(assert (=> b!131925 (= e!86014 (= (apply!115 lt!68668 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2512 (_values!2836 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> b!131925 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!131926 () Bool)

(declare-fun e!86020 () ListLongMap!1667)

(assert (=> b!131926 (= e!86012 e!86020)))

(declare-fun c!24402 () Bool)

(assert (=> b!131926 (= c!24402 (and (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!131927 () Bool)

(declare-fun res!63503 () Bool)

(assert (=> b!131927 (=> (not res!63503) (not e!86023))))

(declare-fun e!86013 () Bool)

(assert (=> b!131927 (= res!63503 e!86013)))

(declare-fun c!24398 () Bool)

(assert (=> b!131927 (= c!24398 (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!131928 () Bool)

(assert (=> b!131928 (= e!86018 (not call!14469))))

(declare-fun bm!14464 () Bool)

(declare-fun call!14472 () Bool)

(assert (=> bm!14464 (= call!14472 (contains!883 lt!68668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!131929 () Bool)

(declare-fun call!14473 () ListLongMap!1667)

(assert (=> b!131929 (= e!86012 (+!162 call!14473 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!131930 () Bool)

(declare-fun e!86015 () ListLongMap!1667)

(declare-fun call!14470 () ListLongMap!1667)

(assert (=> b!131930 (= e!86015 call!14470)))

(declare-fun bm!14465 () Bool)

(assert (=> bm!14465 (= call!14469 (contains!883 lt!68668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14466 () Bool)

(declare-fun call!14467 () ListLongMap!1667)

(declare-fun getCurrentListMapNoExtraKeys!127 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) ListLongMap!1667)

(assert (=> bm!14466 (= call!14467 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!131931 () Bool)

(declare-fun Unit!4118 () Unit!4113)

(assert (=> b!131931 (= e!86019 Unit!4118)))

(declare-fun b!131932 () Bool)

(declare-fun call!14471 () ListLongMap!1667)

(assert (=> b!131932 (= e!86015 call!14471)))

(declare-fun b!131933 () Bool)

(assert (=> b!131933 (= e!86011 (= (apply!115 lt!68668 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun bm!14467 () Bool)

(assert (=> bm!14467 (= call!14470 call!14473)))

(declare-fun b!131934 () Bool)

(declare-fun e!86021 () Bool)

(assert (=> b!131934 (= e!86013 e!86021)))

(declare-fun res!63499 () Bool)

(assert (=> b!131934 (= res!63499 call!14472)))

(assert (=> b!131934 (=> (not res!63499) (not e!86021))))

(declare-fun b!131935 () Bool)

(assert (=> b!131935 (= e!86022 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14468 () Bool)

(declare-fun call!14468 () ListLongMap!1667)

(assert (=> bm!14468 (= call!14471 call!14468)))

(declare-fun b!131936 () Bool)

(declare-fun res!63502 () Bool)

(assert (=> b!131936 (=> (not res!63502) (not e!86023))))

(declare-fun e!86017 () Bool)

(assert (=> b!131936 (= res!63502 e!86017)))

(declare-fun res!63501 () Bool)

(assert (=> b!131936 (=> res!63501 e!86017)))

(assert (=> b!131936 (= res!63501 (not e!86016))))

(declare-fun res!63507 () Bool)

(assert (=> b!131936 (=> (not res!63507) (not e!86016))))

(assert (=> b!131936 (= res!63507 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!131937 () Bool)

(assert (=> b!131937 (= e!86013 (not call!14472))))

(declare-fun b!131938 () Bool)

(declare-fun c!24403 () Bool)

(assert (=> b!131938 (= c!24403 (and (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!131938 (= e!86020 e!86015)))

(declare-fun b!131939 () Bool)

(assert (=> b!131939 (= e!86017 e!86014)))

(declare-fun res!63505 () Bool)

(assert (=> b!131939 (=> (not res!63505) (not e!86014))))

(assert (=> b!131939 (= res!63505 (contains!883 lt!68668 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!131939 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun bm!14469 () Bool)

(assert (=> bm!14469 (= call!14468 call!14467)))

(declare-fun b!131940 () Bool)

(assert (=> b!131940 (= e!86021 (= (apply!115 lt!68668 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!131941 () Bool)

(declare-fun lt!68665 () Unit!4113)

(assert (=> b!131941 (= e!86019 lt!68665)))

(declare-fun lt!68661 () ListLongMap!1667)

(assert (=> b!131941 (= lt!68661 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun lt!68670 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68679 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68679 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68664 () Unit!4113)

(declare-fun addStillContains!91 (ListLongMap!1667 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4113)

(assert (=> b!131941 (= lt!68664 (addStillContains!91 lt!68661 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68679))))

(assert (=> b!131941 (contains!883 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68679)))

(declare-fun lt!68675 () Unit!4113)

(assert (=> b!131941 (= lt!68675 lt!68664)))

(declare-fun lt!68659 () ListLongMap!1667)

(assert (=> b!131941 (= lt!68659 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun lt!68673 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68672 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68672 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68662 () Unit!4113)

(declare-fun addApplyDifferent!91 (ListLongMap!1667 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4113)

(assert (=> b!131941 (= lt!68662 (addApplyDifferent!91 lt!68659 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68672))))

(assert (=> b!131941 (= (apply!115 (+!162 lt!68659 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68672) (apply!115 lt!68659 lt!68672))))

(declare-fun lt!68680 () Unit!4113)

(assert (=> b!131941 (= lt!68680 lt!68662)))

(declare-fun lt!68663 () ListLongMap!1667)

(assert (=> b!131941 (= lt!68663 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun lt!68678 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68667 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68667 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!68674 () Unit!4113)

(assert (=> b!131941 (= lt!68674 (addApplyDifferent!91 lt!68663 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68667))))

(assert (=> b!131941 (= (apply!115 (+!162 lt!68663 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68667) (apply!115 lt!68663 lt!68667))))

(declare-fun lt!68676 () Unit!4113)

(assert (=> b!131941 (= lt!68676 lt!68674)))

(declare-fun lt!68666 () ListLongMap!1667)

(assert (=> b!131941 (= lt!68666 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun lt!68669 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68677 () (_ BitVec 64))

(assert (=> b!131941 (= lt!68677 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!131941 (= lt!68665 (addApplyDifferent!91 lt!68666 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68677))))

(assert (=> b!131941 (= (apply!115 (+!162 lt!68666 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68677) (apply!115 lt!68666 lt!68677))))

(declare-fun b!131942 () Bool)

(assert (=> b!131942 (= e!86020 call!14470)))

(declare-fun b!131943 () Bool)

(assert (=> b!131943 (= e!86023 e!86018)))

(declare-fun c!24399 () Bool)

(assert (=> b!131943 (= c!24399 (not (= (bvand (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14470 () Bool)

(assert (=> bm!14470 (= call!14473 (+!162 (ite c!24401 call!14467 (ite c!24402 call!14468 call!14471)) (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (= (and d!40115 c!24401) b!131929))

(assert (= (and d!40115 (not c!24401)) b!131926))

(assert (= (and b!131926 c!24402) b!131942))

(assert (= (and b!131926 (not c!24402)) b!131938))

(assert (= (and b!131938 c!24403) b!131930))

(assert (= (and b!131938 (not c!24403)) b!131932))

(assert (= (or b!131930 b!131932) bm!14468))

(assert (= (or b!131942 bm!14468) bm!14469))

(assert (= (or b!131942 b!131930) bm!14467))

(assert (= (or b!131929 bm!14469) bm!14466))

(assert (= (or b!131929 bm!14467) bm!14470))

(assert (= (and d!40115 res!63506) b!131935))

(assert (= (and d!40115 c!24400) b!131941))

(assert (= (and d!40115 (not c!24400)) b!131931))

(assert (= (and d!40115 res!63504) b!131936))

(assert (= (and b!131936 res!63507) b!131923))

(assert (= (and b!131936 (not res!63501)) b!131939))

(assert (= (and b!131939 res!63505) b!131925))

(assert (= (and b!131936 res!63502) b!131927))

(assert (= (and b!131927 c!24398) b!131934))

(assert (= (and b!131927 (not c!24398)) b!131937))

(assert (= (and b!131934 res!63499) b!131940))

(assert (= (or b!131934 b!131937) bm!14464))

(assert (= (and b!131927 res!63503) b!131943))

(assert (= (and b!131943 c!24399) b!131924))

(assert (= (and b!131943 (not c!24399)) b!131928))

(assert (= (and b!131924 res!63500) b!131933))

(assert (= (or b!131924 b!131928) bm!14465))

(declare-fun b_lambda!5861 () Bool)

(assert (=> (not b_lambda!5861) (not b!131925)))

(assert (=> b!131925 t!6129))

(declare-fun b_and!8157 () Bool)

(assert (= b_and!8137 (and (=> t!6129 result!3949) b_and!8157)))

(assert (=> b!131925 t!6131))

(declare-fun b_and!8159 () Bool)

(assert (= b_and!8139 (and (=> t!6131 result!3953) b_and!8159)))

(declare-fun m!155179 () Bool)

(assert (=> bm!14466 m!155179))

(declare-fun m!155181 () Bool)

(assert (=> b!131923 m!155181))

(assert (=> b!131923 m!155181))

(declare-fun m!155183 () Bool)

(assert (=> b!131923 m!155183))

(assert (=> b!131939 m!155181))

(assert (=> b!131939 m!155181))

(declare-fun m!155185 () Bool)

(assert (=> b!131939 m!155185))

(declare-fun m!155187 () Bool)

(assert (=> b!131941 m!155187))

(declare-fun m!155189 () Bool)

(assert (=> b!131941 m!155189))

(declare-fun m!155191 () Bool)

(assert (=> b!131941 m!155191))

(declare-fun m!155193 () Bool)

(assert (=> b!131941 m!155193))

(declare-fun m!155195 () Bool)

(assert (=> b!131941 m!155195))

(declare-fun m!155197 () Bool)

(assert (=> b!131941 m!155197))

(declare-fun m!155199 () Bool)

(assert (=> b!131941 m!155199))

(assert (=> b!131941 m!155181))

(declare-fun m!155201 () Bool)

(assert (=> b!131941 m!155201))

(assert (=> b!131941 m!155191))

(declare-fun m!155203 () Bool)

(assert (=> b!131941 m!155203))

(declare-fun m!155205 () Bool)

(assert (=> b!131941 m!155205))

(declare-fun m!155207 () Bool)

(assert (=> b!131941 m!155207))

(assert (=> b!131941 m!155201))

(declare-fun m!155209 () Bool)

(assert (=> b!131941 m!155209))

(declare-fun m!155211 () Bool)

(assert (=> b!131941 m!155211))

(declare-fun m!155213 () Bool)

(assert (=> b!131941 m!155213))

(declare-fun m!155215 () Bool)

(assert (=> b!131941 m!155215))

(assert (=> b!131941 m!155211))

(assert (=> b!131941 m!155179))

(assert (=> b!131941 m!155193))

(declare-fun m!155217 () Bool)

(assert (=> bm!14465 m!155217))

(assert (=> b!131935 m!155181))

(assert (=> b!131935 m!155181))

(assert (=> b!131935 m!155183))

(assert (=> d!40115 m!155005))

(declare-fun m!155219 () Bool)

(assert (=> b!131929 m!155219))

(declare-fun m!155221 () Bool)

(assert (=> b!131933 m!155221))

(declare-fun m!155223 () Bool)

(assert (=> bm!14464 m!155223))

(declare-fun m!155225 () Bool)

(assert (=> b!131925 m!155225))

(assert (=> b!131925 m!155225))

(assert (=> b!131925 m!155009))

(declare-fun m!155227 () Bool)

(assert (=> b!131925 m!155227))

(assert (=> b!131925 m!155181))

(assert (=> b!131925 m!155181))

(declare-fun m!155229 () Bool)

(assert (=> b!131925 m!155229))

(assert (=> b!131925 m!155009))

(declare-fun m!155231 () Bool)

(assert (=> b!131940 m!155231))

(declare-fun m!155233 () Bool)

(assert (=> bm!14470 m!155233))

(assert (=> b!131594 d!40115))

(declare-fun b!131954 () Bool)

(declare-fun e!86034 () Bool)

(declare-fun call!14476 () Bool)

(assert (=> b!131954 (= e!86034 call!14476)))

(declare-fun d!40117 () Bool)

(declare-fun res!63516 () Bool)

(declare-fun e!86035 () Bool)

(assert (=> d!40117 (=> res!63516 e!86035)))

(assert (=> d!40117 (= res!63516 (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> d!40117 (= (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000 Nil!1704) e!86035)))

(declare-fun b!131955 () Bool)

(assert (=> b!131955 (= e!86034 call!14476)))

(declare-fun bm!14473 () Bool)

(declare-fun c!24406 () Bool)

(assert (=> bm!14473 (= call!14476 (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24406 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1704) Nil!1704)))))

(declare-fun b!131956 () Bool)

(declare-fun e!86033 () Bool)

(assert (=> b!131956 (= e!86033 e!86034)))

(assert (=> b!131956 (= c!24406 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131957 () Bool)

(assert (=> b!131957 (= e!86035 e!86033)))

(declare-fun res!63514 () Bool)

(assert (=> b!131957 (=> (not res!63514) (not e!86033))))

(declare-fun e!86032 () Bool)

(assert (=> b!131957 (= res!63514 (not e!86032))))

(declare-fun res!63515 () Bool)

(assert (=> b!131957 (=> (not res!63515) (not e!86032))))

(assert (=> b!131957 (= res!63515 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!131958 () Bool)

(declare-fun contains!884 (List!1707 (_ BitVec 64)) Bool)

(assert (=> b!131958 (= e!86032 (contains!884 Nil!1704 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40117 (not res!63516)) b!131957))

(assert (= (and b!131957 res!63515) b!131958))

(assert (= (and b!131957 res!63514) b!131956))

(assert (= (and b!131956 c!24406) b!131954))

(assert (= (and b!131956 (not c!24406)) b!131955))

(assert (= (or b!131954 b!131955) bm!14473))

(declare-fun m!155235 () Bool)

(assert (=> bm!14473 m!155235))

(declare-fun m!155237 () Bool)

(assert (=> bm!14473 m!155237))

(assert (=> b!131956 m!155235))

(assert (=> b!131956 m!155235))

(declare-fun m!155239 () Bool)

(assert (=> b!131956 m!155239))

(assert (=> b!131957 m!155235))

(assert (=> b!131957 m!155235))

(assert (=> b!131957 m!155239))

(assert (=> b!131958 m!155235))

(assert (=> b!131958 m!155235))

(declare-fun m!155241 () Bool)

(assert (=> b!131958 m!155241))

(assert (=> b!131606 d!40117))

(declare-fun d!40119 () Bool)

(assert (=> d!40119 (= (validMask!0 (mask!7146 (v!3180 (underlying!448 thiss!992)))) (and (or (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000001111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000011111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000001111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000011111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000001111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000011111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000001111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000011111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000000111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000001111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000011111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000000111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000001111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000011111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000000111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000001111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000011111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000000111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000001111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000011111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00000111111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00001111111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00011111111111111111111111111111) (= (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7146 (v!3180 (underlying!448 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!131595 d!40119))

(declare-fun d!40121 () Bool)

(assert (=> d!40121 (= (valid!526 thiss!992) (valid!525 (v!3180 (underlying!448 thiss!992))))))

(declare-fun bs!5453 () Bool)

(assert (= bs!5453 d!40121))

(declare-fun m!155243 () Bool)

(assert (=> bs!5453 m!155243))

(assert (=> start!14180 d!40121))

(declare-fun b!131967 () Bool)

(declare-fun e!86043 () Bool)

(declare-fun e!86044 () Bool)

(assert (=> b!131967 (= e!86043 e!86044)))

(declare-fun lt!68688 () (_ BitVec 64))

(assert (=> b!131967 (= lt!68688 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68689 () Unit!4113)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4743 (_ BitVec 64) (_ BitVec 32)) Unit!4113)

(assert (=> b!131967 (= lt!68689 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000))))

(assert (=> b!131967 (arrayContainsKey!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000)))

(declare-fun lt!68687 () Unit!4113)

(assert (=> b!131967 (= lt!68687 lt!68689)))

(declare-fun res!63522 () Bool)

(assert (=> b!131967 (= res!63522 (= (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))) (Found!277 #b00000000000000000000000000000000)))))

(assert (=> b!131967 (=> (not res!63522) (not e!86044))))

(declare-fun bm!14476 () Bool)

(declare-fun call!14479 () Bool)

(assert (=> bm!14476 (= call!14479 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!131968 () Bool)

(assert (=> b!131968 (= e!86044 call!14479)))

(declare-fun b!131969 () Bool)

(assert (=> b!131969 (= e!86043 call!14479)))

(declare-fun d!40123 () Bool)

(declare-fun res!63521 () Bool)

(declare-fun e!86042 () Bool)

(assert (=> d!40123 (=> res!63521 e!86042)))

(assert (=> d!40123 (= res!63521 (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> d!40123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))) e!86042)))

(declare-fun b!131970 () Bool)

(assert (=> b!131970 (= e!86042 e!86043)))

(declare-fun c!24409 () Bool)

(assert (=> b!131970 (= c!24409 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40123 (not res!63521)) b!131970))

(assert (= (and b!131970 c!24409) b!131967))

(assert (= (and b!131970 (not c!24409)) b!131969))

(assert (= (and b!131967 res!63522) b!131968))

(assert (= (or b!131968 b!131969) bm!14476))

(assert (=> b!131967 m!155235))

(declare-fun m!155245 () Bool)

(assert (=> b!131967 m!155245))

(declare-fun m!155247 () Bool)

(assert (=> b!131967 m!155247))

(assert (=> b!131967 m!155235))

(declare-fun m!155249 () Bool)

(assert (=> b!131967 m!155249))

(declare-fun m!155251 () Bool)

(assert (=> bm!14476 m!155251))

(assert (=> b!131970 m!155235))

(assert (=> b!131970 m!155235))

(assert (=> b!131970 m!155239))

(assert (=> b!131604 d!40123))

(declare-fun d!40125 () Bool)

(assert (=> d!40125 (= (array_inv!1425 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvsge (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131609 d!40125))

(declare-fun d!40127 () Bool)

(assert (=> d!40127 (= (array_inv!1426 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvsge (size!2512 (_values!2836 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!131609 d!40127))

(declare-fun d!40129 () Bool)

(assert (=> d!40129 (= (array_inv!1425 (_keys!4599 newMap!16)) (bvsge (size!2511 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131600 d!40129))

(declare-fun d!40131 () Bool)

(assert (=> d!40131 (= (array_inv!1426 (_values!2836 newMap!16)) (bvsge (size!2512 (_values!2836 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!131600 d!40131))

(declare-fun mapIsEmpty!4629 () Bool)

(declare-fun mapRes!4629 () Bool)

(assert (=> mapIsEmpty!4629 mapRes!4629))

(declare-fun condMapEmpty!4629 () Bool)

(declare-fun mapDefault!4629 () ValueCell!1091)

(assert (=> mapNonEmpty!4613 (= condMapEmpty!4629 (= mapRest!4613 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4629)))))

(declare-fun e!86049 () Bool)

(assert (=> mapNonEmpty!4613 (= tp!11154 (and e!86049 mapRes!4629))))

(declare-fun b!131977 () Bool)

(declare-fun e!86050 () Bool)

(assert (=> b!131977 (= e!86050 tp_is_empty!2869)))

(declare-fun b!131978 () Bool)

(assert (=> b!131978 (= e!86049 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4629 () Bool)

(declare-fun tp!11181 () Bool)

(assert (=> mapNonEmpty!4629 (= mapRes!4629 (and tp!11181 e!86050))))

(declare-fun mapRest!4629 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapValue!4629 () ValueCell!1091)

(declare-fun mapKey!4629 () (_ BitVec 32))

(assert (=> mapNonEmpty!4629 (= mapRest!4613 (store mapRest!4629 mapKey!4629 mapValue!4629))))

(assert (= (and mapNonEmpty!4613 condMapEmpty!4629) mapIsEmpty!4629))

(assert (= (and mapNonEmpty!4613 (not condMapEmpty!4629)) mapNonEmpty!4629))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1091) mapValue!4629)) b!131977))

(assert (= (and mapNonEmpty!4613 ((_ is ValueCellFull!1091) mapDefault!4629)) b!131978))

(declare-fun m!155253 () Bool)

(assert (=> mapNonEmpty!4629 m!155253))

(declare-fun mapIsEmpty!4630 () Bool)

(declare-fun mapRes!4630 () Bool)

(assert (=> mapIsEmpty!4630 mapRes!4630))

(declare-fun condMapEmpty!4630 () Bool)

(declare-fun mapDefault!4630 () ValueCell!1091)

(assert (=> mapNonEmpty!4614 (= condMapEmpty!4630 (= mapRest!4614 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4630)))))

(declare-fun e!86051 () Bool)

(assert (=> mapNonEmpty!4614 (= tp!11151 (and e!86051 mapRes!4630))))

(declare-fun b!131979 () Bool)

(declare-fun e!86052 () Bool)

(assert (=> b!131979 (= e!86052 tp_is_empty!2869)))

(declare-fun b!131980 () Bool)

(assert (=> b!131980 (= e!86051 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4630 () Bool)

(declare-fun tp!11182 () Bool)

(assert (=> mapNonEmpty!4630 (= mapRes!4630 (and tp!11182 e!86052))))

(declare-fun mapValue!4630 () ValueCell!1091)

(declare-fun mapKey!4630 () (_ BitVec 32))

(declare-fun mapRest!4630 () (Array (_ BitVec 32) ValueCell!1091))

(assert (=> mapNonEmpty!4630 (= mapRest!4614 (store mapRest!4630 mapKey!4630 mapValue!4630))))

(assert (= (and mapNonEmpty!4614 condMapEmpty!4630) mapIsEmpty!4630))

(assert (= (and mapNonEmpty!4614 (not condMapEmpty!4630)) mapNonEmpty!4630))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1091) mapValue!4630)) b!131979))

(assert (= (and mapNonEmpty!4614 ((_ is ValueCellFull!1091) mapDefault!4630)) b!131980))

(declare-fun m!155255 () Bool)

(assert (=> mapNonEmpty!4630 m!155255))

(declare-fun b_lambda!5863 () Bool)

(assert (= b_lambda!5861 (or (and b!131609 b_free!2905) (and b!131600 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))))) b_lambda!5863)))

(check-sat (not b!131830) (not d!40115) (not bm!14473) (not mapNonEmpty!4629) (not bm!14466) (not b!131829) (not b!131935) b_and!8159 (not b!131739) tp_is_empty!2869 (not b_lambda!5859) (not b!131855) (not bm!14439) (not d!40105) (not bm!14476) (not bm!14438) (not b_next!2907) (not b!131941) (not b!131871) (not d!40121) (not b!131879) (not d!40113) (not b!131865) (not bm!14429) (not b!131851) (not bm!14449) (not b!131840) (not b!131870) (not bm!14430) (not b_next!2905) (not bm!14470) (not bm!14447) (not bm!14443) (not b!131923) (not bm!14435) (not bm!14445) (not bm!14465) (not mapNonEmpty!4630) (not b!131939) (not bm!14464) (not b!131878) (not b_lambda!5863) (not bm!14427) (not b!131958) (not b!131925) (not b!131929) (not b!131880) (not b!131846) (not b!131933) (not b!131970) (not b!131967) (not bm!14448) (not d!40111) (not bm!14440) (not d!40107) b_and!8157 (not b!131957) (not b!131940) (not b!131956) (not b!131737))
(check-sat b_and!8157 b_and!8159 (not b_next!2905) (not b_next!2907))
(get-model)

(declare-fun b!131993 () Bool)

(declare-fun c!24417 () Bool)

(declare-fun lt!68696 () (_ BitVec 64))

(assert (=> b!131993 (= c!24417 (= lt!68696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!86060 () SeekEntryResult!277)

(declare-fun e!86059 () SeekEntryResult!277)

(assert (=> b!131993 (= e!86060 e!86059)))

(declare-fun b!131994 () Bool)

(declare-fun lt!68698 () SeekEntryResult!277)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4743 (_ BitVec 32)) SeekEntryResult!277)

(assert (=> b!131994 (= e!86059 (seekKeyOrZeroReturnVacant!0 (x!15504 lt!68698) (index!3269 lt!68698) (index!3269 lt!68698) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun b!131995 () Bool)

(declare-fun e!86061 () SeekEntryResult!277)

(assert (=> b!131995 (= e!86061 Undefined!277)))

(declare-fun b!131996 () Bool)

(assert (=> b!131996 (= e!86059 (MissingZero!277 (index!3269 lt!68698)))))

(declare-fun b!131997 () Bool)

(assert (=> b!131997 (= e!86060 (Found!277 (index!3269 lt!68698)))))

(declare-fun lt!68697 () SeekEntryResult!277)

(declare-fun d!40133 () Bool)

(assert (=> d!40133 (and (or ((_ is Undefined!277) lt!68697) (not ((_ is Found!277) lt!68697)) (and (bvsge (index!3268 lt!68697) #b00000000000000000000000000000000) (bvslt (index!3268 lt!68697) (size!2511 (_keys!4599 newMap!16))))) (or ((_ is Undefined!277) lt!68697) ((_ is Found!277) lt!68697) (not ((_ is MissingZero!277) lt!68697)) (and (bvsge (index!3267 lt!68697) #b00000000000000000000000000000000) (bvslt (index!3267 lt!68697) (size!2511 (_keys!4599 newMap!16))))) (or ((_ is Undefined!277) lt!68697) ((_ is Found!277) lt!68697) ((_ is MissingZero!277) lt!68697) (not ((_ is MissingVacant!277) lt!68697)) (and (bvsge (index!3270 lt!68697) #b00000000000000000000000000000000) (bvslt (index!3270 lt!68697) (size!2511 (_keys!4599 newMap!16))))) (or ((_ is Undefined!277) lt!68697) (ite ((_ is Found!277) lt!68697) (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68697)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (ite ((_ is MissingZero!277) lt!68697) (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3267 lt!68697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!277) lt!68697) (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3270 lt!68697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40133 (= lt!68697 e!86061)))

(declare-fun c!24418 () Bool)

(assert (=> d!40133 (= c!24418 (and ((_ is Intermediate!277) lt!68698) (undefined!1089 lt!68698)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4743 (_ BitVec 32)) SeekEntryResult!277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!40133 (= lt!68698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (mask!7146 newMap!16)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(assert (=> d!40133 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40133 (= (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)) lt!68697)))

(declare-fun b!131998 () Bool)

(assert (=> b!131998 (= e!86061 e!86060)))

(assert (=> b!131998 (= lt!68696 (select (arr!2242 (_keys!4599 newMap!16)) (index!3269 lt!68698)))))

(declare-fun c!24416 () Bool)

(assert (=> b!131998 (= c!24416 (= lt!68696 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!40133 c!24418) b!131995))

(assert (= (and d!40133 (not c!24418)) b!131998))

(assert (= (and b!131998 c!24416) b!131997))

(assert (= (and b!131998 (not c!24416)) b!131993))

(assert (= (and b!131993 c!24417) b!131996))

(assert (= (and b!131993 (not c!24417)) b!131994))

(assert (=> b!131994 m!154997))

(declare-fun m!155257 () Bool)

(assert (=> b!131994 m!155257))

(declare-fun m!155259 () Bool)

(assert (=> d!40133 m!155259))

(declare-fun m!155261 () Bool)

(assert (=> d!40133 m!155261))

(assert (=> d!40133 m!154997))

(declare-fun m!155263 () Bool)

(assert (=> d!40133 m!155263))

(declare-fun m!155265 () Bool)

(assert (=> d!40133 m!155265))

(declare-fun m!155267 () Bool)

(assert (=> d!40133 m!155267))

(assert (=> d!40133 m!154997))

(assert (=> d!40133 m!155261))

(declare-fun m!155269 () Bool)

(assert (=> d!40133 m!155269))

(declare-fun m!155271 () Bool)

(assert (=> b!131998 m!155271))

(assert (=> b!131840 d!40133))

(declare-fun d!40135 () Bool)

(assert (=> d!40135 (= (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131935 d!40135))

(assert (=> d!40115 d!40119))

(declare-fun d!40137 () Bool)

(assert (=> d!40137 (= (get!1474 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!131871 d!40137))

(assert (=> bm!14439 d!40133))

(declare-fun d!40139 () Bool)

(assert (=> d!40139 (= (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!131957 d!40139))

(declare-fun d!40141 () Bool)

(declare-fun e!86062 () Bool)

(assert (=> d!40141 e!86062))

(declare-fun res!63523 () Bool)

(assert (=> d!40141 (=> res!63523 e!86062)))

(declare-fun lt!68699 () Bool)

(assert (=> d!40141 (= res!63523 (not lt!68699))))

(declare-fun lt!68702 () Bool)

(assert (=> d!40141 (= lt!68699 lt!68702)))

(declare-fun lt!68701 () Unit!4113)

(declare-fun e!86063 () Unit!4113)

(assert (=> d!40141 (= lt!68701 e!86063)))

(declare-fun c!24419 () Bool)

(assert (=> d!40141 (= c!24419 lt!68702)))

(assert (=> d!40141 (= lt!68702 (containsKey!173 (toList!849 e!85964) (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601)))))))

(assert (=> d!40141 (= (contains!883 e!85964 (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601)))) lt!68699)))

(declare-fun b!131999 () Bool)

(declare-fun lt!68700 () Unit!4113)

(assert (=> b!131999 (= e!86063 lt!68700)))

(assert (=> b!131999 (= lt!68700 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 e!85964) (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601)))))))

(assert (=> b!131999 (isDefined!123 (getValueByKey!169 (toList!849 e!85964) (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601)))))))

(declare-fun b!132000 () Bool)

(declare-fun Unit!4119 () Unit!4113)

(assert (=> b!132000 (= e!86063 Unit!4119)))

(declare-fun b!132001 () Bool)

(assert (=> b!132001 (= e!86062 (isDefined!123 (getValueByKey!169 (toList!849 e!85964) (ite c!24379 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601))))))))

(assert (= (and d!40141 c!24419) b!131999))

(assert (= (and d!40141 (not c!24419)) b!132000))

(assert (= (and d!40141 (not res!63523)) b!132001))

(declare-fun m!155273 () Bool)

(assert (=> d!40141 m!155273))

(declare-fun m!155275 () Bool)

(assert (=> b!131999 m!155275))

(declare-fun m!155277 () Bool)

(assert (=> b!131999 m!155277))

(assert (=> b!131999 m!155277))

(declare-fun m!155279 () Bool)

(assert (=> b!131999 m!155279))

(assert (=> b!132001 m!155277))

(assert (=> b!132001 m!155277))

(assert (=> b!132001 m!155279))

(assert (=> bm!14429 d!40141))

(declare-fun b!132002 () Bool)

(declare-fun e!86069 () Bool)

(assert (=> b!132002 (= e!86069 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40143 () Bool)

(declare-fun e!86076 () Bool)

(assert (=> d!40143 e!86076))

(declare-fun res!63529 () Bool)

(assert (=> d!40143 (=> (not res!63529) (not e!86076))))

(assert (=> d!40143 (= res!63529 (or (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))))

(declare-fun lt!68712 () ListLongMap!1667)

(declare-fun lt!68715 () ListLongMap!1667)

(assert (=> d!40143 (= lt!68712 lt!68715)))

(declare-fun lt!68704 () Unit!4113)

(declare-fun e!86072 () Unit!4113)

(assert (=> d!40143 (= lt!68704 e!86072)))

(declare-fun c!24422 () Bool)

(declare-fun e!86075 () Bool)

(assert (=> d!40143 (= c!24422 e!86075)))

(declare-fun res!63531 () Bool)

(assert (=> d!40143 (=> (not res!63531) (not e!86075))))

(assert (=> d!40143 (= res!63531 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun e!86065 () ListLongMap!1667)

(assert (=> d!40143 (= lt!68715 e!86065)))

(declare-fun c!24423 () Bool)

(assert (=> d!40143 (= c!24423 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40143 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40143 (= (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!68712)))

(declare-fun b!132003 () Bool)

(declare-fun e!86071 () Bool)

(declare-fun e!86064 () Bool)

(assert (=> b!132003 (= e!86071 e!86064)))

(declare-fun res!63525 () Bool)

(declare-fun call!14482 () Bool)

(assert (=> b!132003 (= res!63525 call!14482)))

(assert (=> b!132003 (=> (not res!63525) (not e!86064))))

(declare-fun b!132004 () Bool)

(declare-fun e!86067 () Bool)

(assert (=> b!132004 (= e!86067 (= (apply!115 lt!68712 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)) (get!1472 (select (arr!2243 (_values!2836 newMap!16)) #b00000000000000000000000000000000) (dynLambda!417 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132004 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2512 (_values!2836 newMap!16))))))

(assert (=> b!132004 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132005 () Bool)

(declare-fun e!86073 () ListLongMap!1667)

(assert (=> b!132005 (= e!86065 e!86073)))

(declare-fun c!24424 () Bool)

(assert (=> b!132005 (= c!24424 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132006 () Bool)

(declare-fun res!63528 () Bool)

(assert (=> b!132006 (=> (not res!63528) (not e!86076))))

(declare-fun e!86066 () Bool)

(assert (=> b!132006 (= res!63528 e!86066)))

(declare-fun c!24420 () Bool)

(assert (=> b!132006 (= c!24420 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132007 () Bool)

(assert (=> b!132007 (= e!86071 (not call!14482))))

(declare-fun bm!14477 () Bool)

(declare-fun call!14485 () Bool)

(assert (=> bm!14477 (= call!14485 (contains!883 lt!68712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132008 () Bool)

(declare-fun call!14486 () ListLongMap!1667)

(assert (=> b!132008 (= e!86065 (+!162 call!14486 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16))))))

(declare-fun b!132009 () Bool)

(declare-fun e!86068 () ListLongMap!1667)

(declare-fun call!14483 () ListLongMap!1667)

(assert (=> b!132009 (= e!86068 call!14483)))

(declare-fun bm!14478 () Bool)

(assert (=> bm!14478 (= call!14482 (contains!883 lt!68712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14479 () Bool)

(declare-fun call!14480 () ListLongMap!1667)

(assert (=> bm!14479 (= call!14480 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!132010 () Bool)

(declare-fun Unit!4120 () Unit!4113)

(assert (=> b!132010 (= e!86072 Unit!4120)))

(declare-fun b!132011 () Bool)

(declare-fun call!14484 () ListLongMap!1667)

(assert (=> b!132011 (= e!86068 call!14484)))

(declare-fun b!132012 () Bool)

(assert (=> b!132012 (= e!86064 (= (apply!115 lt!68712 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 newMap!16)))))

(declare-fun bm!14480 () Bool)

(assert (=> bm!14480 (= call!14483 call!14486)))

(declare-fun b!132013 () Bool)

(declare-fun e!86074 () Bool)

(assert (=> b!132013 (= e!86066 e!86074)))

(declare-fun res!63524 () Bool)

(assert (=> b!132013 (= res!63524 call!14485)))

(assert (=> b!132013 (=> (not res!63524) (not e!86074))))

(declare-fun b!132014 () Bool)

(assert (=> b!132014 (= e!86075 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14481 () Bool)

(declare-fun call!14481 () ListLongMap!1667)

(assert (=> bm!14481 (= call!14484 call!14481)))

(declare-fun b!132015 () Bool)

(declare-fun res!63527 () Bool)

(assert (=> b!132015 (=> (not res!63527) (not e!86076))))

(declare-fun e!86070 () Bool)

(assert (=> b!132015 (= res!63527 e!86070)))

(declare-fun res!63526 () Bool)

(assert (=> b!132015 (=> res!63526 e!86070)))

(assert (=> b!132015 (= res!63526 (not e!86069))))

(declare-fun res!63532 () Bool)

(assert (=> b!132015 (=> (not res!63532) (not e!86069))))

(assert (=> b!132015 (= res!63532 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132016 () Bool)

(assert (=> b!132016 (= e!86066 (not call!14485))))

(declare-fun b!132017 () Bool)

(declare-fun c!24425 () Bool)

(assert (=> b!132017 (= c!24425 (and (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132017 (= e!86073 e!86068)))

(declare-fun b!132018 () Bool)

(assert (=> b!132018 (= e!86070 e!86067)))

(declare-fun res!63530 () Bool)

(assert (=> b!132018 (=> (not res!63530) (not e!86067))))

(assert (=> b!132018 (= res!63530 (contains!883 lt!68712 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun bm!14482 () Bool)

(assert (=> bm!14482 (= call!14481 call!14480)))

(declare-fun b!132019 () Bool)

(assert (=> b!132019 (= e!86074 (= (apply!115 lt!68712 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 newMap!16)))))

(declare-fun b!132020 () Bool)

(declare-fun lt!68709 () Unit!4113)

(assert (=> b!132020 (= e!86072 lt!68709)))

(declare-fun lt!68705 () ListLongMap!1667)

(assert (=> b!132020 (= lt!68705 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68714 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68723 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68723 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68708 () Unit!4113)

(assert (=> b!132020 (= lt!68708 (addStillContains!91 lt!68705 lt!68714 (zeroValue!2709 newMap!16) lt!68723))))

(assert (=> b!132020 (contains!883 (+!162 lt!68705 (tuple2!2579 lt!68714 (zeroValue!2709 newMap!16))) lt!68723)))

(declare-fun lt!68719 () Unit!4113)

(assert (=> b!132020 (= lt!68719 lt!68708)))

(declare-fun lt!68703 () ListLongMap!1667)

(assert (=> b!132020 (= lt!68703 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68717 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68717 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68716 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68716 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68706 () Unit!4113)

(assert (=> b!132020 (= lt!68706 (addApplyDifferent!91 lt!68703 lt!68717 (minValue!2709 newMap!16) lt!68716))))

(assert (=> b!132020 (= (apply!115 (+!162 lt!68703 (tuple2!2579 lt!68717 (minValue!2709 newMap!16))) lt!68716) (apply!115 lt!68703 lt!68716))))

(declare-fun lt!68724 () Unit!4113)

(assert (=> b!132020 (= lt!68724 lt!68706)))

(declare-fun lt!68707 () ListLongMap!1667)

(assert (=> b!132020 (= lt!68707 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68722 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68711 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68711 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68718 () Unit!4113)

(assert (=> b!132020 (= lt!68718 (addApplyDifferent!91 lt!68707 lt!68722 (zeroValue!2709 newMap!16) lt!68711))))

(assert (=> b!132020 (= (apply!115 (+!162 lt!68707 (tuple2!2579 lt!68722 (zeroValue!2709 newMap!16))) lt!68711) (apply!115 lt!68707 lt!68711))))

(declare-fun lt!68720 () Unit!4113)

(assert (=> b!132020 (= lt!68720 lt!68718)))

(declare-fun lt!68710 () ListLongMap!1667)

(assert (=> b!132020 (= lt!68710 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68713 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68721 () (_ BitVec 64))

(assert (=> b!132020 (= lt!68721 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132020 (= lt!68709 (addApplyDifferent!91 lt!68710 lt!68713 (minValue!2709 newMap!16) lt!68721))))

(assert (=> b!132020 (= (apply!115 (+!162 lt!68710 (tuple2!2579 lt!68713 (minValue!2709 newMap!16))) lt!68721) (apply!115 lt!68710 lt!68721))))

(declare-fun b!132021 () Bool)

(assert (=> b!132021 (= e!86073 call!14483)))

(declare-fun b!132022 () Bool)

(assert (=> b!132022 (= e!86076 e!86071)))

(declare-fun c!24421 () Bool)

(assert (=> b!132022 (= c!24421 (not (= (bvand (extraKeys!2620 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14483 () Bool)

(assert (=> bm!14483 (= call!14486 (+!162 (ite c!24423 call!14480 (ite c!24424 call!14481 call!14484)) (ite (or c!24423 c!24424) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 newMap!16)) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16)))))))

(assert (= (and d!40143 c!24423) b!132008))

(assert (= (and d!40143 (not c!24423)) b!132005))

(assert (= (and b!132005 c!24424) b!132021))

(assert (= (and b!132005 (not c!24424)) b!132017))

(assert (= (and b!132017 c!24425) b!132009))

(assert (= (and b!132017 (not c!24425)) b!132011))

(assert (= (or b!132009 b!132011) bm!14481))

(assert (= (or b!132021 bm!14481) bm!14482))

(assert (= (or b!132021 b!132009) bm!14480))

(assert (= (or b!132008 bm!14482) bm!14479))

(assert (= (or b!132008 bm!14480) bm!14483))

(assert (= (and d!40143 res!63531) b!132014))

(assert (= (and d!40143 c!24422) b!132020))

(assert (= (and d!40143 (not c!24422)) b!132010))

(assert (= (and d!40143 res!63529) b!132015))

(assert (= (and b!132015 res!63532) b!132002))

(assert (= (and b!132015 (not res!63526)) b!132018))

(assert (= (and b!132018 res!63530) b!132004))

(assert (= (and b!132015 res!63527) b!132006))

(assert (= (and b!132006 c!24420) b!132013))

(assert (= (and b!132006 (not c!24420)) b!132016))

(assert (= (and b!132013 res!63524) b!132019))

(assert (= (or b!132013 b!132016) bm!14477))

(assert (= (and b!132006 res!63528) b!132022))

(assert (= (and b!132022 c!24421) b!132003))

(assert (= (and b!132022 (not c!24421)) b!132007))

(assert (= (and b!132003 res!63525) b!132012))

(assert (= (or b!132003 b!132007) bm!14478))

(declare-fun b_lambda!5865 () Bool)

(assert (=> (not b_lambda!5865) (not b!132004)))

(declare-fun t!6145 () Bool)

(declare-fun tb!2401 () Bool)

(assert (=> (and b!131609 (= (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) (defaultEntry!2853 newMap!16)) t!6145) tb!2401))

(declare-fun result!3969 () Bool)

(assert (=> tb!2401 (= result!3969 tp_is_empty!2869)))

(assert (=> b!132004 t!6145))

(declare-fun b_and!8161 () Bool)

(assert (= b_and!8157 (and (=> t!6145 result!3969) b_and!8161)))

(declare-fun t!6147 () Bool)

(declare-fun tb!2403 () Bool)

(assert (=> (and b!131600 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 newMap!16)) t!6147) tb!2403))

(declare-fun result!3971 () Bool)

(assert (= result!3971 result!3969))

(assert (=> b!132004 t!6147))

(declare-fun b_and!8163 () Bool)

(assert (= b_and!8159 (and (=> t!6147 result!3971) b_and!8163)))

(declare-fun m!155281 () Bool)

(assert (=> bm!14479 m!155281))

(declare-fun m!155283 () Bool)

(assert (=> b!132002 m!155283))

(assert (=> b!132002 m!155283))

(declare-fun m!155285 () Bool)

(assert (=> b!132002 m!155285))

(assert (=> b!132018 m!155283))

(assert (=> b!132018 m!155283))

(declare-fun m!155287 () Bool)

(assert (=> b!132018 m!155287))

(declare-fun m!155289 () Bool)

(assert (=> b!132020 m!155289))

(declare-fun m!155291 () Bool)

(assert (=> b!132020 m!155291))

(declare-fun m!155293 () Bool)

(assert (=> b!132020 m!155293))

(declare-fun m!155295 () Bool)

(assert (=> b!132020 m!155295))

(declare-fun m!155297 () Bool)

(assert (=> b!132020 m!155297))

(declare-fun m!155299 () Bool)

(assert (=> b!132020 m!155299))

(declare-fun m!155301 () Bool)

(assert (=> b!132020 m!155301))

(assert (=> b!132020 m!155283))

(declare-fun m!155303 () Bool)

(assert (=> b!132020 m!155303))

(assert (=> b!132020 m!155293))

(declare-fun m!155305 () Bool)

(assert (=> b!132020 m!155305))

(declare-fun m!155307 () Bool)

(assert (=> b!132020 m!155307))

(declare-fun m!155309 () Bool)

(assert (=> b!132020 m!155309))

(assert (=> b!132020 m!155303))

(declare-fun m!155311 () Bool)

(assert (=> b!132020 m!155311))

(declare-fun m!155313 () Bool)

(assert (=> b!132020 m!155313))

(declare-fun m!155315 () Bool)

(assert (=> b!132020 m!155315))

(declare-fun m!155317 () Bool)

(assert (=> b!132020 m!155317))

(assert (=> b!132020 m!155313))

(assert (=> b!132020 m!155281))

(assert (=> b!132020 m!155295))

(declare-fun m!155319 () Bool)

(assert (=> bm!14478 m!155319))

(assert (=> b!132014 m!155283))

(assert (=> b!132014 m!155283))

(assert (=> b!132014 m!155285))

(assert (=> d!40143 m!155267))

(declare-fun m!155321 () Bool)

(assert (=> b!132008 m!155321))

(declare-fun m!155323 () Bool)

(assert (=> b!132012 m!155323))

(declare-fun m!155325 () Bool)

(assert (=> bm!14477 m!155325))

(declare-fun m!155327 () Bool)

(assert (=> b!132004 m!155327))

(assert (=> b!132004 m!155327))

(declare-fun m!155329 () Bool)

(assert (=> b!132004 m!155329))

(declare-fun m!155331 () Bool)

(assert (=> b!132004 m!155331))

(assert (=> b!132004 m!155283))

(assert (=> b!132004 m!155283))

(declare-fun m!155333 () Bool)

(assert (=> b!132004 m!155333))

(assert (=> b!132004 m!155329))

(declare-fun m!155335 () Bool)

(assert (=> b!132019 m!155335))

(declare-fun m!155337 () Bool)

(assert (=> bm!14483 m!155337))

(assert (=> d!40113 d!40143))

(declare-fun d!40145 () Bool)

(assert (=> d!40145 (= (inRange!0 (ite c!24379 (ite c!24374 (index!3268 lt!68589) (ite c!24377 (index!3267 lt!68612) (index!3270 lt!68612))) (ite c!24376 (index!3268 lt!68603) (ite c!24375 (index!3267 lt!68611) (index!3270 lt!68611)))) (mask!7146 newMap!16)) (and (bvsge (ite c!24379 (ite c!24374 (index!3268 lt!68589) (ite c!24377 (index!3267 lt!68612) (index!3270 lt!68612))) (ite c!24376 (index!3268 lt!68603) (ite c!24375 (index!3267 lt!68611) (index!3270 lt!68611)))) #b00000000000000000000000000000000) (bvslt (ite c!24379 (ite c!24374 (index!3268 lt!68589) (ite c!24377 (index!3267 lt!68612) (index!3270 lt!68612))) (ite c!24376 (index!3268 lt!68603) (ite c!24375 (index!3267 lt!68611) (index!3270 lt!68611)))) (bvadd (mask!7146 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14438 d!40145))

(assert (=> bm!14427 d!40113))

(declare-fun d!40147 () Bool)

(declare-fun res!63537 () Bool)

(declare-fun e!86081 () Bool)

(assert (=> d!40147 (=> res!63537 e!86081)))

(assert (=> d!40147 (= res!63537 (= (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!40147 (= (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000) e!86081)))

(declare-fun b!132027 () Bool)

(declare-fun e!86082 () Bool)

(assert (=> b!132027 (= e!86081 e!86082)))

(declare-fun res!63538 () Bool)

(assert (=> b!132027 (=> (not res!63538) (not e!86082))))

(assert (=> b!132027 (= res!63538 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132028 () Bool)

(assert (=> b!132028 (= e!86082 (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40147 (not res!63537)) b!132027))

(assert (= (and b!132027 res!63538) b!132028))

(assert (=> d!40147 m!155283))

(assert (=> b!132028 m!154997))

(declare-fun m!155339 () Bool)

(assert (=> b!132028 m!155339))

(assert (=> bm!14447 d!40147))

(declare-fun b!132063 () Bool)

(declare-fun e!86105 () Unit!4113)

(declare-fun lt!68800 () Unit!4113)

(assert (=> b!132063 (= e!86105 lt!68800)))

(assert (=> b!132063 (= lt!68800 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68811 () SeekEntryResult!277)

(declare-fun call!14495 () SeekEntryResult!277)

(assert (=> b!132063 (= lt!68811 call!14495)))

(declare-fun c!24436 () Bool)

(assert (=> b!132063 (= c!24436 ((_ is MissingZero!277) lt!68811))))

(declare-fun e!86099 () Bool)

(assert (=> b!132063 e!86099))

(declare-fun b!132064 () Bool)

(declare-fun e!86106 () Bool)

(declare-fun e!86102 () Bool)

(assert (=> b!132064 (= e!86106 e!86102)))

(declare-fun res!63565 () Bool)

(declare-fun call!14498 () Bool)

(assert (=> b!132064 (= res!63565 call!14498)))

(assert (=> b!132064 (=> (not res!63565) (not e!86102))))

(declare-fun b!132065 () Bool)

(declare-fun res!63561 () Bool)

(declare-fun e!86104 () Bool)

(assert (=> b!132065 (=> (not res!63561) (not e!86104))))

(assert (=> b!132065 (= res!63561 call!14498)))

(assert (=> b!132065 (= e!86099 e!86104)))

(declare-fun b!132066 () Bool)

(declare-fun res!63558 () Bool)

(assert (=> b!132066 (=> (not res!63558) (not e!86104))))

(assert (=> b!132066 (= res!63558 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3267 lt!68811)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132068 () Bool)

(declare-fun call!14497 () Bool)

(assert (=> b!132068 (= e!86102 (not call!14497))))

(declare-fun b!132069 () Bool)

(declare-fun e!86101 () Unit!4113)

(declare-fun Unit!4121 () Unit!4113)

(assert (=> b!132069 (= e!86101 Unit!4121)))

(declare-fun b!132070 () Bool)

(assert (=> b!132070 (= e!86106 ((_ is Undefined!277) lt!68811))))

(declare-fun e!86100 () Bool)

(declare-fun lt!68806 () tuple2!2580)

(declare-fun b!132071 () Bool)

(assert (=> b!132071 (= e!86100 (= (map!1387 (_2!1301 lt!68806)) (+!162 (map!1387 newMap!16) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!132072 () Bool)

(assert (=> b!132072 (= e!86104 (not call!14497))))

(declare-fun bm!14492 () Bool)

(assert (=> bm!14492 (= call!14497 (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!132073 () Bool)

(declare-fun Unit!4122 () Unit!4113)

(assert (=> b!132073 (= e!86105 Unit!4122)))

(declare-fun lt!68795 () Unit!4113)

(assert (=> b!132073 (= lt!68795 (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68808 () SeekEntryResult!277)

(assert (=> b!132073 (= lt!68808 call!14495)))

(declare-fun res!63564 () Bool)

(assert (=> b!132073 (= res!63564 ((_ is Found!277) lt!68808))))

(declare-fun e!86103 () Bool)

(assert (=> b!132073 (=> (not res!63564) (not e!86103))))

(assert (=> b!132073 e!86103))

(declare-fun lt!68801 () Unit!4113)

(assert (=> b!132073 (= lt!68801 lt!68795)))

(assert (=> b!132073 false))

(declare-fun b!132074 () Bool)

(declare-fun Unit!4123 () Unit!4113)

(assert (=> b!132074 (= e!86101 Unit!4123)))

(declare-fun lt!68792 () Unit!4113)

(declare-fun lemmaArrayContainsKeyThenInListMap!41 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) (_ BitVec 32) Int) Unit!4113)

(assert (=> b!132074 (= lt!68792 (lemmaArrayContainsKeyThenInListMap!41 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(assert (=> b!132074 (contains!883 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))

(declare-fun lt!68789 () Unit!4113)

(assert (=> b!132074 (= lt!68789 lt!68792)))

(assert (=> b!132074 false))

(declare-fun b!132067 () Bool)

(declare-fun res!63560 () Bool)

(declare-fun call!14496 () Bool)

(assert (=> b!132067 (= res!63560 call!14496)))

(assert (=> b!132067 (=> (not res!63560) (not e!86103))))

(declare-fun d!40149 () Bool)

(assert (=> d!40149 e!86100))

(declare-fun res!63563 () Bool)

(assert (=> d!40149 (=> (not res!63563) (not e!86100))))

(assert (=> d!40149 (= res!63563 (_1!1301 lt!68806))))

(assert (=> d!40149 (= lt!68806 (tuple2!2581 true (LongMapFixedSize!1091 (defaultEntry!2853 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (bvadd (_size!594 newMap!16) #b00000000000000000000000000000001) (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))) (_vacant!594 newMap!16))))))

(declare-fun lt!68796 () Unit!4113)

(declare-fun lt!68793 () Unit!4113)

(assert (=> d!40149 (= lt!68796 lt!68793)))

(declare-fun lt!68804 () array!4745)

(declare-fun lt!68785 () array!4743)

(assert (=> d!40149 (contains!883 (getCurrentListMap!517 lt!68785 lt!68804 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601))))))

(assert (=> d!40149 (= lt!68793 (lemmaValidKeyInArrayIsInListMap!119 lt!68785 lt!68804 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40149 (= lt!68804 (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))))))

(assert (=> d!40149 (= lt!68785 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun lt!68794 () Unit!4113)

(declare-fun lt!68798 () Unit!4113)

(assert (=> d!40149 (= lt!68794 lt!68798)))

(declare-fun lt!68802 () array!4743)

(assert (=> d!40149 (= (arrayCountValidKeys!0 lt!68802 (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (bvadd (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4743 (_ BitVec 32)) Unit!4113)

(assert (=> d!40149 (= lt!68798 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!68802 (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601))))))

(assert (=> d!40149 (= lt!68802 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun lt!68812 () Unit!4113)

(declare-fun lt!68803 () Unit!4113)

(assert (=> d!40149 (= lt!68812 lt!68803)))

(declare-fun lt!68799 () array!4743)

(assert (=> d!40149 (arrayContainsKey!0 lt!68799 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!40149 (= lt!68803 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!68799 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601))))))

(assert (=> d!40149 (= lt!68799 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun lt!68790 () Unit!4113)

(declare-fun lt!68797 () Unit!4113)

(assert (=> d!40149 (= lt!68790 lt!68797)))

(assert (=> d!40149 (= (+!162 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!41 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4113)

(assert (=> d!40149 (= lt!68797 (lemmaAddValidKeyToArrayThenAddPairToListMap!41 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68814 () Unit!4113)

(declare-fun lt!68807 () Unit!4113)

(assert (=> d!40149 (= lt!68814 lt!68807)))

(assert (=> d!40149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))) (mask!7146 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4743 (_ BitVec 32) (_ BitVec 32)) Unit!4113)

(assert (=> d!40149 (= lt!68807 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (mask!7146 newMap!16)))))

(declare-fun lt!68786 () Unit!4113)

(declare-fun lt!68810 () Unit!4113)

(assert (=> d!40149 (= lt!68786 lt!68810)))

(assert (=> d!40149 (= (arrayCountValidKeys!0 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))) #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4599 newMap!16) #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4743 (_ BitVec 32) (_ BitVec 64)) Unit!4113)

(assert (=> d!40149 (= lt!68810 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4599 newMap!16) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!68805 () Unit!4113)

(declare-fun lt!68813 () Unit!4113)

(assert (=> d!40149 (= lt!68805 lt!68813)))

(declare-fun lt!68787 () (_ BitVec 32))

(declare-fun lt!68791 () List!1707)

(assert (=> d!40149 (arrayNoDuplicates!0 (array!4744 (store (arr!2242 (_keys!4599 newMap!16)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) (size!2511 (_keys!4599 newMap!16))) lt!68787 lt!68791)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4743 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1707) Unit!4113)

(assert (=> d!40149 (= lt!68813 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601)) lt!68787 lt!68791))))

(assert (=> d!40149 (= lt!68791 Nil!1704)))

(assert (=> d!40149 (= lt!68787 #b00000000000000000000000000000000)))

(declare-fun lt!68809 () Unit!4113)

(assert (=> d!40149 (= lt!68809 e!86101)))

(declare-fun c!24435 () Bool)

(assert (=> d!40149 (= c!24435 (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!68788 () Unit!4113)

(assert (=> d!40149 (= lt!68788 e!86105)))

(declare-fun c!24434 () Bool)

(assert (=> d!40149 (= c!24434 (contains!883 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!40149 (valid!525 newMap!16)))

(assert (=> d!40149 (= (updateHelperNewKey!60 newMap!16 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!24378 (index!3270 lt!68601) (index!3267 lt!68601))) lt!68806)))

(declare-fun bm!14493 () Bool)

(assert (=> bm!14493 (= call!14496 (inRange!0 (ite c!24434 (index!3268 lt!68808) (ite c!24436 (index!3267 lt!68811) (index!3270 lt!68811))) (mask!7146 newMap!16)))))

(declare-fun bm!14494 () Bool)

(assert (=> bm!14494 (= call!14498 call!14496)))

(declare-fun b!132075 () Bool)

(declare-fun c!24437 () Bool)

(assert (=> b!132075 (= c!24437 ((_ is MissingVacant!277) lt!68811))))

(assert (=> b!132075 (= e!86099 e!86106)))

(declare-fun b!132076 () Bool)

(declare-fun res!63559 () Bool)

(assert (=> b!132076 (=> (not res!63559) (not e!86100))))

(assert (=> b!132076 (= res!63559 (valid!525 (_2!1301 lt!68806)))))

(declare-fun b!132077 () Bool)

(assert (=> b!132077 (= e!86103 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68808)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!132078 () Bool)

(declare-fun res!63557 () Bool)

(assert (=> b!132078 (=> (not res!63557) (not e!86100))))

(assert (=> b!132078 (= res!63557 (contains!883 (map!1387 (_2!1301 lt!68806)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!132079 () Bool)

(declare-fun res!63562 () Bool)

(assert (=> b!132079 (= res!63562 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3270 lt!68811)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132079 (=> (not res!63562) (not e!86102))))

(declare-fun bm!14495 () Bool)

(assert (=> bm!14495 (= call!14495 (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(assert (= (and d!40149 c!24434) b!132073))

(assert (= (and d!40149 (not c!24434)) b!132063))

(assert (= (and b!132073 res!63564) b!132067))

(assert (= (and b!132067 res!63560) b!132077))

(assert (= (and b!132063 c!24436) b!132065))

(assert (= (and b!132063 (not c!24436)) b!132075))

(assert (= (and b!132065 res!63561) b!132066))

(assert (= (and b!132066 res!63558) b!132072))

(assert (= (and b!132075 c!24437) b!132064))

(assert (= (and b!132075 (not c!24437)) b!132070))

(assert (= (and b!132064 res!63565) b!132079))

(assert (= (and b!132079 res!63562) b!132068))

(assert (= (or b!132065 b!132064) bm!14494))

(assert (= (or b!132072 b!132068) bm!14492))

(assert (= (or b!132067 bm!14494) bm!14493))

(assert (= (or b!132073 b!132063) bm!14495))

(assert (= (and d!40149 c!24435) b!132074))

(assert (= (and d!40149 (not c!24435)) b!132069))

(assert (= (and d!40149 res!63563) b!132076))

(assert (= (and b!132076 res!63559) b!132078))

(assert (= (and b!132078 res!63557) b!132071))

(assert (=> b!132074 m!154997))

(declare-fun m!155341 () Bool)

(assert (=> b!132074 m!155341))

(assert (=> b!132074 m!155141))

(assert (=> b!132074 m!155141))

(assert (=> b!132074 m!154997))

(assert (=> b!132074 m!155145))

(assert (=> b!132063 m!154997))

(assert (=> b!132063 m!155159))

(assert (=> d!40149 m!155173))

(assert (=> d!40149 m!155141))

(assert (=> d!40149 m!154997))

(assert (=> d!40149 m!155145))

(declare-fun m!155343 () Bool)

(assert (=> d!40149 m!155343))

(declare-fun m!155345 () Bool)

(assert (=> d!40149 m!155345))

(declare-fun m!155347 () Bool)

(assert (=> d!40149 m!155347))

(assert (=> d!40149 m!154997))

(declare-fun m!155349 () Bool)

(assert (=> d!40149 m!155349))

(declare-fun m!155351 () Bool)

(assert (=> d!40149 m!155351))

(declare-fun m!155353 () Bool)

(assert (=> d!40149 m!155353))

(declare-fun m!155355 () Bool)

(assert (=> d!40149 m!155355))

(assert (=> d!40149 m!155025))

(assert (=> d!40149 m!155141))

(declare-fun m!155357 () Bool)

(assert (=> d!40149 m!155357))

(declare-fun m!155359 () Bool)

(assert (=> d!40149 m!155359))

(assert (=> d!40149 m!154997))

(assert (=> d!40149 m!155011))

(declare-fun m!155361 () Bool)

(assert (=> d!40149 m!155361))

(declare-fun m!155363 () Bool)

(assert (=> d!40149 m!155363))

(assert (=> d!40149 m!155141))

(assert (=> d!40149 m!154997))

(declare-fun m!155365 () Bool)

(assert (=> d!40149 m!155365))

(assert (=> d!40149 m!155343))

(assert (=> d!40149 m!155347))

(declare-fun m!155367 () Bool)

(assert (=> d!40149 m!155367))

(assert (=> d!40149 m!154997))

(declare-fun m!155369 () Bool)

(assert (=> d!40149 m!155369))

(assert (=> d!40149 m!154997))

(assert (=> d!40149 m!155151))

(assert (=> d!40149 m!154997))

(declare-fun m!155371 () Bool)

(assert (=> d!40149 m!155371))

(declare-fun m!155373 () Bool)

(assert (=> d!40149 m!155373))

(declare-fun m!155375 () Bool)

(assert (=> d!40149 m!155375))

(assert (=> d!40149 m!154997))

(declare-fun m!155377 () Bool)

(assert (=> d!40149 m!155377))

(declare-fun m!155379 () Bool)

(assert (=> d!40149 m!155379))

(declare-fun m!155381 () Bool)

(assert (=> b!132078 m!155381))

(assert (=> b!132078 m!155381))

(assert (=> b!132078 m!154997))

(declare-fun m!155383 () Bool)

(assert (=> b!132078 m!155383))

(declare-fun m!155385 () Bool)

(assert (=> b!132077 m!155385))

(assert (=> bm!14492 m!154997))

(assert (=> bm!14492 m!155151))

(assert (=> b!132073 m!154997))

(assert (=> b!132073 m!155157))

(assert (=> bm!14495 m!154997))

(assert (=> bm!14495 m!155113))

(declare-fun m!155387 () Bool)

(assert (=> bm!14493 m!155387))

(declare-fun m!155389 () Bool)

(assert (=> b!132076 m!155389))

(assert (=> b!132071 m!155381))

(assert (=> b!132071 m!154999))

(assert (=> b!132071 m!154999))

(declare-fun m!155391 () Bool)

(assert (=> b!132071 m!155391))

(declare-fun m!155393 () Bool)

(assert (=> b!132066 m!155393))

(declare-fun m!155395 () Bool)

(assert (=> b!132079 m!155395))

(assert (=> bm!14448 d!40149))

(declare-fun b!132080 () Bool)

(declare-fun e!86109 () Bool)

(declare-fun call!14499 () Bool)

(assert (=> b!132080 (= e!86109 call!14499)))

(declare-fun d!40151 () Bool)

(declare-fun res!63568 () Bool)

(declare-fun e!86110 () Bool)

(assert (=> d!40151 (=> res!63568 e!86110)))

(assert (=> d!40151 (= res!63568 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> d!40151 (= (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24406 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1704) Nil!1704)) e!86110)))

(declare-fun b!132081 () Bool)

(assert (=> b!132081 (= e!86109 call!14499)))

(declare-fun bm!14496 () Bool)

(declare-fun c!24438 () Bool)

(assert (=> bm!14496 (= call!14499 (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!24438 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!24406 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1704) Nil!1704)) (ite c!24406 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1704) Nil!1704))))))

(declare-fun b!132082 () Bool)

(declare-fun e!86108 () Bool)

(assert (=> b!132082 (= e!86108 e!86109)))

(assert (=> b!132082 (= c!24438 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132083 () Bool)

(assert (=> b!132083 (= e!86110 e!86108)))

(declare-fun res!63566 () Bool)

(assert (=> b!132083 (=> (not res!63566) (not e!86108))))

(declare-fun e!86107 () Bool)

(assert (=> b!132083 (= res!63566 (not e!86107))))

(declare-fun res!63567 () Bool)

(assert (=> b!132083 (=> (not res!63567) (not e!86107))))

(assert (=> b!132083 (= res!63567 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!132084 () Bool)

(assert (=> b!132084 (= e!86107 (contains!884 (ite c!24406 (Cons!1703 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1704) Nil!1704) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!40151 (not res!63568)) b!132083))

(assert (= (and b!132083 res!63567) b!132084))

(assert (= (and b!132083 res!63566) b!132082))

(assert (= (and b!132082 c!24438) b!132080))

(assert (= (and b!132082 (not c!24438)) b!132081))

(assert (= (or b!132080 b!132081) bm!14496))

(declare-fun m!155397 () Bool)

(assert (=> bm!14496 m!155397))

(declare-fun m!155399 () Bool)

(assert (=> bm!14496 m!155399))

(assert (=> b!132082 m!155397))

(assert (=> b!132082 m!155397))

(declare-fun m!155401 () Bool)

(assert (=> b!132082 m!155401))

(assert (=> b!132083 m!155397))

(assert (=> b!132083 m!155397))

(assert (=> b!132083 m!155401))

(assert (=> b!132084 m!155397))

(assert (=> b!132084 m!155397))

(declare-fun m!155403 () Bool)

(assert (=> b!132084 m!155403))

(assert (=> bm!14473 d!40151))

(declare-fun e!86127 () Bool)

(declare-fun lt!68835 () ListLongMap!1667)

(declare-fun b!132109 () Bool)

(assert (=> b!132109 (= e!86127 (= lt!68835 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!132110 () Bool)

(declare-fun e!86125 () Bool)

(assert (=> b!132110 (= e!86125 e!86127)))

(declare-fun c!24450 () Bool)

(assert (=> b!132110 (= c!24450 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun d!40153 () Bool)

(declare-fun e!86131 () Bool)

(assert (=> d!40153 e!86131))

(declare-fun res!63579 () Bool)

(assert (=> d!40153 (=> (not res!63579) (not e!86131))))

(assert (=> d!40153 (= res!63579 (not (contains!883 lt!68835 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!86128 () ListLongMap!1667)

(assert (=> d!40153 (= lt!68835 e!86128)))

(declare-fun c!24448 () Bool)

(assert (=> d!40153 (= c!24448 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> d!40153 (validMask!0 (mask!7146 (v!3180 (underlying!448 thiss!992))))))

(assert (=> d!40153 (= (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))) lt!68835)))

(declare-fun b!132111 () Bool)

(declare-fun e!86129 () ListLongMap!1667)

(assert (=> b!132111 (= e!86128 e!86129)))

(declare-fun c!24449 () Bool)

(assert (=> b!132111 (= c!24449 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!132112 () Bool)

(declare-fun lt!68830 () Unit!4113)

(declare-fun lt!68829 () Unit!4113)

(assert (=> b!132112 (= lt!68830 lt!68829)))

(declare-fun lt!68834 () (_ BitVec 64))

(declare-fun lt!68832 () (_ BitVec 64))

(declare-fun lt!68833 () V!3473)

(declare-fun lt!68831 () ListLongMap!1667)

(assert (=> b!132112 (not (contains!883 (+!162 lt!68831 (tuple2!2579 lt!68834 lt!68833)) lt!68832))))

(declare-fun addStillNotContains!61 (ListLongMap!1667 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4113)

(assert (=> b!132112 (= lt!68829 (addStillNotContains!61 lt!68831 lt!68834 lt!68833 lt!68832))))

(assert (=> b!132112 (= lt!68832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!132112 (= lt!68833 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132112 (= lt!68834 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!14502 () ListLongMap!1667)

(assert (=> b!132112 (= lt!68831 call!14502)))

(assert (=> b!132112 (= e!86129 (+!162 call!14502 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!132113 () Bool)

(declare-fun e!86130 () Bool)

(assert (=> b!132113 (= e!86130 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132113 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!132114 () Bool)

(declare-fun e!86126 () Bool)

(assert (=> b!132114 (= e!86125 e!86126)))

(assert (=> b!132114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun res!63578 () Bool)

(assert (=> b!132114 (= res!63578 (contains!883 lt!68835 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132114 (=> (not res!63578) (not e!86126))))

(declare-fun b!132115 () Bool)

(assert (=> b!132115 (= e!86131 e!86125)))

(declare-fun c!24447 () Bool)

(assert (=> b!132115 (= c!24447 e!86130)))

(declare-fun res!63577 () Bool)

(assert (=> b!132115 (=> (not res!63577) (not e!86130))))

(assert (=> b!132115 (= res!63577 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!132116 () Bool)

(assert (=> b!132116 (= e!86128 (ListLongMap!1668 Nil!1703))))

(declare-fun b!132117 () Bool)

(declare-fun isEmpty!411 (ListLongMap!1667) Bool)

(assert (=> b!132117 (= e!86127 (isEmpty!411 lt!68835))))

(declare-fun b!132118 () Bool)

(declare-fun res!63580 () Bool)

(assert (=> b!132118 (=> (not res!63580) (not e!86131))))

(assert (=> b!132118 (= res!63580 (not (contains!883 lt!68835 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!132119 () Bool)

(assert (=> b!132119 (= e!86129 call!14502)))

(declare-fun bm!14499 () Bool)

(assert (=> bm!14499 (= call!14502 (getCurrentListMapNoExtraKeys!127 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (_values!2836 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992))) (extraKeys!2620 (v!3180 (underlying!448 thiss!992))) (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) (minValue!2709 (v!3180 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!132120 () Bool)

(assert (=> b!132120 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> b!132120 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2512 (_values!2836 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> b!132120 (= e!86126 (= (apply!115 lt!68835 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!40153 c!24448) b!132116))

(assert (= (and d!40153 (not c!24448)) b!132111))

(assert (= (and b!132111 c!24449) b!132112))

(assert (= (and b!132111 (not c!24449)) b!132119))

(assert (= (or b!132112 b!132119) bm!14499))

(assert (= (and d!40153 res!63579) b!132118))

(assert (= (and b!132118 res!63580) b!132115))

(assert (= (and b!132115 res!63577) b!132113))

(assert (= (and b!132115 c!24447) b!132114))

(assert (= (and b!132115 (not c!24447)) b!132110))

(assert (= (and b!132114 res!63578) b!132120))

(assert (= (and b!132110 c!24450) b!132109))

(assert (= (and b!132110 (not c!24450)) b!132117))

(declare-fun b_lambda!5867 () Bool)

(assert (=> (not b_lambda!5867) (not b!132112)))

(assert (=> b!132112 t!6129))

(declare-fun b_and!8165 () Bool)

(assert (= b_and!8161 (and (=> t!6129 result!3949) b_and!8165)))

(assert (=> b!132112 t!6131))

(declare-fun b_and!8167 () Bool)

(assert (= b_and!8163 (and (=> t!6131 result!3953) b_and!8167)))

(declare-fun b_lambda!5869 () Bool)

(assert (=> (not b_lambda!5869) (not b!132120)))

(assert (=> b!132120 t!6129))

(declare-fun b_and!8169 () Bool)

(assert (= b_and!8165 (and (=> t!6129 result!3949) b_and!8169)))

(assert (=> b!132120 t!6131))

(declare-fun b_and!8171 () Bool)

(assert (= b_and!8167 (and (=> t!6131 result!3953) b_and!8171)))

(declare-fun m!155405 () Bool)

(assert (=> bm!14499 m!155405))

(declare-fun m!155407 () Bool)

(assert (=> b!132112 m!155407))

(assert (=> b!132112 m!155009))

(assert (=> b!132112 m!155407))

(declare-fun m!155409 () Bool)

(assert (=> b!132112 m!155409))

(declare-fun m!155411 () Bool)

(assert (=> b!132112 m!155411))

(assert (=> b!132112 m!155225))

(assert (=> b!132112 m!155009))

(assert (=> b!132112 m!155227))

(assert (=> b!132112 m!155225))

(declare-fun m!155413 () Bool)

(assert (=> b!132112 m!155413))

(assert (=> b!132112 m!155181))

(declare-fun m!155415 () Bool)

(assert (=> b!132117 m!155415))

(assert (=> b!132120 m!155009))

(assert (=> b!132120 m!155225))

(assert (=> b!132120 m!155009))

(assert (=> b!132120 m!155227))

(assert (=> b!132120 m!155225))

(assert (=> b!132120 m!155181))

(declare-fun m!155417 () Bool)

(assert (=> b!132120 m!155417))

(assert (=> b!132120 m!155181))

(assert (=> b!132114 m!155181))

(assert (=> b!132114 m!155181))

(declare-fun m!155419 () Bool)

(assert (=> b!132114 m!155419))

(assert (=> b!132111 m!155181))

(assert (=> b!132111 m!155181))

(assert (=> b!132111 m!155183))

(assert (=> b!132109 m!155405))

(declare-fun m!155421 () Bool)

(assert (=> d!40153 m!155421))

(assert (=> d!40153 m!155005))

(declare-fun m!155423 () Bool)

(assert (=> b!132118 m!155423))

(assert (=> b!132113 m!155181))

(assert (=> b!132113 m!155181))

(assert (=> b!132113 m!155183))

(assert (=> bm!14466 d!40153))

(declare-fun d!40155 () Bool)

(declare-fun res!63581 () Bool)

(declare-fun e!86132 () Bool)

(assert (=> d!40155 (=> (not res!63581) (not e!86132))))

(assert (=> d!40155 (= res!63581 (simpleValid!91 (v!3180 (underlying!448 thiss!992))))))

(assert (=> d!40155 (= (valid!525 (v!3180 (underlying!448 thiss!992))) e!86132)))

(declare-fun b!132121 () Bool)

(declare-fun res!63582 () Bool)

(assert (=> b!132121 (=> (not res!63582) (not e!86132))))

(assert (=> b!132121 (= res!63582 (= (arrayCountValidKeys!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000 (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))) (_size!594 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!132122 () Bool)

(declare-fun res!63583 () Bool)

(assert (=> b!132122 (=> (not res!63583) (not e!86132))))

(assert (=> b!132122 (= res!63583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!132123 () Bool)

(assert (=> b!132123 (= e!86132 (arrayNoDuplicates!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) #b00000000000000000000000000000000 Nil!1704))))

(assert (= (and d!40155 res!63581) b!132121))

(assert (= (and b!132121 res!63582) b!132122))

(assert (= (and b!132122 res!63583) b!132123))

(declare-fun m!155425 () Bool)

(assert (=> d!40155 m!155425))

(declare-fun m!155427 () Bool)

(assert (=> b!132121 m!155427))

(assert (=> b!132122 m!155021))

(assert (=> b!132123 m!154995))

(assert (=> d!40121 d!40155))

(declare-fun d!40157 () Bool)

(declare-fun e!86135 () Bool)

(assert (=> d!40157 e!86135))

(declare-fun res!63588 () Bool)

(assert (=> d!40157 (=> (not res!63588) (not e!86135))))

(declare-fun lt!68845 () ListLongMap!1667)

(assert (=> d!40157 (= res!63588 (contains!883 lt!68845 (_1!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lt!68847 () List!1706)

(assert (=> d!40157 (= lt!68845 (ListLongMap!1668 lt!68847))))

(declare-fun lt!68846 () Unit!4113)

(declare-fun lt!68844 () Unit!4113)

(assert (=> d!40157 (= lt!68846 lt!68844)))

(assert (=> d!40157 (= (getValueByKey!169 lt!68847 (_1!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!87 (List!1706 (_ BitVec 64) V!3473) Unit!4113)

(assert (=> d!40157 (= lt!68844 (lemmaContainsTupThenGetReturnValue!87 lt!68847 (_1!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun insertStrictlySorted!90 (List!1706 (_ BitVec 64) V!3473) List!1706)

(assert (=> d!40157 (= lt!68847 (insertStrictlySorted!90 (toList!849 call!14473) (_1!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40157 (= (+!162 call!14473 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68845)))

(declare-fun b!132128 () Bool)

(declare-fun res!63589 () Bool)

(assert (=> b!132128 (=> (not res!63589) (not e!86135))))

(assert (=> b!132128 (= res!63589 (= (getValueByKey!169 (toList!849 lt!68845) (_1!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun b!132129 () Bool)

(declare-fun contains!885 (List!1706 tuple2!2578) Bool)

(assert (=> b!132129 (= e!86135 (contains!885 (toList!849 lt!68845) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(assert (= (and d!40157 res!63588) b!132128))

(assert (= (and b!132128 res!63589) b!132129))

(declare-fun m!155429 () Bool)

(assert (=> d!40157 m!155429))

(declare-fun m!155431 () Bool)

(assert (=> d!40157 m!155431))

(declare-fun m!155433 () Bool)

(assert (=> d!40157 m!155433))

(declare-fun m!155435 () Bool)

(assert (=> d!40157 m!155435))

(declare-fun m!155437 () Bool)

(assert (=> b!132128 m!155437))

(declare-fun m!155439 () Bool)

(assert (=> b!132129 m!155439))

(assert (=> b!131929 d!40157))

(declare-fun d!40159 () Bool)

(assert (=> d!40159 (= (apply!115 (+!162 lt!68659 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68672) (apply!115 lt!68659 lt!68672))))

(declare-fun lt!68850 () Unit!4113)

(declare-fun choose!815 (ListLongMap!1667 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4113)

(assert (=> d!40159 (= lt!68850 (choose!815 lt!68659 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68672))))

(declare-fun e!86138 () Bool)

(assert (=> d!40159 e!86138))

(declare-fun res!63592 () Bool)

(assert (=> d!40159 (=> (not res!63592) (not e!86138))))

(assert (=> d!40159 (= res!63592 (contains!883 lt!68659 lt!68672))))

(assert (=> d!40159 (= (addApplyDifferent!91 lt!68659 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68672) lt!68850)))

(declare-fun b!132133 () Bool)

(assert (=> b!132133 (= e!86138 (not (= lt!68672 lt!68673)))))

(assert (= (and d!40159 res!63592) b!132133))

(declare-fun m!155441 () Bool)

(assert (=> d!40159 m!155441))

(assert (=> d!40159 m!155191))

(assert (=> d!40159 m!155191))

(assert (=> d!40159 m!155203))

(declare-fun m!155443 () Bool)

(assert (=> d!40159 m!155443))

(assert (=> d!40159 m!155197))

(assert (=> b!131941 d!40159))

(declare-fun d!40161 () Bool)

(assert (=> d!40161 (contains!883 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68679)))

(declare-fun lt!68853 () Unit!4113)

(declare-fun choose!816 (ListLongMap!1667 (_ BitVec 64) V!3473 (_ BitVec 64)) Unit!4113)

(assert (=> d!40161 (= lt!68853 (choose!816 lt!68661 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68679))))

(assert (=> d!40161 (contains!883 lt!68661 lt!68679)))

(assert (=> d!40161 (= (addStillContains!91 lt!68661 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68679) lt!68853)))

(declare-fun bs!5454 () Bool)

(assert (= bs!5454 d!40161))

(assert (=> bs!5454 m!155211))

(assert (=> bs!5454 m!155211))

(assert (=> bs!5454 m!155213))

(declare-fun m!155445 () Bool)

(assert (=> bs!5454 m!155445))

(declare-fun m!155447 () Bool)

(assert (=> bs!5454 m!155447))

(assert (=> b!131941 d!40161))

(declare-fun d!40163 () Bool)

(declare-fun get!1475 (Option!175) V!3473)

(assert (=> d!40163 (= (apply!115 lt!68666 lt!68677) (get!1475 (getValueByKey!169 (toList!849 lt!68666) lt!68677)))))

(declare-fun bs!5455 () Bool)

(assert (= bs!5455 d!40163))

(declare-fun m!155449 () Bool)

(assert (=> bs!5455 m!155449))

(assert (=> bs!5455 m!155449))

(declare-fun m!155451 () Bool)

(assert (=> bs!5455 m!155451))

(assert (=> b!131941 d!40163))

(declare-fun d!40165 () Bool)

(assert (=> d!40165 (= (apply!115 (+!162 lt!68666 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68677) (get!1475 (getValueByKey!169 (toList!849 (+!162 lt!68666 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68677)))))

(declare-fun bs!5456 () Bool)

(assert (= bs!5456 d!40165))

(declare-fun m!155453 () Bool)

(assert (=> bs!5456 m!155453))

(assert (=> bs!5456 m!155453))

(declare-fun m!155455 () Bool)

(assert (=> bs!5456 m!155455))

(assert (=> b!131941 d!40165))

(declare-fun d!40167 () Bool)

(assert (=> d!40167 (= (apply!115 (+!162 lt!68663 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68667) (apply!115 lt!68663 lt!68667))))

(declare-fun lt!68854 () Unit!4113)

(assert (=> d!40167 (= lt!68854 (choose!815 lt!68663 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68667))))

(declare-fun e!86139 () Bool)

(assert (=> d!40167 e!86139))

(declare-fun res!63593 () Bool)

(assert (=> d!40167 (=> (not res!63593) (not e!86139))))

(assert (=> d!40167 (= res!63593 (contains!883 lt!68663 lt!68667))))

(assert (=> d!40167 (= (addApplyDifferent!91 lt!68663 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68667) lt!68854)))

(declare-fun b!132135 () Bool)

(assert (=> b!132135 (= e!86139 (not (= lt!68667 lt!68678)))))

(assert (= (and d!40167 res!63593) b!132135))

(declare-fun m!155457 () Bool)

(assert (=> d!40167 m!155457))

(assert (=> d!40167 m!155201))

(assert (=> d!40167 m!155201))

(assert (=> d!40167 m!155209))

(declare-fun m!155459 () Bool)

(assert (=> d!40167 m!155459))

(assert (=> d!40167 m!155189))

(assert (=> b!131941 d!40167))

(declare-fun d!40169 () Bool)

(declare-fun e!86140 () Bool)

(assert (=> d!40169 e!86140))

(declare-fun res!63594 () Bool)

(assert (=> d!40169 (=> (not res!63594) (not e!86140))))

(declare-fun lt!68856 () ListLongMap!1667)

(assert (=> d!40169 (= res!63594 (contains!883 lt!68856 (_1!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lt!68858 () List!1706)

(assert (=> d!40169 (= lt!68856 (ListLongMap!1668 lt!68858))))

(declare-fun lt!68857 () Unit!4113)

(declare-fun lt!68855 () Unit!4113)

(assert (=> d!40169 (= lt!68857 lt!68855)))

(assert (=> d!40169 (= (getValueByKey!169 lt!68858 (_1!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40169 (= lt!68855 (lemmaContainsTupThenGetReturnValue!87 lt!68858 (_1!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40169 (= lt!68858 (insertStrictlySorted!90 (toList!849 lt!68663) (_1!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40169 (= (+!162 lt!68663 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68856)))

(declare-fun b!132136 () Bool)

(declare-fun res!63595 () Bool)

(assert (=> b!132136 (=> (not res!63595) (not e!86140))))

(assert (=> b!132136 (= res!63595 (= (getValueByKey!169 (toList!849 lt!68856) (_1!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun b!132137 () Bool)

(assert (=> b!132137 (= e!86140 (contains!885 (toList!849 lt!68856) (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(assert (= (and d!40169 res!63594) b!132136))

(assert (= (and b!132136 res!63595) b!132137))

(declare-fun m!155461 () Bool)

(assert (=> d!40169 m!155461))

(declare-fun m!155463 () Bool)

(assert (=> d!40169 m!155463))

(declare-fun m!155465 () Bool)

(assert (=> d!40169 m!155465))

(declare-fun m!155467 () Bool)

(assert (=> d!40169 m!155467))

(declare-fun m!155469 () Bool)

(assert (=> b!132136 m!155469))

(declare-fun m!155471 () Bool)

(assert (=> b!132137 m!155471))

(assert (=> b!131941 d!40169))

(declare-fun d!40171 () Bool)

(assert (=> d!40171 (= (apply!115 (+!162 lt!68663 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68667) (get!1475 (getValueByKey!169 (toList!849 (+!162 lt!68663 (tuple2!2579 lt!68678 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68667)))))

(declare-fun bs!5457 () Bool)

(assert (= bs!5457 d!40171))

(declare-fun m!155473 () Bool)

(assert (=> bs!5457 m!155473))

(assert (=> bs!5457 m!155473))

(declare-fun m!155475 () Bool)

(assert (=> bs!5457 m!155475))

(assert (=> b!131941 d!40171))

(declare-fun d!40173 () Bool)

(assert (=> d!40173 (= (apply!115 lt!68659 lt!68672) (get!1475 (getValueByKey!169 (toList!849 lt!68659) lt!68672)))))

(declare-fun bs!5458 () Bool)

(assert (= bs!5458 d!40173))

(declare-fun m!155477 () Bool)

(assert (=> bs!5458 m!155477))

(assert (=> bs!5458 m!155477))

(declare-fun m!155479 () Bool)

(assert (=> bs!5458 m!155479))

(assert (=> b!131941 d!40173))

(declare-fun d!40175 () Bool)

(declare-fun e!86141 () Bool)

(assert (=> d!40175 e!86141))

(declare-fun res!63596 () Bool)

(assert (=> d!40175 (=> res!63596 e!86141)))

(declare-fun lt!68859 () Bool)

(assert (=> d!40175 (= res!63596 (not lt!68859))))

(declare-fun lt!68862 () Bool)

(assert (=> d!40175 (= lt!68859 lt!68862)))

(declare-fun lt!68861 () Unit!4113)

(declare-fun e!86142 () Unit!4113)

(assert (=> d!40175 (= lt!68861 e!86142)))

(declare-fun c!24451 () Bool)

(assert (=> d!40175 (= c!24451 lt!68862)))

(assert (=> d!40175 (= lt!68862 (containsKey!173 (toList!849 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68679))))

(assert (=> d!40175 (= (contains!883 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68679) lt!68859)))

(declare-fun b!132138 () Bool)

(declare-fun lt!68860 () Unit!4113)

(assert (=> b!132138 (= e!86142 lt!68860)))

(assert (=> b!132138 (= lt!68860 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68679))))

(assert (=> b!132138 (isDefined!123 (getValueByKey!169 (toList!849 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68679))))

(declare-fun b!132139 () Bool)

(declare-fun Unit!4124 () Unit!4113)

(assert (=> b!132139 (= e!86142 Unit!4124)))

(declare-fun b!132140 () Bool)

(assert (=> b!132140 (= e!86141 (isDefined!123 (getValueByKey!169 (toList!849 (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68679)))))

(assert (= (and d!40175 c!24451) b!132138))

(assert (= (and d!40175 (not c!24451)) b!132139))

(assert (= (and d!40175 (not res!63596)) b!132140))

(declare-fun m!155481 () Bool)

(assert (=> d!40175 m!155481))

(declare-fun m!155483 () Bool)

(assert (=> b!132138 m!155483))

(declare-fun m!155485 () Bool)

(assert (=> b!132138 m!155485))

(assert (=> b!132138 m!155485))

(declare-fun m!155487 () Bool)

(assert (=> b!132138 m!155487))

(assert (=> b!132140 m!155485))

(assert (=> b!132140 m!155485))

(assert (=> b!132140 m!155487))

(assert (=> b!131941 d!40175))

(declare-fun d!40177 () Bool)

(assert (=> d!40177 (= (apply!115 (+!162 lt!68666 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68677) (apply!115 lt!68666 lt!68677))))

(declare-fun lt!68863 () Unit!4113)

(assert (=> d!40177 (= lt!68863 (choose!815 lt!68666 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68677))))

(declare-fun e!86143 () Bool)

(assert (=> d!40177 e!86143))

(declare-fun res!63597 () Bool)

(assert (=> d!40177 (=> (not res!63597) (not e!86143))))

(assert (=> d!40177 (= res!63597 (contains!883 lt!68666 lt!68677))))

(assert (=> d!40177 (= (addApplyDifferent!91 lt!68666 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))) lt!68677) lt!68863)))

(declare-fun b!132141 () Bool)

(assert (=> b!132141 (= e!86143 (not (= lt!68677 lt!68669)))))

(assert (= (and d!40177 res!63597) b!132141))

(declare-fun m!155489 () Bool)

(assert (=> d!40177 m!155489))

(assert (=> d!40177 m!155193))

(assert (=> d!40177 m!155193))

(assert (=> d!40177 m!155195))

(declare-fun m!155491 () Bool)

(assert (=> d!40177 m!155491))

(assert (=> d!40177 m!155187))

(assert (=> b!131941 d!40177))

(declare-fun d!40179 () Bool)

(declare-fun e!86144 () Bool)

(assert (=> d!40179 e!86144))

(declare-fun res!63598 () Bool)

(assert (=> d!40179 (=> (not res!63598) (not e!86144))))

(declare-fun lt!68865 () ListLongMap!1667)

(assert (=> d!40179 (= res!63598 (contains!883 lt!68865 (_1!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lt!68867 () List!1706)

(assert (=> d!40179 (= lt!68865 (ListLongMap!1668 lt!68867))))

(declare-fun lt!68866 () Unit!4113)

(declare-fun lt!68864 () Unit!4113)

(assert (=> d!40179 (= lt!68866 lt!68864)))

(assert (=> d!40179 (= (getValueByKey!169 lt!68867 (_1!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40179 (= lt!68864 (lemmaContainsTupThenGetReturnValue!87 lt!68867 (_1!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40179 (= lt!68867 (insertStrictlySorted!90 (toList!849 lt!68661) (_1!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40179 (= (+!162 lt!68661 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68865)))

(declare-fun b!132142 () Bool)

(declare-fun res!63599 () Bool)

(assert (=> b!132142 (=> (not res!63599) (not e!86144))))

(assert (=> b!132142 (= res!63599 (= (getValueByKey!169 (toList!849 lt!68865) (_1!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun b!132143 () Bool)

(assert (=> b!132143 (= e!86144 (contains!885 (toList!849 lt!68865) (tuple2!2579 lt!68670 (zeroValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(assert (= (and d!40179 res!63598) b!132142))

(assert (= (and b!132142 res!63599) b!132143))

(declare-fun m!155493 () Bool)

(assert (=> d!40179 m!155493))

(declare-fun m!155495 () Bool)

(assert (=> d!40179 m!155495))

(declare-fun m!155497 () Bool)

(assert (=> d!40179 m!155497))

(declare-fun m!155499 () Bool)

(assert (=> d!40179 m!155499))

(declare-fun m!155501 () Bool)

(assert (=> b!132142 m!155501))

(declare-fun m!155503 () Bool)

(assert (=> b!132143 m!155503))

(assert (=> b!131941 d!40179))

(declare-fun d!40181 () Bool)

(declare-fun e!86145 () Bool)

(assert (=> d!40181 e!86145))

(declare-fun res!63600 () Bool)

(assert (=> d!40181 (=> (not res!63600) (not e!86145))))

(declare-fun lt!68869 () ListLongMap!1667)

(assert (=> d!40181 (= res!63600 (contains!883 lt!68869 (_1!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lt!68871 () List!1706)

(assert (=> d!40181 (= lt!68869 (ListLongMap!1668 lt!68871))))

(declare-fun lt!68870 () Unit!4113)

(declare-fun lt!68868 () Unit!4113)

(assert (=> d!40181 (= lt!68870 lt!68868)))

(assert (=> d!40181 (= (getValueByKey!169 lt!68871 (_1!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40181 (= lt!68868 (lemmaContainsTupThenGetReturnValue!87 lt!68871 (_1!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40181 (= lt!68871 (insertStrictlySorted!90 (toList!849 lt!68659) (_1!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40181 (= (+!162 lt!68659 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68869)))

(declare-fun b!132144 () Bool)

(declare-fun res!63601 () Bool)

(assert (=> b!132144 (=> (not res!63601) (not e!86145))))

(assert (=> b!132144 (= res!63601 (= (getValueByKey!169 (toList!849 lt!68869) (_1!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun b!132145 () Bool)

(assert (=> b!132145 (= e!86145 (contains!885 (toList!849 lt!68869) (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(assert (= (and d!40181 res!63600) b!132144))

(assert (= (and b!132144 res!63601) b!132145))

(declare-fun m!155505 () Bool)

(assert (=> d!40181 m!155505))

(declare-fun m!155507 () Bool)

(assert (=> d!40181 m!155507))

(declare-fun m!155509 () Bool)

(assert (=> d!40181 m!155509))

(declare-fun m!155511 () Bool)

(assert (=> d!40181 m!155511))

(declare-fun m!155513 () Bool)

(assert (=> b!132144 m!155513))

(declare-fun m!155515 () Bool)

(assert (=> b!132145 m!155515))

(assert (=> b!131941 d!40181))

(declare-fun d!40183 () Bool)

(assert (=> d!40183 (= (apply!115 lt!68663 lt!68667) (get!1475 (getValueByKey!169 (toList!849 lt!68663) lt!68667)))))

(declare-fun bs!5459 () Bool)

(assert (= bs!5459 d!40183))

(declare-fun m!155517 () Bool)

(assert (=> bs!5459 m!155517))

(assert (=> bs!5459 m!155517))

(declare-fun m!155519 () Bool)

(assert (=> bs!5459 m!155519))

(assert (=> b!131941 d!40183))

(assert (=> b!131941 d!40153))

(declare-fun d!40185 () Bool)

(declare-fun e!86146 () Bool)

(assert (=> d!40185 e!86146))

(declare-fun res!63602 () Bool)

(assert (=> d!40185 (=> (not res!63602) (not e!86146))))

(declare-fun lt!68873 () ListLongMap!1667)

(assert (=> d!40185 (= res!63602 (contains!883 lt!68873 (_1!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(declare-fun lt!68875 () List!1706)

(assert (=> d!40185 (= lt!68873 (ListLongMap!1668 lt!68875))))

(declare-fun lt!68874 () Unit!4113)

(declare-fun lt!68872 () Unit!4113)

(assert (=> d!40185 (= lt!68874 lt!68872)))

(assert (=> d!40185 (= (getValueByKey!169 lt!68875 (_1!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40185 (= lt!68872 (lemmaContainsTupThenGetReturnValue!87 lt!68875 (_1!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40185 (= lt!68875 (insertStrictlySorted!90 (toList!849 lt!68666) (_1!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) (_2!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (=> d!40185 (= (+!162 lt!68666 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68873)))

(declare-fun b!132146 () Bool)

(declare-fun res!63603 () Bool)

(assert (=> b!132146 (=> (not res!63603) (not e!86146))))

(assert (=> b!132146 (= res!63603 (= (getValueByKey!169 (toList!849 lt!68873) (_1!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (Some!174 (_2!1300 (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun b!132147 () Bool)

(assert (=> b!132147 (= e!86146 (contains!885 (toList!849 lt!68873) (tuple2!2579 lt!68669 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))

(assert (= (and d!40185 res!63602) b!132146))

(assert (= (and b!132146 res!63603) b!132147))

(declare-fun m!155521 () Bool)

(assert (=> d!40185 m!155521))

(declare-fun m!155523 () Bool)

(assert (=> d!40185 m!155523))

(declare-fun m!155525 () Bool)

(assert (=> d!40185 m!155525))

(declare-fun m!155527 () Bool)

(assert (=> d!40185 m!155527))

(declare-fun m!155529 () Bool)

(assert (=> b!132146 m!155529))

(declare-fun m!155531 () Bool)

(assert (=> b!132147 m!155531))

(assert (=> b!131941 d!40185))

(declare-fun d!40187 () Bool)

(assert (=> d!40187 (= (apply!115 (+!162 lt!68659 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992))))) lt!68672) (get!1475 (getValueByKey!169 (toList!849 (+!162 lt!68659 (tuple2!2579 lt!68673 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68672)))))

(declare-fun bs!5460 () Bool)

(assert (= bs!5460 d!40187))

(declare-fun m!155533 () Bool)

(assert (=> bs!5460 m!155533))

(assert (=> bs!5460 m!155533))

(declare-fun m!155535 () Bool)

(assert (=> bs!5460 m!155535))

(assert (=> b!131941 d!40187))

(declare-fun d!40189 () Bool)

(assert (=> d!40189 (= (+!162 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) lt!68595 (zeroValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68878 () Unit!4113)

(declare-fun choose!817 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4113)

(assert (=> d!40189 (= lt!68878 (choose!817 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68595 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40189 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40189 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68595 (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)) lt!68878)))

(declare-fun bs!5461 () Bool)

(assert (= bs!5461 d!40189))

(assert (=> bs!5461 m!155141))

(assert (=> bs!5461 m!155011))

(declare-fun m!155537 () Bool)

(assert (=> bs!5461 m!155537))

(assert (=> bs!5461 m!155141))

(declare-fun m!155539 () Bool)

(assert (=> bs!5461 m!155539))

(assert (=> bs!5461 m!155267))

(assert (=> bs!5461 m!155011))

(declare-fun m!155541 () Bool)

(assert (=> bs!5461 m!155541))

(assert (=> b!131865 d!40189))

(declare-fun d!40191 () Bool)

(assert (=> d!40191 (= (map!1387 (_2!1301 lt!68588)) (getCurrentListMap!517 (_keys!4599 (_2!1301 lt!68588)) (_values!2836 (_2!1301 lt!68588)) (mask!7146 (_2!1301 lt!68588)) (extraKeys!2620 (_2!1301 lt!68588)) (zeroValue!2709 (_2!1301 lt!68588)) (minValue!2709 (_2!1301 lt!68588)) #b00000000000000000000000000000000 (defaultEntry!2853 (_2!1301 lt!68588))))))

(declare-fun bs!5462 () Bool)

(assert (= bs!5462 d!40191))

(declare-fun m!155543 () Bool)

(assert (=> bs!5462 m!155543))

(assert (=> bm!14449 d!40191))

(declare-fun d!40193 () Bool)

(declare-fun isEmpty!412 (Option!175) Bool)

(assert (=> d!40193 (= (isDefined!123 (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))) (not (isEmpty!412 (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun bs!5463 () Bool)

(assert (= bs!5463 d!40193))

(assert (=> bs!5463 m!155107))

(declare-fun m!155545 () Bool)

(assert (=> bs!5463 m!155545))

(assert (=> b!131739 d!40193))

(declare-fun b!132156 () Bool)

(declare-fun e!86151 () Option!175)

(assert (=> b!132156 (= e!86151 (Some!174 (_2!1300 (h!2307 (toList!849 lt!68501)))))))

(declare-fun b!132159 () Bool)

(declare-fun e!86152 () Option!175)

(assert (=> b!132159 (= e!86152 None!173)))

(declare-fun b!132157 () Bool)

(assert (=> b!132157 (= e!86151 e!86152)))

(declare-fun c!24457 () Bool)

(assert (=> b!132157 (= c!24457 (and ((_ is Cons!1702) (toList!849 lt!68501)) (not (= (_1!1300 (h!2307 (toList!849 lt!68501))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun b!132158 () Bool)

(assert (=> b!132158 (= e!86152 (getValueByKey!169 (t!6132 (toList!849 lt!68501)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun c!24456 () Bool)

(declare-fun d!40195 () Bool)

(assert (=> d!40195 (= c!24456 (and ((_ is Cons!1702) (toList!849 lt!68501)) (= (_1!1300 (h!2307 (toList!849 lt!68501))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!40195 (= (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) e!86151)))

(assert (= (and d!40195 c!24456) b!132156))

(assert (= (and d!40195 (not c!24456)) b!132157))

(assert (= (and b!132157 c!24457) b!132158))

(assert (= (and b!132157 (not c!24457)) b!132159))

(assert (=> b!132158 m!154997))

(declare-fun m!155547 () Bool)

(assert (=> b!132158 m!155547))

(assert (=> b!131739 d!40195))

(declare-fun b!132160 () Bool)

(declare-fun e!86154 () Bool)

(declare-fun e!86155 () Bool)

(assert (=> b!132160 (= e!86154 e!86155)))

(declare-fun lt!68880 () (_ BitVec 64))

(assert (=> b!132160 (= lt!68880 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68881 () Unit!4113)

(assert (=> b!132160 (= lt!68881 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4599 newMap!16) lt!68880 #b00000000000000000000000000000000))))

(assert (=> b!132160 (arrayContainsKey!0 (_keys!4599 newMap!16) lt!68880 #b00000000000000000000000000000000)))

(declare-fun lt!68879 () Unit!4113)

(assert (=> b!132160 (= lt!68879 lt!68881)))

(declare-fun res!63605 () Bool)

(assert (=> b!132160 (= res!63605 (= (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000) (_keys!4599 newMap!16) (mask!7146 newMap!16)) (Found!277 #b00000000000000000000000000000000)))))

(assert (=> b!132160 (=> (not res!63605) (not e!86155))))

(declare-fun bm!14500 () Bool)

(declare-fun call!14503 () Bool)

(assert (=> bm!14500 (= call!14503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun b!132161 () Bool)

(assert (=> b!132161 (= e!86155 call!14503)))

(declare-fun b!132162 () Bool)

(assert (=> b!132162 (= e!86154 call!14503)))

(declare-fun d!40197 () Bool)

(declare-fun res!63604 () Bool)

(declare-fun e!86153 () Bool)

(assert (=> d!40197 (=> res!63604 e!86153)))

(assert (=> d!40197 (= res!63604 (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(assert (=> d!40197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 newMap!16) (mask!7146 newMap!16)) e!86153)))

(declare-fun b!132163 () Bool)

(assert (=> b!132163 (= e!86153 e!86154)))

(declare-fun c!24458 () Bool)

(assert (=> b!132163 (= c!24458 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!40197 (not res!63604)) b!132163))

(assert (= (and b!132163 c!24458) b!132160))

(assert (= (and b!132163 (not c!24458)) b!132162))

(assert (= (and b!132160 res!63605) b!132161))

(assert (= (or b!132161 b!132162) bm!14500))

(assert (=> b!132160 m!155283))

(declare-fun m!155549 () Bool)

(assert (=> b!132160 m!155549))

(declare-fun m!155551 () Bool)

(assert (=> b!132160 m!155551))

(assert (=> b!132160 m!155283))

(declare-fun m!155553 () Bool)

(assert (=> b!132160 m!155553))

(declare-fun m!155555 () Bool)

(assert (=> bm!14500 m!155555))

(assert (=> b!132163 m!155283))

(assert (=> b!132163 m!155283))

(assert (=> b!132163 m!155285))

(assert (=> b!131879 d!40197))

(declare-fun b!132164 () Bool)

(declare-fun e!86157 () Bool)

(declare-fun e!86158 () Bool)

(assert (=> b!132164 (= e!86157 e!86158)))

(declare-fun lt!68883 () (_ BitVec 64))

(assert (=> b!132164 (= lt!68883 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!68884 () Unit!4113)

(assert (=> b!132164 (= lt!68884 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68883 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!132164 (arrayContainsKey!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68883 #b00000000000000000000000000000000)))

(declare-fun lt!68882 () Unit!4113)

(assert (=> b!132164 (= lt!68882 lt!68884)))

(declare-fun res!63607 () Bool)

(assert (=> b!132164 (= res!63607 (= (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))) (Found!277 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!132164 (=> (not res!63607) (not e!86158))))

(declare-fun bm!14501 () Bool)

(declare-fun call!14504 () Bool)

(assert (=> bm!14501 (= call!14504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!132165 () Bool)

(assert (=> b!132165 (= e!86158 call!14504)))

(declare-fun b!132166 () Bool)

(assert (=> b!132166 (= e!86157 call!14504)))

(declare-fun d!40199 () Bool)

(declare-fun res!63606 () Bool)

(declare-fun e!86156 () Bool)

(assert (=> d!40199 (=> res!63606 e!86156)))

(assert (=> d!40199 (= res!63606 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(assert (=> d!40199 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))) e!86156)))

(declare-fun b!132167 () Bool)

(assert (=> b!132167 (= e!86156 e!86157)))

(declare-fun c!24459 () Bool)

(assert (=> b!132167 (= c!24459 (validKeyInArray!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!40199 (not res!63606)) b!132167))

(assert (= (and b!132167 c!24459) b!132164))

(assert (= (and b!132167 (not c!24459)) b!132166))

(assert (= (and b!132164 res!63607) b!132165))

(assert (= (or b!132165 b!132166) bm!14501))

(assert (=> b!132164 m!155397))

(declare-fun m!155557 () Bool)

(assert (=> b!132164 m!155557))

(declare-fun m!155559 () Bool)

(assert (=> b!132164 m!155559))

(assert (=> b!132164 m!155397))

(declare-fun m!155561 () Bool)

(assert (=> b!132164 m!155561))

(declare-fun m!155563 () Bool)

(assert (=> bm!14501 m!155563))

(assert (=> b!132167 m!155397))

(assert (=> b!132167 m!155397))

(assert (=> b!132167 m!155401))

(assert (=> bm!14476 d!40199))

(declare-fun b!132176 () Bool)

(declare-fun res!63616 () Bool)

(declare-fun e!86161 () Bool)

(assert (=> b!132176 (=> (not res!63616) (not e!86161))))

(assert (=> b!132176 (= res!63616 (and (= (size!2512 (_values!2836 newMap!16)) (bvadd (mask!7146 newMap!16) #b00000000000000000000000000000001)) (= (size!2511 (_keys!4599 newMap!16)) (size!2512 (_values!2836 newMap!16))) (bvsge (_size!594 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!594 newMap!16) (bvadd (mask!7146 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!40201 () Bool)

(declare-fun res!63617 () Bool)

(assert (=> d!40201 (=> (not res!63617) (not e!86161))))

(assert (=> d!40201 (= res!63617 (validMask!0 (mask!7146 newMap!16)))))

(assert (=> d!40201 (= (simpleValid!91 newMap!16) e!86161)))

(declare-fun b!132179 () Bool)

(assert (=> b!132179 (= e!86161 (and (bvsge (extraKeys!2620 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2620 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!594 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!132178 () Bool)

(declare-fun res!63618 () Bool)

(assert (=> b!132178 (=> (not res!63618) (not e!86161))))

(declare-fun size!2517 (LongMapFixedSize!1090) (_ BitVec 32))

(assert (=> b!132178 (= res!63618 (= (size!2517 newMap!16) (bvadd (_size!594 newMap!16) (bvsdiv (bvadd (extraKeys!2620 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!132177 () Bool)

(declare-fun res!63619 () Bool)

(assert (=> b!132177 (=> (not res!63619) (not e!86161))))

(assert (=> b!132177 (= res!63619 (bvsge (size!2517 newMap!16) (_size!594 newMap!16)))))

(assert (= (and d!40201 res!63617) b!132176))

(assert (= (and b!132176 res!63616) b!132177))

(assert (= (and b!132177 res!63619) b!132178))

(assert (= (and b!132178 res!63618) b!132179))

(assert (=> d!40201 m!155267))

(declare-fun m!155565 () Bool)

(assert (=> b!132178 m!155565))

(assert (=> b!132177 m!155565))

(assert (=> d!40111 d!40201))

(declare-fun d!40203 () Bool)

(assert (=> d!40203 (isDefined!123 (getValueByKey!169 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!68887 () Unit!4113)

(declare-fun choose!818 (List!1706 (_ BitVec 64)) Unit!4113)

(assert (=> d!40203 (= lt!68887 (choose!818 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!86164 () Bool)

(assert (=> d!40203 e!86164))

(declare-fun res!63622 () Bool)

(assert (=> d!40203 (=> (not res!63622) (not e!86164))))

(declare-fun isStrictlySorted!316 (List!1706) Bool)

(assert (=> d!40203 (= res!63622 (isStrictlySorted!316 (toList!849 lt!68501)))))

(assert (=> d!40203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) lt!68887)))

(declare-fun b!132182 () Bool)

(assert (=> b!132182 (= e!86164 (containsKey!173 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!40203 res!63622) b!132182))

(assert (=> d!40203 m!154997))

(assert (=> d!40203 m!155107))

(assert (=> d!40203 m!155107))

(assert (=> d!40203 m!155109))

(assert (=> d!40203 m!154997))

(declare-fun m!155567 () Bool)

(assert (=> d!40203 m!155567))

(declare-fun m!155569 () Bool)

(assert (=> d!40203 m!155569))

(assert (=> b!132182 m!154997))

(assert (=> b!132182 m!155103))

(assert (=> b!131737 d!40203))

(assert (=> b!131737 d!40193))

(assert (=> b!131737 d!40195))

(declare-fun d!40205 () Bool)

(declare-fun e!86165 () Bool)

(assert (=> d!40205 e!86165))

(declare-fun res!63623 () Bool)

(assert (=> d!40205 (=> (not res!63623) (not e!86165))))

(declare-fun lt!68889 () ListLongMap!1667)

(assert (=> d!40205 (= res!63623 (contains!883 lt!68889 (_1!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!68891 () List!1706)

(assert (=> d!40205 (= lt!68889 (ListLongMap!1668 lt!68891))))

(declare-fun lt!68890 () Unit!4113)

(declare-fun lt!68888 () Unit!4113)

(assert (=> d!40205 (= lt!68890 lt!68888)))

(assert (=> d!40205 (= (getValueByKey!169 lt!68891 (_1!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40205 (= lt!68888 (lemmaContainsTupThenGetReturnValue!87 lt!68891 (_1!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40205 (= lt!68891 (insertStrictlySorted!90 (toList!849 e!85971) (_1!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!40205 (= (+!162 e!85971 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!68889)))

(declare-fun b!132183 () Bool)

(declare-fun res!63624 () Bool)

(assert (=> b!132183 (=> (not res!63624) (not e!86165))))

(assert (=> b!132183 (= res!63624 (= (getValueByKey!169 (toList!849 lt!68889) (_1!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1300 (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!132184 () Bool)

(assert (=> b!132184 (= e!86165 (contains!885 (toList!849 lt!68889) (ite c!24369 (ite c!24380 (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!40205 res!63623) b!132183))

(assert (= (and b!132183 res!63624) b!132184))

(declare-fun m!155571 () Bool)

(assert (=> d!40205 m!155571))

(declare-fun m!155573 () Bool)

(assert (=> d!40205 m!155573))

(declare-fun m!155575 () Bool)

(assert (=> d!40205 m!155575))

(declare-fun m!155577 () Bool)

(assert (=> d!40205 m!155577))

(declare-fun m!155579 () Bool)

(assert (=> b!132183 m!155579))

(declare-fun m!155581 () Bool)

(assert (=> b!132184 m!155581))

(assert (=> bm!14430 d!40205))

(declare-fun d!40207 () Bool)

(assert (=> d!40207 (arrayContainsKey!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000)))

(declare-fun lt!68894 () Unit!4113)

(declare-fun choose!13 (array!4743 (_ BitVec 64) (_ BitVec 32)) Unit!4113)

(assert (=> d!40207 (= lt!68894 (choose!13 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000))))

(assert (=> d!40207 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!40207 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000) lt!68894)))

(declare-fun bs!5464 () Bool)

(assert (= bs!5464 d!40207))

(assert (=> bs!5464 m!155247))

(declare-fun m!155583 () Bool)

(assert (=> bs!5464 m!155583))

(assert (=> b!131967 d!40207))

(declare-fun d!40209 () Bool)

(declare-fun res!63625 () Bool)

(declare-fun e!86166 () Bool)

(assert (=> d!40209 (=> res!63625 e!86166)))

(assert (=> d!40209 (= res!63625 (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) lt!68688))))

(assert (=> d!40209 (= (arrayContainsKey!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 #b00000000000000000000000000000000) e!86166)))

(declare-fun b!132185 () Bool)

(declare-fun e!86167 () Bool)

(assert (=> b!132185 (= e!86166 e!86167)))

(declare-fun res!63626 () Bool)

(assert (=> b!132185 (=> (not res!63626) (not e!86167))))

(assert (=> b!132185 (= res!63626 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))))

(declare-fun b!132186 () Bool)

(assert (=> b!132186 (= e!86167 (arrayContainsKey!0 (_keys!4599 (v!3180 (underlying!448 thiss!992))) lt!68688 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!40209 (not res!63625)) b!132185))

(assert (= (and b!132185 res!63626) b!132186))

(assert (=> d!40209 m!155235))

(declare-fun m!155585 () Bool)

(assert (=> b!132186 m!155585))

(assert (=> b!131967 d!40209))

(declare-fun b!132187 () Bool)

(declare-fun c!24461 () Bool)

(declare-fun lt!68895 () (_ BitVec 64))

(assert (=> b!132187 (= c!24461 (= lt!68895 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!86169 () SeekEntryResult!277)

(declare-fun e!86168 () SeekEntryResult!277)

(assert (=> b!132187 (= e!86169 e!86168)))

(declare-fun b!132188 () Bool)

(declare-fun lt!68897 () SeekEntryResult!277)

(assert (=> b!132188 (= e!86168 (seekKeyOrZeroReturnVacant!0 (x!15504 lt!68897) (index!3269 lt!68897) (index!3269 lt!68897) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(declare-fun b!132189 () Bool)

(declare-fun e!86170 () SeekEntryResult!277)

(assert (=> b!132189 (= e!86170 Undefined!277)))

(declare-fun b!132190 () Bool)

(assert (=> b!132190 (= e!86168 (MissingZero!277 (index!3269 lt!68897)))))

(declare-fun b!132191 () Bool)

(assert (=> b!132191 (= e!86169 (Found!277 (index!3269 lt!68897)))))

(declare-fun d!40211 () Bool)

(declare-fun lt!68896 () SeekEntryResult!277)

(assert (=> d!40211 (and (or ((_ is Undefined!277) lt!68896) (not ((_ is Found!277) lt!68896)) (and (bvsge (index!3268 lt!68896) #b00000000000000000000000000000000) (bvslt (index!3268 lt!68896) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))) (or ((_ is Undefined!277) lt!68896) ((_ is Found!277) lt!68896) (not ((_ is MissingZero!277) lt!68896)) (and (bvsge (index!3267 lt!68896) #b00000000000000000000000000000000) (bvslt (index!3267 lt!68896) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))) (or ((_ is Undefined!277) lt!68896) ((_ is Found!277) lt!68896) ((_ is MissingZero!277) lt!68896) (not ((_ is MissingVacant!277) lt!68896)) (and (bvsge (index!3270 lt!68896) #b00000000000000000000000000000000) (bvslt (index!3270 lt!68896) (size!2511 (_keys!4599 (v!3180 (underlying!448 thiss!992))))))) (or ((_ is Undefined!277) lt!68896) (ite ((_ is Found!277) lt!68896) (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (index!3268 lt!68896)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!277) lt!68896) (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (index!3267 lt!68896)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!277) lt!68896) (= (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (index!3270 lt!68896)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40211 (= lt!68896 e!86170)))

(declare-fun c!24462 () Bool)

(assert (=> d!40211 (= c!24462 (and ((_ is Intermediate!277) lt!68897) (undefined!1089 lt!68897)))))

(assert (=> d!40211 (= lt!68897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (mask!7146 (v!3180 (underlying!448 thiss!992)))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))))))

(assert (=> d!40211 (validMask!0 (mask!7146 (v!3180 (underlying!448 thiss!992))))))

(assert (=> d!40211 (= (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (_keys!4599 (v!3180 (underlying!448 thiss!992))) (mask!7146 (v!3180 (underlying!448 thiss!992)))) lt!68896)))

(declare-fun b!132192 () Bool)

(assert (=> b!132192 (= e!86170 e!86169)))

(assert (=> b!132192 (= lt!68895 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (index!3269 lt!68897)))))

(declare-fun c!24460 () Bool)

(assert (=> b!132192 (= c!24460 (= lt!68895 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40211 c!24462) b!132189))

(assert (= (and d!40211 (not c!24462)) b!132192))

(assert (= (and b!132192 c!24460) b!132191))

(assert (= (and b!132192 (not c!24460)) b!132187))

(assert (= (and b!132187 c!24461) b!132190))

(assert (= (and b!132187 (not c!24461)) b!132188))

(assert (=> b!132188 m!155235))

(declare-fun m!155587 () Bool)

(assert (=> b!132188 m!155587))

(declare-fun m!155589 () Bool)

(assert (=> d!40211 m!155589))

(declare-fun m!155591 () Bool)

(assert (=> d!40211 m!155591))

(assert (=> d!40211 m!155235))

(declare-fun m!155593 () Bool)

(assert (=> d!40211 m!155593))

(declare-fun m!155595 () Bool)

(assert (=> d!40211 m!155595))

(assert (=> d!40211 m!155005))

(assert (=> d!40211 m!155235))

(assert (=> d!40211 m!155591))

(declare-fun m!155597 () Bool)

(assert (=> d!40211 m!155597))

(declare-fun m!155599 () Bool)

(assert (=> b!132192 m!155599))

(assert (=> b!131967 d!40211))

(declare-fun d!40213 () Bool)

(assert (=> d!40213 (= (get!1473 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3179 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!131870 d!40213))

(declare-fun d!40215 () Bool)

(declare-fun e!86171 () Bool)

(assert (=> d!40215 e!86171))

(declare-fun res!63627 () Bool)

(assert (=> d!40215 (=> (not res!63627) (not e!86171))))

(declare-fun lt!68899 () ListLongMap!1667)

(assert (=> d!40215 (= res!63627 (contains!883 lt!68899 (_1!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!68901 () List!1706)

(assert (=> d!40215 (= lt!68899 (ListLongMap!1668 lt!68901))))

(declare-fun lt!68900 () Unit!4113)

(declare-fun lt!68898 () Unit!4113)

(assert (=> d!40215 (= lt!68900 lt!68898)))

(assert (=> d!40215 (= (getValueByKey!169 lt!68901 (_1!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40215 (= lt!68898 (lemmaContainsTupThenGetReturnValue!87 lt!68901 (_1!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40215 (= lt!68901 (insertStrictlySorted!90 (toList!849 call!14430) (_1!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!40215 (= (+!162 call!14430 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!68899)))

(declare-fun b!132193 () Bool)

(declare-fun res!63628 () Bool)

(assert (=> b!132193 (=> (not res!63628) (not e!86171))))

(assert (=> b!132193 (= res!63628 (= (getValueByKey!169 (toList!849 lt!68899) (_1!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1300 (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!132194 () Bool)

(assert (=> b!132194 (= e!86171 (contains!885 (toList!849 lt!68899) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!40215 res!63627) b!132193))

(assert (= (and b!132193 res!63628) b!132194))

(declare-fun m!155601 () Bool)

(assert (=> d!40215 m!155601))

(declare-fun m!155603 () Bool)

(assert (=> d!40215 m!155603))

(declare-fun m!155605 () Bool)

(assert (=> d!40215 m!155605))

(declare-fun m!155607 () Bool)

(assert (=> d!40215 m!155607))

(declare-fun m!155609 () Bool)

(assert (=> b!132193 m!155609))

(declare-fun m!155611 () Bool)

(assert (=> b!132194 m!155611))

(assert (=> b!131830 d!40215))

(declare-fun d!40217 () Bool)

(declare-fun lt!68904 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!131 (List!1707) (InoxSet (_ BitVec 64)))

(assert (=> d!40217 (= lt!68904 (select (content!131 Nil!1704) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!86177 () Bool)

(assert (=> d!40217 (= lt!68904 e!86177)))

(declare-fun res!63634 () Bool)

(assert (=> d!40217 (=> (not res!63634) (not e!86177))))

(assert (=> d!40217 (= res!63634 ((_ is Cons!1703) Nil!1704))))

(assert (=> d!40217 (= (contains!884 Nil!1704 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)) lt!68904)))

(declare-fun b!132199 () Bool)

(declare-fun e!86176 () Bool)

(assert (=> b!132199 (= e!86177 e!86176)))

(declare-fun res!63633 () Bool)

(assert (=> b!132199 (=> res!63633 e!86176)))

(assert (=> b!132199 (= res!63633 (= (h!2308 Nil!1704) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!132200 () Bool)

(assert (=> b!132200 (= e!86176 (contains!884 (t!6133 Nil!1704) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40217 res!63634) b!132199))

(assert (= (and b!132199 (not res!63633)) b!132200))

(declare-fun m!155613 () Bool)

(assert (=> d!40217 m!155613))

(assert (=> d!40217 m!155235))

(declare-fun m!155615 () Bool)

(assert (=> d!40217 m!155615))

(assert (=> b!132200 m!155235))

(declare-fun m!155617 () Bool)

(assert (=> b!132200 m!155617))

(assert (=> b!131958 d!40217))

(declare-fun d!40219 () Bool)

(assert (=> d!40219 (= (apply!115 lt!68668 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1475 (getValueByKey!169 (toList!849 lt!68668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5465 () Bool)

(assert (= bs!5465 d!40219))

(declare-fun m!155619 () Bool)

(assert (=> bs!5465 m!155619))

(assert (=> bs!5465 m!155619))

(declare-fun m!155621 () Bool)

(assert (=> bs!5465 m!155621))

(assert (=> b!131933 d!40219))

(declare-fun d!40221 () Bool)

(declare-fun e!86180 () Bool)

(assert (=> d!40221 e!86180))

(declare-fun res!63637 () Bool)

(assert (=> d!40221 (=> (not res!63637) (not e!86180))))

(assert (=> d!40221 (= res!63637 (and (bvsge (index!3268 lt!68601) #b00000000000000000000000000000000) (bvslt (index!3268 lt!68601) (size!2511 (_keys!4599 newMap!16)))))))

(declare-fun lt!68907 () Unit!4113)

(declare-fun choose!819 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) Int) Unit!4113)

(assert (=> d!40221 (= lt!68907 (choose!819 (_keys!4599 newMap!16) lt!68596 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40221 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40221 (= (lemmaValidKeyInArrayIsInListMap!119 (_keys!4599 newMap!16) lt!68596 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (defaultEntry!2853 newMap!16)) lt!68907)))

(declare-fun b!132203 () Bool)

(assert (=> b!132203 (= e!86180 (contains!883 (getCurrentListMap!517 (_keys!4599 newMap!16) lt!68596 (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68601))))))

(assert (= (and d!40221 res!63637) b!132203))

(declare-fun m!155623 () Bool)

(assert (=> d!40221 m!155623))

(assert (=> d!40221 m!155267))

(declare-fun m!155625 () Bool)

(assert (=> b!132203 m!155625))

(assert (=> b!132203 m!155117))

(assert (=> b!132203 m!155625))

(assert (=> b!132203 m!155117))

(declare-fun m!155627 () Bool)

(assert (=> b!132203 m!155627))

(assert (=> b!131855 d!40221))

(declare-fun d!40223 () Bool)

(declare-fun e!86183 () Bool)

(assert (=> d!40223 e!86183))

(declare-fun res!63640 () Bool)

(assert (=> d!40223 (=> (not res!63640) (not e!86183))))

(assert (=> d!40223 (= res!63640 (and (bvsge (index!3268 lt!68601) #b00000000000000000000000000000000) (bvslt (index!3268 lt!68601) (size!2512 (_values!2836 newMap!16)))))))

(declare-fun lt!68910 () Unit!4113)

(declare-fun choose!820 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 32) (_ BitVec 64) V!3473 Int) Unit!4113)

(assert (=> d!40223 (= lt!68910 (choose!820 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40223 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40223 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (index!3268 lt!68601) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2853 newMap!16)) lt!68910)))

(declare-fun b!132206 () Bool)

(assert (=> b!132206 (= e!86183 (= (+!162 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2579 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4599 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))))))

(assert (= (and d!40223 res!63640) b!132206))

(assert (=> d!40223 m!154997))

(assert (=> d!40223 m!155011))

(declare-fun m!155629 () Bool)

(assert (=> d!40223 m!155629))

(assert (=> d!40223 m!155267))

(assert (=> b!132206 m!155141))

(assert (=> b!132206 m!155141))

(assert (=> b!132206 m!155357))

(assert (=> b!132206 m!155137))

(declare-fun m!155631 () Bool)

(assert (=> b!132206 m!155631))

(assert (=> b!131855 d!40223))

(declare-fun d!40225 () Bool)

(declare-fun e!86184 () Bool)

(assert (=> d!40225 e!86184))

(declare-fun res!63641 () Bool)

(assert (=> d!40225 (=> res!63641 e!86184)))

(declare-fun lt!68911 () Bool)

(assert (=> d!40225 (= res!63641 (not lt!68911))))

(declare-fun lt!68914 () Bool)

(assert (=> d!40225 (= lt!68911 lt!68914)))

(declare-fun lt!68913 () Unit!4113)

(declare-fun e!86185 () Unit!4113)

(assert (=> d!40225 (= lt!68913 e!86185)))

(declare-fun c!24463 () Bool)

(assert (=> d!40225 (= c!24463 lt!68914)))

(assert (=> d!40225 (= lt!68914 (containsKey!173 (toList!849 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!40225 (= (contains!883 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) lt!68911)))

(declare-fun b!132207 () Bool)

(declare-fun lt!68912 () Unit!4113)

(assert (=> b!132207 (= e!86185 lt!68912)))

(assert (=> b!132207 (= lt!68912 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!132207 (isDefined!123 (getValueByKey!169 (toList!849 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!132208 () Bool)

(declare-fun Unit!4125 () Unit!4113)

(assert (=> b!132208 (= e!86185 Unit!4125)))

(declare-fun b!132209 () Bool)

(assert (=> b!132209 (= e!86184 (isDefined!123 (getValueByKey!169 (toList!849 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!40225 c!24463) b!132207))

(assert (= (and d!40225 (not c!24463)) b!132208))

(assert (= (and d!40225 (not res!63641)) b!132209))

(assert (=> d!40225 m!154997))

(declare-fun m!155633 () Bool)

(assert (=> d!40225 m!155633))

(assert (=> b!132207 m!154997))

(declare-fun m!155635 () Bool)

(assert (=> b!132207 m!155635))

(assert (=> b!132207 m!154997))

(declare-fun m!155637 () Bool)

(assert (=> b!132207 m!155637))

(assert (=> b!132207 m!155637))

(declare-fun m!155639 () Bool)

(assert (=> b!132207 m!155639))

(assert (=> b!132209 m!154997))

(assert (=> b!132209 m!155637))

(assert (=> b!132209 m!155637))

(assert (=> b!132209 m!155639))

(assert (=> b!131855 d!40225))

(assert (=> b!131855 d!40143))

(declare-fun b!132226 () Bool)

(declare-fun e!86194 () Bool)

(declare-fun e!86195 () Bool)

(assert (=> b!132226 (= e!86194 e!86195)))

(declare-fun c!24469 () Bool)

(declare-fun lt!68920 () SeekEntryResult!277)

(assert (=> b!132226 (= c!24469 ((_ is MissingVacant!277) lt!68920))))

(declare-fun call!14510 () Bool)

(declare-fun bm!14506 () Bool)

(assert (=> bm!14506 (= call!14510 (arrayContainsKey!0 (_keys!4599 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!14507 () Bool)

(declare-fun call!14509 () Bool)

(declare-fun c!24468 () Bool)

(assert (=> bm!14507 (= call!14509 (inRange!0 (ite c!24468 (index!3267 lt!68920) (index!3270 lt!68920)) (mask!7146 newMap!16)))))

(declare-fun b!132227 () Bool)

(declare-fun e!86196 () Bool)

(assert (=> b!132227 (= e!86196 (not call!14510))))

(declare-fun b!132228 () Bool)

(declare-fun e!86197 () Bool)

(assert (=> b!132228 (= e!86197 (not call!14510))))

(declare-fun b!132229 () Bool)

(declare-fun res!63653 () Bool)

(assert (=> b!132229 (=> (not res!63653) (not e!86196))))

(assert (=> b!132229 (= res!63653 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3270 lt!68920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132229 (and (bvsge (index!3270 lt!68920) #b00000000000000000000000000000000) (bvslt (index!3270 lt!68920) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132231 () Bool)

(assert (=> b!132231 (and (bvsge (index!3267 lt!68920) #b00000000000000000000000000000000) (bvslt (index!3267 lt!68920) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun res!63652 () Bool)

(assert (=> b!132231 (= res!63652 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3267 lt!68920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132231 (=> (not res!63652) (not e!86197))))

(declare-fun b!132232 () Bool)

(assert (=> b!132232 (= e!86195 ((_ is Undefined!277) lt!68920))))

(declare-fun b!132233 () Bool)

(declare-fun res!63651 () Bool)

(assert (=> b!132233 (=> (not res!63651) (not e!86196))))

(assert (=> b!132233 (= res!63651 call!14509)))

(assert (=> b!132233 (= e!86195 e!86196)))

(declare-fun b!132230 () Bool)

(assert (=> b!132230 (= e!86194 e!86197)))

(declare-fun res!63650 () Bool)

(assert (=> b!132230 (= res!63650 call!14509)))

(assert (=> b!132230 (=> (not res!63650) (not e!86197))))

(declare-fun d!40227 () Bool)

(assert (=> d!40227 e!86194))

(assert (=> d!40227 (= c!24468 ((_ is MissingZero!277) lt!68920))))

(assert (=> d!40227 (= lt!68920 (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun lt!68919 () Unit!4113)

(declare-fun choose!821 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4113)

(assert (=> d!40227 (= lt!68919 (choose!821 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40227 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40227 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)) lt!68919)))

(assert (= (and d!40227 c!24468) b!132230))

(assert (= (and d!40227 (not c!24468)) b!132226))

(assert (= (and b!132230 res!63650) b!132231))

(assert (= (and b!132231 res!63652) b!132228))

(assert (= (and b!132226 c!24469) b!132233))

(assert (= (and b!132226 (not c!24469)) b!132232))

(assert (= (and b!132233 res!63651) b!132229))

(assert (= (and b!132229 res!63653) b!132227))

(assert (= (or b!132230 b!132233) bm!14507))

(assert (= (or b!132228 b!132227) bm!14506))

(declare-fun m!155641 () Bool)

(assert (=> b!132229 m!155641))

(declare-fun m!155643 () Bool)

(assert (=> bm!14507 m!155643))

(assert (=> d!40227 m!154997))

(assert (=> d!40227 m!155113))

(assert (=> d!40227 m!154997))

(declare-fun m!155645 () Bool)

(assert (=> d!40227 m!155645))

(assert (=> d!40227 m!155267))

(declare-fun m!155647 () Bool)

(assert (=> b!132231 m!155647))

(assert (=> bm!14506 m!154997))

(assert (=> bm!14506 m!155151))

(assert (=> bm!14443 d!40227))

(assert (=> b!131851 d!40143))

(declare-fun d!40229 () Bool)

(declare-fun e!86200 () Bool)

(assert (=> d!40229 e!86200))

(declare-fun res!63659 () Bool)

(assert (=> d!40229 (=> (not res!63659) (not e!86200))))

(declare-fun lt!68926 () SeekEntryResult!277)

(assert (=> d!40229 (= res!63659 ((_ is Found!277) lt!68926))))

(assert (=> d!40229 (= lt!68926 (seekEntryOrOpen!0 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (_keys!4599 newMap!16) (mask!7146 newMap!16)))))

(declare-fun lt!68925 () Unit!4113)

(declare-fun choose!822 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 (_ BitVec 64) Int) Unit!4113)

(assert (=> d!40229 (= lt!68925 (choose!822 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40229 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40229 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355) (defaultEntry!2853 newMap!16)) lt!68925)))

(declare-fun b!132238 () Bool)

(declare-fun res!63658 () Bool)

(assert (=> b!132238 (=> (not res!63658) (not e!86200))))

(assert (=> b!132238 (= res!63658 (inRange!0 (index!3268 lt!68926) (mask!7146 newMap!16)))))

(declare-fun b!132239 () Bool)

(assert (=> b!132239 (= e!86200 (= (select (arr!2242 (_keys!4599 newMap!16)) (index!3268 lt!68926)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!132239 (and (bvsge (index!3268 lt!68926) #b00000000000000000000000000000000) (bvslt (index!3268 lt!68926) (size!2511 (_keys!4599 newMap!16))))))

(assert (= (and d!40229 res!63659) b!132238))

(assert (= (and b!132238 res!63658) b!132239))

(assert (=> d!40229 m!154997))

(assert (=> d!40229 m!155113))

(assert (=> d!40229 m!154997))

(declare-fun m!155649 () Bool)

(assert (=> d!40229 m!155649))

(assert (=> d!40229 m!155267))

(declare-fun m!155651 () Bool)

(assert (=> b!132238 m!155651))

(declare-fun m!155653 () Bool)

(assert (=> b!132239 m!155653))

(assert (=> bm!14440 d!40229))

(declare-fun d!40231 () Bool)

(declare-fun res!63660 () Bool)

(declare-fun e!86201 () Bool)

(assert (=> d!40231 (=> (not res!63660) (not e!86201))))

(assert (=> d!40231 (= res!63660 (simpleValid!91 (_2!1301 lt!68588)))))

(assert (=> d!40231 (= (valid!525 (_2!1301 lt!68588)) e!86201)))

(declare-fun b!132240 () Bool)

(declare-fun res!63661 () Bool)

(assert (=> b!132240 (=> (not res!63661) (not e!86201))))

(assert (=> b!132240 (= res!63661 (= (arrayCountValidKeys!0 (_keys!4599 (_2!1301 lt!68588)) #b00000000000000000000000000000000 (size!2511 (_keys!4599 (_2!1301 lt!68588)))) (_size!594 (_2!1301 lt!68588))))))

(declare-fun b!132241 () Bool)

(declare-fun res!63662 () Bool)

(assert (=> b!132241 (=> (not res!63662) (not e!86201))))

(assert (=> b!132241 (= res!63662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4599 (_2!1301 lt!68588)) (mask!7146 (_2!1301 lt!68588))))))

(declare-fun b!132242 () Bool)

(assert (=> b!132242 (= e!86201 (arrayNoDuplicates!0 (_keys!4599 (_2!1301 lt!68588)) #b00000000000000000000000000000000 Nil!1704))))

(assert (= (and d!40231 res!63660) b!132240))

(assert (= (and b!132240 res!63661) b!132241))

(assert (= (and b!132241 res!63662) b!132242))

(declare-fun m!155655 () Bool)

(assert (=> d!40231 m!155655))

(declare-fun m!155657 () Bool)

(assert (=> b!132240 m!155657))

(declare-fun m!155659 () Bool)

(assert (=> b!132241 m!155659))

(declare-fun m!155661 () Bool)

(assert (=> b!132242 m!155661))

(assert (=> d!40107 d!40231))

(assert (=> d!40107 d!40111))

(assert (=> b!131956 d!40139))

(declare-fun d!40233 () Bool)

(assert (=> d!40233 (= (+!162 (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) (zeroValue!2709 newMap!16) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!517 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) lt!68614 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68929 () Unit!4113)

(declare-fun choose!823 (array!4743 array!4745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3473 V!3473 V!3473 Int) Unit!4113)

(assert (=> d!40233 (= lt!68929 (choose!823 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68614 (zeroValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)))))

(assert (=> d!40233 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40233 (= (lemmaChangeZeroKeyThenAddPairToListMap!60 (_keys!4599 newMap!16) (_values!2836 newMap!16) (mask!7146 newMap!16) (extraKeys!2620 newMap!16) lt!68614 (zeroValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2709 newMap!16) (defaultEntry!2853 newMap!16)) lt!68929)))

(declare-fun bs!5466 () Bool)

(assert (= bs!5466 d!40233))

(assert (=> bs!5466 m!155011))

(declare-fun m!155663 () Bool)

(assert (=> bs!5466 m!155663))

(assert (=> bs!5466 m!155141))

(declare-fun m!155665 () Bool)

(assert (=> bs!5466 m!155665))

(assert (=> bs!5466 m!155141))

(assert (=> bs!5466 m!155267))

(assert (=> bs!5466 m!155011))

(declare-fun m!155667 () Bool)

(assert (=> bs!5466 m!155667))

(assert (=> b!131829 d!40233))

(declare-fun d!40235 () Bool)

(declare-fun e!86202 () Bool)

(assert (=> d!40235 e!86202))

(declare-fun res!63663 () Bool)

(assert (=> d!40235 (=> res!63663 e!86202)))

(declare-fun lt!68930 () Bool)

(assert (=> d!40235 (= res!63663 (not lt!68930))))

(declare-fun lt!68933 () Bool)

(assert (=> d!40235 (= lt!68930 lt!68933)))

(declare-fun lt!68932 () Unit!4113)

(declare-fun e!86203 () Unit!4113)

(assert (=> d!40235 (= lt!68932 e!86203)))

(declare-fun c!24470 () Bool)

(assert (=> d!40235 (= c!24470 lt!68933)))

(assert (=> d!40235 (= lt!68933 (containsKey!173 (toList!849 lt!68668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40235 (= (contains!883 lt!68668 #b1000000000000000000000000000000000000000000000000000000000000000) lt!68930)))

(declare-fun b!132243 () Bool)

(declare-fun lt!68931 () Unit!4113)

(assert (=> b!132243 (= e!86203 lt!68931)))

(assert (=> b!132243 (= lt!68931 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 lt!68668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132243 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132244 () Bool)

(declare-fun Unit!4126 () Unit!4113)

(assert (=> b!132244 (= e!86203 Unit!4126)))

(declare-fun b!132245 () Bool)

(assert (=> b!132245 (= e!86202 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40235 c!24470) b!132243))

(assert (= (and d!40235 (not c!24470)) b!132244))

(assert (= (and d!40235 (not res!63663)) b!132245))

(declare-fun m!155669 () Bool)

(assert (=> d!40235 m!155669))

(declare-fun m!155671 () Bool)

(assert (=> b!132243 m!155671))

(assert (=> b!132243 m!155619))

(assert (=> b!132243 m!155619))

(declare-fun m!155673 () Bool)

(assert (=> b!132243 m!155673))

(assert (=> b!132245 m!155619))

(assert (=> b!132245 m!155619))

(assert (=> b!132245 m!155673))

(assert (=> bm!14465 d!40235))

(declare-fun d!40237 () Bool)

(declare-fun e!86204 () Bool)

(assert (=> d!40237 e!86204))

(declare-fun res!63664 () Bool)

(assert (=> d!40237 (=> res!63664 e!86204)))

(declare-fun lt!68934 () Bool)

(assert (=> d!40237 (= res!63664 (not lt!68934))))

(declare-fun lt!68937 () Bool)

(assert (=> d!40237 (= lt!68934 lt!68937)))

(declare-fun lt!68936 () Unit!4113)

(declare-fun e!86205 () Unit!4113)

(assert (=> d!40237 (= lt!68936 e!86205)))

(declare-fun c!24471 () Bool)

(assert (=> d!40237 (= c!24471 lt!68937)))

(assert (=> d!40237 (= lt!68937 (containsKey!173 (toList!849 lt!68668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!40237 (= (contains!883 lt!68668 #b0000000000000000000000000000000000000000000000000000000000000000) lt!68934)))

(declare-fun b!132246 () Bool)

(declare-fun lt!68935 () Unit!4113)

(assert (=> b!132246 (= e!86205 lt!68935)))

(assert (=> b!132246 (= lt!68935 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 lt!68668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!132246 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132247 () Bool)

(declare-fun Unit!4127 () Unit!4113)

(assert (=> b!132247 (= e!86205 Unit!4127)))

(declare-fun b!132248 () Bool)

(assert (=> b!132248 (= e!86204 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40237 c!24471) b!132246))

(assert (= (and d!40237 (not c!24471)) b!132247))

(assert (= (and d!40237 (not res!63664)) b!132248))

(declare-fun m!155675 () Bool)

(assert (=> d!40237 m!155675))

(declare-fun m!155677 () Bool)

(assert (=> b!132246 m!155677))

(declare-fun m!155679 () Bool)

(assert (=> b!132246 m!155679))

(assert (=> b!132246 m!155679))

(declare-fun m!155681 () Bool)

(assert (=> b!132246 m!155681))

(assert (=> b!132248 m!155679))

(assert (=> b!132248 m!155679))

(assert (=> b!132248 m!155681))

(assert (=> bm!14464 d!40237))

(declare-fun d!40239 () Bool)

(declare-fun e!86206 () Bool)

(assert (=> d!40239 e!86206))

(declare-fun res!63665 () Bool)

(assert (=> d!40239 (=> (not res!63665) (not e!86206))))

(declare-fun lt!68939 () ListLongMap!1667)

(assert (=> d!40239 (= res!63665 (contains!883 lt!68939 (_1!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(declare-fun lt!68941 () List!1706)

(assert (=> d!40239 (= lt!68939 (ListLongMap!1668 lt!68941))))

(declare-fun lt!68940 () Unit!4113)

(declare-fun lt!68938 () Unit!4113)

(assert (=> d!40239 (= lt!68940 lt!68938)))

(assert (=> d!40239 (= (getValueByKey!169 lt!68941 (_1!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))) (Some!174 (_2!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(assert (=> d!40239 (= lt!68938 (lemmaContainsTupThenGetReturnValue!87 lt!68941 (_1!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (_2!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(assert (=> d!40239 (= lt!68941 (insertStrictlySorted!90 (toList!849 (ite c!24401 call!14467 (ite c!24402 call!14468 call!14471))) (_1!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) (_2!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))))))

(assert (=> d!40239 (= (+!162 (ite c!24401 call!14467 (ite c!24402 call!14468 call!14471)) (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))) lt!68939)))

(declare-fun b!132249 () Bool)

(declare-fun res!63666 () Bool)

(assert (=> b!132249 (=> (not res!63666) (not e!86206))))

(assert (=> b!132249 (= res!63666 (= (getValueByKey!169 (toList!849 lt!68939) (_1!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992))))))) (Some!174 (_2!1300 (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))))

(declare-fun b!132250 () Bool)

(assert (=> b!132250 (= e!86206 (contains!885 (toList!849 lt!68939) (ite (or c!24401 c!24402) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 (v!3180 (underlying!448 thiss!992)))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 (v!3180 (underlying!448 thiss!992)))))))))

(assert (= (and d!40239 res!63665) b!132249))

(assert (= (and b!132249 res!63666) b!132250))

(declare-fun m!155683 () Bool)

(assert (=> d!40239 m!155683))

(declare-fun m!155685 () Bool)

(assert (=> d!40239 m!155685))

(declare-fun m!155687 () Bool)

(assert (=> d!40239 m!155687))

(declare-fun m!155689 () Bool)

(assert (=> d!40239 m!155689))

(declare-fun m!155691 () Bool)

(assert (=> b!132249 m!155691))

(declare-fun m!155693 () Bool)

(assert (=> b!132250 m!155693))

(assert (=> bm!14470 d!40239))

(declare-fun d!40241 () Bool)

(declare-fun res!63671 () Bool)

(declare-fun e!86211 () Bool)

(assert (=> d!40241 (=> res!63671 e!86211)))

(assert (=> d!40241 (= res!63671 (and ((_ is Cons!1702) (toList!849 lt!68501)) (= (_1!1300 (h!2307 (toList!849 lt!68501))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!40241 (= (containsKey!173 (toList!849 lt!68501) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) e!86211)))

(declare-fun b!132255 () Bool)

(declare-fun e!86212 () Bool)

(assert (=> b!132255 (= e!86211 e!86212)))

(declare-fun res!63672 () Bool)

(assert (=> b!132255 (=> (not res!63672) (not e!86212))))

(assert (=> b!132255 (= res!63672 (and (or (not ((_ is Cons!1702) (toList!849 lt!68501))) (bvsle (_1!1300 (h!2307 (toList!849 lt!68501))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))) ((_ is Cons!1702) (toList!849 lt!68501)) (bvslt (_1!1300 (h!2307 (toList!849 lt!68501))) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(declare-fun b!132256 () Bool)

(assert (=> b!132256 (= e!86212 (containsKey!173 (t!6132 (toList!849 lt!68501)) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!40241 (not res!63671)) b!132255))

(assert (= (and b!132255 res!63672) b!132256))

(assert (=> b!132256 m!154997))

(declare-fun m!155695 () Bool)

(assert (=> b!132256 m!155695))

(assert (=> d!40105 d!40241))

(declare-fun b!132257 () Bool)

(declare-fun e!86218 () Bool)

(assert (=> b!132257 (= e!86218 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40243 () Bool)

(declare-fun e!86225 () Bool)

(assert (=> d!40243 e!86225))

(declare-fun res!63678 () Bool)

(assert (=> d!40243 (=> (not res!63678) (not e!86225))))

(assert (=> d!40243 (= res!63678 (or (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))))

(declare-fun lt!68951 () ListLongMap!1667)

(declare-fun lt!68954 () ListLongMap!1667)

(assert (=> d!40243 (= lt!68951 lt!68954)))

(declare-fun lt!68943 () Unit!4113)

(declare-fun e!86221 () Unit!4113)

(assert (=> d!40243 (= lt!68943 e!86221)))

(declare-fun c!24474 () Bool)

(declare-fun e!86224 () Bool)

(assert (=> d!40243 (= c!24474 e!86224)))

(declare-fun res!63680 () Bool)

(assert (=> d!40243 (=> (not res!63680) (not e!86224))))

(assert (=> d!40243 (= res!63680 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun e!86214 () ListLongMap!1667)

(assert (=> d!40243 (= lt!68954 e!86214)))

(declare-fun c!24475 () Bool)

(assert (=> d!40243 (= c!24475 (and (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40243 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40243 (= (getCurrentListMap!517 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!68951)))

(declare-fun b!132258 () Bool)

(declare-fun e!86220 () Bool)

(declare-fun e!86213 () Bool)

(assert (=> b!132258 (= e!86220 e!86213)))

(declare-fun res!63674 () Bool)

(declare-fun call!14513 () Bool)

(assert (=> b!132258 (= res!63674 call!14513)))

(assert (=> b!132258 (=> (not res!63674) (not e!86213))))

(declare-fun e!86216 () Bool)

(declare-fun b!132259 () Bool)

(assert (=> b!132259 (= e!86216 (= (apply!115 lt!68951 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)) (get!1472 (select (arr!2243 (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!417 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2512 (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))))))))

(assert (=> b!132259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132260 () Bool)

(declare-fun e!86222 () ListLongMap!1667)

(assert (=> b!132260 (= e!86214 e!86222)))

(declare-fun c!24476 () Bool)

(assert (=> b!132260 (= c!24476 (and (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132261 () Bool)

(declare-fun res!63677 () Bool)

(assert (=> b!132261 (=> (not res!63677) (not e!86225))))

(declare-fun e!86215 () Bool)

(assert (=> b!132261 (= res!63677 e!86215)))

(declare-fun c!24472 () Bool)

(assert (=> b!132261 (= c!24472 (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132262 () Bool)

(assert (=> b!132262 (= e!86220 (not call!14513))))

(declare-fun bm!14508 () Bool)

(declare-fun call!14516 () Bool)

(assert (=> bm!14508 (= call!14516 (contains!883 lt!68951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!14517 () ListLongMap!1667)

(declare-fun b!132263 () Bool)

(assert (=> b!132263 (= e!86214 (+!162 call!14517 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))))))

(declare-fun b!132264 () Bool)

(declare-fun e!86217 () ListLongMap!1667)

(declare-fun call!14514 () ListLongMap!1667)

(assert (=> b!132264 (= e!86217 call!14514)))

(declare-fun bm!14509 () Bool)

(assert (=> bm!14509 (= call!14513 (contains!883 lt!68951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!14511 () ListLongMap!1667)

(declare-fun bm!14510 () Bool)

(assert (=> bm!14510 (= call!14511 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!132265 () Bool)

(declare-fun Unit!4128 () Unit!4113)

(assert (=> b!132265 (= e!86221 Unit!4128)))

(declare-fun b!132266 () Bool)

(declare-fun call!14515 () ListLongMap!1667)

(assert (=> b!132266 (= e!86217 call!14515)))

(declare-fun b!132267 () Bool)

(assert (=> b!132267 (= e!86213 (= (apply!115 lt!68951 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16))))))

(declare-fun bm!14511 () Bool)

(assert (=> bm!14511 (= call!14514 call!14517)))

(declare-fun b!132268 () Bool)

(declare-fun e!86223 () Bool)

(assert (=> b!132268 (= e!86215 e!86223)))

(declare-fun res!63673 () Bool)

(assert (=> b!132268 (= res!63673 call!14516)))

(assert (=> b!132268 (=> (not res!63673) (not e!86223))))

(declare-fun b!132269 () Bool)

(assert (=> b!132269 (= e!86224 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14512 () Bool)

(declare-fun call!14512 () ListLongMap!1667)

(assert (=> bm!14512 (= call!14515 call!14512)))

(declare-fun b!132270 () Bool)

(declare-fun res!63676 () Bool)

(assert (=> b!132270 (=> (not res!63676) (not e!86225))))

(declare-fun e!86219 () Bool)

(assert (=> b!132270 (= res!63676 e!86219)))

(declare-fun res!63675 () Bool)

(assert (=> b!132270 (=> res!63675 e!86219)))

(assert (=> b!132270 (= res!63675 (not e!86218))))

(declare-fun res!63681 () Bool)

(assert (=> b!132270 (=> (not res!63681) (not e!86218))))

(assert (=> b!132270 (= res!63681 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132271 () Bool)

(assert (=> b!132271 (= e!86215 (not call!14516))))

(declare-fun b!132272 () Bool)

(declare-fun c!24477 () Bool)

(assert (=> b!132272 (= c!24477 (and (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132272 (= e!86222 e!86217)))

(declare-fun b!132273 () Bool)

(assert (=> b!132273 (= e!86219 e!86216)))

(declare-fun res!63679 () Bool)

(assert (=> b!132273 (=> (not res!63679) (not e!86216))))

(assert (=> b!132273 (= res!63679 (contains!883 lt!68951 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132273 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun bm!14513 () Bool)

(assert (=> bm!14513 (= call!14512 call!14511)))

(declare-fun b!132274 () Bool)

(assert (=> b!132274 (= e!86223 (= (apply!115 lt!68951 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2709 newMap!16)))))

(declare-fun b!132275 () Bool)

(declare-fun lt!68948 () Unit!4113)

(assert (=> b!132275 (= e!86221 lt!68948)))

(declare-fun lt!68944 () ListLongMap!1667)

(assert (=> b!132275 (= lt!68944 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68953 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68962 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68962 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68947 () Unit!4113)

(assert (=> b!132275 (= lt!68947 (addStillContains!91 lt!68944 lt!68953 (zeroValue!2709 newMap!16) lt!68962))))

(assert (=> b!132275 (contains!883 (+!162 lt!68944 (tuple2!2579 lt!68953 (zeroValue!2709 newMap!16))) lt!68962)))

(declare-fun lt!68958 () Unit!4113)

(assert (=> b!132275 (= lt!68958 lt!68947)))

(declare-fun lt!68942 () ListLongMap!1667)

(assert (=> b!132275 (= lt!68942 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68956 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68956 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68955 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68955 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68945 () Unit!4113)

(assert (=> b!132275 (= lt!68945 (addApplyDifferent!91 lt!68942 lt!68956 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) lt!68955))))

(assert (=> b!132275 (= (apply!115 (+!162 lt!68942 (tuple2!2579 lt!68956 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))) lt!68955) (apply!115 lt!68942 lt!68955))))

(declare-fun lt!68963 () Unit!4113)

(assert (=> b!132275 (= lt!68963 lt!68945)))

(declare-fun lt!68946 () ListLongMap!1667)

(assert (=> b!132275 (= lt!68946 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68961 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68961 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68950 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68950 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68957 () Unit!4113)

(assert (=> b!132275 (= lt!68957 (addApplyDifferent!91 lt!68946 lt!68961 (zeroValue!2709 newMap!16) lt!68950))))

(assert (=> b!132275 (= (apply!115 (+!162 lt!68946 (tuple2!2579 lt!68961 (zeroValue!2709 newMap!16))) lt!68950) (apply!115 lt!68946 lt!68950))))

(declare-fun lt!68959 () Unit!4113)

(assert (=> b!132275 (= lt!68959 lt!68957)))

(declare-fun lt!68949 () ListLongMap!1667)

(assert (=> b!132275 (= lt!68949 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite (or c!24369 c!24379) (_values!2836 newMap!16) (array!4746 (store (arr!2243 (_values!2836 newMap!16)) (index!3268 lt!68601) (ValueCellFull!1091 (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2512 (_values!2836 newMap!16)))) (mask!7146 newMap!16) (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) (zeroValue!2709 newMap!16) (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68952 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68952 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68960 () (_ BitVec 64))

(assert (=> b!132275 (= lt!68960 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132275 (= lt!68948 (addApplyDifferent!91 lt!68949 lt!68952 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)) lt!68960))))

(assert (=> b!132275 (= (apply!115 (+!162 lt!68949 (tuple2!2579 lt!68952 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16)))) lt!68960) (apply!115 lt!68949 lt!68960))))

(declare-fun b!132276 () Bool)

(assert (=> b!132276 (= e!86222 call!14514)))

(declare-fun b!132277 () Bool)

(assert (=> b!132277 (= e!86225 e!86220)))

(declare-fun c!24473 () Bool)

(assert (=> b!132277 (= c!24473 (not (= (bvand (ite c!24369 (ite c!24380 (extraKeys!2620 newMap!16) lt!68595) (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14514 () Bool)

(assert (=> bm!14514 (= call!14517 (+!162 (ite c!24475 call!14511 (ite c!24476 call!14512 call!14515)) (ite (or c!24475 c!24476) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2709 newMap!16)) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!24369 (ite c!24380 (minValue!2709 newMap!16) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2709 newMap!16))))))))

(assert (= (and d!40243 c!24475) b!132263))

(assert (= (and d!40243 (not c!24475)) b!132260))

(assert (= (and b!132260 c!24476) b!132276))

(assert (= (and b!132260 (not c!24476)) b!132272))

(assert (= (and b!132272 c!24477) b!132264))

(assert (= (and b!132272 (not c!24477)) b!132266))

(assert (= (or b!132264 b!132266) bm!14512))

(assert (= (or b!132276 bm!14512) bm!14513))

(assert (= (or b!132276 b!132264) bm!14511))

(assert (= (or b!132263 bm!14513) bm!14510))

(assert (= (or b!132263 bm!14511) bm!14514))

(assert (= (and d!40243 res!63680) b!132269))

(assert (= (and d!40243 c!24474) b!132275))

(assert (= (and d!40243 (not c!24474)) b!132265))

(assert (= (and d!40243 res!63678) b!132270))

(assert (= (and b!132270 res!63681) b!132257))

(assert (= (and b!132270 (not res!63675)) b!132273))

(assert (= (and b!132273 res!63679) b!132259))

(assert (= (and b!132270 res!63676) b!132261))

(assert (= (and b!132261 c!24472) b!132268))

(assert (= (and b!132261 (not c!24472)) b!132271))

(assert (= (and b!132268 res!63673) b!132274))

(assert (= (or b!132268 b!132271) bm!14508))

(assert (= (and b!132261 res!63677) b!132277))

(assert (= (and b!132277 c!24473) b!132258))

(assert (= (and b!132277 (not c!24473)) b!132262))

(assert (= (and b!132258 res!63674) b!132267))

(assert (= (or b!132258 b!132262) bm!14509))

(declare-fun b_lambda!5871 () Bool)

(assert (=> (not b_lambda!5871) (not b!132259)))

(assert (=> b!132259 t!6145))

(declare-fun b_and!8173 () Bool)

(assert (= b_and!8169 (and (=> t!6145 result!3969) b_and!8173)))

(assert (=> b!132259 t!6147))

(declare-fun b_and!8175 () Bool)

(assert (= b_and!8171 (and (=> t!6147 result!3971) b_and!8175)))

(declare-fun m!155697 () Bool)

(assert (=> bm!14510 m!155697))

(assert (=> b!132257 m!155283))

(assert (=> b!132257 m!155283))

(assert (=> b!132257 m!155285))

(assert (=> b!132273 m!155283))

(assert (=> b!132273 m!155283))

(declare-fun m!155699 () Bool)

(assert (=> b!132273 m!155699))

(declare-fun m!155701 () Bool)

(assert (=> b!132275 m!155701))

(declare-fun m!155703 () Bool)

(assert (=> b!132275 m!155703))

(declare-fun m!155705 () Bool)

(assert (=> b!132275 m!155705))

(declare-fun m!155707 () Bool)

(assert (=> b!132275 m!155707))

(declare-fun m!155709 () Bool)

(assert (=> b!132275 m!155709))

(declare-fun m!155711 () Bool)

(assert (=> b!132275 m!155711))

(declare-fun m!155713 () Bool)

(assert (=> b!132275 m!155713))

(assert (=> b!132275 m!155283))

(declare-fun m!155715 () Bool)

(assert (=> b!132275 m!155715))

(assert (=> b!132275 m!155705))

(declare-fun m!155717 () Bool)

(assert (=> b!132275 m!155717))

(declare-fun m!155719 () Bool)

(assert (=> b!132275 m!155719))

(declare-fun m!155721 () Bool)

(assert (=> b!132275 m!155721))

(assert (=> b!132275 m!155715))

(declare-fun m!155723 () Bool)

(assert (=> b!132275 m!155723))

(declare-fun m!155725 () Bool)

(assert (=> b!132275 m!155725))

(declare-fun m!155727 () Bool)

(assert (=> b!132275 m!155727))

(declare-fun m!155729 () Bool)

(assert (=> b!132275 m!155729))

(assert (=> b!132275 m!155725))

(assert (=> b!132275 m!155697))

(assert (=> b!132275 m!155707))

(declare-fun m!155731 () Bool)

(assert (=> bm!14509 m!155731))

(assert (=> b!132269 m!155283))

(assert (=> b!132269 m!155283))

(assert (=> b!132269 m!155285))

(assert (=> d!40243 m!155267))

(declare-fun m!155733 () Bool)

(assert (=> b!132263 m!155733))

(declare-fun m!155735 () Bool)

(assert (=> b!132267 m!155735))

(declare-fun m!155737 () Bool)

(assert (=> bm!14508 m!155737))

(declare-fun m!155739 () Bool)

(assert (=> b!132259 m!155739))

(assert (=> b!132259 m!155739))

(assert (=> b!132259 m!155329))

(declare-fun m!155741 () Bool)

(assert (=> b!132259 m!155741))

(assert (=> b!132259 m!155283))

(assert (=> b!132259 m!155283))

(declare-fun m!155743 () Bool)

(assert (=> b!132259 m!155743))

(assert (=> b!132259 m!155329))

(declare-fun m!155745 () Bool)

(assert (=> b!132274 m!155745))

(declare-fun m!155747 () Bool)

(assert (=> bm!14514 m!155747))

(assert (=> bm!14435 d!40243))

(declare-fun d!40245 () Bool)

(declare-fun e!86226 () Bool)

(assert (=> d!40245 e!86226))

(declare-fun res!63682 () Bool)

(assert (=> d!40245 (=> res!63682 e!86226)))

(declare-fun lt!68964 () Bool)

(assert (=> d!40245 (= res!63682 (not lt!68964))))

(declare-fun lt!68967 () Bool)

(assert (=> d!40245 (= lt!68964 lt!68967)))

(declare-fun lt!68966 () Unit!4113)

(declare-fun e!86227 () Unit!4113)

(assert (=> d!40245 (= lt!68966 e!86227)))

(declare-fun c!24478 () Bool)

(assert (=> d!40245 (= c!24478 lt!68967)))

(assert (=> d!40245 (= lt!68967 (containsKey!173 (toList!849 call!14436) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!40245 (= (contains!883 call!14436 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)) lt!68964)))

(declare-fun b!132278 () Bool)

(declare-fun lt!68965 () Unit!4113)

(assert (=> b!132278 (= e!86227 lt!68965)))

(assert (=> b!132278 (= lt!68965 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 call!14436) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!132278 (isDefined!123 (getValueByKey!169 (toList!849 call!14436) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!132279 () Bool)

(declare-fun Unit!4129 () Unit!4113)

(assert (=> b!132279 (= e!86227 Unit!4129)))

(declare-fun b!132280 () Bool)

(assert (=> b!132280 (= e!86226 (isDefined!123 (getValueByKey!169 (toList!849 call!14436) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!40245 c!24478) b!132278))

(assert (= (and d!40245 (not c!24478)) b!132279))

(assert (= (and d!40245 (not res!63682)) b!132280))

(assert (=> d!40245 m!154997))

(declare-fun m!155749 () Bool)

(assert (=> d!40245 m!155749))

(assert (=> b!132278 m!154997))

(declare-fun m!155751 () Bool)

(assert (=> b!132278 m!155751))

(assert (=> b!132278 m!154997))

(declare-fun m!155753 () Bool)

(assert (=> b!132278 m!155753))

(assert (=> b!132278 m!155753))

(declare-fun m!155755 () Bool)

(assert (=> b!132278 m!155755))

(assert (=> b!132280 m!154997))

(assert (=> b!132280 m!155753))

(assert (=> b!132280 m!155753))

(assert (=> b!132280 m!155755))

(assert (=> b!131846 d!40245))

(assert (=> b!131923 d!40135))

(declare-fun d!40247 () Bool)

(declare-fun e!86228 () Bool)

(assert (=> d!40247 e!86228))

(declare-fun res!63683 () Bool)

(assert (=> d!40247 (=> res!63683 e!86228)))

(declare-fun lt!68968 () Bool)

(assert (=> d!40247 (= res!63683 (not lt!68968))))

(declare-fun lt!68971 () Bool)

(assert (=> d!40247 (= lt!68968 lt!68971)))

(declare-fun lt!68970 () Unit!4113)

(declare-fun e!86229 () Unit!4113)

(assert (=> d!40247 (= lt!68970 e!86229)))

(declare-fun c!24479 () Bool)

(assert (=> d!40247 (= c!24479 lt!68971)))

(assert (=> d!40247 (= lt!68971 (containsKey!173 (toList!849 lt!68668) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!40247 (= (contains!883 lt!68668 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!68968)))

(declare-fun b!132281 () Bool)

(declare-fun lt!68969 () Unit!4113)

(assert (=> b!132281 (= e!86229 lt!68969)))

(assert (=> b!132281 (= lt!68969 (lemmaContainsKeyImpliesGetValueByKeyDefined!122 (toList!849 lt!68668) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!132281 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!132282 () Bool)

(declare-fun Unit!4130 () Unit!4113)

(assert (=> b!132282 (= e!86229 Unit!4130)))

(declare-fun b!132283 () Bool)

(assert (=> b!132283 (= e!86228 (isDefined!123 (getValueByKey!169 (toList!849 lt!68668) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!40247 c!24479) b!132281))

(assert (= (and d!40247 (not c!24479)) b!132282))

(assert (= (and d!40247 (not res!63683)) b!132283))

(assert (=> d!40247 m!155181))

(declare-fun m!155757 () Bool)

(assert (=> d!40247 m!155757))

(assert (=> b!132281 m!155181))

(declare-fun m!155759 () Bool)

(assert (=> b!132281 m!155759))

(assert (=> b!132281 m!155181))

(declare-fun m!155761 () Bool)

(assert (=> b!132281 m!155761))

(assert (=> b!132281 m!155761))

(declare-fun m!155763 () Bool)

(assert (=> b!132281 m!155763))

(assert (=> b!132283 m!155181))

(assert (=> b!132283 m!155761))

(assert (=> b!132283 m!155761))

(assert (=> b!132283 m!155763))

(assert (=> b!131939 d!40247))

(assert (=> b!131970 d!40139))

(declare-fun b!132292 () Bool)

(declare-fun e!86235 () (_ BitVec 32))

(declare-fun call!14520 () (_ BitVec 32))

(assert (=> b!132292 (= e!86235 (bvadd #b00000000000000000000000000000001 call!14520))))

(declare-fun b!132293 () Bool)

(assert (=> b!132293 (= e!86235 call!14520)))

(declare-fun b!132294 () Bool)

(declare-fun e!86234 () (_ BitVec 32))

(assert (=> b!132294 (= e!86234 e!86235)))

(declare-fun c!24485 () Bool)

(assert (=> b!132294 (= c!24485 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14517 () Bool)

(assert (=> bm!14517 (= call!14520 (arrayCountValidKeys!0 (_keys!4599 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132295 () Bool)

(assert (=> b!132295 (= e!86234 #b00000000000000000000000000000000)))

(declare-fun d!40249 () Bool)

(declare-fun lt!68974 () (_ BitVec 32))

(assert (=> d!40249 (and (bvsge lt!68974 #b00000000000000000000000000000000) (bvsle lt!68974 (bvsub (size!2511 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!40249 (= lt!68974 e!86234)))

(declare-fun c!24484 () Bool)

(assert (=> d!40249 (= c!24484 (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(assert (=> d!40249 (and (bvsle #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2511 (_keys!4599 newMap!16)) (size!2511 (_keys!4599 newMap!16))))))

(assert (=> d!40249 (= (arrayCountValidKeys!0 (_keys!4599 newMap!16) #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) lt!68974)))

(assert (= (and d!40249 c!24484) b!132295))

(assert (= (and d!40249 (not c!24484)) b!132294))

(assert (= (and b!132294 c!24485) b!132292))

(assert (= (and b!132294 (not c!24485)) b!132293))

(assert (= (or b!132292 b!132293) bm!14517))

(assert (=> b!132294 m!155283))

(assert (=> b!132294 m!155283))

(assert (=> b!132294 m!155285))

(declare-fun m!155765 () Bool)

(assert (=> bm!14517 m!155765))

(assert (=> b!131878 d!40249))

(declare-fun b!132296 () Bool)

(declare-fun e!86238 () Bool)

(declare-fun call!14521 () Bool)

(assert (=> b!132296 (= e!86238 call!14521)))

(declare-fun d!40251 () Bool)

(declare-fun res!63686 () Bool)

(declare-fun e!86239 () Bool)

(assert (=> d!40251 (=> res!63686 e!86239)))

(assert (=> d!40251 (= res!63686 (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(assert (=> d!40251 (= (arrayNoDuplicates!0 (_keys!4599 newMap!16) #b00000000000000000000000000000000 Nil!1704) e!86239)))

(declare-fun b!132297 () Bool)

(assert (=> b!132297 (= e!86238 call!14521)))

(declare-fun bm!14518 () Bool)

(declare-fun c!24486 () Bool)

(assert (=> bm!14518 (= call!14521 (arrayNoDuplicates!0 (_keys!4599 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24486 (Cons!1703 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000) Nil!1704) Nil!1704)))))

(declare-fun b!132298 () Bool)

(declare-fun e!86237 () Bool)

(assert (=> b!132298 (= e!86237 e!86238)))

(assert (=> b!132298 (= c!24486 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132299 () Bool)

(assert (=> b!132299 (= e!86239 e!86237)))

(declare-fun res!63684 () Bool)

(assert (=> b!132299 (=> (not res!63684) (not e!86237))))

(declare-fun e!86236 () Bool)

(assert (=> b!132299 (= res!63684 (not e!86236))))

(declare-fun res!63685 () Bool)

(assert (=> b!132299 (=> (not res!63685) (not e!86236))))

(assert (=> b!132299 (= res!63685 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!132300 () Bool)

(assert (=> b!132300 (= e!86236 (contains!884 Nil!1704 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!40251 (not res!63686)) b!132299))

(assert (= (and b!132299 res!63685) b!132300))

(assert (= (and b!132299 res!63684) b!132298))

(assert (= (and b!132298 c!24486) b!132296))

(assert (= (and b!132298 (not c!24486)) b!132297))

(assert (= (or b!132296 b!132297) bm!14518))

(assert (=> bm!14518 m!155283))

(declare-fun m!155767 () Bool)

(assert (=> bm!14518 m!155767))

(assert (=> b!132298 m!155283))

(assert (=> b!132298 m!155283))

(assert (=> b!132298 m!155285))

(assert (=> b!132299 m!155283))

(assert (=> b!132299 m!155283))

(assert (=> b!132299 m!155285))

(assert (=> b!132300 m!155283))

(assert (=> b!132300 m!155283))

(declare-fun m!155769 () Bool)

(assert (=> b!132300 m!155769))

(assert (=> b!131880 d!40251))

(declare-fun d!40253 () Bool)

(assert (=> d!40253 (= (apply!115 lt!68668 (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1475 (getValueByKey!169 (toList!849 lt!68668) (select (arr!2242 (_keys!4599 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5467 () Bool)

(assert (= bs!5467 d!40253))

(assert (=> bs!5467 m!155181))

(assert (=> bs!5467 m!155761))

(assert (=> bs!5467 m!155761))

(declare-fun m!155771 () Bool)

(assert (=> bs!5467 m!155771))

(assert (=> b!131925 d!40253))

(declare-fun d!40255 () Bool)

(declare-fun c!24487 () Bool)

(assert (=> d!40255 (= c!24487 ((_ is ValueCellFull!1091) (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!86240 () V!3473)

(assert (=> d!40255 (= (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!86240)))

(declare-fun b!132301 () Bool)

(assert (=> b!132301 (= e!86240 (get!1473 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!132302 () Bool)

(assert (=> b!132302 (= e!86240 (get!1474 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!40255 c!24487) b!132301))

(assert (= (and d!40255 (not c!24487)) b!132302))

(assert (=> b!132301 m!155225))

(assert (=> b!132301 m!155009))

(declare-fun m!155773 () Bool)

(assert (=> b!132301 m!155773))

(assert (=> b!132302 m!155225))

(assert (=> b!132302 m!155009))

(declare-fun m!155775 () Bool)

(assert (=> b!132302 m!155775))

(assert (=> b!131925 d!40255))

(declare-fun d!40257 () Bool)

(assert (=> d!40257 (= (apply!115 lt!68668 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1475 (getValueByKey!169 (toList!849 lt!68668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5468 () Bool)

(assert (= bs!5468 d!40257))

(assert (=> bs!5468 m!155679))

(assert (=> bs!5468 m!155679))

(declare-fun m!155777 () Bool)

(assert (=> bs!5468 m!155777))

(assert (=> b!131940 d!40257))

(declare-fun b!132303 () Bool)

(declare-fun e!86246 () Bool)

(assert (=> b!132303 (= e!86246 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!40259 () Bool)

(declare-fun e!86253 () Bool)

(assert (=> d!40259 e!86253))

(declare-fun res!63692 () Bool)

(assert (=> d!40259 (=> (not res!63692) (not e!86253))))

(assert (=> d!40259 (= res!63692 (or (bvsge #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))))

(declare-fun lt!68984 () ListLongMap!1667)

(declare-fun lt!68987 () ListLongMap!1667)

(assert (=> d!40259 (= lt!68984 lt!68987)))

(declare-fun lt!68976 () Unit!4113)

(declare-fun e!86249 () Unit!4113)

(assert (=> d!40259 (= lt!68976 e!86249)))

(declare-fun c!24490 () Bool)

(declare-fun e!86252 () Bool)

(assert (=> d!40259 (= c!24490 e!86252)))

(declare-fun res!63694 () Bool)

(assert (=> d!40259 (=> (not res!63694) (not e!86252))))

(assert (=> d!40259 (= res!63694 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun e!86242 () ListLongMap!1667)

(assert (=> d!40259 (= lt!68987 e!86242)))

(declare-fun c!24491 () Bool)

(assert (=> d!40259 (= c!24491 (and (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!40259 (validMask!0 (mask!7146 newMap!16))))

(assert (=> d!40259 (= (getCurrentListMap!517 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)) lt!68984)))

(declare-fun b!132304 () Bool)

(declare-fun e!86248 () Bool)

(declare-fun e!86241 () Bool)

(assert (=> b!132304 (= e!86248 e!86241)))

(declare-fun res!63688 () Bool)

(declare-fun call!14524 () Bool)

(assert (=> b!132304 (= res!63688 call!14524)))

(assert (=> b!132304 (=> (not res!63688) (not e!86241))))

(declare-fun b!132305 () Bool)

(declare-fun e!86244 () Bool)

(assert (=> b!132305 (= e!86244 (= (apply!115 lt!68984 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)) (get!1472 (select (arr!2243 (ite c!24369 (_values!2836 newMap!16) lt!68596)) #b00000000000000000000000000000000) (dynLambda!417 (defaultEntry!2853 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!132305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2512 (ite c!24369 (_values!2836 newMap!16) lt!68596))))))

(assert (=> b!132305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132306 () Bool)

(declare-fun e!86250 () ListLongMap!1667)

(assert (=> b!132306 (= e!86242 e!86250)))

(declare-fun c!24492 () Bool)

(assert (=> b!132306 (= c!24492 (and (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!132307 () Bool)

(declare-fun res!63691 () Bool)

(assert (=> b!132307 (=> (not res!63691) (not e!86253))))

(declare-fun e!86243 () Bool)

(assert (=> b!132307 (= res!63691 e!86243)))

(declare-fun c!24488 () Bool)

(assert (=> b!132307 (= c!24488 (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!132308 () Bool)

(assert (=> b!132308 (= e!86248 (not call!14524))))

(declare-fun bm!14519 () Bool)

(declare-fun call!14527 () Bool)

(assert (=> bm!14519 (= call!14527 (contains!883 lt!68984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!132309 () Bool)

(declare-fun call!14528 () ListLongMap!1667)

(assert (=> b!132309 (= e!86242 (+!162 call!14528 (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16))))))

(declare-fun b!132310 () Bool)

(declare-fun e!86245 () ListLongMap!1667)

(declare-fun call!14525 () ListLongMap!1667)

(assert (=> b!132310 (= e!86245 call!14525)))

(declare-fun bm!14520 () Bool)

(assert (=> bm!14520 (= call!14524 (contains!883 lt!68984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!14522 () ListLongMap!1667)

(declare-fun bm!14521 () Bool)

(assert (=> bm!14521 (= call!14522 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun b!132311 () Bool)

(declare-fun Unit!4131 () Unit!4113)

(assert (=> b!132311 (= e!86249 Unit!4131)))

(declare-fun b!132312 () Bool)

(declare-fun call!14526 () ListLongMap!1667)

(assert (=> b!132312 (= e!86245 call!14526)))

(declare-fun b!132313 () Bool)

(assert (=> b!132313 (= e!86241 (= (apply!115 lt!68984 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2709 newMap!16)))))

(declare-fun bm!14522 () Bool)

(assert (=> bm!14522 (= call!14525 call!14528)))

(declare-fun b!132314 () Bool)

(declare-fun e!86251 () Bool)

(assert (=> b!132314 (= e!86243 e!86251)))

(declare-fun res!63687 () Bool)

(assert (=> b!132314 (= res!63687 call!14527)))

(assert (=> b!132314 (=> (not res!63687) (not e!86251))))

(declare-fun b!132315 () Bool)

(assert (=> b!132315 (= e!86252 (validKeyInArray!0 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14523 () Bool)

(declare-fun call!14523 () ListLongMap!1667)

(assert (=> bm!14523 (= call!14526 call!14523)))

(declare-fun b!132316 () Bool)

(declare-fun res!63690 () Bool)

(assert (=> b!132316 (=> (not res!63690) (not e!86253))))

(declare-fun e!86247 () Bool)

(assert (=> b!132316 (= res!63690 e!86247)))

(declare-fun res!63689 () Bool)

(assert (=> b!132316 (=> res!63689 e!86247)))

(assert (=> b!132316 (= res!63689 (not e!86246))))

(declare-fun res!63695 () Bool)

(assert (=> b!132316 (=> (not res!63695) (not e!86246))))

(assert (=> b!132316 (= res!63695 (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun b!132317 () Bool)

(assert (=> b!132317 (= e!86243 (not call!14527))))

(declare-fun b!132318 () Bool)

(declare-fun c!24493 () Bool)

(assert (=> b!132318 (= c!24493 (and (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!132318 (= e!86250 e!86245)))

(declare-fun b!132319 () Bool)

(assert (=> b!132319 (= e!86247 e!86244)))

(declare-fun res!63693 () Bool)

(assert (=> b!132319 (=> (not res!63693) (not e!86244))))

(assert (=> b!132319 (= res!63693 (contains!883 lt!68984 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!132319 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2511 (_keys!4599 newMap!16))))))

(declare-fun bm!14524 () Bool)

(assert (=> bm!14524 (= call!14523 call!14522)))

(declare-fun b!132320 () Bool)

(assert (=> b!132320 (= e!86251 (= (apply!115 lt!68984 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16))))))

(declare-fun b!132321 () Bool)

(declare-fun lt!68981 () Unit!4113)

(assert (=> b!132321 (= e!86249 lt!68981)))

(declare-fun lt!68977 () ListLongMap!1667)

(assert (=> b!132321 (= lt!68977 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68986 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68995 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68995 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68980 () Unit!4113)

(assert (=> b!132321 (= lt!68980 (addStillContains!91 lt!68977 lt!68986 (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) lt!68995))))

(assert (=> b!132321 (contains!883 (+!162 lt!68977 (tuple2!2579 lt!68986 (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)))) lt!68995)))

(declare-fun lt!68991 () Unit!4113)

(assert (=> b!132321 (= lt!68991 lt!68980)))

(declare-fun lt!68975 () ListLongMap!1667)

(assert (=> b!132321 (= lt!68975 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68989 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68989 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68988 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68988 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68978 () Unit!4113)

(assert (=> b!132321 (= lt!68978 (addApplyDifferent!91 lt!68975 lt!68989 (minValue!2709 newMap!16) lt!68988))))

(assert (=> b!132321 (= (apply!115 (+!162 lt!68975 (tuple2!2579 lt!68989 (minValue!2709 newMap!16))) lt!68988) (apply!115 lt!68975 lt!68988))))

(declare-fun lt!68996 () Unit!4113)

(assert (=> b!132321 (= lt!68996 lt!68978)))

(declare-fun lt!68979 () ListLongMap!1667)

(assert (=> b!132321 (= lt!68979 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68994 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68983 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68983 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!68990 () Unit!4113)

(assert (=> b!132321 (= lt!68990 (addApplyDifferent!91 lt!68979 lt!68994 (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) lt!68983))))

(assert (=> b!132321 (= (apply!115 (+!162 lt!68979 (tuple2!2579 lt!68994 (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)))) lt!68983) (apply!115 lt!68979 lt!68983))))

(declare-fun lt!68992 () Unit!4113)

(assert (=> b!132321 (= lt!68992 lt!68990)))

(declare-fun lt!68982 () ListLongMap!1667)

(assert (=> b!132321 (= lt!68982 (getCurrentListMapNoExtraKeys!127 (_keys!4599 newMap!16) (ite c!24369 (_values!2836 newMap!16) lt!68596) (mask!7146 newMap!16) (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16)) (minValue!2709 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2853 newMap!16)))))

(declare-fun lt!68985 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68985 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68993 () (_ BitVec 64))

(assert (=> b!132321 (= lt!68993 (select (arr!2242 (_keys!4599 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!132321 (= lt!68981 (addApplyDifferent!91 lt!68982 lt!68985 (minValue!2709 newMap!16) lt!68993))))

(assert (=> b!132321 (= (apply!115 (+!162 lt!68982 (tuple2!2579 lt!68985 (minValue!2709 newMap!16))) lt!68993) (apply!115 lt!68982 lt!68993))))

(declare-fun b!132322 () Bool)

(assert (=> b!132322 (= e!86250 call!14525)))

(declare-fun b!132323 () Bool)

(assert (=> b!132323 (= e!86253 e!86248)))

(declare-fun c!24489 () Bool)

(assert (=> b!132323 (= c!24489 (not (= (bvand (ite (and c!24369 c!24380) lt!68614 (extraKeys!2620 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14525 () Bool)

(assert (=> bm!14525 (= call!14528 (+!162 (ite c!24491 call!14522 (ite c!24492 call!14523 call!14526)) (ite (or c!24491 c!24492) (tuple2!2579 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!24369 c!24380) (get!1472 (select (arr!2243 (_values!2836 (v!3180 (underlying!448 thiss!992)))) from!355) (dynLambda!417 (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2709 newMap!16))) (tuple2!2579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2709 newMap!16)))))))

(assert (= (and d!40259 c!24491) b!132309))

(assert (= (and d!40259 (not c!24491)) b!132306))

(assert (= (and b!132306 c!24492) b!132322))

(assert (= (and b!132306 (not c!24492)) b!132318))

(assert (= (and b!132318 c!24493) b!132310))

(assert (= (and b!132318 (not c!24493)) b!132312))

(assert (= (or b!132310 b!132312) bm!14523))

(assert (= (or b!132322 bm!14523) bm!14524))

(assert (= (or b!132322 b!132310) bm!14522))

(assert (= (or b!132309 bm!14524) bm!14521))

(assert (= (or b!132309 bm!14522) bm!14525))

(assert (= (and d!40259 res!63694) b!132315))

(assert (= (and d!40259 c!24490) b!132321))

(assert (= (and d!40259 (not c!24490)) b!132311))

(assert (= (and d!40259 res!63692) b!132316))

(assert (= (and b!132316 res!63695) b!132303))

(assert (= (and b!132316 (not res!63689)) b!132319))

(assert (= (and b!132319 res!63693) b!132305))

(assert (= (and b!132316 res!63690) b!132307))

(assert (= (and b!132307 c!24488) b!132314))

(assert (= (and b!132307 (not c!24488)) b!132317))

(assert (= (and b!132314 res!63687) b!132320))

(assert (= (or b!132314 b!132317) bm!14519))

(assert (= (and b!132307 res!63691) b!132323))

(assert (= (and b!132323 c!24489) b!132304))

(assert (= (and b!132323 (not c!24489)) b!132308))

(assert (= (and b!132304 res!63688) b!132313))

(assert (= (or b!132304 b!132308) bm!14520))

(declare-fun b_lambda!5873 () Bool)

(assert (=> (not b_lambda!5873) (not b!132305)))

(assert (=> b!132305 t!6145))

(declare-fun b_and!8177 () Bool)

(assert (= b_and!8173 (and (=> t!6145 result!3969) b_and!8177)))

(assert (=> b!132305 t!6147))

(declare-fun b_and!8179 () Bool)

(assert (= b_and!8175 (and (=> t!6147 result!3971) b_and!8179)))

(declare-fun m!155779 () Bool)

(assert (=> bm!14521 m!155779))

(assert (=> b!132303 m!155283))

(assert (=> b!132303 m!155283))

(assert (=> b!132303 m!155285))

(assert (=> b!132319 m!155283))

(assert (=> b!132319 m!155283))

(declare-fun m!155781 () Bool)

(assert (=> b!132319 m!155781))

(declare-fun m!155783 () Bool)

(assert (=> b!132321 m!155783))

(declare-fun m!155785 () Bool)

(assert (=> b!132321 m!155785))

(declare-fun m!155787 () Bool)

(assert (=> b!132321 m!155787))

(declare-fun m!155789 () Bool)

(assert (=> b!132321 m!155789))

(declare-fun m!155791 () Bool)

(assert (=> b!132321 m!155791))

(declare-fun m!155793 () Bool)

(assert (=> b!132321 m!155793))

(declare-fun m!155795 () Bool)

(assert (=> b!132321 m!155795))

(assert (=> b!132321 m!155283))

(declare-fun m!155797 () Bool)

(assert (=> b!132321 m!155797))

(assert (=> b!132321 m!155787))

(declare-fun m!155799 () Bool)

(assert (=> b!132321 m!155799))

(declare-fun m!155801 () Bool)

(assert (=> b!132321 m!155801))

(declare-fun m!155803 () Bool)

(assert (=> b!132321 m!155803))

(assert (=> b!132321 m!155797))

(declare-fun m!155805 () Bool)

(assert (=> b!132321 m!155805))

(declare-fun m!155807 () Bool)

(assert (=> b!132321 m!155807))

(declare-fun m!155809 () Bool)

(assert (=> b!132321 m!155809))

(declare-fun m!155811 () Bool)

(assert (=> b!132321 m!155811))

(assert (=> b!132321 m!155807))

(assert (=> b!132321 m!155779))

(assert (=> b!132321 m!155789))

(declare-fun m!155813 () Bool)

(assert (=> bm!14520 m!155813))

(assert (=> b!132315 m!155283))

(assert (=> b!132315 m!155283))

(assert (=> b!132315 m!155285))

(assert (=> d!40259 m!155267))

(declare-fun m!155815 () Bool)

(assert (=> b!132309 m!155815))

(declare-fun m!155817 () Bool)

(assert (=> b!132313 m!155817))

(declare-fun m!155819 () Bool)

(assert (=> bm!14519 m!155819))

(declare-fun m!155821 () Bool)

(assert (=> b!132305 m!155821))

(assert (=> b!132305 m!155821))

(assert (=> b!132305 m!155329))

(declare-fun m!155823 () Bool)

(assert (=> b!132305 m!155823))

(assert (=> b!132305 m!155283))

(assert (=> b!132305 m!155283))

(declare-fun m!155825 () Bool)

(assert (=> b!132305 m!155825))

(assert (=> b!132305 m!155329))

(declare-fun m!155827 () Bool)

(assert (=> b!132320 m!155827))

(declare-fun m!155829 () Bool)

(assert (=> bm!14525 m!155829))

(assert (=> bm!14445 d!40259))

(declare-fun mapIsEmpty!4631 () Bool)

(declare-fun mapRes!4631 () Bool)

(assert (=> mapIsEmpty!4631 mapRes!4631))

(declare-fun condMapEmpty!4631 () Bool)

(declare-fun mapDefault!4631 () ValueCell!1091)

(assert (=> mapNonEmpty!4630 (= condMapEmpty!4631 (= mapRest!4630 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4631)))))

(declare-fun e!86254 () Bool)

(assert (=> mapNonEmpty!4630 (= tp!11182 (and e!86254 mapRes!4631))))

(declare-fun b!132324 () Bool)

(declare-fun e!86255 () Bool)

(assert (=> b!132324 (= e!86255 tp_is_empty!2869)))

(declare-fun b!132325 () Bool)

(assert (=> b!132325 (= e!86254 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4631 () Bool)

(declare-fun tp!11183 () Bool)

(assert (=> mapNonEmpty!4631 (= mapRes!4631 (and tp!11183 e!86255))))

(declare-fun mapValue!4631 () ValueCell!1091)

(declare-fun mapRest!4631 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapKey!4631 () (_ BitVec 32))

(assert (=> mapNonEmpty!4631 (= mapRest!4630 (store mapRest!4631 mapKey!4631 mapValue!4631))))

(assert (= (and mapNonEmpty!4630 condMapEmpty!4631) mapIsEmpty!4631))

(assert (= (and mapNonEmpty!4630 (not condMapEmpty!4631)) mapNonEmpty!4631))

(assert (= (and mapNonEmpty!4631 ((_ is ValueCellFull!1091) mapValue!4631)) b!132324))

(assert (= (and mapNonEmpty!4630 ((_ is ValueCellFull!1091) mapDefault!4631)) b!132325))

(declare-fun m!155831 () Bool)

(assert (=> mapNonEmpty!4631 m!155831))

(declare-fun mapIsEmpty!4632 () Bool)

(declare-fun mapRes!4632 () Bool)

(assert (=> mapIsEmpty!4632 mapRes!4632))

(declare-fun condMapEmpty!4632 () Bool)

(declare-fun mapDefault!4632 () ValueCell!1091)

(assert (=> mapNonEmpty!4629 (= condMapEmpty!4632 (= mapRest!4629 ((as const (Array (_ BitVec 32) ValueCell!1091)) mapDefault!4632)))))

(declare-fun e!86256 () Bool)

(assert (=> mapNonEmpty!4629 (= tp!11181 (and e!86256 mapRes!4632))))

(declare-fun b!132326 () Bool)

(declare-fun e!86257 () Bool)

(assert (=> b!132326 (= e!86257 tp_is_empty!2869)))

(declare-fun b!132327 () Bool)

(assert (=> b!132327 (= e!86256 tp_is_empty!2869)))

(declare-fun mapNonEmpty!4632 () Bool)

(declare-fun tp!11184 () Bool)

(assert (=> mapNonEmpty!4632 (= mapRes!4632 (and tp!11184 e!86257))))

(declare-fun mapValue!4632 () ValueCell!1091)

(declare-fun mapRest!4632 () (Array (_ BitVec 32) ValueCell!1091))

(declare-fun mapKey!4632 () (_ BitVec 32))

(assert (=> mapNonEmpty!4632 (= mapRest!4629 (store mapRest!4632 mapKey!4632 mapValue!4632))))

(assert (= (and mapNonEmpty!4629 condMapEmpty!4632) mapIsEmpty!4632))

(assert (= (and mapNonEmpty!4629 (not condMapEmpty!4632)) mapNonEmpty!4632))

(assert (= (and mapNonEmpty!4632 ((_ is ValueCellFull!1091) mapValue!4632)) b!132326))

(assert (= (and mapNonEmpty!4629 ((_ is ValueCellFull!1091) mapDefault!4632)) b!132327))

(declare-fun m!155833 () Bool)

(assert (=> mapNonEmpty!4632 m!155833))

(declare-fun b_lambda!5875 () Bool)

(assert (= b_lambda!5865 (or (and b!131609 b_free!2905 (= (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131600 b_free!2907) b_lambda!5875)))

(declare-fun b_lambda!5877 () Bool)

(assert (= b_lambda!5867 (or (and b!131609 b_free!2905) (and b!131600 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))))) b_lambda!5877)))

(declare-fun b_lambda!5879 () Bool)

(assert (= b_lambda!5873 (or (and b!131609 b_free!2905 (= (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131600 b_free!2907) b_lambda!5879)))

(declare-fun b_lambda!5881 () Bool)

(assert (= b_lambda!5869 (or (and b!131609 b_free!2905) (and b!131600 b_free!2907 (= (defaultEntry!2853 newMap!16) (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))))) b_lambda!5881)))

(declare-fun b_lambda!5883 () Bool)

(assert (= b_lambda!5871 (or (and b!131609 b_free!2905 (= (defaultEntry!2853 (v!3180 (underlying!448 thiss!992))) (defaultEntry!2853 newMap!16))) (and b!131600 b_free!2907) b_lambda!5883)))

(check-sat (not b!132203) (not b!132313) (not b!132114) (not bm!14519) (not b!132083) (not bm!14520) (not bm!14479) (not b!132303) (not d!40171) (not d!40237) (not b!132158) (not b!132160) tp_is_empty!2869 (not b_lambda!5859) (not d!40173) (not b!132084) (not d!40243) (not d!40229) (not b_lambda!5883) (not b!132273) (not b_next!2907) (not bm!14517) (not bm!14478) (not b!132008) (not b!132137) (not b!132259) (not b!132280) (not b_lambda!5877) (not b!132117) (not b!132302) (not d!40203) (not d!40159) (not b!132186) (not bm!14477) (not d!40245) (not d!40223) (not d!40175) (not d!40153) (not b!132238) (not d!40163) (not b!132118) (not d!40211) (not bm!14493) (not bm!14500) (not b!132281) (not b!132283) (not d!40207) (not b!132256) (not b!132319) (not d!40257) (not b!132111) (not b_next!2905) (not b_lambda!5881) (not b!132249) (not b!131994) b_and!8179 (not b!132200) (not b!132020) (not b!132300) (not b!132183) (not b!132163) (not d!40133) (not b!132028) (not b!132184) (not b!132321) (not b!132082) (not d!40227) (not b!132320) (not d!40217) (not bm!14495) (not b!132128) (not d!40239) (not d!40215) (not d!40201) (not d!40233) (not b!132294) (not b!132123) (not d!40157) (not b!132146) (not d!40259) (not d!40189) (not b!131999) (not b!132147) (not bm!14510) (not b!132144) (not b!132309) (not d!40191) (not bm!14506) (not b!132138) (not d!40225) (not b!132109) (not b!132250) (not b_lambda!5875) (not b!132167) (not b!132143) (not b!132301) (not d!40183) (not b!132063) (not b!132019) (not b!132243) (not d!40219) (not bm!14514) (not b!132142) (not b!132182) (not b_lambda!5863) (not b!132073) (not b!132241) (not b_lambda!5879) (not b!132140) (not b!132164) (not d!40149) (not d!40193) (not b!132012) (not b!132275) (not bm!14518) (not d!40179) (not b!132074) (not mapNonEmpty!4632) (not b!132004) (not d!40221) (not d!40155) (not b!132305) (not b!132315) (not b!132257) (not bm!14483) (not b!132122) (not b!132267) (not d!40205) (not b!132240) (not b!132113) (not d!40187) (not b!132248) (not bm!14501) (not b!132001) (not b!132120) (not d!40167) (not bm!14521) (not d!40181) (not d!40169) (not b!132145) (not d!40235) (not b!132121) (not d!40165) (not b!132177) (not b!132078) (not b!132299) (not b!132018) (not b!132278) (not b!132207) (not d!40177) (not bm!14508) (not bm!14492) (not bm!14499) (not b!132076) (not mapNonEmpty!4631) (not b!132209) (not b!132193) (not b!132014) (not b!132245) (not bm!14509) (not d!40141) (not b!132002) (not b!132071) (not b!132136) (not b!132178) (not b!132129) (not d!40253) (not d!40247) (not b!132194) (not bm!14496) (not d!40185) (not bm!14507) (not b!132263) (not bm!14525) (not d!40143) (not b!132242) (not b!132298) (not d!40231) (not b!132188) (not b!132112) (not b!132206) (not d!40161) (not b!132246) (not b!132274) b_and!8177 (not b!132269))
(check-sat b_and!8177 b_and!8179 (not b_next!2905) (not b_next!2907))
